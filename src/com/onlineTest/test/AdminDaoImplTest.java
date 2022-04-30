package com.onlineTest.test;

import com.onlineTest.dao.AdminDao;
import com.onlineTest.dao.impl.AdminDaoImpl;
import com.onlineTest.pojo.Admin;
import org.junit.Test;

import static org.junit.Assert.*;

public class AdminDaoImplTest {

    @Test
    public void queryByAdminNameAndPassword() {
        AdminDao adminDao = new AdminDaoImpl();
        Admin admin = adminDao.queryByAdminNameAndPassword("admin","admin");
        System.out.println(admin);
    }
}