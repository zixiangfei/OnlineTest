package com.onlineTest.service;

import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Student;

import java.util.List;

public interface StudentService {

    Student loginStudent(String name,String password);

    Boolean existStudentName(String name);

    void registStudent(Student student);

    List<Student> queryAllStudent();

    Page<Student> page(Integer pageNo,Integer pageSize);

    List<Student> getStudentListByClassId(Integer classId);

    Student getStudentById(Integer studentId);

    void modifyStudentById(Student student);

    void modifyStudentPassword(Integer studentId, String password);

    void modifyStudentEmail(Integer studentId, String email);

    void modifyStudentNikeName(Integer studentId, String nikename);
}
