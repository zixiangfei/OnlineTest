package com.onlineTest.service.impl;

import com.onlineTest.dao.RecordDao;
import com.onlineTest.dao.impl.RecordDaoImpl;
import com.onlineTest.pojo.Record;
import com.onlineTest.service.RecordService;

import java.util.List;

public class RecordServiceImpl implements RecordService {

    RecordDao recordDao = new RecordDaoImpl();

    @Override
    public List<Record> getRecordByTestId(Integer testId) {
        return recordDao.queryByTestId(testId);
    }
}
