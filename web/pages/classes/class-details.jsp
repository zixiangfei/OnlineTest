<%--
  Created by IntelliJ IDEA.
  User: zhengluzhou
  Date: 2022/5/3
  Time: 7:36 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>class-details</title>
    <%@include file="/pages/common/head.jsp"%>
</head>
<body>
<%@include file="/pages/common/header.jsp"%>
<link rel="stylesheet" href="static/css/class-details.css">
<div class="container">
    <div class="row">
        <div class="col-md-3 container" id="group-left-panel">
            <div class="card">
                <img class="card-img-top" src="${requestScope.curClass.image}" alt="Group logo" id="group-logo">
                <div class="card-block">
                    <p class="card-text" id="group-brief-card">${requestScope.curClass.name}</p>
                </div>
                <ul class="list-group list-group-flush">

                    <li class="list-group-item">
                        Leader:
                        <a href="" target="_blank">${requestScope.curTeacher.username}</a>
                    </li>

                    <li class="list-group-item">
                        Members: <a href="#members-anchor">${requestScope.curClass.members}</a>
                    </li>
                    <li class="list-group-item">
                        Contests:
                        <a href="#contests-anchor">
                            <span style="color: #5cb85c">${requestScope.testList.size()}</span>
                        </a>

                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-9 container" id="group-right-panel">
            <div class="row">
                <div class="col-md-4">
                    <h4 class="card-title" style="display: inline">
                        ${requestScope.curClass.name}
                    </h4>
                </div>
                <div class="col-md-8 text-md-right" id="group-oprts">
<%--                    <div class="btn-group" role="group"><a href="javascript:void(0)" class="btn btn-secondary join">Apply join</a></div>--%>
                     <input type="button" class="btn btn-primary" id="btn-create" value="Create Contest" style="">
                </div>
            </div>

            <div class="card" id="group-contests-card">
                <div class="card-block">

                    <div class="row">
                        <div class="col-md-4">
                            <h4 class="card-title" id="contests-anchor">Contests</h4>
                        </div>
                        <div class="col-md-8 text-md-right">
                            <a href="/contest/statistic?cids=491636" target="_blank" class="btn btn-secondary group-contest-stat">Statistics</a>
                        </div>
                    </div>

                    <div class="card-text">
                        <table class="table table-striped table-bordered table-responsive" id="group-contest-table">
                            <thead>
                            <tr>
                                <th class="title">Title</th>
                                <th class="date">Begin Time</th>
                                <th class="length">Length</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${requestScope.testList}" var="curTest" >
                                <tr>
                                    <td class="title">
                                        <div>
                                            <a href="/contest/491636" target="_blank" data-toggle="tooltip" title="${curTest.name}">${curTest.name}</a>
                                        </div>
                                    </td>
                                    <td class="date">
                                        <div class="localizedTime Ended" data-time="1651384800000" rendered="true">
                                            <span class="relative">2 days ago</span><span class="absolute">${curTest.startTime}</span></div>
                                    </td>
                                    <td>${curTest.time}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="card" id="group-members-card">
                <div class="card-block">
                    <h4 class="card-title" id="members-anchor">Members</h4>
                    <div class="card-text">
                        <table class="table table-striped table-bordered table-responsive" id="group-member-table">
                            <thead>
                            <tr>
                                <th>Role</th>
                                <th>Nick name</th>
                                <th>User name</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    <span class="tag tag-warning">教师</span></td>
                                <td>
                                    <a href="javascript:void(0)" class="nickname" data-original-title="" title="">${requestScope.curTeacher.nikename}</a>
                                </td>
                                <td>
                                    <a href="/user/njtechliubin" target="_blank">${requestScope.curTeacher.username}</a>
                                </td>
                            </tr>
                            <c:forEach items="${requestScope.studentList}" var="student" >
                            <tr>
                                <td>
                                    <span class="tag tag-default">成员</span>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" class="nickname" data-original-title="" title="">${student.nikename}</a>
                                </td>
                                <td>
                                    <a href="/user/wwb234" target="_blank">${student.username}</a>
                                </td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<%@include file="/pages/common/footer.jsp"%>
</body>
</html>
