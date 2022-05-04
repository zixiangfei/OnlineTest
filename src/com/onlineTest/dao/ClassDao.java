package com.onlineTest.dao;

import com.onlineTest.pojo.Class;

import java.util.List;

public interface ClassDao {

    Integer queryForPageTotalCount();

    List<Class> queryForPageItems(Integer begin,Integer pageSize);

    Class queryByName(String name);

    Integer saveClass(Class aClass);

    List<Class> queryAllClass();

    Class queryById(Integer classId);
}
