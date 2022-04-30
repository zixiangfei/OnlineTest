package com.onlineTest.dao.impl;

import com.onlineTest.dao.StudentDao;
import com.onlineTest.pojo.Student;

import java.util.List;

public class StudentDaoImpl extends BaseDao implements StudentDao {
    @Override
    public Student queryByStudentNameAndPassword(String name, String password) {
        String sql = "select * from student where username = ? and password = ?";
        return queryForOne(Student.class,sql,name,password);
    }

    @Override
    public Student queryByStudentName(String name) {
        String sql = "select * from student where username = ?";
        return queryForOne(Student.class,sql,name);
    }

    @Override
    public int saveStudent(Student student) {
        String sql = "insert into student(`username`,`password`,`email`,`nikename`) values( ? , ?  , ?,?)";
        return update(sql,student.getUsername(),student.getPassword(),student.getEmail(),student.getUsername());
    }

    @Override
    public List<Student> queryAllStudent() {
        String sql = "select * from student";
        return queryForList(Student.class,sql);
    }
}
