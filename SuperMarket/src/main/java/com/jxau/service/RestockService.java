package com.jxau.service;

import com.jxau.entity.PageBean;
import com.jxau.entity.Restock;

public interface RestockService {
    void addGoods(Restock restock);
    PageBean<Restock> findRestockByPage(String currentPage, String rows, String condition, String condition2);
}
