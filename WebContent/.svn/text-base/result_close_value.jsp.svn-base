<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="PRAGMA" content="NO-CACHE">
<title></title>
</head>
<script language="JavaScript">
function finish()
{
	 var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	 var outname=document.getElementById("info").value; 
	 window.parent.returnValue=""; 
     window.parent.returnValue=outname; 
     window.parent.layer.close(index);
}
</script>
<body onLoad="finish()">
<input type="text" id="info" value="<ww:property value='info'/>" />
</body>
</html>
