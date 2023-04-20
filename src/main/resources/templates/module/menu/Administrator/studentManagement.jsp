<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<li class="sub-menu">
    <c:if test="${newUser.jurisdiction<=10 }">
        <a href="javascript:;">
            <i class="fa fa-angle-right" style="font-size:16px"></i> <span>学生管理</span>
        </a>
        <ul class="sub">
            <li><a href="${pageContext.servletContext.contextPath}/queryAllStudent">学生信息</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/insertNewStudent">新增学生</a></li>
        </ul>
    </c:if>
    <c:if test="${newUser.jurisdiction>10 }">
        <a href="javascript:;">
            <i class="fa fa-angle-right" style="font-size:16px"></i> <span>学生管理</span>
        </a>
        <ul class="sub">
            <li><a href="${pageContext.servletContext.contextPath}/queryAllStudent?StudentUid=${newUser.uid}">学生信息</a></li>
        </ul>
    </c:if>
</li>