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
<link rel="stylesheet"  href="../css/index.css"  type="text/css" />
<link rel="stylesheet"  href="../css/reset.css"  type="text/css" />
<script type="text/javascript" src="../js/jq/jquery.js"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>
<script type="text/javascript" src="../js/two_menu.js"></script>
<script type="text/javascript" src="../js/fresh.js"></script>
<script type="text/javascript" src="../js/constant.js"></script>
<script type="text/javascript" src="../js/<ww:property value='#session.local.a00000' />/common.js"></script>
<script type="text/javascript" src="../js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="../js/jay.js"></script>
<script type="text/javascript" src="../js/cookie.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="../zui-1.5.0-dist/dist/css/zui.min.css" />

<style>
a{text-decoration:none;}
</style>
</head>
<body>
            <div style="height: 400px;"  >
			<iframe style="display:none" onload="javascript:test()"></iframe>
            <!-- 固定标题 -->
                    <div style="padding-right:17px;margin: 0px;">
                         <table border="0" cellpadding="0" cellspacing="0">
					         <tr class="cell_element cell_first">
					         <td width="10%" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
					            <td width="10%"><ww:property value='#session.local.a00133' /></td>
					            <td width="10%" ><ww:property value='#session.local.d00024' /></td>
								<td width="15%" ><ww:property value='#session.local.a00041' /></td>
								<td width="15%" ><ww:property value='#session.local.a00040' /></td>
								<td width="10%"><ww:property value='#session.local.a00043' /></td><!-- 在线状态 -->
								<td width="10%"><ww:property value='#session.local.a00762' /></td>
								<td width="10%"><ww:property value='#session.local.a00765' /></td>
								<td width="10%" >&nbsp;&nbsp;<ww:property value='#session.local.a00016' /></td>
					         </tr>
					      </table>    
                    </div> 
                    <div style="height: 400px;overflow: auto;overflow-y:scroll;">
						<table border="0" cellpadding="0" cellspacing="0">
						
							<ww:iterator value="clients" status="status">
							    <tr onmousemove="tr_mousemove(this)" onmouseout="tr_mouseout(this)" class="cell_element">
								  <td width="10%" align="center">
			                         <input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
								  </td>
								  <td style="width:10%"  title="<ww:property value='name' /> ">
								      <ww:if test="name.length()>26"><ww:property  value="name.substring(0,25)"/>...</ww:if>
			   				          <ww:else><ww:property value='name' /></ww:else>
								  </td>
								  	   <td style="width:10%">
							     <span style="float: left;">
							     	<ww:iterator value="clientNumber" status="num" id="ber">
							     		
							     		<ww:if test="#status.index==#num.index"> 
							     			<span><ww:property/></span> 
							      			<ww:if test="value.length()>18"><ww:property  value="value.substring(0,17)"/>...</ww:if>
			   				       	    	<ww:else></ww:else> 
			   				       	   </ww:if> 
							     	</ww:iterator>
							     </span>
							  </td>
								  <td width="15%" ><ww:property value="ip"/></td>
								  <td width="15%" ><ww:property value="mark"/></td>
								  <td width="10%">
								       <ww:if test="standbystate==2">
								        <span style="color: red;">
								                 (<ww:property value="#session.local.a00522"/>)
								         </span>
								   </ww:if>
								   <ww:else>
									       <ww:if test="zxstate==0"><span  style="color: #FF0000"><ww:property value="#session.local.a00045" /></span></ww:if>
										   <ww:else><span style="color: #0033FF"><ww:property value="#session.local.a00044" /></span></ww:else>
										  
	<!--									  <ww:if test="disabledstate==1">-->
	<!--									  (<ww:property value="#session.local.a00231"/> ) -->
	<!--									  </ww:if>-->
	                                       <ww:if test="standbystate==0">
							               </ww:if>
							               <ww:elseif test="standbystate==1">
								               <span style="color: red;">
								                 (<ww:property value="#session.local.a00488"/>)
								               </span>
									       </ww:elseif>
								   
								   </ww:else> 	 
									  
							      </td>
							      <td width="10%" title="<ww:property value='userBelongsSub' />">
		                               <ww:property value="userBelongs"/>
	                              </td>
	                              <td width="10%">
		                               <ww:if test="disabledstate==0">
		                                     <ww:property value="#session.local.a00233"/>
		                               </ww:if>
		                               <ww:else>
		                                     <span style="color: red;"><ww:property value="#session.local.a00232"/></span>
		                               </ww:else>
		                          </td>
								  <td width="10%" >
								  
								      <!-- 查看详情 -->
								      <i title="<ww:property value='#session.local.a00752' />" style="padding: 4px 5px;cursor: pointer;float: left;"  class="icon icon-eye-open" onclick="open_client_eye_info(<ww:property value='id' />)"  ></i>
								      
								      <ww:if test="#session.version_onoff.bindClientShow==1">
									      <!-- 绑定 -->
									      <i title="<ww:property value='#session.local.a00712' />" style="padding: 4px 5px;cursor: pointer;float: left;"  class="icon icon-sitemap" onclick="open_client_bind(<ww:property value='id' />)"  ></i>
								      </ww:if>
								      
								      <!-- 修改 -->
								      <i title="<ww:property value='#session.local.a00017' />" style="padding: 4px 5px;cursor: pointer;float: left;display: none;"  class="icon icon-edit" onclick="open_client_up_name(<ww:property value='id' />)"  ></i>
								  </td>
							   </tr>
							</ww:iterator>
						
						</table>
					</div>
				</div>
     
		 <!--分页-->
		<div class="nav">
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto_client(<ww:property value='qian' />,'ajaxclientcg1.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto_client(<ww:property value='#q'/>,'ajaxclientcg1.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto_client(<ww:property value='#request.id'  />,'ajaxclientcg1.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto_client(<ww:property value='#h'/>,'ajaxclientcg1.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto_client(<ww:property value='hou' />,'ajaxclientcg1.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo_client('ajaxclientcg.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype_client(10,'ajaxclientcg1.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if> >10</a>
			     <a href="javascript:setpagetype_client(20,'ajaxclientcg1.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype_client(30,'ajaxclientcg1.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype_client(-1,'ajaxclientcg1.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			</div>
			
			<!--隐藏域 -->
            
            <!--当前页码-->
			<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
            <!--总页码-->
            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
            <!--每页显示页数-->
            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
           
            <!--分组id-->
            <input type="hidden" name="cgid"  id="cgid" value="<ww:property value='cgid'/>"/>
            <!--分组-->
            <input type="hidden" name="type"  id="type" value="<ww:property value='type'/>"/>
            <!--父级id-->
            <input type="hidden" name="zpid"  id="zpid" value="<ww:property value='zpid'/>"/>
            <!--树id-->
			<input type="hidden" name="treeid"  id="treeid" value=""/>
			<!--树级别-->
			<input type="hidden" name="levelid"  id="levelid" value=""/>
		</div>

</body>
</html>
