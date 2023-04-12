package com.jxau.controller.sale;

import com.jxau.entity.PageBean;
import com.jxau.entity.Restock;
import com.jxau.entity.Sale;
import com.jxau.service.SaleService;
import com.jxau.service.impl.SaleServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(value = "/PageSaleServlet")
public class PageSaleServlet extends HttpServlet {
    private SaleService saleService = new SaleServiceImpl();

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

        PageBean<Sale> pb = saleService.findSaleByPage(currentPage,rows,condition);

        request.setAttribute("pb",pb);
        request.getRequestDispatcher("/sale.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
