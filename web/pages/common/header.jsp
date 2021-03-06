<%--
  Created by IntelliJ IDEA.
  User: zhengluzhou
  Date: 2022/4/29
  Time: 11:25 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link  rel="stylesheet" href="static/font-awesome/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="static/css/header.css" >
<link rel="shortcut icon" href="static/images/favicon.ico" type="image/x-icon">

<nav class="navbar navbar-dark bg-inverse" id="top-nav">
    <button class="navbar-toggler hidden-md-up" type="button" data-toggle="collapse"
            data-target="#navbarResponsive"></button>
    <div class="collapse navbar-toggleable-sm" id="navbarResponsive">
        <a class="navbar-brand" href="index.jsp">
            <img src="static/images/sdust.png" height="30"/>
            首页
        </a>
        <ul class="nav navbar-nav">
            <li class="nav-item" id="nav-problem">
                <a class="nav-link" href="problemServlet?action=pageProblem" style="color:#b0ead8;">问题列表</a>
            </li>
            <c:if test="${sessionScope.type eq 'admin'}">
                <li class="nav-item" id="nav-user">
                    <a class="nav-link" href="studentServlet?action=pageStudent" style="color:#b0ead8;" >管理</a>
                </li>
            </c:if>
            <c:if test="${sessionScope.type eq 'teacher'}">
                <li class="nav-item" id="nav-group">
                    <a class="nav-link" href="classServlet?action=showClassListByTeacherId&teacherId=${sessionScope.teacher.id}" style="color:#b0ead8;">班级</a>
                </li>
            </c:if>
            <c:if test="${sessionScope.type eq 'admin'}">
                <li class="nav-item" id="nav-group">
                    <a class="nav-link" href="classServlet?action=showClassList" style="color:#b0ead8;">班级</a>
                </li>
            </c:if>
            <c:if test="${sessionScope.type eq 'student'}">
                <li class="nav-item" id="nav-group">
                    <a class="nav-link" href="classServlet?action=showClassDetails&classId=${sessionScope.student.classId}" style="color:#b0ead8;">班级</a>
                </li>
            </c:if>

            <li class="nav-item float-xs-right">
                <c:if test="${empty sessionScope.username}">
                    <a class="nav-link register" href="pages/user/regist.jsp" data-toggle="modal"
                       data-target="#registerModal" style="color:#b0ead8;">注册</a>
                </c:if>
                <c:if test="${not empty sessionScope.username}">
                    <a class="nav-link logout" href="adminServlet?action=logout" data-toggle="modal"
                       data-target="#registerModal" style="color:#b0ead8;">注销</a>
                </c:if>

            </li>
            <li class="nav-item float-xs-right">
                <c:if test="${empty sessionScope.username}">
                    <a class="nav-link login" href="pages/user/login.jsp" style="color:#b0ead8;">登陆</a>
                </c:if>
                <c:if test="${not empty sessionScope.username}">
                    <span class="nav-link login" style="color:#b0ead8;">${sessionScope.username}</span>
                </c:if>
            </li>


        </ul>
    </div>
</nav>
