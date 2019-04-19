<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>

<link rel="stylesheet" href="css/index.css"/>
<script type="text/javascript"  src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/time.js"></script>
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="js/two_menu_adm.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<script>
/*设备接入*/
 function clientAccess(){
	 layer.open({
		  type: 1,
		  title: false,
		  closeBtn: 0,
		  shadeClose: true,
		  area: ['678.5px', '526.5px'],
		  content: "<img alt='' src='images/clientAccess.jpg'>"
		});


 }


/*录入终端*/
function clientIndex(){
	document.form1.target = "_self";
	document.form1.action = "index.vs?openIntro=1"; 
	document.form1.submit();
}

/*设备控制-开关机设置*/
function clientOnoffplan(){
	document.form1.target = "_self";
	document.form1.action = "toclientcs.vs?openIntro=1"; 
	document.form1.submit();
}

/*设备控制-终端参数设置*/
function clientCsset(){
	document.form1.target = "_self";
	document.form1.action = "toclientcs.vs?openIntro=2"; 
	document.form1.submit();
}

/*上传素材-已上传背景为例*/
function uploadSc(){
	document.form1.target = "_self";
	document.form1.action = "tosclist.vs?sucai.type=1&gssi.sucaigroupid=0&openIntro=1"; 
	document.form1.submit();
}

/*普通节目制作*/
function addItem(){
	document.form1.target = "_self";
	document.form1.action = "toitemlist.vs?igr.itemgroupid=0&openIntro=1"; 
	document.form1.submit();
}

/*互动节目制作*/
function addItemInteract(){
	document.form1.target = "_self";
	document.form1.action = "toiteminteractlist.vs?igr.itemgroupid=0&openIntro=1"; 
	document.form1.submit();
}

/*发布节目*/
function sendItem(){
	document.form1.target = "_self";
	document.form1.action = "toitemlist.vs?igr.itemgroupid=0&openIntro=2"; 
	document.form1.submit();
}

/*用户操作*/
function userOpera(){
	document.form1.target = "_self";
	document.form1.action = "user.vs?openIntro=1"; 
	document.form1.submit();
}

/*权限操作*/
function powerOpera(){
	document.form1.target = "_self";
	document.form1.action = "topowerlist.vs?openIntro=1"; 
	document.form1.submit();
}

</script>

</head>
<body>
<form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			       <ww:property value='#session.local.a00065' /> :
			        <span class="function"><ww:property value='#session.local.a00845' /></span>
			        <span class="material_bg"><ww:property value='#session.local.a00846' /></span>
			</div>
		</div>
</div>

<div class="c_middle">
    
	<!--操作菜单-->
	<div class="c_right">
	   
       <ww:if test="#session.version_onoff.helpIndexShow==1">
       
            <div style="margin:10px 10px;font-siz:13px;">
	             <span><ww:property value='#session.local.b00207' />:</span>
            </div>
       
	       <div style="margin:20px 20px;">
	       
	            <button onclick="clientAccess()"  type="button" class="btn btn-primary"><ww:property value='#session.local.b00207' /></button>
	            
	       		<button onclick="clientIndex()"  type="button" class="btn btn-primary"><ww:property value='#session.local.a00407' /></button>
	       		
	       </div>
       </ww:if>
       
       <div style="margin:10px 10px;font-siz:13px;">
	        <span><ww:property value='#session.local.a00007' />:</span>
       </div>
       <div style="margin:20px 20px;">
       		<button onclick="uploadSc()"  type="button" class="btn btn-primary"><ww:property value='#session.local.a00058' />-<ww:property value='#session.local.a00877' /></button>
       </div>
       <div style="margin:10px 10px;font-siz:13px;">
	        <span><ww:property value='#session.local.a00008' />:</span>
       </div>
       <div style="margin:20px 20px;">
       		<button onclick="addItem()"  type="button" class="btn btn-primary"><ww:property value='#session.local.a00878' /></button>
       		<button onclick="addItemInteract()"  type="button" class="btn btn-primary"><ww:property value='#session.local.a00879' /></button>
       		<button onclick="sendItem()"  type="button" class="btn btn-primary"><ww:property value='#session.local.a00880' /></button>
       </div>
       <div style="margin:10px 10px;font-siz:13px;">
	        <span><ww:property value='#session.local.a00240' />:</span>
       </div>
       <div style="margin:20px 20px;">
       		<button onclick="clientOnoffplan()"  type="button" class="btn btn-primary"><ww:property value='#session.local.a00156' />-<ww:property value='#session.local.a00881' /></button>
       		<button onclick="clientCsset()"  type="button" class="btn btn-primary"><ww:property value='#session.local.a00156' />-<ww:property value='#session.local.a00882' /></button>
       </div>
       <div style="margin:10px 10px;font-siz:13px;">
	        <span><ww:property value='#session.local.a00010' />:</span>
       </div>
       <div style="margin:20px 20px;">
       		<button onclick="userOpera()"  type="button" class="btn btn-primary"><ww:property value='#session.local.a00883' /></button>
       		<button onclick="powerOpera()"  type="button" class="btn btn-primary"><ww:property value='#session.local.a00884' /></button>
       </div>
	
	</div>
</div>
</form>	
</body>
</html>