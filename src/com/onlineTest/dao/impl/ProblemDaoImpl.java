package com.onlineTest.dao.impl;

import com.onlineTest.dao.ProblemDao;
import com.onlineTest.pojo.Problem;

import java.util.List;

public class ProblemDaoImpl extends BaseDao implements ProblemDao {
    @Override
    public Integer queryForPageTotalCount() {
        String sql = "select count(*) from problems";
        Number count = (Number) queryForSingleValue(sql);
        return count.intValue();
    }

    @Override
    public List<Problem> queryForPageItems(Integer begin, Integer pageSize) {
        String sql = "select * from problems limit ?, ?";
        return queryForList(Problem.class,sql,begin,pageSize);
    }

    @Override
    public Integer saveProblem(Problem problem) {
        String sql = "insert into problems(`describe`,`answer`,`subjectId`,`analysis`,`options`,`correct`,`wrong`,`type`) values(?, ?, ?, ?, ?, ?, ?, ?)";
        return update(sql,problem.getDescribe(),problem.getAnswer(),problem.getSubjectId(),problem.getAnalysis(),problem.getOptions(),problem.getCorrect(),problem.getWrong(),problem.getType());
    }

    @Override
    public Problem queryById(Integer problemId) {
        String sql = "select * from problems where id = ?";
        return queryForOne(Problem.class,sql,problemId);
    }
}
