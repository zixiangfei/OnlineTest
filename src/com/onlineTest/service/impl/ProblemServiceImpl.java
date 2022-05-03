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
}