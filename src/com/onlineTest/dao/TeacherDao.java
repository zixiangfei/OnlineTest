package com.onlineTest.dao;

import com.onlineTest.pojo.Teacher;

import java.util.List;

public interface TeacherDao {

    Teacher queryByTeacherName(String name);

    Teacher queryByTeacherNameAndPassword(String name,String password);

    Integer saveTeacher(Teacher teacher);

    Integer queryForPageTotalCount();

    List<Teacher> queryForPageItems(Integer begin,Integer pageSize);
}
