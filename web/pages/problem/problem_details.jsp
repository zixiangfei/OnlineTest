<%--
  Created by IntelliJ IDEA.
  User: zhengluzhou
  Date: 2022/5/3
  Time: 10:42 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>problem-details</title>
    <%@include file="/pages/common/head.jsp" %>

    <script type="text/javascript" >

        $(function () {
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

            var submitProblemId = $("[name='submitProblemId']").attr("value");
            var submitTestId = $("[name='submitTestId']").attr("value");
            var submitStudentId = $("[name='submitStudentId']").attr("value");
            $.getJSON("${pageScope.basePath}recordServlet","action=ajaxExistsRecord&submitStudentId="+submitStudentId+"&submitTestId="+submitTestId+"&submitProblemId="+submitProblemId,function (data) {
                if(data.existsRecord) {
                    $("#description-container").append("<dt>解析</dt>");
                    $("#description-container").append("<dd>"+data.problemById.analysis+"</dd>");
                }

                if(data.correct==1) {
                    $("#status").append("<span class=\"tag tag-success\">正确</span>");
                }
                else if(data.correct==0){
                    $("#status").append("<span class=\"tag tag-warning\">错误</span>")
                }
            });

            $("#problem-submit").click(function () {
                var flag = false
                let answer = $("[name='submitOptionButton']").attr("value");
                if(answer.length===0) {
                    $("#submit-alert").attr("style","display:block");
                    $("#submit-alert").text("还未选择答案");
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

            $.getJSON("${pageScope.basePath}subjectServlet","action=ajaxAllSubject",function (data) {

                $subject = $("[name='subject']");
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
<link type="text/css" rel="stylesheet" href="static/css/problem-details.css">
<div class="container" style="height: auto !important;">
    <div class="row" style="height: auto !important;">
        <div class="col-md-3 container" id="prob-left-panel" style="height: auto !important; min-height: 0px !important;">

            <form action="recordServlet"  id="submitForm">
                <input name="action" value="submitRecord" hidden="hidden">
                <input name="submitProblemId" value="${requestScope.problemById.id}" hidden="hidden">
                <input name="submitStudentId" value="${sessionScope.student.id}" hidden="hidden">
                <input name="submitTestId" value="0" hidden="hidden">
                <div id="prob-operation" class="row">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <button type="submit" class="btn btn-primary" id="problem-submit" >提交</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <a href="recordServlet?action=resetProblem&submitProblemId=${requestScope.problemById.id}&submitStudentId=${sessionScope.student.id}&submitTestId=0"><button type="button" class="btn btn-secondary" id="problem-reset" >重做</button></a>
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

            <div id="prob-properties" class="row">
                <div class="container">
                    <dl class="card row">
                        <dt class="col-sm-4">科目</dt>
                        <dd class="col-sm-8" name="subject">${requestScope.problemById.subjectId}</dd>
                        <dt class="col-sm-4">状态</dt>
                        <dd class="col-sm-8" id="status"></dd>
                    </dl>
                </div>
            </div>



        </div>

        <div class="col-md-9 container" id="prob-right-panel">
            <div class="row">
                <div id="prob-title">
                    <h2 id="problem-title">
                        ${requestScope.problemById.id} - ${requestScope.problemById.type}
                    </h2>
                    <span class="origin">
                        <a id="problem-origin"></a>
                    </span>
                </div>
            </div>
            <div class="row" id="frame-description-container">
                <div class="container" id="description-container">
                    <dt></dt>
                    <dd>${requestScope.problemById.describe}</dd>
                    <c:if test="${requestScope.problemById.type eq '判断'}">
                        <dt>A</dt>
                        <dd>正确</dd>
                        <dt>B</dt>
                        <dd>错误</dd>
                    </c:if>
                    <c:if test="${requestScope.problemById.type ne '判断'}">
                        <dt>A</dt>
                        <dd>${requestScope.options[0]}</dd>
                        <dt>B</dt>
                        <dd>${requestScope.options[1]}</dd>
                        <dt>C</dt>
                        <dd>${requestScope.options[2]}</dd>
                        <dt>D</dt>
                        <dd>${requestScope.options[3]}</dd>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/pages/common/footer.jsp"%>
</body>
</html>
