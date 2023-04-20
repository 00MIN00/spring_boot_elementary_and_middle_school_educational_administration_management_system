<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<li class="sub-menu">
    <a href="javascript:;">
        <i class="fa fa-angle-right" style="font-size:16px"></i><span>考试管理</span>
    </a>
    <ul class="sub">
        <li><a href="${pageContext.servletContext.contextPath}/queryAllExamination">考试信息</a></li>
        <c:if test="${newUser.jurisdiction<=10}">
            <li><a href="${pageContext.servletContext.contextPath}/insertNewExamination">新增考试</a></li>
        </c:if>
    </ul>
</li>