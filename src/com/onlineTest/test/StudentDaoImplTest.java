package com.onlineTest.test;

import com.onlineTest.dao.StudentDao;
import com.onlineTest.dao.impl.StudentDaoImpl;
import com.onlineTest.pojo.Student;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;
public class StudentDaoImplTest {

    StudentDao studentDao = new StudentDaoImpl();

    @Test
    public void queryByStudentNameAndPassword() {
    }

    @Test
    public void queryByStudentName() {
        Student student = studentDao.queryByStudentName("zixiangfei");
        System.out.println(student);
    }

    @Test
    public void saveStudent() {
        System.out.println(studentDao.saveStudent(new Student(null,"zixiangfei","123456","zxf@qq.com",null,null)));
    }

    @Test
    public void queryAllStudent() {
        List<Student> students = studentDao.queryAllStudent();
        for(Student student : students) {
            System.out.println(student);
        }
    }

    @Test
    public void queryTotalCount() {
        System.out.println(studentDao.queryTotalCount());
    }
}