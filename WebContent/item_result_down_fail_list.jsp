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

<script type="text/javascript">
  
function  open_return(){
	var logid=$("#logid").val();
	window.location.href='countlogsendclient.vs?logid='+logid;
}
</script>
</head>
<body>
 <form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container">
		
		</div>
</div>

<div class="c_middle download_manager" style="width: 900px;">
    

	
	<div>
	    <div class="c_right_header"  style="height: 48px;width: 900px;">
		    
			 <div class="row">
			    
			    
			    
			    <ww:if test="returnState==1">
			        <div class="btn-group" style="float:right;margin-right: 50px;">
				      	  <button onclick="open_return()"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00014' /></button>  
				     </div>
			    </ww:if>   
			       
				 		  
			 </div>
			 
		    
		</div>
        <!--显示内容-->
        <div style="height: 400px;margin-top: -10px;" >
             <!-- 固定标题 -->
             <div style="padding-right:17px;margin: 0px;width: 900px;" >
                <table style="text-align: center;margin: 0px;width: 900px;" border="0" cellpadding="0" cellspacing="0">
					<tr class="cell_element cell_first">
					
					    <!-- 素材名-->
					    <td style="width:30%" ><ww:property value='#session.local.a00071' /></td><!-- 素材名 -->
					    
					    <!-- 文件名 -->
				        <td style="width:10%" ><ww:property value='#session.local.a00067' /></td><!-- 文件名 -->
				
					    <!-- 文件标识 -->
					    <td style="width:50%" ><ww:property value='#session.local.b00125' /></td><!-- 文件识码  -->
					  
					</tr>
				 </table>	
             </div>
             <div style="height: 400px;overflow: auto;">
				<table style="text-align: center;margin: 0px;width: 900px;" border="0" cellpadding="0" cellspacing="0">
					<ww:iterator value="resultDownFailList" >
						<tr class="cell_element cell_show">
						  <td style="width:30%"  title="<ww:property value='sName' />" >
						  
						  
						        <ww:if test="sName.length()<20">
							       <ww:property value="sName"/>
							    </ww:if>
							    <ww:else>
							       <ww:property value="sName.substring(0,19)"/>...
							    </ww:else>
				    
				    
						  
						  </td>
						  <td style="width:10%" >
						     <ww:property value="fileName" />
						  </td>
						  <td style="width:50%">
						     <ww:property value="vu" />
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
				<li><a href="javascript:pageto(<ww:property value='qian' />,'toResultDownFailList.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'toResultDownFailList.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'toResultDownFailList.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'toResultDownFailList.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'toResultDownFailList.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('offclient.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'toResultDownFailList.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if> >10</a>
			     <a href="javascript:setpagetype(20,'toResultDownFailList.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'toResultDownFailList.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'toResultDownFailList.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			     
			</div>
			
			<!--隐藏域 -->
            
            <!--当前页码-->
			<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
            <!--总页码-->
            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
            <!--每页显示页数-->
            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
        
            <!--发布日志id-->
            <input type="hidden" name="logid"  id="logid" value="<ww:property value='logid'/>" />
            
            <input type="hidden" name="mark"  id="mark" value="<ww:property value='mark'/>" />
        
            <input type="hidden" name="returnState"  id="returnState" value="<ww:property value='returnState'/>" />
		</div>
	</div>
</div>
</form>
</body>
</html>
