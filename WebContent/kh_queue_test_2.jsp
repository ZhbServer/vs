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
   
</script>
</head>
<script language="javascript">

</script>

<script>
	function queue_click() {

		//获取数组
		
		var quss=document.getElementById("queues").value.split(",");
		var queuess="";
		for ( var i = 0; i < quss.length; i++) {
            if(i==0){
            	queuess="queues="+quss[i];
            }else{
                queuess=queuess+"&queues="+quss[i];
            }
		}
		document.form1.action = "apiQueuingTreatment.vs?"+queuess;
		document.form1.submit();
	}
	
</script>


<body>
   <form  name="form1" method="post" >
		<div id="part_one" class="part_one">
		         叫号数组:<input  id="queues"   />格式:区号_窗口号, 区号2_窗口号2, 区号3_窗口号3  多个用 ,分隔<br/>
		         叫号号码:<input  name="number" value="1001"  /><br/>
		         叫号姓名:<input  name="nname"  value="张三"/><br/><p>
		   &nbsp;&nbsp;&nbsp;<input type="button" value="叫号"  style="width: 80px;height: 30px;" onclick="queue_click()" />                                              
		</div>
   </form>
</body>
</html>
