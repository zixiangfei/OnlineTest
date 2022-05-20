package com.onlineTest.api;

import com.onlineTest.pojo.*;
import com.onlineTest.pojo.Record;
import com.onlineTest.service.*;
import com.onlineTest.service.impl.*;
import com.onlineTest.utils.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RankApi extends BaseApi {
    StudentService studentService = new StudentServiceImpl();
    TestService testService = new TestServiceImpl();
    RecordService recordService = new RecordServiceImpl();
    RankService rankService = new RankServiceImpl();
    ProblemService problemService = new ProblemServiceImpl();

    protected void showRankDetails(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer testId = WebUtils.parseInt(req.getParameter("testId"), 0);
        Test test = testService.getTestById(testId);
        List<Student> studentList = studentService.getStudentListByClassId(test.getClassId());
        List<Record> recordList = recordService.getRecordByTestId(testId);
        List<Problem> problemList = new ArrayList<>();
        List<RankItem> rankItemList = rankService.getRankListByTestId(testId);
        String[] split = test.getProblems().split(",");
        for (String s : split) {
            if (s == null || s.equals("")) {
                continue;
            }
            problemList.add(problemService.getProblemById(WebUtils.parseInt(s, 0)));
        }
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("studentList", studentList);
        resultMap.put("recordList", recordList);
        resultMap.put("rankItemList", rankItemList);
        resultMap.put("problemList", problemList);
        WebUtils.writeJSONString(resp, resultMap);
    }
}
