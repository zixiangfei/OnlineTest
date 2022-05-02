package com.onlineTest.dao.impl;

import com.onlineTest.dao.SubjectDao;
import com.onlineTest.pojo.Class;
import com.onlineTest.pojo.Subject;

import java.util.List;

public class SubjectDaoImpl extends BaseDao implements SubjectDao {
    @Override
    public Integer queryForPageTotalCount() {
        String sql = "select count(*) from subject";
        Number count =(Number) queryForSingleValue(sql);
        return count.intValue();
    }

    @Override
    public List<Subject> queryForPageItems(Integer begin, Integer pageSize) {
        String sql = "select * from subject limit ?, ?";
        List<Subject> subjects = queryForList(Subject.class,sql,begin,pageSize);
        return subjects;
    }

    @Override
    public Integer saveSubject(Subject subject) {
        String sql = "insert into subject(`name`) values(?)";
        return update(sql,subject.getName());
    }

    @Override
    public Subject queryByName(String name) {
        String sql = "select * from subject where name = ?";
        return queryForOne(Subject.class,sql,name);
    }
}

