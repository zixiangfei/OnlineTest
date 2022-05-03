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
            $("#createClassBtn").click(function () {
                $("#createClassModal").addClass("in");
                $("#createClassModal").attr("style","display:block;");
                $("#createClassModal").attr("aria-hidden","true");

                $.getJSON("${pageScope.basePath}teacherServlet","action=ajaxAllTeacher",function (data) {
                    $("#selectTeacher").empty();
                    for(let i in data.teachers) {
                        var value = data.teachers[i].id;
                        var name = data.teachers[i].username;
                        $("#selectTeacher").append("<option value="+value+">"+name+"</option>")
                    }
                })
            })

            $("#insert-name").blur(function () {
                var name = this.value;
                $.getJSON("${pageScope.basePath}classServlet","action=ajaxExistsClass&name="+name,function (data) {
                    if(data.existsClass) {
                        $("#insert-alert").attr("style","display:block");
                        $("#insert-alert").text("已存在该课程");
                    }
                    else {
                        $("#insert-alert").attr("style","display:none");
                    }
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

            $.getJSON("${pageScope.basePath}teacherServlet","action=ajaxAllTeacher",function (data) {
                let $name = $("[name='teacherName']");
                $name.each(function () {
                    for(let i in data.teachers) {
                        var value = data.teachers[i].username;
                        var teacherId = data.teachers[i].id+"";
                        console.log(this.innerText);
                        console.log(teacherId);
                        if(this.innerText===teacherId) {
                            this.innerText=value;
                        }
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
                        <input type="button" id="filter" class="btn btn-secondary btn-md" value="Filter" style="">
                        <input type="button" id="createClassBtn" class="btn btn-secondary btn-md" value="添加班级" style="">
                    </div>
                    <div id="buttonContainer_r">
                        <div id="statRange" class="btn-group" data-toggle="buttons" style="">
                            <label class="btn btn-secondary" id="btn-teacher">
                                <a href="teacherServlet?action=pageTeacher" style="color:#000;">教师</a>
                            </label>
                            <label class="btn btn-secondary" id="btn-course">
                                <a href="subjectServlet?action=pageSubject" style="color:#000;">课程</a>
                            </label>
                            <label class="btn btn-secondary  active not-active" id="btn-class">
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
                        <th class="username sorting_disabled" rowspan="1" colspan="1" aria-label="Username">班级名<br>
<%--                            <input type="text" id="username" name="username" class="search_text" style="width:95%">--%>
                        </th>
                        <th class="nickname sorting_disabled" rowspan="1" colspan="1" aria-label="Nickname" >教师名<br>
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
                    <c:forEach items="${requestScope.page.items}" var="Class" varStatus="i">
                    <tr class="${i.index%2==0?"odd":"even"}">
                        <td class="rank">${i.index+1}</td>
                        <td class=" username"><a href="/user/Heart_Blue" target="_blank">${Class.name}</a></td>
                        <td class=" nickname" name="teacherName">${Class.teacherId}</td>
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
<div class="modal fade" id="createClassModal" tabindex="-1" role="dialog" style="display: none;" aria-hidden="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" id="createClassClose">
                    <span>×</span>
                </button>
                <h4 class="modal-title" id="loginModalLabel">增加班级</h4>
            </div>
            <div class="modal-body">
                <form id="add-form" action="classServlet" method="get">
                    <input hidden="hidden" name="action" value="add">
                    <input hidden="hidden" name="pageNo" value="${requestScope.page.pageNo}">
                    <div class="form-group row">
                        <label for="insert-name" class="col-xs-2 col-form-label">班级名</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" name="insert-name" id="insert-name" placeholder="请输入班级名称">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="selectTeacher" class="col-xs-2 col-form-label">科目</label>
                        <div class="col-xs-10">
                            <select id="selectTeacher" class="custom-select" v="oj" name="teacherId"></select>
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
