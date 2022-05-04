package com.onlineTest.test;

import com.onlineTest.dao.ClassDao;
import com.onlineTest.dao.impl.ClassDaoImpl;
import org.junit.Test;

import static org.junit.Assert.*;

public class ClassDaoImplTest {

    ClassDao classDao = new ClassDaoImpl();

    @Test
    public void queryById() {
        System.out.println(classDao.queryById(1));
    }
}