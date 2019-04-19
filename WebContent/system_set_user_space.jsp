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
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript">
//初始化加载用户资源存储空间
window.onload=function(){

	window.parent.returnValue="0";

	var totalSize = $("#totalSize").val();
	if(totalSize == ""){
		totalSize.value = 0;
	}
	var state = $("#state").val();
	if(state == "1"){
		$("#ck2").attr("checked",true);
		$("#total").attr("disabled",true);
	}else{
		$("#ck2").attr("checked",false);
	}
	
};

function change2(){

	if($("#ck2").is(':checked') == false){
		$("#total").attr("disabled",false);
	}else{
		$("#total").attr("disabled",true);
		$("#total").val('');
	}
	
}

//确认保存
function save(){

	var ck;
	var uid = $("#uid").val();
	var total = parseFloat($("#total").val());
	var scTotal = parseFloat($("#scTotal").val());
	var tSize = parseFloat($("#totalSize").val());
	if(isNaN(total)){
		total = 0;
	}
	if(isNaN(tSize)){
		totalSize = 0;
	}
	if(scTotal > (total+tSize)){
		alert("<ww:property value='#session.local.a01033' />");
		return false;
	}

	if($("#ck2").is(':checked') == false){
		ck = 0;
	}else{
		ck = 1;
	}
	
	$.ajax({
	 	 url:'ajaxsaveuserspace.vs',
	 	 data:{
	 	 		ck: ck,
 				total : total,
 				uid : uid
			 },
		 type:'post',  
	     cache:false,  
	     dataType:'json',  
	     success:function(data) {
			 var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
			 window.parent.returnValue="1"; 
	         window.parent.layer.close(index);
		 }
	});
	
}
 

</script>

</head> 
<body>
   <form  name="form1" method="post" >
   		<div class="panel-primary" style="margin: 2px 2px;">
	   		<div class="panel-heading">
	                <ww:property value="#session.local.a01029"/> <!-- 修改计划 -->
	        </div>
        </div>
       <div class="container clearfix" style="margin: 50px auto;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                       
		                         <tr>
		                         	
		                         	<td style="text-align: right;padding-right: 5px;"><ww:property value='#session.local.a00564' />:</td>
		                         	<td>
		                         		<span>
		                         			<ww:property value='scTotal'/>
		                         			<input id="scTotal" name="scTotal" value="<ww:property value='scTotal'/>" type="hidden" />
		                         		</span>/
		                         		<span>
			                         		<ww:if test="state == 0">
			                         			<ww:property value='total'/>
			                         		</ww:if>
			                         		<ww:else>
			                         			<ww:property value='#session.local.a01030' /><ww:if test="total > 0">(<ww:property value='total'/>)</ww:if>
			                         		</ww:else>
			                         		<input id="totalSize" name="totalSize" value="<ww:property value='total'/>" type="hidden" />
		                         		</span>
		                         	</td>
		                         </tr>
		                         
		                         <tr>
		                         	
		                            <td style="text-align: right;padding-right: 5px;" ><ww:property value='#session.local.a01041' />:</td>
		                            <td>
		                               <input id="total" type="text"/>
		                               <input type="hidden" id="uid" name="uid" value="<ww:property value='uid' />" />
		                               <input type="hidden" id="state" name="state" value="<ww:property value='state' />" />
		                            </td>
		                         </tr>
		                         
		                         <tr>
		                            
		                            <td style="text-align: right;padding-right: 5px;" ><ww:property value='#session.local.a01030' />:</td>
		                            <td><input type="checkbox" id="ck2" onclick="change2()" /></td>
		                         </tr>
		                         
		                         <tr style="height: 40px;text-align: center;">
		                            
		                            <td style="padding-left: 200px;" colspan="2">
	                                    <button class="btn btn-primary" type="button"  onclick="save()"><ww:property value='#session.local.a00080' /></button>
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
