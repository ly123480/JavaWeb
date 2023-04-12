package com.jxau.controller.sale;

import com.alibaba.fastjson.JSON;
import com.jxau.entity.Sale;
import com.jxau.service.SaleService;
import com.jxau.service.impl.SaleServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(value = "/AddSaleServlet")
public class AddSaleServlet extends HttpServlet {
    private SaleService saleService = new SaleServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader br = request.getReader();
        String params = br.readLine();
        Sale sale = JSON.parseObject(params,Sale.class);
        saleService.addSale(sale);
        response.getWriter().write("success");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
