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


            $("[name='modify']").click(function () {
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
                $("[name='modal']").attr("value",2);
                let problemId = $(this).attr("value");
                $("[name='modifyId']").attr("value",problemId);
                $.getJSON("${pageScope.basePath}problemServlet","action=ajaxShowProblemDescribe&problemId="+problemId,function (data) {
                    $("#editContestModalLabel").text("正在修改第"+problemId+"问题");
                    $("#contest-announcement-edit").text(data.selectProblem.describe);
                    $("#contest-description-edit").text(data.selectProblem.analysis);
                    $("#selectSubject").children().each(function () {
                        if($(this).attr("value")===data.selectProblem.subjectId) {
                            $(this).prop("selected",true);
                        }
                    })
                    $("#singleA").removeClass("active");
                    $("#singleB").removeClass("active");
                    $("#singleC").removeClass("active");
                    $("#singleD").removeClass("active");
                    $("#singleA").children(":first").removeAttr("checked");
                    $("#singleB").children(":first").removeAttr("checked");
                    $("#singleC").children(":first").removeAttr("checked");
                    $("#singleD").children(":first").removeAttr("checked");
                    $("#mutiA").removeAttr("checked");
                    $("#mutiB").removeAttr("checked");
                    $("#mutiC").removeAttr("checked");
                    $("#mutiD").removeAttr("checked");
                    $("#mutiA").parent().removeClass("active");
                    $("#mutiB").parent().removeClass("active");
                    $("#mutiC").parent().removeClass("active");
                    $("#mutiD").parent().removeClass("active");
                    $("#boolA").removeClass("active");
                    $("#boolA").children(":first").removeAttr("checked");
                    $("#boolB").removeClass("active");
                    $("#boolB").children(":first").removeAttr("checked");
                    if(data.selectProblem.type==="单选"){
                        $("#contest-type-0").addClass("active")
                        $("#contest-type-1").removeClass("active")
                        $("#contest-type-2").removeClass("active")
                        $("#contest-type-0").children(":first").attr("checked","true");
                        $("#contest-type-1").children(":first").removeAttr("checked");
                        $("#contest-type-2").children(":first").removeAttr("checked");
                        $("#optionA").val(data.selectOptions[0]);
                        $("#optionB").val(data.selectOptions[1]);
                        $("#optionC").val(data.selectOptions[2]);
                        $("#optionD").val(data.selectOptions[3]);
                        $("#optionA").removeAttr("disabled");
                        $("#optionB").removeAttr("disabled");
                        $("#optionC").removeAttr("disabled");
                        $("#optionD").removeAttr("disabled");
                        $("#typeSingle").attr("style","display:block");
                        $("#typeMuti").attr("style","display:none");
                        $("#typeBool").attr("style","display:none");
                        for(let i in data.selectAnswer) {
                            if(data.selectAnswer[i]==="A") {
                                $("#singleA").children(":first").attr("checked","checked");
                                $("#singleA").addClass("active");
                            }
                            if(data.selectAnswer[i]==="B") {
                                $("#singleB").children(":first").attr("checked","checked");
                                $("#singleB").addClass("active");
                            }
                            if(data.selectAnswer[i]=="C") {
                                $("#singleB").children(":first").attr("checked","checked");
                                $("#singleB").addClass("active");
                            }
                            if(data.selectAnswer[i]=="D") {
                                $("#singleB").children(":first").attr("checked","checked");
                                $("#singleB").addClass("active");
                            }
                        }
                    }
                    if(data.selectProblem.type==="多选") {
                        $("#contest-type-1").addClass("active")
                        $("#contest-type-0").removeClass("active")
                        $("#contest-type-2").removeClass("active")
                        $("#contest-type-1").children(":first").attr("checked","true");
                        $("#contest-type-0").children(":first").removeAttr("checked");
                        $("#contest-type-2").children(":first").removeAttr("checked");
                        $("#optionA").val(data.selectOptions[0]);
                        $("#optionB").val(data.selectOptions[1]);
                        $("#optionC").val(data.selectOptions[2]);
                        $("#optionD").val(data.selectOptions[3]);
                        $("#optionA").removeAttr("disabled");
                        $("#optionB").removeAttr("disabled");
                        $("#optionC").removeAttr("disabled");
                        $("#optionD").removeAttr("disabled");
                        $("#typeSingle").attr("style","display:none");
                        $("#typeMuti").attr("style","display:block");
                        $("#typeBool").attr("style","display:none");
                        for(let i in data.selectAnswer) {
                            if(data.selectAnswer[i]==="A") {
                                $("#mutiA").prop("checked",true);
                                $("#mutiA").parent().addClass("active");
                            }
                            if(data.selectAnswer[i]==="B") {
                                $("#mutiB").prop("checked",true);
                                $("#mutiB").parent().addClass("active");
                            }
                            if(data.selectAnswer[i]=="C") {
                                $("#mutiC").prop("checked",true);
                                $("#mutiC").parent().addClass("active");
                            }
                            if(data.selectAnswer[i]=="D") {
                                $("#mutiD").prop("checked",true);
                                $("#mutiD").parent().addClass("active");
                            }
                        }
                    }
                    if(data.selectProblem.type==="判断") {
                        $("#contest-type-2").addClass("active")
                        $("#contest-type-0").removeClass("active")
                        $("#contest-type-1").removeClass("active")
                        $("#contest-type-2").children(":first").attr("checked","checked");
                        $("#contest-type-0").children(":first").removeAttr("checked");
                        $("#contest-type-1").children(":first").removeAttr("checked");
                        $("#optionA").val("");
                        $("#optionB").val("");
                        $("#optionC").val("");
                        $("#optionD").val("");
                        $("#optionA").val("正确");
                        $("#optionB").val("错误");
                        $("#optionC").val("无");
                        $("#optionD").val("无");
                        $("#optionA").attr("disabled","disabled");
                        $("#optionB").attr("disabled","disabled");
                        $("#optionC").attr("disabled","disabled");
                        $("#optionD").attr("disabled","disabled");
                        $("#typeSingle").attr("style","display:none");
                        $("#typeMuti").attr("style","display:none");
                        $("#typeBool").attr("style","display:block");
                        for(let i in data.selectAnswer) {
                            if(data.selectAnswer[i]==="A") {
                                $("#boolA").children(":first").attr("checked","checked");
                                $("#boolA").addClass("active");
                            }
                            if(data.selectAnswer[i]==="B") {
                                $("#boolA").children(":first").attr("checked","checked");
                                $("#boolA").addClass("active");
                            }
                        }
                    }

                })
            })

            $("#createProblemBtn").click(function () {
                $("[name='modal']").attr("value",1);
                $("body").addClass("modal-open");
                $("#createProblemModal").addClass("in");
                $("#createProblemModal").attr("style","display:block;");
                $("#createProblemModal").attr("aria-hidden","true");
                $("#createProblemBackground").addClass("in");
                $("#createProblemBackground").attr("style","display:block;");
                $("#editContestModalLabel").text("创建题目");
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

            $("#filter").click(function () {
                $("#searchProblemForm").submit();
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

            $("[name='btnToProblem']").click(function () {
                if(${empty sessionScope.student}) {
                    $(this).attr("href","pages/user/login.jsp");
                }
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
                        <form id="searchProblemForm" action="problemServlet" >
                            <input hidden="hidden" name="action" value="searchProblemByParameter">
                        <th class="oj sorting_disabled" rowspan="1" colspan="1" >科目<br>
                            <select name="searchSubjectId" id="searchSelect" class="custom-select" data-width="auto">
                            </select>
                        </th>
                        <th class="prob_num sorting" tabindex="0" aria-controls="listProblem" rowspan="1" colspan="1"
                            aria-label="Prob: activate to sort column ascending">
                            编号<br>
                        </th>
                        <th class="title sorting" tabindex="0" aria-controls="listProblem" rowspan="1" colspan="1"
                            aria-label="Title: activate to sort column ascending" value="">
                            标题<br>
                            <input type="text" id="title" name="title" class="search_text" style="width:95%">
                        </th>
                        <th class="oj hidden-md-down sorting_disabled" rowspan="1" colspan="1" aria-label="Source">
                            类型<br>
                            <select name="searchType" id="OJId" class="custom-select" data-width="auto">
                                <option value="所有">所有题型</option>
                                <option value="单选">单选</option>
                                <option value="多选">多选</option>
                                <option value="判断">判断</option>
                            </select>
                        </th>
                        <c:if test="${sessionScope.type ne 'student'}" >
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
                        </c:if>


                        </form>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.page.items}" var="problem">
                        <tr class="odd">
                            <td class="oj subject">${problem.subjectId}</td>
                            <td class=" prob_num">
                                <div><a href="problemServlet?action=showProblemDetails&problemId=${problem.id}" name="btnToProblem" target="_blank" title="" data-toggle="tooltip"
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
                            <c:if test="${sessionScope.type ne 'student'}">
                                <td class="date" ><span value="${problem.id}" name="modify" style="color:#749fd5; cursor: pointer" id="modifyBtn">修改</span></td>
                                <td class="date sorting_1"><i class="fa fa-check text-success"></i>
                                    <a href="testServlet?action=addProblemToContest&problemId=${problem.id}">
                                        <div class="localizedTime" data-time="1651387901000" rendered="true">
                                            <span class="relative">添加</span>
                                        </div>
                                    </a>
                                </td>
                            </c:if>
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
