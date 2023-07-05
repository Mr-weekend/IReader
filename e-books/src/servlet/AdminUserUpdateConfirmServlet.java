package servlet;

import dao.UserDao;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminUserUpdateConfirmServlet", value = "/AdminUserUpdateConfirmServlet")
public class AdminUserUpdateConfirmServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("userId"));
        System.out.println("updateConfirm");
        System.out.println("id" + id);
        String password = request.getParameter("updateUserPassword");
        System.out.println(password);
        try{
            UserDao.changeUserPassword(id,password);
        }catch (SQLException e){
            e.printStackTrace();
        }
        request.getRequestDispatcher("/adminUser").forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
