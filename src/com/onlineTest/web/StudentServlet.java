package com.onlineTest.web;

import com.google.gson.Gson;
import com.onlineTest.dao.StudentDao;
import com.onlineTest.dao.impl.StudentDaoImpl;
import com.onlineTest.pojo.Class;
import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Student;
import com.onlineTest.service.ClassService;
import com.onlineTest.service.StudentService;
import com.onlineTest.service.impl.ClassServiceImpl;
import com.onlineTest.service.impl.StudentServiceImpl;
import com.onlineTest.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class StudentServlet extends BaseServlet{

    StudentService studentService = new StudentServiceImpl();
    ClassService classService = new ClassServiceImpl();

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

    protected void ajaxShowStudentById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer modifyId = WebUtils.parseInt(req.getParameter("modifyId"),0);
        Student studentById = studentService.getStudentById(modifyId);
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("modifyStudent",studentById);
        Gson gson = new Gson();
        resp.getWriter().write(gson.toJson(resultMap));
    }

    protected void modifyStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer classId = WebUtils.parseInt(req.getParameter("classId"),0);
        Class newClass = classService.getClassById(classId);
        String newNikename = req.getParameter("insert-name");
        Integer modifyId = WebUtils.parseInt(req.getParameter("modifyId"),0);
        Student studentById = studentService.getStudentById(modifyId);
        Integer oldClassId = WebUtils.parseInt(studentById.getClassId(),0);
        System.out.println(oldClassId);
        System.out.println(classId);
        if(oldClassId!=null&&oldClassId != 0) {
            Class oldClass = classService.getClassById(oldClassId);
            classService.modifyClassById(new Class(oldClass.getName(),oldClassId,oldClass.getTeacherId(),oldClass.getImage(),oldClass.getMembers()-1));
        }
        classService.modifyClassById(new Class(newClass.getName(),newClass.getId(),newClass.getTeacherId(),newClass.getImage(),newClass.getMembers()+1));
        studentService.modifyStudentById(new Student(studentById.getId(),studentById.getUsername(),studentById.getPassword(),studentById.getEmail(),classId.toString(),newNikename));

        resp.sendRedirect(req.getHeader("Referer"));
    }
}
