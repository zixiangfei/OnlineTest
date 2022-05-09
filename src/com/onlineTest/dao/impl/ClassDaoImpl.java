package com.onlineTest.dao.impl;

import com.onlineTest.dao.ClassDao;
import com.onlineTest.pojo.Class;

import java.util.List;

public class ClassDaoImpl extends BaseDao implements ClassDao {
    @Override
    public Integer queryForPageTotalCount() {
        String sql = "select count(*) from class";
        Number count =(Number) queryForSingleValue(sql);
        return count.intValue();
    }

    @Override
    public List<Class> queryForPageItems(Integer begin, Integer pageSize) {
        String sql = "select * from class limit ?, ?";
        List<Class> classes = queryForList(Class.class,sql,begin,pageSize);
        return classes;
    }

    @Override
    public Class queryByName(String name) {
        String sql = "select * from class where name = ?";
        return queryForOne(Class.class,sql,name);
    }

    @Override
    public Integer saveClass(Class aClass) {
        String sql = "insert into class(`name`,`teacherId`,`image`,`members`) values(?, ?, ?, ?)";
        return update(sql,aClass.getName(),aClass.getTeacherId(),aClass.getImage(),aClass.getMembers());
    }

    @Override
    public List<Class> queryAllClass() {
        String sql = "select * from class";
        List<Class> classes = queryForList(Class.class,sql);
        return classes;
    }

    @Override
    public Class queryById(Integer classId) {
        String sql = "select * from class where id = ?";
        return queryForOne(Class.class,sql, classId);
    }

    @Override
    public List<Class> queryByTeacherId(Integer teacherId) {
        String sql = "select * from class where teacherId = ?";
        return queryForList(Class.class,sql,teacherId);
    }

    @Override
    public void modifyClassById(Class modifyClass) {
        String sql = "update class set `name` = ? , `teacherId` = ? , `members` = ? where id = ?";
        update(sql,modifyClass.getName(),modifyClass.getTeacherId(),modifyClass.getMembers(),modifyClass.getId());
    }
}
