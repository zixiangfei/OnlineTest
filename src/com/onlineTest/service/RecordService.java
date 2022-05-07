package com.onlineTest.service;

import com.onlineTest.pojo.Record;

import java.util.List;

public interface RecordService {
    List<Record> getRecordByTestId(Integer testId);
}
