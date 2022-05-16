package com.onlineTest.service.impl;

import com.onlineTest.dao.ClassDao;
import com.onlineTest.dao.StudentDao;
import com.onlineTest.dao.impl.ClassDaoImpl;
import com.onlineTest.dao.impl.StudentDaoImpl;
import com.onlineTest.pojo.Class;
import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Student;
import com.onlineTest.service.ClassService;
import com.onlineTest.utils.WebUtils;

import java.util.List;

public class ClassServiceImpl implements ClassService {

    ClassDao classDao = new ClassDaoImpl();
    StudentDao studentDao = new StudentDaoImpl();

    @Override
    public Page<Class> page(Integer pageNo, Integer pageSize) {
        Page<Class> page = new Page<Class>();

        Integer pageTotalCount = classDao.queryForPageTotalCount();
        Integer pageTotal = pageTotalCount / pageSize + (pageTotalCount % pageSize == 0 ? 0 : 1);
        page.setPageTotal(pageTotal);
        page.setPageTotalCount(pageTotalCount);
        page.setPageNo(pageNo);
        page.setPageSize(pageSize);

        Integer begin = (page.getPageNo() - 1) * pageSize;

        List<Class> classes = classDao.queryForPageItems(begin,pageSize);

        page.setItems(classes);

        return page;
    }

    @Override
    public boolean existsClassName(String name) {
        Class classes = classDao.queryByName(name);
        if(classes==null) {
            return false;
        }
        else {
            return true;
        }
    }

    @Override
    public void addClass(Class aClass) {
        classDao.saveClass(aClass);
    }

    @Override
    public List<Class> classList() {
        return classDao.queryAllClass();
    }

    @Override
    public Class getClassById(Integer classId) {
        return classDao.queryById(classId);
    }

    @Override
    public void modifyClassById(Class modifyClass) {
        classDao.modifyClassById(modifyClass);
    }

    @Override
    public List<Class> getClassByTeacherId(Integer teacherId) {
        return classDao.queryByTeacherId(teacherId);
    }

    @Override
    public Class getClassByStudentId(Integer studentId) {
        Student student = studentDao.queryById(studentId);
        if (student.getClassId() == null) {
            return null;
        } else {
            return getClassById(WebUtils.parseInt(student.getClassId(), 0));
        }
    }
}
