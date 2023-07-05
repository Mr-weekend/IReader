package servlet;

import dao.EbookDao;
import model.Ebook;
import net.sf.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "AdminEbookUpdateServlet", value = "/AdminEbookUpdateServlet")
public class AdminEbookUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取前端ajax data里面的值
        int id = Integer.parseInt(request.getParameter("id"));
        JSONObject jsonObject = new JSONObject();
        Ebook ebook = new Ebook();
        try{
            ebook = EbookDao.selectEbookById(id);
        }catch (SQLException e){
            e.printStackTrace();
        }
        //查询结果封装成JSON格式返回给客户端
        jsonObject.put("updateEbook", ebook);
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(jsonObject.toString());
        out.flush();
        out.close();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
