package servlet;

import dao.EbookDao;
import dao.UserDao;
import model.Ebook;
import model.User;
import net.sf.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "AdminUserUpdateServlet", value = "/AdminUserUpdateServlet")
public class AdminUserUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        JSONObject jsonObject = new JSONObject();
        User user = new User();
        try{
            user = UserDao.selectUserById(id);
        }catch (SQLException e){
            e.printStackTrace();
        }
        //查询结果封装成JSON格式返回给客户端
        jsonObject.put("updateUser", user);
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(jsonObject.toString());
        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
