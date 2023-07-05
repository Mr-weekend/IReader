package servlet;

import dao.EbookDao;
import model.Ebook;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.sql.SQLException;

@WebServlet(name = "EbookDownloadServlet", value = "/download")
public class EbookDownloadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        int id = Integer.parseInt(request.getParameter("id"));
        int count = Integer.parseInt(request.getParameter("count"));
        count = count + 1;
        try {
            Ebook ebook = EbookDao.selectEbookById(id);
            EbookDao.count(count,ebook.getId());
        }catch (SQLException e){
            e.printStackTrace();
        }
        String path = request.getParameter("src");
        String fileName = this.getServletContext().getRealPath(path);
        fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
        response.addHeader("content-Type","application/octet-stream");
        response.addHeader("content-Disposition","attachment;filename=" + URLEncoder.encode(fileName,"utf-8"));
        InputStream in = getServletContext().getResourceAsStream(path);
        int len=0;
        byte[] buffer = new byte[1024];
        ServletOutputStream out = response.getOutputStream();
        while ((len=in.read(buffer))!= -1){
            out.write(buffer,0,len);
        }
        in.close();
        out.close();
        }
}
