<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="PRAGMA" content="NO-CACHE" />
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
<style type="text/css">
html,body{height:100%;}
</style>
<script type="text/javascript">


	//弹出新增通知计划
	function open_add_pro(){
		layer.open({
	 		 type: 2,
	         area: ['1000px', '500px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'item_projection_add.jsp',
	         scrollbar: false,
	         end: function(){
	         
				document.form1.target = "_self";
				document.form1.action = "toprojectionlist.vs"; 
				document.form1.submit();

			 }
		});
    }

	//修改协议
    function editPro(id){
    	
	    layer.open({
	 		 type: 2,
	         area: ['1000px', '500px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'toupprojection.vs?pid='+id,
	         scrollbar: false,
	         end: function(){ 
	         
			    document.form1.target = "_self";
				document.form1.action = "toprojectionlist.vs"; 
				document.form1.submit();

			 }
		});
    }

    /*发送台标*/
    function open_send_pro(proId){
    
   		layer.open({
   	 		type: 2,
   	         area: ['1100px', '620px'],
   	         offset: '10px',
   	         title:false,
   	         fix: false, //不固定
   	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
   	         content: 'toprosend.vs?proId='+proId,
   	         scrollbar: false,
   	         end: function(){ 
   	 		}
   	 	});   
   		   
           
           
   } 
     /*关闭台标*/
     function unsend() {
   		layer.open({
   	 		 type: 2,
   	         area: ['1100px', '620px'],
   	         offset: '10px',
   	         title:false,
   	         fix: false, //不固定
   	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
   	         content: 'totbsend.vs?tbId=-1',
   	         scrollbar: false,
   	         end: function(){
  	          
   	 		 }
   	 	});   
     }
    
    //删除协议
    function deletePro(id){

 	   	layer.confirm("<ww:property value='#session.local.a00092' />?", {icon: 3, title:"<ww:property value='#session.local.a00093' />",btn: ["<ww:property value='#session.local.a00080' />", "<ww:property value='#session.local.a00014' />"]}, function(index,layero){
	   		
	        document.form1.action="delprojection.vs?pid="+id;
	        
	        document.form1.submit();
	        
	    });
    }
    
</script>
</head>

<body>
<form  name="form1" method="post" >

<input type="hidden" name="id" id="id" />

<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			    	&nbsp;&nbsp;<ww:property value='#session.local.a00065' /> :
			    	<span ><ww:property value='#session.local.b00278' /></span>
			       
			</div>
			<div class="material_show">
			
			</div>
		</div>
</div>

<div class="c_middle download_manager">
	<div class="c_right_header" style="height: 35px;">
		<div class="row">
		   <div class="btn-group" style="float:right;margin-right: 50px;">
		   	  
<!--	          <button onclick="unsend()"  type="button" class="btn btn-sm btn-primary"  ><ww:property value='#session.local.b00216' /></button>关闭台标 -->
	          <button onclick="open_result_last()"  type="button" class="btn btn-sm btn-primary"  ><ww:property value='#session.local.a00420' /></button><!-- 执行结果 -->
			  <button onclick="open_add_pro()" type="button" class="btn btn-sm btn-success" style="margin-left:10px;"><ww:property value='#session.local.a00021' /></button><!-- 新增-->
			  
	       </div>				  
		 </div>
	</div>

		<!--显示内容-->
        <div style="height: 400px;width: 1050px;margin-left:28px;"  >
          <!-- 固定标题 -->
          <div style="padding-right:17px;margin: 0px;">
	            <table border="0" cellspacing="0" cellpadding="0" style="margin-bottom: 0px;">
	              <tr class="cell_element cell_first">
	              	
	              	<td width="20%" align="center">&nbsp;&nbsp;<input type="checkbox" id="terminal_all" onclick="cli_sc('qx')" id="qx"   class="check_box"/></td>
					
					<td style="width:50%" align="center"> <ww:property value="#session.local.a00536"/> </td><!-- 标题 -->
				
					<td style="width:30%" > <span style="margin-left: 100px;"><ww:property value="#session.local.a00016"/></span> </td> <!--操作 -->
				
					
				  </tr>
	            </table>
            </div>
            <div style="height: 390px;overflow: auto;overflow-y:scroll;">
            
				<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 0px; margin-bottom: 0px;">
					<ww:iterator value="projectionList">
						<tr class="cell_element cell_show">
						  <td width="20%" align="center">
					       	<input oncheckvalue="<ww:property value='ocheck' />"  type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
					   	  </td>
						  <td style="width:50%" align="center"><ww:property value="title" /></td>
						  
						
						  
						  <td style="width:30%" align="center">
						  
						     
                              <span title="<ww:property value='#session.local.a00421' />" onclick="open_send_pro(<ww:property value='id' />)" style="cursor: pointer;margin-right: 5px;float: left;margin-left: 90px;">
	                                <i class="icon icon-sitemap"></i>
	                          </span>
                             
                              <!--  修改 -->  
	                          <span title="<ww:property value='#session.local.a00017' />" onclick="editPro(<ww:property value='id' />)" style="cursor: pointer;margin-right: 5px;float: left;">
	                                  <i class="icon icon-edit"></i>
	                          </span>   
                             
                              <!--  删除  -->
                              <span title="<ww:property value='#session.local.a00025' />" onclick="deletePro(<ww:property value='id' />)" style="cursor: pointer;margin-right: 5px;float: left;">
	                                 <i class="icon icon-remove-sign"></i>
	                          </span>   
                             
                             
						  
						  </td>
						</tr>
					
					</ww:iterator>
				</table>
				
			</div>
		</div>
        <!--分页-->
		<div class="nav" style="width: 1000px;margin-left:20px;">
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'toprojectionlist.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'toprojectionlist.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'toprojectionlist.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'toprojectionlist.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'toprojectionlist.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('tosclist.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'toprojectionlist.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
			     <a href="javascript:setpagetype(20,'toprojectionlist.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'toprojectionlist.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'toprojectionlist.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			</div>
			
			<!--隐藏域 -->
            
            <!--当前页码-->
			<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
            <!--总页码-->
            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
            <!--每页显示页数-->
            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
            <!--分组-->
            <input type="hidden" name="gssi.sucaigroupid"  id="gpid" value="<ww:property value='gssi.sucaigroupid'/>"/>
		</div>
</div>
<input type="hidden" id="tbId"   name="tbId"/>

</form>
</body>
</html>