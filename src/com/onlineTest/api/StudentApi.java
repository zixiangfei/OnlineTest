package com.onlineTest.api;

import cn.hutool.core.util.StrUtil;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.onlineTest.common.Result;
import com.onlineTest.enums.ErrorCodeEnum;
import com.onlineTest.pojo.Class;
import com.onlineTest.pojo.Page;
import com.onlineTest.pojo.Student;
import com.onlineTest.service.ClassService;
import com.onlineTest.service.StudentService;
import com.onlineTest.service.impl.ClassServiceImpl;
import com.onlineTest.service.impl.StudentServiceImpl;
import com.onlineTest.utils.JwtTokenUtils;
import com.onlineTest.utils.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentApi extends BaseApi {
    StudentService studentService = new StudentServiceImpl();
    ClassService classService = new ClassServiceImpl();

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
        if (StrUtil.hasBlank(username) || StrUtil.hasBlank(password)) {
            WebUtils.writeJSONString(resp, Result.requestParameterError("用户名或密码不能为空"));
            return;
        }
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
            map.put("token", token);
            student.setPassword(null);
            map.put("userInfo", student);
            WebUtils.writeJSONString(resp, Result.success(map));
        }
    }

    protected void registStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username = req.getParameter("username");
        if (StrUtil.hasBlank(username)) {
            WebUtils.writeJSONString(resp, Result.requestParameterError("用户名不能为空"));
            return;
        }
        String password = req.getParameter("password");
        if (StrUtil.hasBlank(password)) {
            WebUtils.writeJSONString(resp, Result.requestParameterError("密码不能为空"));
            return;
        }
        String email = req.getParameter("email");
        if (StrUtil.hasBlank(email)) {
            WebUtils.writeJSONString(resp, Result.requestParameterError("邮箱不能为空"));
            return;
        }
        String code = req.getParameter("code");
        if (StrUtil.hasBlank(code)) {
            WebUtils.writeJSONString(resp, Result.requestParameterError("验证码不能为空"));
            return;
        }
        String kaptcha = WebUtils.getCaptcha(req);
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

    protected void showStudentById(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer id = WebUtils.parseInt(req.getParameter("id"), 0);
        Student student = studentService.getStudentById(id);
        WebUtils.writeJSONString(resp, Result.success(student));
    }

    protected void modifyStudent(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer classId = WebUtils.parseInt(req.getParameter("classId"), 0);
        Class newClass = classService.getClassById(classId);
        String newName = req.getParameter("insert-name");
        Integer modifyId = WebUtils.parseInt(req.getParameter("modifyId"), 0);
        Student studentById = studentService.getStudentById(modifyId);
        Integer oldClassId = WebUtils.parseInt(studentById.getClassId(), 0);
        if (oldClassId != 0) {
            Class oldClass = classService.getClassById(oldClassId);
            classService.modifyClassById(new Class(oldClass.getName(), oldClassId, oldClass.getTeacherId(), oldClass.getImage(), oldClass.getMembers() - 1));
        }
        classService.modifyClassById(new Class(newClass.getName(), newClass.getId(), newClass.getTeacherId(), newClass.getImage(), newClass.getMembers() + 1));
        studentService.modifyStudentById(new Student(studentById.getId(), studentById.getUsername(), studentById.getPassword(), studentById.getEmail(), classId.toString(), newName));
        WebUtils.writeJSONString(resp, Result.success(null));
    }
}
