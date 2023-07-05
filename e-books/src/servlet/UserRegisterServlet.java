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

@WebServlet(name = "UserRegisterServlet", value = "/register")
public class UserRegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Content-type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = new User();
        try{
            JSONObject jsonObject = new JSONObject();
            boolean exist = UserDao.isUsernameExist(username);
            if (!exist){
                user.setUsername(username);
                user.setUserPassword(password);
                UserDao.addUser(user);
                jsonObject.put("exist", exist);
                response.setContentType("application/json;charset=utf-8");
                PrintWriter out = response.getWriter();
                out.write(jsonObject.toString());
                out.flush();
                out.close();
                request.getSession().setAttribute("user",user);
            }else{
                response.setContentType("application/json;charset=utf-8");
                jsonObject.put("exist", exist);
                PrintWriter out = response.getWriter();
                out.write(jsonObject.toString());
                out.flush();
                out.close();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
