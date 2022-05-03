package com.onlineTest.pojo;

import java.util.Date;

public class Test {
    private Integer id;
    private String name;
    private Integer time;
    private Date startTime;
    private String problems;
    private Integer classId;

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
                '}';
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

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
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

    public Test(Integer id, String name, Integer time, Date startTime, String problems, Integer classId) {
        this.id = id;
        this.name = name;
        this.time = time;
        this.startTime = startTime;
        this.problems = problems;
        this.classId = classId;
    }
}
