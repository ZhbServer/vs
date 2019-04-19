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
<link rel="stylesheet"  href="../css/index.css"  type="text/css" />
<link rel="stylesheet"  href="../css/reset.css"  type="text/css" />
<script type="text/javascript" src="../js/jq/jquery.js"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>
<script type="text/javascript" src="../js/two_menu.js"></script>
<script type="text/javascript" src="../js/fresh.js"></script>
<script type="text/javascript" src="../js/constant.js"></script>

<script type="text/javascript" src="../js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="../js/jay.js"></script>
<script type="text/javascript" src="../js/fresh.js"></script>
<script type="text/javascript" src="../js/<ww:property value='#session.local.a00000' />/common.js"></script>

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="../zui-1.5.0-dist/dist/css/zui.min.css" />


<style>
a{text-decoration:none;}
</style>
<script type="text/javascript">
$(function(){
	$(".dropdown_logo").click(function(){
		if($('.user_list').is(":hidden")){
			$(this).find('img').attr('src','../image/system_settings/dropdown_logo2.png');
			$('.user_list').slideDown();
			}else{
				$(this).find('img').attr('src','../image/system_settings/dropdown_logo1.png');
				$('.user_list').slideUp();
				}
		});
});

/*弹出新增端口*/
function open_client_add(){

	/*判断是否选择分组*/
	var v = document.getElementsByName('curruserid');
	var j = 0;
	var curruserid=0;
	for ( var i = 0; i < v.length; i++) {
			if (v.item(i).checked) {
				j++;
				var curruserid = v.item(i).value;
				break;
			}
	 }
	 if (j == 0) {
		    layer.msg("<ww:property value='#session.local.a00451' />!");
			return;
	 }   

	layer.open({
 		type: 2,
         area: ['500px', '400px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         
         content: 'openaddclient.vs?fuid='+curruserid,
         scrollbar: false,
         end: function(){ 
		   //document.form1.target = "_self";
		   //document.form1.action = "seecslist.vs"; 
		   //document.form1.submit(); 
         
         	 var pagetype=document.getElementById("pagetype").value;
      	     var id=1;
      	     var sel=document.getElementById("sel").value;
        	 var ser=document.getElementById("ser").value;
        	 var orderv=document.getElementById("orderv").value;
        	 var cgid=document.getElementById("cgid").value;
        	 var type=document.getElementById("type").value;
        	 var url="ajaxclientcg.vs?cgid="+cgid+"&type="+type+"&sel="+sel+"&ser="+ser+"&id="+id+"&pagetype="+pagetype+"&orderv="+orderv;
        	 getPart(url, 'showsonlist');     
 		}
 	});            
} 


/*禁用终端*/
function disabled_client(){

	var v = document.getElementsByName('qx');
	var j = 0;
	for ( var i = 0; i < v.length; i++) {
		if (v.item(i).checked) {
			j++;
			var currterm = v.item(i).value;
			break;
		}
	}
	if (j == 0) {
		layer.msg("<ww:property value='#session.local.a00018' />!");
		return;
	}


	layer.open({
 		type: 2,
         area: ['500px', '400px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         
         content: "../client_set_disabled.jsp",
         scrollbar: false,
         end: function(){ 
		 if(window.returnValue==undefined||window.returnValue==""){
		     window.returnValue=""; 			            
		 }else{
			 

			 document.form1.target = "_self";
			 document.form1.action = "disabledClient.vs?disabledstate="+window.returnValue; 
			 document.form1.submit(); 
			   
 		 }
	   }
 	});            
} 


/*移动终端*/
function open_client_move(){
	var v = document.getElementsByName('qx');
	var j = 0;
	var currterm="";
	for ( var i = 0; i < v.length; i++) {
		if (v.item(i).checked) {
			j++;
			if(currterm==""){
				currterm=v.item(i).value;
			}else{
				currterm=currterm+"_"+v.item(i).value;
			}			
		}
	}
	if (j == 0) {
		layer.msg("<ww:property value='#session.local.a00018' />!");
		return;
	}
	layer.open({
 		 type: 2,
         area: ['800px', '530px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'tomoveclient.vs?cidsstr='+currterm,
         scrollbar: false,
         end: function(){ 
		     //document.form1.target = "_self";
		     //document.form1.action = "seecslist.vs"; 
		     //document.form1.submit(); 
         
         	 var pagetype=document.getElementById("pagetype").value;
      	     var id=1;
      	     var sel=document.getElementById("sel").value;
        	 var ser=document.getElementById("ser").value;
        	 var orderv=document.getElementById("orderv").value;
        	 var cgid=document.getElementById("cgid").value;
        	 var type=document.getElementById("type").value;
        	 var url="ajaxclientcg.vs?cgid="+cgid+"&type="+type+"&sel="+sel+"&ser="+ser+"&id="+id+"&pagetype="+pagetype+"&orderv="+orderv;
        	 getPart(url, 'showsonlist');     
 		}
 	});            
	
}

/*分配用户*/
function open_client_fp(){
	layer.open({
 		type: 2,
         area: ['1100px', '620px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'tofpclientuser.vs',
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

 /*删除终端*/
 function del_client(){

		var v = document.getElementsByName('qx');
		var j = 0;
		for ( var i = 0; i < v.length; i++) {
			if (v.item(i).checked) {
				j++;
				var currterm = v.item(i).value;
				break;
			}
		}
		if (j == 0) {
			layer.msg("<ww:property value='#session.local.a00018' />!");
			return;
		}

		layer.confirm("<ww:property value='#session.local.a00092' />?", {icon: 3, title:"<ww:property value='#session.local.a00093' />",btn: ["<ww:property value='#session.local.a00080' />", "<ww:property value='#session.local.a00014' />"]}, function(index,layero){
			document.form1.target="id_iframe";
			document.form1.action = "delclient.vs";
			document.form1.submit();
			layer.msg("<ww:property value='#session.local.a00398' />!");
			 var pagetype=document.getElementById("pagetype").value;
	 	     var id=1;
	 	     var sel=document.getElementById("sel").value;
	 	  	 var ser=document.getElementById("ser").value;
	 	  	 var orderv=document.getElementById("orderv").value;
		   	 var cgid=document.getElementById("cgid").value;
		   	 var type=document.getElementById("type").value;
		   	 var url="ajaxclientcg.vs?cgid="+cgid+"&type="+type+"&sel="+sel+"&ser="+ser+"&id="+id+"&pagetype="+pagetype+"&orderv="+orderv;
		   	 getPart(url, 'showsonlist');
		});
 }


 /*认证终端*/

 function rz_client(){

		var v = document.getElementsByName('qx');
		var j = 0;
		var qxs="";
		for ( var i = 0; i < v.length; i++) {
			if (v.item(i).checked) {
				j++;
				var currterm = v.item(i).value;
				if(qxs==""){
					qxs= currterm;
				}else{
					qxs=qxs+"_"+currterm;  
			    }
				//break;
			}
		}
		if (j == 0) {
			layer.msg("<ww:property value='#session.local.a00018' />!");
			return;
		}

		layer.open({
	 		 type: 2,
	         area: ['5px', '5px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'rzclient.vs?qxs='+qxs,
	         scrollbar: false,
	         end: function(){ 
             
	             var code=window.returnValue;
	             if(code=="100001"){
	                 //验证失败(账号或者密码不对)
	                 layer.msg("<ww:property value='#session.local.a00507' />[<ww:property value='#session.local.a00506' />]"); 
	         	}else if(code=="100002"){
	                //使用点位数超出总点位数
	         	    layer.msg("<ww:property value='#session.local.a00508' />[<ww:property value='#session.local.a00506' />]");
	         	}else if(code=="100003"){
	         	   //录入成功	
	         		layer.msg("<ww:property value='#session.local.a00509' />[<ww:property value='#session.local.a00506' />]");
	         	}

				 var pagetype=document.getElementById("pagetype").value;
		 	     var id=1;
		 	     var sel=document.getElementById("sel").value;
		 	  	 var ser=document.getElementById("ser").value;
		 	  	 var orderv=document.getElementById("orderv").value;
			   	 var cgid=document.getElementById("cgid").value;
			   	 var type=document.getElementById("type").value;
			   	 var url="ajaxclientcg.vs?cgid="+cgid+"&type="+type+"&sel="+sel+"&ser="+ser+"&id="+id+"&pagetype="+pagetype+"&orderv="+orderv;
			   	 
			   	 getPart(url, 'showsonlist');
	         }
		}); 
	      
	
			 
 }

 /*修改终端名称*/
 function open_client_up_name(cid){
 	layer.open({
  		type: 2,
          area: ['500px', '400px'],
          offset: '10px',
          title:false,
          fix: false, //不固定
          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
          content: 'toclientup.vs?cid='+cid,
          scrollbar: false,
          end: function(){ 
	 		 var pagetype=document.getElementById("pagetype").value;
	 	     var id=1;
	 	     var sel=document.getElementById("sel").value;
	 	  	 var ser=document.getElementById("ser").value;
	 	  	 var orderv=document.getElementById("orderv").value;
		   	 var cgid=document.getElementById("cgid").value;
		   	 var type=document.getElementById("type").value;
		   	 var url="ajaxclientcg.vs?cgid="+cgid+"&type="+type+"&sel="+sel+"&ser="+ser+"&id="+id+"&pagetype="+pagetype+"&orderv="+orderv;
		   	 
		   	 getPart(url, 'showsonlist');	     
  		}
  	});         
 }
 
 /*弹出未录入终端*/
 function open_noenter_client(){
 	 layer.open({
 	 		type: 2,
 	         area: ['1100px', '600px'],
 	         offset: '10px',
 	         title:false,
 	         fix: false, //不固定
 	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
 	         content: 'tonoclient.vs',
 	         scrollbar: false,
 	         end: function(){ 	  
		 		 var pagetype=document.getElementById("pagetype").value;
		 	     var id=1;
		 	     var sel=document.getElementById("sel").value;
		 	  	 var ser=document.getElementById("ser").value;
		 	  	 var orderv=document.getElementById("orderv").value;
			   	 var cgid=document.getElementById("cgid").value;
			   	 var type=document.getElementById("type").value;
			   	 var url="/c/ajaxclientcg.vs?cgid="+cgid+"&type="+type+"&sel="+sel+"&ser="+ser+"&id="+id+"&pagetype="+pagetype+"&orderv="+orderv;
	   	 
	   	 		 getPart(url, 'showsonlist');	  
 	 		 }
 	 	});   
 	
 }

 /*终端分组弹出框*/
 function openClientGroup(){
 	 layer.open({
  		type: 2,
          area: ['1100px', '590px'],
          offset: '10px',
          title:false,
          fix: false, //不固定
          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
          content: 'seecg1list.vs',
          scrollbar: false,
          end: function(){ 
  		}
  	});               

 }


 function open_cglist(aurl){
	  document.form1.target = "_self";
	  document.form1.action = aurl; 
	  document.form1.submit();
 }
</script>
</head>
<body>
 <form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			        <ww:property value='#session.local.a00065' /> :
			        <span class="function"><ww:property value='#session.local.a00240' /></span>
			        <span class="material_bg"><ww:property value='#session.local.a00154' /></span>
			</div>
		
		</div>
		
		</div>


<div class="c_middle">
<div class="s_left">
<div class="mainframe clearfix user_list" id="mainCenter" style="color:red;height: 500px;">
            	<div class="mainCInLeft" style="height: 500px;">
            		<div class="m_left_bottom">
			    		<a href="javascript:openClientGroup();" class="mlb_edit"><ww:property value='#session.local.a00024' /></a>
			    	</div>
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
										jw.print("<a  href='#' onclick='showcg1list("+cg2.getId()+",\"ajaxclientcg.vs\",2)' class='treeLink levlet_" + shendu
												+ "' id='treeLink levlet_" + shendu + "' style='height:40px;line-height:40px;font-size:12px;border-bottom:#e5e3da 1px solid;' >");
										jw.print("<img src='../image/jt1.gif'  width='5px'  height='10px' />&nbsp;<input type='radio' style='line-height:40px;margin-right:5px;margin-top:13px;' name='curruserid'  id='curruserid' value='"
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
											jw.print("<a  href='#' onclick='showcg1list("+cg3.getId()+",\"ajaxclientcg.vs\",3)' class='treeLink levlet_" + shendu
													+ "' id='treeLink levlet_" + shendu + "'  style='height:40px;line-height:40px;font-size:12px;border-bottom:#e5e3da 1px solid;' style='height:40px;line-height:40px;font-size:12px;border-bottom:#e5e3da 1px solid;'>");
											jw.print("<img src='../image/jt1.gif'  width='5px'  height='10px' />&nbsp;<input type='radio' style='line-height:40px;margin-right:5px;margin-top:13px;' name='curruserid'  id='curruserid' value='"
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
					<div class="sideTree"   style="height: 500px;" id="sidtree">
					<%
						int shendu = 1;
						List cg1s = (List) request.getAttribute("cg1slist");		//一级分组
						List cg2s = (List) request.getAttribute("cg2slistall");  //二级分组
						List cg3s = (List) request.getAttribute("cg3slistall");  //三级分组
						User user = (User) request.getAttribute("curruser");
						JspWriter jw = pageContext.getOut();
						jw.print("<a href='#' onclick='showcg1list(0,\"ajaxclientcg.vs\",0)' class='treeLink levlet_1' style='height:40px;line-height:40px;font-size:12px;border-bottom:#e5e3da 1px solid;'  id='treeLink levlet_1'> ");
						jw.print("&nbsp;&nbsp;<img src='../image/jt1.gif'  width='5px'  height='10px' />&nbsp;<input checked='checked' type='radio' style='line-height:40px;margin-right:5px;margin-top:13px;'  name='curruserid' id='curruserid'  value='0,0'/>"+Constant.LOCAL.getA00815());
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
									jw.print("<a  href='#' onclick='showcg1list("+cg1.getId()+",\"ajaxclientcg.vs\",1)' class='treeLink levlet_1' style='height:40px;line-height:40px;font-size:12px;border-bottom:#e5e3da 1px solid;' id='treeLink levlet_1' >");
									jw.print("&nbsp;&nbsp;<img src='../image/jt1.gif'  width='5px'  height='10px' />&nbsp;<input type='radio' style='line-height:40px;margin-right:5px;margin-top:13px;' name='curruserid'  id='curruserid' value='"
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
   
	<div class="c_right" style="height: 500px;">
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
				  <div class="col-xs-3" style="margin-left: -28px;width: 50px;" >
				     	<button  onclick="select_ser_client('ajaxclientcg.vs')" class="btn btn-sm btn-primary" type="button" style="padding: 4px 8px;"><i class="icon icon-search"></i></button>
				       
				 
				  </div> 
				  
				  
				  
				  <div class="btn-group" style="float: right;margin-right:30px;">
				          
				      
						    
					   <ww:if test="#session.urid==1">
				          <button onclick="open_client_add()"   type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00021' /></button><!-- 新增 -->
				       </ww:if>
				       
				       <button onclick="open_client_move()"  type="button" class="btn btn-sm btn-primary"  title="<ww:property value='#session.local.a00431' />" ><ww:property value='#session.local.a00430' /></button><!-- 移动终端-->
				       <button onclick="open_client_fp()"    type="button" class="btn btn-sm btn-primary"  title="<ww:property value='#session.local.a00433' />" ><ww:property value='#session.local.a00432' /></button><!-- 分配用户-->
				       <!--<button onclick="open_cglist('seecg1list.vs')" type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00155' /></button>--><!-- 分组设置-->
				       <ww:if test="#session.ltype==1">
						  <button onclick="rz_client()"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00514' /></button>
			            </ww:if>
			            
			            <ww:if test="#session.clientdisabled==1">
						  <button onclick="disabled_client()"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00765' /></button>
			            </ww:if>
			            
<!--			           <ww:if test="#session.urid==1">-->
				           <button onclick="del_client()"        type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button>
<!--				       </ww:if>-->
				       
				        <select id="orderv" name="orderv"  class="form-control input-sm"  style="width: 90px;margin-left: 5px;" onchange="select_orderby_client('ajaxclientcg.vs')">
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
                    <div style="padding-right:17px;margin: 0px;">
                         <table border="0" cellpadding="0" cellspacing="0">
					         <tr class="cell_element cell_first">
					         	<td width="10%" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
					            <td width="30%">&nbsp;<ww:property value='#session.local.a00563' /></td>
								<td width="15%" ><ww:property value='#session.local.a00041' /></td>
								<td width="15%" ><ww:property value='#session.local.a00040' /></td>
								<td width="15%"><ww:property value='#session.local.a00043' /></td><!-- 在线状态 -->
								<td width="15%" >&nbsp;&nbsp;<ww:property value='#session.local.a00016' /></td>
<!--								<td width="10%" title="<ww:property value='#session.local.a00523' />"><ww:property value='#session.local.a00521' /></td>-->
					         </tr>
					      </table>    
                    </div> 
                    <div style="height: 400px;overflow: auto;overflow-y:scroll;">
						<table border="0" cellpadding="0" cellspacing="0">
						
							<ww:iterator value="clients">
							    <tr class="cell_element cell_show">
							      <td width="10%" align="center">
			                         <input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
								  </td>
								  <td style="width:30%"  title="<ww:property value='name' /> ">
								     <ww:property value="namesub" />
								  </td>
								  <td width="15%" ><ww:property value="ip"/></td>
								  <td width="15%" ><ww:property value="mark"/></td>
								  <td width="15%">
								      <ww:if test="zxstate==0"><span  style="color: #FF0000"><ww:property value="#session.local.a00045" /></span></ww:if>
									  <ww:else><span style="color: #0033FF"><ww:property value="#session.local.a00044" /></span></ww:else>
									  
									  <ww:if test="disabledstate==1">
									  (<ww:property value="#session.local.a00231"/> ) 
									  </ww:if>
									  
							      </td>
								  <td width="15%" >
								  
								      <!-- 查看详情 -->
								      <i title="<ww:property value='#session.local.a00752' />" style="padding: 4px 8px;cursor: pointer;float: left;"  class="icon icon-eye-open" onclick="open_client_eye_info(<ww:property value='id' />)"  ></i>
								      <!-- 修改 -->
								      <i title="<ww:property value='#session.local.a00017' />" style="padding: 4px 8px;cursor: pointer;float: left;"  class="icon icon-edit" onclick="open_client_up_name(<ww:property value='id' />)"  ></i>
								  </td>
								  <!-- 
								  <td width="10%">
								     <ww:if test="netstate==0">
								         <ww:property value='#session.local.a00522' />
								     </ww:if>
								     <ww:if test="netstate==1">
								         <ww:property value='#session.local.a00514' />
								     </ww:if>
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
						<li><a href="javascript:pageto_client(<ww:property value='qian' />,'ajaxclientcg.vs');" class="pg_f"></a></li>
			            <!--页码显示上-->
						<ww:iterator id="q"  value="ps.qs">
			                  <li><a href="javascript:pageto_client(<ww:property value='#q'/>,'ajaxclientcg.vs');" ><ww:property value="#q"  /></a> </li>
			            </ww:iterator>
			            
			            <!--当前页码-->
			            <li><a href="javascript:pageto_client(<ww:property value='#request.id'  />,'ajaxclientcg.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
			            
			             <!--页码显示下-->
			            <ww:iterator id="h"  value="ps.hs">
			                  <li><a href="javascript:pageto_client(<ww:property value='#h'/>,'ajaxclientcg.vs')"><ww:property value="#h"  /></a></li>
			            </ww:iterator>
			            
		                <!--下一页-->
			            <li><a href="javascript:pageto_client(<ww:property value='hou' />,'ajaxclientcg.vs');" class="pg_e"></a></li>
					</ul>
				    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo_client('ajaxclientcg.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
				    
					<div class="pg_count">
					     
					     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
					     <a href="javascript:setpagetype_client(10,'ajaxclientcg.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if> >10</a>
					     <a href="javascript:setpagetype_client(20,'ajaxclientcg.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
					     <a href="javascript:setpagetype_client(30,'ajaxclientcg.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
					     <a href="javascript:setpagetype_client(-1,'ajaxclientcg.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
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
				</div>
       
	   </div>
	</div>
</div>
</form>
<iframe id="id_iframe" name="id_iframe" style="display:none;"></iframe> 

</body>
</html>
