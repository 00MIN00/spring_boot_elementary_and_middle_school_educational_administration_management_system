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
                <div class="content-panel" style="margin-top: 100px;">
                    <table class="table table-striped table-advance table-hover">
                        <thead>
                        <tr>
                            <th>&nbsp;</th>
                            <th>星期日</th>
                            <th>星期一</th>
                            <th>星期二</th>
                            <th>星期三</th>
                            <th>星期四</th>
                            <th>星期五</th>
                            <th>星期六</th>
                        </tr>
                        </thead>
                        <!-- 遍历用户 -->
                        <tbody style="background-color:#ffffff;margin: 5px 5px 5px 5px;padding:  10px 10px 10px 10px;">
                            <th>8:40~9:20</th>
                            <th>
                                <span>${course_1_1}</span><br/>
                                <span><c:if test="${teacher_1_1!='0'}">任课老师：${teacher_1_1}</c:if></span>
                            </th>
                            <th>
                                <span>${course_1_2}</span><br/>
                                <span><c:if test="${teacher_1_2!='0'}">任课老师：${teacher_1_2}</c:if></span>
                            </th>
                            <th>
                                <span>${course_1_3}</span><br/>
                                <span><c:if test="${teacher_1_3!='0'}">任课老师：${teacher_1_3}</c:if></span>
                            </th>
                            <th>
                                <span>${course_1_4}</span><br/>
                                <span><c:if test="${teacher_1_4!='0'}">任课老师：${teacher_1_4}</c:if></span>
                            </th>
                            <th>
                                <span>${course_1_5}</span><br/>
                                <span><c:if test="${teacher_1_5!='0'}">任课老师：${teacher_1_5}</c:if></span>
                            </th>
                            <th>
                                <span>${course_1_6}</span><br/>
                                <span><c:if test="${teacher_1_6!='0'}">任课老师：${teacher_1_6}</c:if></span>
                            </th>
                            <th>
                                <span>${course_1_7}</span><br/>
                                <span><c:if test="${teacher_1_7!='0'}">任课老师：${teacher_1_7}</c:if></span>
                            </th>
                        </tbody>
                        <tbody style="background-color:#ffffff;margin: 5px 5px 5px 5px;padding:  10px 10px 10px 10px;">
                            <th >9:30~10:10</th>
                            <th>
                                <span>${course_2_1}</span><br/>
                                <span><c:if test="${teacher_2_1!='0'}">任课老师：${teacher_2_1}</c:if></span>
                            </th>
                            <th>
                                <span>${course_2_2}</span><br/>
                                <span><c:if test="${teacher_2_2!='0'}">任课老师：${teacher_2_2}</c:if></span>
                            </th>
                            <th>
                                <span>${course_2_3}</span><br/>
                                <span><c:if test="${teacher_2_3!='0'}">任课老师：${teacher_2_3}</c:if></span>
                            </th>
                            <th>
                                <span>${course_2_4}</span><br/>
                                <span><c:if test="${teacher_2_4!='0'}">任课老师：${teacher_2_4}</c:if></span>
                            </th>
                            <th>
                                <span>${course_2_5}</span><br/>
                                <span><c:if test="${teacher_2_5!='0'}">任课老师：${teacher_2_5}</c:if></span>
                            </th>
                            <th>
                                <span>${course_2_6}</span><br/>
                                <span><c:if test="${teacher_2_6!='0'}">任课老师：${teacher_2_6}</c:if></span>
                            </th>
                            <th>
                                <span>${course_2_7}</span><br/>
                                <span><c:if test="${teacher_2_7!='0'}">任课老师：${teacher_2_7}</c:if></span>
                            </th>
                        </tbody>
                        <tbody style="background-color:#ffffff;margin: 5px 5px 5px 5px;padding:  10px 10px 10px 10px;">
                            <th >10:20~11:00</th>
                            <th>
                                <span>${course_3_1}</span><br/>
                                <span><c:if test="${teacher_3_1!='0'}">任课老师：${teacher_3_1}</c:if></span>
                            </th>
                            <th>
                                <span>${course_3_2}</span><br/>
                                <span><c:if test="${teacher_3_2!='0'}">任课老师：${teacher_3_2}</c:if></span>
                            </th>
                            <th>
                                <span>${course_3_3}</span><br/>
                                <span><c:if test="${teacher_3_3!='0'}">任课老师：${teacher_3_3}</c:if></span>
                            </th>
                            <th>
                                <span>${course_3_4}</span><br/>
                                <span><c:if test="${teacher_3_4!='0'}">任课老师：${teacher_3_4}</c:if></span>
                            </th>
                            <th>
                                <span>${course_3_5}</span><br/>
                                <span><c:if test="${teacher_3_5!='0'}">任课老师：${teacher_3_5}</c:if></span>
                            </th>
                            <th>
                                <span>${course_3_6}</span><br/>
                                <span><c:if test="${teacher_3_6!='0'}">任课老师：${teacher_3_6}</c:if></span>
                            </th>
                            <th>
                                <span>${course_3_7}</span><br/>
                                <span><c:if test="${teacher_3_7!='0'}">任课老师：${teacher_3_7}</c:if></span>
                            </th>
                        </tbody>
                        <tbody style="background-color:#ffffff;margin: 5px 5px 5px 5px;padding:  10px 10px 10px 10px;">
                            <th >2:00~2:40</th>
                            <th>
                                <span>${course_4_1}</span><br/>
                                <span><c:if test="${teacher_4_1!='0'}">任课老师：${teacher_4_1}</c:if></span>
                            </th>
                            <th>
                                <span>${course_4_2}</span><br/>
                                <span><c:if test="${teacher_4_2!='0'}">任课老师：${teacher_4_2}</c:if></span>
                            </th>
                            <th>
                                <span>${course_4_3}</span><br/>
                                <span><c:if test="${teacher_4_3!='0'}">任课老师：${teacher_4_3}</c:if></span>
                            </th>
                            <th>
                                <span>${course_4_4}</span><br/>
                                <span><c:if test="${teacher_4_4!='0'}">任课老师：${teacher_4_4}</c:if></span>
                            </th>
                            <th>
                                <span>${course_4_5}</span><br/>
                                <span><c:if test="${teacher_4_5!='0'}">任课老师：${teacher_4_5}</c:if></span>
                            </th>
                            <th>
                                <span>${course_4_6}</span><br/>
                                <span><c:if test="${teacher_4_6!='0'}">任课老师：${teacher_4_6}</c:if></span>
                            </th>
                            <th>
                                <span>${course_4_7}</span><br/>
                                <span><c:if test="${teacher_4_7!='0'}">任课老师：${teacher_4_7}</c:if></span>
                            </th>
                        </tbody>
                        <tbody style="background-color:#ffffff;margin: 5px 5px 5px 5px;padding:  10px 10px 10px 10px;">
                            <th >2:50~3:30</th>
                            <th>
                                <span>${course_5_1}</span><br/>
                                <span><c:if test="${teacher_5_1!='0'}">任课老师：${teacher_5_1}</c:if></span>
                            </th>
                            <th>
                                <span>${course_5_2}</span><br/>
                                <span><c:if test="${teacher_5_2!='0'}">任课老师：${teacher_5_2}</c:if></span>
                            </th>
                            <th>
                                <span>${course_5_3}</span><br/>
                                <span><c:if test="${teacher_5_3!='0'}">任课老师：${teacher_5_3}</c:if></span>
                            </th>
                            <th>
                                <span>${course_5_4}</span><br/>
                                <span><c:if test="${teacher_5_4!='0'}">任课老师：${teacher_5_4}</c:if></span>
                            </th>
                            <th>
                                <span>${course_5_5}</span><br/>
                                <span><c:if test="${teacher_5_5!='0'}">任课老师：${teacher_5_5}</c:if></span>
                            </th>
                            <th>
                                <span>${course_5_6}</span><br/>
                                <span><c:if test="${teacher_5_6!='0'}">任课老师：${teacher_5_6}</c:if></span>
                            </th>
                            <th>
                                <span>${course_5_7}</span><br/>
                                <span><c:if test="${teacher_5_7!='0'}">任课老师：${teacher_5_7}</c:if></span>
                            </th>
                        </tbody>
                        <tbody style="background-color:#ffffff;margin: 5px 5px 5px 5px;padding:  10px 10px 10px 10px;">
                            <th >3:40~4:20</th>
                            <th>
                                <span>${course_6_1}</span><br/>
                                <span><c:if test="${teacher_6_1!='0'}">任课老师：${teacher_6_1}</c:if></span>
                            </th>
                            <th>
                                <span>${course_6_2}</span><br/>
                                <span><c:if test="${teacher_6_2!='0'}">任课老师：${teacher_6_2}</c:if></span>
                            </th>
                            <th>
                                <span>${course_6_3}</span><br/>
                                <span><c:if test="${teacher_6_3!='0'}">任课老师：${teacher_6_3}</c:if></span>
                            </th>
                            <th>
                                <span>${course_6_4}</span><br/>
                                <span><c:if test="${teacher_6_4!='0'}">任课老师：${teacher_6_4}</c:if></span>
                            </th>
                            <th>
                                <span>${course_6_5}</span><br/>
                                <span><c:if test="${teacher_6_5!='0'}">任课老师：${teacher_6_5}</c:if></span>
                            </th>
                            <th>
                                <span>${course_6_6}</span><br/>
                                <span><c:if test="${teacher_6_6!='0'}">任课老师：${teacher_6_6}</c:if></span>
                            </th>
                            <th>
                                <span>${course_6_7}</span><br/>
                                <span><c:if test="${teacher_6_7!='0'}">任课老师：${teacher_6_7}</c:if></span>
                            </th>
                        </tbody>
                        <tbody>
                        <tr style="border:1px hidden;border-top:1px solid ;padding-top: 3px;">
                            <th colspan="7">
                            </th>
                            <th style="padding-left:50px;">

                                <c:if test="${newUser.jurisdiction<=10}">
                                <a href="${pageContext.servletContext.contextPath}/queryAllCourseUid">
                                <button type="submit" id="upbut"  onclick="upsubmit()" class="btn btn-theme">返回</button>
                                </a>
                                <c:if test="${newUser.jurisdiction<=10}">
                                <a href="${pageContext.servletContext.contextPath}/updateCoursera?courseUid=${courseUid}">
                                    <button type="button" class="btn btn-theme">修改</button>
                                </a>
                                </c:if>
                                </c:if>
                            </th>
                        </tr>
                        </tbody>
                    </table>
                </div>
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