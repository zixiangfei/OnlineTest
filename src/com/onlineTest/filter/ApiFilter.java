package com.onlineTest.filter;

import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.onlineTest.common.Constant;
import com.onlineTest.common.Result;
import com.onlineTest.config.ApiPermissionConfig;
import com.onlineTest.enums.ErrorCodeEnum;
import com.onlineTest.utils.JwtTokenUtils;
import com.onlineTest.utils.WebUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ApiFilter implements Filter {
    protected final Log log = LogFactory.getLog(getClass());

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        resp.setContentType("application/json;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            WebUtils.writeJSONString(resp, Result.error(ErrorCodeEnum.REQUEST_PARAMS_ERROR.getCode(), ErrorCodeEnum.REQUEST_PARAMS_ERROR.getMessage()));
        } else {
            DecodedJWT jwt;
            if (!ApiPermissionConfig.ALLOW_SET.contains(action)) {
                // 判断token是否合法
                String token = req.getHeader(Constant.HEADER_STRING);
                if (token == null) {
                    WebUtils.writeJSONString(resp, Result.error(ErrorCodeEnum.PERMISSION_ERROR.getCode(), ErrorCodeEnum.PERMISSION_ERROR.getMessage()));
                    return;
                }
                try {
                    jwt = JwtTokenUtils.verifyToken(token);
                } catch (JWTVerificationException e) {
                    log.error("token校验失败, " + e.getMessage());
                    WebUtils.writeJSONString(resp, Result.error(ErrorCodeEnum.PERMISSION_ERROR.getCode(), ErrorCodeEnum.PERMISSION_ERROR.getMessage()));
                    return;
                }
            }
            // 可以根据jwt中的type进行更细粒度的权限划分
            // 暂时不做进一步的划分，直接放行
            filterChain.doFilter(req, resp);
        }
    }

    @Override
    public void destroy() {

    }
}
