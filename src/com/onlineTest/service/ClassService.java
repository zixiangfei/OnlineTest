package com.onlineTest.service;

import com.onlineTest.pojo.Class;
import com.onlineTest.pojo.Page;

public interface ClassService {
    Page<Class> page(Integer pageNo, Integer pageSize);

    boolean existsClassName(String name);

    void addClass(Class aClass);
}
