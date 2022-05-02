package com.onlineTest.service.impl;

import com.onlineTest.dao.SubjectDao;
import com.onlineTest.dao.impl.SubjectDaoImpl;
import com.onlineTest.pojo.Class;
import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Subject;
import com.onlineTest.service.SubjectService;

import java.util.List;

public class SubjectServiceImpl implements SubjectService {

    SubjectDao subjectDao = new SubjectDaoImpl();

    @Override
    public Page<Subject> page(Integer pageNo, Integer pageSize) {
        Page<Subject> page = new Page<Subject>();

        Integer pageTotalCount = subjectDao.queryForPageTotalCount();
        Integer pageTotal = pageTotalCount / pageSize + (pageTotalCount % pageSize == 0 ? 0 : 1);
        page.setPageTotal(pageTotal);
        page.setPageTotalCount(pageTotalCount);
        page.setPageNo(pageNo);
        page.setPageSize(pageSize);

        Integer begin = (page.getPageNo() - 1) * pageSize;

        List<Subject> subjects = subjectDao.queryForPageItems(begin, pageSize);

        page.setItems(subjects);

        return page;
    }

    @Override
    public Boolean existsSubjectName(String name) {
        Subject subject = subjectDao.queryByName(name);
        if(subject==null) {
            return false;
        }
        else {
            return true;
        }
    }

    @Override
    public void addSubject(Subject subject) {
        subjectDao.saveSubject(subject);
    }
}
