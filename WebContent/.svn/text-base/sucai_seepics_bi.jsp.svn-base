<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<html>
<head>
<title></title>
</head>
<script type="text/javascript">
 var total=0;
 function next()
 {
 var ims=document.getElementById("all").value;
 var is=ims.split(' ');
 if(is.length==1)
 {
 document.getElementById("imgs").src="files/"+document.getElementById("first").value;
 }
 else
 {
 if(total>=is.length)
 {
   total=0;
   document.getElementById("imgs").src="files/"+document.getElementById("first").value;
 }
 else
 {
 document.getElementById("imgs").src = "files/"+is[total]; 
 total++;
 }
 }
 }
</script>
<body style="margin: 0px; padding: 0px">
<form>
<img onClick="next()" src="files/<ww:property value="first" />" id="imgs"  width='678px' height='520px'/>
<input type="hidden"  id="all"  value="<ww:property value="names" />"/>
<input type="hidden"  id="first"  value="<ww:property value="first" />"/>
</form>
</body>

</html>