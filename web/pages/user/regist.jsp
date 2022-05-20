<%--
  Created by IntelliJ IDEA.
  User: zhengluzhou
  Date: 2022/4/29
  Time: 7:54 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/pages/common/head.jsp"%>
    <link type="text/css" rel="stylesheet" href="static/css/style.css" >
    <meta charset="UTF-8">
    <title>register</title>
    <style type="text/css">
        .login_form{
            height:420px;
            margin-top: 25px;
        }
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
    </style>
    <script type="text/javascript">
        $(function () {
            {

                // $("#username").blur(function () {
                //     var username =  this.value;
                //     console.log(username)
                //     $.getJSON("http://localhost:8080/book_war_exploded/userServlet","action=ajaxExistsUsername&username="+username,function (data) {
                //         if(data.existsUsername) {
                //             $("span.errorMsg").text("用户名已存在");
                //         }else {
                //             $("span.errorMsg").text("用户名可用");
                //         }
                //     });
                // })

                $("#student").click(function () {
                    // $("#student").removeClass("rolespan");
                    $(".rolespan").removeClass("active");
                    $("#student").addClass("active");
                    $(this).parent().next().children(":first").attr("action","studentServlet");
                    $(this).parent().next().children(":first").children(":first").attr("value","registStudent");
                })
                $("#teacher").click(function () {
                    // $("#student").removeClass("rolespan");
                    $(".rolespan").removeClass("active");
                    $("#teacher").addClass("active");
                    $(this).parent().next().children(":first").attr("action","teacherServlet");
                    $(this).parent().next().children(":first").children(":first").attr("value","registTeacher");
                })

                $("#code_img").click(function () {
                    var time = new Date().getTime();
                    this.src="kaptcha.jpg?time="+time;
                })

                $("#sub_btn").click(function () {
                    var $name = $("#username").val();
                    //alert($name);
                    var usernamePatt = /^\w{5,12}$/;
                    if (!usernamePatt.test($name)) {
                        $("span.errorMsg").text("用户名不合法");
                        return false;
                    }


                    var $password = $("#password").val();
                    //alert($name);
                    if (!usernamePatt.test($password)) {
                        $("span.errorMsg").text("密码不合法");
                        return false;
                    }

                    var $repwd = $("#repwd").val();
                    if($repwd!=$password) {
                        $("span.errorMsg").text("密码不一致");
                        return false;
                    }

                    var $email = $("#email").val();
                    var RegEmail = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                    if(!RegEmail.test($email)) {
                        $("span.errorMsg").text("邮箱不合法");
                        return false;
                    }

                    var code = $("#code").val();
                    code = $.trim(code);
                    if(code==null||code=="") {
                        $("span.errorMsg").text("验证码为空");
                        return false;
                    }

                    $("span.errorMsg").text("");
                })
            }
        })

    </script>
</head>
<body>
<div id="login_header">
    <img class="logo_img" alt="" src="static/images/logo.jpg" style="width: 82px;height: 82px">
    <span style="height: 82px;width: 1000px; line-height: 82px;font-size: 50px">OnlineTest</span>
</div>

<div class="login_banner">

    <div id="l_content">
        <span class="login_word">欢迎注册</span>
    </div>

    <div id="content">
        <div class="login_form">
            <div class="login_box">
                <div class="tit">
                    <h1>注册类型：</h1>
                    <span class="rolespan active" id="student">学生</span>
                    <span class="rolespan" id="teacher">教师</span>
                    <span class="errorMsg">
                        ${requestScope.msg}
                    </span>
                </div>
                <div class="form">
                    <form action="studentServlet" method="post">
                        <input type="hidden" name="action" value="registStudent">
                        <label>用户名称：</label>
                        <input class="itxt" type="text" placeholder="请输入用户名" autocomplete="off" tabindex="1" name="username" id="username"
                               value="${requestScope.username}"
                        />
                        <br />
                        <br />
                        <label>用户密码：</label>
                        <input class="itxt" type="password" placeholder="请输入密码" autocomplete="off" tabindex="1" name="password" id="password" />
                        <br />
                        <br />
                        <label>确认密码：</label>
                        <input class="itxt" type="password" placeholder="确认密码" autocomplete="off" tabindex="1" name="repwd" id="repwd" />
                        <br />
                        <br />
                        <label>电子邮件：</label>
                        <input class="itxt" type="text" placeholder="请输入邮箱地址" autocomplete="off" tabindex="1" name="email" id="email"
                               value="${requestScope.email}"
                        />
                        <br />
                        <br />
                        <label>验证码： </label>
                        <input class="itxt" type="text" name="code" style="width: 90px;margin-left: 15px" id="code"/>
                        <img id="code_img" alt="" src="kaptcha.jpg" style="float: right; margin-right: 50px; width:100px;height: 35px;">
                        <br />
                        <br />
                        <input type="submit" value="注册" id="sub_btn" />

                    </form>
                </div>

            </div>
        </div>
    </div>
</div>

<%@include file="/pages/common/footer.jsp"%>
</body>
</html>
