package com.onlineTest.web;

import com.google.gson.Gson;
import com.onlineTest.pojo.Problem;
import com.onlineTest.pojo.Record;
import com.onlineTest.service.ProblemService;
import com.onlineTest.service.RecordService;
import com.onlineTest.service.impl.ProblemServiceImpl;
import com.onlineTest.service.impl.RecordServiceImpl;
import com.onlineTest.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class RecordServlet extends BaseServlet{

    ProblemService problemService = new ProblemServiceImpl();
    RecordService recordService = new RecordServiceImpl();

    protected void submitRecord(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer studentId = WebUtils.parseInt(req.getParameter("submitStudentId"),0);
        Integer testId = WebUtils.parseInt(req.getParameter("submitTestId"),0);
        Integer problemId = WebUtils.parseInt(req.getParameter("submitProblemId"),0);
        int correct = 0;
        String[] submitOptions = req.getParameterValues("submitOption");
        StringBuilder recordStr = new StringBuilder();
        for(int i=0;i<submitOptions.length;++i) {
            if(i!=0) {
                recordStr.append(",");
            }
            recordStr.append(submitOptions[i]);
        }
        Problem problemById = problemService.getProblemById(problemId);
        if(problemById.getAnswer().equals(recordStr.toString())) {
            correct = 1;
        }
        recordService.submitRecord(new Record(null,studentId,recordStr.toString(),testId,problemId,correct));
        resp.sendRedirect(req.getHeader("Referer"));
    }

    protected void ajaxExistsRecord(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer studentId = WebUtils.parseInt(req.getParameter("submitStudentId"),0);
        Integer testId = WebUtils.parseInt(req.getParameter("submitTestId"),0);
        Integer problemId = WebUtils.parseInt(req.getParameter("submitProblemId"),0);
        Boolean existsRecord = recordService.existsRecord(studentId,testId,problemId);
        Problem problemById = problemService.getProblemById(problemId);
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("existsRecord",existsRecord);
        resultMap.put("problemById",problemById);
        Record nowRecord  = recordService.getRecordByStudentIdAndTestIdAndProblemId(studentId,testId,problemId);
        if(nowRecord!=null) {
            resultMap.put("correct",nowRecord.getCorrect());
        }
        Gson gson = new Gson();
        resp.getWriter().write(gson.toJson(resultMap));
    }

    protected void resetProblem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer studentId = WebUtils.parseInt(req.getParameter("submitStudentId"),0);
        Integer testId = WebUtils.parseInt(req.getParameter("submitTestId"),0);
        Integer problemId = WebUtils.parseInt(req.getParameter("submitProblemId"),0);
        recordService.resetProblem(studentId,testId,problemId);
        resp.sendRedirect(req.getHeader("Referer"));
    }
}
