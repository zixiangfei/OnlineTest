package com.onlineTest.dao;

import com.onlineTest.pojo.Student;

import java.util.List;

public interface StudentDao {

    public Student queryByStudentNameAndPassword(String name,String password);

    public Student queryByStudentName(String name);

    public int saveStudent(Student student);

    public List<Student> queryAllStudent();

    public Integer queryTotalCount();

    public List<Student> queryForPageItems(Integer begin,Integer pageSize);
}
