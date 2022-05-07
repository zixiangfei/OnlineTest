<%--
  Created by IntelliJ IDEA.
  User: zhengluzhou
  Date: 2022/5/6
  Time: 9:02 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>class-details</title>
    <%@include file="/pages/common/head.jsp"%>
    <script type="text/javascript" >
        $(function () {
            $("#btn-create").click(function () {
                $("body").addClass("modal-open");
                $("#createContestModal").addClass("in");
                $("#createContestModal").attr("style","display:block;");
                $("#createContestModal").attr("aria-hidden","true");
                $("#createContestBackground").addClass("in");
                $("#createContestBackground").attr("style","display:block;");

            })

        })
    </script>
</head>
<body class="modal-open">
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
                                            <a href="testServlet?action=showTestDetails&testId=${curTest.id}" target="_blank" data-toggle="tooltip" title="${curTest.name}">${curTest.name}</a>
                                        </div>
                                    </td>
                                    <td class="date">
                                        <div class="localizedTime Ended" >
                                            <span class="relative">${curTest.beginTime}</span></div>
                                    </td>
                                    <td>${curTest.length}</td>
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

<script type="text/javascript" >

    $(function () {
        $("#createContestCancel").click(function () {
            console.log(1111);
            $("body").removeClass("modal-open");
            $("#createContestModal").removeClass("in");
            $("#createContestModal").attr("style","display:none;");
            $("#createContestModal").attr("aria-hidden","false");
            $("#createContestBackground").removeClass("in");
            $("#createContestBackground").attr("style","display:none;");
        })

        $("#createContestClose").click(function () {
            $("body").removeClass("modal-open");
            $("#createContestModal").removeClass("in");
            $("#createContestModal").attr("style","display:none;");
            $("#createContestModal").attr("aria-hidden","false");
            $("#createContestBackground").removeClass("in");
            $("#createContestBackground").attr("style","display:none;");
        })

        $.getJSON("${pageScope.basePath}subjectServlet","action=ajaxAllSubject",function (data) {
            $subject = $(".subject");
            console.log($subject)
            console.log(data.subjects);
            $subject.each(function () {
                for (let i in data.subjects) {
                    var value = data.subjects[i].name;
                    var subjectId = data.subjects[i].id+"";
                    console.log(this.value);
                    if(subjectId===this.value) {
                        this.value=value;
                    }
                }
            })
        })

        $("#clearAddProblem").click(function () {

            if(confirm("你确定要清空题目列表吗？")===false) {
                return false;
            }
            else {

            }

        })

        let $removeProblems = $("[name='removeProblem']");
        console.log($removeProblems)
        $removeProblems.each(function () {
            let curProblem = $(this).attr("value")
            console.log(curProblem);
            $(this).onclick(function () {

            })
        })
        $("#btn-confirm").click(function () {
          //  var pattDateTime = /^(?:(?:1[6-9]|[2-9][0-9])[0-9]{2}([-/.]?)(?:(?:0?[1-9]|1[0-2])\1(?:0?[1-9]|1[0-9]|2[0-8])|(?:0?[13-9]|1[0-2])\1(?:29|30)|(?:0?[13578]|1[02])\1(?:31))|(?:(?:1[6-9]|[2-9][0-9])(?:0[48]|[2468][048]|[13579][26])|(?:16|[2468][048]|[3579][26])00)([-/.]?)0?2\2(?:29))$/;
            var pattDateTime = /\d{4}-\d{1,2}-\d{1,2}\s\d{1,2}:\d{1,2}:\d{1,2}/;

            var testStartTime = $("#contest-begin-time").attr("value");

            var contestLength = $("#contest-length").attr("value");
            var pattLengthTime = /^([01]\d|2[0-3]):[0-5]\d:[0-5]\d$/;

            var contestTitle = $("#contest-title").attr("value");
            if(contestTitle==null||contestTitle=="") {
                $("#edit-alert").attr("style","display:block");
                $("#edit-alert").text("测试名称不能为空!");
                return false;
            }

            if(!pattDateTime.test(testStartTime)) {
                $("#edit-alert").attr("style","display:block");
                $("#edit-alert").text("开始时间格式错误!");
                return false;
            }

            if(!pattLengthTime.test(contestLength)) {
                $("#edit-alert").attr("style","display:block");
                $("#edit-alert").text("测试时长格式错误!");
                return false;
            }


            $("#edit-alert").attr("style","display:none");
            $("#edit-alert").text("");
            $("#addNewContestForm").submit();


        })

    })


</script>
<form action="testServlet?action=addNewContest" method="post" id="addNewContestForm">
    <div class="modal fade in" id="createContestModal" tabindex="-1" role="dialog" style="display: block;" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="createContestClose">
                        <span>×</span>
                    </button>
                    <h4 class="modal-title" id="editContestModalLabel">创建测试</h4>
                </div>
                <div class="modal-body">
                    <h4 id="panel-info">基本信息</h4>
                    <div class="card-block">

                        <div class="form-group row" id="contest-group-group" style="display: block;">
                            <label for="contest-group" class="col-xs-2 col-form-label">班级</label>
                            <div class="col-xs-10">
                                <input value="${requestScope.curClass.id}" name="classId" hidden="hidden">
                                <input class="form-control" type="text" id="contest-group"  value="${requestScope.curClass.name}" disabled="disabled">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="contest-title" class="col-xs-2 col-form-label">标题</label>
                            <div class="col-xs-10">
                                <input class="form-control" type="text" id="contest-title" name="testName">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="contest-begin-time" class="col-xs-2 col-form-label">开始时间<small> (CST)</small></label>
                            <div class="col-xs-10">
                                <input class="form-control" type="text" id="contest-begin-time" placeholder="eg: 2016-12-31 23:59:59" name="testStartTime">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="contest-length" class="col-xs-2 col-form-label">测验时长</label>
                            <div class="col-xs-10">
                                <input class="form-control" type="text" id="contest-length" placeholder="eg: 01:00:00" name="testLength">
                            </div>
                        </div>

                    </div>

                    <hr>

                    <h4 id="panel-problems">问题设置</h4>

                    <div class="card-block" id="card-problems">
                        <table id="addTable" class="sorted_table">
                            <thead>
                            <tr>
                                <th style="width:80px;text-align: right;"></th>
                                <th style="width:80px;text-align: center;">科目</th>
                                <th style="width:80px;text-align: center;">问题编号</th>
                                <th style="width:30px;text-align: center;"></th>
                                <th style="text-align:left">题目描述</th>
                            </tr>
                            </thead>
                            <tbody id="addProblemTable">
                            <c:forEach items="${sessionScope.addProblemList}" var="addProblem" varStatus="cur">
                                <tr class="cp_row real" style="">
                                    <td class="oprt" style="text-align: right;">
                                        <a class="delete" href="testServlet?action=removeAddProblem&addProblemId=${addProblem.id}&classId=${requestScope.curClass.id}&type=1">
                                            <i class="fa fa-remove" name="removeProblem" value="${addProblem.id}">&nbsp;&nbsp;</i>
                                        </a>
                                    </td>
                                    <td>
                                        <input class="form-control subject" style="width:120px;"  value="${addProblem.subjectId}" disabled="disabled">
                                    </td>
                                    <td>
                                        <input class="form-control" style="width:120px;"  value="${addProblem.id}" disabled="disabled">
                                        <input type="hidden" value="${addProblem.id}" name="addProblemId">
                                    </td>
                                    <td class="num" style="text-align: center;">${cur.index}</td>
                                    <td><i class="fa fa-check text-success" style="cursor: pointer"></i> <span>${addProblem.describe}</span></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="alert alert-danger" role="alert" id="edit-alert" style="display: none"></div>
                    <a href="testServlet?action=clearAddProblem&classId=${curClass.id}&type=1">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="clearAddProblem">清空题单</button>
                    </a>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="createContestCancel">取消</button>
                    <button type="button" class="btn btn-primary" id="btn-confirm">确定</button>
                </div>
            </div>
        </div>
    </div>

</form>
<div class="modal-backdrop fade in" style="display:block;" id="createContestBackground"></div>
<%@include file="/pages/common/footer.jsp"%>
</body>
</html>
