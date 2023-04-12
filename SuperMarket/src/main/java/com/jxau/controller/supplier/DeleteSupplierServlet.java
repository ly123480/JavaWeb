package com.jxau.controller.supplier;

import com.jxau.service.SupplierService;
import com.jxau.service.impl.SupplierServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/DeleteSupplierServlet")
public class DeleteSupplierServlet extends HttpServlet {
    private SupplierService supplierService = new SupplierServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        supplierService.deleteSupplier(id);
        response.sendRedirect("/SuperMarket_war_exploded/PageSupplierServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
