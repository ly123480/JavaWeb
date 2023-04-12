package com.jxau.controller.goods;

import com.jxau.service.GoodsService;
import com.jxau.service.impl.GoodsServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/DeleteGoodsServlet")
public class DeleteGoodsServlet extends HttpServlet {
    private GoodsService goodsService = new GoodsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        goodsService.deleteGoods(id);
        response.sendRedirect("/SuperMarket_war_exploded/PageGoodsServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
