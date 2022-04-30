package com.onlineTest.web;

import com.onlineTest.pojo.Admin;
import com.onlineTest.service.AdminService;
import com.onlineTest.service.impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminServlet extends BaseServlet{

    AdminService adminService = new AdminServiceImpl();

    protected void loginAdmin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("username");
        String password = req.getParameter("password");
        Admin admin = adminService.loginAdmin(name,password);
        System.out.println(name);
        System.out.println(password);
        System.out.println(admin);
        if(admin==null) {
            req.setAttribute("msg","用户名或密码错误");
            req.setAttribute("username",name);
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);
        }
        else {
            req.getSession().setAttribute("username",name);
            req.getSession().setAttribute("type","admin");
            req.getRequestDispatcher("/index.jsp").forward(req,resp);
        }
    }

    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().removeAttribute("username");
        req.getSession().removeAttribute("type");
        req.getRequestDispatcher("/index.jsp").forward(req,resp);
    }
}
