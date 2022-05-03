package com.onlineTest.pojo;

public class Problem {
    private Integer id;
    private String describe;
    private String answer;
    private Integer subjectId;
    private String analysis;
    private String options;
    private Integer correct;
    private Integer wrong;
    private String type;

    public Problem() {
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAnalysis() {
        return analysis;
    }

    public void setAnalysis(String analysis) {
        this.analysis = analysis;
    }

    public Problem(Integer id, String describe, String answer, Integer subjectId, String analysis, String options, Integer correct, Integer wrong, String type) {
        this.id = id;
        this.describe = describe;
        this.answer = answer;
        this.subjectId = subjectId;
        this.analysis = analysis;
        this.options = options;
        this.correct = correct;
        this.wrong = wrong;
        this.type = type;
    }

    @Override
    public String toString() {
        return "Problem{" +
                "id=" + id +
                ", describe='" + describe + '\'' +
                ", answer='" + answer + '\'' +
                ", subjectId=" + subjectId +
                ", analysis='" + analysis + '\'' +
                ", options='" + options + '\'' +
                ", correct=" + correct +
                ", wrong=" + wrong +
                ", type='" + type + '\'' +
                '}';
    }
}
