package com.onlineTest.pojo;

public class Record {
    private Integer id;
    private Integer studentId;
    private String record;
    private Integer testId;
    private Integer problemId;
    private Integer correct;

    public Record() {
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

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record;
    }

    public Integer getTestId() {
        return testId;
    }

    public void setTestId(Integer testId) {
        this.testId = testId;
    }

    public Integer getProblemId() {
        return problemId;
    }

    public void setProblemId(Integer problemId) {
        this.problemId = problemId;
    }

    public Record(Integer id, Integer studentId, String record, Integer testId, Integer problemId, Integer correct) {
        this.id = id;
        this.studentId = studentId;
        this.record = record;
        this.testId = testId;
        this.problemId = problemId;
        this.correct = correct;
    }

    @Override
    public String toString() {
        return "Record{" +
                "id=" + id +
                ", studentId=" + studentId +
                ", record='" + record + '\'' +
                ", testId=" + testId +
                ", problemId=" + problemId +
                ", correct=" + correct +
                '}';
    }

    public Integer getCorrect() {
        return correct;
    }

    public void setCorrect(Integer correct) {
        this.correct = correct;
    }
}
