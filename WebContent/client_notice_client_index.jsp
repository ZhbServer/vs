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

<style>
a{text-decoration:none;}
</style>
<script type="text/javascript">
/*发送通知*/
 function open_notice(){
		layer.open({
	 		type: 2,
	         area: ['1100px', '620px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'tonoticesend.vs',
	         scrollbar: false,
	         end: function(){ 
	 		}
	 	});   
		   
        
        
  } 
  /*取消通知*/
  function unsend() {

		layer.open({
	 		type: 2,
	         area: ['1100px', '620px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'tonoticecancelsend.vs',
	         scrollbar: false,
	         end: function(){ 
	 		}
	 	});   
  }

//计划发送
  function openyynoticejh(jhid){
	    layer.open({
	 		type: 2,
	         area: ['1100px', '620px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'noticetosend.vs?jhid='+jhid,
	         scrollbar: false,
	         end: function(){ 
	 		}
	 	});   
  	
  }

	//弹出新增通知计划
	function openadnotice(){
		var jid=document.getElementById("jid").value;
		window.returnValue="";
		layer.open({
			type: 2,
		       area: ['620px', '300px'],
		       offset: '50px',
		       title:false,
		       fix: false, //不固定
		       shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		       content: 'item_jh_to_add.jsp',
		       scrollbar: false,
		       end: function(){ 
		       	   if(window.returnValue==undefined||window.returnValue==""){
					   window.returnValue=""; 
				   }else{
					    var njhname= window.returnValue;
					    layer.open({
					 		type: 2,
					         area: ['1100px', '620px'],
					         offset: '10px',
					         title:false,
					         fix: false, //不固定
					         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					         content: 'toaddnoticejh.vs?njhname='+njhname+"&jid="+jid,
					         scrollbar: false,
					         end: function(){
								document.form1.target = "_self";
								document.form1.action = "tonoticejhhandle.vs"; 
								document.form1.submit();
							}
						});
				   }               
			  }
		});
	 }
  
  //修改通知计划
  function updatenoticejh(njid,njhname){
      document.form1.target = "_self";
	  document.form1.action="tonoticejhlist.vs?njhname="+njhname+"&jid="+njid;
      document.form1.submit();
  }

  //删除通知计划
  function deletenoticejh(id){
	  layer.confirm("<ww:property value='#session.local.a00092' />?", {icon: 3, title:"<ww:property value='#session.local.a00093' />",btn: ["<ww:property value='#session.local.a00080' />","<ww:property value='#session.local.a00014' />"]}, function(index,layero){
		  	document.form1.action="delnoticejh.vs?id="+id;
		    document.form1.submit();
	   });
  }
</script>
</head>
<body>
<form  name="form1" method="post" >

<input type="hidden" name="jid" id="jid" />

<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			    	<ww:property value='#session.local.a00065' /> :
			    	<span class="function"><ww:property value='#session.local.a00534' /></span>
			        <span class="material_bg"><ww:property  value="#session.local.a00844"/></span>
			</div>
			<div class="material_show">
			
			</div>
		</div>
</div>

<div class="c_middle download_manager">
	<div class="c_right_header" style="height: 48px;">
		<div class="row">
		   <div class="btn-group" style="float: right;margin-right: 30px;">
	          <button onclick="open_notice()"   type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00158' /></button><!-- 发布通知 -->
	          <button onclick="unsend()"  type="button" class="btn btn-sm btn-primary"  ><ww:property value='#session.local.a00535' /></button><!-- 取消通知 -->
	          <button onclick="open_result_last()"  type="button" class="btn btn-sm btn-primary"  ><ww:property value='#session.local.a00420' /></button><!-- 执行结果 -->
	          <button onclick="openadnotice()" type="button" class="btn btn-sm btn-primary" style="margin-left:10px;"><ww:property value='#session.local.a00021' /></button><!-- 新增-->
	       </div>				  
		 </div>
	</div>

		<!--显示内容-->
        <div style="height: 400px;width: 1050px;margin-top: -20px;" >
          <!-- 固定标题 -->
          <div style="padding-right:17px;">
	            <table border="0" cellspacing="0" cellpadding="0">
	              <tr class="cell_element cell_first">
	              	<td width="10%" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')" id="qx"   class="check_box"/></td>
					<td style="width:40%"><ww:property value='#session.local.a00649' /></td>
					<td style="width:50%"><ww:property value='#session.local.a00016' /></td>
				  </tr>
	            </table>
            </div>
            <div style="height: 400px;overflow: auto;overflow-y:scroll;margin-top: -20px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<ww:iterator value="noticejhs">
						<tr class="cell_element cell_show">
						  <td width="10%" align="center">
					       	<input oncheckvalue="<ww:property value='ocheck' />"  type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
					   	  </td>
						  <td style="width:40%"><ww:property value='name' /></td>
						  <td style="width:50%">
						  	<span onclick="javascript:openyynoticejh('<ww:property value='id' />');" style="cursor: pointer;"><ww:property value="#session.local.a00037"  /></span>
                            &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                            <span onclick="javascript:updatenoticejh('<ww:property value='id' />','<ww:property value='name' />');" style="cursor: pointer;"><ww:property value="#session.local.a00024"  /></span>
						  	&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						  	<span onclick="javascript:deletenoticejh('<ww:property value='id' />');" style="cursor: pointer;"><ww:property value="#session.local.a00025"  /></span>
						  </td>
						</tr>
					
					</ww:iterator>
				</table>
			</div>
		</div>
        <!--分页-->
		<div class="nav" >
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'tonoticejhhandle.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'tonoticejhhandle.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'tonoticejhhandle.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'tonoticejhhandle.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'tonoticejhhandle.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('tosclist.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'tonoticejhhandle.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
			     <a href="javascript:setpagetype(20,'tonoticejhhandle.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'tonoticejhhandle.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'tonoticejhhandle.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			</div>
			
			<!--隐藏域 -->
            
            <!--当前页码-->
			<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
            <!--总页码-->
            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
            <!--每页显示页数-->
            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
            <!--素材类型-->
            <input type="hidden" name="sucai.type" value="<ww:property value="sucai.type"/>"/> 
            <!--分组-->
            <input type="hidden" name="gssi.sucaigroupid"  id="gpid" value="<ww:property value='gssi.sucaigroupid'/>"/>
		</div>
</div>

</form>
</body>
</html>
