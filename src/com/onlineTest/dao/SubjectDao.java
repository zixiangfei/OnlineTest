package com.onlineTest.dao;

import com.onlineTest.pojo.Subject;

import java.util.List;

public interface SubjectDao {
    Integer queryForPageTotalCount();

    List<Subject> queryForPageItems(Integer begin,Integer pageSize);

    Subject queryByName(String name);

    Integer saveSubject(Subject subject);

    List<Subject> queryAllSubject();
}
