package com.onlineTest.dao.impl;

import com.onlineTest.dao.ProblemDao;
import com.onlineTest.pojo.Problem;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.List;

public class ProblemDaoImpl extends BaseDao implements ProblemDao {
    protected final Log log = LogFactory.getLog(getClass());
    @Override
    public Integer queryForPageTotalCount() {
        String sql = "select count(*) from problems";
        Number count = (Number) queryForSingleValue(sql);
        return count.intValue();
    }

    @Override
    public List<Problem> queryForPageItems(Integer begin, Integer pageSize) {
        String sql = "select * from problems limit ?, ?";
        return queryForList(Problem.class,sql,begin,pageSize);
    }

    @Override
    public Integer saveProblem(Problem problem) {
        String sql = "insert into problems(`describe`,`answer`,`subjectId`,`analysis`,`options`,`correct`,`wrong`,`type`) values(?, ?, ?, ?, ?, ?, ?, ?)";
        return update(sql,problem.getDescribe(),problem.getAnswer(),problem.getSubjectId(),problem.getAnalysis(),problem.getOptions(),problem.getCorrect(),problem.getWrong(),problem.getType());
    }

    @Override
    public Problem queryById(Integer problemId) {
        String sql = "select * from problems where id = ?";
        return queryForOne(Problem.class,sql,problemId);
    }

    @Override
    public Integer queryForPageTotalCountByParameter(Integer subjectId, String describe, String type) {
        String sql = "select count(*) from problems ";
        int cnt=0,kind=0;
        if(subjectId!=0) {
            if(cnt==0) {
                sql += "where";
            }
            cnt++;
            kind += 4;
            sql += " subjectId = "+subjectId+" ";
        }
        if(!"所有".equals(type)) {
            if(cnt==0) {
                sql += "where";
            }
            else {
                sql += "and";
            }
            cnt++;
            kind+=2;
            sql += " type = '"+type+"' ";
        }

        if(describe!=null&&!"".equals(describe)) {
            if(cnt==0) {
                sql += "where";
            }
            else {
                sql += "and";
            }
            cnt++;
            kind++;
            sql += " `describe` like '%"+describe+"%' ";
        }
        Number count = (Number) queryForSingleValue(sql);
        log.debug(sql);
        return count.intValue();
    }

    @Override
    public List<Problem> queryForPageItemsByParameter(Integer begin, Integer pageSize, Integer subjectId, String describe, String type) {
        String sql = "select * from problems ";
        int cnt=0,kind=0;
        if(subjectId!=0) {
            if(cnt==0) {
                sql += "where";
            }
            cnt++;
            kind += 4;
            sql += " subjectId = "+subjectId+" ";
        }
        if(!"所有".equals(type)) {
            if(cnt==0) {
                sql += "where";
            }
            else {
                sql += "and";
            }
            cnt++;
            kind+=2;
            sql += " type = '"+type+"' ";
        }

        if(describe!=null&&!"".equals(describe)) {
            if(cnt==0) {
                sql += "where";
            }
            else {
                sql += "and";
            }
            cnt++;
            kind++;
            sql += " `describe` like '%"+describe+"%' ";
        }
        sql += " limit ?, ?";
        log.debug(sql);
        return queryForList(Problem.class,sql,begin,pageSize);
    }

    @Override
    public void updateProblemById(Problem problem) {
        String sql = "update problems set `describe` = ? , `subjectId` = ? , `analysis` = ? , `options` = ? , `type`  = ? where id = ?";
        update(sql,problem.getDescribe(),problem.getSubjectId(),problem.getAnalysis(),problem.getOptions(),problem.getType(),problem.getId());
    }

    @Override
    public List<Problem> getAllProblems() {
        String sql = "select * from problems";
        return queryForList(Problem.class, sql);
    }
}

