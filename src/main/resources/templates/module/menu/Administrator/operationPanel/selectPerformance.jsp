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
            <script type="application/javascript">
                function fun() {
                    $.ajax({
                        text:'get',
                        url :"/queryAllTeacher"
                    });
                }
            </script>
            <div style="margin-top: 45px;">
<%--                <h4 class="mb">--%>
<%--                    <i class="fa fa-angle-right"></i>搜索栏--%>
<%--                </h4>--%>
                <form id="form_query" class="form-inline" role="form"
                      action="${pageContext.servletContext.contextPath}/queryUser">
                    <input id="page" name="pageNo" type="hidden" value="1" />
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
                </form>
            </div>
            <!-- 展示主体 -->
            <div class="content-panel">
                <table class="table table-striped table-advance table-hover">
                    <thead>
                    <tr>
                        <th><i class="fa fa-bullhorn"></i>姓名</th>
                        <th><i class="fa fa-bullhorn"></i>科目</th>
                        <th class="hidden-phone">
                            <i class="fa fa-bullhorn"></i>
                            考试信息</th>
                        <th><i class="fa fa-bookmark"></i>成绩</th>
                        <th></th>
                    </tr>
                    </thead>
                    <c:forEach items="${PerformanceList}" var="userItem">
                    <tbody>
                    <tr>
                        <td><span>${userItem.studentIdUid}</span>
                        </td>
                        <td> <span>${userItem.courseUid}</span>
                        </td>
                        <td class="hidden-phone"><span>${userItem.examinationUid}</span></td>
                        <td><span>${userItem.performance}</span>

                        </td>
                        <td>

                            <c:if test="${newUser.jurisdiction<=10}">
                            <form id="setform2" class="form-inline" role="form" method="get"
                                  action="${pageContext.servletContext.contextPath}/deletePerformance">
                                <input name="uid" type="hidden" value="${userItem.uid}" />
                                <input name="userjurisdiction" type="hidden" value="${newUser.jurisdiction}" />
                                <input name="useruid" type="hidden" value="${newUser.uid}" />
                                <button type="submit" class="btn btn-theme">删除</button>
                            </form>
                            </c:if>
                        </td>
                    </tr>
                    </tbody>
                    </c:forEach>
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