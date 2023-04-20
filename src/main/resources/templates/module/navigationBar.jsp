
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header class="header black-bg">
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
    </div>
    <!--logo start--> <a href="${pageContext.servletContext.contextPath}/s" class="logo"><b>教务管理系统</b></a> <!--logo end-->
    <div class="top-menu">
        <ul class="nav pull-right top-menu">
            <li><a class="logout"
                   href="${pageContext.servletContext.contextPath}/logout">退出登录</a></li>
        </ul>
    </div>
</header>
