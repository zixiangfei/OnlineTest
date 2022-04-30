package com.onlineTest.service.impl;

import com.onlineTest.dao.TeacherDao;
import com.onlineTest.dao.impl.TeacherDaoImpl;
import com.onlineTest.pojo.Teacher;
import com.onlineTest.service.TeacherService;

public class TeacherServiceImpl implements TeacherService {

    TeacherDao teacherDao = new TeacherDaoImpl();

    @Override
    public Teacher loginTeacher(String name, String password) {
        return teacherDao.queryByTeacherNameAndPassword(name,password);
    }

    @Override
    public Boolean existsTeacherName(String name) {
        Teacher teacher = teacherDao.queryByTeacherName(name);
        if(teacher==null) {
            return false;
        }
        else {
            return true;
        }
    }

    @Override
    public void registTeacher(Teacher teacher) {
        teacherDao.saveTeacher(teacher);
    }
}
