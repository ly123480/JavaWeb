package com.jxau.controller;

import com.jxau.entity.User;
import com.jxau.service.UserService;
import com.jxau.service.impl.UserServicecImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private UserService userService = new UserServicecImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userService.findUser(username,password);
        //获取字符输出流，并设置content type
        response.setContentType("text/html;charset=utf-8");

        //3. 判断user释放为null
        if(user != null){
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            // 登陆成功
            response.sendRedirect("/SuperMarket_war_exploded/PageSupplierServlet");
        }else {
            // 登陆失败
            request.setAttribute("login_msg","用户名或密码错误");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
