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


<script type="text/javascript">
  






</script>
</head>
<body>
 <form  name="form1" method="post" >
<div class="c_middle download_manager">
    

	
	<div>
	    <div class="c_right_header" >
		
			
			
		
		    
		</div>
        <!--显示内容-->
        <div style="height: 400px;width: 1050px;margin-top: -30px;" >
        
            <!-- 固定标题 -->
            <div style="padding-right:17px;margin-left: 30px;">
                <table style="text-align: center;margin: 0px;" border="0" cellpadding="0" cellspacing="0">
					<tr class="cell_element cell_first">
				        <td width="30%"><ww:property value='#session.local.a00038' /></td><!-- 终端名 -->
						<td width="20%"><ww:property value='#session.local.a00040' /></td><!-- 标识码  -->
						<td width="20%"><ww:property value='#session.local.a00039' /></td><!-- IP  -->
<!--						<td width="15%"><ww:property value='#session.local.a00042' /></td> 连接时间  -->
						<td width="15%"><ww:property value='#session.local.a00043' /></td><!-- 在线状态 -->
						 
					    
					</tr>
				 </table>	
           </div>
           <div style="height: 400px;margin-top:-5px;margin-left: 30px;">
                <table style="text-align: center;margin: 0px;" border="0" cellpadding="0" cellspacing="0">
			        <ww:iterator value="clients">
						<tr class="cell_element cell_show">
						  <td width="30%">
						     <span style="cursor: pointer;" onclick="open_client_info(<ww:property value='id' />)" id="sname<ww:property value='id' />" onmouseover="show_tips('sname<ww:property value='id' />','<ww:property value='name' />')"> <ww:property value='namesub' /></span>
						  </td>
						  <td width="20%">
						     <ww:property value="mark" />
						  </td>
						  <td width="20%">
						     <ww:property value="ip" />
						  </td>
<!--						  <td width="15%">-->
<!--						     <ww:property value="last" />-->
<!--						  </td>-->
						  <td width="15%">
						      <ww:if test="zxstate==0"><span  style="color: #FF0000"><ww:property value="#session.local.a00045" /></span></ww:if>
							  <ww:else><span style="color: #0033FF"><ww:property value="#session.local.a00044" /></span></ww:else>
						  </td>
						</tr>
					</ww:iterator>
					
			     </table>
           </div>
		   
		</div>
        <!--分页-->

	</div>
</div>
</form>
</body>
</html>
