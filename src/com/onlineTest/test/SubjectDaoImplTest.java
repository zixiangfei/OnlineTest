package com.onlineTest.test;

import com.onlineTest.dao.SubjectDao;
import com.onlineTest.dao.impl.SubjectDaoImpl;
import org.junit.Test;

import static org.junit.Assert.*;

public class SubjectDaoImplTest {

    SubjectDao subjectDao = new SubjectDaoImpl();

    @Test
    public void queryAllSubject() {
        System.out.println(subjectDao.queryAllSubject());
    }
}