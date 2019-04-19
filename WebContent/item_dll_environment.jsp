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
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/fresh.js" language="javascript"></script>
<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>


<script src="js/jscolor.js"></script> 
<base target="_self" />
<style type="text/css">
A{text-transform:none; text-decoration:none;}   
</style>
<script>

//初始化
 function initData(){
	 var currentdivJson="<ww:property value='jsonStr' />";

     currentdiv = eval( "(" + currentdivJson + ")" );//转换后的JSON对象

     $('#chargingRows').numberspinner('setValue', currentdiv.rows);  

     $('#chargingColumns').numberspinner('setValue', currentdiv.columns);  

 }

function many_submit()
{

	var reg = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
		 
    var happyVal=$("#happyVal").val();

    if(!reg.test(happyVal)){

        layer.alert("<ww:property value='#session.local.a00671' />");

        return;

        
    }

	var uncomVal=$("#uncomVal").val();

	if(!reg.test(uncomVal)){

        layer.alert("<ww:property value='#session.local.a00671' />");

        return;

    }
    
	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引

	window.parent.returnValue=""; 

    window.parent.returnValue="envir|105*"+happyVal+"*"+uncomVal; 

    window.parent.layer.close(index);
    
}



function many_return(){
	window.location.href="item_dll.jsp";
}


</script>
</head>
<body onload="initData()">
<form  method="post" name="form1"  >
    
     <div class="panel panel-primary" style="margin: 3px 3px;">
	      <div class="panel-heading">
	           <ww:property value="#session.local.b00159"/> <!-- 环境监测105 -->
	      </div>
           
           
			     <div class="container clearfix" style="margin: 10px 10px;">
			       <div class="main-wrap">
					   <div class="result-wrap">
					        <div class="result-content">
			    
					        <table class="insert-tab" width="100%">
					         
					          <tr>
					          
					            <td style="text-align: right;" width="150"><ww:property value="#session.local.b00342" />:</td><!-- 开心值 -->
					            <td>
					                <&nbsp;<input type="text" style="width: 80px;"  id="happyVal" value="<ww:property value='happyVal' />" />
					            </td>
					            
					          </tr>
					          
					         <tr>
					              
					              <td style="text-align: right;" width="150"><ww:property value="#session.local.b00344" />:</td><!-- 难受值 -->
					              <td>
					                  >&nbsp;<input type="text" style="width: 80px;" id="uncomVal"  value="<ww:property value='uncomVal' />" /> 
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
			
							   <tr style="height:50px;">
					            <td></td>
					            <td>
					               
					               <button class="btn btn-primary" onclick='many_submit()' type="button"><ww:property value='#session.local.a00080' /></button>
					               &nbsp;&nbsp; 
					               <button class="btn btn-primary" onclick='many_return()' type="button"><ww:property value='#session.local.a00014' /></button>
					               
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
