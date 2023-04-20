<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<li class="sub-menu">

    <c:if test="${newUser.jurisdiction<=10 }">
        <a id="tbi"href="javascript:;">
            <i  class="fa fa-angle-right" style="font-size:16px"></i> <span>成绩管理</span>
        </a>
        <ul class="sub">
            <li><a href="${pageContext.servletContext.contextPath}/queryAllPerformance">成绩信息</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/insertNewPerformance">录入成绩</a></li>
        </ul>
    </c:if>
    <c:if test="${newUser.jurisdiction>10 }">
        <a id="tbi"href="javascript:;">
            <i class="fa fa-angle-right" style="font-size:16px"></i> <span>查看成绩</span>
        </a>
        <ul class="sub">
            <li><a href="${pageContext.servletContext.contextPath}/queryAllPerformance?StudentUid=${newUser.uid}">我的成绩</a></li>
        </ul>
    </c:if>
</li>