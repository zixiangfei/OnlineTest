package com.onlineTest.pojo;

public class Problem {
    private Integer id;
    private String describe;
    private String answer;
    private Integer subjectId;
    private Integer testId;
    private String answerAnalysis;
    private String options;
    private Integer correct;
    private Integer wrong;

    public Problem() {
    }

    public Problem(Integer id, String describe, String answer, Integer subjectId, Integer testId, String answerAnalysis, String options, Integer correct, Integer wrong) {
        this.id = id;
        this.describe = describe;
        this.answer = answer;
        this.subjectId = subjectId;
        this.testId = testId;
        this.answerAnalysis = answerAnalysis;
        this.options = options;
        this.correct = correct;
        this.wrong = wrong;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public Integer getTestId() {
        return testId;
    }

    public void setTestId(Integer testId) {
        this.testId = testId;
    }

    public String getAnswerAnalysis() {
        return answerAnalysis;
    }

    public void setAnswerAnalysis(String answerAnalysis) {
        this.answerAnalysis = answerAnalysis;
    }

    public String getOptions() {
        return options;
    }

    public void setOptions(String options) {
        this.options = options;
    }

    public Integer getCorrect() {
        return correct;
    }

    public void setCorrect(Integer correct) {
        this.correct = correct;
    }

    public Integer getWrong() {
        return wrong;
    }

    public void setWrong(Integer wrong) {
        this.wrong = wrong;
    }

    @Override
    public String toString() {
        return "Problem{" +
                "id=" + id +
                ", describe='" + describe + '\'' +
                ", answer='" + answer + '\'' +
                ", subjectId=" + subjectId +
                ", testId=" + testId +
                ", answerAnalysis='" + answerAnalysis + '\'' +
                ", options='" + options + '\'' +
                ", correct=" + correct +
                ", wrong=" + wrong +
                '}';
    }
}
