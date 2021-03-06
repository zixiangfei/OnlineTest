package com.onlineTest.dao;

import com.onlineTest.pojo.Test;

import java.util.List;

public interface TestDao {
    List<Test> queryByClassId(Integer classId);

    void save(Test test);

    Test queryById(Integer testId);
}
