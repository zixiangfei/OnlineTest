package com.onlineTest.test;

import com.onlineTest.dao.RecordDao;
import com.onlineTest.dao.impl.RecordDaoImpl;
import org.junit.Test;

import static org.junit.Assert.*;

public class RecordDaoImplTest {

    RecordDao recordDao = new RecordDaoImpl();

    @Test
    public void queryByTestId() {
        System.out.println(recordDao.queryByTestId(3));
    }
}