package com.rg.utils;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Logger;

/**
 * @Describe：数据库工具类，使用druid连接池
 * @Author:ZelongChen
 * @Date:2021/11/10 15:55
 */

public class JdbcUtils {

    private static String name = JdbcUtils.class.getName();
    private static Logger log = Logger.getLogger(name);

    /**
     * 数据库连接池
     */
    private static DruidDataSource dataSource;

    /**
     * 保证每个线程都有自己的连接
     */
    private static final ThreadLocal<Connection> CONNS = new ThreadLocal<Connection>();

    /**
     * 创建数据库连接池静态代码块
     */
    static {
        try {
            //创建properties对象
            Properties properties = new Properties();
            //获取jdbc配置文件数据流
            InputStream inputSteam = JdbcUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
            //导入jdbc配置文件
            properties.load(inputSteam);
            //创建数据库连接池
            dataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);
            log.info("creat dataSource Done");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取数据库连接池中连接
     * @return 如果不为null，则获取数据库连接成功.<br/>
     *         如果为null,则获取数据库连接失败.<br/>
     */
    public static Connection getConnection(){

        //0.从线程中取得连接
        Connection conn = CONNS.get();

        if(conn == null){

            try {

                //1.通过连接池获取连接
                conn = dataSource.getConnection();
                //2.把连接存放到线程本地变量ThreadLocal中
                CONNS.set(conn);
                //3.设定手动管理事务
                conn.setAutoCommit(false);

            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        log.info("already get connection");
        return conn;
    }

    /**
     * 提交事务并关闭连接
     */
    public static void commitAndClose(){

        //0.从线程中取得连接
        Connection conn = CONNS.get();

        if(conn != null){

            try {
                //1.提交事务
                conn.commit();
                log.info("commit");

            } catch (SQLException e) {
                e.printStackTrace();
            }finally{

                try {
                    //2.关闭连接
                    conn.close();
                    log.info("colse connection");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

        }

        //一定要执行remove方法，否则报错。（Tomcat底层使用了线程池技术。）
        CONNS.remove();
    }

    /**
     * 回滚事务并关闭连接
     */
    public static void rollbackAndClose(){

        //0.从线程中取得连接
        Connection conn = CONNS.get();

        if(conn != null){

            try {
                //1.回滚事务
                conn.rollback();
                log.info("rollback");

            } catch (SQLException e) {
                e.printStackTrace();
            }finally{

                try {
                    //2.关闭连接
                    conn.close();
                    log.info("close connection");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

        }

        //一定要执行remove方法，否则报错。（Tomcat底层使用了线程池技术。）
        CONNS.remove();
    }
}
