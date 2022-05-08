package com.onlineTest.test;

import com.onlineTest.dao.RankDao;
import com.onlineTest.dao.impl.RankDaoImpl;
import org.junit.Test;

import static org.junit.Assert.*;

public class RankDaoImplTest {

    RankDao rankDao = new RankDaoImpl();

    @Test
    public void queryRankListByTestId() {
        System.out.println(rankDao.queryRankListByTestId(3));
    }
}