package servlet;

import dao.UserDao;
import model.User;
import net.sf.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "UserLoginServlet", value = "/login")
public class UserLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Content-type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            JSONObject jsonObject = new JSONObject();
            User user = UserDao.userLogin(username,password);
            //用户名存在返回true，不存在返回false
            boolean exist = UserDao.isUsernameExist(username);
            if (user == null){
                boolean success = false;
                // 将验证结果封装成JSON格式返回给客户端
                jsonObject.put("success", success);
                jsonObject.put("exist", exist);
                response.setContentType("application/json;charset=utf-8");
                PrintWriter out = response.getWriter();
                out.write(jsonObject.toString());
                out.flush();
                out.close();
            }else{
                boolean success = true;
                // 将验证结果封装成JSON格式返回给客户端
                jsonObject.put("success", success);
                jsonObject.put("exist", exist);
                response.setContentType("application/json;charset=utf-8");
                PrintWriter out = response.getWriter();
                out.write(jsonObject.toString());
                out.flush();
                out.close();
                request.getSession().setAttribute("user",user);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
