package com.onlineTest.service;

import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Problem;

public interface ProblemService {

    Page<Problem> page(Integer pageNo,Integer pageSize);

    void saveProblem(Problem problem);

    Problem getProblemById(Integer problemId);
}
