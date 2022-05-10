package com.onlineTest.api;

import com.auth0.jwt.exceptions.JWTCreationException;
import com.onlineTest.common.Result;
import com.onlineTest.enums.ErrorCodeEnum;
import com.onlineTest.pojo.Admin;
import com.onlineTest.service.AdminService;
import com.onlineTest.service.impl.AdminServiceImpl;
import com.onlineTest.utils.JwtTokenUtils;
import com.onlineTest.utils.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class AdminApi extends BaseApi {
    AdminService adminService = new AdminServiceImpl();

    protected void loginAdmin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("username");
        String password = req.getParameter("password");
        Admin admin = adminService.loginAdmin(name,password);
        if (admin == null) {
            // 登录失败
            resp.getWriter().write(WebUtils.getJSONString(Result.error(ErrorCodeEnum.REQUEST_PARAMS_ERROR.getCode(), "用户名或密码错误")));
        } else {
            // 登录成功
            Map<String, Object> map = new HashMap<>();
            map.put("username", admin.getUsername());
            map.put("type", "admin");
            String token;
            try {
                token = JwtTokenUtils.generateToken(map);
            } catch (JWTCreationException e) {
                log.error("token生成失败, " + e.getMessage());
                resp.getWriter().write(WebUtils.getJSONString(Result.error(ErrorCodeEnum.SYSTEM_ERROR.getCode(), "生成token失败")));
                return;
            }
            resp.getWriter().write(WebUtils.getJSONString(Result.success(token)));
        }
    }


    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.getWriter().write(WebUtils.getJSONString(Result.success(null)));
    }
}
