package servlet;

import dao.EbookDao;
import model.Ebook;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminDeleteEbookServlet", value = "/AdminDeleteEbookServlet")
public class AdminDeleteEbookServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            EbookDao.deleteEbook(id);
        }catch (SQLException e){
            e.printStackTrace();
        }
        request.getRequestDispatcher("/adminEbooks").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
