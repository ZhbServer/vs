<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<link rel="stylesheet"  href="../css/index.css"  type="text/css" />
<link rel="stylesheet"  href="../css/common.css"  type="text/css" />
<script type="text/javascript" src="../js/jq/jquery.js"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="../zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet"  href="css/index.css"  type="text/css" />
<link rel="stylesheet"  href="css/common.css"  type="text/css" />
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<script type="text/javascript">

function editcg(){
	   var igname =document.getElementById("uscgname").value;
	   if (igname.length < 1) {
	    	layer.msg("<ww:property value='#session.local.a00100' />!");
			return;
	   }
	   if(igname.length > 40){
		    layer.msg("<ww:property value='#session.local.a00984' />!");
			return;
	   }

	   $.ajax({
		 	 url:'ajaxinteractitemeditcheck.vs',
			 data:{
				igname : igname
			 },
			 type:'post',  
		     cache:false,  
		     dataType:'json',  
		     success:function(data) {
			     if(data == '0'){
			    	 document.form1.target = "_self";
			  	   	 document.form1.action = 'editiitg.vs'; 
			  	   	 document.form1.submit();	 
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
   
         <input type="hidden" id="itemgid" name="itemgid" value="<ww:property value='itemgid' />"/>
         <div class="container clearfix" style="margin: 50px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		              
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                         <tr>
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00239' />：</th>
		                            <td>
		                                   <input  class="common-text required" id="uscgname" name="uscgname"  value="<ww:property value='uscgname' />"  type="text"/>
		                            </td>
		                          </tr>
	                            <tr>
	                                <th></th>
	                                <td>
	                                	<button class="btn btn-primary" type="button"  onclick="editcg()"><ww:property value='#session.local.a00017' /></button>
	                                     <!-- <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">-->
	                                </td>
	                            </tr>
		                        </tbody></table>
		              
		            </div>
		        </div>
		     </div>
  
      </div> 
   
       
   </form>
</body>
</html>
