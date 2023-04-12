package com.jxau.service;

import com.jxau.entity.PageBean;
import com.jxau.entity.Sale;

public interface SaleService {
    void addSale(Sale sale);
    PageBean<Sale> findSaleByPage(String currentPage, String rows, String condition);
}
