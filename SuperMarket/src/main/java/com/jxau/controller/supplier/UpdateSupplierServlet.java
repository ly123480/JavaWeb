package com.jxau.controller.supplier;

import com.alibaba.fastjson.JSON;
import com.jxau.entity.Supplier;
import com.jxau.service.SupplierService;
import com.jxau.service.impl.SupplierServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(value = "/UpdateSupplierServlet")
public class UpdateSupplierServlet extends HttpServlet {
    private SupplierService supplierService = new SupplierServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader br = request.getReader();
        String params = br.readLine();
        Supplier supplier = JSON.parseObject(params, Supplier.class);
        supplierService.updateSupplier(supplier);
        response.getWriter().write("success");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
