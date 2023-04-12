package com.jxau.service;

import com.jxau.entity.PageBean;
import com.jxau.entity.Supplier;
import java.util.List;

public interface SupplierService {
    List<Supplier> selectAll();
    void addSupplier(Supplier supplier);
    void deleteSupplier(Integer id);
    void updateSupplier(Supplier supplier);
    PageBean<Supplier> findSupplierByPage(String currentPage, String rows,String condition);
}
