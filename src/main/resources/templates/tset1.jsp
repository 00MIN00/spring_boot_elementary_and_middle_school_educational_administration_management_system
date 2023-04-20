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

<title>添加用户</title>

<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="assets/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/style-responsive.css" rel="stylesheet">

<script src="assets/js/chart-master/Chart.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<h3>下拉列表的change事件</h3>
<select id="seltest">
	<option selected  value="0"></option>
	<option value="葡萄">葡萄</option>
	<option value="苹果">苹果</option>
	<option value="荔枝">荔枝</option>
	<option value="香焦">香焦</option>
</select><select id="seltest1">
	<option selected  value="0"></option>
	<option value="葡萄">葡萄</option>
	<option value="苹果">苹果</option>
	<option value="荔枝">荔枝</option>
	<option value="香焦">香焦</option>
</select><select id="seltest2">
	<option selected  value="0"></option>
	<option value="葡萄">葡萄</option>
	<option value="苹果">苹果</option>
	<option value="荔枝">荔枝</option>
	<option value="香焦">香焦</option>
</select>

<div>
	<ul id="uiList">
		<li value="葡萄">葡萄</li>
		<li value="苹果">苹果</li>
		<li value="香焦">香焦</li>
		<li value="荔枝">荔枝</li>
	</ul>
</div>


	<!-- js placed at the end of the document so the pages load faster --><div>
	<script src="assets/js/jquery.js"></script>
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
	<script src="assets/js/zabuto_calendar.js"></script></div>
<script type="text/javascript">
	$(function () {
		var vid_q ;
		var vid_h;
		var eid ;
		$('select').change(function (e) {
			eid = $(this).attr('id');
			vid_h =$("#"+eid).val()  //改变后的值
			// alert("ID=="+eid)
			if (vid_q=="0"){
				$("#"+eid+" option[value='0']").remove()
				$("select:not(#"+eid+") option[value="+vid_h+"]").remove()
				$("#uiList li[value="+vid_h+"]").remove()
				$("#uiList").focus()
			}else {
				$("select:not(#"+eid+") option[value="+vid_h+"]").remove()
				$("select:not(#"+eid+")").append("<option value="+vid_q+">"+vid_q+"</option>")
				$("#uiList").append("<li value="+vid_q+">"+vid_q+"</li>")
				$("#uiList li[value="+vid_h+"]").remove()
				$("#uiList").focus()
			}
		}).focus(function () {
			eid = $(this).attr('id');
			vid_q = $("#"+eid).val()   //改变前的值

		})

	});// alert(vid_q+">>"+vid_h)
	// $("select").bind("change",function () {
	//
	// 	// var seltests =  $("#seltest").options
	// 	// var seltest_val =  $("#seltest").val
	//
	// 	alert(seltests)
	//
	// 	// $("#uiList")
	// })
	// $("#input1").click(function(){
	// $(".option1").remove();
	// $(document.createElement("option"))
	// 		.val("hello")
	// 		.attr("class","option1")
	// 		.appendTo($("#datalistOption"));
	// });
</script>

</body>
</html>