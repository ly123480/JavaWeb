package com.jxau.controller.supplier;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jxau.entity.PageBean;
import com.jxau.entity.Supplier;
import com.jxau.service.SupplierService;
import com.jxau.service.impl.SupplierServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;

@WebServlet(value = "/PageSupplierServlet")
public class PageSupplierServlet extends HttpServlet {
    private SupplierService supplierService = new SupplierServiceImpl();

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

        PageBean<Supplier> pb = supplierService.findSupplierByPage(currentPage,rows,condition);

        request.setAttribute("pb",pb);
        request.getRequestDispatcher("/supplier.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
