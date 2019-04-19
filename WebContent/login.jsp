<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><ww:property value='#session.local.a00002'/></title>
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<script type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript" src="js/md5.js"></script>
<style type="text/css">
body,html{
	width:100%;
	height:99.5%;
	margin:0px;
	padding:0px;
	border:0px;
	color:#FF0000;
	font-family:Microsoft YaHei;
/*background-color:#134AFF;*/
/*overflow:hidden*/
}
</style>
<script type="text/javascript">
    /*启动获取浏览器高度自适应屏幕*/ 
    window.onload = function()
    {

        var h = document.body.clientHeight;
        
        document.getElementById("part_one").style.height=(h-40)+"px";

        var myB=myBrowser();

        /*if(myB=="Chrome"){

        }else{
        	window.location.href="browser_down.jsp";
        }*/

        //获取cookie写入值
        var initLoginFlag=getCookie("initLoginFlag");

        if(initLoginFlag==null){
        	initLoginPrompt();
        }
	    

    };

    //初始化提示账户密码
    function initLoginPrompt(){

    	 var intro = introJs();  
    	 intro.exit();
		 intro.setOptions({
	 		 
		 	 	 prevLabel:"<ww:property value='#session.local.a00861' />", 
		         nextLabel:"<ww:property value='#session.local.a00862' />",
		         skipLabel:"<ww:property value='#session.local.a00863' />",
		         doneLabel:"<ww:property value='#session.local.a00020' />",
                 showStepNumbers: false,
		         showBullets: false,
		         exitOnOverlayClick: false,
		         overlayOpacity: 0.6,
		         steps: [  
		 			{  
		 				element: '#step0',  
		 				intro: "<ww:property value='#session.local.b00179' /><br/><ww:property value='#session.local.a00029' />:&nbsp;&nbsp;<ww:property value='#session.local.a00046' /> :admin <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <ww:property value='#session.local.a00047' /> :admin",
		 				position: "right"	
		 			}
		       ]  
		    }).start();  

	 		intro.oncomplete(function() {
	 			intro.exit();
	 	    });
	
	 		intro.onexit(function() {
	 			
	 			//layer.msg("<ww:property value='#session.local.a00864' />");
	 		
	 			//flag = false;
	 			
	 		});
           

    }
    
    /*切换验证码*/
    function loadimage(){ 
	      document.getElementById("rand_image").src = "login_yzcode.jsp?"+Math.random(); 
    }

    //回车触发
	document.onkeydown = function(e){
		   if(!e){
		    e = window.event;
		   }
		   if((e.keyCode || e.which) == 13){
			   ajaxlogin();
		   }
		  };

	  



	//登陆
	function ajaxlogin(){

		var account = document.getElementById("account").value;
		var password = document.getElementById("password").value;
		password=encode64(password);
		//var hash = hex_md5(password);
	    //alert(hash)
	    
	    //return;
	   
		var yzcode = document.getElementById("yzcode").value;
		if (account.length < 1) {
			layer.tips("<ww:property value='#session.local.a00555' />", '#account');
			return;
		}

		if (password.length < 1) {
			layer.tips("<ww:property value='#session.local.a00556' />", '#password');
			return;
		}
		if (yzcode.length < 1) {
			layer.tips("<ww:property value='#session.local.a00557' />", '#yzcode',{tips: 3});
			return;
		}
		$.ajax({
			type:'post',
			url:'ajaxlogin.vs',
			data:"password="+password+"&account="+account+"&yzcode="+yzcode,
			datatype:'json',
			async:true,
			success:function(data){		  
			   
			    if(data=="1"){

			    	layer.tips("<ww:property value='#session.local.a00558' />", '#yzcode');
				}

			    if(data=="2"){

			    	layer.tips("<ww:property value='#session.local.a00559' />", '#account');
				}


			    if(data=="3"){

			    	window.location.href="main.vs";
				}

			    if(data=="4"){

			    	layer.tips("<ww:property value='#session.local.a00560' />", '#account');
				}


			    
				
			    
			}
		});

    }
	function alterfont(val){
        //var zv=document.getElementById("zf").value;
        window.location.href="internation.vs?zv="+val;
    } 

	// base64加密开始  
    var keyStr = "ABCDEFGHIJKLMNOP" + "QRSTUVWXYZabcdef" + "ghijklmnopqrstuv"  
            + "wxyz0123456789+/" + "=";  
      
    function encode64(input) {  
  
        var output = "";  
        var chr1, chr2, chr3 = "";  
        var enc1, enc2, enc3, enc4 = "";  
        var i = 0;  
        do {  
            chr1 = input.charCodeAt(i++);  
            chr2 = input.charCodeAt(i++);  
            chr3 = input.charCodeAt(i++);  
            enc1 = chr1 >> 2;  
            enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);  
            enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);  
            enc4 = chr3 & 63;  
            if (isNaN(chr2)) {  
                enc3 = enc4 = 64;  
            } else if (isNaN(chr3)) {  
                enc4 = 64;  
            }  
            output = output + keyStr.charAt(enc1) + keyStr.charAt(enc2)  
                    + keyStr.charAt(enc3) + keyStr.charAt(enc4);  
            chr1 = chr2 = chr3 = "";  
            enc1 = enc2 = enc3 = enc4 = "";  
        } while (i < input.length);  
  
        return output;  
    }  
    // base64加密结束  
    
</script>
</head>
<body>
<div id="part_one" class="part_one" >
<div style="float: right;display: block;left: 88%;top: 2%;position: absolute;color: black;">
      <ww:property  value="#session.local.a00049"/>: 
	   <select onchange="alterfont(this.value)" id="zf" >
	       <option value="ch">language</option>
	       <option value="ch">中文</option>
	       <option value="tw">繁体</option>
	       <option value="en">english</option>
	       <option value="hy">한국어</option>
	   </select>
</div> 
<img src="image/login/bg_login.png" width="100%" height="100%"/>

<div  class="mid_login">
<form  name="form1" method="post" class="login">
<div class="bg">
    <div class="login_logo"><img src="image/<ww:property value='#session.local.a00000' />/logo_i.png"/></div>
    <div id="step0">
	    <div class="item_bg">
	          <div class="form_tip_bg"><ww:property value="#session.local.a00046"/></div>
	          <input  style="border: 1px solid #b5b5b5;" type="text" name="account" id="account" />
	          <i class="icon icon-question-sign" style="color: #000000;cursor: pointer;position:relative;top:13px;left:5px;" title="<ww:property value='#session.local.a00845'/>" onclick="initLoginPrompt()"></i>
	    </div>
	    <div class="item_bg">
			  <div class="form_tip_bg"><ww:property value="#session.local.a00047"/></div>
			  <input style="border:1px solid #b5b5b5;"   type="password" name="password" id="password" />
	    </div>
    </div>
    <div class="item_bg">
		   <div class="form_tip_bg"><ww:property value="#session.local.a00048"/></div>
		       <input style="border:1px solid #b5b5b5;"  type="text"  name="yzcode" id="yzcode"   value=""/>
<!--		   <div class="check_split"></div>-->
			   <div class="check_code">
			     <a href="javascript:loadimage();">
			       <img  id="rand_image" src="login_yzcode.jsp" /> 
			     </a>  
			   </div>
    </div>
    <div class="lang_container">
        <div class="select_lang">
        <span  style="display: none;"><ww:property value="#session.local.a00049"/>：</span>
        <select style="display: none;" id="zf">
             <option value="ch">language</option>
		     <ww:iterator value="indexlangs">
		           <option value="<ww:property value='lvalue'/>"><ww:property value='lshow'/></option>
		     </ww:iterator>       
         </select>
        </div>
        <span class="version"><ww:property value="#session.local.a00050"/>
           :<ww:property value='#request.version'/>               
        </span>
    </div>
    <input type="button" value="<ww:property value='#session.local.a00051'/>" class="login_button" onclick="ajaxlogin()"/>
</div>
</form>
</div>

</div>

<div class="footer">

</div>

</body>
</html>
