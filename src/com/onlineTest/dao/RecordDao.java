package com.onlineTest.dao;

import com.onlineTest.pojo.Record;

import java.util.List;

public interface RecordDao {
    List<Record> queryByTestId(Integer testId);
}
