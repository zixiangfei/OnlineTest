package com.onlineTest.service;

import com.onlineTest.pojo.Test;

import java.util.List;

public interface TestService {
    List<Test> getTestListByClassId(Integer classId);

    void addNewContest(Test test);

    Test getTestById(Integer testId);
}
