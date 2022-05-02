package com.onlineTest.api;

import com.onlineTest.common.Result;
import com.onlineTest.utils.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class TestApi extends BaseApi {
    protected void ping(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.getWriter().write(WebUtils.getJSONString(Result.success("pong")));
    }
}
