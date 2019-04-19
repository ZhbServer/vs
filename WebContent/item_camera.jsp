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
function camera_submit()
{
	//获取设备ID
	var cdid=document.getElementById("cdid").value;
	if(cdid.length==0){
		layer.msg("<ww:property value='#session.local.a00688' /><ww:property value='#session.local.a00691' />");
	    return;
    }
	//获取用户名
	var cusername=document.getElementById("cusername").value;
	if(cusername.length==0){
		layer.msg("<ww:property value='#session.local.a00689' /><ww:property value='#session.local.a00691' />");
	    return;
    }
	//密码
	var cpwd=document.getElementById("cpwd").value;
	if(cpwd.length==0){
		layer.msg("<ww:property value='#session.local.a00047' /><ww:property value='#session.local.a00691' />");
	    return;
    }
	//厂商
    var  cfactory=document.getElementById("cfactory");
    var index=cfactory.selectedIndex ;             // selectedIndex代表的是你所选中项的index
    var cfactoryv=cfactory.options[index].value;

    		
	
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
	
	cdid=cdid.replace(/\*/g, "");
	cusername=cusername.replace(/\*/g, "");
	cpwd=cpwd.replace(/\*/g, "");
	cfactoryv=cfactoryv.replace(/\*/g, "");
	//X*Y*宽*高*设备ID*用户名*密码*厂商
    window.parent.returnValue=xy_x+"*"+xy_y+"*"+width+"*"+height+"*"+cdid+"*"+cusername+"*"+cpwd+"*"+cfactoryv; 
    window.parent.layer.close(index);
}

</script>
</head>
<body>
<form action="adtxtto.vs" method="post" name="form1">
    
     <div class="panel panel-primary" style="margin: 3px 3px;">
           <div class="panel-heading">
                <ww:property value="#session.local.a00692"/> <!-- 摄像 -->
           </div>
           
           
				   <div class="container clearfix" style="margin: 10px 10px;">
				       <div class="main-wrap">
						   <div class="result-wrap">
						        <div class="result-content">
				    
						        <table class="insert-tab" width="100%">
						           <tr>
						            <td style="text-align: right;" width="100"><i class="require-red">*</i><ww:property value="#session.local.a00688" />:</td>
						            <td>
						               <input type="text" style="height: 25px;" value="<ww:property value='cdid'/>"  name="cdid" id="cdid"/>
						            </td>
						          </tr>
						          <tr>
						            <td style="text-align: right;" width="100"><i class="require-red">*</i><ww:property value="#session.local.a00689" />:</td>
						            <td>
						               <input type="text" style="height: 25px;"  value="<ww:property value='cusername'/>"   name="cusername" id="cusername"/>
						            </td>
						          </tr>
						          <tr>
						            <td style="text-align: right;" width="100"><i class="require-red">*</i><ww:property value="#session.local.a00047" />:</td>
						            <td>
						               <input type="text"  style="height: 25px;" value="<ww:property value='cpwd'/>"   name="cpwd" id="cpwd"/>
						            </td>
						          </tr>
						           <tr>
						            <td style="text-align: right;"><i class="require-red">*</i><ww:property value="#session.local.a00690" />:</td>
						            <td>
						              <select name="cfactory" id="cfactory">
							               <option <ww:if test='cfactory==1'>selected="selected"</ww:if> value="1" ><ww:property value='#session.local.b00198' /></option>
						              </select>
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
						               
						                <button class="btn btn-primary" onclick='camera_submit()' type="button"><ww:property value='#session.local.a00080' /></button>
				                 
				                        <button class="btn btn-primary" onclick='close_win_nov()' type="button"><ww:property value='#session.local.a00014' /></button>
				                          
						            </td>
								   </tr>
								   
								     <tr >
							            <td></td>
							            <td>
							               <span style="color:#FFA534;font-size: 12px; ">
								                <ww:property value='#session.local.a00093' />:<br/>
						
												<ww:property value='#session.local.a00692' />:    <ww:property value='#session.local.b00199' />
												
											</span>
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
