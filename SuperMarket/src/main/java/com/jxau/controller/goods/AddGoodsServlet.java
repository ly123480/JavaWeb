package com.jxau.controller.goods;

import com.alibaba.fastjson.JSON;
import com.jxau.entity.Goods;
import com.jxau.service.GoodsService;
import com.jxau.service.impl.GoodsServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(value = "/AddGoodsServlet")
public class AddGoodsServlet extends HttpServlet {
    private GoodsService goodsService = new GoodsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader br = request.getReader();
        String params = br.readLine();
        Goods goods = JSON.parseObject(params,Goods.class);
        goodsService.addGoods(goods);
        response.getWriter().write("success");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
