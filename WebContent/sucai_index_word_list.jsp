<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" href="css/index.css"/>
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript" src="zTree/3.53/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="zTree/3.53/jquery.ztree.excheck-3.5.js"></script>
<link rel="stylesheet" href="zTree/3.53/zTreeStyle.css" />

<style>
body,html{
margin:0px;
padding:0px;
border:0px;
}
/*background-color:#134AFF;*/
/*overflow:hidden*/
</style>
<script type="text/javascript">
 

var b00028="<ww:property value='#session.local.b00028'  />";
/*预览图片*/
function yulan(url){ 
     //window.open(url);
	 layer.open({
 	    type: 2,
 	    title: false,
 	    area: ['900px', '550px'],
 	    shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
 	    content: url
 	});
}


/*显示子级用户信息*/
function showsonlist(uid){
   	 var pagetype=document.getElementById("pagetype").value;
   	 var sel=document.getElementById("sel").value;
   	 var ser=document.getElementById("ser").value;
   	 var sctype=document.getElementById("sctype").value;
   	 var showtype=document.getElementById("showtype").value;
	 
   	 var url="tosclistajax.vs?gssi.sucaigroupid="+uid+"&sucai.type="+sctype+"&showtype="+showtype+"&sel="+sel+"&ser="+ser+"&id=1&pagetype="+pagetype;
   	 getPart(url, 'showsonlist'); 		 
} 

/*修改素材名*/
function edit_name(id){	
	layer.open({
  		type: 2,
          area: ['500px', '200px'],
          offset: '30px',
          title:false,
          fix: false, //不固定
          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
          content: 'toselscnames.vs?id='+id,
          scrollbar: false,
          end: function(){ 		 
			var id=1;
			var pagetype=document.getElementById("pagetype").value;//每页显示页数
			var sel=document.getElementById("sel").value;
			var ser=document.getElementById("ser").value;	 	  	
			var gssi=document.getElementById("gpid").value;
			var type=document.getElementById("sctype").value;
	
			var url="tosclistajax.vs?gssi.sucaigroupid="+gssi+"&sucai.type="+type+"&sel="+sel+"&ser="+ser+"&id="+id+"&pagetype="+pagetype; 
		   	getPart(url, 'showsonlist'); 					   		   	 		   	     
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
			       <ww:property value='#session.local.a00065' /> :<span class="function"><ww:property value='#session.local.a00007' /></span><span class="material_bg">Word</span>
			</div>
			<div class="material_show">
			
			</div>
		</div>
</div>

<div class="c_middle">
    
    <!--分组-->
    <div class="c_left">
	  	<div align="left" >
	  		<ul id="leftTree" class="ztree" style="height: 530px;overflow: auto;"></ul>
		</div>
		<div id="rMenu">
			<ul style="margin:5px;padding:0px;">
				<li style="cursor:pointer;" id="g_add"><ww:property value='#session.local.a00990' /></li>
				<li style="cursor:pointer;" id="g_rename"><ww:property value='#session.local.a00991' /></li>
				<li style="cursor:pointer;" id="g_del"><ww:property value='#session.local.a00992' /></li>
			</ul>
		</div>
	</div>
	
    <!--素材菜单-->
	<div class="c_right" >
		<div id="showsonlist">
		<div class="c_right_header" >
		     <div class="row">
			     <div class="col-xs-1">
				    <select  id="sel" name="sel"  class="form-control input-sm" style="width: 90px;" >
						  <option  <ww:if test="sel==0"> selected="selected" </ww:if>   value="0"><ww:property value='#session.local.a00066' /></option>
						  <option  <ww:if test="sel==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.a00071' /></option>
						  <option  <ww:if test="sel==2"> selected="selected" </ww:if>   value="2"><ww:property value='#session.local.a00068' /></option>
		            </select>
		             
				  </div>
				  <div class="col-xs-2" style="margin-left: 25px;">
				     <input  name="ser" id="ser" class="form-control input-sm" type="text" value="<ww:property value='ser' />" style="width: 110px;" /> 
				  </div> 
				  <div class="col-xs-3" style="margin-left: -28px;" >
				     	<button  onclick="selsc('tosclist.vs')" class="btn btn-sm btn-primary" type="button" style="padding: 4px 8px;"><i class="icon icon-search"></i></button>
				  </div> 
				  
				  <div class="col-xs-4" style="margin-left: -120px;">
				     	<button class="btn btn-sm btn-primary" onclick="replace_sucai_list('tosclist.vs?sucai.type=7&pagetype=12&showtype=2')" type="button"><ww:property value='#session.local.a00070' /></button>
				  		<ww:if test="isSelf!=0">
				  		     <button onclick="add_share('addshare.vs',7)"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00816' /></button>
				  		</ww:if>
				  </div> 
				  
				  <ww:if test="isSelf!=0">
				   <div class="btn-group" style="float: right;margin-right: 30px;">
					  <button onclick="openUpload('upword.jsp',7)"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00063' /></button>
					  <button onclick="del_sucai('delsc.vs')"       type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button>
			       </div>
			       </ww:if>				  
			 </div>
		     
		</div>
        <!--显示内容-->
        <div style="height: 400px;" >
            <!-- 固定标题 -->
            <div style="padding-right:17px;">
                <table border="0" cellpadding="0" cellspacing="0">
					<tr class="cell_element cell_first">
					<td style="width:10%"  align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
					<td style="width:30%" ><ww:property value='#session.local.a00071' /></td>
					<td style="width:10%" ><ww:property value='#session.local.a00072' /></td>
					<td style="width:10%" ><ww:property value='#session.local.a00026' /></td>
					<td style="width:20%" ><ww:property value='#session.local.a00073' /></td>
					<td style="width:20%" ><ww:property value='#session.local.a00068' /></td>
					</tr>
				 </table>	
            </div>
            <div style="height: 400px;overflow: auto;overflow-y:scroll;">
				<table border="0" cellpadding="0" cellspacing="0">
				
					<ww:iterator value="listsc">
					
						<tr class="cell_element cell_show">
						  <td style="width:10%" align="center"><input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/></td>
						  <td style="width:30%" title="<ww:property value='name' />">
				  
						  <span style="float: left;">			   
						  <ww:if test="name.length()>18"><ww:property  value="name.substring(0,17)"/>...</ww:if>
						  <ww:else><ww:property value='name' /></ww:else>			     
						  </span>
						  <!-- 修改 -->
						  <i title="<ww:property value='#session.local.a00017' />" style="padding: 4px 5px;cursor: pointer;float: left;"  class="icon icon-edit" onclick="edit_name(<ww:property value='id' />)"  ></i>		          				  				  
						
						 </td>
						  <td style="width:10%" ><ww:property value="size"/>M</td>
						  <td style="width:10%" >
						    <a href="javascript:yulan('seepics.vs?scid=<ww:property value='id' />');" class="pre_pic">
						  	<img width="40" height="25" src="files/<ww:property value="filename" />/1.png"  alt="<ww:property value='#session.local.a00026' />"/>
						  	<div class="zoom"></div></a>
						  </td>
						  <td style="width:20%" ><ww:property value="sdate"/></td>
						  <td style="width:20%" >
							<ww:if test="urid==0">
						  		<ww:property value='#session.local.a00848' />
						  	</ww:if>
						  	<ww:else>
						  		<ww:property value="user"/>
						  	</ww:else>
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
				<li><a href="javascript:pageto_sc(<ww:property value='qian' />,'tosclistajax.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto_sc(<ww:property value='#q'/>,'tosclistajax.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto_sc(<ww:property value='#request.id'  />,'tosclistajax.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto_sc(<ww:property value='#h'/>,'tosclistajax.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto_sc(<ww:property value='hou' />,'tosclistajax.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('tosclist.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype_sc(10,'tosclistajax.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
			     <a href="javascript:setpagetype_sc(20,'tosclistajax.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype_sc(30,'tosclistajax.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype_sc(-1,'tosclistajax.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			</div>
			
			<!--隐藏域 -->
            
            <!--当前页码-->
			<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
            <!--总页码-->
            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
            <!--每页显示页数-->
            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
            <!--素材类型-->
            <input type="hidden" name="sucai.type" id="sctype" value="<ww:property value="sucai.type"/>"/> 
            <!--分组-->
            <input type="hidden" name="gssi.sucaigroupid"  id="gpid" value="<ww:property value='gssi.sucaigroupid'/>"/>
            <!--页面显示类型 -->
            <input type="hidden" name="showtype"  id="showtype" value="1"/>
            <!--树id-->
			<input type="hidden" name="treeid"  id="treeid" value=""/>
			</div>
		</div>
	</div>
</div>

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
//		check: {
//			enable: true,
//			chkStyle: "radio",
//			radioType: "all"
//		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onExpand: zTreeOnExpand,
			onRightClick: onRightClick,
//				onCheck: zTreeOnCheck
			onClick: function (e, treeId, treeNode, clickFlag) {
				$('#treeid').val(treeNode.id);
			}
		}
	};

//	function zTreeOnCheck(event, treeId, treeNode) {
//		$('#zpid').val(treeNode.id+","+treeNode.level);
//	}

	function onRightClick(event, treeId, treeNode) {
		$('#treeid').val(treeNode.id);
		ztreeNode = treeNode;
        showRMenu(treeNode,{x:event.clientX, y:event.clientY});
	}

	function zTreeOnExpand(event, treeId, treeNode) {
		loadcTree(treeNode,'ajaxscsonztreerootaction.vs');
	};

	//查询下级树
	function loadcTree(treeNode,url){
		if (checkLoad(treeNode.tId)){
			return;
		}
	    $.ajax({
		 	 url:url,
			 data:{
	    			cgid : treeNode.id,
	    			sctype : $('#sctype').val()
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
				    var sos = "";
				    var json = eval(data.sclist);
				    for(var i=0; i<json.length; i++)
				    {
				    	id = json[i].id;
					    areaName = json[i].name;
					    pId = json[i].pid;
					    click = json[i].click;
					    isParent = json[i].isParent;
					    sos = json[i].sos;
				    	var newNode = {id:id,name:areaName,pId:pId,click:click,isParent:isParent,sos:sos};
						newNode = zTree.addNodes(treeNode, newNode);
				    }
				 }
		 });
	}

	//创建ztree树  
	function  getTree(){
		$.ajax({
		 	 url:'ajaxscztreerootaction.vs',
			 type:'post',  
		     cache:false,  
		     dataType:'json',  
		     success:function(data) {
			 	var zNodes = eval(data.sclist);
			 	$.fn.zTree.init($("#leftTree"), setting, zNodes);
				zTree = $.fn.zTree.getZTreeObj("leftTree");
				var nodes = zTree.getNodes();
				loadcTree(nodes[0],'ajaxscsonztreerootaction.vs');
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

		if(type.tId == "leftTree_2" || type.tId == "leftTree_3"){
			hideRMenu();
		}else if(type.tId == "leftTree_1") {
			$("#g_add").show();
			$("#g_rename").hide();  
	        $("#g_del").hide();
		}else if(type.sos == "1") {
			hideRMenu();
		}else{
			$("#g_add").hide();  
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
		 var sctype;
		 if ($('#treeid').val() == '') {
			    layer.msg("<ww:property value='#session.local.a00451' />!");
				return;
		 }else{
			 tid = $('#treeid').val();
			 sctype = $('#sctype').val();
			 layer.open({
		 		type: 2,
		         area: ['500px', '200px'],
		         offset: '50px',
		         title:false,
		         fix: false, //不固定
		         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		         content: 'sucai_group_add.jsp?tid='+tid+"&sctype="+sctype,
		         scrollbar: false,
		         end: function(){ 
				     if(window.returnValue==undefined||window.returnValue==""){
					       window.returnValue=""; 
				     }else{
				    	 window.returnValue="";
				    	 zTree.removeChildNodes(ztreeNode);
				    	 groupArray = new Array();
					     loadcTree(ztreeNode,'ajaxscsonztreerootaction.vs');
				     }     
		 		}
		 	});
		 }
		 hideRMenu();
	}

	function updated(){
		 var tid;
		 var sctype;
		 if ($('#treeid').val() == '') {
			    layer.msg("<ww:property value='#session.local.a00451' />!");
				return;
		 }else{
			 if($('#treeid').val() == '0'){
				layer.msg("<ww:property value='#session.local.a00986' />!");
				return;
			 }else{
				tid = $('#treeid').val();
				sctype = $('#sctype').val();
				layer.open({
			 		type: 2,
			         area: ['500px', '200px'],
			         offset: '50px',
			         title:false,
			         fix: false, //不固定
			         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
			         content: 'toeditscg.vs?scgid='+tid+"&type="+sctype,
			         scrollbar: false,
			         end: function(){ 
					   if(window.returnValue==undefined||window.returnValue==""){
						    window.returnValue=""; 
					   }else{
						    ztreeNode.name = window.returnValue;
						   	zTree.updateNode(ztreeNode);
						   	window.returnValue=""; 
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
		var sctype;
		 if ($('#treeid').val() == '') {
			    layer.msg("<ww:property value='#session.local.a00451' />!");
				return;
		 }else{
			 tid = $('#treeid').val();
			 sctype = $('#sctype').val();
		 }
		 if(tid=="0"){
		   layer.msg("<ww:property value='#session.local.b00052' />!");
	       return;
	     };
		
		layer.confirm("<ww:property value='#session.local.a00995' />,<ww:property value='#session.local.a00092' />?", {icon: 3, title:"<ww:property value='#session.local.a00093' />",btn: ["<ww:property value='#session.local.a00080' />", "<ww:property value='#session.local.a00014' />"]}, function(index,layero){
			$.ajax({
			 	 url:'delscgtree.vs?tid='+tid+"&type="+sctype,
				 type:'post',  
			     cache:false,  
			     dataType:'json',  
			     success:function(data) {
				 	zTree.removeNode(ztreeNode);
				 	showsonlist(0);
				 }
			});
			layer.closeAll('dialog');
	    });
		hideRMenu();
	}
</script>
</form>
</body>
</html>
