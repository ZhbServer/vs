<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<title></title>
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/common.css"/>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/icon.css"  />
<script type="text/javascript" src="js/constant.js"></script>

<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/fresh.js" language="javascript"></script>
<base target="_self" />
<style type="text/css">
A{text-transform:none; text-decoration:none;}   
</style>
<script>
function interact_group_submit()
{
	//获取显示个数
	var igsn=document.getElementById("interactGroupShowNumber").value;

	if(igsn.length==0){
		 layer.msg("<ww:property value='#session.local.a00671' />!");
	     return;
	}
	if(!/^[0-9]*$/.test(igsn)){  
	     layer.msg("<ww:property value='#session.local.a00671' />!");
	     return;  
	} 


	var xy_x = document.getElementById("xy_x").value;
	var xy_y = document.getElementById("xy_y").value;   
    var width = document.getElementById("width").value;
	var height = document.getElementById("height").value;
	
	if(xy_x<0){
			layer.msg("<ww:property value='#session.local.a00283' />");
			return ;
	}
	if(xy_y<0){
			layer.msg("<ww:property value='#session.local.a00284' />");
			return ;
	}
	if(width<=0){
		layer.msg("<ww:property value='#session.local.a00285' />");
		return ;
	}
	if(height<=0)
	{
		  layer.msg("<ww:property value='#session.local.a00286' />");
		  return ;
	}
  	
	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	  
	window.parent.returnValue=""; 
	
	
	//X*Y*宽*高*显示个数
    window.parent.returnValue=xy_x+"*"+xy_y+"*"+width+"*"+height+"*"+igsn; 
    window.parent.layer.close(index);
}

</script>
</head>
<body>
<form action="adtxtto.vs" method="post" name="form1">
    
     <div class="panel panel-primary" style="margin: 3px 3px;">
           <div class="panel-heading">
                <ww:property value="#session.local.b00053"/> <!-- 互动组 -->
           </div>
           
           
				   <div class="container clearfix" style="margin: 10px 10px;">
				       <div class="main-wrap">
						   <div class="result-wrap">
						        <div class="result-content">
				    
						        <table class="insert-tab" width="100%">
						           <tr>
						            <td style="text-align: right;" width="100"><i class="require-red">*</i><ww:property value="#session.local.b00054" />:</td>
						            <td>
						               <input type="text" style="height: 25px;" value="<ww:property value='interactGroupShowNumber'/>"  name="interactGroupShowNumber" id="interactGroupShowNumber"  onafterpaste="this.value=this.value.replace(/\D/g,'')"  />
						            </td>
						          </tr>
						         
						          
							       <tr style="display: none;">
						            <td></td>
						            <td>
						                X:
									   <input id="xy_x" name="xy_x" type="text" <ww:if test="xy_x==null">value="0"</ww:if><ww:else>value="<ww:property value='xy_x' />"</ww:else>  style="width: 40px;height: 18px;" value="0"   onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
									    Y:
								       <input id="xy_y" name="xy_y" type="text" <ww:if test="xy_y==null">value="0"</ww:if><ww:else>value="<ww:property value='xy_y' />"</ww:else> style="width: 40px;height: 20px;" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
								       <ww:property value='#session.local.a00032' />:
							           <input name="width" id="width" type="text" style="width:40px;height: 20px;" <ww:if test="width==null">value="200"</ww:if><ww:else>value="<ww:property value='width' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
							           <ww:property value='#session.local.a00033' />:
							           <input name="height" id="height" type="text" style="width:40px;height: 20px;"  <ww:if test="height==null">value="200"</ww:if><ww:else>value="<ww:property value='height' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
						            </td>
							       
							      </tr>
				
								   <tr style="height: 40px;">
						            <td></td>
						            <td>
						               
						                <button class="btn btn-primary" onclick='interact_group_submit()' type="button"><ww:property value='#session.local.a00080' /></button>
				                 
				                        <button class="btn btn-primary" onclick='close_win_nov()' type="button"><ww:property value='#session.local.a00014' /></button>
				                          
						            </td>
								   </tr>
						        </table>
				             </div>
						  </div>
						</div>
				    </div>
		  </div>		    	    
</form>

</body>
</html>
