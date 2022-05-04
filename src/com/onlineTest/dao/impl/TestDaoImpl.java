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
}
