package com.onlineTest.api;

import com.onlineTest.common.Result;
import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Student;
import com.onlineTest.service.StudentService;
import com.onlineTest.service.impl.StudentServiceImpl;
import com.onlineTest.utils.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentApi extends BaseApi {
    StudentService studentService = new StudentServiceImpl();

    protected void getAllStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<Student> students = studentService.queryAllStudent();
        Map<String, Object> map = new HashMap<>();
        map.put("students", students);
        map.put("type", "student");
        resp.getWriter().write(WebUtils.getJSONString(Result.success(map)));
    }

    protected void pageStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);

        Page<Student> page = studentService.page(pageNo, pageSize);
        page.setType("student");
        page.setUrl("studentServlet?action=pageStudent");
        resp.getWriter().write(WebUtils.getJSONString(Result.success(page)));
    }
}
