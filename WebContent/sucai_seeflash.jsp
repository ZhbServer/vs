<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/base.css" rel="stylesheet" type="text/css">
<title></title>
</head><body>

<div>
<object style="position:absolute;width:640px;height:480px"
codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0" 
classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"> 
<param value="files/<ww:property value='fname' />" name="movie" /> 
<param value="high" name="quality" /> 
<param value="transparent" name="wmode" /> 
<param value="exactfit" name="SCALE" /> 
<embed style="position:absolute;width:640px;height:480px"  wmode="transparent" type="application/x-shockwave-flash" 
pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" 
quality="high" src="files/<ww:property value="fname" />" />

</object> 
</div>
</body>
</html>