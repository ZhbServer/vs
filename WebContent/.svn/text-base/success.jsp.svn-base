<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><ww:property value='#session.local.a00002' /></title>
<link rel="stylesheet" href="css/index.css" />
<style type="text/css">
body,html {
	width: 100%;
	height: 99.5%;
	margin: 0px;
	padding: 0px;
	border: 0px;
	
	font-family: Microsoft YaHei;
	/*background-color:#134AFF;*/ /*overflow:hidden*/
}
</style>
<script type="text/javascript">
    /*启动获取浏览器高度自适应屏幕*/ 
    window.onload = function()
    {
        var h = document.body.clientHeight;
       
        document.getElementById("part_one").style.height=(h-40)+"px";   
    };
    /*切换验证码*/
    function loadimage(){ 
	      document.getElementById("rand_image").src = "login_yzcode.jsp?"+Math.random(); 
    }
</script>
</head>
<script>
	function gosubmit() {
		var account = document.getElementById("account").value;
		var password = document.getElementById("password").value;
		var yzcode = document.getElementById("yzcode").value;
		if (account.length < 1) {
			window.alert("<ww:property value='#session.local.index_alert_username'/>");
			return;
		}
		if (password.length < 1) {
			window.alert("<ww:property value='#session.local.index_alert_password'/>");
			return;
		}
		if (yzcode.length < 1) {
			window.alert("<ww:property value='#session.local.index_alert_code'/>");
			return;
		}
		document.form1.action = "login.vs";
		document.form1.submit();
	}
</script>

<body>
<div id="part_one" class="part_one">
       <div style="height: 30px;" class="header">
           <div class="head_container">
             <div class="header_right">
				<div class="header_right_1"></div>
				<div class="header_right_2"></div>
			</div>
		  </div>
      </div>
       <div class="title bottom">
		  <div class="t_container">
		      <div class="loc"></div>
		      <div class="plist2_right"></div>
		   </div>		
	   </div>
       <div class="content_container"  style="text-align: center;">
          <div class="content_mid_1" style="text-align: center;">
	          <form action="#" method="post">
	             <h3><ww:property value="#session.error"  /></h3>
	             <p><a href="<ww:property value="#session.url"  />">返回</a></p>
	          </form>
          </div>
      </div>
</div>
<div class="footer"></div>

</body>
</html>
