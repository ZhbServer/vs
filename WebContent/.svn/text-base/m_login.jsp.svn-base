<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>

    <script type="text/javascript" src="m/js/jquery-1.4.4.min.js"></script>

    <script type="text/javascript" src="js/layer/layer.js"></script>
    
    <script type="text/javascript" src="js/cookie.js"></script>

    <style type="text/css">
	    * {
			margin: 0;
			padding: 0;
		}
		
		html {
			height: 100%;
		}
		
		body {
			height: 100%;
			background: #fff url(m/images/m_bg.png) 50% 50% no-repeat;
			background-size: cover;
		}
		
		.login {
			position: absolute;
			left: 50%;
			top: 50%;
			width: 430px;
			height: 550px;
			margin: -300px 0 0 -215px;
			border: 1px solid #fff;
			border-radius: 20px;
			overflow: hidden;
		}
		
		.logo {
			width: 104px;
			height: 104px;
			margin: 50px auto 80px;
			background: url(m/images/login.png) 0 0 no-repeat;
		}
		
		.info {
			position: relative;
			width: 360px;
			margin: 0 auto;
			padding-bottom: 30px;
		}
		
		.info input {
			width: 288px;
			height: 48px;
			padding-left: 70px;
			border: 1px solid #fff;
			border-radius: 25px;
			font-size: 18px;
			color: #fff;
			background-color: transparent;
			outline: none;
		}
		
		.info button {
			width: 360px;
			height: 50px;
			border: 0;
			border-radius: 25px;
			font-size: 18px;
			color: #1f6f4a;
			outline: none;
			cursor: pointer;
			background-color: #fff;
		}
		
		#account {
			background: url(m/images/emil.png) 20px 14px no-repeat;
		}
		
		#password {
			background: url(m/images/password.png) 23px 11px no-repeat;
		}
		
		.warn {
			display: none;
			position: absolute;
			left: 20px;
			top: 52px;
			font-size: 14px;
			color: #f50;
		}
		
		.login ::-webkit-input-placeholder {
			font-size: 18px;
			line-height: 1.4;
			color: #fff;
		}
		
		.login :-moz-placeholder {
			font-size: 18px;
			line-height: 1.4;
			color: #fff;
		}
		
		.login ::-moz-placeholder {
			font-size: 18px;
			line-height: 1.4;
			color: #fff;
		}
		
		.login :-ms-input-placeholder {
			font-size: 18px;
			line-height: 1.4;
			color: #fff;
		}
		
		@media screen and (max-width: 500px) {
			* {
				box-sizing: border-box;
			}
			.login {
				position: static;
				width: auto;
				height: auto;
				margin: 0 30px;
				border: 0;
				border-radius: 0;
			}
			.logo {
				margin: 50px auto;
			}
			.info {
				width: auto;
			}
			.info input,.info button {
				width: 100%;
			}
		}
		
		
		    
    </style>
    
    <script type="text/javascript">

          function initCookie(){
  
        	   //获取cookie写入值
              var account=getCookie("account");

              var password=getCookie("password");

              if(account!=null&&password!=null){

                     $("#account").val(account);

                     $("#password").val(password);
              }

              
          }
    
    </script>
  </head>
  
  
  <body onload="initCookie()">
  
  
    <div class="login">
	<div class="logo"></div>
	<div class="info">
		<input id="account" type="text" autocomplete="off" placeholder="请输入您的账号" name="account">
		<p class="warn">请输入合法的邮箱地址</p>
	</div>
	<div class="info">
		<input id="password" type="password" autocomplete="off" placeholder="请输入您的密码" name="password">
		<p class="warn">邮箱或密码不正确</p>
	</div>
	<div class="info">
		<button onclick="login()">登 录</button>
	</div>

    </div>

  
   
   <script type="text/javascript">
    
	    //登陆
		function login(){

			var account = $("#account").val();
			var password = $("#password").val();
			
			if (account.length < 1) {
				alert("账号不能为空");
				return;
			}

			if (password.length < 1) {
				alert("密码不能为空");
				return;
			}
		
			$.ajax({
				type:'post',
				url:'ajaxloginm.vs',
				data:"password="+password+"&account="+account,
				datatype:'json',
				async:true,
				success:function(data){		  
				   
				  
				    if(data=="2"){
					    
				    	alert("账户或者密码错误");
				    	return;
				    	
					}else if(data=="3"){

						 setCookie("account",account);
						 setCookie("password",password);
                         window.location.href="m_item_list.jsp";
				    	
					}else if(data=="4"){

				    	 alert("用户被禁用");
				    	 return;
				    	
					}else if(data=="5"){

						 setCookie("account",account);
						 setCookie("password",password);
						 window.location.href="m_dish_list.jsp";
				    	
					}

				}
			});
	    }
	    
   </script> 
  

  </body>
  
</html>