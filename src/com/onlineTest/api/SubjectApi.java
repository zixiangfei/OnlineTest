package com.onlineTest.api;

import cn.hutool.core.util.StrUtil;
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
import java.util.List;
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
        if (StrUtil.hasBlank(name)) {
            WebUtils.writeJSONString(resp, Result.requestParameterError());
            return;
        }
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);

        if (subjectService.existsSubjectName(name)) {
            Page<Subject> page = subjectService.page(pageNo, pageSize);
            page.setType("subject");
            page.setUrl("subjectServlet?action=pageSubject");
            resp.getWriter().write(WebUtils.getJSONString(Result.error(-1, "该课程已存在！", page)));
        } else {
            subjectService.addSubject(new Subject(null,name));
            Page<Subject> page = subjectService.page(pageNo, pageSize);
            page.setType("subject");
            page.setUrl("subjectServlet?action=pageSubject");
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

    protected void getAllSubjects(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<Subject> subjects = subjectService.allSubject();
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("subjects", subjects);
        WebUtils.writeJSONString(resp, Result.success(resultMap));
    }

    protected void showSubjectById(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer subjectId = WebUtils.parseInt(req.getParameter("subjectId"), 0);
        Subject subject = subjectService.getSubjectById(subjectId);
        WebUtils.writeJSONString(resp, Result.success(subject));
    }

    protected void modify(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("insert-name");
        if (StrUtil.hasBlank(name)) {
            WebUtils.writeJSONString(resp, Result.requestParameterError());
            return;
        }
        Integer modifyId = WebUtils.parseInt(req.getParameter("modifyId"), 0);
        Subject subject = new Subject(modifyId, name);
        subjectService.updateSubjectById(subject);
        WebUtils.writeJSONString(resp, Result.success(null));
    }
}
