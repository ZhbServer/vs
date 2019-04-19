<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base target="_self" />
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />

<style>
body,html{
margin:0px;
padding:0px;
border:0px;
}
/*background-color:#134AFF;*/
/*overflow:hidden*/
a{color: color:#343F51;}

</style>
</head>
<body>
	   <div class="c_right_header" >
			    <div class="row">
				     <div class="col-xs-1">
				    
			            <select  id="sel" name="sel"  class="form-control input-sm" style="width: 90px;" >
			               <option  <ww:if test="sel==0"> selected="selected" </ww:if>   value="0"><ww:property value='#session.local.a00066' /></option>
						   <option  <ww:if test="sel==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.a00255' /></option>					 
					    </select>  
		             
				  </div>
				  <div class="col-xs-2" style="margin-left: 25px;">
				      <input  name="ser" id="ser" class="form-control input-sm" type="text" style="width: 130px;" value="<ww:property value='ser' />"/>
				  </div> 
				  <div class="col-xs-3" style="margin-left: -28px;width:50px;" >
				     	<button  onclick="selsc('toiteminteractlist.vs')" class="btn btn-sm btn-primary" type="button" style="padding: 4px 8px;"><i class="icon icon-search"></i></button>
				  </div> 
				
				  <div class="btn-group" style="float: right;margin-right: 30px;">
				   	  <!--<button onclick="add_interact_item_share('addinteractitemshare.vs')"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00816' /></button>--><!-- 设置共享 -->
					 
					  <button onclick="open_result_last()"  type="button" class="btn btn-sm btn-primary"  ><ww:property value='#session.local.a00420' /></button><!-- 执行结果 -->
					
			       	   <ww:if test="isSelf != 0">
						  <button onclick="daoItem()"      type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00658' /></button><!-- 导出 -->
						  <button onclick="daoItemInteractIn()"      type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00659' /></button><!-- 导入-->
				          <button onclick="del_interact_item('delinteractitem.vs')"  type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button><!-- 删除 -->			      
			       	   </ww:if>
			       	  
			       	  
			       </div>	
			       
			       <div style="float: right;margin-right: 5px;">
			          <button onclick="open_send_to_client()"  type="button" class="btn btn-sm btn-success"><ww:property value='#session.local.a00394' /></button><!-- 发布节目 -->
			         
			         
			          <ww:if test="isSelf != 0">
				      	 
					   	   <ww:if test="#session.version_onoff.addItemButton==1">
					      	 <button onclick="openAddNewInteractItem()"  type="button" class="btn btn-sm btn-success" id="step1"><ww:property value='#session.local.a00021' /></button><!-- 新增2 -->
					   	  </ww:if>
					   	  <ww:else>
					   	     <button onclick="openaddinteractitem()"  type="button" class="btn btn-sm btn-success" id="step1"><ww:property value='#session.local.a00021' /></button><!-- 新增 -->
					   	  </ww:else>
				   	  
				   	  </ww:if>
				   	  
			       </div>
			 	</div>
			</div>
	        <!--显示内容-->
	         <div style="height: 400px;" >
	           <!-- 固定标题 -->
	           <div style="padding-right:17px;margin:0px;">
	            
	               <table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
						<tr class="cell_element cell_first">
						<td width="10%" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
						<td width="20%"><ww:property value='#session.local.a00255' /></td>
						<td width="10%"><ww:property value='#session.local.a00258' /></td>
						<td width="20%"><ww:property value='#session.local.a00776' /></td>
						<!-- <td width="20%"><ww:property value='#session.local.a00248' /></td> -->
						<td width="10%"><ww:property value='#session.local.a00247' /></td>
						<td width="10%"><ww:property value='#session.local.a00217' /></td>
						<td width="10%"><ww:property value='#session.local.a00016' /></td>
						</tr>
					</table>
	            </div>
	            
	             <div style="height: 400px;overflow: auto;overflow-y:scroll;">
	               <table border="0" cellpadding="0" cellspacing="0" style="margin-top:0px;margin-bottom: 0px;">
		                <ww:iterator value="items">
						<tr class="cell_element cell_show">
						  <td width="10%" align="center">
						  	<input    isgx="<ww:property value='isgx' />"  oncheckvalue="<ww:property value='ocheck' />" type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
						  </td>
						  <td width="20%" style="line-height: 25px;" >
						      <a  style="width: 100%;display: block;overflow: auto;color: #343F51;" target="_blank"  href="files/<ww:property value='filename'/>/see.html">
						         <span <ww:if test="itemState==2"> style="color: #FFA534 " </ww:if> >
						            <ww:property value="name"/>
						          </span>  
						      
						      </a>
						      
						  </td>
						  <td width="10%" style="line-height: 35px;" >
						      <span <ww:if test="itemState==2"> style="color: #FFA534 " </ww:if> >
						         <ww:property value="size"/>M
						      </span>
						   </td>
						  <td width="20%" style="line-height: 35px;" >
						      <span <ww:if test="itemState==2"> style="color: #FFA534 " </ww:if> >
						           <ww:property value="allsize"/>M
						      </span>
						      
						  </td>
						  <!-- <td width="20%"><ww:property value="sdate"/></td> -->
						  <td width="10%" style="line-height: 35px;">
						     <span <ww:if test="itemState==2"> style="color: #FFA534 " </ww:if> >
						       <ww:property value="user"/>
						      </span> 
						   </td>
						  <td width="10%" style="line-height: 35px;">
						      <span <ww:if test="itemState==2"> style="color: #FFA534 " </ww:if> >
								     <ww:if test="ocheck==0">
								           <ww:property  value="#session.local.a00257" /> 
								     </ww:if>
								     <ww:elseif test="ocheck==1">
								          <ww:property  value="#session.local.a00256" />
								     </ww:elseif>
								     <ww:else>
								          <ww:property  value="#session.local.a00592" />
								     </ww:else>
							    </span>
							</td>
						   <td style="width:10%;line-height: 35px;<ww:if test='itemState==2'> color: #FFA534; </ww:if>"   >
						  	   
						  	    <span title="<ww:property value='#session.local.a00752' />" onclick="item_info(<ww:property value='id'/>)" style="cursor: pointer;margin-right: 5px;">
						  	        <i class="icon icon-list-alt"></i>
						  	    </span>
						  	    
						  	    <span title="<ww:property value='#session.local.a00017' />" onclick="edit_item(<ww:property value='userid'/>,<ww:property value='id'/>)" style="cursor: pointer;margin-right: 5px;">
						  	          <i class="icon icon-edit"></i>  
						  	    </span>
						  	    
						  	    <!--  复制  -->
	                            <span title="<ww:property value='#session.local.a00022' />" onclick="copy_interact_item(<ww:property value='userid'/>,<ww:property value='id'/>)" style="cursor: pointer;margin-right: 5px;">
	                                <i class="icon icon-copy"></i>
	                            </span>
	                             
							  	<ww:if test="isgx == 0">
							  	  	<span title="<ww:property value='#session.local.a00816' />" onclick="add_interact_item_share('addinteractitemshare.vs',<ww:property value='id'/>)"" style="cursor: pointer;margin-right: 5px;">
							  	  	       <i class="icon icon-share"></i>
							  	  	</span>						      	     
							  	</ww:if>	
						  </td>
						</tr>
					    </ww:iterator>
				    </table>
	            </div>
			</div>
	       <div style="text-align: right;font-size: 12px; color: #FFA534;margin-top: 10px;">
			  <span> <ww:property value='#session.local.b00181' /> &nbsp;<ww:property value='#session.local.b00182' /> <i class="icon icon-list-alt"></i> <ww:property value='#session.local.b00183' />&nbsp;  <ww:property value='#session.local.b00184' /></span>
			  <!-- 节目名为黄色表示节目非原制作人修改  -->
			</div>
	        <!--分页-->
			<div class="nav_item">
				<ul class="pg">
	                <!-- 上一页-->
					<li><a href="javascript:pageto_item(<ww:property value='qian' />,'toiteminteractlistajax.vs');" class="pg_f"></a></li>
		            <!--页码显示上-->
					<ww:iterator id="q"  value="ps.qs">
		                  <li><a href="javascript:pageto_item(<ww:property value='#q'/>,'toiteminteractlistajax.vs');" ><ww:property value="#q"  /></a> </li>
		            </ww:iterator>
		            
		            <!--当前页码-->
		            <li><a href="javascript:pageto_item(<ww:property value='#request.id'  />,'toiteminteractlistajax.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
		            
		             <!--页码显示下-->
		            <ww:iterator id="h"  value="ps.hs">
		                  <li><a href="javascript:pageto_item(<ww:property value='#h'/>,'toiteminteractlistajax.vs')"><ww:property value="#h"  /></a></li>
		            </ww:iterator>
		            
	                <!--下一页-->
		            <li><a href="javascript:pageto_item(<ww:property value='hou' />,'toiteminteractlistajax.vs');" class="pg_e"></a></li>
				</ul>
			    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('toiteminteractlistajax.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
			    
				<div class="pg_count">
				     
				     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
				     <a href="javascript:setpagetype_item(10,'toiteminteractlistajax.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
				     <a href="javascript:setpagetype_item(20,'toiteminteractlistajax.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
				     <a href="javascript:setpagetype_item(30,'toiteminteractlistajax.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
				     <a href="javascript:setpagetype_item(-1,'toiteminteractlistajax.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
				</div>
				
				<!--隐藏域 -->
	            
	            <!--当前页码-->
				<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
	            <!--总页码-->
	            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
	            <!--每页显示页数-->
	            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
	            <!--分组-->
	            <input type="hidden" name="igr.itemgroupid"  id="gpid" value="<ww:property value='igr.itemgroupid'/>"/>
	            <!--树id-->
				<input type="hidden" name="treeid"  id="treeid" value=""/>
        	</div>
</body>
</html>
