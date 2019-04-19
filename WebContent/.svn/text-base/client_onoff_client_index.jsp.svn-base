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
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="js/jay.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<style>
a{text-decoration:none;}
</style>
<script type="text/javascript">
/*获取选择用户*/
 function select_user(){
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
	    return  cgids;
 }
 
 
/*获取选择终端*/
function select_client(){
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
    return clientids;
}

/*重启*/
 function fb_restart(){
	  
	    var clientids=select_client();
	    var cgids=select_user();
	    if(clientids.length==0&&cgids.length==0) 
	    { 
	    	  layer.msg("<ww:property value='#session.local.a00416' />"); 
	          return ; 
	    }

         
	    //document.getElementById("clientids").value=clientids;
	    //document.getElementById("cgids").value=cgids;

	    //document.form1.action="fbcsdownset.vs";
	    //document.form1.submit();   
	    
		layer.open({
	 		 type: 2,
	         area: ['1100px', '620px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'fbrestart.vs?clientids='+clientids+"&cgids="+cgids,
	         scrollbar: false,
	         end: function(){    
	 		}
	 	});   
		   
        
        
  } 


 /*唤醒*/
 function fb_rouse(){
	    var clientids=select_client();
	    var cgids=select_user();
	    if(clientids.length==0&&cgids.length==0) 
	    { 
	    	  layer.msg("<ww:property value='#session.local.a00416' />"); 
	          return ; 
	    }

      
	    //document.getElementById("clientids").value=clientids;
	    //document.getElementById("cgids").value=cgids;

	    //document.form1.action="fbcsdownset.vs";
	    //document.form1.submit();   
	    
		layer.open({
	 		 type: 2,
	         area: ['1100px', '620px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'fbrouse.vs?clientids='+clientids+"&cgids="+cgids,
	         scrollbar: false,
	         end: function(){    
	 		}
	 	});   
 }
 /*待机*/
 function fb_dj(){
	    var clientids=select_client();
	    var cgids=select_user();
	    if(clientids.length==0&&cgids.length==0) 
	    { 
	    	  layer.msg("<ww:property value='#session.local.a00416' />"); 
	          return ; 
	    }

   
	    //document.getElementById("clientids").value=clientids;
	    //document.getElementById("cgids").value=cgids;

	    //document.form1.action="fbcsdownset.vs";
	    //document.form1.submit();   
	    
		layer.open({
	 		 type: 2,
	         area: ['1100px', '620px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'fbdj.vs?clientids='+clientids+"&cgids="+cgids,
	         scrollbar: false,
	         end: function(){    
	 		}
	 	});   
 }
 
 /*开关机计划*/
 function open_onoffplan(){
    
        var clientids=select_client();
	    var cgids=select_user();
	    if(clientids.length==0&&cgids.length==0) 
	    { 
	    	  layer.msg("<ww:property value='#session.local.a00416' />"); 
	          return ; 
	    }
	    layer.open({
	 		 type: 2,
	         area: ['1100px', '620px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'totimeonoffnew.vs?clientids='+clientids+"&cgids="+cgids,
	         scrollbar: false,
	         end: function(){    
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
			        <span class="function"><ww:property value='#session.local.a00159' /></span>
			        <span class="material_bg"><ww:property value='#session.local.a00414' /></span>
			</div>
			
		   
		</div>
</div>

<div class="c_middle" style="width: 1090px;">
<div class="s_left"  style="height: 510px;">
<div class="mainframe clearfix user_list" id="mainCenter" style="color:red;height: 510px;">
            	<div class="mainCInLeft" style="height: 510px;width: 215px;">
                	<div class="tree" align="left" >
                	<%!
				
						public void xuanhuan2(JspWriter jw, List cg2list, List cg3list, ClientGroup cg1, int shendu) {
							try {
 								ClientGroup cg2;
								ArrayList al = new ArrayList();
								for (int i = 0; i < cg2list.size(); i++) {
									cg2 = (ClientGroup) cg2list.get(i);
									if (cg2.getPid() == cg1.getId()) {
										al.add(cg2);
									}
								}
								if (al.size() > 0) {
									jw.print("<div  class='nextlevel' id='nextlevel' display='none' >");
									for (int j = 0; j < al.size(); j++) {
										cg2 = (ClientGroup) al.get(j);
										jw.print("<a  href='#' onclick='showcg1list("+cg2.getId()+",\"ajaxclientitem.vs\",2)' class='treeLink levlet_" + shendu
												+ "' id='treeLink levlet_" + shendu + "' style='height:40px;line-height:40px;font-size:12px;border-bottom:#e5e3da 1px solid;' >");
										jw.print("&nbsp;&nbsp;<img src='image/jt1.gif'  width='5px'  height='10px' />&nbsp;<input type='checkbox' name='curruserid' style='line-height:40px;margin-right:5px;margin-top:10px;'  id='curruserid' value='"
												+ cg2.getId() + ","+ cg2.getLevel() + "'/>");
										jw.print(cg2.getGname());
										jw.print("</a>");
										xuanhuan3(jw, cg3list, cg2, shendu+1);
									}
									jw.print("</div>");
								}
							} catch (Exception ex) {
					            ex.printStackTrace();
							}
						}
							
							public void xuanhuan3(JspWriter jw, List cg3list, ClientGroup cg2, int shendu) {
								try {
									ClientGroup cg3;
									ArrayList al = new ArrayList();
									for (int i = 0; i < cg3list.size(); i++) {
										cg3 = (ClientGroup) cg3list.get(i);
										if (cg3.getPid() == cg2.getId()) {
											al.add(cg3);
										}
									}
									if (al.size() > 0) {
										jw.print("<div  class='nextlevel' id='nextlevel' display='none' >");
										for (int j = 0; j < al.size(); j++) {
											cg3 = (ClientGroup) al.get(j);
											jw.print("<a  href='#' onclick='showcg1list("+cg3.getId()+",\"ajaxclientitem.vs\",3)' class='treeLink levlet_" + shendu
													+ "' id='treeLink levlet_" + shendu + "'  style='height:40px;line-height:40px;font-size:12px;border-bottom:#e5e3da 1px solid;' style='height:40px;line-height:40px;font-size:12px;border-bottom:#e5e3da 1px solid;'>");
											jw.print("&nbsp;&nbsp;<img src='image/jt1.gif'  width='5px'  height='10px' />&nbsp;<input type='checkbox' name='curruserid' style='line-height:40px;margin-right:5px;margin-top:10px;'  id='curruserid' value='"
													+ cg3.getId() + ","+ cg3.getLevel() + "'/>");
											jw.print(cg3.getGname());
											jw.print("</a>");
										}
										jw.print("</div>");
									}
								} catch (Exception ex) {
						            ex.printStackTrace();
								}
					}%>
					<div class="sideTree"   style="height: 490px;" id="sidtree">
					<%
						int shendu = 1;
						List cg1s = (List) request.getAttribute("cg1slist");		//一级分组
						List cg2s = (List) request.getAttribute("cg2slistall");  //二级分组
						List cg3s = (List) request.getAttribute("cg3slistall");  //三级分组
						User user = (User) request.getAttribute("curruser");
						JspWriter jw = pageContext.getOut();
						jw.print("<a href='#' onclick='showcg1list(0,\"ajaxclientitem.vs\",0)' class='treeLink levlet_1' style='height:40px;line-height:40px;font-size:12px;border-bottom:#e5e3da 1px solid;'  id='treeLink levlet_1'> ");
						jw.print("&nbsp;&nbsp;<img src='image/jt1.gif'  width='5px'  height='10px' />&nbsp;<input type='checkbox' name='curruserid' style='line-height:40px;margin-right:5px;margin-top:10px;' id='curruserid'  value='0,0'/>"+Constant.LOCAL.getA00029());
						jw.print("</a>");
						
						try {
							ClientGroup cg1;
							ArrayList al = new ArrayList();
							for (int i = 0; i < cg1s.size(); i++) {
								cg1 = (ClientGroup) cg1s.get(i);
								if (cg1.getUid() == user.getId()) {
									al.add(cg1);
								}
							}
							if (al.size() > 0) {
								
								for (int j = 0; j < al.size(); j++) { 
									cg1 = (ClientGroup) al.get(j);
									jw.print("<a  href='#' onclick='showcg1list("+cg1.getId()+",\"ajaxclientitem.vs\",1)' class='treeLink levlet_1' style='height:40px;line-height:40px;font-size:12px;border-bottom:#e5e3da 1px solid;' id='treeLink levlet_1' >");
									jw.print("&nbsp;&nbsp;<img src='image/jt1.gif'  width='5px'  height='10px' />&nbsp;<input type='checkbox' name='curruserid' style='line-height:40px;margin-right:5px;margin-top:10px;' id='curruserid' value='"
											+ cg1.getId()+","+ cg1.getLevel() + "'/>");
									jw.print(cg1.getGname());
									jw.print("</a>");
									xuanhuan2(jw, cg2s, cg3s, cg1, shendu+1);
								}
								
							}
						} catch (Exception ex) {
				            ex.printStackTrace();
						}
						
						
						
					%>
					</div>
					</div>
					<!-- mask -->
					<em class="mtbox mxt2"></em>
					<em class="mtbox mxb2"></em>
                </div>
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
				  <div class="col-xs-3" style="margin-left: -28px;" >
				     	<button  onclick="select_ser_client('ajaxclientitem.vs')" class="btn btn-sm btn-primary" type="button" style="padding: 4px 8px;"><i class="icon icon-search"></i></button>
				  </div> 
				  
				  
				  <div class="btn-group" style="float: right;margin-right: 30px;">
				          
				           <select id="orderv" name="orderv" style="font-size: 15px;" onchange="select_orderby_client('ajaxclientitem.vs')">
				             <!-- 默认排序 -->
				             <option  <ww:if test="orderv=='id'"> selected="selected" </ww:if>   value="id"><ww:property value='#session.local.a00562' /></option>
				             <!-- 连接时间 -->
				             <option  <ww:if test="orderv=='zxstate'"> selected="selected" </ww:if>   value="zxstate"><ww:property value='#session.local.a00043' /></option>
							 <!-- 设备名称-->
							 <option  <ww:if test="orderv=='name'"> selected="selected" </ww:if>   value="name"><ww:property value='#session.local.a00563' /></option>
							 
						 </select> 
				 
			       </div>
			       
			       

		             
			       <div class="btn-group" style="float: right;margin-right: 30px;">
				       <button onclick="fb_restart()"   type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00486' /></button><!-- 重启 -->
				       <button onclick="fb_rouse()"  type="button" class="btn btn-sm btn-primary"  ><ww:property value='#session.local.a00487' /></button><!-- 唤醒 -->
				       <button onclick="fb_dj()"  type="button" class="btn btn-sm btn-primary"  ><ww:property value='#session.local.a00488' /></button><!-- 待机 -->
<!--				       <button onclick="open_onoffplan()"  type="button" class="btn btn-sm btn-primary"  ><ww:property value='#session.local.a00489' /></button>  开关机计划 -->
				      
				       <button onclick="open_result_last()"  type="button" class="btn btn-sm btn-primary"  ><ww:property value='#session.local.a00420' /></button><!-- 执行结果 -->				       
				   </div>		
				</div>
		   </div>
		 <!--显示内容-->
		<div id="showsonlist"> 
		        <div style="height: 400px;"  >
		             
		              <!-- 固定标题 -->
                     <div style="padding-right:17px;margin: 0px;">
                          <table border="0" cellpadding="0" cellspacing="0">
						    <tr class="cell_element cell_first">
								<td style="width:10%" >&nbsp;&nbsp;&nbsp;<input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
								<td style="width:40%" ><ww:property value='#session.local.a00563' /></td>
								<td style="width:20%" ><ww:property value='#session.local.a00041' /></td>
								<td style="width:20%" ><ww:property value='#session.local.a00040' /></td>
								<td style="width:10%" ><ww:property value='#session.local.a00043' /></td> <!-- 在线状态 -->
							</tr>
						   </table>	
                     </div> 
					 <div style="height: 400px;overflow: auto;overflow-y:scroll;">
						<table border="0" cellpadding="0" cellspacing="0" style="margin-top:0px;margin-bottom: 0px;">
							<ww:iterator value="clients">
							
								<tr class="cell_element cell_show">
								  <td style="width:10%">
				                      &nbsp;&nbsp; <input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
								  </td>
								  <td style="width:40%" title="<ww:property value='name' /> ">
								     <ww:property value="namesub" />
								  </td>
								  <td style="width:20%" ><ww:property value="ip"/></td>
								  <td style="width:20%" ><ww:property value="mark"/></td>
								  <td style="width:10%" >
								      <ww:if test="zxstate==0"><span  style="color: #FF0000"><ww:property value="#session.local.a00045" /></span></ww:if>
									  <ww:else><span style="color: #0033FF"><ww:property value="#session.local.a00044" /></span></ww:else>
								      
								        <ww:if test="disabledstate==1">
									  (<ww:property value="#session.local.a00231"/> ) 
									  </ww:if>
								  
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
<input type="hidden" value="<ww:property value='cgids'/>" name="cgids" id="cgids"/>                   <!-- 终端分组ids -->



</form>
<iframe id="id_iframe" name="id_iframe" style="display:none;"></iframe> 

</body>
</html>
