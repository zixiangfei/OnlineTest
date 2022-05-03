package com.onlineTest.config;

import java.util.HashSet;
import java.util.Set;

public class ApiPermissionConfig {
    public static final Set<String> ALLOW_SET = new HashSet<>();

    static {
        ALLOW_SET.add("loginAdmin");
        ALLOW_SET.add("logout");
        ALLOW_SET.add("loginStudent");
        ALLOW_SET.add("registStudent");
        ALLOW_SET.add("loginTeacher");
        ALLOW_SET.add("registTeacher");
    }
}
