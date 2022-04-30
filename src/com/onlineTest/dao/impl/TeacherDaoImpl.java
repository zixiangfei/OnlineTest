package com.onlineTest.dao.impl;

import com.onlineTest.dao.TeacherDao;
import com.onlineTest.pojo.Teacher;

public class TeacherDaoImpl extends BaseDao implements TeacherDao {

    @Override
    public Teacher queryByTeacherName(String name) {
        String sql = "select * from teacher where username = ?";
        return queryForOne(Teacher.class,sql,name);
    }

    @Override
    public Teacher queryByTeacherNameAndPassword(String name, String password) {
        String sql = "select * from teacher where username = ? and password = ?";
        return queryForOne(Teacher.class,sql,name,password);
    }

    @Override
    public Integer saveTeacher(Teacher teacher) {
        String sql = "insert into teacher(`username`,`password`,`email`,`nikename`) values(?,?,?,?)";
        return update(sql,teacher.getUsername(),teacher.getPassword(),teacher.getEmail(),teacher.getUsername());
    }
}
