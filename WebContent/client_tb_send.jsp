<%@page import="com.vshow.control.tool.Constant"%>
<%@page import="com.vshow.control.data.ClientGroup"%>
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
<link rel="stylesheet"  href="css/index.css"  type="text/css" />
<link rel="stylesheet"  href="css/reset.css"  type="text/css" />
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="js/jay.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript" src="zTree/3.5/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="zTree/3.5/jquery.ztree.excheck-3.5.js"></script>
<link rel="stylesheet" href="zTree/3.5/zTreeStyle.css" />
<style>
a{text-decoration:none;}
</style>
<script type="text/javascript">


  /*计划发布*/
  function jh_send(){
	 
	    //选择终端
	    var ids=document.getElementsByName('qx'); 
		var clientids="";
		for(var i=0;i<ids.length;i++) 
	    { 
	      if(ids[i].checked==true) 
	      { 
	         if(clientids.length==0){
	        	 clientids=ids[i].value;
	         }else{
	        	 clientids=clientids+"_"+ids[i].value;
	         } 
	      } 
	    } 
	    if(clientids.length==0) 
	    { 
	    	  layer.msg("<ww:property value='#session.local.a00409' />"); 
	          return ; 
	    }


      document.getElementById("clientids").value=clientids;

	  document.form1.action="tbsend.vs";
	  document.form1.submit();  
	  
	  
  } 	 
</script>
</head>
<body>
 <form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			        &nbsp;&nbsp;<ww:property value='#session.local.a00065' /> :
			        <span class="function"><ww:property value='#session.local.b00212' /></span>
			        <span class="material_bg"><ww:property value='#session.local.a00414' /></span>
			</div>
		</div>
</div>

<div class="c_middle" style="width: 1090px;">
	<div class="c_left">
	  	<div align="left" >
	  		<ul id="leftTree" class="ztree"></ul>
		</div>
		<!-- mask -->
		<em class="mtbox mxt2"></em>
		<em class="mtbox mxb2"></em>
	</div>
   
	<div class="c_right"  style="height: 550px;">
	 	<div class="c_right_header" >
	 	
	 	   
			 
			  <div class="row">
			     <div class="col-xs-1">
	                    <select  id="sel" name="sel"  class="form-control input-sm" style="width: 90px;" >
			             <!-- 搜索条件 -->
			             <option  <ww:if test="sel==0"> selected="selected" </ww:if>   value="0"><ww:property value='#session.local.a00031' /></option>
			             <!-- 终端名 -->
			             <option  <ww:if test="sel==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.a00038' /></option>
						 <!-- 终端IP-->
						 <option  <ww:if test="sel==2"> selected="selected" </ww:if>   value="2"><ww:property value='#session.local.a00039' /></option>
						 <!-- 标识码 -->
						 <option  <ww:if test="sel==3"> selected="selected" </ww:if>   value="3"><ww:property value='#session.local.a00040' /></option>
					    </select>  
				  </div>
				  <div class="col-xs-2" style="margin-left: 25px;">
				     <input  name="ser"  id="ser"  value="<ww:property value='ser' />" class="form-control input-sm" type="text" placeholder="" style="width: 110px;" />
				  </div> 
				  <div class="col-xs-3" style="margin-left: -28px;" >
				     	<button  onclick="select_ser_client('ajaxclientitem.vs')" class="btn btn-sm btn-primary" type="button" style="padding: 4px 8px;"><i class="icon icon-search"></i></button>
				  </div>
				  
				 
				  <div class="btn-group" style="float: right;margin-right: 30px;">
				          <select id="orderv" name="orderv"  class="form-control input-sm" style="width: 90px;"   onchange="select_orderby_client('ajaxclientitem.vs')">
				             <!-- 默认排序 -->
				             <option  <ww:if test="orderv=='id'"> selected="selected" </ww:if>   value="id"><ww:property value='#session.local.a00562' /></option>
				             <!-- 连接时间 -->
				             <option  <ww:if test="orderv=='zxstate'"> selected="selected" </ww:if>   value="zxstate"><ww:property value='#session.local.a00043' /></option>
							 <!-- 设备名称-->
							 <option  <ww:if test="orderv=='name'"> selected="selected" </ww:if>   value="name"><ww:property value='#session.local.a00563' /></option>
					      </select>  
			        </div>
			        
				   <div class="btn-group" style="float: right;margin-right: 30px;">
				       
				        <button onclick="jh_send()"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00421' /></button> 
				     
			       </div>
			       
			        
			       
			       				  
			 </div>
			 
		
			
		 </div> 
		 <!--显示内容-->
		<div id="showsonlist"> 
		        <div style="height: 400px;"  >
		             
		            <!-- 固定标题 -->
                    <div style="padding-right:17px;margin: 0px;">
                         <table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
                            <tr class="cell_element cell_first">
							<td style="width: 10%;" align="center">&nbsp;&nbsp;&nbsp;<input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
							<td style="width: 30%;" ><ww:property value='#session.local.a00563' /></td>
							<td style="width: 20%;"><ww:property value='#session.local.a00041' /></td>
							<td style="width: 20%;"><ww:property value='#session.local.a00040' /></td>
							<td style="width: 20%;"><ww:property value='#session.local.a00043' /></td> <!-- 在线状态 -->
							</tr>
						  </table>	
                    </div>
					<div style="height: 400px;overflow: auto;overflow-y:scroll;">
						<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
						<ww:iterator value="clients">
						
							<tr class="cell_element cell_show">
							  <td style="width: 10%;" align="center">
			                      &nbsp;&nbsp; <input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
							  </td>
							  <td style="width: 30%;" title="<ww:property value='name' /> ">
							     <ww:property value="namesub" />
							  </td>
							  <td style="width: 20%;"><ww:property value="ip"/></td>
							  <td style="width: 20%;"><ww:property value="mark"/></td>
							  <td style="width: 20%;">
							      <ww:if test="zxstate==0"><span  style="color: #FF0000"><ww:property value="#session.local.a00045" /></span></ww:if>
								  <ww:else><span style="color: #0033FF"><ww:property value="#session.local.a00044" /></span></ww:else>
							  </td>
							  <!--
							  <td>
							    <a href="javascript:open_user_up(<ww:property value='id' />)">[<ww:property value='#session.local.a00017' />]</a>
							  </td>
							-->
						 </tr>
						</ww:iterator>
						
						</table>
					</div>
				</div>
				 <!--分页-->
				<div class="nav">
					<ul class="pg">
		                <!-- 上一页-->
						<li><a href="javascript:pageto_client(<ww:property value='qian' />,'ajaxclientitem.vs');" class="pg_f"></a></li>
			            <!--页码显示上-->
						<ww:iterator id="q"  value="ps.qs">
			                  <li><a href="javascript:pageto_client(<ww:property value='#q'/>,'ajaxclientitem.vs');" ><ww:property value="#q"  /></a> </li>
			            </ww:iterator>
			            
			            <!--当前页码-->
			            <li><a href="javascript:pageto_client(<ww:property value='#request.id'  />,'ajaxclientitem.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
			            
			             <!--页码显示下-->
			            <ww:iterator id="h"  value="ps.hs">
			                  <li><a href="javascript:pageto_client(<ww:property value='#h'/>,'ajaxclientitem.vs')"><ww:property value="#h"  /></a></li>
			            </ww:iterator>
			            
		                <!--下一页-->
			            <li><a href="javascript:pageto_client(<ww:property value='hou' />,'ajaxclientitem.vs');" class="pg_e"></a></li>
					</ul>
				    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo_client('ajaxclientitem.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
				    
					<div class="pg_count">
					     
					     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
					     <a href="javascript:setpagetype_client(10,'ajaxclientitem.vs');" <ww:if test='pagetype==10'>style="background-color:#FFA534;"</ww:if> >10</a>
					     <a href="javascript:setpagetype_client(20,'ajaxclientitem.vs');" <ww:if test='pagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
					     <a href="javascript:setpagetype_client(30,'ajaxclientitem.vs');" <ww:if test='pagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
					     <a href="javascript:setpagetype_client(<ww:property value='total'/>,'ajaxclientitem.vs');" <ww:if test='pagetype==total'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
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
				</div>
       
	   </div>
	</div>
</div>
<input type="hidden" value="<ww:property value='clientids'/>" name="clientids"  id="clientids" />     <!-- 终端ids -->
<input type="hidden" value="<ww:property value='tbId'/>" name="tbId"  id="tbId" />                    <!-- 台标ID -->

</form>
<iframe id="id_iframe" name="id_iframe" style="display:none;"></iframe> 

<script>
var groupArray = new Array();
//检查某个分组是否加载下一级数据
function checkLoad(cgid){
  for(var i=0;i<groupArray.length;i++)
     {
           if (cgid == groupArray[i]){
        	   return true;
           }
     }
  return false;
}

var setting = {
		view: {
			showIcon: true
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onExpand: zTreeOnExpand,
			onCheck: zTreeOnCheck
		}
	};

	function zTreeOnCheck(event, treeId, treeNode) {
		$('#zpid').val(treeNode.id+","+treeNode.level);
	}

	function zTreeOnExpand(event, treeId, treeNode) {
		if (checkLoad(treeNode.tId)){
			return;
		}
		$('#'+treeNode.tId+'_ico').removeClass("ico_open");
		$('#'+treeNode.tId+'_ico').addClass("ico_loading");
	    $.ajax({
		 	 url:'ajaxsontreeitem.vs',
			 data:{
	    			cgid : treeNode.id,
					type : treeNode.level
				 },
				 type:'post',  
			     cache:false,  
			     dataType:'json',  
			     success:function(data) {
					groupArray.push(treeNode.tId);
				    var id = "";
				    var areaName = "";
				    var pId = "";
				    var click = "";
				    var isParent = "";
				    var json = eval(data.cgslist);
				    for(var i=0; i<json.length; i++)
				    {
				    	id = json[i].id;
					    areaName = json[i].name;
					    pId = json[i].pid;
					    click = json[i].click;
					    isParent = json[i].isParent;
				    	var newNode = {id:id,name:areaName,pId:pId,click:click,isParent:isParent};
						newNode = zTree.addNodes(treeNode, newNode);
				    }
				    $('#'+treeNode.tId+'_ico').removeClass("ico_loading");
					$('#'+treeNode.tId+'_ico').addClass("ico_open");
				 }
		 });
	};	

    var zNodes = <%=request.getAttribute("ztree")%>;
    
	function showIconForTree(treeId, treeNode) {
		return !treeNode.isParent;
	};

	var zTree;
	$(document).ready(function(){
		$.fn.zTree.init($("#leftTree"), setting, zNodes);
		zTree = $.fn.zTree.getZTreeObj("leftTree");
	});

</script>
</body>
</html>
