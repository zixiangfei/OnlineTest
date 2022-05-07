package com.onlineTest.dao.impl;

import com.onlineTest.dao.TestDao;
import com.onlineTest.pojo.Test;

import java.util.List;

public class TestDaoImpl extends BaseDao implements TestDao {
    @Override
    public List<Test> queryByClassId(Integer classId) {
        String sql = "select * from test where classId = ?";
        return queryForList(Test.class,sql,classId);
    }

    @Override
    public void save(Test test) {
        String sql = "insert into test(`name`,`time`,`startTime`,`problems`,`classId`) values(? ,? ,? ,? ,?)";
        update(sql,test.getName(),test.getTime(),test.getStartTime(),test.getProblems(),test.getClassId());
    }

    @Override
    public Test queryById(Integer testId) {
        String sql = "select * from test where id = ?";
        return queryForOne(Test.class,sql,testId);
    }
}
