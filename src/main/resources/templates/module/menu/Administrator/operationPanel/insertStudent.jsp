<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

            <form   action="${pageContext.servletContext.contextPath}/upInsertStudent"
                    enctype="multipart/form-data" method="post" id="form0">
                <div class="content-panel" style="margin-top: 100px;">
                    <table class="table table-striped table-advance table-hover">

                        <!-- 遍历用户 -->

                        <tbody style="background-color:#ffffff;margin: 5px 5px 5px 5px;padding:  10px 10px 10px 10px;">
                        <tr style="background-color: rgba(0,0,0,0.27)">
                            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">姓名：</th>
                            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); "><input type="text" name="studentName" /></th>
                            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">性别:</th>
                            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">
                                <select name="sex" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                <option selected>性别</option>
                                <option value="0">女</option>
                                <option value="1">男</option>
                                </select>
                            </th>
                            <th rowspan="3" style="border: 1px solid rgba(0,0,0,0.28);">
                                <img id="upimg" src="${pageContext.servletContext.contextPath}/assets/img/user/${userItem.studentImg}"><br/>
                                <input id="upimgFile" type="file" name="file">
                            </th>
                        </tr>
                        <tr>
                            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">学号：</th>
                            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); "><input type="text" name="studentId" /></th>
                            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">密码：</th>
                            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); "><input type="text" name="studentpassword" /></th>
                        </tr>
                        <tr style="background-color: rgba(0,0,0,0.27)">
                            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">出生时间：</th>
                            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">
                                <input type="date" id="start" name="birthYear">
                            </th>
                            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">入学时间：</th>
                            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">系统自动注册
                            </th>
                        </tr>
                        <tr>
                            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">班级：</th>
                            <th style="padding-left:50px;border: 1px solid rgba(0,0,0,0.28); ">
                                <select name="studentClass" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                    <option selected value=null >暂时不分配</option>

                                    <c:forEach items="${studentClassLits}" var="studentClass">
                                    <option value="${studentClass.uid}">${studentClass.clbumName}</option>
                                    </c:forEach>
                                </select>
                            </th>
                        </tr>

                        <tr style="border:1px hidden;border-top:1px solid ;padding-top: 3px;">
                            <th colspan="4"></th>
                            <th style="padding-left:50px;">
                                <button type="submit" id="upbut"  onclick="upsubmit()" class="btn btn-theme">提交</button>
                            </th>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </form>
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