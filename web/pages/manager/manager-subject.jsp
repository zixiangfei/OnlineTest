<%--
  Created by IntelliJ IDEA.
  User: zhengluzhou
  Date: 2022/4/30
  Time: 1:40 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manager-OnlineTest</title>
    <%@include file="/pages/common/head.jsp"%>
    <script type="text/javascript">
        $(function () {
            <c:if test="${not sessionScope.type eq 'admin'}">
            window.location.replace("pages/user/login.jsp");
            </c:if>

            $("#insertSubjectClose").click(function () {
                $("#insertSubjectModal").removeClass("in");
                $("#insertSubjectModal").attr("style","display:none;");
                $("#insertSubjectModal").attr("aria-hidden","false");
            })

            $("#insertSubjectCancel").click(function () {
                $("#insertSubjectModal").removeClass("in");
                $("#insertSubjectModal").attr("style","display:none;");
                $("#insertSubjectModal").attr("aria-hidden","false");
            })

            $("#insertSubjectOpen").click(function () {
              //  alert(11);
                $("#insertSubjectModal").addClass("in");
                $("#insertSubjectModal").attr("style","display:block;");
                $("#insertSubjectModal").attr("aria-hidden","true");
            })

            $("#btn-insert").click(function () {
              //  alert(1111);
                var username = $("#insert-name").val();
                console.log(username);
                $.getJSON("${pageScope.basePath}subjectServlet","action=ajaxExistsSubjectName&name="+username,function (data) {
                    console.log(data)
                    if(data.existsSubjectName) {
                        $("#insert-alert").attr("style","display:block");
                        $("#insert-alert").innerHTML="已存在该课程";
                    }
                    // else {
                    //     $("#add-form").submit();
                    // }
                })
            })

            $("#insert-name").change(function () {
                var username = this.value;
                console.log(username);
                $.getJSON("${pageScope.basePath}subjectServlet","action=ajaxExistsSubjectName&name="+username,function (data) {
                    console.log(data)
                    if(data.existsSubjectName) {
                        $("#insert-alert").attr("style","display:block");
                        $("#insert-alert").text("已存在该课程");
                    }
                })
            })
        })

    </script>
    <style type="text/css">
        .not-active {
            pointer-events: none;
            cursor: default;
        }
    </style>
</head>
<body>
<%@include file="/pages/common/header.jsp"%>
<link type="text/css" rel="stylesheet" href="static/css/body.css">
<div class="container-fluid" id="problem_list_container" style="margin-top: 30px;">
    <div class="row">
        <div class="col-md-12" id="right-panel">
            <div id="listUser_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                <div class="">
                    <div class="dataTables_paginate paging_simple_numbers" id="listUser_paginate">
                        <%@include file="/pages/common/page_nav.jsp"%>
                    </div>
                    <div id="buttonContainer_l">
<%--                        <input type="button" id="filter" class="btn btn-secondary btn-md" value="Filter" style="">--%>
                        <input type="button" id="insertSubjectOpen" class="btn btn-secondary btn-md" value="新增" style="">
                    </div>
                    <div id="buttonContainer_r">
                        <div id="statRange" class="btn-group" data-toggle="buttons" style="">
                            <label class="btn btn-secondary" id="btn-teacher">
                                <a href="teacherServlet?action=pageTeacher" style="color:#000;">教师</a>
                            </label>
                            <label class="btn btn-secondary active not-active" id="btn-course">
                                <a href="subjectServlet?action=pageSubject" style="color:#000;">课程</a>
                            </label>
                            <label class="btn btn-secondary " id="btn-class">
                                <a href="classServlet?action=pageClass" style="color:#000;">班级</a>
                            </label>
                            <label class="btn btn-secondary " id="btn-student">
                                <a href="studentServlet?action=pageStudent" style="color:#000;">学生</a>
                            </label>
                        </div>
                    </div>
                </div>
                <table id="listUser" class="table table-striped table-bordered table-responsive dataTable no-footer">
                    <thead>
                    <tr>
                        <th class="rank" rowspan="1" colspan="1" aria-label="Rank" align="center">编号</th>
                        <th class="username sorting_disabled" rowspan="1" colspan="1" aria-label="Username">课程名<br>
<%--                            <input type="text" id="username" name="username" class="search_text" style="width:95%">--%>
                        </th>
                        <th class="nickname sorting_disabled" rowspan="1" colspan="1" aria-label="Nickname">删除<br>
<%--                            <input type="text" id="nickname" name="nickname" class="search_text" style="width:95%">--%>
                        </th>
<%--                        <th class="school sorting_disabled" rowspan="1" colspan="1" aria-label="School">School<br>--%>
<%--                        <input type="text" id="school" name="school" class="search_text" style="width:95%">--%>
                        </th>
                        <th class="solved sorting_disabled" rowspan="1" colspan="1" aria-label="Solved">修改</th>
<%--                        <th class="attempted sorting_disabled" rowspan="1" colspan="1" aria-label="Attempted">Attempted</th>--%>
                    </tr>
                    </thead>
<%--                    <tbody>--%>
                    <tbody>
                    <c:forEach items="${requestScope.page.items}" var="subject" varStatus="i">
                    <tr class="${i.index%2==0?"odd":"even"}">
                        <td class="rank">${i.index+1}</td>
                        <td class=" username">${subject.name}</td>
                        <td class=" nickname">1</td>
<%--                        <td class=" school"><div>${student.classId}</div></td>--%>
                        <td class=" solved"><a href="" target="_blank">1</a></td>
<%--                        <td class=" attempted"><a href="" target="_blank">1</a></td>--%>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="insertSubjectModal" tabindex="-1" role="dialog" style="display: none;" aria-hidden="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" id="insertSubjectClose">
                    <span>×</span>
                </button>
                <h4 class="modal-title" id="loginModalLabel">增加课程</h4>
            </div>
            <div class="modal-body">
                <form id="add-form" action="subjectServlet" method="get">
                    <input hidden="hidden" name="action" value="add">
                    <input hidden="hidden" name="pageNo" value="${requestScope.page.pageNo}">
                    <div class="form-group">
                        <!--<label for="login-username" class="form-control-label">Username:</label>-->
                        <input type="text" class="form-control" name="insert-name" id="insert-name" placeholder="请输入课程名称">
                    </div>
<%--                    <div class="form-group">--%>
<%--                        <!--<label for="login-password" class="form-control-label">Password:</label>-->--%>
<%--                        <input type="password" class="form-control" id="login-password" placeholder="Password">--%>
<%--                    </div>--%>
                    <input type="submit" style="display: none">
                </form>
            </div>
            <div class="modal-footer">
                    <div class="alert alert-danger" role="alert" id="insert-alert" style="display: none"></div>
<%--                <button type="button" class="btn btn-secondary float-xs-left" id="btn-forget-password">--%>
<%--                    Forget Password--%>
<%--                </button>--%>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="insertSubjectCancel">取消</button>
                <button type="button" class="btn btn-primary" id="btn-insert">确定</button>
            </div>
        </div>
    </div>
</div>
<%@include file="/pages/common/footer.jsp"%>
</body>
</html>
