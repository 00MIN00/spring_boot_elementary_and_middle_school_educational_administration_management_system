<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword"
          content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>人事管理系统首页</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.servletContext.contextPath}assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="${pageContext.servletContext.contextPath}assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.servletContext.contextPath}assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.servletContext.contextPath}assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}assets/lineicons/style.css">

    <!-- Custom styles for this template -->
    <link href="${pageContext.servletContext.contextPath}assets/css/style.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}assets/css/style-responsive.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>

    <script src="https://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
    <script src="assets/js/jquery-1.8.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript"
            src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="assets/js/jquery.sparkline.js"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <script type="text/javascript"
            src="assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="assets/js/gritter-conf.js"></script>

    <!--script for this page-->
    <script src="assets/js/sparkline-chart.js"></script>
    <script src="assets/js/zabuto_calendar.js"></script>
    <style type="text/css">
        a:link {color: #000000; text-decoration:none;}
        a:hover {color: rgba(79, 79, 82, 0.8) ;text-decoration:none;}
        a{ text-decoration: none;}
    </style>
</head>

<body>

<section id="container">
    <%--		教师端通用导航栏		--%>
    <jsp:include page="${pageContext.servletContext.contextPath}/module/navigationBar.jsp"></jsp:include>
    <%--		教师端通用菜单栏		--%>
    <jsp:include page="${pageContext.servletContext.contextPath}/module/left-menu.jsp"></jsp:include>

    <div class="copyrights">
        Collect from MJR
    </div>

    <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
    <!--main content start--> <section id="main-content"> <section
        class="wrapper">

    <div class="row">
        <%--功能面板 开始--%>
        <div id="operationPanel"class="col-lg-9 main-chart">
            <%--搜索栏--%>
<%--            <script type="application/javascript">--%>
<%--                function fun() {--%>
<%--                    $.ajax({--%>
<%--                        text:'get',--%>
<%--                        url :"/queryAllTeacher"--%>
<%--                    });--%>
<%--                }--%>
<%--            </script>--%>
<%--            <div style="margin-top: 45px;">--%>
<%--                <h4 class="mb">--%>
<%--                    <i class="fa fa-angle-right"></i>搜索栏--%>
<%--                </h4>--%>
<%--                <form id="form_query" class="form-inline" role="form"--%>
<%--                      action="${pageContext.servletContext.contextPath}/queryUser">--%>
<%--                    <input id="page" name="pageNo" type="hidden" value="1" />--%>
<%--                    <div class="form-group">--%>
<%--                        <input type="text" class="form-control"--%>
<%--                               id="exampleInputEmail2" placeholder="搜索姓名" name="uname"--%>
<%--                               value="${username}">--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <input type="text" class="form-control" id="exampleInputPassword2"--%>
<%--                               placeholder="搜索工号" name="status" value="${status}">--%>
<%--                    </div>--%>
<%--                    <button type="submit" class="btn btn-theme">搜索</button>--%>
<%--                </form>--%>
<%--            </div>--%>
            <!-- 展示主体 -->
                <div class="content-panel" style="margin-top: 100px;">
                    <table class="table table-striped table-advance table-hover">
                        <thead>
                        <tr>
                            <th>班级</th>
                            <th>班主任</th>
                            <th>&nbsp;座位表</th>
                            <th>&nbsp;课程表 </th>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                        </tr>
                        <c:forEach items="${clbumList}" var="clbum">
                        </thead>
                        <!-- 遍历用户 -->
                        <tbody>
                        <th><span>${clbum.clbumName}</span></th>
                        <th>
                        <c:forEach items="${teacherList}" var="teacher">
                            <c:if test="${teacher.uid==clbum.principal}">

                            <a  style="" href="${pageContext.servletContext.contextPath}/queryTeacherById?TeacherUid=${teacher.uid}" >
                                <span style="color: #0f0f0f">${teacher.userName}</span>
                            </a>
                            </c:if>
                        </c:forEach>
                        </th>
                        <th>
<%--                            <a href="${pageContext.servletContext.contextPath}/queryAllClbum?TeacherUid=${clbum.uid}" ><span>--%>
<%--                            <c:forEach items="${clbumUidList}" var="clbumUid">--%>
<%--                                <c:if test="${clbumUid.uid==clbum.classSchedule}">${clbumUid.clbumUidName}</c:if>--%>
<%--                            </c:forEach>--%>
                            <c:forEach items="${clbumUidList}" var="clbumUid">

                                <c:if test="${clbumUid.uid==clbum.classSchedule}">
                                    <a  style="" href="${pageContext.servletContext.contextPath}/queryClbumByUid?clbumUid=${clbum.uid}" >
                                    <span style="color: #0f0f0f">${clbumUid.clbumUidName}</span>
                                </a>
                                </c:if>
                            </c:forEach>
<%--                        </span></a>--%>
                        </th>
                        <th>
                            <c:forEach items="${courseUidList}" var="courseUid">

                                <c:if test="${courseUid.uid==clbum.seatingPlan}">
                                    <a  style="" href="${pageContext.servletContext.contextPath}/queryCourseraByUid?CourseUid=${courseUid.uid}" >
                                    <span style="color: #0f0f0f">${courseUid.courseUidName}</span>
                                </a>
                                </c:if>
                            </c:forEach>
                        </th>
                        <th  style="width: 50px">

                            <c:if test="${newUser.jurisdiction<=10}">
                            <a href="${pageContext.servletContext.contextPath}/updateClbumList?clbumUid=${clbum.uid}">
                                <button type="button" class="btn btn-theme">修改</button>
                            </a>
                        </th>
                            <th>
                            <a href="${pageContext.servletContext.contextPath}/deleteClbumList?clbumUid=${clbum.uid}&jurisdiction=${newUser.jurisdiction}">
                                <button type="button" class="btn btn-theme">删除</button>
                            </a>
                                </c:if>
                        </th>
                        </tbody>
                        </c:forEach>
                        <tbody>
                        <tr style="border:1px hidden;border-top:1px solid ;padding-top: 3px;">
                            <th colspan="4">
                            </th>
                            <th style="padding-left:50px;">
                            </th>
                        </tr>
                        </tbody>
                    </table>
                </div>
            <%--页码--%>
<%--            <div class="page">--%>
<%--                【${pageInfo.pageNum}/${pageInfo.pages}，共${pageInfo.total}条记录】 <a--%>
<%--                    href="javascript:jumpPage(1)" title="">首页</a> <a--%>
<%--                    href="javascript:jumpPage(${pageInfo.prePage})" title="">上一页</a> <a--%>
<%--                    href="javascript:jumpPage(${pageInfo.nextPage})" title="">下一页</a> <a--%>
<%--                    href="javascript:jumpPage(${pageInfo.pages})" title="">尾页</a>--%>
<%--            </div>--%>
        </div>
        <%--功能面板 结束--%>
        <div class="col-lg-3 ds">
            <%--用户信息模块--%>
            <jsp:include page="${pageContext.servletContext.contextPath}/module/status/status/status.jsp"></jsp:include>
            <h3>日历</h3>
            <%--日历模块组件--%>
            <jsp:include page="${pageContext.servletContext.contextPath}/module/status/calendar/Calendar.jsp"></jsp:include>
        </div>
        <!-- /col-lg-3 -->
    </div>

    <! --/row -->
</section> </section>
    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
        <div class="text-center">
            2018 - Alvarez.is - Person System  - Collect from MJR
        </div>
    </footer> <!--footer end--> </section>


<script type="application/javascript" >
    <%--		日历模块js--%>
    $(document).ready(function () {
        $("#date-popover").popover({html: true, trigger: "manual"});
        $("#date-popover").hide();
        $("#date-popover").click(function (e) {
            $(this).hide();
        });

        $("#my-calendar").zabuto_calendar({
            action: function () {
                return myDateFunction(this.id, false);
            },
            action_nav: function () {
                return myNavFunction(this.id);
            },
            ajax: {
                url: "show_data.php?action=1",
                modal: true
            },
            legend: [
                {type: "text", label: "Special event", badge: "00"},
                {type: "block", label: "Regular event", }
            ]
        });
    });
    //日历翻页
    function myNavFunction(id) {
        $("#date-popover").hide();
        var nav = $("#" + id).data("navigation");
        var to = $("#" + id).data("to");
        console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }


    function jumpPage(page){
        document.getElementById("page").value=page;
        document.getElementById("form_query").submit();
    }


</script>


</body>
</html>