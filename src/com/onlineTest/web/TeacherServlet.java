package com.onlineTest.web;

import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Teacher;
import com.onlineTest.service.TeacherService;
import com.onlineTest.service.impl.TeacherServiceImpl;
import com.onlineTest.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class TeacherServlet extends BaseServlet{

    TeacherService teacherService = new TeacherServiceImpl();

    protected void loginTeacher(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Teacher teacher = teacherService.loginTeacher(username,password);
        if(teacher==null) {
            req.setAttribute("msg","用户名或密码错误");
            req.setAttribute("username",username);
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);
        }
        else {
            req.getSession().setAttribute("username",username);
            req.getSession().setAttribute("type","teacher");
            req.getRequestDispatcher("/index.jsp").forward(req,resp);
        }
    }

    protected void registTeacher(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String code = req.getParameter("code");
        String kaptcha =(String) req.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        req.getSession().removeAttribute(KAPTCHA_SESSION_KEY);

        if(kaptcha!=null&&kaptcha.equals(code)) {
            if(teacherService.existsTeacherName(username)) {
                req.setAttribute("username",username);
                req.setAttribute("email",email);
                req.setAttribute("msg","账号已存在");
                req.getRequestDispatcher("/pages/user/regist.jsp").forward(req,resp);
            }
            else {
                teacherService.registTeacher(new Teacher(null,username,password,email,null));
                req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);
            }
        }
        else {
            req.setAttribute("username",username);
            req.setAttribute("email",email);
            req.setAttribute("msg","验证码错误");
            req.getRequestDispatcher("/pages/user/regist.jsp").forward(req,resp);
        }
    }

    protected void pageTeacher(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);

        Page<Teacher> page = teacherService.page(pageNo,pageSize);
        page.setType("teacher");
        page.setUrl("teacherServlet?action=pageTeacher");
        req.setAttribute("page",page);

        req.getRequestDispatcher("/pages/manager/manager-teacher.jsp").forward(req,resp);
    }
}
