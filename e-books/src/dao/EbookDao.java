package dao;

import Utils.C3p0Utils;
import model.Ebook;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EbookDao {
    private static final QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
    //获取电子书列表
    public  static List<Ebook> getEbookList()throws SQLException{
        String sql = "select * from ebooksinfo";
        List<Ebook> ebook = runner.query(sql,new BeanListHandler<>(Ebook.class));
        return ebook;
    }
    //获取电子书总数
    public static int sumOfEbooks()throws SQLException {
        String sql = "select count(*) from ebooksinfo";
        return runner.query(sql,new ScalarHandler<Long>()).intValue();
    }
    //通过id获取电子书信息
    public static Ebook selectEbookById(int id)throws SQLException{
        String sql = "select * from ebooksinfo where id = ?";
        Ebook ebook = runner.query(sql,new BeanHandler<>(Ebook.class),id);
        return ebook;
    }
    //通过电子书名查询电子书并返回查询到的电子书列表
    public static List<Ebook> searchByName(String name) throws SQLException{
        List<Ebook> ebook = new ArrayList<Ebook>();
        String sql = "select * from ebooksinfo where bookname like ?";
        ebook = runner.query(sql,new BeanListHandler<>(Ebook.class),"%" + name + "%");
        return ebook;
    }
    public static void updateEbook(Ebook ebook)throws SQLException{
        String sql = "update ebooksinfo set bookname = ?,author = ?, press = ?, isbn = ?, introduction = ?, image = ?, file = ? where id = ?";
        runner.update(sql,ebook.getBookname(),ebook.getAuthor(),ebook.getPress(),ebook.getIsbn(),ebook.getIntroduction(),ebook.getImage(),ebook.getFile(),ebook.getId());
    }
    public static void addEbook(Ebook ebook)throws SQLException{
        String sql = "insert into ebooksinfo(bookname,author,isbn,press,introduction,image,file,download) values(?,?,?,?,?,?,?,?)";
        runner.update(sql,ebook.getBookname(),ebook.getAuthor(),ebook.getIsbn(),ebook.getPress(),ebook.getIntroduction(),ebook.getImage(),ebook.getFile(),0);
    }
    public static void deleteEbook(int id) throws SQLException{
        String sql = "delete from ebooksinfo where id = ?";
        runner.update(sql,id);
    }
    public static void count(int count,int id)throws SQLException{
        String sql = "update ebooksinfo set download = ? where id = ?";
        runner.update(sql,count,id);
    }
}
