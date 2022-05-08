package com.onlineTest.dao.impl;

import com.onlineTest.dao.RankDao;
import com.onlineTest.pojo.RankItem;

import java.util.List;

public class RankDaoImpl extends BaseDao implements RankDao {
    @Override
    public List<RankItem> queryRankListByTestId(Integer testId) {
        String sql = "select studentId,count(*) as score from records where testId = ? and correct = 1 group by studentId order by  score desc";
        return queryForList(RankItem.class,sql,testId);
    }
}
