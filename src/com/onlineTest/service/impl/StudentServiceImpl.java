package com.onlineTest.service.impl;

import com.onlineTest.dao.StudentDao;
import com.onlineTest.dao.impl.StudentDaoImpl;
import com.onlineTest.pojo.Student;
import com.onlineTest.service.StudentService;

import java.util.List;

public class StudentServiceImpl implements StudentService {

    StudentDao studentDao = new StudentDaoImpl();

    @Override
    public Student loginStudent(String name, String password) {
        return studentDao.queryByStudentNameAndPassword(name,password);
    }

    @Override
    public Boolean existStudentName(String name) {
        Student student = studentDao.queryByStudentName(name);
        if(student==null) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public void registStudent(Student student) {
       studentDao.saveStudent(student);
    }

    @Override
    public List<Student> queryAllStudent() {
        return studentDao.queryAllStudent();
    }
}
