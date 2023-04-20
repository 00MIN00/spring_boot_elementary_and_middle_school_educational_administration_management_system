<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<li class="sub-menu">
    <a href="javascript:;">
        <i class="fa fa-angle-right" style="font-size:16px"></i><span>课程管理</span>
    </a>
    <ul class="sub">
        <li><a href="${pageContext.servletContext.contextPath}/queryAllCourseUid">课程表信息</a></li>
        <c:if test="${newUser.jurisdiction<=10}">
            <li><a href="${pageContext.servletContext.contextPath}/queryAllCourse">课程信息</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/insertNewCoursera">新增课程表</a></li>
        </c:if>
    </ul>
</li>