package com.onlineTest.utils;

import cn.hutool.crypto.SecureUtil;
import com.google.gson.Gson;
import com.onlineTest.common.Constant;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class WebUtils {
    private static final Map<String, String> CAPTCHA_MAP = new ConcurrentHashMap<>();

    public static void putCaptcha(String key, String code) {
        if ("0:0:0:0:0:0:0:1".equals(key)) {
            CAPTCHA_MAP.put("127.0.0.1", code);
        }
        CAPTCHA_MAP.put(key, code);
    }

    public static String getCaptcha(String key) {
        return CAPTCHA_MAP.get(key);
    }

    public static String getCaptcha(HttpServletRequest req) {
        String key = NetworkUtils.getIpAddress(req);
        return getCaptcha(key);
    }

    static final Log log = LogFactory.getLog(WebUtils.class);

    /**
     * 将字符串转换为int类型
     *
     * @param strInt       字符串
     * @param defaultValue 默认值
     * @return int
     */
    public static int parseInt(String strInt, int defaultValue) {
        try {
            return Integer.parseInt(strInt);
        } catch (Exception e) {
            return defaultValue;
        }
    }

    public static String getJSONString(Object o) {
        Gson gson = new Gson();
        return gson.toJson(o);
    }

    public static void writeJSONString(HttpServletResponse resp, Object o) throws IOException {
        resp.getWriter().write(getJSONString(o));
    }

    public static String md5(String text) {
        return SecureUtil.md5(Constant.SECRET + text);
    }
}
