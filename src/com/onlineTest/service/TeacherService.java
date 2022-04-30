package com.onlineTest.service;

import com.onlineTest.pojo.Teacher;

public interface TeacherService {

    Teacher loginTeacher(String name,String password);

    Boolean existsTeacherName(String name);

    void registTeacher(Teacher teacher);
}
