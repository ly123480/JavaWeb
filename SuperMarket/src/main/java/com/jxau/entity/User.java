package com.jxau.entity;

public class User {
    private Integer id;
    private String loginname;
    private String pwd;

    public User() {
    }

    public User(Integer id, String loginname, String pwd) {
        this.id = id;
        this.loginname = loginname;
        this.pwd = pwd;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", loginname='" + loginname + '\'' +
                ", pwd='" + pwd + '\'' +
                '}';
    }
}
