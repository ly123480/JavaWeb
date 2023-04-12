package com.jxau.pojo;

public class Message {
    private Integer id;
    private String userName;
    private String title;
    private String contents;
    private String createTime;

    public Message() {
    }

    public Message(Integer id, String userName, String title, String contents, String createTime) {
        this.id = id;
        this.userName = userName;
        this.title = title;
        this.contents = contents;
        this.createTime = createTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", title='" + title + '\'' +
                ", contents='" + contents + '\'' +
                ", createTime='" + createTime + '\'' +
                '}';
    }
}
