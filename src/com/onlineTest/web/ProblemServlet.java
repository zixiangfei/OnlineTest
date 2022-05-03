package com.onlineTest.web;

import com.google.gson.internal.$Gson$Preconditions;
import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Problem;
import com.onlineTest.service.ProblemService;
import com.onlineTest.service.impl.ProblemServiceImpl;
import com.onlineTest.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProblemServlet extends BaseServlet{

    ProblemService problemService = new ProblemServiceImpl();

    protected void pageProblem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);

        Page<Problem> page = new Page<Problem>();

        page = problemService.page(pageNo,pageSize);
        page.setType("problem");
        page.setUrl("problemServlet?action=pageProblem");
        req.setAttribute("page",page);
        req.getRequestDispatcher("/pages/problem/problems.jsp").forward(req,resp);
    }

    protected void createProblem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        Integer subjectId = WebUtils.parseInt(req.getParameter("subject"),0);
        String describe = req.getParameter("describe");
        String analysis = req.getParameter("analysis");
        String optionA = req.getParameter("optionA");
        String optionB = req.getParameter("optionB");
        String optionC = req.getParameter("optionC");
        String optionD = req.getParameter("optionD");
        String options = optionA + "," + optionB + "," + optionC + "," +optionD;
        String answer = null;
        if("单选".equals(type)) {
            answer = req.getParameter("single");
        }
        if("多选".equals(type)) {
            String[] muti = req.getParameterValues("muti");
            for(int i=0;i<muti.length;++i) {
                if(i!=0) {
                    answer = answer +",";
                }
                answer = answer + muti[i];
            }
        }
        if("判断".equals(type)) {
            answer = req.getParameter("bool");
        }
        System.out.println(type);
        System.out.println(subjectId);
        System.out.println(describe);
        System.out.println(analysis);
        System.out.println(options);
        System.out.println(answer);

        Problem problem = new Problem(null,describe,answer,subjectId,analysis,options,0,0,type);

        problemService.saveProblem(problem);

        resp.sendRedirect(req.getContextPath()+"/problemServlet?action=pageProblem");
    }
}
