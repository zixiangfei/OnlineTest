package com.onlineTest.api;

import com.onlineTest.common.Result;
import com.onlineTest.pojo.Problem;
import com.onlineTest.pojo.Record;
import com.onlineTest.service.ProblemService;
import com.onlineTest.service.RecordService;
import com.onlineTest.service.impl.ProblemServiceImpl;
import com.onlineTest.service.impl.RecordServiceImpl;
import com.onlineTest.utils.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RecordApi extends BaseApi {
    ProblemService problemService = new ProblemServiceImpl();
    RecordService recordService = new RecordServiceImpl();

    protected void getProblemIds(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer studentId = WebUtils.parseInt(req.getParameter("studentId"), 0);
        Integer correct = WebUtils.parseInt(req.getParameter("correct"), 0);
        List<Record> problemIds = recordService.getProblemIds(studentId, correct);
        WebUtils.writeJSONString(resp, Result.success(problemIds));
    }

    protected void submitRecord(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer studentId = WebUtils.parseInt(req.getParameter("submitStudentId"), 0);
        Integer testId = WebUtils.parseInt(req.getParameter("submitTestId"), 0);
        Integer problemId = WebUtils.parseInt(req.getParameter("submitProblemId"), 0);
        int correct = 0;
        String[] submitOptions = req.getParameterValues("submitOption");
        StringBuilder recordStr = new StringBuilder();
        for (int i = 0; i < submitOptions.length; ++i) {
            if (i != 0) {
                recordStr.append(",");
            }
            recordStr.append(submitOptions[i]);
        }
        Problem problemById = problemService.getProblemById(problemId);
        if (problemById.getAnswer().equals(recordStr.toString())) {
            correct = 1;
        }
        recordService.submitRecord(new Record(null, studentId, recordStr.toString(), testId, problemId, correct));
        WebUtils.writeJSONString(resp, Result.success(null));
    }

    protected void existsRecord(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer studentId = WebUtils.parseInt(req.getParameter("submitStudentId"), 0);
        Integer testId = WebUtils.parseInt(req.getParameter("submitTestId"), 0);
        Integer problemId = WebUtils.parseInt(req.getParameter("submitProblemId"), 0);
        Boolean existsRecord = recordService.existsRecord(studentId, testId, problemId);
        Problem problemById = problemService.getProblemById(problemId);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("existsRecord", existsRecord);
        resultMap.put("problemById", problemById);
        Record nowRecord = recordService.getRecordByStudentIdAndTestIdAndProblemId(studentId, testId, problemId);
        if (nowRecord != null) {
            resultMap.put("correct", nowRecord.getCorrect());
        }
        WebUtils.writeJSONString(resp, Result.success(resultMap));
    }

    protected void resetProblem(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer studentId = WebUtils.parseInt(req.getParameter("submitStudentId"), 0);
        Integer testId = WebUtils.parseInt(req.getParameter("submitTestId"), 0);
        Integer problemId = WebUtils.parseInt(req.getParameter("submitProblemId"), 0);
        recordService.resetProblem(studentId, testId, problemId);
        WebUtils.writeJSONString(resp, Result.success(null));
    }
}
