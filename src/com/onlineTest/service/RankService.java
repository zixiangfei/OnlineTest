package com.onlineTest.service;

import com.onlineTest.pojo.RankItem;

import java.util.List;

public interface RankService {
    List<RankItem> getRankListByTestId(Integer testId);
}
