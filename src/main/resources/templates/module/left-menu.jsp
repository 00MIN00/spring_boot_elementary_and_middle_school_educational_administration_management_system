
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<aside>
    <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
            <!-- 如果登录的是管理员 -->
            <c:if test="${newUser!=null&&newUser.jurisdiction<=10}">
                <p class="centered">
                    <a href="profile.html"><img src="${pageContext.servletContext.contextPath}/assets/img/user/${newUser.userImg}"
                                                class="img-circle" width="60"></a>
                </p>
                <h5 class="centered">${newUser.userName}</h5>
            </c:if>
            <c:if test="${newUser!=null&&newUser.jurisdiction>10}">
            <p class="centered">
                <a href="profile.html"><img src="${pageContext.servletContext.contextPath}/assets/img/user/${newUser.studentIdImg}"
                                            class="img-circle" width="60"></a>
            </p>
            <h5 class="centered">${newUser.studentName}</h5>
            </c:if>

            <c:if test="${newUser.jurisdiction<=10 }">
                <%--根据权限赋予相应的功能--%>
                <%--教师管理--%>
                <jsp:include page="${pageContext.servletContext.contextPath}/module/menu/Administrator/teacherManagement.jsp"></jsp:include>
                <%--学生管理--%>
                <jsp:include page="${pageContext.servletContext.contextPath}/module/menu/Administrator/studentManagement.jsp"></jsp:include>
                <%--课程管理--%>
                <jsp:include page="${pageContext.servletContext.contextPath}/module/menu/Administrator/courseManagement.jsp"></jsp:include>
                <%--班级管理--%>
                <jsp:include page="${pageContext.servletContext.contextPath}/module/menu/Administrator/classManagement.jsp"></jsp:include>
                <%--考试管理--%>
                <jsp:include page="${pageContext.servletContext.contextPath}/module/menu/Administrator/examinationManagement.jsp"></jsp:include>
                <%--成绩管理--%>
                <jsp:include page="${pageContext.servletContext.contextPath}/module/menu/Administrator/achievementManagement.jsp"></jsp:include>
            </c:if>
            <c:if test="${newUser.jurisdiction>10 }">
            <%--根据权限赋予相应的功能--%>
            <%--个人信息--%>
                <jsp:include page="${pageContext.servletContext.contextPath}/module/menu/Administrator/studentManagement.jsp"></jsp:include>
            <%--查看班级--%>
                <jsp:include page="${pageContext.servletContext.contextPath}/module/menu/Administrator/classManagement.jsp"></jsp:include>
            <%--  查看成绩--%>
                <jsp:include page="${pageContext.servletContext.contextPath}/module/menu/Administrator/achievementManagement.jsp"></jsp:include>
        </c:if>
        </ul>
        <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->
