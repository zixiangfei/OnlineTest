<%--
  Created by IntelliJ IDEA.
  User: zhengluzhou
  Date: 2022/4/28
  Time: 8:02 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <%@include file="/pages/common/head.jsp" %>
    <link type="text/css" rel="stylesheet" href="static/css/style.css" >
    <style type="text/css">
        .rolespan{
            display: inline-block;
            height: 30px;
            line-height: 30px;
            width: 60px;
            background: #ddd;
            color: #666;
            text-align: center;
            margin: 04px;
            cursor: pointer;
        }
        .active{
            background: #22B3C8;
            color: #fff;
        }
        #regist{
            background-color: #39987c;
            border: none;
            color: #fff;
            width: 360px;
            height: 40px;
            margin-top: 10px;
        }
    </style>

    <script type="text/javascript">
        $(function () {
            $("#student").click(function () {
                // $("#student").removeClass("rolespan");
                $(".rolespan").removeClass("active");
                $("#student").addClass("active");
                $(this).parent().parent().next().next().children("form").attr("action","studentServlet")
                $(this).parent().parent().next().next().children("form").children(":first").val("loginStudent");
            })
            $("#teacher").click(function () {
                // $("#student").removeClass("rolespan");
                $(".rolespan").removeClass("active");
                $("#teacher").addClass("active");
                $(this).parent().parent().next().next().children("form").attr("action","teacherServlet")
                $(this).parent().parent().next().next().children("form").children(":first").val("loginTeacher");
            })
            $("#admin").click(function () {
                // $("#student").removeClass("rolespan");
                $(".rolespan").removeClass("active");
                $("#admin").addClass("active");
                $(this).parent().parent().next().next().children("form").attr("action","adminServlet")
                $(this).parent().parent().next().next().children("form").children(":first").attr("value","loginAdmin");
            })

        })

    </script>
</head>
<body>
<div id="login_header">
    <img class="logo_img" alt="" src="static/images/logo.jpg" style="width: 82px;height: 82px">
    <span style="height: 82px;width: 1000px;font-size: 50px;line-height: 82px">OnlineTest</span>
</div>

<div class="login_banner">

    <div id="l_content">
        <span class="login_word" >欢迎登录</span>
    </div>

    <div id="content">
        <div class="login_form">
            <div class="login_box">
                <div class="tit">
                    <span>
                        <h1>账户类型：</h1>
                     <span class="rolespan active" id="student">学生</span>
                     <span class="rolespan" id="teacher">教师</span>
                     <span class="rolespan" id="admin">管理员</span>
                    </span>
                </div>
                <div class="msg_cont">
                    <b></b>
                    <span class="errorMsg">
                        ${empty requestScope.msg ?"请输入用户名和密码":requestScope.msg}
                    </span>
                </div>
                <div class="form">
                    <form action="studentServlet" method="post">
                        <input type="hidden" name="action" value="loginStudent">
                        <label>用户名称：</label>
                        <input class="itxt" type="text" placeholder="请输入用户名" autocomplete="off" tabindex="1" name="username"
                               value="${requestScope.username}"
                        />
                        <br />
                        <br />
                        <label>用户密码：</label>
                        <input class="itxt" type="password" placeholder="请输入密码" autocomplete="off" tabindex="1" name="password" />
                        <br />
                        <br />
                        <input type="submit" value="登录" id="sub_btn" />
                    </form>
                    <a href="pages/user/regist.jsp" >
                        <button id="regist">立即注册</button>
                    </a>
                </div>

            </div>
        </div>
    </div>
</div>
<%@include file="/pages/common/footer.jsp"%>
</body>
</html>
</html>
