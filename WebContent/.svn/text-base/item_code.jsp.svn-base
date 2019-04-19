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
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/fresh.js" language="javascript"></script>
<base target="_self" />
<style type="text/css">
A{text-transform:none; text-decoration:none;}   
</style>
<script>

function code_submit(){
	

	var codeurl=document.getElementById("codeurl").value;
	if(codeurl==""){
       layer.msg("<ww:property value='#session.local.a00664' />");
       return;
    }
	var str=document.getElementsByName("codep");
	var codep=0;
	
	if(str[0].checked == true)
    {
	   codep=str[0].value;
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
		return;
	}
	if(height<=0)
	{
		  layer.msg("<ww:property value='#session.local.a00286' />");
		  return;
	}
	
	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	  
	window.parent.returnValue=""; 
    window.parent.returnValue=xy_x+"*"+xy_y+"*"+width+"*"+height+"*"+codeurl+"*"+codep; 
    window.parent.layer.close(index);
}
</script>
</head>
<body>
<form  method="post" name="form1"  >
    
   <div class="container clearfix" style="margin: 50px 50px;">
       <div class="main-wrap">
		   <div class="result-wrap">
		        <div class="result-content">
    
		        <table class="insert-tab" width="100%">
		           <tr>
		            <td style="text-align: right;" width="100">
		               <ww:property value="#session.local.a00662" />:
		            </td>
		            <td>
		               <input type="text" value="<ww:property value='codeurl' />"   id="codeurl" style="width: 210px;" />
		            </td>
		          </tr>
				   <tr>
		            <td style="text-align: right;">
		               <ww:property value="#session.local.a00663" />: 
		            :</td>
		            <td> 
		              <input type="checkbox"  value="1"    <ww:if test="codep==1||codep==null">checked="checked"</ww:if> name="codep" id="codep" />
		              
		            </td>
		          </tr>
		          
		        <tr>
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
		               <input onclick="code_submit()"  type="button" value="<ww:property value='#session.local.a00080' />" style=" width:80px ;color: #495764;font-family:Microsoft YaHei;"   class="button1" />
		            </td>
				   </tr>
		        </table>
             </div>
		  </div>
		</div>
    </div>	    
</form>

</body>
</html>
