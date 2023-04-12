package com.jxau.controller.goods;

import com.jxau.entity.Category;
import com.jxau.entity.Goods;
import com.jxau.entity.PageBean;
import com.jxau.service.GoodsService;
import com.jxau.service.impl.GoodsServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/PageGoodsServlet")
public class PageGoodsServlet extends HttpServlet {
    private GoodsService goodsService = new GoodsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String currentPage = request.getParameter("currentPage");  //当前的页码
        String rows = request.getParameter("rows");    //每页显示的条数

        if(currentPage==null ||"".equals(currentPage)){
            currentPage ="1";
        }
        if(rows==null ||"".equals(rows)){
            rows ="5";
        }

        String condition = request.getParameter("name6");

        PageBean<Goods> pb = goodsService.findGoodsByPage(currentPage,rows,condition);

        request.setAttribute("pb",pb);
        request.getRequestDispatcher("/goods.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
