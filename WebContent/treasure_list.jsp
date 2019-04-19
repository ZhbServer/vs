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

function openadtreasurefb(){

	var ids=document.getElementsByName('qx'); 
	var isSel=false; 
	var tids="";
	for(var i=0;i<ids.length;i++) 
    { 
      if(ids[i].checked==true) 
      { 
         //var iocheck=ids[i].getAttribute("oncheckvalue");
         //if(iocheck=="<ww:property value='#session.local.c00020' />"||iocheck=="<ww:property value='#session.local.c00021' />"){
          //  layer.msg("<ww:property value='#session.local.c00044' />"); 
          //  return; 
         //} 
         if(tids.length==0){
        	 tids=ids[i].value;
         }
      } 
    } 
    if(tids.length==0) 
    {     
       layer.msg("<ww:property value='#session.local.c00029' />"); 
       return ; 
    }
	
	 layer.open({
			type: 2,
	        area: ['1150px', '615px'],
	        offset: '10px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content:'tofbtreasure.vs?tids='+tids+"&fbtype=2",	       
	        scrollbar: false,
	        end: function(){ 
			         
			}
	 });
	  
}
//撤销
function revokedtreasure(){
	var ids=document.getElementsByName('qx'); 
	var isSel=false; 
	var tids="";
	for(var i=0;i<ids.length;i++) 
    { 
      if(ids[i].checked==true) 
      {        
         if(tids.length==0){
        	 tids=ids[i].value;
         }
      } 
    } 
    if(tids.length==0) 
    {     
       layer.msg("<ww:property value='#session.local.c00029' />"); 
       return ; 
    }
	
	 layer.open({
			type: 2,
	        area: ['1150px', '615px'],
	        offset: '10px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content:'torevokedtreasure.vs?tids='+tids+"&fbtype=2",	       
	        scrollbar: false,
	        end: function(){ 
			         
			}
	 });	  	
}

//弹出新增
function openadtreasure(){				
	layer.open({
 		type: 2,
         area: ['1000px', '550px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'toaddtreasure.vs',
         scrollbar: false,
         end: function(){
         
			document.form1.target = "_self";
			document.form1.action = "totreasurelist.vs"; 
			document.form1.submit();

		 }
	});
   }

//修改
  function edit_treasure(id){  		
   layer.open({
		type: 2,
        area: ['1000px', '550px'],
        offset: '10px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: 'toedittreasure.vs?id='+id,
        scrollbar: false,
        end: function(){ 
        
    	var names=window.returnValue;		           	           
           $('#item').val(names); 
           document.form1.target = "_self";   	 
       	document.form1.action = "totreasurelist.vs";
       	document.form1.submit(); 
    	
		}
	});
}
  
   //删除
function deletetreasure(id){
	layer.confirm("<ww:property value='#session.local.a00092' />?", {icon: 3, title:"<ww:property value='#session.local.a00093' />",btn: ["<ww:property value='#session.local.a00080' />", "<ww:property value='#session.local.a00014' />"]}, function(index,layero){	   		
     document.form1.action="deltreasurelist.vs";
     document.form1.submit();
 });
}

//审核0启用1禁用
 function ocheckqy(otype){
 	 var ids=document.getElementsByName('qx');
      var isSel=false; 
      var otypes=null;
 	  for(var i=0;i<ids.length;i++) 
 	   { 
 	    if(ids[i].checked==true) 
 	    { 
 	    isSel=true; 
 	     break; 
 	    } 
 	   } 
 	   if(isSel==false) 
 	   { 
 	    layer.msg("<ww:property value='#session.local.c00029' />"); 
 	    return; 
 	   }
 	   if (otype==0) {
 		   otypes="<ww:property value='#session.local.c00034' />";
}
 	   if (otype==1) {
 		   otypes="<ww:property value='#session.local.c00035' />";
}
        document.form1.action="oncheckban.vs?ban="+otypes;
 	   document.form1.submit();
 }
 //活动详情
function treasure_info(id){
	 layer.open({
		type: 2,
		area: ['1100px', '600px'],
        offset: '20px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: "seetreasureinfo.vs?id="+id,
        scrollbar: false,
        end: function(){ 
    	   
		}
	 }); 
}
//选中宝箱活动
function onclicktreasure(){	

	$("#treasurelist").find('input[type=checkbox]').bind("click", function(){ 
        //当前的checkbox是否选中
        if(this.checked){
            //除当前的checkbox其他的都不选中
            $("#treasurelist").find('input[type=checkbox]').not(this).attr("checked", false); 
        }
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
			    	<span class="function"><ww:property value='#session.local.c00036' /></span>
			        <span class="material_bg"><ww:property value='#session.local.c00037' /></span>
			</div>
			<div class="material_show">
			
			</div>
		</div>
</div>

<div class="c_middle download_manager">
	<div class="c_right_header" style="height: 35px;">
		<div class="row">
			     
			      <div class="col-xs-1">				    
			            <select  id="sel" name="sel"  class="form-control input-sm" style="width: 90px;" >
			               <option  <ww:if test="sel==0"> selected="selected" </ww:if>   value="0"><ww:property value='#session.local.a00066' /></option>
						   <option  <ww:if test="sel==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.c00016' /></option>				  
						   <option  <ww:if test="sel==2"> selected="selected" </ww:if>   value="2"><ww:property value='#session.local.c00038' /></option>	
						   <option  <ww:if test="sel==3"> selected="selected" </ww:if>   value="3"><ww:property value='#session.local.c00017' /></option>					 
					    </select>  		             
				  </div>
				  
				  <div class="col-xs-2" style="margin-left: 25px;">
				        <input  name="ser" id="ser" class="form-control input-sm" type="text" value="<ww:property value='ser' />"/>
				  </div> 
				  
				  <div class="col-xs-3" style="margin-left: -28px;width:50px;" >
				     	<button  onclick="selsc('totreasurelist.vs')" class="btn btn-sm btn-primary" type="button" style="padding: 4px 8px;"><i class="icon icon-search"></i></button>
				  </div>
				  				  			    				  
				  <div class="btn-group" style="float: right;margin-right: 30px;">
					 <button style="cursor: pointer;" onclick="revokedtreasure()"  type="button" class="btn btn-sm btn-danger">撤销</button>	<!-- 撤销 -->			  									   	  				   	  				   	  				 
				 		&nbsp;
					 <button onclick="deletetreasure('delitem.vs')"  type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button><!-- 删除 -->			     	
			     </div> 
			      
			      <div class="btn-group" style="float: right;margin-right: 5px;">
			          &nbsp;
					  <button onclick="ocheckqy(0)"   style="margin-left: 20px;"    type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00766' /></button>
					   &nbsp;
					  <button style="cursor: pointer;" onclick="ocheckqy(1)"   type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00231' /></button>
			   	  </div>
				  				 			       
			       <div style="float: right;margin-right: 5px;">
			       	 <button style="cursor: pointer;" onclick="openadtreasurefb()"  type="button" class="btn btn-sm btn-success" id="step3"><ww:property value='#session.local.a00394' /></button>				     								      
				       &nbsp;				      
				     <button style="cursor: pointer;" onclick="openadtreasure()"  type="button" class="btn btn-sm btn-success" id="step1"><ww:property value='#session.local.a00021' /></button>
				  </div>				   				   
					   	  		  				   				  
		</div>
	</div>

		<!--显示内容-->
        <div style="height: 400px;width: 1050px;margin-left: 28px;"  >
          <!-- 固定标题 -->
          <div style="padding-right:17px;margin: 0px;">
	            <table border="0" cellspacing="0" cellpadding="0" style="margin-bottom: 0px;">
	              <tr class="cell_element cell_first">
	              
	              	<!--<td width="10%" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')" id="qx"   class="check_box"/></td>	
					-->
					
					<td width="10%" align="center"><ww:property value='#session.local.a00330' /></td>
					<td style="width:10%" align="center"><ww:property value='#session.local.c00016' /></td>
					<td style="width:10%" align="center"><ww:property value='#session.local.c00039' /></td>
					<td style="width:10%" align="center"><ww:property value='#session.local.c00017' /></td>
					<td style="width:20%" align="center"><ww:property value='#session.local.c00026' /></td>
					<td style="width:20%" align="center"><ww:property value='#session.local.c00027' /></td>								
					<td style="width:20%" align="center"><ww:property value='#session.local.a00016' /></td>											
				  </tr>
	            </table>
            </div>
            <div style="height: 390px;overflow: auto;overflow-y:scroll;" id="treasurelist">
				<table border="0" cellpadding="0" cellspacing="0" style="margin-top: 0px; margin-bottom: 0px;">
					<ww:iterator value="Tres">
						<tr class="cell_element cell_show">
						  <td width="10%" align="center">
					       	<input onclick="onclicktreasure()" oncheckvalue="<ww:property value='onStatus' />"  type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
					   	  </td>
						  <td style="width:10%" align="center"><ww:property value="treasureName" /></td>
						  <td style="width:10%" align="center">						  
						  <ww:property value="ban" />						  												  					  
						  </td>
						  <td style="width:10%" align="center">						  
						   <ww:property value="onStatus" />								 						  						  
						  </td>
						   <td style="width:20%" align="center"><ww:property value="onTime" /></td>
						  <td style="width:20%" align="center"><ww:property value="offTime" /></td>
						 						 						  
						  <td style="width:20%" align="center">
						  
						  		<!-- 预览 -->
						  		<!--
							  	 <span title="<ww:property value='#session.local.a00026' />" onclick="treasure_preview('seetreasurecode.vs?id=<ww:property value='id' />')" style="cursor: pointer;margin-right: 5px;float: left;margin-left: 70px;">						  	    
							  	     <i class="icon icon-eye-open"></i>							  	   
							  	 </span>
						   		-->
						   		<!-- 详情 -->
							  	 <span title="<ww:property value='#session.local.a00752' />" onclick="treasure_info(<ww:property value='id'/>)" style="cursor: pointer;margin-right: 5px;float: left;margin-left: 80px;">						  	    
							  	     <i class="icon icon-list-alt"></i>							  	   
							  	 </span>							  	 
							  	 <!--  修改 --> 
							  	 <span title="<ww:property value='#session.local.a00017' />" onclick="edit_treasure(<ww:property value='id'/>)" style="cursor: pointer;margin-right: 5px;float: left;">
	                                  <i class="icon icon-edit"></i>
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
				<li><a href="javascript:pageto(<ww:property value='qian' />,'totreasurelist.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'totreasurelist.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'totreasurelist.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'totreasurelist.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'totreasurelist.vs');" class="pg_e"></a></li>
			</ul>
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'totreasurelist.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
			     <a href="javascript:setpagetype(20,'totreasurelist.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'totreasurelist.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'totreasurelist.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
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
<input type="hidden" id="jid" value="<ww:property value='jid'  />"  name="jid"/>
<input type="hidden" id="nid" value="<ww:property value='nid'  />"  name="nid"/>
<input type="hidden" id="njhname" value="<ww:property value='njhname'  />"  name="njhname"/>
</form>
</body>
</html>