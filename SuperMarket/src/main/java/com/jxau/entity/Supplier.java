package com.jxau.entity;

public class Supplier {
    private Integer id;
    private String name;
    private String contacts;
    private String tel;
    private String info;

    public Supplier(){
    }

    public Supplier(Integer id, String name, String contacts, String tel, String info) {
        this.id = id;
        this.name = name;
        this.contacts = contacts;
        this.tel = tel;
        this.info = info;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    @Override
    public String toString() {
        return "Supplier{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", contacts='" + contacts + '\'' +
                ", tel='" + tel + '\'' +
                ", info='" + info + '\'' +
                '}';
    }
}
