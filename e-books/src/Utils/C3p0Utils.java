package Utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;

public class C3p0Utils {
    private static DataSource ds;
    static {
        //使用c3p0-config.xml配置文件中的named-config节点中的name属性
        ds = new ComboPooledDataSource("mysql");
    }
    //对连接进行封装
    public static DataSource getDataSource(){
        return ds;
    }
}
