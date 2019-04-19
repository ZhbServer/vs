<%@page import="com.vshow.control.tool.Constant"%>
<%@page import="com.vshow.control.data.ClientGroup3"%>
<%@page import="com.vshow.control.data.ClientGroup2"%>
<%@page import="com.vshow.control.data.ClientGroup1"%>
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
<link rel="stylesheet" href="../zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript" src="../zTree/3.51/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="../zTree/3.51/jquery.ztree.excheck-3.5.js"></script>
<link rel="stylesheet" href="../zTree/3.51/zTreeStyle.css" />
<style>
a{text-decoration:none;}
a:hover{ background:#007ccd;}
</style>
<script type="text/javascript">

//分配终端
function cleint_fp(){
	

	 var zTreeO =  $.fn.zTree.getZTreeObj("leftTree").getCheckedNodes(true);

	 var idListStr = "";  
	  
	 for (var i = 0; i < zTreeO.length; i++) { 
		
	      if (zTreeO[i].id != null) {  
	          idListStr+= (i == (zTreeO.length-1))?zTreeO[i].id:zTreeO[i].id+",";  
	      }  
	 };  

	if(idListStr==""){
		 layer.msg("<ww:property value='#session.local.a00452' />!");
		 return;

    }
	document.form1.action="fpclientuser.vs?curruserids="+idListStr;
	document.form1.submit(); 
	
}
//取消分配
function cleint_un_fp(){
	
	 var zTreeO =  $.fn.zTree.getZTreeObj("leftTree").getCheckedNodes(true);

	 var idListStr = "";  

	 //alert("<ww:property value='#session.urid' />"); 
	 for (var i = 0; i < zTreeO.length; i++) { 

		 
	      if (zTreeO[i].id != null) {  
		     
              if(zTreeO[i].id=="<ww:property value='#session.urid' />"){

            	  layer.alert("<ww:property value='#session.local.b00346' />");
            	  return;
			  }
			  
	          idListStr+= (i == (zTreeO.length-1))?zTreeO[i].id:zTreeO[i].id+",";  
	      }  
	 };  

	if(idListStr==""){
		 layer.msg("<ww:property value='#session.local.a00452' />!");
		 return;

    }

	document.form1.action="unfpclientuser.vs?curruserids="+idListStr;
	document.form1.submit(); 
	
}

function  selectUser(){
	
	document.form1.action="tofpclientuser.vs";
	document.form1.submit(); 
	
}

</script>
</head>
<body>
 <form  name="form1" method="post" >
 
 <!--父级id-->
<input type="hidden" name="zpid"  id="zpid" value=""/>
<!--选中用户-->
<input type="hidden" name="cidsstr"  id="cidsstr" value="<ww:property value='cidsstr'/>" />
 
<div class="title bottom">
		<div>
			<div class="loc">
			     <span class="material_bg">&nbsp;&nbsp;<ww:property value='#session.local.a00452' /></span>
			     
			     <input  name="checkUserName"  type="text" style="width: 120px"/>
			    
			     <button onclick="selectUser()"  class="btn btn-sm btn-primary" type="button"><ww:property value='#session.local.a00263' /></button>
			</div>
		</div>
</div>

<div style="width: 300px;height:300px;">
	<div id="sidtree">
		<div style="width: 300px;height: 300px;overflow:auto;">
			<div align="left" >
				<ul id="leftTree" class="ztree"></ul>
			</div>
		</div>
	</div>
</div>
<div style="margin-left: 100px;padding-top:10px;">
    <button  onclick="cleint_fp()" class="btn btn-sm btn-primary" type="button"><ww:property value='#session.local.a00080' /></button>
  	<button  onclick="cleint_un_fp()" class="btn btn-sm btn-primary" type="button"><ww:property value='#session.local.a00456' /></button>
</div>

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
		check: {
			  enable: true,  
              nocheckInherit: false,
              chkboxType : { "Y" : "", "N" : "" }
			
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
				//$('#'+treeNode.tId+'_check').removeClass("radio_false_full");
				//$('#'+treeNode.tId+'_check').addClass("radio_true_full");
				//$('#'+treeNode.tId+'_a').addClass("curSelectedNode");   
				//zTree.checkNode(treeNode, !treeNode.checked, true);
				ztreeNode = treeNode;
			} 
						
		}
	};

	function zTreeOnCheck(event, treeId, treeNode) {
		$('#zpid').val(treeNode.id);
		$("#sidtree a").each(function(index, element) {
	        $(this).removeClass("curSelectedNode");
		});
		//$('#'+treeNode.tId+'_check').removeClass("radio_false_full");
		//$('#'+treeNode.tId+'_check').addClass("radio_true_full");
		//$('#'+treeNode.tId+'_a').addClass("curSelectedNode");
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
				    	var newNode = {id:id,name:areaName,pId:pId,click:click,isParent:isParent,nocheck:false};
						newNode = zTree.addNodes(treeNode, newNode);
				    }
				    $('#'+treeNode.tId+'_ico').removeClass("ico_loading");
					$('#'+treeNode.tId+'_ico').addClass("ico_open");
				 }
		 });
	}

	//创建ztree树  
	function  getTree(){
		var urid="<ww:property value='urid' />";
		$.ajax({
		 	 url:'ajaxztreeroot.vs?urid='+urid,
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
	$(document).ready(function(){
		getTree();		
	});

</script>
</body>
</html>
