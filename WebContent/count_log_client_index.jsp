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
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript">
var b00028="<ww:property value='#session.local.b00028'  />";  

function outlog() {
	//document.form1.target = "_blank";
	//document.form1.action = "outlog.vs";
	//document.form1.submit();
	var sel=document.getElementById("sel").value;
 	
    layer.open({
        
		type: 2,
		area: ['660px', '520px'],
        offset: '10px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: 'outlog.vs?sel='+sel,
        scrollbar: false,
        end: function(){ 
		    	
		}
    });

	
}


//导出终端日志
function daocllog(filename){
   var daourl="logdown.vs?filename="+filename;
   var obj = document.getElementById("openWin");   
   obj.href = daourl;   
   obj.click();   
}

//删除终端
function delclientlog(){
	
	
	document.form1.target = "_self";
	document.form1.action = "delclientlog.vs";
	document.form1.submit();

}
 
</script>
</head>
<body>
 <form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			       <ww:property value='#session.local.a00065' /> :
			        <span class="function"><ww:property value='#session.local.a00010' /></span>
			        <span class="function"><ww:property value='#session.local.a00114' /></span>
			        <span class="material_bg"><ww:property value='#session.local.b00222' /></span>
			</div>
		</div>
</div>

<div class="c_middle download_manager">
    
	<div class="c_left" >
	
		<div class="subNav_menu" onclick="open_log()"  name='0' >
		    <ww:property value="#session.local.a00429"/>
		</div><!-- 操作日志 -->
		<div class="subNav_menu" name='1' onclick="open_logsend()">
		    <ww:property value="#session.local.a00121"/>
		</div><!-- 发布日志 -->
		<div class="subNav_menu" onclick="open_logclient()"  name='2' style="color:#ffffff; background-color:#007ccd;">
		    <ww:property value="#session.local.b00222"/>
		</div><!-- 终端日志 -->
		<ww:if test="#session.version_onoff.pwdPloy==1">
			<div class="subNav_menu" onclick="open_log_user_login()"  name='2'>
			       <ww:property  value="#session.local.b00252"/>          
			</div><!-- 登陆退出记录 -->
		</ww:if>
		
	</div>
	   
	<div class="c_right">
	    <div class="c_right_header" >
		    <div class="row">
			     <div class="col-xs-1">
	                
				  </div>
				  <div class="col-xs-2">
				    
				  </div> 
				  <div class="col-xs-3" style="margin-left: -28px;" >
				     	
				  </div> 
				
							   	
				  <div class="btn-group" style="float: right;margin-right:10px;">
<%-- 				  	   <button onclick="open_logsend()"    type="button" class="btn btn-sm btn-primary" ><ww:property value='#session.local.a00121' /></button> --%>

                       <button onclick="open_logclient()"    type="button" class="btn btn-sm btn-primary" ><ww:property value='#session.local.a00422' /></button>
<%-- 				       <button onclick="outlog()"    type="button" class="btn btn-sm btn-primary" ><ww:property value='#session.local.a00115' /></button> --%>
<%-- 				       <button onclick="del_sel('delclientlog.vs')"        type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button> --%>
				   </div>		   		  
			 </div>
		
		</div>
        <!--显示内容-->
        <div style="height: 400px;width: 1050px;" >
			 <!-- 固定标题 -->
             <div style="padding-right:17px;margin: 0px;">
                 	<table border="0" cellpadding="0" cellspacing="0" style="margin: 0px;">
						<tr class="cell_element cell_first">
					    <td style="width:10%" >
					        &nbsp;&nbsp;&nbsp;<input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/>
                            <!-- <ww:property value='#session.local.a00034' />-->
					    </td>
						<td style="width:40%" ><ww:property value='#session.local.a00067' /></td>
						<td style="width:30%" ><ww:property value='#session.local.a00016' /></td>
						</tr>
					</table>	
             </div>
			 <div style="height: 400px;overflow: auto;overflow-y:scroll;">
				 <table border="0" cellpadding="0" cellspacing="0" style="margin: 0px;" >
				       <ww:iterator value="fileZips">
							<tr class="cell_element cell_show">
							  <td style="width:10%">
							    &nbsp;&nbsp; <input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property  />"/>
<!--							     <ww:property value="id" />-->
							  </td>
							  <td style="width:40%"  title="<ww:property />">
							         <ww:property /> 
							  </td>
							
							  <td style="width:30%">
							      
							       
							  	
							     <!-- 导出 -->
							  	
							  	    <a  title="<ww:property value='#session.local.a00658' />" href="logdown.vs?filename=<ww:property />"   target="_blank" style="display: block;height: 15px;text-decoration: none;"  >
							  	       <i class="icon icon-share-alt"></i>
							  	    </a>
							  	
							  	  
							  	  
							  	
							  </td>
							</tr>
						</ww:iterator>		
				  </table>
			  </div>
		</div>
        
	</div>
</div>
</form>
</body>
</html>
