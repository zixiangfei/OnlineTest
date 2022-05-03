package com.onlineTest.service;

import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Teacher;

import java.util.List;

public interface TeacherService {

    Teacher loginTeacher(String name,String password);

    Boolean existsTeacherName(String name);

    void registTeacher(Teacher teacher);

    Page<Teacher> page(Integer pageNo,Integer pageSize);

    List<Teacher> allTeacher();
}
