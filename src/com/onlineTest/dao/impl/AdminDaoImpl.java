package com.onlineTest.dao.impl;

import com.onlineTest.dao.AdminDao;
import com.onlineTest.pojo.Admin;

public class AdminDaoImpl extends BaseDao implements AdminDao{

    @Override
    public Admin queryByAdminNameAndPassword(String name, String password) {
        String sql = "select `id`,`username`,`password` from admin where username = ? and password = ?";
        return queryForOne(Admin.class,sql,name,password);
    }
}
