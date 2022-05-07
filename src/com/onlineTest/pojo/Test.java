package com.onlineTest.pojo;

import java.sql.Timestamp;
import java.util.Date;

public class Test {
    private Integer id;
    private String name;
    private Integer time;
    private Timestamp startTime;
    private String problems;
    private Integer classId;
    private String length;
    private Timestamp endTime;
    private String beginTime;
    private String endTimeStr;

    public String getBeginTime() {
        return startTime.toString();
    }

    public String getEndTimeStr() {
        return getEndTime().toString();
    }

    public void setEndTimeStr(String endTimeStr) {
        this.endTimeStr = endTimeStr;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public Timestamp getEndTime() {
        return new Timestamp(startTime.getTime()+time);
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public String getLength() {
        int curTime = time / 1000;
        int hour = curTime/(60*60);
        int mins = curTime%3600/60;
        int secs = curTime%60;
        return ""+hour+":"+mins+":"+secs;
    }

    public void setLength(String length) {
        this.length = length;
    }

    public Test() {
    }

    @Override
    public String toString() {
        return "Test{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", time=" + time +
                ", startTime=" + startTime +
                ", problems='" + problems + '\'' +
                ", classId=" + classId +
                ", length='" + length + '\'' +
                ", endTime=" + endTime +
                '}';
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Test(Integer id, String name, Integer time, Timestamp startTime, String problems, Integer classId) {
        this.id = id;
        this.name = name;
        this.time = time;
        this.startTime = startTime;
        this.problems = problems;
        this.classId = classId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    public String getProblems() {
        return problems;
    }

    public void setProblems(String problems) {
        this.problems = problems;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

}
