package com.onlineTest.test;

import com.onlineTest.service.SubjectService;
import com.onlineTest.service.impl.SubjectServiceImpl;
import org.junit.Test;

import static org.junit.Assert.*;

public class SubjectServiceImplTest {

    SubjectService subjectService = new SubjectServiceImpl();

    @Test
    public void existsSubjectName() {
        System.out.println(subjectService.existsSubjectName("编译原理"));
    }
}