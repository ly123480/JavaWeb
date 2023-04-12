package com.jxau.service;

import com.jxau.entity.Category;
import com.jxau.entity.PageBean;;

public interface CategoryService {
    void addCategory(Category category);
    void deleteCategory(Integer id);
    void updateCategory(Category category);
    PageBean<Category> findCategoryByPage(String currentPage, String rows, String condition);
}
