<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhengluzhou
  Date: 2022/4/29
  Time: 11:25 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>OnlineTest</title>
    <%@include file="head.jsp"%>
    <link type="text/css" rel="stylesheet" href="static/css/header.css" >
</head>
<body>
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
                <a class="nav-link" href="/problem" style="color:#b0ead8;">Problem</a>
            </li>
            <li class="nav-item" id="nav-status">
                <a class="nav-link" href="/status" style="color:#b0ead8;">Status</a>
            </li>
            <li class="nav-item" id="nav-contest">
                <a class="nav-link" href="/contest" style="color:#b0ead8;">Contest</a>
            </li>
            <c:if test="${sessionScope.type == 'admin'}">
                <li class="nav-item" id="nav-user">
                    <a class="nav-link" href="studentServlet?action=pageStudent" style="color:#b0ead8;" >用户管理</a>
                </li>
            </c:if>
            <li class="nav-item" id="nav-group">
                <a class="nav-link" href="/group" style="color:#b0ead8;">Group</a>
            </li>
            <li class="nav-item" id="nav-comment">
                <a class="nav-link" href="/comment" style="color:#b0ead8;">Forum</a>
            </li>

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
</body>
</html>
