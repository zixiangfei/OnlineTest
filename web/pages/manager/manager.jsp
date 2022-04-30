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
                        <ul class="pagination">
                            <li class="paginate_button page-item previous disabled" id="listUser_previous">
                                <a href="#" aria-controls="listUser" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                            </li>
                            <li class="paginate_button page-item active">
                                <a href="#" aria-controls="listUser" data-dt-idx="1" tabindex="0" class="page-link">1</a>
                            </li>
                            <li class="paginate_button page-item ">
                                <a href="#" aria-controls="listUser" data-dt-idx="2" tabindex="0" class="page-link">2</a>
                            </li>
                            <li class="paginate_button page-item ">
                                <a href="#" aria-controls="listUser" data-dt-idx="3" tabindex="0" class="page-link">3</a>
                            </li>
                            <li class="paginate_button page-item ">
                                <a href="#" aria-controls="listUser" data-dt-idx="4" tabindex="0" class="page-link">4</a>
                            </li>
                            <li class="paginate_button page-item ">
                                <a href="#" aria-controls="listUser" data-dt-idx="5" tabindex="0" class="page-link">5</a>
                            </li>
                            <li class="paginate_button page-item " id="listUser_ellipsis">
                                <a href="#" aria-controls="listUser" data-dt-idx="6" tabindex="0" class="page-link">…</a>
                            </li>
                            <li class="paginate_button page-item next" id="listUser_next">
                                <a href="#" aria-controls="listUser" data-dt-idx="6" tabindex="0" class="page-link">Next</a>
                            </li>
                        </ul>
                    </div>
                    <div id="buttonContainer_l">
                        <input type="button" id="filter" class="btn btn-secondary btn-md" value="Filter" style="">
                        <input type="button" id="reset" class="btn btn-secondary btn-md" value="Reset" style="">
                    </div>
                    <div id="buttonContainer_r">
                        <div id="statRange" class="btn-group" data-toggle="buttons" style="">
                            <label class="btn btn-secondary">
                                <input type="radio" name="_statRange" id="statRange0" value="0">
                                24 hours
                            </label>
                            <label class="btn btn-secondary">
                                <input type="radio" name="_statRange" id="statRange1" value="1">
                                7 days
                            </label>
                            <label class="btn btn-secondary">
                                <input type="radio" name="_statRange" id="statRange2" value="2">
                                30 days
                            </label>
                            <label class="btn btn-secondary active">
                                <input type="radio" name="_statRange" id="statRange3" value="3">
                                Overall
                            </label>
                        </div>
                    </div>
                </div>
                <table id="listUser" class="table table-striped table-bordered table-responsive dataTable no-footer">
                    <thead>
                    <tr>
                        <th class="rank" rowspan="1" colspan="1" aria-label="Rank" align="center">Rank</th>
                        <th class="username sorting_disabled" rowspan="1" colspan="1" aria-label="Username">Username<br>
                            <input type="text" id="username" name="username" class="search_text" style="width:95%">
                        </th>
                        <th class="nickname sorting_disabled" rowspan="1" colspan="1" aria-label="Nickname">Nickname<br>
                            <input type="text" id="nickname" name="nickname" class="search_text" style="width:95%">
                        </th>
                        <th class="school sorting_disabled" rowspan="1" colspan="1" aria-label="School">School<br>
                        <input type="text" id="school" name="school" class="search_text" style="width:95%">
                        </th>
                        <th class="solved sorting_disabled" rowspan="1" colspan="1" aria-label="Solved">Solved</th>
                        <th class="attempted sorting_disabled" rowspan="1" colspan="1" aria-label="Attempted">Attempted</th>
                    </tr>
                    </thead>
<%--                    <tbody>--%>
                    <tbody>
                    <c:forEach items="${requestScope.userList}" var="student" varStatus="i">
                    <tr class="${i.index%2==0?"odd":"even"}">
                        <td class="rank">${i.index+1}</td>
                        <td class=" username"><a href="/user/Heart_Blue" target="_blank">${student.username}</a></td>
                        <td class=" nickname">${student.nikename}</td>
                        <td class=" school"><div>${student.classId}</div></td>
                        <td class=" solved"><a href="/status/#un=Heart_Blue&amp;res=1" target="_blank">1</a></td>
                        <td class=" attempted"><a href="/status/#un=Heart_Blue&amp;res=0" target="_blank">1</a></td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>


<%@include file="/pages/common/footer.jsp"%>
</body>
</html>
