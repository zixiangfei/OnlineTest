package com.onlineTest.pojo;

public class Teacher {
    private Integer id;
    private String username;
    private String password;
    private String email;
    private String nikename;

    public Teacher() {
    }

    public Teacher(Integer id, String username, String password, String email, String nikename) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.nikename = nikename;
    }

    public String getNikename() {
        return nikename;
    }

    public void setNikename(String nikename) {
        this.nikename = nikename;
    }

    public Integer getId() {
        return id;
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

    @Override
    public String toString() {
        return "Teacher{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", nikename='" + nikename + '\'' +
                '}';
    }
}
