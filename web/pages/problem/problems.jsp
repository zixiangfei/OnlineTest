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
            // let $btnModify = $("[name='modify']");
            // console.log($btnModify);
            // for(var i=0;i<$btnModify.length;++i) {
            //     var curBtn = $btnModify[i];
            //     console.log(curBtn)
            //     console.log(curBtn)
            // }

            $("[name='modify']").click(function () {
                console.log("test");
                console.log(this.id)
            })

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
                    $("#searchSelect").append("<option value=0>所有科目</option>");
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
        <div class="col-md-12" id="right-panel">
            <div id="listProblem_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                <div class="">
                    <div class="dataTables_paginate paging_simple_numbers" id="listProblem_paginate">
                        <%@include file="/pages/common/page_nav.jsp"%>
                    </div>
                    <div id="buttonContainer">
                        <input type="button" class="btn btn-secondary btn-md" id="filter"
                                                     value="查找" style="">
                        <input type="button"
                               class="btn btn-secondary btn-md"
                               id="createProblemBtn" value="添加题目" style="">
                    </div>
                    <c:if test="${not empty sessionScope.addMsg}" >
                        <div class="alert alert-success" style="text-align: right">${sessionScope.addMsg}</div>
                    </c:if>
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
                        </th>
                        <th class="title sorting" tabindex="0" aria-controls="listProblem" rowspan="1" colspan="1"
                            aria-label="Title: activate to sort column ascending">
                            标题<br>
                            <input type="text" id="title" name="title" class="search_text" style="width:95%">
                        </th>
                        <th class="oj hidden-md-down sorting_disabled" rowspan="1" colspan="1" aria-label="Source">
                            类型<br>
                            <select name="OJId" id="OJId" class="custom-select" data-width="auto">
                                <option value="所有">所有题型</option>
                                <option value="单选">单选</option>
                                <option value="多选">多选</option>
                                <option value="判断">判断</option>
                            </select>
                        </th>
                        <th class="solved_users sorting" data-toggle="tooltip" title="" tabindex="0"
                            aria-controls="listProblem" rowspan="1" colspan="1"
                            aria-label="Solved: activate to sort column descending"
                            data-original-title="Sort by solved users">
                            编辑
                        </th>
                        <th class="date sorting sorting_desc" data-toggle="tooltip" title="" tabindex="0"
                            aria-controls="listProblem" rowspan="1" colspan="1" aria-sort="descending"
                            aria-label="Update Time: activate to sort column ascending"
                            data-original-title="Sort by update time">添加到测验
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
                            <td class="date" ><span value="${problem.id}" name="modify" style="color:#749fd5; cursor: pointer" id="${problem.id}">修改</span></td>
                            <td class="date sorting_1"><i class="fa fa-check text-success"></i>
                                <a href="testServlet?action=addProblemToContest&problemId=${problem.id}">
                                    <div class="localizedTime" data-time="1651387901000" rendered="true">
                                        <span class="relative">添加</span>
                                    </div>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@include file="create_problem.jsp"%>
<%@include file="/pages/common/footer.jsp" %>
</body>
</html>
