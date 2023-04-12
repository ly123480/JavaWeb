package com.jxau.controller.category;

import com.jxau.service.CategoryService;
import com.jxau.service.SupplierService;
import com.jxau.service.impl.CategoryServiceImpl;
import com.jxau.service.impl.SupplierServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/DeleteCategoryServlet")
public class DeleteCategoryServlet extends HttpServlet {
    private CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        categoryService.deleteCategory(id);
        response.sendRedirect("/SuperMarket_war_exploded/PageCategoryServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
