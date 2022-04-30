package com.onlineTest.pojo;

public class Student {
    private Integer id;
    private String username;
    private String password;
    private String email;
    private String classId;
    private String nikename;

    public Student(Integer id, String username, String password, String email, String classId, String nikename) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.classId = classId;
        this.nikename = nikename;
    }

    public Student() {
    }

    public Integer getId() {
        return id;
    }

    public String getNikename() {
        return nikename;
    }

    public void setNikename(String nikename) {
        this.nikename = nikename;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", classId='" + classId + '\'' +
                ", nikename='" + nikename + '\'' +
                '}';
    }
}
