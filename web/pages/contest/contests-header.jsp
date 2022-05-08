<%--
  Created by IntelliJ IDEA.
  User: zhengluzhou
  Date: 2022/5/1
  Time: 10:50 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contest-OnlineTest</title>
    <%@include file="/pages/common/head.jsp" %>
    <script>

        $(function () {
            var severtime = new Date($.ajax({async: false}).getResponseHeader("Date"));
            severtime.getTime();
            var nowTimestamp = severtime.getTime();

            var startTime = ${requestScope.curTest.startTime.time};
            var endTime = ${requestScope.curTest.endTime.time};
            var testLength = ${requestScope.curTest.time};

            function timeInfoUpdate() {

                nowTimestamp = nowTimestamp + 1000;
                if (nowTimestamp < startTime) {
                    var hour2 = Math.floor(Math.floor(remainTimestamp / 1000) / 3600);
                    var mins2 = Math.floor(Math.floor(Math.floor(remainTimestamp / 1000) % 3600) / 60);
                    var secs2 = Math.floor(Math.floor(remainTimestamp / 1000) % 60);
                    var remaining = hour2 + ":" + mins2 + ":" + secs2;
                    $("#info-running").attr("style", "color:blue;cursor:auto;");
                    $("#info-running").text("比赛还未开始");
                } else if (nowTimestamp < endTime) {
                    var deltaTimestamp = nowTimestamp - startTime;
                    var remainTimestamp = endTime - nowTimestamp;
                    var rate = deltaTimestamp / testLength;
                    rate = rate * 100;
                    var fanrate = 100 - rate;
                    $("#slider-selection").attr("style", "left: 0%; width: " + rate + "%");
                    $("#slider-handle").attr("style", "left: " + rate + "%");
                    $("#slider-track-high").attr("style", "right: 0%; width: " + fanrate + "%");
                    $("#slider-rangeHighlight").attr("style", "left: 0%; width: " + rate + "%");
                    $("#info-running").attr("style", "color:red;cursor:auto;");
                    $("#info-running").text("比赛进行中")
                    var hour = Math.floor(Math.floor(deltaTimestamp / 1000) / 3600);
                    var mins = Math.floor(Math.floor(Math.floor(deltaTimestamp / 1000) % 3600) / 60);
                    var secs = Math.floor(Math.floor(deltaTimestamp / 1000) % 60);
                    var elapsed = hour + ":" + mins + ":" + secs;
                    $("#info-elapsed").attr("style", "display:block");
                    $("#span-elapsed").text(elapsed);
                    var hour2 = Math.floor(Math.floor(remainTimestamp / 1000) / 3600);
                    var mins2 = Math.floor(Math.floor(Math.floor(remainTimestamp / 1000) % 3600) / 60);
                    var secs2 = Math.floor(Math.floor(remainTimestamp / 1000) % 60);
                    var remaining = hour2 + ":" + mins2 + ":" + secs2;
                    $("#info-remaining").attr("style", "display:block");
                    $("#span-remaining").text(remaining);
                } else {
                    $("#info-running").attr("style", "color:green;cursor:auto;");
                    $("#info-running").text("比赛已经结束")
                }

            }

            var repeat = setInterval(timeInfoUpdate, 1000);

            $("#pageToOverView").click(function () {

                $(".nav-tabs").children().children().removeClass("active");
                $(this).addClass("active");
                $(".tab-pane").removeClass("active");
                $("#overview").addClass("active");
            })

            $("#pageToProblem").click(function () {
                if(nowTimestamp<startTime) {
                    alert("比赛还未开始!");
                    return false;
                }
                $(".nav-tabs").children().children().removeClass("active");
                $(this).addClass("active");
                $(".tab-pane").removeClass("active");
                $("#problem").addClass("active");
            })

            $("#pageToStatus").click(function () {
                if(nowTimestamp<startTime) {
                    alert("比赛还未开始!");
                    return false;
                }
                $(".nav-tabs").children().children().removeClass("active");
                $(this).addClass("active");
                $(".tab-pane").removeClass("active");
                $("#status").addClass("active");
                $.getJSON("${pageScope.basePath}rankServlet","action=showRankDetails&testId=${requestScope.curTest.id}",function (data) {
                    let tbody = $("#contest-rank-table").children("tbody");
                    tbody.empty();
                    var i = 0;
                    for(let rankItem of data.rankItemList) {
                        i++;
                        var appendStr = "";
                        console.log(rankItem);
                        appendStr += "<tr class=\"this \">";
                        appendStr += "<td class=\"rank meta\">"+i+"</td>";
                        appendStr += "<td class=\"team meta\">";
                        appendStr += "<div>";
                        for(let studentItem of data.studentList) {
                            if(studentItem.id===rankItem.studentId) {
                              //  tbody.append("<a href=\"javascript:void(0)\">"+studentItem.username+"<span style=\"color:gray\">("+studentItem.nikename+")</span></a>")
                                appendStr += "<a href=\"javascript:void(0)\">";
                                appendStr += studentItem.username;
                                appendStr += "<span style=\"color:gray\">(";
                                appendStr += studentItem.nikename;
                                appendStr += ")</span></a>"
                            }
                        }
                        // tbody.append("</div>");
                        appendStr += "</div>";
                        // tbody.append("</td>")
                        appendStr += "</td>";
                        // tbody.append("<td class=\"solved meta\" data-original-title=\"\" title=\"\">");
                        appendStr += "<td class=\"solved meta\" data-original-title=\"\" title=\"\">";
                        // tbody.append("<a href=\"javascript:void(0)\">"+rankItem.score+"</a></td>");
                        appendStr += "<a href=\"javascript:void(0)\">";
                        appendStr += rankItem.score;
                        appendStr += "</a></td>";
                        for(let problem of data.problemList) {
                            var flag=0;
                            for(let recordItem of data.recordList) {
                                if(problem.id === recordItem.problemId) {
                                    if(recordItem.studentId === rankItem.studentId) {
                                        flag++;
                                        if(recordItem.correct === 1) {
                                            // tbody.append(" <td class=\"prob accepted\"></td>")
                                            appendStr += " <td class=\"prob accepted\"></td>";
                                        }
                                        else {
                                            // tbody.append(" <td class=\"prob failed\"></td>")
                                            appendStr += " <td class=\"prob failed\"></td>";
                                        }
                                    }
                                }
                            }
                            if(flag === 0) {
                                // tbody.append(" <td class=\"prob\"></td>")
                                appendStr += " <td class=\"prob\"></td>";
                            }
                        }
                        // tbody.append("</tr>")
                        appendStr += "</tr>";
                        tbody.append(appendStr);
                    }
                })
            })

            $("[name='selectionProblem']").click(function () {
                $("#submitForm").attr("style","display:block");

                var submitProblemId = $("[name='submitProblemId']").attr("value");
                var submitTestId = $("[name='submitTestId']").attr("value");
                var submitStudentId = $("[name='submitStudentId']").attr("value");
                let num = $(this).attr("num");
                $("#description-container").empty();
                $("[name='submitProblemId']").attr("value",num);
                $.getJSON("${pageScope.basePath}problemServlet","action=ajaxShowProblemDescribe&problemId="+num,function (data) {
                    $("#problem-origin").text(data.selectProblem.type);
                    $("#description-container").append("<dt></dt>");
                    $("#description-container").append("<dd>"+data.selectProblem.describe+"</dd>");
                    if(data.selectProblem.type=="判断") {

                        $("#description-container").append("<dt>A</dt>");
                        $("#description-container").append("<dd>正确</dd>");
                        $("#description-container").append("<dt>B</dt>");
                        $("#description-container").append("<dd>错误</dd>");
                    }
                    else {
                        $("#description-container").append("<dt>A</dt>");
                        $("#description-container").append("<dd>"+data.selectOptions[0]+"</dd>");
                        $("#description-container").append("<dt>B</dt>");
                        $("#description-container").append("<dd>"+data.selectOptions[1]+"</dd>");
                        $("#description-container").append("<dt>C</dt>");
                        $("#description-container").append("<dd>"+data.selectOptions[2]+"</dd>");
                        $("#description-container").append("<dt>D</dt>");
                        $("#description-container").append("<dd>"+data.selectOptions[3]+"</dd>");
                    }

                })
                $.getJSON("${pageScope.basePath}recordServlet","action=ajaxExistsRecord&submitStudentId="+submitStudentId+"&submitTestId="+submitTestId+"&submitProblemId="+submitProblemId,function (data) {
                   if(data.existsRecord) {
                       $("#description-container").append("<dt>解析</dt>");
                       $("#description-container").append("<dd>"+data.problemById.analysis+"</dd>");
                   }
                });
                    $("[name='selectionProblem']").removeClass("active");
                $(this).addClass("active");
                $("#frame-description-container").children(":first").attr("src","problemServlet?action=showProblemDescribe&problemId="+num)
                $("#problem-title").text("ID - "+num);
            })

            $("[name='submitOptionButton']").click(function () {
                let children = $(this).children(":first");
                console.log($(this).children(":first").prop("checked"))
                if($(this).children(":first").prop("checked")===true) {
                    $(this).children(":first").prop("checked",false);
                    $(this).removeClass("active");
                }
                else {
                    $(this).children(":first").prop("checked",true);
                    $(this).addClass("active");
                }
            })

            $("#problem-submit").click(function () {
                var submitProblemId = $("[name='submitProblemId']").attr("value");
                var submitTestId = $("[name='submitTestId']").attr("value");
                var submitStudentId = $("[name='submitStudentId']").attr("value");
                var flag = false
                if(severtime>endTime) {
                    $("#submit-alert").attr("style","display:block");
                    $("#submit-alert").text("比赛已结束");
                    return false;
                }
                $.getJSON("${pageScope.basePath}recordServlet","action=ajaxExistsRecord&submitStudentId="+submitStudentId+"&submitTestId="+submitTestId+"&submitProblemId="+submitProblemId,function (data) {
                    if(data.existsRecord) {
                        $("#submit-alert").attr("style","display:block");
                        $("#submit-alert").text("请勿重复提交!");
                    }
                    else {
                        $("#submit-alert").attr("style","display:none");
                        $("#submitForm").submit();
                    }
                })
                return false;
            })

        })

    </script>
</head>
<body>
<%@include file="/pages/common/header.jsp" %>
<link rel="stylesheet" href="static/css/contest.css">
<div class="container" style="margin-top: 30px; height: auto !important;">

    <div class="row card" id="time-info">
        <div class="row">
            <div class="col-xs-3 text-xs-left">
                <b>开始时间:</b>
                <span class="timestamp">${requestScope.curTest.beginTime}</span>
            </div>
            <div class="col-xs-6 text-xs-center">
                <h3>
                    ${requestScope.curTest.name}
                </h3>
            </div>
            <div class="col-xs-3 text-xs-right">
                <b>结束时间:</b>
                <span class="timestamp">${requestScope.curTest.endTimeStr}</span>
            </div>
        </div>
        <div class="row" id="contest-time-slider-container">
            <div class="slider slider-horizontal" id="contest-time-slider">
                <div class="slider-track">
                    <div class="slider-selection" style="left: 0%; width: 0%;" id="slider-selection"></div>
                    <div class="slider-track-high" style="right: 0%; width: 100%;" id="slider-track-high"></div>
                    <div class="slider-rangeHighlight slider-selection " style="left: 0%; width: 0%;"
                         id="slider-rangeHighlight"></div>
                </div>
                <div class="slider-handle min-slider-handle round" role="slider" aria-valuemin="0"
                     aria-valuemax="10800000" style="left: 0%;" aria-valuenow="3921428" aria-valuetext="01:05:21"
                     tabindex="0" id="slider-handle"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-3 text-xs-left" id="info-elapsed" style="display: none">
                <b>Elapsed:</b>
                <span class="elapsed" id="span-elapsed"></span>
            </div>
            <div class="col-xs-6 text-xs-center">
                <span id="info-running" style="color: red; cursor: auto;"></span>
            </div>
            <div class="col-xs-3 text-xs-right" id="info-remaining" style="display: none">
                <b>Remaining:</b>
                <span class="remaining" id="span-remaining"></span>
            </div>
        </div>
    </div>

    <div class="row" style="height: auto !important;">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist" id="contest-tabs">
            <li class="nav-item">
                <a class="nav-link active" id="pageToOverView" data-toggle="tab" section="overview" role="tab"
                   aria-expanded="true">概述</a>
            </li>


            <li class="nav-item">
                <a class="nav-link" id="pageToProblem" data-toggle="tab" section="problem" role="tab"
                   aria-expanded="false">问题</a>
            </li>


            <li class="nav-item">
                <a class="nav-link" id="pageToStatus" data-toggle="tab" section="status" role="tab"
                   aria-expanded="false">排名</a>
            </li>


        </ul>
        </div>
        <!-- Tab panes -->
        <div class="tab-content" style="height: auto !important;">

            <div class="tab-pane active" id="overview" role="tabpanel" aria-expanded="true">
                <link href="static/css/contest-overview.css" rel="stylesheet" type="text/css">

                <div id="contest_overview" class="container">

                    <div class="row">
                        <table id="contest-problems" class="table table-striped table-bordered table-responsive"
                               width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th class="my-stat"></th>
                                <th class="all-stat">答题情况</th>
                                <th class="prob-num">#</th>
                                <th class="prob-title text-xl-left">题目描述</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${requestScope.testProblemList}" var="problem" varStatus="i">
                                <tr>
                                    <td class="my-stat"></td>
                                    <td class="all-stat">
                                            <c:forEach items="${requestScope.testProblemStatusList}" var="problemStatus">
                                                <c:if test="${problemStatus.problemId==problem.id}">
                                                <a style="color:blue;">
                                                    ${problemStatus.correct}
                                                </a> / <a style="color:blue;">${problemStatus.total}</a>
                                                </c:if>
                                            </c:forEach>
                                    </td>
                                    <td class="prob-num text-xs-center">
                                        <a style="color: blue">
                                                ${(i.index+1)}
                                        </a>
                                    </td>
                                    <td class="prob-title" style="color:blue;">
                                        <c:if test="${fn:length(problem.describe)>=20}">
                                            ${fn:substring(problem.describe,0,20)}...
                                        </c:if>
                                        <c:if test="${fn:length(problem.describe)<20}">
                                            ${problem.describe}
                                        </c:if>
                                    </td>
                                </tr>


                            </c:forEach>

                            </tbody>
                        </table>
                    </div>

                </div>

            </div>

            <div class="tab-pane " id="problem" role="tabpanel" aria-expanded="true" style="height: auto !important;">
                <link href="static/css/contest-problem.css" rel="stylesheet" type="text/css">


                <div id="contest_problem" class="container" style="height: auto !important;">
                    <div class="row" style="height: auto !important;">
                        <div class="col-md-3 container" id="prob-left-panel"
                             style="height: auto !important; min-height: 0px !important;">
                            <ul class="nav nav-pills row" id="problem-nav">

                                <c:forEach items="${requestScope.testProblemList}" var="problem" varStatus="i">
                                    <li class="nav-item">
                                        <c:if test="${i.index==0}">
                                            <a num="${problem.id}" class="nav-link active" href="javascript:void(0)" name="selectionProblem" >${i.index+1}</a>
                                        </c:if>
                                        <c:if test="${i.index!=0}">
                                            <a num="${problem.id}" class="nav-link" href="javascript:void(0)" name="selectionProblem">${i.index+1}</a>
                                        </c:if>
                                    </li>
                                </c:forEach>

                            </ul>

                            <form action="recordServlet" style="display: none" id="submitForm">
                                <input name="action" value="submitRecord" hidden="hidden">
                                <input name="submitProblemId" value="1" hidden="hidden">
                                <input name="submitStudentId" value="${sessionScope.student.id}" hidden="hidden">
                                <input name="submitTestId" value="${requestScope.curTest.id}" hidden="hidden">
                                <div id="prob-operation" class="row">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <button type="submit" class="btn btn-primary" id="problem-submit" >提交</button>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <button type="button" class="btn btn-secondary" name="submitOptionButton">
                                                    A
                                                    <input type="checkbox" name="submitOption" value="A" style="display: none">
                                                </button>
                                            </div>
                                            <div class="col-xs-3">
                                                <button type="button" class="btn btn-secondary" name="submitOptionButton">
                                                    B
                                                    <input type="checkbox" name="submitOption" value="B" style="display: none">
                                                </button>
                                            </div>
                                            <div class="col-xs-3">
                                                <button type="button" class="btn btn-secondary" name="submitOptionButton">
                                                    C
                                                    <input type="checkbox" name="submitOption" value="C" style="display: none">
                                                </button>
                                            </div>
                                            <div class="col-xs-3">
                                                <button type="button" class="btn btn-secondary" name="submitOptionButton">
                                                    D
                                                    <input type="checkbox" name="submitOption" value="D" style="display: none">
                                                </button>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div class="alert alert-danger" role="alert" id="submit-alert" style="display: none"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </form>

                        </div>
                        <div class="col-md-9 container" id="prob-right-panel">
                            <div class="row">
                                <div id="prob-title-contest">
                                    <h2 id="problem-title">
                                    </h2>
                                    <span class="origin">
                                        <a id="problem-origin"></a>
                                    </span>
                                </div>
                            </div>
                            <div class="row" id="frame-description-container">
                                <div class="container" id="description-container">
                                    <dt>请选择题目查看具体信息</dt>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

            <div class="tab-pane " id="status" role="tabpanel" aria-expanded="true">

                <div id="contest_rank">

                    <table id="contest-rank-table" style="width: 100%;" class="" cellspacing="1">
                        <thead style="">
                        <tr>
                            <th class="rank" rowspan="2">
                                <div>排名</div>
                            </th>
                            <th class="team" rowspan="2">
                                <div>姓名</div>
                            </th>
                            <th class="solve" rowspan="2">
                                <div>得分</div>
                            </th>
                            <c:forEach items="${requestScope.testProblemList}" var="problem" varStatus="i">
                                <th class="prob undefined">
                                    <div><a href="javascript:void(0)">${i.index+1}</a></div>
                                </th>
                            </c:forEach>
                        </tr>
                        <tr>
                        <c:forEach items="${requestScope.testProblemList}" var="problem" varStatus="i">
                            <c:forEach items="${requestScope.testProblemStatusList}" var="problemStatus">
                                <c:if test="${problemStatus.problemId==problem.id}">
                                    <th class="prob undefined">
                                        <div>${problemStatus.correct}/${problemStatus.total}</div>
                                    </th>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>


                </div>

            </div>

        </div>

    </div>
</div>
<%@include file="/pages/common/footer.jsp" %>
</body>
</html>
