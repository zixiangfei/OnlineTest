package com.onlineTest.web;

import com.google.gson.Gson;
import com.onlineTest.pojo.*;
import com.onlineTest.pojo.Record;
import com.onlineTest.service.*;
import com.onlineTest.service.impl.*;
import com.onlineTest.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.IOException;
import java.util.*;
import java.util.List;

public class RankServlet extends BaseServlet{

    StudentService studentService = new StudentServiceImpl();
    TestService testService = new TestServiceImpl();
    RecordService recordService = new RecordServiceImpl();
    RankService rankService = new RankServiceImpl();
    ProblemService problemService = new ProblemServiceImpl();

    protected void showRankDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer testId = WebUtils.parseInt(req.getParameter("testId"),0);
        Test test = testService.getTestById(testId);

        List<Student> studentList = studentService.getStudentListByClassId(test.getClassId());
        List<Record> recordList = recordService.getRecordByTestId(testId);
        List<Problem> problemList = new ArrayList<>();
        List<RankItem> rankItemList = rankService.getRankListByTestId(testId);

        String[] split = test.getProblems().split(",");
        for (String s : split) {
            if(s==null||s.equals("")) {
                continue;
            }
            problemList.add(problemService.getProblemById(WebUtils.parseInt(s,0)));
        }

        Map<String,Object> resultMap = new HashMap<>();

        resultMap.put("studentList",studentList);
        resultMap.put("recordList",recordList);
        resultMap.put("rankItemList",rankItemList);
        resultMap.put("problemList",problemList);

        Gson gson = new Gson();

        resp.getWriter().write(gson.toJson(resultMap));

    }
}
