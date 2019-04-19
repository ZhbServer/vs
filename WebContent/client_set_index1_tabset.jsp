<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet"  href="css/index.css"  type="text/css" />
<link rel="stylesheet"  href="css/reset.css"  type="text/css" />
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/cookie.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<script>

	window.onload = function()
	{
		var cookies = getCookie("csi_tabset");
		if(cookies == null || cookies == ''){
			var c = document.getElementsByName("cb");
		    for(var i = 0; i < c.length; i++){
		    	c[i].checked = true;
		    }
		}else{
			var c = document.getElementsByName("cb");
		    for(var i = 0; i < c.length; i++){
		    	if(cookies.indexOf(c[i].value) != -1){
		    		c[i].checked = false;
		    	}else{
		    		c[i].checked = true;
		    	}
		    }
		}
	}

	function h(){
		var c = document.getElementsByName("cb");
	    var s="";
	    for(var i = 0; i < c.length; i++){
			if(c[i].checked == false){
			     if(s==""){
			       s=c[i].value;
			     }else{
			       s=s+","+c[i].value;
			     }
			}
	    }
	    setCookie("csi_tabset",s);
	   
	    var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
		window.parent.returnValue=s; 
	    window.parent.layer.close(index);
	}
</script>
</head>
<body>
	<!-- 列表设置 -->
	<table border="1" width="200px;" style="margin:20px auto;line-height:30px;text-align:center;">
		<tr>
			<td>
				<span style="font-size:15px;"><ww:property value='#session.local.a00988' /></span>
			</td>
		</tr>
		<tr>
			<td>
				<input type="checkbox" name="cb" value="col1"><ww:property value='#session.local.a00133' /></input>
			</td>
		</tr>
		<tr>
			<td>				
				<input type="checkbox" name="cb" value="col2"><ww:property value='#session.local.d00024' /></input>
			</td>
		</tr>
		<tr>
			<td>	
				<input type="checkbox" name="cb" value="col3"><ww:property value='#session.local.a00041' /></input>
			</td>
		</tr>
		<tr>
			<td>	
				<input type="checkbox" name="cb" value="col4"><ww:property value='#session.local.a00040' /></input>
			</td>
		</tr>
		<tr>
			<td>
				<input type="checkbox" name="cb" value="col5"><ww:property value='#session.local.a00043' /></input>
			</td>
		</tr>
		<tr>
			<td>
				<input type="checkbox" name="cb" value="col6"><ww:property value='#session.local.a00762' /></input>
			</td>
		</tr>
		<tr>
			<td>
				<input type="checkbox" name="cb" value="col7"><ww:property value='#session.local.a00765' /></input>
			</td>
		</tr>
		<tr>
			<td>				
				<input type="checkbox" name="cb" value="col8"><ww:property value='#session.local.a00016' /></input>
			</td>
		</tr>
	
		<tr>
			<td style="height:40px;">
				<button class="btn btn-sm btn-primary" type="button" onclick="h()"><ww:property value='#session.local.a00080' /></button>
			</td>
		</tr>
	</table>
</body>
</html>