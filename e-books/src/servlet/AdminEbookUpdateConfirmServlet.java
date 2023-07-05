package servlet;

import dao.EbookDao;
import model.Ebook;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "AdminEbookUpdateConfirmServlet", value = "/AdminEbookUpdateConfirmServlet")
public class AdminEbookUpdateConfirmServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Content-type","text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;utf-8");
        Ebook ebook = new Ebook();
        //判断前端的form是否有multipart属性
        Boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
        try{
            if (isMultipartContent){
                FileItemFactory fileItemFactory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
                upload.setHeaderEncoding("utf-8");
                //通过parseRequest解析form中的所有请求字段，并保存到items集合中
                List<FileItem> items = upload.parseRequest(request);
                //用迭代器遍历items中的数据
                Iterator<FileItem> iterator = items.iterator();
                while(iterator.hasNext()){
                    FileItem item = iterator.next();
                    //判断是否为表单字段
                    if (item.isFormField()){
                        switch (item.getFieldName()){//根据name属性判断item是form中的哪个元素
                            case "bookId":
                                ebook.setId(Integer.parseInt(item.getString("utf-8")));
                                break;
                            case "updateBookName":
                                ebook.setBookname(item.getString("utf-8"));
                                break;
                            case "updateAuthor":
                                ebook.setAuthor(item.getString("utf-8"));
                                break;
                            case "updatePress":
                                ebook.setPress(item.getString("utf-8"));
                                break;
                            case "updateISBN":
                                ebook.setIsbn(item.getString("utf-8"));
                                break;
                            case "updateIntroduction":
                                ebook.setIntroduction(item.getString("utf-8"));
                                break;
                        }
                    }else{
                        //文件上传
                        //获取文件名
                        switch (item.getFieldName()){
                            //如果是图片文件，就上传到picture文件夹
                            case "updateImage" :{
                                if(item.getInputStream().available()<=0)continue;
                                String fileName = "/" + item.getName();
                                System.out.println("图片文件名：" + fileName);
                                String path = this.getServletContext().getRealPath("/picture")+fileName;
                                System.out.println(path);
                                InputStream in = item.getInputStream();
                                FileOutputStream out = new FileOutputStream(path);
                                byte[] buffer = new byte[1024];
                                int len=0;
                                while( (len=in.read(buffer))>0 ) {
                                    out.write(buffer);
                                }
                                in.close();
                                out.close();
                                item.delete();
                                ebook.setImage("/picture" + fileName);
                                break;
                            }
                            //如果是电子书源文件，就上传到file文件夹
                            case "updateFile":{
                                if(item.getInputStream().available()<=0)continue;
                                String fileName = "/" + item.getName();
                                System.out.println("file文件名：" + fileName);
                                String path = this.getServletContext().getRealPath("/file")+fileName;
                                System.out.println(path);
                                InputStream in = item.getInputStream();
                                FileOutputStream out = new FileOutputStream(path);
                                byte[] buffer = new byte[1024];
                                int len=0;
                                while( (len=in.read(buffer))>0 ) {
                                    out.write(buffer);
                                }
                                in.close();
                                out.close();
                                item.delete();
                                ebook.setFile("/file" + fileName);
                                break;
                            }
                        }
                    }
                }
                //执行sql更新电子书信息
                EbookDao.updateEbook(ebook);
                request.getRequestDispatcher("/adminEbooks").forward(request,response);
            }
        }catch (FileUploadException e){
            e.printStackTrace();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doPost(request,response);
    }
}
