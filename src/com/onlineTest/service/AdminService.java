package com.onlineTest.service;

import com.onlineTest.pojo.Admin;

public interface AdminService {

    /**
     * 管理员登陆
     * @param name
     * @param password
     * @return
     */
    public Admin loginAdmin(String name,String password);
}
