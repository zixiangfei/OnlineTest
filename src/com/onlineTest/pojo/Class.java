package com.onlineTest.pojo;

public class Class {
    private String name;
    private Integer id;
    private Integer teacherId;
    private String image;
    private Integer members;

    public Class() {
    }

    @Override
    public String toString() {
        return "Class{" +
                "name='" + name + '\'' +
                ", id=" + id +
                ", teacherId=" + teacherId +
                ", image='" + image + '\'' +
                ", members=" + members +
                '}';
    }

    public Class(String name, Integer id, Integer teacherId, String image, Integer members) {
        this.name = name;
        this.id = id;
        this.teacherId = teacherId;
        this.image = image;
        this.members = members;
    }

    public Integer getMembers() {
        return members;
    }

    public void setMembers(Integer members) {
        this.members = members;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

}
