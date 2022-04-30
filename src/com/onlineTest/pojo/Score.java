package com.onlineTest.pojo;

public class Score {
    private Integer id;
    private Integer studentId;
    private Integer score;
    private Integer testId;

    public Score() {
    }

    public Score(Integer id, Integer studentId, Integer score, Integer testId) {
        this.id = id;
        this.studentId = studentId;
        this.score = score;
        this.testId = testId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Integer getTestId() {
        return testId;
    }

    public void setTestId(Integer testId) {
        this.testId = testId;
    }

    @Override
    public String toString() {
        return "Score{" +
                "id=" + id +
                ", studentId=" + studentId +
                ", score=" + score +
                ", testId=" + testId +
                '}';
    }
}
