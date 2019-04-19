<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<link rel="stylesheet" href="css/index.css" />
<link rel="stylesheet" href="css/common.css" />
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>

<link rel="stylesheet" href="../css/index.css" />
<link rel="stylesheet" href="../css/common.css" />
<script type="text/javascript" src="../js/jq/jquery.js"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="../zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<link rel="stylesheet" href="../intro.js-2.4.0/introjs.css" />
</head>
<body style="height: 100%;">
<script type="text/javascript"> 
document.body.onselectstart=document.body.oncontextmenu=function(){ return false;} 
</script> 

<form name="form1" method="post">
  
   <div class="panel panel-primary" style="border: 0px;">
   
  <div class="panel-heading">
                <ww:property value="#session.local.a00820"/> <!-- 节目列表-->
  </div>
           
  <div class="container clearfix" style="margin: 30px 50px;">
  <div class="main-wrap">
  <div class="result-wrap">
  <div class="result-content" style="overflow: auto;">

   <table class="insert-tab" width="100%">
	<tbody>
		<ww:if test="jhitem.day==0">
			<tr>
				<th style="text-align: center;" width="100%" height="40px">
					<ww:property value="#session.local.a00540" />:<ww:property value="jhitem.sdate" />——
					<ww:property value="#session.local.a00541" />:<ww:property value="jhitem.edate" />
				</th>
			</tr>
		</ww:if>
		<ww:if test="jhitem.day==1">
			<th style="text-align: center;" width="100%" height="40px">
				<ww:property value="#session.local.a00475" />:<ww:property value="jhitem.sdate" />——<ww:property value="jhitem.edate" />
			</th>
		</ww:if>
		<ww:if test="jhitem.day==2">
			<th style="text-align: center;" width="100%" height="40px">
				<ww:property value="#session.local.a00476" />:<ww:property value="jhitem.sdate" />——<ww:property value="jhitem.edate" />
			</th>
		</ww:if>
		<ww:if test="jhitem.day==3">
			<th style="text-align: center;" width="100%" height="40px">
				<ww:property value="#session.local.a00478" />:<ww:property value="jhitem.sdate" />——<ww:property value="jhitem.edate" />
			</th>
		</ww:if>
		<ww:if test="jhitem.day==4">
			<th style="text-align: center;" width="100%" height="40px">
				<ww:property value="#session.local.a00479" />:<ww:property value="jhitem.sdate" />——<ww:property value="jhitem.edate" />
			</th>
		</ww:if>
		<ww:if test="jhitem.day==5">
			<th style="text-align: center;" width="100%" height="40px">
				<ww:property value="#session.local.a00480" />:<ww:property value="jhitem.sdate" />——<ww:property value="jhitem.edate" />
			</th>
		</ww:if>
		<ww:if test="jhitem.day==6">
			<th style="text-align: center;" width="100%" height="40px">
				<ww:property value="#session.local.a00481" />:<ww:property value="jhitem.sdate" />——<ww:property value="jhitem.edate" />
			</th>
		</ww:if>
		<ww:if test="jhitem.day==7">
			<th style="text-align: center;" width="100%" height="40px">
				<ww:property value="#session.local.a00482" />:<ww:property value="jhitem.sdate" />——<ww:property value="jhitem.edate" />
			</th>
		</ww:if>
		<ww:if test="jhitem.day==8">
			<th style="text-align: center;" width="100%" height="40px">
				<ww:property value="#session.local.a00483" />:<ww:property value="jhitem.sdate" />——<ww:property value="jhitem.edate" />
			</th>
		</ww:if>
		<ww:if test="checkItemState==1">
			<tr>
				<th style="text-align: center;" width="100%" height="40px"><ww:property
					value="#session.local.b00032" /></th>
			</tr>
		</ww:if>
		<ww:else>
			<tr>
				<th style="text-align: center;" width="100%" height="40px"><ww:property
					value="#session.local.a00246" /></th>
			</tr>
		</ww:else>
		<ww:iterator value="items">
			<tr>
				<th style="text-align: center;"><a target="_blank"
					href="files/<ww:property value='filename'/>/see.html"> 
					<ww:property value="name" /></a></th>
			</tr>
		</ww:iterator>
	</tbody>
</table>

</div>
</div>
</div>

</div>
</div>
</form>

</body>
</html>
