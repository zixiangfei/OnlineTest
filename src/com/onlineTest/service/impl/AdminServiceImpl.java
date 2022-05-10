package com.onlineTest.service.impl;

import com.onlineTest.dao.AdminDao;
import com.onlineTest.dao.impl.AdminDaoImpl;
import com.onlineTest.pojo.Admin;
import com.onlineTest.service.AdminService;
import com.onlineTest.utils.WebUtils;

public class AdminServiceImpl implements AdminService {

    AdminDao adminDao = new AdminDaoImpl();

    @Override
    public Admin loginAdmin(String name, String password) {
        return adminDao.queryByAdminNameAndPassword(name, WebUtils.md5(password));
    }
}
