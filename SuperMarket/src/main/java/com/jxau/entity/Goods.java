package com.jxau.entity;

public class Goods {
    private Integer id;
    private String name;
    private String specs;
    private String sn;
    private Double price;
    private Integer stock;
    private Integer categoryId;

    public Goods(){

    }

    public Goods(Integer id, String name, String specs, String sn, Double price, Integer stock, Integer categoryId) {
        this.id = id;
        this.name = name;
        this.specs = specs;
        this.sn = sn;
        this.price = price;
        this.stock = stock;
        this.categoryId = categoryId;
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

    public String getSpecs() {
        return specs;
    }

    public void setSpecs(String specs) {
        this.specs = specs;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", specs='" + specs + '\'' +
                ", sn='" + sn + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", categoryId=" + categoryId +
                '}';
    }
}
