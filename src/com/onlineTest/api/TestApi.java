package com.onlineTest.api;

import com.onlineTest.common.Result;
import com.onlineTest.pojo.*;
import com.onlineTest.pojo.Record;
import com.onlineTest.service.ProblemService;
import com.onlineTest.service.RankService;
import com.onlineTest.service.RecordService;
import com.onlineTest.service.TestService;
import com.onlineTest.service.impl.ProblemServiceImpl;
import com.onlineTest.service.impl.RankServiceImpl;
import com.onlineTest.service.impl.RecordServiceImpl;
import com.onlineTest.service.impl.TestServiceImpl;
import com.onlineTest.utils.DateUtils;
import com.onlineTest.utils.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TestApi extends BaseApi {

    TestService testService = new TestServiceImpl();
    RecordService recordService = new RecordServiceImpl();
    ProblemService problemService = new ProblemServiceImpl();
    RankService rankService = new RankServiceImpl();


    protected void ping(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.getWriter().write(WebUtils.getJSONString(Result.success("pong")));
    }


    protected void addNewContest(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String contestStartTimeStr = req.getParameter("testStartTime");
        Integer classId = WebUtils.parseInt(req.getParameter("classId"), 0);
        String lengthTimeStr = req.getParameter("testLength");
        String testName = req.getParameter("testName");
        String contestLengthTimeStr = "1970-01-01 " + lengthTimeStr;
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Timestamp startTimestamp = DateUtils.stringToTimestamp(contestStartTimeStr, format);
        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Timestamp lengthTimestamp = DateUtils.stringToTimestamp(contestLengthTimeStr, format1);
        int lengthTime = Math.toIntExact(lengthTimestamp.getTime() + 28800000);
        String[] addProblemIds = req.getParameterValues("addProblemId");
        StringBuilder problemIds = new StringBuilder();
        for (String addProblemId : addProblemIds) {
            problemIds.append(addProblemId);
            problemIds.append(",");
        }
        Test test = new Test(null, testName, lengthTime, startTimestamp, problemIds.toString(), classId);
        testService.addNewContest(test);
        WebUtils.writeJSONString(resp, Result.success(null));
    }


    protected void showTestDetails(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer testId = WebUtils.parseInt(req.getParameter("testId"), 0);
        Test test = testService.getTestById(testId);
        List<Problem> testProblemList = new ArrayList<Problem>();
        String[] split = test.getProblems().split(",");
        List<Record> recordList = recordService.getRecordByTestId(testId);
        List<ProblemStatus> testProblemStatusList = new ArrayList<>();
        for (String s : split) {
            if (s == null || s.equals("")) {
                continue;
            }
            testProblemList.add(problemService.getProblemById(WebUtils.parseInt(s, 0)));
        }
        for (Problem problem : testProblemList) {
            int correct = 0;
            int total = 0;
            for (Record record : recordList) {
                if (record.getProblemId().equals(problem.getId())) {
                    total++;
                    if (record.getCorrect() == 1) {
                        correct++;
                    }
                }
            }
            testProblemStatusList.add(new ProblemStatus(problem.getId(), correct, total));
        }
        List<RankItem> rankItemList = rankService.getRankListByTestId(testId);
        Map<String, Object> map = new HashMap<>();
        map.put("testProblemStatusList", testProblemStatusList);
        map.put("recordList", recordList);
        map.put("curTest", test);
        map.put("startTime",test.getStartTime().getTime());
        map.put("testProblemList", testProblemList);
        map.put("rankItemList", rankItemList);
        WebUtils.writeJSONString(resp, Result.success(map));
    }
}
