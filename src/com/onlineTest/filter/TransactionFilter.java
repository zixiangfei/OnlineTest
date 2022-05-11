package com.onlineTest.filter;

import com.onlineTest.utils.JdbcUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.*;
import java.io.IOException;

public class TransactionFilter implements Filter {
    protected final Log log = LogFactory.getLog(getClass());
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        try {
            filterChain.doFilter(servletRequest,servletResponse);
            JdbcUtils.commitAndClose();
        } catch (Exception e) {
            JdbcUtils.rollbackAndClose();
            log.error(e.getMessage());
        }
    }

    @Override
    public void destroy() {

    }
}
