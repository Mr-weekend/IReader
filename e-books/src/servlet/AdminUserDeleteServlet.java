package servlet;

import dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminUserDeleteServlet", value = "/AdminUserDeleteServlet")
public class AdminUserDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            UserDao.deleteUser(id);
        }catch (SQLException e){
            e.printStackTrace();
        }
        request.getRequestDispatcher("/adminUser").forward(request,response);
    }
}
