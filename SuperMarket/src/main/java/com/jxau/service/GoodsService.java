package com.jxau.service;

import com.jxau.entity.Goods;
import com.jxau.entity.PageBean;

public interface GoodsService {
    void addGoods(Goods goods);
    void deleteGoods(Integer id);
    void updateGoods(Goods goods);
    PageBean<Goods> findGoodsByPage(String currentPage, String rows, String condition);
}
