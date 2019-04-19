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
<link rel="stylesheet"  href="../css/index.css"  type="text/css" />
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="../js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="../js/two_menu.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="../js/fresh.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="../js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<script type="text/javascript" src="../js/<ww:property value='#session.local.a00000' />/common.js"></script>

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="../zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript" src="zTree/3.5/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="zTree/3.5/jquery.ztree.excheck-3.5.js"></script>
<link rel="stylesheet" href="zTree/3.5/zTreeStyle.css" />
<script type="text/javascript" src="../zTree/3.5/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="../zTree/3.5/jquery.ztree.excheck-3.5.js"></script>
<link rel="stylesheet" href="../zTree/3.5/zTreeStyle.css" />

<script type="text/javascript">
  

/*弹出新增终端分组*/
function open_cg1_add(){

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
	     }
	 }
	
	layer.open({
 		type: 2,
         area: ['500px', '200px'],
         offset: '50px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: '../client_group_add.jsp?tid='+tid+"&lid="+lid,
         scrollbar: false,
         end: function(){ 
		     if(window.returnValue==undefined||window.returnValue==""){
			       window.returnValue=""; 
		     }else{
				   document.form1.target = "_self";
				   document.form1.action = "seecglist.vs"; 
				   document.form1.submit();
		     }     
 		}
 	});            
} 

/*弹出修改分组名*/
function open_cg1_edit(){

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
	     }
	 }
	 
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
			   document.form1.target = "_self";
			   document.form1.action = "seecglist.vs"; 
			   document.form1.submit();
		   }     
 		}
 	});        
} 

/*删除分组*/
function del_cg(){
	
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
	
	layer.confirm("<ww:property value='#session.local.a00245' />,<ww:property value='#session.local.a00092' />?", {icon: 3, title:"<ww:property value='#session.local.a00093' />",btn: ["<ww:property value='#session.local.a00080' />", "<ww:property value='#session.local.a00014' />"]}, function(index,,layero){
	     document.form1.target = "_self";
	     document.form1.action= "delcg.vs?tid="+tid;
	     document.form1.submit();
    });
}

/*返回终端分组页面*/
function go_clientlist(){
	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
    window.parent.layer.close(index);
}

</script>
</head>
<body>
 <form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container" >
			<div class="loc">
			        <ww:property value='#session.local.a00065' /> :
			        <span class="function"><ww:property value='#session.local.a00240' /></span>
			        <span class="material_bg"><ww:property value='#session.local.a00155' /></span>
			</div>
		</div>
</div>

<div class="c_middle" style="width: 600px;    min-width: 600px;">
	<div>
	    <div class="c_right_header" >
			 <div>
		         <div class="btn-group" style="float: right;margin-right: 30px;">
					  <button onclick="open_cg1_add()"        type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00021' /></button><!-- 新增-->
					  <button onclick="open_cg1_edit()"        type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00017' /></button><!-- 修改-->
			          <button onclick="del_cg()"  type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button><!-- 删除 -->			      
					  <button onclick="go_clientlist()" type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00014' /></button><!-- 返回-->
			       </div>	
		      
		      </div>
		</div>
        <!--显示内容-->
        <div class="s_left" style="width: 400px;height: 340px;margin-left: 150px;" id="sidtree">
			<div align="left" >
				<ul id="leftTree" class="ztree"></ul>
			</div>
		</div>
	</div>
</div>
<!--父级id-->
<input type="hidden" name="treeid"  id="treeid" value=""/>
<!--级别-->
<input type="hidden" name="levelid"  id="levelid" value=""/>
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
				$('#treeid').val('');
				$('#levelid').val('');
				$('#treeid').val(treeNode.id);
				$('#levelid').val(treeNode.level);
			
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
		$('#treeid').val('');
		$('#levelid').val('');
		$('#treeid').val(treeNode.id);
		$('#levelid').val(treeNode.level);

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
