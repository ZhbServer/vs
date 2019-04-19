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

<style>
body,html{
width:100%;
height:95%;
margin:0px;
padding:0px;
border:0px;

font-family:Microsoft YaHei;
}
/*background-color:#134AFF;*/
/*overflow:hidden*/

a{color: #0885B8;text-decoration:none;}




</style>
<script type="text/javascript">
  

   /*确定保存节目共享*/
   function saveScshare(url){
	   var val = "";
	   var qx=document.getElementsByName('qx'); 
	   var isSel=false; 
	     for(var i=0;i<qx.length;i++) 
	     { 
	      if(qx[i].checked==true) 
	      { 
	    	  val += qx[i].value+",";
	    	  isSel=true; 
	      } 
	     } 
	     if(isSel==false) 
	     { 
	    	 layer.msg("<ww:property value='#session.local.a00018' />");
	          return ; 
	     }

	     document.form1.target = "_self";
	     document.form1.action = url+'?shareid='+val; 
     	 document.form1.submit();
   }

   /*清除节目共享*/
   function delScshare(url){
	   var val = "";
	   var qx=document.getElementsByName('qx'); 
	   var isSel=false; 
	     for(var i=0;i<qx.length;i++) 
	     { 
	      if(qx[i].checked==true) 
	      { 
	    	  val += qx[i].value+",";
	    	  isSel=true; 
	      } 
	     } 
	     if(isSel==false) 
	     { 
	    	 layer.msg("<ww:property value='#session.local.a00018' />");
	          return ; 
	     }

	     document.form1.target = "_self";
	     document.form1.action = url+'?shareid='+val; 
     	 document.form1.submit();
   }
   
</script>
</head>
<body>
 <form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			        &nbsp;&nbsp;<ww:property value='#session.local.a00065' />:
			        <span class="function"><ww:property value='#session.local.a00007' /></span>
		            <span class="function"><ww:property value='#session.local.a00609' /></span>
			        <span class="material_bg"> <ww:property value='#session.local.a00816' /></span>
			</div>
			
		</div>
</div>

<div class="c_middle download_manager">
		<div class="c_right_header" style="height: 36px;" >
			<div class="col-xs-2" style="margin-left: 965px;">
		     	<button  onclick="saveScshare('saveitemshare.vs')" class="btn btn-sm btn-primary" type="button" style="padding: 4px 8px;"><ww:property value='#session.local.a00080' /></button>
		    	<button  onclick="delScshare('delitemshare.vs')" class="btn btn-sm btn-danger" type="button" style="padding: 4px 8px;"><ww:property value='#session.local.a00670' /></button>
		    </div> 
		</div>
        <!--显示内容-->
        <div style="height: 400px;" id="showsonlist" >
             
          <!-- 固定标题 -->
           <div style="margin: 0px;">
	           <table border="0" cellpadding="0" cellspacing="0">
		            <tr class="cell_element cell_first">
						<td style="width:10%" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
						<td style="width:30%"><ww:property value='#session.local.a00212' /></td>
						<td style="width:30%"><ww:property value='#session.local.a00211' /></td>
						<td style="width:30%"><ww:property value='#session.local.a00231' /></td>
				   </tr>
			   </table>
           </div>
           
           <div style="height: 380px;width: 1070px;overflow-x: hidden;padding-left: 35px;overflow-y:scroll;">
			<table border="0" cellpadding="0" cellspacing="0" style="margin-top:-8px;margin-bottom: 0px;">
			
			<ww:iterator value="users">
			
				<tr class="cell_element cell_show">
				  <td style="width:10%" align="center"><input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/></td>
				  
				  <td style="width:30%" title="<ww:property value='name'/>">
				    
					    <ww:if test="name.length()<20">
					       <ww:property value="name"/>
					    </ww:if>
					    <ww:else>
					       <ww:property value="name.substring(0,20)"/>...
					    </ww:else>
				    
				     
				  </td>
				  <td style="width:30%" title="<ww:property value='account'/>">
				  
				        <ww:if test="account.length()<10">
				          <ww:property value="account"/>
					    </ww:if>
					    <ww:else>
					       <ww:property value="account.substring(0,10)"/>...
					    </ww:else>
				    
				  </td>
				 
				  <td style="width:30%">
				    <ww:if test="ban==0">
				       <ww:property value='#session.local.a00233' />
				    </ww:if>
				    <ww:elseif test="ban==1">
				       <ww:property value='#session.local.a00232' />
				    </ww:elseif>
				  </td>
				</tr>
			</ww:iterator>
			</table>
		  </div>
       </div>
        <!--分页-->
		<div class="nav" style="width: 1000px;margin-left:40px;margin-top: 10px;">
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'additemshare.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'additemshare.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'additemshare.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'additemshare.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'additemshare.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('toscg.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'additemshare.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
			     <a href="javascript:setpagetype(20,'additemshare.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'additemshare.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'additemshare.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			</div>
			
			<!--隐藏域 -->
            
            <!--当前页码-->
			<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
            <!--总页码-->
            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
            <!--每页显示页数-->
            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
            <!--节目Id-->
            <input type="hidden" name="itemid"  id="itemid" value="<ww:property value='itemid'/>" />
		</div>
</div>
</form>
</body>
</html>
