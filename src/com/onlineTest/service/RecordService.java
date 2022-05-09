package com.onlineTest.service;

import com.onlineTest.pojo.Record;

import java.util.List;

public interface RecordService {
    List<Record> getRecordByTestId(Integer testId);

    void submitRecord(Record record);

    Boolean existsRecord(Integer studentId, Integer testId, Integer problemId);

    Record getRecordByStudentIdAndTestIdAndProblemId(Integer studentId, Integer testId, Integer problemId);

    void resetProblem(Integer studentId, Integer testId, Integer problemId);
}
