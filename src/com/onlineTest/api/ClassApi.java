package com.onlineTest.api;

import cn.hutool.core.util.StrUtil;
import com.onlineTest.common.Result;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class ClassApi extends BaseApi {
    ClassService classService = new ClassServiceImpl();
    TeacherService teacherService = new TeacherServiceImpl();
    StudentService studentService = new StudentServiceImpl();
    TestService testService = new TestServiceImpl();

    protected void pageClass(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);

        Page<Class> page = classService.page(pageNo, pageSize);
        page.setType("class");
        page.setUrl("classServlet?action=pageClass");

        resp.getWriter().write(WebUtils.getJSONString(Result.success(page)));
    }

    protected void existsClass(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        if (StrUtil.hasBlank(name)) {
            WebUtils.writeJSONString(resp, Result.requestParameterError());
            return;
        }
        boolean existsClass = classService.existsClassName(name);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("existsClass", existsClass);
        WebUtils.writeJSONString(resp, Result.success(resultMap));
    }

    protected void add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("insert-name");
        if (StrUtil.hasBlank(name)) {
            WebUtils.writeJSONString(resp, Result.requestParameterError());
            return;
        }
        Integer teacherId = WebUtils.parseInt(req.getParameter("teacherId"), 1);
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);
        Random r = new Random();
        String image = "https://himg.bdimg.com/sys/portrait/hotitem/wildkid/" + r.nextInt(67);
        if (classService.existsClassName(name)) {
            Page<Class> page = classService.page(pageNo, pageSize);
            page.setType("class");
            page.setUrl("classServlet?action=pageClass");
            WebUtils.writeJSONString(resp, Result.requestParameterError("该课程已存在！", page));
        } else {
            classService.addClass(new Class(name, null, teacherId, image, 0));
            Page<Class> page = classService.page(pageNo, pageSize);
            page.setType("class");
            page.setUrl("classServlet?action=pageClass");
            WebUtils.writeJSONString(resp, Result.success(page));
        }
    }

    protected void modify(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("insert-name");
        if (StrUtil.hasBlank(name)) {
            WebUtils.writeJSONString(resp, Result.requestParameterError());
            return;
        }
        Integer teacherId = WebUtils.parseInt(req.getParameter("teacherId"), 1);
        Integer classId = WebUtils.parseInt(req.getParameter("modifyId"), 0);
        Integer members = WebUtils.parseInt(req.getParameter("members"), 0);
        Random r = new Random();
        String image = "https://himg.bdimg.com/sys/portrait/hotitem/wildkid/" + r.nextInt(67);
        Class modifyClass = new Class(name, classId, teacherId, image, members);
        classService.modifyClassById(modifyClass);
        WebUtils.writeJSONString(resp, Result.success(null));
    }

    protected void showClassList(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<Class> classes = classService.classList();
        WebUtils.writeJSONString(resp, Result.success(classes));
    }

    protected void showClassListByTeacherId(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer teacherId = WebUtils.parseInt(req.getParameter("teacherId"),0);
        List<Class> classes = classService.getClassByTeacherId(teacherId);
        WebUtils.writeJSONString(resp, Result.success(classes));
    }

    protected void showClassListByStudentId(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer studentId = WebUtils.parseInt(req.getParameter("studentId"),0);
        Class classByStudentId = classService.getClassByStudentId(studentId);
        WebUtils.writeJSONString(resp, Result.success(classByStudentId));
    }

    protected void showClassDetails(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer classId = WebUtils.parseInt(req.getParameter("classId"),1);
        Class curClass = classService.getClassById(classId);
        Teacher curTeacher =  teacherService.getTeacherById(curClass.getTeacherId());
        List<Student> studentList = studentService.getStudentListByClassId(classId);
        List<Test> testList = testService.getTestListByClassId(classId);
        Map<String, Object> map = new HashMap<>();
        map.put("curClass", curClass);
        map.put("curTeacher", curTeacher);
        map.put("studentList", studentList);
        map.put("testList", testList);
        WebUtils.writeJSONString(resp, Result.success(map));
    }

    protected void showClassById(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer id = WebUtils.parseInt(req.getParameter("id"),0);
        Class classById = classService.getClassById(id);
        WebUtils.writeJSONString(resp, Result.success(classById));
    }
}
