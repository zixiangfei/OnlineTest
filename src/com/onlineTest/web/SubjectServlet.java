package com.onlineTest.web;

import com.google.gson.Gson;
import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Subject;
import com.onlineTest.service.SubjectService;
import com.onlineTest.service.impl.SubjectServiceImpl;
import com.onlineTest.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SubjectServlet extends BaseServlet{

    SubjectService subjectService = new SubjectServiceImpl();

    protected void pageSubject(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);

        Page<Subject> page = subjectService.page(pageNo,pageSize);

        page.setType("subject");
        page.setUrl("subjectServlet?action=pageSubject");
        req.setAttribute("page",page);
        req.getRequestDispatcher("/pages/manager/manager-subject.jsp").forward(req,resp);
    }


    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("insert-name");
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);
        Integer modal = WebUtils.parseInt(req.getParameter("modal"),0);
        if(modal==1) {
            if(subjectService.existsSubjectName(name)) {
                Page<Subject> page = subjectService.page(pageNo,pageSize);
                page.setType("subject");
                page.setUrl("subjectServlet?action=pageSubject");
                req.setAttribute("addMsg","该课程已存在！");
                req.setAttribute("page",page);
                resp.sendRedirect(req.getContextPath()+"/subjectServlet?action=pageSubject&pageNo="+pageNo);
            }
            else {
                subjectService.addSubject(new Subject(null,name));
                Page<Subject> page = subjectService.page(pageNo,pageSize);
                page.setType("subject");
                page.setUrl("subjectServlet?action=pageSubject");
                resp.sendRedirect(req.getContextPath()+"/subjectServlet?action=pageSubject&pageNo="+pageNo);
            }
        }
        else {
            Integer modifyId = WebUtils.parseInt(req.getParameter("modifyId"),0);
            Subject subject = new Subject(modifyId,name);
            subjectService.updateSubjectById(subject);
            resp.sendRedirect(req.getContextPath()+"/subjectServlet?action=pageSubject&pageNo="+pageNo);
        }

    }

    protected void ajaxExistsSubjectName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        Boolean existsSubjectName = subjectService.existsSubjectName(name);
        Map<String,Object> resultMap = new HashMap<String, Object>();
        resultMap.put("existsSubjectName",existsSubjectName);
        Gson gson = new Gson();
        resp.getWriter().write(gson.toJson(resultMap));
    }

    protected void ajaxAllSubject(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Subject> subjects = subjectService.allSubject();
        Map<String,Object> resultMap = new HashMap<String, Object>();
        resultMap.put("subjects",subjects);
        Gson gson = new Gson();
        resp.getWriter().write(gson.toJson(resultMap));
    }

    protected void ajaxShowSubjectById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer subjectId = WebUtils.parseInt(req.getParameter("subjectId"),0);
        Subject modifySubject = subjectService.getSubjectById(subjectId);
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("modifySubject",modifySubject);
        Gson gson = new Gson();
        resp.getWriter().write(gson.toJson(resultMap));
    }
}
