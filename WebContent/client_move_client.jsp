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

<script type="text/javascript" src="../zTree/3.5/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="../zTree/3.5/jquery.ztree.excheck-3.5.js"></script>
<link rel="stylesheet" href="../zTree/3.5/zTreeStyle.css" />

<style>
a{text-decoration:none;}
a:hover{ background:#007ccd;}
</style>
<script type="text/javascript">


/*移动终端*/
function client_move(){

	 if ($('#curruserid').val() == '') {
	    layer.msg("<ww:property value='#session.local.a00451' />!");
		return;
	 }
	 document.form1.action = "clientmove.vs";
     document.form1.submit();            
} 






 
 
  	 
</script>
</head>
<body>
 <form  name="form1" method="post" >
 
 <!--父级id-->
<input type="hidden" name="curruserid"  id="curruserid" value=""/>
 
<div class="title bottom">
		<div>
			<div class="loc">
		        <span class="material_bg">&nbsp;&nbsp;<ww:property value='#session.local.a00451' /></span>
			</div>
		</div>
</div>

<div style="width: 300px;height: 300px;">
	<div id="sidtree">
		<div style="width: 300px;height: 300px;overflow:auto;">
			<div align="left" >
				<ul id="leftTree" class="ztree"></ul>
			</div>
		</div>
	</div>
</div>
<div class="btn-group" style="margin-left: 125px;padding-top:10px;">
    <button  onclick="client_move()" class="btn btn-sm btn-primary" type="button"><ww:property value='#session.local.a00080' /></button>
</div>

<input type="hidden"  name="cidsstr" value="<ww:property value='cidsstr' />"/>
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
				$('#curruserid').val(treeNode.id+","+treeNode.level);
				$("#sidtree a").each(function(index, element) {
			        $(this).removeClass("curSelectedNode");
				});
				$('#'+treeNode.tId+'_check').removeClass("radio_false_full");
				$('#'+treeNode.tId+'_check').addClass("radio_true_full");
				$('#'+treeNode.tId+'_a').addClass("curSelectedNode");   
				zTree.checkNode(treeNode, !treeNode.checked, true);   
			}
		}
	};

	function zTreeOnCheck(event, treeId, treeNode) {
		$('#curruserid').val(treeNode.id+","+treeNode.level);
		$("#sidtree a").each(function(index, element) {
	        $(this).removeClass("curSelectedNode");
		});
		$('#'+treeNode.tId+'_check').removeClass("radio_false_full");
		$('#'+treeNode.tId+'_check').addClass("radio_true_full");
		$('#'+treeNode.tId+'_a').addClass("curSelectedNode");
	}

	function zTreeOnExpand(event, treeId, treeNode) {
		if (checkLoad(treeNode.tId)){
			return;
		}
		$('#'+treeNode.tId+'_ico').removeClass("ico_open");
		$('#'+treeNode.tId+'_ico').addClass("ico_loading");
	    $.ajax({
		 	 url:'ajaxsontree.vs',
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
