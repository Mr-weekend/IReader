package servlet;

import dao.EbookDao;
import model.Ebook;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "EbookDetailServlet", value = "/ebookDetail")
public class EbookDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            Ebook ebook = EbookDao.selectEbookById(id);
            request.setAttribute("ebook",ebook);
        }catch (SQLException e){
            e.printStackTrace();
        }
        request.getRequestDispatcher("/ebookDetail.jsp").forward(request,response);
    }

}
