package com.jxau.entity;

public class Sale {
    private Integer id;
    private String tradetime;

    public Sale(){
    }

    public Sale(Integer id, String tradetime) {
        this.id = id;
        this.tradetime = tradetime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTradetime() {
        return tradetime;
    }

    public void setTradetime(String tradetime) {
        this.tradetime = tradetime;
    }

    @Override
    public String toString() {
        return "Sale{" +
                "id=" + id +
                ", tradetime='" + tradetime + '\'' +
                '}';
    }
}
