<%@page import="java.util.*"%>
<%@page import="com.vshow.control.data.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>
<body>

			<!--父级id-->
            <input type="hidden" name="zpid"  id="zpid" value="<ww:property value='zpid' />"/>

             
		          <!-- 固定标题 -->
           <div style="padding-right:17px;margin: 0px;">
             <table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
            <tr class="cell_element cell_first">
			<td style="width: 10%" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
			
			<td style="width:30%"><ww:property value='#session.local.a00212' /></td>
			<td style="width:20%"><ww:property value='#session.local.a00211' /></td>
			<td style="width:20%"><ww:property value='#session.local.a00215' /></td>
			<td style="width:10%"><ww:property value='#session.local.a00231' /></td>
			<td style="width:10%">&nbsp;&nbsp;<ww:property value='#session.local.a00016' /></td>
			
			   </tr>
			    </table>
           </div>
           <div style="height: 400px;overflow: auto;overflow-y:scroll;">
			<table border="0" cellpadding="0" cellspacing="0" style="margin-top:0px;margin-bottom: 0px;">
			
			<ww:iterator value="userssonlist">
			
				<tr onmousemove="tr_mousemove(this)" onmouseout="tr_mouseout(this)" class="cell_element">
				  
				  <td style="width: 10%" align="center">
					    <input type="checkbox"   id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
					    
				   </td>
				   
				  <td style="width:30%" title="<ww:property value='name'/>">
				     
				    <ww:if test="name.length()<10">
				       <ww:property value="name"/>
				    </ww:if>
				    <ww:else>
				       <ww:property value="name.substring(0,10)"/>...
				    </ww:else>
				      
				  </td>
				  <td style="width:20%" title="<ww:property value='account'/>">
				     <ww:if test="account.length()<10">
				       <ww:property value="account"/>
				    </ww:if>
				    <ww:else>
				       <ww:property value="account.substring(0,10)"/>...
				    </ww:else>
				    
				  
				  </td>
				  
				  
				  <td style="width:20%"><ww:property value="powername"/></td>
				  <td style="width:10%">
				    <ww:if test="ban==0">
				       <ww:property value='#session.local.a00233' />
				    </ww:if>
				    <ww:elseif test="ban==1">
				       <ww:property value='#session.local.a00232' />
				    </ww:elseif>
				  </td>
				  <td style="width:10%">   
				  	    <i title="<ww:property value='#session.local.a00017' />" style="padding: 4px 8px;cursor: pointer;float: left;"  class="icon icon-edit" onclick="open_user_up(<ww:property value='id' />)"  ></i>
				  	
				  	     
				  	    <ww:if test="#session.version_onoff.ramSizeShow==1">
				  		<!-- 设置用户素材资源存储空间 -->
				        <i title="<ww:property value='#session.local.a01029' />" style="padding: 4px 8px;cursor: pointer;float: left;"  class="icon icon-cogs" onclick="set_user_space(<ww:property value='id' />)"  ></i>
				        </ww:if> 
				  	
				  	
				  </td>
				</tr>
			
			</ww:iterator>
			
			</table>
		  </div>
		

</body>
</html>
