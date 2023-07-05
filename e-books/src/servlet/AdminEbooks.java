package servlet;

import dao.EbookDao;
import model.Ebook;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminEbooks", value = "/adminEbooks")
public class AdminEbooks extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;utf-8");
        try{
            //得到电子书总数
            int sum = EbookDao.sumOfEbooks();
            //获得电子书列表
            List<Ebook> ebook = EbookDao.getEbookList();
            request.setAttribute("sum",sum);
            request.setAttribute("ebook",ebook);
        }catch (SQLException e){
            e.printStackTrace();
        }
        request.getSession().getAttribute("administrator");
        request.getRequestDispatcher("/admin/ebooksList.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
