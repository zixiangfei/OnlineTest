package com.onlineTest.service;

import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Problem;

import java.util.List;

public interface ProblemService {

    Page<Problem> page(Integer pageNo,Integer pageSize);

    void saveProblem(Problem problem);

    Problem getProblemById(Integer problemId);

    Page<Problem> pageByParameter(Integer pageNo, Integer pageSize, Integer subjectId, String describe, String type);

    void updateProblemById(Problem problem);

    List<Problem> getAllProblems();
}
