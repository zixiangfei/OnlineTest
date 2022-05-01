package com.onlineTest.web;

import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Subject;
import com.onlineTest.service.SubjectService;
import com.onlineTest.service.impl.SubjectServiceImpl;
import com.onlineTest.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SubjectServlet extends BaseServlet{

    SubjectService subjectService = new SubjectServiceImpl();

    protected void pageSubject(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);

        Page<Subject> page = subjectService.page(pageNo,pageSize);

        page.setType("subject");
        page.setUrl("subjectServlet?action=pageSubject");

        req.getRequestDispatcher("/pages/manager/manager-subject.jsp").forward(req,resp);

    }
}
