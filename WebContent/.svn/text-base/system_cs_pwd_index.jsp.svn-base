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
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript">

function initInfo(){
	
	if("<ww:property value='editSuccess' />"==1){

           layer.msg("<ww:property value='#session.local.a00499' />");
	}
}

function upEditPwdDay(){

	  var editPwdDay=document.getElementById("editPwdDay").value;

	  if(editPwdDay.length==0){
		  layer.alert("<ww:property value ='#session.local.a00671' />");
		  return;
	  }
       
	  if(!isNaN(editPwdDay)){
	  }else{
		layer.alert("<ww:property value ='#session.local.a00671' />");
		return;
	  }

	  
      document.form1.action="upTimeUpdatePwd.vs";	
      document.form1.submit();	

}
//切换参数
function change_syspar(aurl){
	document.form1.action=aurl;
	document.form1.target = "_self";
    document.form1.submit();
 }
</script>
</head>
<body onload="initInfo()">
 <form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container" >
			<div class="loc">
			        <ww:property value='#session.local.a00065' />:
			        <span class="function"><ww:property value='#session.local.a00010' /></span>
			        <span class="material_bg"><ww:property value='#session.local.b00244' /></span>
			</div>
		</div>
</div>

<div class="c_middle download_manager">
    

    <div class="c_left" >
	
		<div class="subNav_menu" onclick="change_syspar('tosyscsfbl.vs')"  name='0' >
		    <ww:property value="#session.local.a00176"/>
		</div><!-- 分辨率 -->
		<div class="subNav_menu" name='1' onclick="change_syspar('tosyscstq.vs')">
		    <ww:property value="#session.local.a00177"/>
		</div><!-- 天气 -->
<!--		<div class="subNav_menu" onclick="change_syspar('tosyscsscreen.vs')"  name='2'>-->
<!--		    <ww:property value="#session.local.a00178"/>-->
<!--		</div> 截屏 -->
<!--		<div class="subNav_menu" onclick="change_syspar('tosyscsrss.vs')"  name='2'>-->
<!--		    <ww:property value="#session.local.a00179"/>-->
<!--		</div> RSS -->
		
		<div class="subNav_menu" onclick="change_syspar('tosyscsapk.vs')"  name='2'>
		    APK
		</div><!-- APK -->
		
		
		<ww:if test="#session.version_onoff.dataSourceShow==1">
		    <div class="subNav_menu" onclick="change_syspar('tosyscssjjk.vs')"  name='2'>
			    <ww:property value='#session.local.a00996' />
			</div><!-- 数据接口 -->
		</ww:if>
		
		
		<ww:if test="#session.version_onoff.pwdPloy==1">
		    <div class="subNav_menu" onclick="change_syspar('tosyscssjjk.vs')"  name='2' style="color:#ffffff; background-color:#007ccd;">
			    <ww:property value='#session.local.b00244' />
			</div><!-- 密码策略 -->
		</ww:if>
		
	</div>
	
	
	<div class="c_right">
	    <div class="c_right_header" style="">
		
			 <div class="row">
			      <div class="btn-group" style="float: right;margin-right: 10px;">
			      	
					  
					  
				   </div>	
			 </div>
			 
			 
		</div>
        <!--显示内容-->
    
        <div style="height: 400px;" >
			
		    <div class="container clearfix" style="margin: 50px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		              
		                    <table class="insert-tab"  style="width: 90%;">
		                        <tbody>
		                         <tr>
		                            <th style="width: 40%"><ww:property value="#session.local.b00250"/>：</th>
		                            <td>
		                                <ww:property  value="editPwdDay"/>
		                                <ww:property value="#session.local.a00300"/>                                                       
		                            </td>
		                          </tr>
		                          
		                          <tr >
		                            <th ><i class="require-red">*</i><ww:property value='#session.local.b00245' />：</th>
		                            <td>
		                                   <input  class="common-text required" style="height: 20px;line-height: 20px;width: 80px;"    name="editPwdDay" id="editPwdDay"  />
		                                   &nbsp;&nbsp;
		                                   <ww:property value="#session.local.a00300"/>  
		                                   (<ww:property value="#session.local.b00249"/>)
		                            </td>
		                          </tr>
		                          <tr style="height: 40px;">
		                                <th></th>
		                                <td>
		                                    
		                                    <button class="btn btn-primary" onclick='upEditPwdDay()' type="button"><ww:property value='#session.local.a00080' /></button>
		                                    <!-- <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">-->
		                                </td>
		                          </tr>
		                        </tbody>
		                      </table>
		              
		            </div>
		        </div>
		     </div>
  
           </div> 
          
		</div>
     
	</div>
</div>
</form>
</body>
</html>
