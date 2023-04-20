<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--搜索栏--%>
<script type="application/javascript">
    function fun() {
        $.ajax({
            text:'get',
            url :"/queryAllTeacher"
        });
    }
</script>
<div style="margin-top: 45px;">
    <h4 class="mb">
        <i class="fa fa-angle-right"></i>搜索栏
    </h4>
    <form id="form_query" class="form-inline" role="form"
          action="${pageContext.servletContext.contextPath}/queryUser">
        <input id="page" name="pageNo" type="hidden" value="1" />
        <div class="form-group">
            <input type="text" class="form-control"
                                       id="exampleInputEmail2" placeholder="搜索姓名" name="uname"
                                       value="${username}">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="exampleInputPassword2"
                   placeholder="搜索工号" name="status" value="${status}">
        </div>
        <button type="submit" class="btn btn-theme">搜索</button>
    </form>
</div>
<!-- 展示主体 -->
<div class="content-panel">
    <table class="table table-striped table-advance table-hover">

        <!-- 遍历用户 -->
        <c:forEach items="${teacherList}" var="userItem">

        <tbody style="background-color:#ffffff;margin: 5px 5px 5px 5px;padding:  10px 10px 10px 10px;">
        <tr style="background-color: rgba(0,0,0,0.27)">
            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">姓名：</th>
            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">${userItem.userName}</th>
            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">职称：</th>
            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">
                <c:if test="${userItem.userRank==0}">
                    管理员
                </c:if>
                <c:if test="${userItem.userRank==1}">
                    校长
                </c:if>
                <c:if test="${userItem.userRank==2}">
                    主任
                </c:if>
                <c:if test="${userItem.userRank==3}">
                    级长
                </c:if>
                <c:if test="${userItem.userRank==4}">
                    科长
                </c:if>
                <c:if test="${userItem.userRank==5}">
                    教职员
                </c:if>
            </th>
            <th rowspan="3" style="border: 1px solid rgba(0,0,0,0.28);">
                <img style="width: 128px;height: 128px;" src="${pageContext.servletContext.contextPath}/assets/img/user/${userItem.userImg}">
            </th>
        </tr>
        <tr>
            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">账号：</th>
            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">${userItem.loginId}</th>
            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">密码：</th>
            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">${userItem.userpassword}</th>
        </tr>
        <tr style="background-color: rgba(0,0,0,0.27)">
            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">学历：</th>
            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">
                <c:if test="${userItem.education==0}">
                    小学毕业
                </c:if>
                <c:if test="${userItem.education==1}">
                    初中毕业
                </c:if>
                <c:if test="${userItem.education==2}">
                    中专/高中毕业
                </c:if>
                <c:if test="${userItem.education==3}">
                    专科毕业
                </c:if>
                <c:if test="${userItem.education==4}">
                    本科毕业
                </c:if>
                <c:if test="${userItem.education==5}">
                    硕士
                </c:if>
                <c:if test="${userItem.education==6}">
                    博士
                </c:if>

            </th>
            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">注册时间：</th>
            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">
                <fmt:formatDate value="${userItem.createDate}" pattern="yyyy-mm-dd" />
            </th>
        </tr>
        <tr>
            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">电话：</th>
            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">${userItem.phone}</th>
            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">邮箱：</th>
            <th colspan="2" style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">${userItem.mailbox}</th>
        </tr>
        <tr style="background-color: rgba(0,0,0,0.27)">
            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">任教课程：</th>
            <th colspan="4" style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">
                <c:forEach items="${courseList}" var="cuid" >
                    <c:if test="${fn:contains(userItem.course,cuid.uid)}">
                        ${cuid.principal}&nbsp;&nbsp;
                    </c:if>
                </c:forEach>
            </th>
        </tr>
        <tr style="border:1px hidden;border-top:1px solid ;padding-top: 3px;">
            <th colspan="3"></th>
            <c:if test="${newUser.jurisdiction<=2}">
                <th style="padding-left:50px;">
                    <form id="setform" class="form-inline" role="form"
                          action="${pageContext.servletContext.contextPath}/updateTeacher">
                        <input name="uid" type="hidden" value="${userItem.uid}" />
                        <input name="userjurisdiction" type="hidden" value="${newUser.jurisdiction}" />
                        <input name="useruid" type="hidden" value="${newUser.uid}" />
                        <button type="submit" class="btn btn-theme">修改</button>
                    </form>
                </th><th>
                    <form id="setform2" class="form-inline" role="form"
                          action="${pageContext.servletContext.contextPath}/deleteTeacher">
                        <input name="uid" type="hidden" value="${userItem.uid}" />
                        <input name="userjurisdiction" type="hidden" value="${newUser.jurisdiction}" />
                        <input name="useruid" type="hidden" value="${newUser.uid}" />
                        <button type="submit" class="btn btn-theme">删除</button>
                    </form>
                </th>
            </c:if>
        </tr>
        </tbody>
        </c:forEach>
    </table>
</div>
<%--页码--%>
<div class="page">
    【${pageInfo.pageNum}/${pageInfo.pages}，共${pageInfo.total}条记录】 <a
        href="javascript:jumpPage(1)" title="">首页</a> <a
        href="javascript:jumpPage(${pageInfo.prePage})" title="">上一页</a> <a
        href="javascript:jumpPage(${pageInfo.nextPage})" title="">下一页</a> <a
        href="javascript:jumpPage(${pageInfo.pages})" title="">尾页</a>
</div>