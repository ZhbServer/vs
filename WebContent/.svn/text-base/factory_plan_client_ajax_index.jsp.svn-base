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

<style>
a{text-decoration:none;}
</style>

</head>
<body>
	<div style="height: 400px;">
	
		<!-- 固定标题 -->
		<div style="padding-right:17px;margin: 0px;">
				<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
	                <tr class="cell_element cell_first">
						<td style="width: 10%;" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
						<td style="width: 30%;" ><ww:property value='#session.local.a00563' /></td>
						<td style="width: 60%;"><ww:property value='#session.local.a00330' /><ww:property value='#session.local.a01043' /></td>
					</tr>
			    </table>	
        </div>
		<div id="step1" style="height: 400px;overflow: auto;overflow-y:scroll;">
				<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
					<ww:iterator value="clients">
						<tr onmousemove="tr_mousemove(this)" onmouseout="tr_mouseout(this)" class="cell_element cell_show">
						    <td style="width: 10%;" align="center">
								<input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
							</td>
							<td style="width: 30%;" title="<ww:property value='name' />">
								<ww:property value="namesub" />
							</td>
							<td id="ys<ww:property value='id' />" style="width: 60%;cursor:pointer;" onclick="tochoiceitem('<ww:property value='id' />')"><img src='images/add.png' /></td>
						</tr>
					</ww:iterator>
				</table>
			</div>
	</div>
	 <!--分页-->
	<div class="nav">
		<ul class="pg">
	        <!-- 上一页-->
			<li><a href="javascript:pageto_client1(<ww:property value='qian' />,'ajaxtochioceclient.vs');" class="pg_f"></a></li>
			<!--页码显示上-->
			<ww:iterator id="q"  value="ps.qs">
			<li><a href="javascript:pageto_client1(<ww:property value='#q'/>,'ajaxtochioceclient.vs');" ><ww:property value="#q"  /></a> </li>
			</ww:iterator>
			
			<!--当前页码-->
			<li><a href="javascript:pageto_client1(<ww:property value='#request.id'  />,'ajaxtochioceclient.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
			
			<!--页码显示下-->
			<ww:iterator id="h"  value="ps.hs">
			<li><a href="javascript:pageto_client1(<ww:property value='#h'/>,'ajaxtochioceclient.vs')"><ww:property value="#h"  /></a></li>
			</ww:iterator>
			
			<!--下一页-->
			<li><a href="javascript:pageto_client1(<ww:property value='hou' />,'ajaxtochioceclient.vs');" class="pg_e"></a></li>
		</ul>
		   
		<div class="pg_count">
		    <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			<a href="javascript:setpagetype_client1(10,'ajaxtochioceclient.vs');" <ww:if test='pagetype==10'>style="background-color:#FFA534;"</ww:if> >10</a>
			<a href="javascript:setpagetype_client1(20,'ajaxtochioceclient.vs');" <ww:if test='pagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			<a href="javascript:setpagetype_client1(30,'ajaxtochioceclient.vs');" <ww:if test='pagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			<a href="javascript:setpagetype_client1(<ww:property value='total'/>,'ajaxtochioceclient.vs');" <ww:if test='pagetype==total'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
		</div>
		<!--隐藏域 -->
		
		<!--当前页码-->
		<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
		<!--总页码-->
		<input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
		<!--每页显示页数-->
		<input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='pagetype'/>" />
		<!--分组id-->
		<input type="hidden" name="cgid"  id="cgid" value="<ww:property value='cgid'/>"/>
		<!--分组-->
		<input type="hidden" name="type"  id="type" value="<ww:property value='type'/>"/>
		<!-- 分页数据 -->
        <input type="hidden" name="zdata"  id="zdata" value="<ww:property value='zdata'/>"/>
	</div>       

</body>

</html>
