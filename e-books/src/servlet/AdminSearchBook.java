package servlet;

import dao.EbookDao;
import model.Ebook;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminSearchBook", value = "/adminSearchBook")
public class AdminSearchBook extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Content-type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;utf-8");
        //获取前端输入的关键字
        String keyword = request.getParameter("keyword");
        request.setAttribute("keyword",keyword);
        List<Ebook> ebooks = new ArrayList<Ebook>();
        try{
            ebooks = EbookDao.searchByName(keyword);
            int sum = EbookDao.sumOfEbooks();
            request.setAttribute("sum",sum);
        }catch (SQLException e){
            e.printStackTrace();
        }
        request.setAttribute("searchResult",ebooks);
        request.getRequestDispatcher("/admin/searchBook.jsp").forward(request,response);
    }
}
