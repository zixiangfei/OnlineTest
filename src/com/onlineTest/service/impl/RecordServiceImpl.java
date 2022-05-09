package com.onlineTest.service.impl;

import com.onlineTest.dao.RecordDao;
import com.onlineTest.dao.impl.RecordDaoImpl;
import com.onlineTest.pojo.Record;
import com.onlineTest.service.RecordService;

import java.util.List;

public class RecordServiceImpl implements RecordService {

    RecordDao recordDao = new RecordDaoImpl();

    @Override
    public void submitRecord(Record record) {
        recordDao.saveRecord(record);
    }

    @Override
    public Boolean existsRecord(Integer studentId, Integer testId, Integer problemId) {
        Record record = recordDao.queryByStudentIdAndTestIdAndProblemId(studentId,testId,problemId);
        return record != null;
    }

    @Override
    public List<Record> getRecordByTestId(Integer testId) {
        return recordDao.queryByTestId(testId);
    }

    @Override
    public Record getRecordByStudentIdAndTestIdAndProblemId(Integer studentId, Integer testId, Integer problemId) {
        return  recordDao.queryByStudentIdAndTestIdAndProblemId(studentId,testId,problemId);
    }

    @Override
    public void resetProblem(Integer studentId, Integer testId, Integer problemId) {
        recordDao.deleteByStudentIdAndTestIdAndProblemId(studentId,testId,problemId);
    }
}
