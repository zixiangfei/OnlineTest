package com.onlineTest.service.impl;

import com.onlineTest.dao.TestDao;
import com.onlineTest.dao.impl.TestDaoImpl;
import com.onlineTest.pojo.Test;
import com.onlineTest.service.TestService;

import java.util.List;

public class TestServiceImpl implements TestService {

    TestDao testDao = new TestDaoImpl();

    @Override
    public void addNewContest(Test test) {
        testDao.save(test);
    }

    @Override
    public List<Test> getTestListByClassId(Integer classId) {
        return testDao.queryByClassId(classId);
    }

    @Override
    public Test getTestById(Integer testId) {
        return testDao.queryById(testId);
    }
}
