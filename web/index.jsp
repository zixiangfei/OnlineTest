<%--
  Created by IntelliJ IDEA.
  User: zhengluzhou
  Date: 2022/4/24
  Time: 4:01 下午
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="static/css/header.css" >
    <%@include file="/pages/common/head.jsp"%>
    <style type="text/css">
        #index-title {
            font-size: 4rem;
            font-weight: 400;
            padding-bottom: 1rem;
        }
        #index-intro {
            padding-top: 4em;
        }

    </style>
    <title>OnlineTest</title>
</head>
<body>
<%@include file="/pages/common/header.jsp"%>
<div class="container" id="index-intro">
    <div id="fb-root"></div>
    <h1 id="index-title">OnlineTest</h1>
    <div class="row">
        <div class="col-md-12">
            <p style="line-height:22px;">
                欢迎来到随堂测试系统。管理员账户可以对所有信息进行管理，教师可以管理题目、班级、测试信息，学生剋在线自主做题以及处理老师布置的任务。<br/><br/>

                <br/><br/><br/><br/><br/><br/><br/><br/><br/>
            </p>
        </div>
    </div>
</div>
<%@include file="/pages/common/footer.jsp"%>

