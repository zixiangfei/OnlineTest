package com.onlineTest.api;

import com.auth0.jwt.exceptions.JWTCreationException;
import com.onlineTest.common.Result;
import com.onlineTest.enums.ErrorCodeEnum;
import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Student;
import com.onlineTest.service.StudentService;
import com.onlineTest.service.impl.StudentServiceImpl;
import com.onlineTest.utils.JwtTokenUtils;
import com.onlineTest.utils.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class StudentApi extends BaseApi {
    StudentService studentService = new StudentServiceImpl();

    protected void getAllStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<Student> students = studentService.queryAllStudent();
        Map<String, Object> map = new HashMap<>();
        map.put("students", students);
        map.put("type", "student");
        resp.getWriter().write(WebUtils.getJSONString(Result.success(map)));
    }

    protected void pageStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        Integer pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.page_size);

        Page<Student> page = studentService.page(pageNo, pageSize);
        page.setType("student");
        page.setUrl("studentServlet?action=pageStudent");
        resp.getWriter().write(WebUtils.getJSONString(Result.success(page)));
    }

    protected void loginStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Student student = studentService.loginStudent(username, password);
        if (student == null) {
            WebUtils.writeJSONString(resp, Result.error(ErrorCodeEnum.REQUEST_PARAMS_ERROR.getCode(), "用户名或密码错误"));
        } else {
            // 登录成功
            Map<String, Object> map = new HashMap<>();
            map.put("username", student.getUsername());
            map.put("type", "admin");
            String token;
            try {
                token = JwtTokenUtils.generateToken(map);
            } catch (JWTCreationException e) {
                log.error("token生成失败, " + e.getMessage());
                WebUtils.writeJSONString(resp, Result.error(ErrorCodeEnum.SYSTEM_ERROR.getCode(), "生成token失败"));
                return;
            }
            WebUtils.writeJSONString(resp, Result.success(token));
        }
    }

    protected void registStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String code = req.getParameter("code");
        String kaptcha = (String) req.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        req.getSession().removeAttribute(KAPTCHA_SESSION_KEY);
        if (kaptcha != null && kaptcha.equals(code)) {
            if (studentService.existStudentName(username)) {
                WebUtils.writeJSONString(resp, Result.error(ErrorCodeEnum.REQUEST_PARAMS_ERROR.getCode(), "账号已存在"));
            } else {
                studentService.registStudent(new Student(null, username, password, email, null, null));
                WebUtils.writeJSONString(resp, Result.success(null));
            }
        } else {
            WebUtils.writeJSONString(resp, Result.error(ErrorCodeEnum.REQUEST_PARAMS_ERROR.getCode(), "验证码错误"));
        }
    }
}
