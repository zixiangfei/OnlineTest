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
}
