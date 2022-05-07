package com.onlineTest.web;

import com.google.gson.Gson;
import com.onlineTest.pojo.*;
import com.onlineTest.pojo.Record;
import com.onlineTest.service.*;
import com.onlineTest.service.impl.*;
import com.onlineTest.utils.DateUtils;
import com.onlineTest.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class TestServlet  extends BaseServlet{

    ProblemService problemService = new ProblemServiceImpl();
    TeacherService teacherService = new TeacherServiceImpl();
    SubjectService subjectService = new SubjectServiceImpl();
    TestService testService = new TestServiceImpl();
    RecordService recordService = new RecordServiceImpl();

    protected void addProblemToContest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer problemId = WebUtils.parseInt(req.getParameter("problemId"),0);

        Problem problem = problemService.getProblemById(problemId);

        List<Problem> addProblemList = (List<Problem>) req.getSession().getAttribute("addProblemList");
        if(addProblemList==null) {
            addProblemList = new ArrayList<Problem>();
            req.getSession().setAttribute("addProblemList",addProblemList);
        }
        Boolean flag = false;
        for (Problem problem1 : addProblemList) {
            if(problem1.getId().equals(problemId)) {
                flag = true;
            }
        }
        if(flag) {
            req.getSession().setAttribute("addMsg","已经添加过第"+problemId+"个题目！");
        }
        else {

            addProblemList.add(problem);
            req.getSession().setAttribute("addMsg","已将第"+problemId+"个题目加入考试,现在已有"+addProblemList.size()+"个题目!");
        }
        req.getSession().setAttribute("addProblemList",addProblemList);

        resp.sendRedirect(req.getHeader("Referer"));
    }

    protected void ajaxGetProblemToTest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Problem> addProblemList =(List<Problem>) req.getSession().getAttribute("addProblemList");
        if(addProblemList==null) {
            addProblemList = new ArrayList<Problem>();
            req.getSession().setAttribute("addProblemList",addProblemList);
        }
        List<Subject> subjects = subjectService.allSubject();
        Map<String,Object> resultMap = new HashMap<String, Object>();
        resultMap.put("addProblemList",addProblemList);
        resultMap.put("subjects",subjects);
        Gson gson = new Gson();
        resp.getWriter().write(gson.toJson(resultMap));
    }

    protected void ajaxClearAddProblem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Problem> addProblemList =(List<Problem>) req.getSession().getAttribute("addProblemList");
        if(addProblemList==null) {
            addProblemList = new ArrayList<Problem>();
            req.getSession().setAttribute("addProblemList",addProblemList);
        }
        List<Subject> subjects = subjectService.allSubject();
        addProblemList.clear();
        Map<String,Object> resultMap = new HashMap<String, Object>();
        resultMap.put("addProblemList",addProblemList);
        resultMap.put("subjects",subjects);
        Gson gson = new Gson();
        resp.getWriter().write(gson.toJson(resultMap));
    }

    protected void ajaxRemoveAddProblem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer removeProblemId = WebUtils.parseInt(req.getParameter("addProblemId"),0);
        List<Problem> addProblemList =(List<Problem>) req.getSession().getAttribute("addProblemList");
        if(addProblemList==null) {
            addProblemList = new ArrayList<Problem>();
            req.getSession().setAttribute("addProblemList",addProblemList);
        }
        for (Problem problem : addProblemList) {
            if(problem.getId().equals(removeProblemId)) {
                addProblemList.remove(problem);
            }
        }
        List<Subject> subjects = subjectService.allSubject();
        Map<String,Object> resultMap = new HashMap<String, Object>();
        resultMap.put("addProblemList",addProblemList);
        resultMap.put("subjects",subjects);
        Gson gson = new Gson();
        resp.getWriter().write(gson.toJson(resultMap));
    }

    protected void clearAddProblem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Problem> addProblemList =(List<Problem>) req.getSession().getAttribute("addProblemList");
        Integer classId = WebUtils.parseInt(req.getParameter("classId"),0);
        if(addProblemList==null) {
            addProblemList = new ArrayList<Problem>();
            req.getSession().setAttribute("addProblemList",addProblemList);
        }
        List<Subject> subjects = subjectService.allSubject();
        addProblemList.clear();
        req.getRequestDispatcher("/classServlet?action=showClassDetails&classId="+classId).forward(req,resp);

    }

    protected void removeAddProblem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer classId = WebUtils.parseInt(req.getParameter("classId"),0);
        Integer removeProblemId = WebUtils.parseInt(req.getParameter("addProblemId"),0);
        List<Problem> addProblemList =(List<Problem>) req.getSession().getAttribute("addProblemList");
        if(addProblemList==null) {
            addProblemList = new ArrayList<Problem>();
            req.getSession().setAttribute("addProblemList",addProblemList);
        }
        Iterator<Problem> iterator = addProblemList.iterator();
        while(iterator.hasNext()) {
            Problem problem = iterator.next();
            if(removeProblemId.equals(problem.getId())) {
                iterator.remove();
            }
        }
        List<Subject> subjects = subjectService.allSubject();
        req.getRequestDispatcher("/classServlet?action=showClassDetails&classId="+classId).forward(req,resp);
    }

    protected void addNewContest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String contestStartTimeStr = req.getParameter("testStartTime");
        Integer classId = WebUtils.parseInt(req.getParameter("classId"),0);
        String lengthTimeStr = req.getParameter("testLength");
        String testName = req.getParameter("testName");
        String contestLengthTimeStr = "1970-01-01 "+lengthTimeStr;
//        System.out.println(contestStartTimeStr);
//        System.out.println(classId);
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Timestamp startTimestamp = DateUtils.stringToTimestamp(contestStartTimeStr,format);
//        System.out.println(startTimestamp);
        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Timestamp lengthTimestamp = DateUtils.stringToTimestamp(contestLengthTimeStr,format1);
//        System.out.println(lengthTimestamp);
//        System.out.println(startTimestamp.getTime());
//        System.out.println(lengthTimestamp.getTime());
        Integer lengthTime = Math.toIntExact(lengthTimestamp.getTime() + 28800000);
        Timestamp endTimestamp = new Timestamp(startTimestamp.getTime()+lengthTime);
//        System.out.println(endTimestamp);
        String[] addProblemIds = req.getParameterValues("addProblemId");
        StringBuilder problemIds = new StringBuilder();
        for (String addProblemId : addProblemIds) {
            problemIds.append(addProblemId);
            problemIds.append(",");
        }
        Test test = new Test(null,testName,lengthTime,startTimestamp,problemIds.toString(),classId);
        System.out.println(test);
        testService.addNewContest(test);

        resp.sendRedirect(req.getContextPath()+"/classServlet?action=showClassDetails&type=0&classId="+classId);
    }

    protected void showTestDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer testId = WebUtils.parseInt(req.getParameter("testId"),0);
        Test test = testService.getTestById(testId);
        List<Problem> testProblemList = new ArrayList<Problem>();
        String[] split = test.getProblems().split(",");
        List<Record> recordList = recordService.getRecordByTestId(testId);
        List<ProblemStatus> testProblemStatuseList = new ArrayList<>();
        for (String s : split) {
            if(s==null||s.equals("")) {
                continue;
            }
            testProblemList.add(problemService.getProblemById(WebUtils.parseInt(s,0)));
        }
        for (Problem problem : testProblemList) {
            int correct = 0;
            int total = 0;
            for (Record record : recordList) {
                if(record.getProblemId().equals(problem.getId())) {
                    total++;
                    if(record.getCorrect()==1) {
                        correct++;
                    }
                }
            }
            testProblemStatuseList.add(new ProblemStatus(problem.getId(),correct,total));
        }
        req.setAttribute("testProblemStatusList",testProblemStatuseList);
        req.setAttribute("testRecordList",recordList);
        req.setAttribute("curTest",test);
        req.setAttribute("testProblemList",testProblemList);
        req.getRequestDispatcher("/pages/contest/contests-header.jsp").forward(req,resp);
    }
}
