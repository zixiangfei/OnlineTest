package com.onlineTest.utils;

import com.google.gson.Gson;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

public class WebUtils {
    public static <T> T copyParamToBean(Map value, T bean) {
        try {
            System.out.println("注入之前："+bean);
            BeanUtils.populate(bean,value);
            System.out.println("注入之后："+bean);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        return bean;
    }

    /**
     * 将字符串转换为int类型
     * @param strInt
     * @param defaultValue
     * @return
     */
    public static int parseInt(String strInt,int defaultValue) {
        try {
            return Integer.parseInt(strInt);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return defaultValue;
    }

    public static String getJSONString(Object o) {
        Gson gson = new Gson();
        return gson.toJson(o);
    }

    public static void writeJSONString(HttpServletResponse resp, Object o) throws IOException {
        resp.getWriter().write(getJSONString(o));
    }
}
