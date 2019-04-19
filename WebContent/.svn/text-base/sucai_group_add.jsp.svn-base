<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/common.css"/>
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<script type="text/javascript">

window.onload=function (){
	document.getElementById("tid").value=<%=request.getParameter("tid")%>;
	document.getElementById("type").value=<%=request.getParameter("sctype")%>;

	document.onkeydown = function(e){ 
	    var ev = document.all ? window.event : e;
	    if(ev.keyCode==13) {
	    	addcg();
	     }
	}
}

function addcg(){
	var tid = document.getElementById("tid");
	var type=document.getElementById("type");
	var igname =document.getElementById("scgname").value;
	if (igname.length < 1) {
	  	layer.msg("<ww:property value='#session.local.a00100' />!");
		return;
	}
	if(igname.length > 40){
	    layer.msg("<ww:property value='#session.local.a00984' />!");
		return;
    }

	$.ajax({
	 	 url:'ajaxscaddcheck.vs',
		 data:{
			type:type.value,
			scgname:igname
		 },
		 type:'post',  
	     cache:false,  
	     dataType:'json',  
	     success:function(data) {
		     if(data == '0'){
			    if(igname == "<ww:property value='#session.local.a00144' />" || igname == "<ww:property value='#session.local.a00849' />"){
			    	layer.msg("<ww:property value='#session.local.a00989' />!");
				}else{
					document.form1.target = "_self";
		    		document.form1.action = 'addscg.vs'; 
		    		document.form1.submit();
				}
			 }else{
				 layer.msg("<ww:property value='#session.local.a00989' />!");
			 }
		 }
	});
		   
}




</script>

</head> 
<body>
   <form  name="form1" method="post" >
   
   		 <!--父级id-->
		 <input type="hidden" name="tid"  id="tid" value=""/>
		 <!--级别-->
		 <input type="hidden" name="type"  id="type" value=""/>
		 
         <div class="container clearfix" style="margin: 50px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
	                    <table class="insert-tab" width="100%">
	                        <tbody>
		                        <tr>
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00095' />：</th>
		                            <td>
		                                   <input  class="common-text required" id="scgname" name="scgname"    type="text"/>
		                            </td>
		                        </tr>
	                            <tr>
	                                <th></th>
	                                <td>
	                                    <button class="btn btn-primary" type="button"  onclick="addcg()"><ww:property value='#session.local.a00080' /></button>
	                                     <!-- <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">-->
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
		            </div>
		        </div>
		     </div>
      	</div> 
   </form>
</body>
</html>
