package com.onlineTest.dao;

import com.onlineTest.pojo.RankItem;

import java.util.List;

public interface RankDao {
    List<RankItem> queryRankListByTestId(Integer testId);
}
