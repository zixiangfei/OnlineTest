package com.onlineTest.dao;

import com.onlineTest.pojo.Teacher;

public interface TeacherDao {

    Teacher queryByTeacherName(String name);

    Teacher queryByTeacherNameAndPassword(String name,String password);

    Integer saveTeacher(Teacher teacher);
}
