package com.onlineTest.pojo;

public class ProblemStatus {
    private Integer problemId;
    private Integer correct;
    private Integer total;

    @Override
    public String toString() {
        return "ProblemStatus{" +
                "problemId=" + problemId +
                ", correct=" + correct +
                ", total=" + total +
                '}';
    }

    public Integer getProblemId() {
        return problemId;
    }

    public void setProblemId(Integer problemId) {
        this.problemId = problemId;
    }

    public Integer getCorrect() {
        return correct;
    }

    public void setCorrect(Integer correct) {
        this.correct = correct;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public ProblemStatus(Integer problemId, Integer correct, Integer total) {
        this.problemId = problemId;
        this.correct = correct;
        this.total = total;
    }

    public ProblemStatus() {
    }
}
