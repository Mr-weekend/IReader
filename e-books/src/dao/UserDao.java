package dao;

import Utils.C3p0Utils;
import model.Ebook;
import model.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private static final QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
    public static User userLogin(String username, String password)throws SQLException {
        String sql = "select * from userinfo where username=? and userpassword=?";
        User user = runner.query(sql,new BeanHandler<>(User.class),username,password);
        return user;
    }
    public static boolean isUsernameExist(String username)throws SQLException{
        String sql = "select * from userinfo where username = ?";
        User user = runner.query(sql,new BeanHandler<>(User.class),username);
        if(user == null){
            return false;
        }else{
            return true;
        }
    }
    public static void addUser(User user)throws SQLException{
        String sql = "insert into userinfo(username,userpassword) values(?,?)";
        runner.update(sql,user.getUsername(),user.getUserPassword());
    }
    public static int sumOfUser()throws SQLException {
        String sql = "select count(*) from userinfo";
        return runner.query(sql,new ScalarHandler<Long>()).intValue();
    }
    public static List<User> getUserList()throws SQLException{
        String sql = "select * from userinfo";
        List<User> user = runner.query(sql,new BeanListHandler<>(User.class));
        return user;
    }
    public static User selectUserById(int id)throws SQLException{
        String sql = "select * from userinfo where id = ?";
        User user = runner.query(sql,new BeanHandler<>(User.class),id);
        return user;
    }
    public static void changeUserPassword(int id,String password)throws SQLException{
        String sql = "update userinfo set userpassword = ? where id = ?";
        runner.update(sql,password,id);
    }
    public static void deleteUser(int id)throws SQLException{
        String sql = "delete from userinfo where id = ?";
        runner.update(sql,id);
    }
    public static List<User> searchByUsername(String username) throws SQLException{
        List<User> user = new ArrayList<User>();
        String sql = "select * from userinfo where username like ?";
        user = runner.query(sql,new BeanListHandler<>(User.class),"%" + username + "%");
        return user;
    }
}
