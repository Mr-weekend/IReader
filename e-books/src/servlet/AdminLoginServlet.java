package servlet;

import dao.AdminDao;
import dao.EbookDao;
import model.Administrator;
import model.Ebook;
import net.sf.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminLoginServlet", value = "/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Content-type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean status = false;
        try{
            Administrator administrator = AdminDao.getAdmin(username,password);
            if (administrator != null){
                status = true;
                //得到电子书总数
                int sum = EbookDao.sumOfEbooks();
                //获得电子书列表
                List<Ebook> ebook = EbookDao.getEbookList();
                request.getSession().setAttribute("administrator",administrator);
            }
            //将结果封装成JSON格式返回给客户端
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("status",status);
            response.setContentType("application/json;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.write(jsonObject.toString());
            out.flush();
            out.close();
        }catch (SQLException e){
            e.printStackTrace();
        }

    }
}
