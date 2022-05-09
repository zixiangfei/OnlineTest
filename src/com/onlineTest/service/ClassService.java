package com.onlineTest.service;

import com.onlineTest.pojo.Class;
import com.onlineTest.pojo.Page;

import java.util.List;

public interface ClassService {
    Page<Class> page(Integer pageNo, Integer pageSize);

    boolean existsClassName(String name);

    void addClass(Class aClass);

    List<Class> classList();

    Class getClassById(Integer classId);

    void modifyClassById(Class modifyClass);

    List<Class> getClassByTeacherId(Integer teacherId);
}
