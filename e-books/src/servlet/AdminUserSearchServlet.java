package servlet;

import dao.UserDao;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminUserSearchServlet", value = "/adminUserSearch")
public class AdminUserSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Content-type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;utf-8");
        //获取前端输入的关键字
        String keyword = request.getParameter("keyword");
        request.setAttribute("keyword",keyword);
        List<User> user = new ArrayList<User>();
        try{
            user = UserDao.searchByUsername(keyword);
            int sum = UserDao.sumOfUser();
            request.setAttribute("sum",sum);
        }catch (SQLException e){
            e.printStackTrace();
        }
        request.setAttribute("searchResult",user);
        request.getRequestDispatcher("/admin/searchUser.jsp").forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
