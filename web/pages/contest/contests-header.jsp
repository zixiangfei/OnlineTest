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
                console.log(nowTimestamp)
                if (nowTimestamp < startTime) {
                    var hour2 = Math.floor(Math.floor(remainTimestamp / 1000) / 3600);
                    var mins2 = Math.floor(Math.floor(Math.floor(remainTimestamp / 1000) % 3600) / 60);
                    var secs2 = Math.floor(Math.floor(remainTimestamp / 1000) % 60);
                    var remaining = hour2 + ":" + mins2 + ":" + secs2;
                    $("#info-running").attr("style", "color:blue;cursor:auto;");
                    $("#info-running").text("Start counting down:" + remaining);
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
                    $("#info-running").text("Running...")
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
                    $("#info-running").text("End")
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
                $(".nav-tabs").children().children().removeClass("active");
                $(this).addClass("active");
                $(".tab-pane").removeClass("active");
                $("#problem").addClass("active");
            })

            $("#pageToStatus").click(function () {
                $(".nav-tabs").children().children().removeClass("active");
                $(this).addClass("active");
                $(".tab-pane").removeClass("active");
                $("#status").addClass("active");
            })

            $("[name='selectionProblem']").click(function () {
                let num = $(this).attr("num");
                $("#description-container").empty();
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
                $("[name='selectionProblem']").removeClass("active");
                $(this).addClass("active");
                $("#frame-description-container").children(":first").attr("src","problemServlet?action=showProblemDescribe&problemId="+num)
                $("#problem-title").text("ID - "+num);
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
                <b>Begin:</b>
                <span class="timestamp">${requestScope.curTest.beginTime}</span>
            </div>
            <div class="col-xs-6 text-xs-center">
                <h3>
                    ${requestScope.curTest.name}
                </h3>
            </div>
            <div class="col-xs-3 text-xs-right">
                <b>End:</b>
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
                   aria-expanded="true">Overview</a>
            </li>


            <li class="nav-item">
                <a class="nav-link" id="pageToProblem" data-toggle="tab" section="problem" role="tab"
                   aria-expanded="false">Problem</a>
            </li>


            <li class="nav-item">
                <a class="nav-link" id="pageToStatus" data-toggle="tab" section="status" role="tab"
                   aria-expanded="false">Status</a>
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
                                <th class="all-stat">Stat</th>
                                <th class="prob-num">#</th>
                                <th class="prob-title text-xl-left">Title</th>
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

                            <div id="prob-operation" class="row">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <button type="button" class="btn btn-primary" id="problem-submit">Submit
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <a href="javascript:void(0)" class="btn btn-secondary active" id="btn-contest-status">A</a>
                                        </div>
                                        <div class="col-xs-3">
                                            <a href="javascript:void(0)" class="btn btn-secondary" id="btn-contest-status">B</a>
                                        </div>
                                        <div class="col-xs-3">
                                            <a href="javascript:void(0)" class="btn btn-secondary" id="btn-contest-status">C</a>
                                        </div>
                                        <div class="col-xs-3">
                                            <a href="javascript:void(0)" class="btn btn-secondary" id="btn-contest-status">D</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

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
                        <thead style="position: fixed; top: 0px; width: 0px; display: none; left: 0px;"
                               id="rank-table-header">
                        <tr>
                            <th class="rank" rowspan="2">
                                <div>Rank</div>
                            </th>
                            <th class="team" rowspan="2">
                                <div>Team</div>
                            </th>
                            <th class="solve" rowspan="2">
                                <div>Score</div>
                            </th>
                            <th class="penalty" rowspan="2">
                                <div>Penalty</div>
                            </th>
                            <th class="prob undefined">
                                <div><a href="#problem/A">A</a></div>
                            </th>
                            <th class="prob undefined">
                                <div><a href="#problem/B">B</a></div>
                            </th>
                            <th class="prob accepted">
                                <div><a href="#problem/C">C</a></div>
                            </th>
                            <th class="prob undefined">
                                <div><a href="#problem/D">D</a></div>
                            </th>
                            <th class="prob accepted">
                                <div><a href="#problem/E">E</a></div>
                            </th>
                            <th class="prob undefined">
                                <div><a href="#problem/F">F</a></div>
                            </th>
                            <th class="prob undefined">
                                <div><a href="#problem/G">G</a></div>
                            </th>
                            <th class="prob undefined">
                                <div><a href="#problem/H">H</a></div>
                            </th>
                            <th class="prob undefined">
                                <div><a href="#problem/I">I</a></div>
                            </th>
                            <th class="prob undefined">
                                <div><a href="#problem/J">J</a></div>
                            </th>
                            <th class="prob accepted">
                                <div><a href="#problem/K">K</a></div>
                            </th>
                        </tr>
                        <tr>
                            <th class="prob undefined">
                                <div>0 / 6</div>
                            </th>
                            <th class="prob undefined">
                                <div>1 / 3</div>
                            </th>
                            <th class="prob accepted">
                                <div>10 / 11</div>
                            </th>
                            <th class="prob undefined">
                                <div>3 / 8</div>
                            </th>
                            <th class="prob accepted">
                                <div>9 / 9</div>
                            </th>
                            <th class="prob undefined">
                                <div>0 / 0</div>
                            </th>
                            <th class="prob undefined">
                                <div>0 / 1</div>
                            </th>
                            <th class="prob undefined">
                                <div>0 / 0</div>
                            </th>
                            <th class="prob undefined">
                                <div>0 / 0</div>
                            </th>
                            <th class="prob undefined">
                                <div>1 / 3</div>
                            </th>
                            <th class="prob accepted">
                                <div>9 / 11</div>
                            </th>
                        </tr>
                        </thead>
                        <thead style="">
                        <tr>
                            <th class="rank" rowspan="2">
                                <div>Rank</div>
                            </th>
                            <th class="team" rowspan="2">
                                <div>Team</div>
                            </th>
                            <th class="solve" rowspan="2">
                                <div>Score</div>
                            </th>
                            <th class="penalty" rowspan="2">
                                <div>Penalty</div>
                            </th>
                            <th class="prob undefined">
                                <div><a href="#problem/A">A</a></div>
                            </th>
                            <th class="prob undefined">
                                <div><a href="#problem/B">B</a></div>
                            </th>
                            <th class="prob accepted">
                                <div><a href="#problem/C">C</a></div>
                            </th>
                            <th class="prob undefined">
                                <div><a href="#problem/D">D</a></div>
                            </th>
                            <th class="prob accepted">
                                <div><a href="#problem/E">E</a></div>
                            </th>
                            <th class="prob undefined">
                                <div><a href="#problem/F">F</a></div>
                            </th>
                            <th class="prob undefined">
                                <div><a href="#problem/G">G</a></div>
                            </th>
                            <th class="prob undefined">
                                <div><a href="#problem/H">H</a></div>
                            </th>
                            <th class="prob undefined">
                                <div><a href="#problem/I">I</a></div>
                            </th>
                            <th class="prob undefined">
                                <div><a href="#problem/J">J</a></div>
                            </th>
                            <th class="prob accepted">
                                <div><a href="#problem/K">K</a></div>
                            </th>
                        </tr>
                        <tr>
                            <th class="prob undefined">
                                <div>0 / 6</div>
                            </th>
                            <th class="prob undefined">
                                <div>1 / 3</div>
                            </th>
                            <th class="prob accepted">
                                <div>10 / 11</div>
                            </th>
                            <th class="prob undefined">
                                <div>3 / 8</div>
                            </th>
                            <th class="prob accepted">
                                <div>9 / 9</div>
                            </th>
                            <th class="prob undefined">
                                <div>0 / 0</div>
                            </th>
                            <th class="prob undefined">
                                <div>0 / 1</div>
                            </th>
                            <th class="prob undefined">
                                <div>0 / 0</div>
                            </th>
                            <th class="prob undefined">
                                <div>0 / 0</div>
                            </th>
                            <th class="prob undefined">
                                <div>1 / 3</div>
                            </th>
                            <th class="prob accepted">
                                <div>9 / 11</div>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr c="467074" u="549119" class="this ">
                            <td class="rank meta">1</td>
                            <td class="team meta">
                                <div><img
                                        src="https://gravatar.loli.net/avatar/76974b614f8612c25c96fe1ce1d32aca?d=identicon"
                                        class="contestant-avatar"><a href="/user/NCC_21166" title="NCC_21166 Brattain"
                                                                     target="_blank">NCC_21166 <span style="color:gray">(Brattain)</span></a>
                                </div>
                            </td>
                            <td class="solved meta" data-original-title="" title=""><a
                                    href="#status/NCC_21166/-/0/">4</a></td>
                            <td class="penalty meta" data-original-title="" title=""><span class="minute">1007</span>
                                <span class="hms">16:47:43</span></td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted fb">04:17:29<br> <span>(-1)</span></td>
                            <td class="prob accepted">04:10:10<br>&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted">04:00:03<br>&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted">04:00:01<br>&nbsp;</td>
                        </tr>
                        <tr c="467074" u="548339" class="this ">
                            <td class="rank meta">2</td>
                            <td class="team meta">
                                <div><img
                                        src="https://gravatar.loli.net/avatar/ad03319ac9f3eadf16faf6032cff5e12?d=wavatar"
                                        class="contestant-avatar"><a href="/user/NCC_53847_A"
                                                                     title="NCC_53847_A Pegasus" target="_blank">NCC_53847_A
                                    <span style="color:gray">(Pegasus)</span></a></div>
                            </td>
                            <td class="solved meta" data-original-title="" title=""><a
                                    href="#status/NCC_53847_A/-/0/">4</a></td>
                            <td class="penalty meta" data-original-title="" title=""><span class="minute">1343</span>
                                <span class="hms">22:23:21</span></td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted fb">04:00:03<br>&nbsp;</td>
                            <td class="prob upsolved"><span>(-1)</span></td>
                            <td class="prob accepted">04:00:02<br>&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob failed"><span>(-1)</span></td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted">04:04:32<br> <span>(-1)</span></td>
                        </tr>
                        <tr c="467074" u="545440" class="this ">
                            <td class="rank meta">3</td>
                            <td class="team meta">
                                <div><img
                                        src="https://gravatar.loli.net/avatar/e005da234345d623cc6797fe99805d5e?d=robohash"
                                        class="contestant-avatar"><a href="/user/NCC_1895_B"
                                                                     title="NCC_1895_B Endeavour" target="_blank">NCC_1895_B
                                    <span style="color:gray">(Endeavour)</span></a></div>
                            </td>
                            <td class="solved meta" data-original-title="" title=""><a
                                    href="#status/NCC_1895_B/-/0/">3</a></td>
                            <td class="penalty meta"><span class="minute">720</span> <span class="hms">12:00:08</span>
                            </td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted">04:00:04<br>&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted">04:00:01<br>&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted">04:00:03<br>&nbsp;</td>
                        </tr>
                        <tr c="467074" u="545456" class="this ">
                            <td class="rank meta">4</td>
                            <td class="team meta">
                                <div><img
                                        src="https://gravatar.loli.net/avatar/2a232a38d3f34da6829bd37919e44cfc?d=monsterid"
                                        class="contestant-avatar"><a href="/user/NCC_62497_C" title="NCC_62497_C Akira"
                                                                     target="_blank">NCC_62497_C <span
                                        style="color:gray">(Akira)</span></a></div>
                            </td>
                            <td class="solved meta" data-original-title="" title=""><a
                                    href="#status/NCC_62497_C/-/0/">3</a></td>
                            <td class="penalty meta"><span class="minute">720</span> <span class="hms">12:00:19</span>
                            </td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted">04:00:04<br>&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted">04:00:15<br>&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted fb">04:00:00<br>&nbsp;</td>
                        </tr>
                        <tr c="467074" u="546132" class="this ">
                            <td class="rank meta">5</td>
                            <td class="team meta">
                                <div><img
                                        src="https://gravatar.loli.net/avatar/4bca50b62e69f66749397f3a45f70ad0?d=wavatar"
                                        class="contestant-avatar"><a href="/user/NCC_14232_" title="NCC_14232_ Berlin"
                                                                     target="_blank">NCC_14232_ <span
                                        style="color:gray">(Berlin)</span></a></div>
                            </td>
                            <td class="solved meta" data-original-title="" title=""><a
                                    href="#status/NCC_14232_/-/0/">3</a></td>
                            <td class="penalty meta"><span class="minute">721</span> <span class="hms">12:01:06</span>
                            </td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted">04:00:10<br>&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted">04:00:23<br>&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted">04:00:33<br>&nbsp;</td>
                        </tr>
                        <tr c="467074" u="553895" class="this ">
                            <td class="rank meta">6</td>
                            <td class="team meta">
                                <div><img
                                        src="https://gravatar.loli.net/avatar/1448cca142dca4e03f1024d5a351008c?d=retro"
                                        class="contestant-avatar"><a href="/user/NCC_20000_B"
                                                                     title="NCC_20000_B Valiant" target="_blank">NCC_20000_B
                                    <span style="color:gray">(Valiant)</span></a></div>
                            </td>
                            <td class="solved meta" data-original-title="" title=""><a
                                    href="#status/NCC_20000_B/-/0/">3</a></td>
                            <td class="penalty meta"><span class="minute">733</span> <span class="hms">12:13:49</span>
                            </td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob failed"><span>(-1)</span></td>
                            <td class="prob accepted">04:13:47<br>&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted fb">04:00:00<br>&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted">04:00:02<br>&nbsp;</td>
                        </tr>
                        <tr c="467074" u="545447" class="this ">
                            <td class="rank meta">7</td>
                            <td class="team meta">
                                <div><img
                                        src="https://gravatar.loli.net/avatar/e394e0653993ef7c86365f6cac8bf90d?d=monsterid"
                                        class="contestant-avatar"><a href="/user/NCC_58637_B"
                                                                     title="NCC_58637_B Copernicus" target="_blank">NCC_58637_B
                                    <span style="color:gray">(Copernicus)</span></a></div>
                            </td>
                            <td class="solved meta" data-original-title="" title=""><a
                                    href="#status/NCC_58637_B/-/0/">3</a></td>
                            <td class="penalty meta"><span class="minute">771</span> <span class="hms">12:51:21</span>
                            </td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted">04:01:54<br> <span>(-1)</span></td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted">04:02:40<br>&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob accepted">04:06:47<br> <span>(-1)</span></td>
                        </tr>
                        <tr c="467074" u="533994" class="this ">
                            <td class="rank meta">8</td>
                            <td class="team meta">
                                <div><img src="https://vj.csgrandeur.cn/user/avatar/533994?v=1647152965"
                                          class="contestant-avatar"><a href="/user/287029" title="287029 G20武守恒"
                                                                       target="_blank">287029 <span style="color:gray">(G20武守恒)</span></a>
                                </div>
                            </td>
                            <td class="solved meta" data-original-title="" title=""><a href="#status/287029/-/0/">3</a>
                            </td>
                            <td class="penalty meta"><span class="minute">78498</span> <span
                                    class="hms">1308:18:50</span></td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob upsolved">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob upsolved">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob upsolved">&nbsp;</td>
                        </tr>
                        <tr c="467074" u="228436" class="this myself">
                            <td class="rank meta">9</td>
                            <td class="team meta">
                                <div><img src="https://vj.csgrandeur.cn/user/avatar/228436?v=1646633996"
                                          class="contestant-avatar"><a href="/user/zixiangfei" title="zixiangfei 郑鲁州"
                                                                       target="_blank">zixiangfei <span
                                        style="color:gray">(郑鲁州)</span></a></div>
                            </td>
                            <td class="solved meta" data-original-title="" title=""><a
                                    href="#status/zixiangfei/-/0/">3</a></td>
                            <td class="penalty meta"><span class="minute">522003</span> <span
                                    class="hms">8700:03:16</span></td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob upsolved">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob upsolved">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob upsolved">&nbsp;</td>
                        </tr>
                        <tr c="467074" u="454752" class="this ">
                            <td class="rank meta">10</td>
                            <td class="team meta">
                                <div><img
                                        src="https://gravatar.loli.net/avatar/02c31783ccb333ec3549db6f50a8857a?d=monsterid"
                                        class="contestant-avatar"><a href="/user/ekatsim" title="ekatsim U20高宇"
                                                                     target="_blank">ekatsim <span style="color:gray">(U20高宇)</span></a>
                                </div>
                            </td>
                            <td class="solved meta"><a href="#status/ekatsim/-/0/">1</a></td>
                            <td class="penalty meta"><span class="minute">608</span> <span class="hms">10:08:49</span>
                            </td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob upsolved"><span>(-2)</span></td>
                            <td class="prob ">&nbsp;</td>
                        </tr>
                        <tr c="467074" u="544498" class="this ">
                            <td class="rank meta">11</td>
                            <td class="team meta">
                                <div><img
                                        src="https://gravatar.loli.net/avatar/86f3cb238d03a6261b01e59c87ee27a0?d=robohash"
                                        class="contestant-avatar"><a href="/user/Dr0pS" title="Dr0pS D20张良奎"
                                                                     target="_blank">Dr0pS <span style="color:gray">(D20张良奎)</span></a>
                                </div>
                            </td>
                            <td class="solved meta"><a href="#status/Dr0pS/-/0/">1</a></td>
                            <td class="penalty meta"><span class="minute">1569</span> <span class="hms">26:09:15</span>
                            </td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob upsolved">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                        </tr>
                        <tr c="467074" u="449135" class="this ">
                            <td class="rank meta">12</td>
                            <td class="team meta">
                                <div><img
                                        src="https://gravatar.loli.net/avatar/e2c3b43eae1db8225885c96bb7feb56b?d=monsterid"
                                        class="contestant-avatar"><a href="/user/a2327295010" title="a2327295010 I20陈杨"
                                                                     target="_blank">a2327295010 <span
                                        style="color:gray">(I20陈杨)</span></a></div>
                            </td>
                            <td class="solved meta"><a href="#status/a2327295010/-/0/">1</a></td>
                            <td class="penalty meta"><span class="minute">1571</span> <span class="hms">26:11:13</span>
                            </td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob upsolved">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                        </tr>
                        <tr c="467074" u="544536" class="this ">
                            <td class="rank meta">13</td>
                            <td class="team meta">
                                <div><img
                                        src="https://gravatar.loli.net/avatar/e9c938867d1940d6ebac869b2fcd0461?d=retro"
                                        class="contestant-avatar"><a href="/user/lilaili" title="lilaili S20李来利"
                                                                     target="_blank">lilaili <span style="color:gray">(S20李来利)</span></a>
                                </div>
                            </td>
                            <td class="solved meta"><a href="#status/lilaili/-/0/">1</a></td>
                            <td class="penalty meta"><span class="minute">4889</span> <span class="hms">81:29:07</span>
                            </td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob upsolved"><span>(-4)</span></td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                        </tr>
                        <tr c="467074" u="544524" class="this ">
                            <td class="rank meta">14</td>
                            <td class="team meta">
                                <div><img
                                        src="https://gravatar.loli.net/avatar/a7c901f953e9d6cf1e2ea9f33095ea77?d=wavatar"
                                        class="contestant-avatar"><a href="/user/Houxc535" title="Houxc535 S20侯祥晨"
                                                                     target="_blank">Houxc535 <span style="color:gray">(S20侯祥晨)</span></a>
                                </div>
                            </td>
                            <td class="solved meta"><a href="#status/Houxc535/-/0/">0</a></td>
                            <td class="penalty meta"><span class="minute">0</span> <span class="hms">00:00:00</span>
                            </td>
                            <td class="prob failed"><span>(-6)</span></td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                            <td class="prob ">&nbsp;</td>
                        </tr>
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
