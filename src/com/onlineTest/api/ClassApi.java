package com.onlineTest.api;

import com.onlineTest.common.Result;
import com.onlineTest.pojo.Class;
import com.onlineTest.pojo.Page;
import com.onlineTest.service.ClassService;
import com.onlineTest.service.impl.ClassServiceImpl;
import com.onlineTest.utils.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ClassApi extends BaseApi {
    ClassService classService = new ClassServiceImpl();

    protected void pageClass(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);

        Page<Class> page = classService.page(pageNo,pageSize);
        page.setType("class");
        page.setUrl("classServlet?action=pageClass");

        resp.getWriter().write(WebUtils.getJSONString(Result.success(page)));
    }
}
