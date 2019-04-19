<%@page import="com.vshow.control.data.ClientGroup"%>
<%@page import="com.vshow.control.tool.Constant"%>

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
var b00028="<ww:property value='#session.local.b00028'  />";

/*清理节目*/
 function open_clear(){

		var sendtype = $("#stl option:checked").val();
		if(sendtype == ""){
			layer.msg("<ww:property value='#session.local.a00819' />!"); 
			return;
		}
		 
	    //获取所有选用户
		var checkboxuids=document.getElementsByName("curruserid");
		//计数
		var ucount=0;
		//拼接用户id
		var cgids="";
	    for(var i=0;i<checkboxuids.length;i++){
	       if(checkboxuids[i].checked){
	    	   
	    	   if(ucount==0){
	    		   cgids=checkboxuids[i].value;
	    	   }else{
	        	   cgids=cgids+"_"+checkboxuids[i].value; 
	           }
	    	   ucount++;   
	       }
	    }
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
	    if(clientids.length==0&&cgids.length==0) 
	    { 
	    	  layer.msg("<ww:property value='#session.local.a00416' />"); 
	          return ; 
	    }


	    document.getElementById("clientids").value=clientids;
	    document.getElementById("cgids").value=cgids;

	    var sendurl="";
	    //sendtype  1清理普通  2清理垫片  3清理轮播   4清理 插播  6 清理感应  7清理精准 8清理预警 9清理垫片
	    if(sendtype==1){
	    	sendurl="fbclearitem.vs";
	    }else if(sendtype==2){
	    	sendurl="fbcleardp.vs";
	    }else if(sendtype==3){
	    	sendurl="fbcleartime.vs";
	    }else if(sendtype==4){
	    	sendurl="fbclearinsert.vs";
	    }else if(sendtype==5){
	    	sendurl="fbcleardateitem.vs";
		}else if(sendtype==6){
	    	sendurl="fbclearinductionitem.vs";
		}else if(sendtype==7){
	    	sendurl="fbclearaccurateitem.vs";
		}else if(sendtype==8){
	    	sendurl="fbclearwarningitem.vs";
		}else if(sendtype==9){
	    	sendurl="fbclearclientdp.vs";
		}else if(sendtype==10){
	    	sendurl="fbclearconditionitem.vs";
		}
     
	    
		layer.open({
	 		type: 2,
	         area: ['1100px', '620px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: sendurl+'?clientids='+clientids+"&cgids="+cgids,
	         scrollbar: false,
	         end: function(){
	          
			     //document.form1.target = "_self";
			     //document.form1.action = "seecslist.vs"; 
			     //document.form1.submit(); 	         
	         	 //var pagetype=document.getElementById("pagetype").value;
	      	     //var id=1;
	          	 //var sel=0;
	        	 //var ser="";
	        	 //var cgid=document.getElementById("cgid").value;
	        	 //var type=document.getElementById("type").value;
	        	 //var url="ajaxclientcg.vs?cgid="+cgid+"&type="+type+"&sel="+sel+"&ser="+ser+"&id="+id+"&pagetype="+pagetype;
	        	 //getPart(url, 'showsonlist');     
	 		}
	 	});   
  } 


 /*清理全部*/
 function open_clear_all(){
	    //获取所有选用户
		var checkboxuids=document.getElementsByName("curruserid");
		//计数
		var ucount=0;
		//拼接用户id
		var cgids="";
	    for(var i=0;i<checkboxuids.length;i++){
	       if(checkboxuids[i].checked){
	    	   
	    	   if(ucount==0){
	    		   cgids=checkboxuids[i].value;
	    		  
	           }else{
	        	   cgids=cgids+"_"+checkboxuids[i].value; 
	           }
	    	   ucount++;   
	       }
	    }

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
	    if(clientids.length==0&&cgids.length==0) 
	    { 
	    	  layer.msg("<ww:property value='#session.local.a00416' />"); 
	          return ; 
	    }


	    document.getElementById("clientids").value=clientids;
	    document.getElementById("cgids").value=cgids;

		layer.open({
	 		type: 2,
	         area: ['1100px', '620px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'fbclearall.vs?clientids='+clientids+"&cgids="+cgids,
	         scrollbar: false,
	         end: function(){ 
			     //document.form1.target = "_self";
			     //document.form1.action = "seecslist.vs"; 
			     //document.form1.submit(); 
	         
	         	 //var pagetype=document.getElementById("pagetype").value;
	      	     //var id=1;
	          	 //var sel=0;
	        	 //var ser="";
	        	 //var cgid=document.getElementById("cgid").value;
	        	 //var type=document.getElementById("type").value;
	        	 //var url="ajaxclientcg.vs?cgid="+cgid+"&type="+type+"&sel="+sel+"&ser="+ser+"&id="+id+"&pagetype="+pagetype;
	        	 //getPart(url, 'showsonlist');     
	 		}
	 	});   
  }
  	 
</script>
</head>
<body>
 <form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			        &nbsp;&nbsp;<ww:property value='#session.local.a00065' /> :
			        <span class="function"><ww:property value='#session.local.a00240' /></span>
			        <span class="material_bg"><ww:property value='#session.local.a00157' /></span>
			</div>
			
	
		</div>
</div>

<div class="c_middle">
	<div class="c_left">
	  	<div align="left" >
	  		<ul id="leftTree" class="ztree"></ul>
		</div>
		<div id="rMenu">
			<ul style="margin:5px;padding:0px;">
				<li style="cursor:pointer;" id="g_add"><ww:property value='#session.local.a00990' /></li>
				<li style="cursor:pointer;" id="g_rename"><ww:property value='#session.local.a00991' /></li>
				<li style="cursor:pointer;" id="g_del"><ww:property value='#session.local.a00992' /></li>
			</ul>
		</div>
	</div>
   
	<div class="c_right">
	 	 <div class="c_right_header" >
	            <div class="row">
			     <div class="col-xs-1">
	                  
					     <select  id="sel" name="sel"  class="form-control input-sm" style="width: 90px;" >
				             <!-- 搜搜条件 -->
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
				  <div class="col-xs-3" style="margin-left: -28px;width: 50px;" >
			     	 <button  onclick="select_ser_client('ajaxclientitem.vs')" class="btn btn-sm btn-primary" type="button" style="padding: 4px 8px;"><i class="icon icon-search"></i></button>
				  </div> 
				  
				  <div class="btn-group" style="float:right;margin-right: 30px;">
				  		<input type="hidden" />
				  		<select  id="stl" name="stl"  class="form-control input-sm" style="width:90px;position: relative;float: left;" >
							
								<!-- 选择条件 -->
								<option  value=""><ww:property value='#session.local.a00819' /></option>
								<!-- 节目 -->
								<option  value="5"><ww:property value='#session.local.a00820' /></option>
								<!-- 垫片 -->
	                            <!--<option  value="2"><ww:property value='#session.local.a00821' /></option>-->
								<!-- 轮播 -->
								<option  value="3"><ww:property value='#session.local.a00822' /></option>
								<!-- 插播 -->
								<option  value="4"><ww:property value='#session.local.a00823' /></option>
								
								<!-- 感应 -->
								<ww:if test="#session.version_onoff.inductionShow==1">
							       <option  value="6"><ww:property value='#session.local.b00147' /></option>
								</ww:if>
								
								<!-- 精准 -->
								<ww:if test="#session.version_onoff.accurateSendShow==1">
								    <option  value="7"><ww:property value='#session.local.b00148' /></option>
								 </ww:if>   
								 
								 
								<!-- 预警 -->
								<ww:if test="#session.version_onoff.warning==1">
								    <option  value="8"><ww:property value='#session.local.b00276' /></option>
								</ww:if>  
								 
								 <!-- 垫片 -->
								<ww:if test="#session.version_onoff.dpJhOnOff==1">
								    <option  value="9"><ww:property value='#session.local.b00311' /></option>
								</ww:if>  
								
								 <!--条件 -->
								<ww:if test="#session.version_onoff.conditionalOnOff==1">
								    <option  value="10"><ww:property value='#session.local.b00371' /></option>
								</ww:if>  
								  
							
							
						   </select>
						   <button onclick="open_clear()"  type="button" class="btn btn-sm btn-primary" style="margin-right:10px;" ><ww:property value='#session.local.a00824' /></button>					  			
				           <!--<button title="<ww:property value='#session.local.a00530' />" onclick="open_clear(5)"  type="button" class="btn btn-sm btn-primary"  ><ww:property value='#session.local.a00530' /></button> 清理节目 
					       <button title="<ww:property value='#session.local.a00533' />" onclick="open_clear(2)"  type="button" class="btn btn-sm btn-primary"  ><ww:property value='#session.local.a00589' /></button> 清理垫片
					       <button title="<ww:property value='#session.local.a00533' />" onclick="open_clear(3)"  type="button" class="btn btn-sm btn-primary"  ><ww:property value='#session.local.a00590' /></button>  清理轮播
					       <button title="<ww:property value='#session.local.a00533' />" onclick="open_clear(4)"  type="button" class="btn btn-sm btn-primary"  ><ww:property value='#session.local.a00591' /></button> 清理插播
					       <button title="<ww:property value='#session.local.a00532' />" onclick="open_clear_all()"  type="button" class="btn btn-sm btn-primary"  ><ww:property value='#session.local.a00531' /></button>--><!-- 清理全部 -->
					       
					       <button onclick="open_clear_all()"  type="button" class="btn btn-sm btn-primary" title="<ww:property value='#session.local.b00205' />" ><ww:property value='#session.local.a00146' /></button>
					       <button onclick="open_result_last()"  type="button" class="btn btn-sm btn-primary"  ><ww:property value='#session.local.a00420' /></button><!-- 执行结果 -->
				          
				           <select id="orderv" name="orderv"  class="form-control input-sm"  style="width: 90px;margin-left: 5px;" onchange="select_orderby_client('ajaxclientitem.vs')">
				             
				             <!-- 默认排序 -->
				             <option  <ww:if test="orderv=='id'"> selected="selected" </ww:if>   value="id"><ww:property value='#session.local.a00562' /></option>
				             <!-- 连接时间 -->
				             <option  <ww:if test="orderv=='zxstate'"> selected="selected" </ww:if>   value="zxstate"><ww:property value='#session.local.a00043' /></option>
							 <!-- 设备名称-->
							 <option  <ww:if test="orderv=='name'"> selected="selected" </ww:if>   value="name"><ww:property value='#session.local.a00563' /></option>
							 
						   </select> 
				 
			       </div>
			        
				</div>
				
		 </div>
		 <!--显示内容-->
		<div id="showsonlist"> 
		        <div style="height: 400px;"  >
		             <!-- 固定标题 -->
                    <div style="padding-right:17px;">
                        <table border="0" cellpadding="0" cellspacing="0">
					      <tr class="cell_element cell_first">
							<td style="width:10%" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
							<td style="width:25%" ><ww:property value='#session.local.a00563' /></td>
							<td style="width:25%" ><ww:property value='#session.local.d00024' /></td>
							<td style="width:15%" ><ww:property value='#session.local.a00041' /></td>
							<td style="width:15%" ><ww:property value='#session.local.a00040' /></td>
							<td style="width:10%" ><ww:property value='#session.local.a00043' /></td> <!-- 在线状态 -->
						  </tr>
						  </table>
                       
                    </div>
                    <div style="height: 400px;overflow: auto;overflow-y:scroll;"> 
						<table border="0" cellpadding="0" cellspacing="0">
						   <ww:iterator value="clients" status="status">
						
							<tr class="cell_element cell_show">
							  <td style="width:10%" align="center">
			                      <input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
							  </td>
							  
							  <td style="width:25%"  title="<ww:property value='name' /> ">
							      
							       <ww:if test="name.length()>26"><ww:property  value="name.substring(0,25)"/>...</ww:if>
			   				        <ww:else><ww:property value='name' /></ww:else>
			   				         
							  </td>
							  <td style="width:25%">
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
							  <td style="width:15%" ><ww:property value="ip"/></td>
							  <td style="width:15%" ><ww:property value="mark"/></td>
							  <td style="width:10%">
							  
							    <ww:if test="standbystate==2">
								      <span style="color: red;">
								             (<ww:property value="#session.local.a00522"/>)
								      </span>
							    </ww:if>
							    <ww:else>
							           
							           <ww:if test="zxstate==0"><span  style="color:#FF0000">
							                 <ww:property value="#session.local.a00045" /></span>
									   </ww:if>
									   <ww:else><span style="color:#0033FF"><ww:property value="#session.local.a00044" /></span></ww:else>
									   <ww:if test="disabledstate==1">
										      (<ww:property value="#session.local.a00231"/>) 
									   </ww:if>
									   <ww:if test="standbystate==0">
					                   </ww:if>
					                   <ww:elseif test="standbystate==1">
							                 <span style="color:red;">
							                   (<ww:property value="#session.local.a00488"/>)
							                 </span>
							           </ww:elseif>		
							    
							    </ww:else>
							    
					              
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
						<li><a title="" href="javascript:pageto_client(<ww:property value='qian' />,'ajaxclientitem.vs');" class="pg_f"></a></li>
			            <!-- 页码显示上 -->
						<ww:iterator id="q"  value="ps.qs">
			                  <li><a href="javascript:pageto_client(<ww:property value='#q'/>,'ajaxclientitem.vs');" ><ww:property value="#q"  /></a> </li>
			            </ww:iterator>
			            
			            <!--当前页码-->
			            <li><a href="javascript:pageto_client(<ww:property value='#request.id'/>,'ajaxclientitem.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
			            
			             <!--页码显示下-->
			            <ww:iterator id="h"  value="ps.hs">
			                  <li><a href="javascript:pageto_client(<ww:property value='#h'/>,'ajaxclientitem.vs')"><ww:property value="#h"  /></a></li>
			            </ww:iterator>
			            
		                <!--下一页-->
			            <li><a title="" href="javascript:pageto_client(<ww:property value='hou' />,'ajaxclientitem.vs');" class="pg_e"></a></li>
					</ul>
				    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo_client('ajaxclientitem.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
				    
					<div class="pg_count">
					     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / </span>
					     <a href="javascript:setpagetype_client(10,'ajaxclientitem.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if> >10</a>
					     <a href="javascript:setpagetype_client(20,'ajaxclientitem.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
					     <a href="javascript:setpagetype_client(30,'ajaxclientitem.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
					     <a href="javascript:setpagetype_client(-1,'ajaxclientitem.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value="#session.local.a00815" /></a>
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
		            <!--树id-->
					<input type="hidden" name="treeid"  id="treeid" value=""/>
					<!--树级别-->
					<input type="hidden" name="levelid"  id="levelid" value=""/>
				</div>
       
	   </div>
	</div>
</div>

<input type="hidden" value="<ww:property value='clientids'/>" name="clientids"  id="clientids" />     <!-- 终端ids -->
<input type="hidden" value="<ww:property value='cgids'/>" name="cgids" id="cgids"/>                   <!-- 终端分组ids -->



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
			onRightClick: onRightClick,
			onClick: function (e, treeId, treeNode, clickFlag) {
				$('#treeid').val(treeNode.id);
				$('#levelid').val(treeNode.level);
			}
		}
	};

	function onRightClick(event, treeId, treeNode) {
		$('#treeid').val(treeNode.id);
		$('#levelid').val(treeNode.level);
		ztreeNode = treeNode;
	    showRMenu(treeNode,{x:event.clientX, y:event.clientY});
	}
	
	function zTreeOnExpand(event, treeId, treeNode) {
		loadcTree(treeNode,'ajaxsontreeitem.vs');
	};
	
	//查询下级树
	function loadcTree(treeNode,url){
		if (checkLoad(treeNode.tId)){
			return;
		}
		$('#'+treeNode.tId+'_ico').removeClass("ico_open");
		$('#'+treeNode.tId+'_ico').addClass("ico_loading");
	    $.ajax({
		 	 url:url,
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
	}

	//创建ztree树  
	function  getTree(){
		$.ajax({
		 	 url:'ajaxztreerootitemaction.vs',
			 type:'post',  
		     cache:false,  
		     dataType:'json',  
		     success:function(data) {
			 	var zNodes = eval(data.cgslist);
			 	$.fn.zTree.init($("#leftTree"), setting, zNodes);
				zTree = $.fn.zTree.getZTreeObj("leftTree");
			 }
		});			
	}

	var zTree;
	var ztreeNode;
	var rMenu = $("#rMenu");
	$(document).ready(function(){
		getTree();		
		hideRMenu();
		//鼠标点击事件不在节点上时隐藏右键菜单    
		//新增分组
		$("#g_add").on("click",function(){  
		    addTreeNode();  
		});  
		//修改组名  
		$("#g_rename").on("click",function(){  
		    updated();  
		});  
		//删除分组  
		$("#g_del").on("click",function(){  
		    removeTreeNode();  
		}); 

				
	});

	//显示右键菜单    
	function showRMenu(type,postionJson) {
		$("#rMenu").css({ //设置右键菜单的位置
            top: postionJson.y + "px",
            left: postionJson.x + 2 + "px",
            visibility: "visible",
            position: "fixed",
            border: "1px solid",
            backgroundColor: "#f3f3f3"
        });
		if(type.tId == "leftTree_1") {
			$("#g_add").show();
			$("#g_rename").hide();  
	        $("#g_del").hide();
		}else{
			$("#g_add").show();  
	        $("#g_rename").show();  
	        $("#g_del").show();
		}
	    $("body").bind("mousedown", onBodyMouseDown);  
	} 
	function hideRMenu() {  
	    if (rMenu) rMenu.css({"visibility": "hidden"});  
	    $("body").unbind("mousedown", onBodyMouseDown);  
	}  
	function onBodyMouseDown(event){  
	    if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {  
	        rMenu.css({"visibility" : "hidden"});  
	    }  
	}  


	function addTreeNode(){
		 var tid;
		 var lid;
		 if ($('#treeid').val() == '') {
			    layer.msg("<ww:property value='#session.local.a00451' />!");
				return;
		 }else{
			 if($('#levelid').val() > 2){
				 //layer.msg("<ww:property value='#session.local.a00451' />!");
				 layer.msg("<ww:property value='#session.local.a00985' />!");
				 return;
			 }else{
				 tid = $('#treeid').val();
				 lid = $('#levelid').val();

				 layer.open({
				 		type: 2,
				         area: ['500px', '200px'],
				         offset: '50px',
				         title:false,
				         fix: false, //不固定
				         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
				         content: 'client_group_add.jsp?tid='+tid+"&lid="+lid,
				         scrollbar: false,
				         end: function(){ 
						     if(window.returnValue==undefined||window.returnValue==""){
							       window.returnValue=""; 
						     }else{
						    	 zTree.removeChildNodes(ztreeNode);
						    	 groupArray = new Array();
							     loadcTree(ztreeNode,'ajaxsontreeitem.vs');
						     }     
				 		}
				 	});
		     }
		 }
		 hideRMenu();
	}

	function updated(){
		 var tid;
		 if ($('#treeid').val() == '') {
			    layer.msg("<ww:property value='#session.local.a00451' />!");
				return;
		 }else{
			 if($('#treeid').val() == '0'){
				layer.msg("<ww:property value='#session.local.a00986' />!");
				return;
			 }else{
				tid = $('#treeid').val();
				layer.open({
			 		type: 2,
			         area: ['500px', '200px'],
			         offset: '50px',
			         title:false,
			         fix: false, //不固定
			         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
			         content: 'toeditcg.vs?tid='+tid,
			         scrollbar: false,
			         end: function(){ 
					   if(window.returnValue==undefined||window.returnValue==""){
						    window.returnValue=""; 
					   }else{
						    ztreeNode.name = window.returnValue;
						   	zTree.updateNode(ztreeNode);
					   }
					}     
			 	});
			 }
	     }
		 hideRMenu();
	}
		
	//删除节点  
	function removeTreeNode() {  
		 var tid;
		 if ($('#treeid').val() == '') {
			    layer.msg("<ww:property value='#session.local.a00451' />!");
				return;
		 }else{
			 tid = $('#treeid').val();
		 }
		 if(tid=="0"){
		   layer.msg("<ww:property value='#session.local.b00052' />!");
	       return;
	     };
		
		layer.confirm("<ww:property value='#session.local.a00245' />,<ww:property value='#session.local.a00092' />?", {icon: 3, title:"<ww:property value='#session.local.a00093' />",btn: ["<ww:property value='#session.local.a00080' />", "<ww:property value='#session.local.a00014' />"]}, function(index,layero){
			$.ajax({
			 	 url:'delcgtree.vs?tid='+tid,
				 type:'post',  
			     cache:false,  
			     dataType:'json',  
			     success:function(data) {
				 	zTree.removeNode(ztreeNode);
				 }
			});
			layer.closeAll('dialog');
	    });
		hideRMenu();
	}
</script>
</body>
</html>
