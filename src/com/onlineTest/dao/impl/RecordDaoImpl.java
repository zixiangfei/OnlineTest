package com.onlineTest.dao.impl;

import com.onlineTest.dao.RecordDao;
import com.onlineTest.pojo.Record;

import java.util.List;

public class RecordDaoImpl extends BaseDao implements RecordDao {
    @Override
    public List<Record> queryByTestId(Integer testId) {
        String sql = "select * from records where testId = ?";
        return queryForList(Record.class,sql,testId);
    }

    @Override
    public void saveRecord(Record record) {
        String sql = "insert into records(`studentId`,`record`,`testId`,`problemId`,`correct`) values(?, ?, ?, ?, ?)";
        update(sql,record.getStudentId(),record.getRecord(),record.getTestId(),record.getProblemId(),record.getCorrect());
    }

    @Override
    public Record queryByStudentIdAndTestIdAndProblemId(Integer studentId, Integer testId, Integer problemId) {
        String sql = "select * from records where studentId = ? and testId = ? and problemId = ?";
        return queryForOne(Record.class,sql,studentId,testId,problemId);
    }

    @Override
    public void deleteByStudentIdAndTestIdAndProblemId(Integer studentId, Integer testId, Integer problemId) {
        String sql = "delete from records where studentId = ? and testId = ? and problemId = ?";
        update(sql,studentId,testId,problemId);
    }
}
