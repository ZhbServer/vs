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
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript" src="zTree/3.51/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="zTree/3.51/jquery.ztree.excheck-3.5.js"></script>
<link rel="stylesheet" href="zTree/3.51/zTreeStyle.css" />

<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<style>
a{text-decoration:none;}
</style>
<script type="text/javascript"><!--
var intro;
var flag = 0;

$(function(){
		$(".dropdown_logo").click(function(){
			if($('.user_ddlist').is(":hidden")){
				$(this).find('img').attr('src','./image/system_settings/dropdown_logo1.png');
				$('.user_ddlist').slideDown();
				}else{
					
					$(this).find('img').attr('src','./image/system_settings/dropdown_logo2.png');
					$('.user_ddlist').slideUp();
			    }
			});


		var openIntro = <%=request.getParameter("openIntro")%>;

		if(openIntro == '1'){
			intro = introJs();  
			intro.setOptions({
			prevLabel:"<ww:property value='#session.local.a00861' />", 
	        nextLabel:"<ww:property value='#session.local.a00862' />",
	        skipLabel:"<ww:property value='#session.local.a00863' />",
	        doneLabel:"<ww:property value='#session.local.a00863' />",
			showStepNumbers: false,
			showBullets: false,
			exitOnOverlayClick: false,
			overlayOpacity: 0.6,  
			steps: [
			    {
				    element: '#step0',
				    intro: "<ww:property value='#session.local.a00970' />"
				},  	
				{  
					element: "#leftTree",
					intro: "<ww:property value='#session.local.a00971' /><span style='color:blue'> <ww:property value='#session.local.a00330' /></span><ww:property value='#session.local.a00972' />",
					position: "right"
						
				},  	
				{  
					element: '#step1',  
					intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00021' /></span><ww:property value='#session.local.a00887' />"
				}
			  ]  
			});  

			document.getElementById("step1").onclick = function (){
				intro.exit();
				open_user_add_1();
				document.getElementById("step1").onclick = function (){
					open_user_add();
				};
			};
			intro.start().oncomplete(function() {  
				intro.exit();  
				document.getElementById("step1").onclick = function (){
					open_user_add();
				};
		    });

			intro.onexit(function() {
				layer.msg("<ww:property value='#session.local.a00864' />");
			});
		}else if(openIntro == '2'){
			intro = introJs();  
			intro.setOptions({
			prevLabel:"<ww:property value='#session.local.a00861' />", 
	        nextLabel:"<ww:property value='#session.local.a00862' />",
	        skipLabel:"<ww:property value='#session.local.a00863' />",
	        doneLabel:"<ww:property value='#session.local.a00863' />",
			showStepNumbers: false,
			showBullets: false,
			exitOnOverlayClick: false,
			overlayOpacity: 0.6,  
			steps: [
				{  
					element: document.getElementsByClassName('icon-edit')[0],  
					intro: "<ww:property value='#session.local.a00973' /><span style='color:blue'> <ww:property value='#session.local.a00017' /></span><ww:property value='#session.local.a00974' /><span style='color:blue'> <ww:property value='#session.local.a00874' /></span><ww:property value='#session.local.a00975' />",
					position: "left"
				},
				{
					element: '#step3',  
					intro: "<ww:property value='#session.local.a00976' />",
					position: "left"
				},
				{
					element: '#step4',  
					intro: "<ww:property value='#session.local.a00977' />"
				}
			  ]  
			});  

			document.getElementById("step1").onclick = function (){
				intro.exit();
				open_user_add_1();
				document.getElementById("step1").onclick = function (){
					open_user_add();
				};
			};
			intro.start().oncomplete(function() {  
				intro.exit();  
				document.getElementById("step1").onclick = function (){
					open_user_add();
				};
		    });

			intro.onexit(function() {
				layer.msg("<ww:property value='#session.local.a00864' />");
				flag = 1;
			});
		}
});


/*(新手指引)弹出新增用户*/
function open_user_add_1(){

	 var curruserid;
	 if ($('#zpid').val() == '') {
		    layer.msg("<ww:property value='#session.local.a00452' />!");
			return;
	 }else{
		 curruserid = $('#zpid').val();
	 } 

	layer.open({
 		type: 2,
         area: ['1000px', '480px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'toaduser.vs?fuid='+curruserid+"&openIntro=1",
         scrollbar: false,
         end: function(){ 
		   document.form1.target = "_self";
		   if(window.returnValue=="close"){
			   document.form1.action = "user.vs"; 
		   }else{
			   document.form1.action = "user.vs?openIntro=2"; 
		   }
		   document.form1.submit();     
 		}
 	});            
} 

/*弹出新增用户*/
function open_user_add(){

	 var curruserid;
	 if ($('#zpid').val() == '') {
		 layer.msg("<ww:property value='#session.local.a00451' />");
		 return false;
	 }else{
		 curruserid = $('#zpid').val();
	 } 
	 
	 layer.open({
	 		type: 2,
	         area: ['1000px', '480px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'toaduser.vs?fuid='+curruserid,
	         scrollbar: false,
	         end: function(){ 
				 zTree.removeChildNodes(ztreeNode);
		  	 	 groupArray = new Array();
			     loadcTree(ztreeNode,'ajaxsontreeuser.vs');    
	 		}
	 	});
	            
} 

/*修改用户信息*/
 function open_user_up(uid){

	 if(flag == 0){
		 var openIntro = <%=request.getParameter("openIntro")%>;
		 if(openIntro == '2'){
			 intro.exit();
			 layer.open({
			 		type: 2,
			 		 area: ['1000px', '500px'],
			         offset: '10px',
			         title:false,
			         fix: false, //不固定
			         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
			         content: 'toupuser.vs?suid='+uid+"&openIntro=1",
			         scrollbar: false,
			         end: function(){ 	  
					   if(window.returnValue==undefined||window.returnValue==""){
						   window.returnValue=""; 
					   }else if(window.returnValue=='close'){
						   var zpid = $('#zpid').val();
						   var url="ajaxuserson.vs?uid="+window.returnValue+"&zpid="+zpid;
						   window.returnValue=""; 
				           getPart(url, 'showsonlist');
					   }else{
						   var zpid = $('#zpid').val();
						   var url="ajaxuserson.vs?uid="+window.returnValue+"&zpid="+zpid;
						   window.returnValue=""; 
				           getPart(url, 'showsonlist');
	
				           intro.goToStep(1).start();
					   }     
					   groupArray = new Array();
					   getTree();
			 		}
			 	});    
		 }else{
			 layer.open({
			 		type: 2,
			 		 area: ['1000px', '500px'],
			         offset: '10px',
			         title:false,
			         fix: false, //不固定
			         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
			         content: 'toupuser.vs?suid='+uid,
			         scrollbar: false,
			         end: function(){ 	  
					   if(window.returnValue==undefined||window.returnValue==""){
						   window.returnValue=""; 
		                  
					   }else{
						   var zpid = $('#zpid').val();
						   var url="ajaxuserson.vs?uid="+window.returnValue+"&zpid="+zpid;
						   window.returnValue=""; 
				           getPart(url, 'showsonlist');
					   }     
					   groupArray = new Array();
					   getTree();
			 		}
			 	});    
		 }
	 }else{
		 layer.open({
		 		type: 2,
		 		 area: ['1000px', '480px'],
		         offset: '10px',
		         title:false,
		         fix: false, //不固定
		         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		         content: 'toupuser.vs?suid='+uid,
		         scrollbar: false,
		         end: function(){ 	  
				   if(window.returnValue==undefined||window.returnValue==""){
					   window.returnValue=""; 
	                  
				   }else{
					   var zpid = $('#zpid').val();
					   var url="ajaxuserson.vs?uid="+window.returnValue+"&zpid="+zpid;
					   window.returnValue=""; 
			           getPart(url, 'showsonlist');
				   }     
				   groupArray = new Array();
				   getTree();
		 		}
		 	});
     }
 }

/*显示子级用户信息*/
function showsonlist(uid){
	var zpid = $('#zpid').val();
	var url="ajaxuserson.vs?uid="+uid+"&zpid="+zpid;
	getPart(url, 'showsonlist');
} 
/*搜索用户*/
function seluser(){
	var selv=document.getElementById("sel").value;
	var serv=document.getElementById("ser").value;

	var zpid = $('#zpid').val();

	var url="ajaxuserson.vs?uid="+"<ww:property value='urid'/>"+"&zpid="+zpid+"&sel="+selv+"&ser="+serv;
	//url=encodeURI(url); 
     
	getPart(url, 'showsonlist');
	

	   
	
}

/*设置用户资源存储空间*/
function set_user_space(uid){
	layer.open({
  		type: 2,
          area: ['500px', '340px'],
          offset: '10px',
          title:false,
          fix: false, //不固定
          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
          content: 'tosetuserspace.vs?uid='+uid,
          scrollbar: false,
          end: function(){ 
			 if(window.returnValue == "1"){
				layer.msg("<ww:property value='#session.local.a00427' />");
			 }
		  }
	});
}


/*删除用户*/
 function del_user(){
	 var val = "";
	 var ids=document.getElementsByName('qx'); 
     var isSel=false; 
     for(var i=0;i<ids.length;i++) 
     { 
        if(ids[i].checked==true) 
        { 
    	  val += ids[i].value+",";
      	  isSel=true; 
        } 
     } 
     if(isSel==false) 
     { 
    	 layer.msg("<ww:property value='#session.local.a00018' />"); 
         return ; 
     }

     layer.confirm("<ww:property value='#session.local.a00092' />?", {icon: 3, title:"<ww:property value='#session.local.a00093' />",btn: ["<ww:property value='#session.local.a00080' />", "<ww:property value='#session.local.a00014' />"]}, function(index,layero){
		   document.form1.action="deluser.vs";
		   document.form1.submit();
	  });
	   
    
 } 
 function getFileName(file){
     var arr = file.split('\\');
     return arr[arr.length-1];
 }
 /* 导出用户*/
  function export_user(){
		   document.form1.action="toexportUser.vs";
		   document.form1.submit();

 }
//导入
  function daoitemin(){
  	 //daoiteminu
  	 layer.open({
  		type: 2,
  		title:"<ww:property value='#session.local.a00659' />",
  		area: ['800px', '430px'],
          offset: '20px',
          title:false,
          fix: false, //不固定
          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
          content: "userImprot.jsp",
          scrollbar: false,
          end: function(){ 
      	   
      	    window.location.href="user.vs";
      	     
  		}
  	});           
  }
  
  </script>
</head>
<body>
<form  name="form1" method="post" >
 
<!--父级id-->
<input type="hidden" name="zpid"  id="zpid" value=""/>
 <!-- 当前用户id -->
<input type="hidden" name="urid" id="urid" />
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			        <ww:property value='#session.local.a00065' /> :
			        <span class="function"><ww:property value='#session.local.a00010' /></span>
			        <span class="material_bg"><ww:property value='#session.local.a00132' /></span>
			</div>
			
		</div>
</div>

<div class="c_middle">
	  <div class="s_left">
			<div class="s_left_one"  align="center">
			    <div class="sl_logo"><a href="#"><img src="./image/system_settings/admin_logo.png"/></a></div>
			    <span>admin</span>
			    <div class="dropdown_logo"><a href="#"><img src="./image/system_settings/dropdown_logo1.png" height="35px"/></a></div>
			</div>
		<div class="mainframe clearfix user_ddlist" id="mainCenter" style="color:red;">
           	<div class="mainCInLeft" style="width:225px;">
           	<div id="sidtree">
				<div align="left" style="height: 350px; width:210px; overflow:auto;">
					<ul id="leftTree" class="ztree"></ul>
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
						  <option  <ww:if test="sel==0"> selected="selected" </ww:if>   value="0"><ww:property value='#session.local.a00066' /></option>
						  <option  <ww:if test="sel==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.a00211' /></option><!-- 登录名 -->
						  <option  <ww:if test="sel==2"> selected="selected" </ww:if>   value="2"><ww:property value='#session.local.a00212' /></option><!-- 昵称 -->
		            </select>
		             
				  </div>
				  <div class="col-xs-2" style="margin-left: 25px;">
				     <input  name="ser" id="ser" class="form-control input-sm" type="text" value="<ww:property value='ser' />" style="width: 110px;" /> 
				  </div>
				  <div class="col-xs-3" style="margin-left: -28px;" >
				     	<button  onclick="seluser()" class="btn btn-sm btn-primary" type="button" style="padding: 4px 8px;"><i class="icon icon-search"></i></button>
				  </div> 
				  
			      <div class="btn-group" style="float: right;margin-right: 30px;" >
				       <button id="step1" onclick="open_user_add()"   type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00021' /></button><!-- 新增 -->
				       <button onclick="del_user()"  type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button><!-- 删除 -->
				       <button onclick="export_user()"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.d00001' /></button><!-- 导出  -->
				       <button onclick="daoitemin()" type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.d00002' /></button>
				  </div>
				  
			 </div>
			
		</div>
        <!--显示内容-->
        <div style="height: 400px;" id="showsonlist" >
             
          <!-- 固定标题 -->
           <div style="padding-right: 17px;margin:0px;">
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
           <div id="step2" style="height: 400px;overflow: auto;overflow-y:scroll;">
			<table border="0" cellpadding="0" cellspacing="0" style="margin-top:0px;margin-bottom: 0px;">
			
			<ww:iterator value="userssonlist">
			
				<tr class="cell_element cell_show">
				  
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
					    <!-- 修改 -->
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
       </div>
		
	</div>
</div>
</form>

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
		check: {
			enable: true,
			chkStyle: "radio",
			radioType: "all"
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onExpand: zTreeOnExpand,
			onCheck: zTreeOnCheck,
			onClick: function (e, treeId, treeNode, clickFlag) {
				$('#zpid').val(treeNode.id);
				$("#sidtree a").each(function(index, element) {
			        $(this).removeClass("curSelectedNode");
				});
				$('#'+treeNode.tId+'_check').removeClass("radio_false_full");
				$('#'+treeNode.tId+'_check').addClass("radio_true_full");
				$('#'+treeNode.tId+'_a').addClass("curSelectedNode");   
				zTree.checkNode(treeNode, !treeNode.checked, true);
				ztreeNode = treeNode;

				$("#ser").val("");
			    $("#sel").find("option[value=0]").attr("selected",true);
			    
			} 
		}
	};

	function zTreeOnCheck(event, treeId, treeNode) {
		$("#ser").val("");
	    $("#sel").find("option[value=0]").attr("selected",true);
		$('#zpid').val(treeNode.id);
		$("#sidtree a").each(function(index, element) {
	        $(this).removeClass("curSelectedNode");
		});
		$('#'+treeNode.tId+'_check').removeClass("radio_false_full");
		$('#'+treeNode.tId+'_check').addClass("radio_true_full");
		$('#'+treeNode.tId+'_a').addClass("curSelectedNode");
		ztreeNode = treeNode;
	}

	function zTreeOnExpand(event, treeId, treeNode) {
		loadcTree(treeNode,'ajaxsontreeuser.vs');
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
	    			uid : treeNode.id,
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
				    var json = eval(data.userlist);
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
		 	 url:'ajaxztreeroot.vs',
			 type:'post',  
		     cache:false,  
		     dataType:'json',  
		     success:function(data) {
			 	var zNodes = eval(data.userlist);
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
	});

</script>
</body>
</html>
