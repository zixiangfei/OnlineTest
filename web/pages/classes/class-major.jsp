<%--
  Created by IntelliJ IDEA.
  User: zhengluzhou
  Date: 2022/5/3
  Time: 4:21 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>class-major</title>
    <%@include file="/pages/common/head.jsp" %>
    <link rel="stylesheet" href="static/css/class-major.css">
    <script type="text/javascript">
        $(function () {
            $.getJSON("${pageScope.basePath}teacherServlet","action=ajaxAllTeacher",function (data) {
                let $name = $("[name='teacherId']");
                console.log($name);
                $name.each(function () {
                    for(let i in data.teachers) {
                        var value = data.teachers[i].username;
                        var teacherId = data.teachers[i].id+"";
                        console.log(this.innerText)
                        if(this.innerText===teacherId) {
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
<div class="container" style="margin-top: 30px;">
    <div class="row">
        <!-- Tab panels -->
        <div class="tab-content group-panels">
            <div class="tab-pane active" id="explore-groups" role="tabpanel" aria-expanded="true">

                <div class="row">
                    <div id="search-groups-panel"></div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <h4>我的班级</h4>
                        <hr>
                        <div class="row" id="new-groups-panel">
                            <c:forEach items="${requestScope.classes}" var="classes">
                                <div class="col-sm-12 col-md-4 group-card public">
                                    <table cellspacing="0">
                                        <tbody>
                                        <tr>
                                            <td style="width: 30%">
                                                <div class="card left">
                                                    <div class="logo">
                                                        <a href="classServlet?action=showClassDetails&classId=${classes.id}">
                                                            <img class="card-img-top" src="${classes.image}"
                                                                 alt="Group logo">
                                                        </a>
                                                    </div>
                                                    <div class="leader single">
                                                        <i class="fa fa-user text-warning"></i>
                                                        <a name="teacherId" disabled="disabled">${classes.teacherId}</a>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="card right">
                                                    <div class="name single"><a href="classServlet?action=showClassDetails&classId=${classes.id}">${classes.name}</a>
                                                    </div>
                                                    <div class="brief"></div>
                                                    <div class="single">
                                                        <div class="members">
                                                            <i class="fa fa-users"></i>
                                                            <i class="fa fa-times"></i>
                                                                ${classes.members}</div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>


                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>
<%@include file="/pages/common/footer.jsp" %>
</body>
</html>
