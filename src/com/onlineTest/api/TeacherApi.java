package com.onlineTest.api;

import com.onlineTest.common.Result;
import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Teacher;
import com.onlineTest.service.TeacherService;
import com.onlineTest.service.impl.TeacherServiceImpl;
import com.onlineTest.utils.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class TeacherApi extends BaseApi {
    TeacherService teacherService = new TeacherServiceImpl();

    protected void pageTeacher(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);

        Page<Teacher> page = teacherService.page(pageNo,pageSize);
        page.setType("teacher");
        page.setUrl("teacherServlet?action=pageTeacher");

        resp.getWriter().write(WebUtils.getJSONString(Result.success(page)));
    }
}
