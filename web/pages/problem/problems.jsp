<%--
  Created by IntelliJ IDEA.
  User: zhengluzhou
  Date: 2022/4/30
  Time: 11:17 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Problems-OnlineTest</title>
    <%@include file="/pages/common/head.jsp" %>
    <link rel="stylesheet" href="static/css/problem.css">

    <script type="text/javascript">
        $(function () {

            $("#createProblemBtn").click(function () {
                $("body").addClass("modal-open");
                $("#createProblemModal").addClass("in");
                $("#createProblemModal").attr("style","display:block;");
                $("#createProblemModal").attr("aria-hidden","true");
                $("#createProblemBackground").addClass("in");
                $("#createProblemBackground").attr("style","display:block;");
                $.getJSON("${pageScope.basePath}subjectServlet","action=ajaxAllSubject",function (data) {
                    $("#selectSubject").empty();
                    console.log(data);
                    for (let i in data.subjects) {
                        console.log(i)
                        var value = data.subjects[i].name;
                        var subjectId = data.subjects[i].id;
                        $("#selectSubject").append("<option value="+subjectId+">"+value+"</option>")
                    }
                })
            })

                $.getJSON("${pageScope.basePath}subjectServlet","action=ajaxAllSubject",function (data) {
                    $("#searchSelect").empty();
                    for (let i in data.subjects) {
                        var value = data.subjects[i].name;
                        var subjectId = data.subjects[i].id;
                        $("#searchSelect").append("<option value="+subjectId+">"+value+"</option>")
                    }

                    $subject = $(".subject");
                    console.log($subject)
                    $subject.each(function () {
                        for (let i in data.subjects) {
                            var value = data.subjects[i].name;
                            var subjectId = data.subjects[i].id+"";
                            console.log(this.innerText);
                            if(subjectId===this.innerText) {
                                this.innerText=value;
                            }
                        }
                    })
                })

        })
    </script>
</head>
<body>
<%@include file="/pages/common/header.jsp" %>

<div class="container-fluid" id="problem_list_container" style="margin-top: 30px;">
    <div class="row">
        <div class="col-md-2" id="left-panel">
            <div class="list-group" id="prob-category">
                <a href="javascript:void(0)" class="list-group-item active" data-category="all">All</a>
                <a href="javascript:void(0)" class="list-group-item" data-category="solved">
                    Solved
                    <span class="tag tag-success tag-pill float-sm-right"></span>
                </a>
                <a href="javascript:void(0)" class="list-group-item" data-category="attempted">
                    Attempted
                    <span class="tag tag-default tag-pill float-sm-right"></span>
                </a>
                <a href="javascript:void(0)" class="list-group-item" data-category="favorites">
                    Favorites
                    <span class="tag tag-warning tag-pill float-sm-right"></span>
                </a>
                <input type="hidden" name="category" value="all">
            </div>
        </div>
        <div class="col-md-10" id="right-panel">
            <div id="listProblem_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                <div class="">
                    <div class="dataTables_paginate paging_simple_numbers" id="listProblem_paginate">
                        <%@include file="/pages/common/page_nav.jsp"%>
                    </div>
                    <div id="listProblem_processing" class="dataTables_processing card" style="display: none;">
                        Processing...
                    </div>
                    <div id="buttonContainer">
                        <input type="button" class="btn btn-secondary btn-md" id="filter"
                                                     value="Filter" style="">
                        <input type="button"
                               class="btn btn-secondary btn-md"
                               id="createProblemBtn" value="添加题目" style="">
                    </div>
                </div>
                <table id="listProblem" class="table table-striped table-bordered dataTable no-footer" width="100%"
                       cellspacing="0">
                    <thead>
                    <tr>
                        <th class="oj sorting_disabled" rowspan="1" colspan="1" >科目<br>
                            <select name="OJId" id="searchSelect" class="custom-select" data-width="auto">
                                <option>请选择科目</option>
                            </select>
                        </th>
                        <th class="prob_num sorting" tabindex="0" aria-controls="listProblem" rowspan="1" colspan="1"
                            aria-label="Prob: activate to sort column ascending">
                            编号<br>
                            <input type="text" id="probNum" name="probNum" class="search_text" style="width:95%">
                        </th>
                        <th class="title sorting" tabindex="0" aria-controls="listProblem" rowspan="1" colspan="1"
                            aria-label="Title: activate to sort column ascending">
                            标题<br>
                            <input type="text" id="title" name="title" class="search_text" style="width:95%">
                        </th>
                        <th class="oj hidden-md-down sorting_disabled" rowspan="1" colspan="1" aria-label="Source">
                            类型<br>
                            <select name="OJId" id="OJId" class="custom-select" data-width="auto">
                                <option value="单选">单选</option>
                                <option value="多选">多选</option>
                                <option value="判断">判断</option>
                            </select>
                        </th>
                        <th class="solved_users sorting" data-toggle="tooltip" title="" tabindex="0"
                            aria-controls="listProblem" rowspan="1" colspan="1"
                            aria-label="Solved: activate to sort column descending"
                            data-original-title="Sort by solved users">
                            正确
                        </th>
                        <th class="date sorting sorting_desc" data-toggle="tooltip" title="" tabindex="0"
                            aria-controls="listProblem" rowspan="1" colspan="1" aria-sort="descending"
                            aria-label="Update Time: activate to sort column ascending"
                            data-original-title="Sort by update time">错误
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.page.items}" var="problem">
                        <tr class="odd">
                            <td class="oj subject">${problem.subjectId}</td>
                            <td class=" prob_num">
                                <div><a href="/problem/51Nod-1619/origin" target="_blank" title="" data-toggle="tooltip"
                                        data-original-title="1619">${problem.id}</a></div>
                            </td>
                            <td class=" title">
                                <div>
                                    <c:if test="${fn:length(problem.describe)>=20}">
                                        ${fn:substring(problem.describe,0,20)}...
                                    </c:if>
                                    <c:if test="${fn:length(problem.describe)<20}">
                                        ${problem.describe}
                                    </c:if>
                                </div>
                            </td>
                            <td class=" source hidden-md-down">
                                <div title="" data-toggle="tooltip" data-placement="top"
                                     data-original-title="System Message">${problem.type}
                                </div>
                            </td>
                            <td class=" solved_users"><i class="fa fa-user"></i>${problem.correct}</td>
                            <td class="date sorting_1"><i class="fa fa-check text-success"></i>
                                <div class="localizedTime" data-time="1651387901000" rendered="true">
                                    <span class="relative">${problem.wrong}</span>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="">
                    <div class="dataTables_length" id="listProblem_length">
                        <label>Show
                            <select name="listProblem_length" aria-controls="listProblem"
                                    class="custom-select custom-select-sm form-control form-control-sm">
                                <option value="10">10</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                            </select>
                            entries</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="create_problem.jsp"%>
<%@include file="/pages/common/footer.jsp" %>
</body>
</html>
