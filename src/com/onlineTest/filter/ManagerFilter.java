package com.onlineTest.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ManagerFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        String type =(String) req.getSession().getAttribute("type");
        if("admin".equals(type)) {
            filterChain.doFilter(req,resp);
        }
        else {
            req.getRequestDispatcher("/index.jsp").forward(req,resp);
        }
    }

    @Override
    public void destroy() {

    }
}
