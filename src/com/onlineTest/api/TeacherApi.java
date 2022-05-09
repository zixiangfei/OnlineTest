package com.onlineTest.api;

import com.auth0.jwt.exceptions.JWTCreationException;
import com.onlineTest.common.Result;
import com.onlineTest.enums.ErrorCodeEnum;
import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Teacher;
import com.onlineTest.service.TeacherService;
import com.onlineTest.service.impl.TeacherServiceImpl;
import com.onlineTest.utils.JwtTokenUtils;
import com.onlineTest.utils.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class TeacherApi extends BaseApi {
    TeacherService teacherService = new TeacherServiceImpl();

    protected void pageTeacher(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);

        Page<Teacher> page = teacherService.page(pageNo, pageSize);
        page.setType("teacher");
        page.setUrl("teacherServlet?action=pageTeacher");

        resp.getWriter().write(WebUtils.getJSONString(Result.success(page)));
    }

    protected void loginTeacher(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Teacher teacher = teacherService.loginTeacher(username, password);
        if (teacher == null) {
            resp.getWriter().write(WebUtils.getJSONString(Result.error(ErrorCodeEnum.REQUEST_PARAMS_ERROR.getCode(), "用户名或密码错误")));
        } else {
            // 登录成功
            Map<String, Object> map = new HashMap<>();
            map.put("username", teacher.getUsername());
            map.put("type", "admin");
            String token;
            try {
                token = JwtTokenUtils.generateToken(map);
            } catch (JWTCreationException e) {
                resp.getWriter().write(WebUtils.getJSONString(Result.error(ErrorCodeEnum.SYSTEM_ERROR.getCode(), "生成token失败")));
                return;
            }
            resp.getWriter().write(WebUtils.getJSONString(Result.success(token)));
        }
    }

    protected void registTeacher(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String code = req.getParameter("code");
        String kaptcha = (String) req.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        req.getSession().removeAttribute(KAPTCHA_SESSION_KEY);
        if (kaptcha != null && kaptcha.equals(code)) {
            if(teacherService.existsTeacherName(username)) {
                WebUtils.writeJSONString(resp, Result.error(ErrorCodeEnum.REQUEST_PARAMS_ERROR.getCode(), "账号已存在"));
            } else {
                teacherService.registTeacher(new Teacher(null,username,password,email,null));
                WebUtils.writeJSONString(resp, Result.success(null));
            }
        } else {
            WebUtils.writeJSONString(resp, Result.error(ErrorCodeEnum.REQUEST_PARAMS_ERROR.getCode(), "验证码错误"));
        }
    }

    protected void getAllTeachers(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<Teacher> teachers = teacherService.allTeacher();
        Map<String,Object> resultMap = new HashMap<String, Object>();
        resultMap.put("teachers",teachers);
        WebUtils.writeJSONString(resp, Result.success(resultMap));
    }
}
