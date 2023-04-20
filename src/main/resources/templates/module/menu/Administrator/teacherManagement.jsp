<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--<jsp:include page="${pageContext.servletContext.contextPath}/module/menu/Administrator/operationPanel/selectTeacher.jsp"></jsp:include>--%>

<li class="sub-menu">
    <a href="javascript:;">

        <i class="fa fa-angle-right" style="font-size:16px"></i> <span>教职员管理</span>
    </a>
    <ul class="sub">
        <li><a href="${pageContext.servletContext.contextPath}/queryAllTeacher" >教职员信息</a></li>
        <c:if test="${newUser.jurisdiction<=10}">
            <li><a href="${pageContext.servletContext.contextPath}/insertNewTeacher?username=${newUser.loginId}" >新增教职员</a></li>
        </c:if>
    </ul>
</li>