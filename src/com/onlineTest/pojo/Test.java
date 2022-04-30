package com.onlineTest.pojo;

import java.util.Date;

public class Test {
    private Integer id;
    private String name;
    private Integer time;
    private Date endTime;

    public Test() {
    }

    public Test(Integer id, String name, Integer time, Date endTime) {
        this.id = id;
        this.name = name;
        this.time = time;
        this.endTime = endTime;
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

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "Test{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", time=" + time +
                ", endTime=" + endTime +
                '}';
    }
}
