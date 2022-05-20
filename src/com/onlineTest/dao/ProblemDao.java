package com.onlineTest.dao;

import com.onlineTest.pojo.Problem;

import java.util.List;

public interface ProblemDao {

    Integer queryForPageTotalCount();

    List<Problem> queryForPageItems(Integer begin,Integer pageSize);

    Integer saveProblem(Problem problem);

    Problem queryById(Integer problemId);

    Integer queryForPageTotalCountByParameter(Integer subjectId, String describe, String type);

    List<Problem> queryForPageItemsByParameter(Integer begin, Integer pageSize, Integer subjectId, String describe, String type);

    void updateProblemById(Problem problem);

    List<Problem> getAllProblems();
}
