package com.onlineTest.web;

import com.google.gson.Gson;
import com.onlineTest.pojo.Class;
import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Subject;
import com.onlineTest.pojo.Teacher;
import com.onlineTest.service.ClassService;
import com.onlineTest.service.impl.ClassServiceImpl;
import com.onlineTest.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class ClassServlet extends BaseServlet{

    ClassService classService = new ClassServiceImpl();

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
            classService.addClass(new Class(name,null,teacherId));
            page.setType("class");
            page.setUrl("classServlet?action=pageClass");
            req.setAttribute("page",page);
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
}
