package dao;

import Utils.C3p0Utils;
import model.Administrator;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class AdminDao {
    private static final QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
    //查询管理员用户名
    public static String getAdminName(int id)throws SQLException {
        String sql = "select * from admininfo where id = ?";
        Administrator administrator = runner.query(sql,new BeanHandler<>(Administrator.class),id);
        return administrator.getAdname();
    }
    public static Administrator getAdmin(String username, String password)throws SQLException{
        String sql = "select * from admininfo where adname = ? and adpassword = ?";
        Administrator administrator = new Administrator();
        administrator = runner.query(sql,new BeanHandler<>(Administrator.class),username,password);
        return administrator;
    }
}
