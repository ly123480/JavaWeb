package com.jxau.controller.restock;

import com.alibaba.fastjson.JSON;
import com.jxau.entity.Restock;
import com.jxau.service.RestockService;
import com.jxau.service.impl.RestockServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(value = "/AddRestockServlet")
public class AddRestockServlet extends HttpServlet {
    private RestockService restockService = new RestockServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader br = request.getReader();
        String params = br.readLine();
        Restock restock = JSON.parseObject(params,Restock.class);
        restockService.addGoods(restock);
        response.getWriter().write("success");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
