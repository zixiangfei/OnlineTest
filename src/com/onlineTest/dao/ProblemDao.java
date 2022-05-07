package com.onlineTest.dao;

import com.onlineTest.pojo.Problem;

import java.util.List;

public interface ProblemDao {

    Integer queryForPageTotalCount();

    List<Problem> queryForPageItems(Integer begin,Integer pageSize);

    Integer saveProblem(Problem problem);

    Problem queryById(Integer problemId);
}
