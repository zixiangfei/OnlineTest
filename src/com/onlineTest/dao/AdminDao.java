package com.onlineTest.dao;

import com.onlineTest.pojo.Admin;

public interface AdminDao {

    /**
     * 查找是否有帐户
     * @param name
     * @param password
     * @return
     */
    public Admin queryByAdminNameAndPassword(String name,String password);


}
