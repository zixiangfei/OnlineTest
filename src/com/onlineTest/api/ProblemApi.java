package com.onlineTest.api;

import com.onlineTest.common.Result;
import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Problem;
import com.onlineTest.service.ProblemService;
import com.onlineTest.service.impl.ProblemServiceImpl;
import com.onlineTest.utils.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProblemApi extends BaseApi {
    ProblemService problemService = new ProblemServiceImpl();

    protected void pageProblem(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);
        Page<Problem> page = problemService.page(pageNo, pageSize);
        page.setType("problem");
        page.setUrl("problemServlet?action=pageProblem");
        WebUtils.writeJSONString(resp, Result.success(page));
    }

    protected void createProblem(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String type = req.getParameter("type");
        Integer subjectId = WebUtils.parseInt(req.getParameter("subject"), 0);
        String describe = req.getParameter("describe");
        String analysis = req.getParameter("analysis");
        String optionA = req.getParameter("optionA");
        String optionB = req.getParameter("optionB");
        String optionC = req.getParameter("optionC");
        String optionD = req.getParameter("optionD");
        String options = optionA + "," + optionB + "," + optionC + "," + optionD;
        StringBuilder answer = new StringBuilder();
        if ("单选".equals(type)) {
            answer.append(req.getParameter("single"));
        }
        if ("多选".equals(type)) {
            String[] muti = req.getParameterValues("muti");
            for (int i = 0; i < muti.length; ++i) {
                if (i != 0) {
                    answer.append(",");
                }
                answer.append(muti[i]);
            }
        }
        if ("判断".equals(type)) {
            answer.append(req.getParameter("bool"));
        }
        Problem problem = new Problem(null, describe, answer.toString(), subjectId, analysis, options, 0, 0, type);
        problemService.saveProblem(problem);
        WebUtils.writeJSONString(resp, Result.success(null));
    }
}
