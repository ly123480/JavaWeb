package com.jxau.controller.category;

import com.alibaba.fastjson.JSON;
import com.jxau.entity.Category;
import com.jxau.entity.Supplier;
import com.jxau.service.CategoryService;
import com.jxau.service.SupplierService;
import com.jxau.service.impl.CategoryServiceImpl;
import com.jxau.service.impl.SupplierServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(value = "/UpdateCategoryServlet")
public class UpdateCategoryServlet extends HttpServlet {
    private CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader br = request.getReader();
        String params = br.readLine();
        Category category = JSON.parseObject(params, Category.class);
        categoryService.updateCategory(category);
        response.getWriter().write("success");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
