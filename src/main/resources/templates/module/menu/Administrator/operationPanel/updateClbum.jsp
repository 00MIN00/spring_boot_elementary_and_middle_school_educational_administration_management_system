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
        li{
            background-color: rgba(0,0,0,0.05);
            margin:1px 20px 1px 20px ;
        }
        li p{color:#000000;font-size: 16px;}
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
            <script type="application/javascript">
                function fun() {
                    $.ajax({
                        text:'get',
                        url :"/queryAllTeacher"
                    });
                }
            </script>
            <!-- 展示主体 -->
                <form   action="${pageContext.servletContext.contextPath}/upUpdateClbum"
                        enctype="multipart/form-data" method="post" id="form0">
                <div class="content-panel" style="margin-top: 100px;">
                    <table class="table table-striped table-advance table-hover">
                        <thead>
                        <tr>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                            <th>讲台</th>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${studentList_List}"  varStatus="Y" begin="0" end="10" step="1" var="studentList">
                                <tr ><%--                            列遍历--%>
                                    <c:forEach items="${studentList}" varStatus="X" begin="0" end="5" step="1" var="student">
                                        <th >
                                            <c:if test="${student!=null}">
                                                <select  id="student_${Y.index}_${X.index}"name="student_${Y.index}_${X.index}" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                                    <c:if test="${student.courseName=='0'}">
                                                        <option selected value="0"></option>
                                                        <c:forEach items="${studentNotList}" var="students">
                                                            <option  value="${students.uid}" >${students.studentName}</option>
                                                        </c:forEach>
                                                    </c:if>

                                                    <c:if test="${student.courseName!='0'}">

                                                        <c:forEach items="${studentsList}" var="students">
                                                            <c:if test="${student.courseName==students.uid}">
                                                                <option selected value="${students.uid}" >${students.studentName}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:forEach items="${studentNotList}" var="students">
                                                            <c:if test="${student.courseName!=students.uid}">
                                                                <option value="${students.uid}">${students.studentName}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>


                                                </select><br/>
                                            </c:if>
                                        </th>
                                    </c:forEach>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tbody>
                        <tr style="border:1px hidden;border-top:1px solid ;padding-top: 3px;">
                            <th colspan="4">
                                <input type="hidden"name="clbumUid" value="${clbumUid}"/>
                            </th>
                            <th style="padding-left:50px;">
                                <button type="submit" id="upbut"  onclick="upsubmit()" class="btn btn-theme">提交</button>
                            </th>
                        </tr>
                        </tbody>
                    </table>
                </div>
                </form>
            <%--页码--%>
        </div>
        <%--功能面板 结束--%>
        <div class="col-lg-3 ds">
                <h5 style="font-size: 36px;color: #0f0f0f;">未分配班级的学生</h5>
                <ul id="uiList" style="height:750px;overflow-y:scroll;">
                    <c:forEach items="${studentNotList}" var="student">
                        <li value="${student.uid}">
                            <p  align="center">${student.studentName}</p>
                        </li>
                    </c:forEach>
                </ul>

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

    $(function () {
        var vid_q ;
        var vid_h;
        var text_q ;
        var eid ;
        $('select').change(function (e) {
            eid = $(this).attr('id');
            vid_h =$("#"+eid).val()  //改变后的值


            // alert("ID=="+eid)contains(text)
            if (vid_q=="0"){
                $("#"+eid+" option[value='0']").remove()
                $("select:not(#"+eid+") option[value="+vid_h+"]").remove()
                // $("#uiList li[value="+vid_h+"]").remove()
                // alert($("#uiList").find("#"+vid_h).remove());
                $("#uiList").find("li[value='"+vid_h+"']").remove()
                $("#uiList").focus()
            }else {
                $("select:not(#"+eid+") option[value="+vid_h+"]").remove()
                $("select:not(#"+eid+")").append("<option value="+vid_q+">"+text_q+"</option>")
                $("#uiList").append("" +
                    "<li  value="+vid_q+">" +
                        "<p align='center'>"+text_q+"</p>" +
                    "</li>")
                $("#uiList").find("li[value='"+vid_h+"']").remove()
                // $("#uiList li[value="+vid_h+"]").remove()
                $("#uiList").focus()
            }
        }).focus(function () {
            eid = $(this).attr('id');
            vid_q = $("#"+eid).val()   //改变前的值
            text_q = $("#"+eid).find("option[value='"+vid_q+"']").text()
        })
    });

</script>


</body>
</html>