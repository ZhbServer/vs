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
  


function replace_result(){
	 window.location.href="reusltlast.vs";
}



function clear_download(){
	
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
	
	document.form1.action="clearDownload.vs";
    document.form1.submit();  
    
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
			              
<!--			      <button onclick="open_lasthis()"       type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00763' /></button>-->
<!--			      <button onclick="open_accurate()"       type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.b00158' /></button>-->

                      <button onclick="download_list()"  type="button" class="btn btn-sm btn-primary">
                          <!-- 下载队列 -->
                          <ww:property value="#session.local.b00234"/>                                           
			              <ww:property  value="resultDownloadSizeState"/>
                      </button>
                      <button onclick="clear_download()"  type="button" class="btn btn-sm btn-primary">
                          <!--清理队列 -->
                          <ww:property value="#session.local.b00235"/>
                      </button>
					  <button onclick="replace_result()"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00014' /></button>
					  
					  
					  
			       </div>
			 </div> 
			
			
			
			
		</div>
        <!--显示内容-->
        <div style="overflow: auto;height: 400px;width: 1050px;margin-top: -20px;margin-left: 30px;" >
			<table border="0" cellpadding="0" cellspacing="0">
			<tr class="cell_element cell_first">
		    <td width="20%" ><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box" style="margin: 0 0 0 10px;"/>		    
		    </td>
			<td width="40%"><ww:property value='#session.local.a00038' /></td> <!-- 终端名 -->
			
			<td width="40%"> <ww:property value='#session.local.a00016' /></td> <!-- 操作 -->
			
			<td></td>
			</tr>
			<ww:iterator value="downloadList">
				<tr class="cell_element">
				  <td>
				     <input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='downloadKey' />"  style="margin: 0 0 0 10px;" />
                     <!--<ww:property value="id" />-->
				  </td>
				  <td title="<ww:property value='name' /> ">
				     <ww:property value="name" />
				  </td>
				  
				
				  <td title="<ww:property value='lcontent' />">
					   <ww:property value="lcontent" /> 
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
