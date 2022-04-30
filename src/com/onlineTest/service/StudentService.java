package com.onlineTest.service;

import com.onlineTest.pojo.Student;

import java.util.List;

public interface StudentService {

    Student loginStudent(String name,String password);

    Boolean existStudentName(String name);

    void registStudent(Student student);

    List<Student> queryAllStudent();
}
