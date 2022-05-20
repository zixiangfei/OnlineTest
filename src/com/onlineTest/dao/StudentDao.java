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

    List<Student> queryByClassId(Integer classId);

    Student queryById(Integer studentId);

    void modifyStudentById(Student student);

    void updateStudentPassword(Integer studentId, String password);

    void updateStudentEmail(Integer studentId, String email);

    void updateStudentNikeName(Integer studentId, String nikename);

}
