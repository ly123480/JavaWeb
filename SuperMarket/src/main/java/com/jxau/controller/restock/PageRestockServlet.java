package com.jxau.controller.restock;

import com.jxau.entity.Goods;
import com.jxau.entity.PageBean;
import com.jxau.entity.Restock;
import com.jxau.service.RestockService;
import com.jxau.service.impl.RestockServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(value = "/PageRestockServlet")
public class PageRestockServlet extends HttpServlet {
    private RestockService restockService = new RestockServiceImpl();

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
        String condition2 = request.getParameter("name7");
//        Map<String,String[]> condition = request.getParameterMap();

        PageBean<Restock> pb = restockService.findRestockByPage(currentPage,rows,condition,condition2);

        request.setAttribute("pb",pb);
        request.getRequestDispatcher("/restock.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
