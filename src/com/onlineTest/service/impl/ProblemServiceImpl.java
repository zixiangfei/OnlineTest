package com.onlineTest.service.impl;

import com.onlineTest.dao.ProblemDao;
import com.onlineTest.dao.impl.ProblemDaoImpl;
import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Problem;
import com.onlineTest.service.ProblemService;

import java.util.List;

public class ProblemServiceImpl implements ProblemService {

    ProblemDao problemDao = new ProblemDaoImpl();

    @Override
    public Page<Problem> page(Integer pageNo, Integer pageSize) {
        Page<Problem> page = new Page<Problem>();

        Integer pageTotalCount = problemDao.queryForPageTotalCount();
        page.setPageTotalCount(pageTotalCount);
        Integer pageTotal = pageTotalCount / pageSize + (pageTotalCount % pageSize == 0 ? 0 : 1);
        page.setPageTotal(pageTotal);
        page.setPageNo(pageNo);
        page.setPageSize(pageSize);

        Integer begin = (page.getPageNo() - 1) * page.getPageSize();

        List<Problem> problems = problemDao.queryForPageItems(begin,pageSize);

        page.setItems(problems);
        return page;
    }

    @Override
    public void saveProblem(Problem problem) {
        problemDao.saveProblem(problem);
    }

    @Override
    public Problem getProblemById(Integer problemId) {
        return problemDao.queryById(problemId);
    }

    @Override
    public Page<Problem> pageByParameter(Integer pageNo, Integer pageSize, Integer subjectId, String describe, String type) {
        Page<Problem> page = new Page<Problem>();

        Integer pageTotalCount = problemDao.queryForPageTotalCountByParameter(subjectId,describe,type);
        page.setPageTotalCount(pageTotalCount);
        Integer pageTotal = pageTotalCount / pageSize + (pageTotalCount % pageSize == 0 ? 0 : 1);
        page.setPageTotal(pageTotal);
        page.setPageNo(pageNo);
        page.setPageSize(pageSize);

        Integer begin = (page.getPageNo() - 1) * page.getPageSize();

        List<Problem> problems = problemDao.queryForPageItemsByParameter(begin,pageSize,subjectId,describe,type);

        page.setItems(problems);
        return page;
    }

    @Override
    public void updateProblemById(Problem problem) {
        problemDao.updateProblemById(problem);
    }
}
