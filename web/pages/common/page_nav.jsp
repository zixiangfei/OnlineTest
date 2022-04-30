<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhengluzhou
  Date: 2022/4/30
  Time: 8:05 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<ul class="pagination">
    <c:if test="${requestScope.page.pageNo<=1}">
        <li class="paginate_button page-item previous disabled" id="listUser_previous">
            <a href="#" aria-controls="listUser"  class="page-link">Previous</a>
        </li>
    </c:if>
    <c:if test="${requestScope.page.pageNo>1}">
        <li class="paginate_button page-item previous " id="listUser_previous">
            <a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo-1}" aria-controls="listUser"  class="page-link">Previous</a>
        </li>
    </c:if>

    <c:choose>

        <c:when test="${requestScope.page.pageTotal <= 5}">
            <c:set var="begin" value="1"/>
            <c:set var="end" value="${requestScope.page.pageTotal}"/>
        </c:when>

        <c:when test="${requestScope.page.pageTotal > 5}">
            <c:choose>

                <c:when test="${requestScope.page.pageNo <= 3}">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="5"/>
                </c:when>

                <c:when test="${requestScope.page.pageNo > requestScope.page.pageTotal-3}">
                    <c:set var="begin" value="${requestScope.page.pageTotal-4}"/>
                    <c:set var="end" value="${requestScope.page.pageTotal}"/>
                </c:when>

                <c:otherwise>
                    <c:set var="begin" value="${requestScope.page.pageNo-2}"/>
                    <c:set var="end" value="${requestScope.page.pageNo+2}"/>
                </c:otherwise>

            </c:choose>
        </c:when>

    </c:choose>

    <c:forEach begin="${begin}" end="${end}" var="i">
        <c:if test="${i==requestScope.page.pageNo}">
            <li class="paginate_button page-item active">
                <a href="" aria-controls="listUser"  class="page-link">${i}</a>
            </li>
        </c:if>
        <c:if test="${i!=requestScope.page.pageNo}">
            <li class="paginate_button page-item ">
                <a href="${requestScope.page.url}&pageNo=${i}" aria-controls="listUser"  class="page-link">${i}</a>
            </li>
        </c:if>
    </c:forEach>

    <c:if test="${requestScope.page.pageNo==requestScope.page.pageTotal}">
        <li class="paginate_button page-item next disabled" id="listUser_next">
            <a href="#" aria-controls="listUser"  class="page-link">Next</a>
        </li>
    </c:if>
    <c:if test="${requestScope.page.pageNo!=requestScope.page.pageTotal}">
        <li class="paginate_button page-item next" id="listUser_next">
            <a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo+1}" aria-controls="listUser"  class="page-link">Next</a>
        </li>
    </c:if>
</ul>
