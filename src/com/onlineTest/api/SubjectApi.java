package com.onlineTest.api;

import com.onlineTest.common.Result;
import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Subject;
import com.onlineTest.service.SubjectService;
import com.onlineTest.service.impl.SubjectServiceImpl;
import com.onlineTest.utils.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class SubjectApi extends BaseApi {
    SubjectService subjectService = new SubjectServiceImpl();

    protected void pageSubject(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);

        Page<Subject> page = subjectService.page(pageNo, pageSize);

        page.setType("subject");
        page.setUrl("subjectServlet?action=pageSubject");

        resp.getWriter().write(WebUtils.getJSONString(Result.success(page)));
    }

    protected void add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("insert-name");
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);
        Page<Subject> page = subjectService.page(pageNo, pageSize);
        page.setType("subject");
        page.setUrl("subjectServlet?action=pageSubject");

        if (subjectService.existsSubjectName(name)) {
            resp.getWriter().write(WebUtils.getJSONString(Result.error(-1, "该课程已存在！", page)));
        } else {
            resp.getWriter().write(WebUtils.getJSONString(Result.success(page)));
        }
    }

    protected void existsSubjectName(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        Boolean existsSubjectName = subjectService.existsSubjectName(name);
        Map<String, Object> map = new HashMap<>();
        map.put("existsSubjectName", existsSubjectName);
        resp.getWriter().write(WebUtils.getJSONString(Result.success(map)));
    }
}
