package com.onlineTest.test;

import com.onlineTest.dao.TestDao;
import com.onlineTest.dao.impl.TestDaoImpl;
import org.junit.Test;

import static org.junit.Assert.*;

public class TestDaoImplTest {

    TestDao testDao = new TestDaoImpl();

    @Test
    public void queryById() {
        System.out.println(testDao.queryById(3));
    }
}