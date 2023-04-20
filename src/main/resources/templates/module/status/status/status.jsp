<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
    .white-panel .small {
        font-size: 16px;
        /*color: #ccd1d9;*/
        color: rgb(106, 108, 112);
    }
</style>
<div class="white-panel pn">
    <div class="white-header">
        <h5>用户信息</h5>
    </div>
    <c:if test="${newUser!=null&&newUser.jurisdiction<=10}">
    <p>
        <img src="${pageContext.servletContext.contextPath}/assets/img/user/${newUser.userImg}" class="img-circle" width="50">
    </p>
    <p>
        <b class="small">${newUser.userName}</b>
    </p>
    <div class="row">
        <div class="col-md-6">
            <p class="small mt">注册时间：<br>
                <fmt:formatDate value="${newUser.createDate}" pattern="yyyy-mm-dd" />
            </p>
        </div>
        <div class="col-md-6">
            <p class="small mt">职位：
                <c:if test="${newUser.jurisdiction>0}">教师</c:if>
                <c:if test="${newUser.jurisdiction==0}">管理员</c:if>
            </p>
        </div>
    </div></c:if>

    <c:if test="${newUser!=null&&newUser.jurisdiction>10}">
    <p>
        <img src="${pageContext.servletContext.contextPath}/assets/img/user/${newUser.studentIdImg}" class="img-circle" width="50">
    </p>
    <p>
        <b class="small">${newUser.studentName}</b>
    </p>
    <div class="row">
        <div class="col-md-6">
            <p class="small mt">学生学号:<br>${newUser.studentId}
            </p>
        </div>
        <div class="col-md-12">
            <p class="small mt">入学时间：
                <fmt:formatDate value="${newUser.enrollmentDate}" pattern="yyyy-mm-dd" />
            </p>
        </div>
    </div>
    </c:if>
</div>