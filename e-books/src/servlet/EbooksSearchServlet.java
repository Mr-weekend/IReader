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

@WebServlet(name = "EbooksSearchServlet", value = "/ebooksSearch")
public class EbooksSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Content-type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;utf-8");
        //获取前端输入的关键字
        String keyword = request.getParameter("keyword");
        List<Ebook> ebooks = new ArrayList<Ebook>();
        try{
            request.setAttribute("keyword",keyword);
            int sum = EbookDao.sumOfEbooks();
            ebooks = EbookDao.searchByName(keyword);
            request.setAttribute("sum",sum);
            request.setAttribute("searchResult",ebooks);
        }catch (SQLException e){
            e.printStackTrace();
        }
        request.getRequestDispatcher("/ebooksSearch.jsp").forward(request,response);
    }
}
