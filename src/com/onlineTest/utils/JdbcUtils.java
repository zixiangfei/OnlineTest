package com.onlineTest.utils;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcUtils {
    static final Log log = LogFactory.getLog(JdbcUtils.class);

    private static DruidDataSource dataSource;
    private static final ThreadLocal<Connection> conns = new ThreadLocal<>();

    static {
        try {
            Properties properties = new Properties();
            //读取jdbc.properties属性配置文件
            InputStream inputStream = com.onlineTest.utils.JdbcUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
            //从流中加载数据
            properties.load(inputStream);
            //数据库运行池
            dataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);
        } catch (Exception e) {
            log.error(e.getMessage());
        }
    }

    /**
     * 获取数据库连接池中的链接
     * 如果返回null获取链接失败
     */
    public static Connection getConnection() {
        Connection conn = conns.get();
        if(conn == null) {
            try {
                conn = dataSource.getConnection();
                conns.set(conn);
                conn.setAutoCommit(false);
            } catch (SQLException e) {
                log.error(e.getMessage());
            }
        }
        return conn;
    }


    public static void commitAndClose() {
        Connection connection = conns.get();
        if(connection!=null) {
            try {
                connection.commit();
            } catch (SQLException e) {
                log.error(e.getMessage());
            } finally {
                try {
                    connection.close();
                } catch (SQLException e) {
                    log.error(e.getMessage());
                }
            }
        }
        conns.remove();
    }

    public static void rollbackAndClose() {
        Connection connection = conns.get();
        if(connection!=null) {
            try {
                connection.rollback();
            } catch (SQLException e) {
                log.error(e.getMessage());
            } finally {
                try {
                    connection.close();
                } catch (SQLException e) {
                    log.error(e.getMessage());
                }
            }
        }
        conns.remove();
    }
}
