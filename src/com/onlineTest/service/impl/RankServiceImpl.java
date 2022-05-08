package com.onlineTest.service.impl;

import com.onlineTest.dao.RankDao;
import com.onlineTest.dao.impl.RankDaoImpl;
import com.onlineTest.pojo.RankItem;
import com.onlineTest.service.RankService;

import java.util.List;

public class RankServiceImpl implements RankService {

    RankDao rankDao = new RankDaoImpl();

    @Override
    public List<RankItem> getRankListByTestId(Integer testId) {
        return rankDao.queryRankListByTestId(testId);
    }
}
