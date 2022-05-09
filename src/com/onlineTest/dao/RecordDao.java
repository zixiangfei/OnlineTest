package com.onlineTest.dao;

import com.onlineTest.pojo.Record;

import java.util.List;

public interface RecordDao {
    List<Record> queryByTestId(Integer testId);

    void saveRecord(Record record);

    Record queryByStudentIdAndTestIdAndProblemId(Integer studentId, Integer testId, Integer problemId);

    void deleteByStudentIdAndTestIdAndProblemId(Integer studentId, Integer testId, Integer problemId);
}
