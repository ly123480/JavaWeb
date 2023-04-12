package com.jxau.entity;

public class Restock {
    private Integer id;
    private Integer goodsid;
    private Integer supplierid;
    private Double price;
    private Integer stock;
    private String tradedate;
    private String goodsname;

    public Restock() {
    }

    public Restock(Integer id, Integer goodsid, Integer supplierid, Double price, Integer stock, String tradedate, String goodsname) {
        this.id = id;
        this.goodsid = goodsid;
        this.supplierid = supplierid;
        this.price = price;
        this.stock = stock;
        this.tradedate = tradedate;
        this.goodsname = goodsname;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public Integer getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(Integer supplierid) {
        this.supplierid = supplierid;
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

    public String getTradedate() {
        return tradedate;
    }

    public void setTradedate(String tradedate) {
        this.tradedate = tradedate;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    @Override
    public String toString() {
        return "Restock{" +
                "id=" + id +
                ", goodsid=" + goodsid +
                ", supplierid=" + supplierid +
                ", price=" + price +
                ", stock=" + stock +
                ", tradedate='" + tradedate + '\'' +
                ", goodsname='" + goodsname + '\'' +
                '}';
    }
}
