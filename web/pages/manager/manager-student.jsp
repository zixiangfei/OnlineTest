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
            $.getJSON("${pageScope.basePath}classServlet","action=ajaxShowClassList",function (data) {
                let className = $("[name='className']");
                className.each(function () {
                    for(let i in data.classList) {
                        let name = data.classList[i].name;
                        let classId = data.classList[i].id+"";
                        console.log(classId);
                        console.log($(this).children(":first").text())
                        if($(this).children(":first").text()===classId) {
                            $(this).children(":first").text(name);
                        }
                    }
                })
            })

            $("[name='modifyBtn']").click(function () {
                $("#createClassModal").addClass("in");
                $("#createClassModal").attr("style","display:block;");
                $("#createClassModal").attr("aria-hidden","true");
                $.getJSON("${pageScope.basePath}classServlet","action=ajaxShowClassList",function (data) {
                    $("#selectClass").empty();
                    for(let i in data.classList) {
                        let name = data.classList[i].name;
                        let classId = data.classList[i].id;
                        $("#selectClass").append("<option value="+classId+">"+name+"</option>");
                    }
                })
                let modifyId = $(this).attr("value");
                $("[name='modifyId']").attr("value",modifyId);
                $.getJSON("${pageScope.basePath}studentServlet","action=ajaxShowStudentById&modifyId="+modifyId,function (data) {
                    $("#insert-name").attr("value",data.modifyStudent.nikename);
                })
            })


            $("#createClassClose").click(function () {
                $("#createClassModal").removeClass("in");
                $("#createClassModal").attr("style","display:none;");
                $("#createClassModal").attr("aria-hidden","false");
            })

            $("#createClassCancel").click(function () {
                $("#createClassModal").removeClass("in");
                $("#createClassModal").attr("style","display:none;");
                $("#createClassModal").attr("aria-hidden","false");
            })

            $("#btn-insert").click(function () {
                $("#add-form").submit();
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
<%--                    <div id="buttonContainer_l">--%>
<%--                        <input type="button" id="filter" class="btn btn-secondary btn-md" value="Filter" style="">--%>
<%--                        <input type="button" id="reset" class="btn btn-secondary btn-md" value="Reset" style="">--%>
<%--                    </div>--%>
                    <div id="buttonContainer_r">
                        <div id="statRange" class="btn-group" data-toggle="buttons" style="">
                            <label class="btn btn-secondary" id="btn-teacher">
                                <a href="teacherServlet?action=pageTeacher" style="color:#000;">教师</a>
                            </label>
                            <label class="btn btn-secondary" id="btn-course">
                                <a href="subjectServlet?action=pageSubject" style="color:#000;">课程</a>
                            </label>
                            <label class="btn btn-secondary" id="btn-class">
                                <a href="classServlet?action=pageClass" style="color:#000;">班级</a>
                            </label>
                            <label class="btn btn-secondary active not-active" id="btn-student">
                                <a href="studentServlet?action=pageStudent" style="color:#000;">学生</a>
                            </label>
                        </div>
                    </div>
                </div>
                <table id="listUser" class="table table-striped table-bordered table-responsive dataTable no-footer">
                    <thead>
                    <tr>
                        <th class="rank" rowspan="1" colspan="1" aria-label="Rank" align="center">编号</th>
                        <th class="username sorting_disabled" rowspan="1" colspan="1" aria-label="Username">账号<br>
<%--                            <input type="text" id="username" name="username" class="search_text" style="width:95%">--%>
                        </th>
                        <th class="nickname sorting_disabled" rowspan="1" colspan="1" aria-label="Nickname">昵称<br>
<%--                            <input type="text" id="nickname" name="nickname" class="search_text" style="width:95%">--%>
                        </th>
                        <th class="school sorting_disabled" rowspan="1" colspan="1" aria-label="School">班级<br>
<%--                        <input type="text" id="school" name="school" class="search_text" style="width:95%">--%>
                        </th>
                        <th class="solved sorting_disabled" rowspan="1" colspan="1" aria-label="Solved">修改</th>
<%--                        <th class="attempted sorting_disabled" rowspan="1" colspan="1" aria-label="Attempted">Attempted</th>--%>
                    </tr>
                    </thead>
<%--                    <tbody>--%>
                    <tbody>
                    <c:forEach items="${requestScope.page.items}" var="student" varStatus="i">
                    <tr class="${i.index%2==0?"odd":"even"}">
                        <td class="rank">${i.index+1}</td>
                        <td class=" username"><a href="javascript:void(0)" target="_blank">${student.username}</a></td>
                        <td class=" nickname">${student.nikename}</td>
                        <td class=" school" name="className"><div>${student.classId}</div></td>
                        <td class=" solved"><span style="color:blue;" name="modifyBtn" value="${student.id}">修改</span></td>
<%--                        <td class=" attempted"><a href="" target="_blank">1</a></td>--%>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="createClassModal" tabindex="-1" role="dialog" style="display: none;" aria-hidden="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" id="createClassClose">
                    <span>×</span>
                </button>
                <h4 class="modal-title" id="loginModalLabel">修改学生信息</h4>
            </div>
            <div class="modal-body">
                <form id="add-form" action="studentServlet" method="get">
                    <input hidden="hidden" name="action" value="modifyStudent">
                    <input hidden="hidden" name="modifyId" value="1">
                    <input hidden="hidden" name="pageNo" value="${requestScope.page.pageNo}">
                    <div class="form-group row">
                        <label for="insert-name" class="col-xs-2 col-form-label">昵称</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" name="insert-name" id="insert-name">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="selectClass" class="col-xs-2 col-form-label">班级</label>
                        <div class="col-xs-10">
                            <select id="selectClass" class="custom-select" v="oj" name="classId"></select>
                        </div>
                    </div>

                    <input type="submit" style="display: none">
                </form>
            </div>
            <div class="modal-footer">
                <div class="alert alert-danger" role="alert" id="insert-alert" style="display: none"></div>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="createClassCancel">取消</button>
                <button type="button" class="btn btn-primary" id="btn-insert">确定</button>
            </div>
        </div>
    </div>
</div>

<%@include file="/pages/common/footer.jsp"%>
</body>
</html>
