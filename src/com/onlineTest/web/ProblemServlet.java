package com.onlineTest.web;

import com.google.gson.Gson;
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
import java.util.HashMap;
import java.util.Map;

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

    protected void searchProblemByParameter(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);
        Integer subjectId = WebUtils.parseInt(req.getParameter("searchSubjectId"),0);
        System.out.println(subjectId);
        String describe = req.getParameter("title");
        if(describe==null) {
            describe="";
        }
        System.out.println(describe);
        String type = req.getParameter("searchType");
        System.out.println(subjectId);
        System.out.println(type);
        Page<Problem> page = new Page<Problem>();

        page = problemService.pageByParameter(pageNo,pageSize,subjectId,describe,type);
        page.setUrl("problemServlet?action=searchProblemByParameter&searchSubjectId="+subjectId+"&describe="+describe+"&type="+type);
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
        Integer modal = WebUtils.parseInt(req.getParameter("modal"),0);
        String options = optionA + "," + optionB + "," + optionC + "," +optionD;
        String answer = "";
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
        System.out.println(modal);
        if(modal==1) {
            Problem problem = new Problem(null,describe,answer,subjectId,analysis,options,0,0,type);

            problemService.saveProblem(problem);
        }
        else {
            Integer modifyId = WebUtils.parseInt(req.getParameter("modifyId"),0);
            Problem problem = new Problem(modifyId,describe,answer,subjectId,analysis,options,0,0,type);
            problemService.updateProblemById(problem);
        }

        resp.sendRedirect(req.getContextPath()+"/problemServlet?action=pageProblem");
    }

    protected void showProblemDescribe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer problemId = WebUtils.parseInt(req.getParameter("problemId"),0);
        Problem problem = problemService.getProblemById(problemId);
        req.setAttribute("problem",problem);
        String[] option = problem.getOptions().split(",");
        req.setAttribute("option",option);
        req.getRequestDispatcher("/pages/problem/problem_describe.jsp");
    }

    protected void ajaxShowProblemDescribe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer problemId = WebUtils.parseInt(req.getParameter("problemId"),0);
        Problem problem = problemService.getProblemById(problemId);
        String[] option = problem.getOptions().split(",");
        String[] answers = problem.getAnswer().split(",");
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("selectProblem",problem);
        resultMap.put("selectOptions",option);
        resultMap.put("selectAnswer",answers);
        Gson gson = new Gson();
        resp.getWriter().write(gson.toJson(resultMap));
    }

    protected void showProblemDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer problemId = WebUtils.parseInt(req.getParameter("problemId"),0);
        Problem problemById = problemService.getProblemById(problemId);
        String[] option = problemById.getOptions().split(",");
        String[] answers = problemById.getAnswer().split(",");
        req.setAttribute("problemById",problemById);
        req.setAttribute("options",option);
        req.setAttribute("answer",answers);
        req.getRequestDispatcher("/pages/problem/problem_details.jsp").forward(req,resp);
    }
}
