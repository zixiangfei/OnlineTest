package com.onlineTest.pojo;

public class RankItem {
    Integer studentId;
    Integer score;

    public RankItem() {
    }

    public RankItem(Integer studentId, Integer score) {
        this.studentId = studentId;
        this.score = score;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "RankItem{" +
                "studentId=" + studentId +
                ", score=" + score +
                '}';
    }
}
