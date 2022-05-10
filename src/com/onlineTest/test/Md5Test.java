package com.onlineTest.test;

import com.onlineTest.utils.WebUtils;
import org.junit.Test;

public class Md5Test {
    @Test
    public void md5() {
        String password = "123456";
        String md5 = WebUtils.md5(password);
        System.out.println(md5);
    }
}
