package com.onlineTest.dao.impl;

import com.onlineTest.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public abstract class BaseDao {
    //使用DBUtils操作数据库
    protected final Log log = LogFactory.getLog(getClass());
    private final QueryRunner queryRunner = new QueryRunner();

    /**
     * update方法用来执行,insert update delete语句
     * 如果返回-1就执行失败 返回其他表示影响的行数
     * @return int
     */
    public int update(String sql,Object ... args){
        Connection conn = JdbcUtils.getConnection();
        try {
            return queryRunner.update(conn,sql,args);
        } catch (SQLException e) {
            log.error(e.getMessage());
            throw new RuntimeException(e);
        }
    }

    /**
     * 查询返回一个javaBean的sql语句
     * @param type 返回的对象类型
     * @param sql 执行的sql语句
     * @param args sql对应的参数值
     * @param <T> 返回的类型的范性
     * @return T
     */
    public <T>T queryForOne(Class<T> type,String sql,Object ... args) {
        Connection conn = JdbcUtils.getConnection();
        try {
            return queryRunner.query(conn,sql,new BeanHandler<T>(type),args);
        } catch (SQLException e) {
            log.error(e.getMessage());
            throw new RuntimeException(e);
        }
    }

    /**
     * 查询返回多个javaBean的sql语句
     * @param type 返回的对象类型
     * @param sql 执行的sql语句
     * @param args sql对应的参数值
     * @param <T> 返回的类型的范性
     * @return List
     */
    public <T> List<T> queryForList(Class<T> type, String sql, Object ... args) {
        Connection conn = JdbcUtils.getConnection();
        try {
            return queryRunner.query(conn,sql,new BeanListHandler<T>(type),args);
        } catch (SQLException e) {
            log.error(e.getMessage());
            throw new RuntimeException(e);
        }
    }

    /**
     * 执行返回一行一列的sql语句
     * @param sql 执行的sql语句
     * @param args sql语句对应的参数
     * @return Object
     */
    public Object queryForSingleValue(String sql,Object ... args) {
        Connection conn = JdbcUtils.getConnection();
        try {
            return queryRunner.query(conn, sql, new ScalarHandler(),args);
        } catch (Exception e) {
            log.error(e.getMessage());
            throw new RuntimeException(e);
        }
    }
}
