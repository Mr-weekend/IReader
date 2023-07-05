package servlet;

import dao.UserDao;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminUserServlet", value = "/adminUser")
public class AdminUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;utf-8");
        try{
            //得到用户数
            int sum = UserDao.sumOfUser();
            //获得用户列表
            List<User> user = UserDao.getUserList();
            request.setAttribute("sum",sum);
            request.setAttribute("user",user);

        }catch (SQLException e){
            e.printStackTrace();
        }
        request.getRequestDispatcher("/admin/userList.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
