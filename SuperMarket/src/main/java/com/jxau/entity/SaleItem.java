package com.jxau.entity;

public class SaleItem {
    private Integer saleId;
    private Integer goodsId;
    private Integer count;

    public SaleItem(){
    }

    public SaleItem(Integer saleId, Integer goodsId, Integer count) {
        this.saleId = saleId;
        this.goodsId = goodsId;
        this.count = count;
    }

    public Integer getSaleId() {
        return saleId;
    }

    public void setSaleId(Integer saleId) {
        this.saleId = saleId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "SaleItem{" +
                "saleId=" + saleId +
                ", goodsId=" + goodsId +
                ", count=" + count +
                '}';
    }
}
