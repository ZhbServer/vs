<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" href="../css/index.css"/>
<script type="text/javascript" src="../js/jq/jquery.js"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>
<script type="text/javascript" src="../js/two_menu.js"></script>
<script type="text/javascript" src="../js/fresh.js"></script>
<script type="text/javascript" src="../js/constant.js"></script>
<script type="text/javascript" src="../js/<ww:property value='#session.local.a00000' />/common.js"></script>



<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="../zui-1.5.0-dist/dist/css/zui.min.css" />


<script type="text/javascript">
  





//分配终端
function cleint_fp(){
	var ids=document.getElementsByName('qx'); 
    var isSel=false; 
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
	    layer.msg("<ww:property value='#session.local.a00414' />"); 
	    return ; 
	   }
	document.form1.action="fpclientuser.vs";
	document.form1.submit(); 
	
}
//取消分配
function cleint_un_fp(){
	var ids=document.getElementsByName('qx'); 
    var isSel=false; 
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
	    layer.msg("<ww:property value='#session.local.a00414' />"); 
	    return ; 
	   }
	document.form1.action="unfpclientuser.vs";
	document.form1.submit(); 
	
}
 
</script>
</head>
<body>
 <form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
<!--			       <ww:property value='#session.local.a00405' /> :-->
<!--			        <span class="function"><ww:property value='#session.local.a00404' /></span>-->
			        <span class="material_bg">&nbsp;&nbsp;<ww:property value='#session.local.a00413' /></span>
			</div>
			
		</div>
</div>

<div class="c_middle download_manager">
    

	
	<div>
	    <div class="c_right_header" style="height: 48px;">
		
		     <div class="row">
		          <div class="btn-group" style="float: right;margin-right: 30px;">
		                 <button  onclick="cleint_fp()" class="btn btn-sm btn-primary" type="button"><ww:property value='#session.local.a00455' /></button>
			             <button  onclick="cleint_un_fp()" class="btn btn-sm btn-primary" type="button"><ww:property value='#session.local.a00456' /></button>
		          </div>
		     </div>

			
			
		</div>
        <!--显示内容-->
        <div style="height: 400px;width: 1040px;margin-top: -20px;" >
            
            <!-- 固定标题 -->
           <div style="padding-right:17px;">
               <table border="0" cellpadding="0" cellspacing="0">
			      <tr class="cell_element cell_first">
		            <td style="width:20%" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
					<td style="width:40%"><ww:property value='#session.local.a00038' /></td>
					<td style="width:20%"><ww:property value='#session.local.a00040' /></td>
					<td style="width:20%"><ww:property value="#session.local.a00457" /></td>
			      </tr>
			    </table>
              
           </div>
           <div style="height: 360px;overflow: auto;overflow-y:scroll;margin-top: -20px;">
			<table border="0" cellpadding="0" cellspacing="0">
			
			 <ww:iterator value="clients">
				<tr class="cell_element cell_show">
				  <td style="width:20%" align="center">
				     <input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
				  </td>
				  <td style="width:40%">
				     <ww:property value='name' />
				  </td>
				  <td style="width:20%" >
				     <ww:property value="mark" />
				  </td>
				  <td style="width:20%" >
				     <ww:property value="fenpei" />
				  </td>
				</tr>
			</ww:iterator>
			
					

			</table>
			</div>
		</div>
        <!--分页-->
		<div class="nav" style="bottom:60px;">
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'tofpclientlist.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'tofpclientlist.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'tofpclientlist.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'tofpclientlist.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'tofpclientlist.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('tofpclientlist.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'tofpclientlist.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if> >10</a>
			     <a href="javascript:setpagetype(20,'tofpclientlist.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'tofpclientlist.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'tofpclientlist.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			</div>
			
			<!--隐藏域 -->
            
            <!--当前页码-->
			<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
            <!--总页码-->
            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
            <!--每页显示页数-->
            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
            
            <!--选中用户-->
            <input type="hidden" name="curruserid"  id="curruserid" value="<ww:property value='curruserid'/>" />
        
		</div>
	</div>
</div>
</form>
</body>
</html>
