<%--
  Created by IntelliJ IDEA.
  User: zhengluzhou
  Date: 2022/4/28
  Time: 10:13 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
    pageContext.setAttribute("basePath",basePath);
%>
<base href="<%=basePath%>">
<script type="text/javascript" src="static/script/jquery-1.7.2.js"></script>
<script>
    console.log = function () {}
</script>
