package com.jxau.controller.supplier;

import com.jxau.entity.Supplier;
import com.jxau.service.SupplierService;
import com.jxau.service.impl.SupplierServiceImpl;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/SelectAllServlet")
public class SelectAllServlet extends HttpServlet {
    private SupplierService supplierService = new SupplierServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Supplier> suppliers = supplierService.selectAll();

        request.setAttribute("suppliers",suppliers);
        request.getRequestDispatcher("/supplier.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
