package com.onlineTest.service;

import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Subject;

public interface SubjectService {
    Page<Subject> page(Integer pageNo,Integer pageSize);

    Boolean existsSubjectName(String name);

    void addSubject(Subject subject);
}
