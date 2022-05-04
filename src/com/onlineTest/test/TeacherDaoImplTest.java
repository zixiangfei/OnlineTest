package com.onlineTest.test;

import com.onlineTest.dao.TeacherDao;
import com.onlineTest.dao.impl.TeacherDaoImpl;
import org.junit.Test;

import static org.junit.Assert.*;

public class TeacherDaoImplTest {

    TeacherDao teacherDao = new TeacherDaoImpl();

    @Test
    public void queryByTeacherName() {
        System.out.println(teacherDao.queryByTeacherName("teacher"));
    }

    @Test
    public void queryByTeacherNameAndPassword() {
    }

    @Test
    public void saveTeacher() {
    }

    @Test
    public void queryAllTeacher() {
        System.out.println(teacherDao.queryAllTeacher());
    }

    @Test
    public void queryById() {
        System.out.println(teacherDao.queryById(1));
    }
}