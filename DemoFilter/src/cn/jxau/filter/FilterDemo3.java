package cn.jxau.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

//@WebFilter("/*")
public class FilterDemo3 implements Filter {

    /**
     *在服务器启动后，会创建Filter对象，然后调用init方法，只执行一次。用于加载资源
     * @param filterConfig
     * @throws ServletException
     */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

        System.out.println("init...");
    }


    /**
     * 每一次请求被拦截资源时，会执行，会执行多次。
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        System.out.println("doFilter...");
        chain.doFilter(request, response);
    }


    /**
     * 在服务器关闭后，Filter对象被销毁。如果服务器是正常关闭，会执行destroy方法，只执行一次。用于释放资源
     */
    @Override
    public void destroy() {

        System.out.println("destroy...");
    }
}
