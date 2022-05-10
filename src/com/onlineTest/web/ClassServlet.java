package com.onlineTest.web;

import com.google.gson.Gson;
import com.onlineTest.pojo.*;
import com.onlineTest.pojo.Class;
import com.onlineTest.service.ClassService;
import com.onlineTest.service.StudentService;
import com.onlineTest.service.TeacherService;
import com.onlineTest.service.TestService;
import com.onlineTest.service.impl.ClassServiceImpl;
import com.onlineTest.service.impl.StudentServiceImpl;
import com.onlineTest.service.impl.TeacherServiceImpl;
import com.onlineTest.service.impl.TestServiceImpl;
import com.onlineTest.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class ClassServlet extends BaseServlet{

    ClassService classService = new ClassServiceImpl();
    TeacherService teacherService = new TeacherServiceImpl();
    StudentService studentService = new StudentServiceImpl();
    TestService testService = new TestServiceImpl();

    protected void pageClass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);

        Page<Class> page = classService.page(pageNo,pageSize);
        page.setType("class");
        page.setUrl("classServlet?action=pageClass");
        req.setAttribute("page",page);

        req.getRequestDispatcher("/pages/manager/manager-class.jsp").forward(req,resp);

    }

    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("insert-name");
        Integer teacherId = WebUtils.parseInt(req.getParameter("teacherId"),1);
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);

        Random r = new Random();
        String image="https://himg.bdimg.com/sys/portrait/hotitem/wildkid/" + r.nextInt(67);
        Integer modal = WebUtils.parseInt(req.getParameter("modal"),0);
        if(modal==1) {
            if(classService.existsClassName(name)) {
                Page<Class> page = classService.page(pageNo,pageSize);
                page.setType("class");
                page.setUrl("classServlet?action=pageClass");
                req.setAttribute("addMsg","该课程已存在！");
                req.setAttribute("page",page);
                resp.sendRedirect(req.getContextPath()+"/classServlet?action=pageClass&pageNo="+pageNo);
            }
            else {
                Page<Class> page = classService.page(pageNo,pageSize);
                classService.addClass(new Class(name,null,teacherId,image,0));
                page.setType("class");
                page.setUrl("classServlet?action=pageClass");
                req.setAttribute("page",page);
                resp.sendRedirect(req.getContextPath()+"/classServlet?action=pageClass&pageNo="+pageNo);
            }
        }
        else {
            Integer classId = WebUtils.parseInt(req.getParameter("modifyId"),0);
            Integer members = WebUtils.parseInt(req.getParameter("members"),0);
            Class modifyClass = new Class(name,classId,teacherId,image,members);
            classService.modifyClassById(modifyClass);
            resp.sendRedirect(req.getContextPath()+"/classServlet?action=pageClass&pageNo="+pageNo);
        }
    }

    protected void ajaxExistsClass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        boolean existsClass = classService.existsClassName(name);
        Map<String,Object> resultMap = new HashMap<String ,Object>();
        resultMap.put("existsClass",existsClass);
        Gson gson = new Gson();
        resp.getWriter().write(gson.toJson(resultMap));
    }

    protected void showClassList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Class> classes = classService.classList();
        req.setAttribute("classes",classes);
        req.getRequestDispatcher("/pages/classes/class-major.jsp").forward(req,resp);
    }

    protected void showClassListByTeacherId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer teacherId = WebUtils.parseInt(req.getParameter("teacherId"),0);
        List<Class> classes = classService.getClassByTeacherId(teacherId);
        req.setAttribute("classes",classes);
        req.getRequestDispatcher("/pages/classes/class-major.jsp").forward(req,resp);
    }

    protected void showClassDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer classId = WebUtils.parseInt(req.getParameter("classId"),1);
        Integer type = WebUtils.parseInt(req.getParameter("type"),0);
        Class curClass = classService.getClassById(classId);
        Teacher curTeacher =  teacherService.getTeacherById(curClass.getTeacherId());
        List<Student> studentList = studentService.getStudentListByClassId(classId);
        List<Test> testList = testService.getTestListByClassId(classId);


        req.setAttribute("curClass",curClass);
        req.setAttribute("curTeacher",curTeacher);
        req.setAttribute("studentList",studentList);
        req.setAttribute("testList",testList);

        if(type.equals(new Integer(0))) {
            req.getRequestDispatcher("/pages/classes/class-details.jsp").forward(req,resp);

        }
        else {
            req.getRequestDispatcher("/pages/classes/class-open.jsp").forward(req,resp);

        }
    }

    protected void ajaxShowClassById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer modifyId = WebUtils.parseInt(req.getParameter("modifyId"),0);
        Class classById = classService.getClassById(modifyId);
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("modifyClass",classById);
        Gson gson = new Gson();
        resp.getWriter().write(gson.toJson(resultMap));
    }

    protected void ajaxShowClassList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Class> classList = classService.classList();
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("classList",classList);
        Gson gson = new Gson();
        resp.getWriter().write(gson.toJson(resultMap));
    }
}
