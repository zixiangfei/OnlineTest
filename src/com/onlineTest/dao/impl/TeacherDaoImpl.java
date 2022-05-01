package com.onlineTest.dao.impl;

import com.onlineTest.dao.TeacherDao;
import com.onlineTest.pojo.Teacher;

import java.util.List;

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

    @Override
    public Integer queryForPageTotalCount() {
        String sql = "select count(*) from teacher";
        Number count = (Number) queryForSingleValue(sql);
        return count.intValue();
    }

    @Override
    public List<Teacher> queryForPageItems(Integer begin, Integer pageSize) {
        String sql = "select * from teacher limit ?,?";
        List<Teacher> teachers = queryForList(Teacher.class,sql,begin,pageSize);
        return teachers;
    }
}
