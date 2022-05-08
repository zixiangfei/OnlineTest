package com.onlineTest.test;

import com.onlineTest.service.RecordService;
import com.onlineTest.service.impl.RecordServiceImpl;
import org.junit.Test;

import static org.junit.Assert.*;

public class RecordServiceImplTest {

    RecordService recordService = new RecordServiceImpl();

    @Test
    public void existsRecord() {
        System.out.println(recordService.existsRecord(7,3,2));
    }
}