package com.onlineTest.service.impl;

import com.onlineTest.dao.StudentDao;
import com.onlineTest.dao.impl.StudentDaoImpl;
import com.onlineTest.pojo.Page;
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

    @Override
    public Page<Student> page(Integer pageNo, Integer pageSize) {
        Page<Student> page = new Page<Student>();
        Integer totalCount = studentDao.queryTotalCount();
        page.setPageTotalCount(totalCount);
        Integer pageTotal = totalCount / pageSize + (totalCount%pageSize==0? 0 : 1);
        System.out.println(pageTotal);
        page.setPageTotal(pageTotal);
        page.setPageNo(pageNo);
        page.setPageSize(pageSize);
        Integer begin = (page.getPageNo() - 1) * page.getPageSize();
        List<Student> students = studentDao.queryForPageItems(begin,pageSize);
        page.setItems(students);
        return page;
    }

    @Override
    public List<Student> getStudentListByClassId(Integer classId) {
        return studentDao.queryByClassId(classId);
    }
}
