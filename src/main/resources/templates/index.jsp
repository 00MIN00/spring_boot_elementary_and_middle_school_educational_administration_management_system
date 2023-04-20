<%--
  Created by IntelliJ IDEA.
  User: MIN
  Date: 2023/3/14
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script>
  // window.onload = function () {
  //   var  img = document.getElementById("img1");
  //   img.onclick = function () {
  //     var data = new Date().getTime();
  //     img.src = "/yzms?"+data;
  //   }
  // }
  function createCode(){
    var checkCode = document.getElementById("img1");
    var data = new Date();
    checkCode.src="/yzms?"+data.getTime();
  }

  // function createCode(){
  //   code = "";
  //   var codeLength = 4;//验证码的长度
  //   var checkCode = document.getElementById("code");
  //   var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',
  //           'S','T','U','V','W','X','Y','Z');//随机数
  //   for(var i = 0; i < codeLength; i++) {//循环操作
  //     var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35）
  //     code += random[index];//根据索引取得随机数加到code上
  //   }
  //   checkCode.value = code;//把code值赋给验证码
  // }

</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

  <title>用户登录界面</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.servletContext.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
  <!--external css-->
  <link href="${pageContext.servletContext.contextPath}/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="${pageContext.servletContext.contextPath}/assets/css/style.css" rel="stylesheet">
  <link href="${pageContext.servletContext.contextPath}/assets/css/style-responsive.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<body>

<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->

<div id="login-page">
  <div class="container">

    <form class="form-login" action="${pageContext.servletContext.contextPath}/login" method="post">
      <h2 class="form-login-heading" >${bt}</h2>
      <div class="login-wrap">
        <input type="text" class="form-control" name="username" placeholder="User ID" autofocus>
        <br>
        <input type="password" class="form-control" name="password" placeholder="Password">
        <br>
        <input id="yzm" type="text" class="form-control" name="yzm" placeholder="验证码">
        <br/>
        <img  id="img1"src="${pageContext.request.contextPath}/yzms" />
        <a id="aa" onclick="createCode()" href="#">看不起，换一张</a><br>

        <button class="btn btn-theme btn-block" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
        <hr>

        <div class="login-social-link centered">
          <p style="color: red">${pageContext.request.getAttribute("return")}</p>
        </div>
      </div>

      <!-- Modal -->
      <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">Forgot Password ?</h4>
            </div>
            <div class="modal-body">
              <p>Enter your e-mail address below to reset your password.</p>
              <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

            </div>
            <div class="modal-footer">
              <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
              <button class="btn btn-theme" type="button">Submit</button>
            </div>
          </div>
        </div>
      </div>
      <!-- modal -->

    </form>

  </div>
</div>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${pageContext.servletContext.contextPath}/assets/js/jquery.js"></script>
<script src="${pageContext.servletContext.contextPath}/assets/js/bootstrap.min.js"></script>

<!--BACKSTRETCH-->
<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/assets/js/jquery.backstretch.min.js"></script>
<script>
  $.backstretch("${pageContext.servletContext.contextPath}/assets/img/index.jpg", {speed: 500});
</script>


</body>
</html>
