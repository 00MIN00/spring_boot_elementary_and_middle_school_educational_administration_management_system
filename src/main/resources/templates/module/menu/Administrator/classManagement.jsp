<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<li class="sub-menu">
    <c:if test="${newUser.jurisdiction<=10}">
        <a href="javascript:;">
            <i class="fa fa-angle-right" style="font-size:16px"></i><span>班级管理</span>
        </a>
        <ul class="sub">
            <li><a href="${pageContext.servletContext.contextPath}/queryAllClbumUid">班级信息</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/insertNewClbumList">新增班级</a></li>
        </ul>
    </c:if>
    <c:if test="${newUser.jurisdiction>10 }">
        <a href="javascript:;">
            <i class="fa fa-angle-right" style="font-size:16px"></i><span>查看班级</span>
        </a>
        <ul class="sub">
            <li><a href="${pageContext.servletContext.contextPath}/queryAllClbumUid?studentClass=${newUser.studentClass}">我的班级</a></li>
        </ul>
    </c:if>
</li>