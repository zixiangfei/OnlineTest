package com.onlineTest.service.impl;

import com.onlineTest.dao.TeacherDao;
import com.onlineTest.dao.impl.TeacherDaoImpl;
import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Teacher;
import com.onlineTest.service.TeacherService;
import com.onlineTest.utils.WebUtils;

import java.util.List;

public class TeacherServiceImpl implements TeacherService {

    TeacherDao teacherDao = new TeacherDaoImpl();

    @Override
    public Teacher loginTeacher(String name, String password) {
        return teacherDao.queryByTeacherNameAndPassword(name, WebUtils.md5(password));
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
        teacher.setPassword(WebUtils.md5(teacher.getPassword()));
        teacherDao.saveTeacher(teacher);
    }

    @Override
    public Page<Teacher> page(Integer pageNo, Integer pageSize) {
        Page<Teacher> page = new Page<Teacher>();
        Integer pageTotalCount = teacherDao.queryForPageTotalCount();
        page.setPageTotalCount(pageTotalCount);
        Integer pageTotal = pageTotalCount / pageSize + (pageTotalCount % pageSize == 0 ? 0 : 1);
        page.setPageTotal(pageTotal);
        page.setPageNo(pageNo);
        page.setPageSize(pageSize);
        Integer begin = (page.getPageNo() - 1) * page.getPageSize();
        page.setItems(teacherDao.queryForPageItems(begin,pageSize));
        return page;
    }

    @Override
    public List<Teacher> allTeacher() {
        List<Teacher> teachers = teacherDao.queryAllTeacher();
        return teachers;
    }

    @Override
    public Teacher getTeacherById(Integer teacherId) {
        return teacherDao.queryById(teacherId);
    }

}
