package com.onlineTest.pojo;

public class Message {
    private Integer id;
    private Integer testId;
    private Integer studentId;

    public Message() {
    }

    public Message(Integer id, Integer testId, Integer studentId) {
        this.id = id;
        this.testId = testId;
        this.studentId = studentId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTestId() {
        return testId;
    }

    public void setTestId(Integer testId) {
        this.testId = testId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", testId=" + testId +
                ", studentId=" + studentId +
                '}';
    }
}
