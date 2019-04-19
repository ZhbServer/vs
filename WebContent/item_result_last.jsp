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
  

//刷新
function replace_result(){
	 window.location.href="reusltlast.vs";
}



//重发
function resend(){

	 var ids=document.getElementsByName('qx'); 
     var isSel=false; 
     for(var i=0;i<ids.length;i++) 
     { 
	      if(ids[i].checked==true) 
	      { 
	        isSel=true; 
	         break; 
	      } 
     } 
     if(isSel==false) 
     { 
    	  
    	  layer.msg("<ww:property value='#session.local.a00018'  />"); 
          return ; 
     }
	
	document.form1.action="resends.vs";
    document.form1.submit();  
}

//切换历史
function open_lasthis(){
	document.form1.target="_self";
	document.form1.action="reusltlasthistory.vs";
    document.form1.submit();  
}

//切换精准
function open_accurate(){
	document.form1.target="_self";
	document.form1.action="reusltLastAccurate.vs";
    document.form1.submit();  
	
}

//查看未下载文件
function open_see_down_fail(lid,mark){

   
	layer.open({
 		type: 2,
         area: ['1000px', '580px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'toResultDownFailList.vs?logid='+lid+"&mark="+mark,
         scrollbar: false,
         end: function(){ 	  
		      
 		 }
 	});   
	
}

 
</script>
</head>
<body>
<form  name="form1" method="post" >
<input type="hidden" value="<ww:property value='rlid'  />" name="rlid" />
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			      &nbsp;&nbsp; <ww:property value='#session.local.a00420' />
			</div>	
		</div>			
</div>

<div class="c_middle download_manager">
    <div>
	    <div class="c_right_header" >
			
			 <div class="row">
			               
			      <div class="btn-group" style="float:right;margin-right: 40px;">
			              
<!--			      <button onclick="open_lasthis()"   type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00763' /></button>-->
<!--			      <button onclick="open_accurate()"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.b00158' /></button>-->

                      <button onclick="download_list()"  type="button" class="btn btn-sm btn-primary">
                          <!-- 下载队列 -->
                          <ww:property value="#session.local.b00234"/>                                           
			              <ww:property  value="resultDownloadSizeState"/>
                      </button>

					  <button onclick="replace_result()"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00422' /></button>
					  <button onclick="resend()"   type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00695' /></button>
					  
			       </div>
			 </div> 
			
			
			
			
		</div>
        <!--显示内容-->
        <div style="overflow: auto;height: 400px;width: 1050px;margin-top: -20px;margin-left: 30px;" >
			<table border="0" cellpadding="0" cellspacing="0">
			<tr class="cell_element cell_first">
		    <td><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box" style="margin: 0 0 0 10px;"/>
		    
<!--		    <ww:property value='#session.local.a00034' />-->
		    
		    </td>
			<td><ww:property value='#session.local.a00038' /></td> <!-- 终端名 -->
			<td><ww:property value='#session.local.d00024' /></td>	 <!-- 终端编号 -->
			<td><ww:property value='#session.local.a00040' /></td> <!-- 标识码 -->
			<td><ww:property value='#session.local.a00043' /></td> <!-- 在线状态 -->
			<td><ww:property value='#session.local.a00424' /></td> <!-- 执行内容 -->
			<td><ww:property value='#session.local.a00016' /></td> <!-- 操作 -->
			<td><ww:property value='#session.local.a00423' /></td> <!-- 下载 -->
			<td></td>
			</tr>
			<ww:iterator value="clients" status="status">
				<tr class="cell_element">
				  <td>
				     <input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='rid' />"  style="margin: 0 0 0 10px;" />
                     <!--<ww:property value="id" />-->
				  </td>
				  <td title="<ww:property value='name' /> ">
				     <ww:property value="namesub" />
				  </td>
				  <td>
							     <span>
							     	<ww:iterator value="clientNumber" status="num" id="ber">
							     		
							     		<ww:if test="#status.index==#num.index"> 
							     			<span><ww:property/></span> 
							      			<ww:if test="value.length()>18"><ww:property  value="value.substring(0,17)"/>...</ww:if>
			   				       	    	<ww:else></ww:else> 
			   				       	   </ww:if> 
							     	</ww:iterator>
							     </span>
	
				  </td>
				  <td>
				     <ww:property value="mark" />
				  </td>
				  <td>
				      <ww:if test="zxstate==0"><span  style="color: #FF0000"><ww:property value="#session.local.a00045" /></span></ww:if>
					  <ww:else><span style="color: #0033FF"><ww:property value="#session.local.a00044" /></span></ww:else>
				  </td>
				  <td title="<ww:property value='lcontent' /> ">
					   <ww:property value="lcontentsub" /> 
				  </td>
				  <td>
				  
					   <ww:if test="rstate==0"><ww:property value='#session.local.a00425' /></ww:if>
					   <ww:elseif test="rstate==1"><ww:property value='#session.local.a00426' /></ww:elseif>
					   <ww:elseif test="rstate==2"><ww:property value='#session.local.a00427' /></ww:elseif>
					   <ww:elseif test="rstate==10"><ww:property value='#session.local.b00124' /></ww:elseif>
					   <ww:elseif test="rstate==20"><ww:property value='#session.local.a00681' /></ww:elseif>
					   <ww:elseif test="rstate==21"><ww:property value='#session.local.a00682' /></ww:elseif>
					   <ww:elseif test="rstate==22"><ww:property value='#session.local.a00683' /></ww:elseif>
					   <ww:elseif test="rstate==23"><ww:property value='#session.local.a00684' /></ww:elseif>
					   <ww:elseif test="rstate==24"><ww:property value='#session.local.a00685' /></ww:elseif>
					   <ww:elseif test="rstate==25"><ww:property value='#session.local.a00686' /></ww:elseif>
					   <ww:elseif test="rstate==26"><ww:property value='#session.local.a00687' /></ww:elseif>
					   <ww:elseif test="rstate==27"><ww:property value='#session.local.b00123' /></ww:elseif>
					   <ww:elseif test="rstate==28"><ww:property value='#session.local.b00126' /></ww:elseif>
					   
					   
					   <ww:if test="#session.version_onoff.letvDownFailShow==1">
					 
					       <i title="<ww:property value='#session.local.a00423' /><ww:property value='#session.local.a00752' />" style="padding: 4px 8px;cursor: pointer;"  class="icon icon-list-alt" onclick="open_see_down_fail(<ww:property value='lid' />,'<ww:property value='mark' />')"   ></i>
					   
				      </ww:if>
					   
					  
					   
				  </td>
				  <td>
				  
					  <ww:if test="downstate==0.0"><ww:property value='#session.local.a00428' /></ww:if>
					  <ww:elseif test="downstate==100"><ww:property value='#session.local.d00025'/></ww:elseif>
					  <ww:else> <ww:property value="downstate" />%</ww:else>
				  
				  </td>
				  
				  
				 
				</tr>
			</ww:iterator>
			</table>
		</div>
    </div>
</div>
</form>
</body>
</html>
