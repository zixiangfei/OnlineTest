package com.onlineTest.web;

import com.onlineTest.dao.StudentDao;
import com.onlineTest.dao.impl.StudentDaoImpl;
import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Student;
import com.onlineTest.service.StudentService;
import com.onlineTest.service.impl.StudentServiceImpl;
import com.onlineTest.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class StudentServlet extends BaseServlet{

    StudentService studentService = new StudentServiceImpl();

    protected void loginStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Student student =  studentService.loginStudent(username,password);
        if(student==null) {
            req.setAttribute("msg","用户名或密码错误");
            req.setAttribute("username",username);
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);
        }
        else {
            req.getSession().setAttribute("username",username);
            req.getSession().setAttribute("type","student");
            req.getSession().setAttribute("student",student);
            req.getRequestDispatcher("/index.jsp").forward(req,resp);
        }
    }

    protected void registStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String code = req.getParameter("code");
        String kaptcha =(String) req.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        req.getSession().removeAttribute(KAPTCHA_SESSION_KEY);

        if(kaptcha!=null&&kaptcha.equals(code)) {
            if(studentService.existStudentName(username)) {
                req.setAttribute("username",username);
                req.setAttribute("email",email);
                req.setAttribute("msg","账号已存在");
                req.getRequestDispatcher("/pages/user/regist.jsp").forward(req,resp);
            }
            else {
                studentService.registStudent(new Student(null,username,password,email,null,null));
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

    protected void getAllStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Student> students = studentService.queryAllStudent();
        req.setAttribute("userList",students);
        req.setAttribute("type","student");
        req.getRequestDispatcher("/pages/manager/manager-student.jsp").forward(req,resp);
    }

    protected void pageStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);

        Page<Student> page = studentService.page(pageNo,pageSize);
        page.setType("student");
        page.setUrl("studentServlet?action=pageStudent");
        req.setAttribute("page",page);
        System.out.println(page);
        req.getRequestDispatcher("/pages/manager/manager-student.jsp").forward(req,resp);
    }
}
