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
  
//查看未下载文件
function open_see_down_fail(lid,mark){

 	window.location.href='toResultDownFailList.vs?logid='+lid+"&mark="+mark+"&returnState=1";
	
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
				 		  
			 </div>
		</div>
        <!--显示内容-->
        <div style="height: 400px;margin-top: -10px;" >
             <!-- 固定标题 -->
             <div style="padding-right:17px;margin: 0px;width: 900px;" >
                <table style="text-align: center;margin: 0px;width: 900px;" border="0" cellpadding="0" cellspacing="0">
					<tr class="cell_element cell_first">
					
				        <td style="width:30%" ><ww:property value='#session.local.a00038' /></td><!-- 终端名 -->
						<td style="width:20%" ><ww:property value='#session.local.a00040' /></td><!-- 标识码  -->
						<td style="width:20%" ><ww:property value='#session.local.a00039' /></td><!-- IP  -->
<!--					<td style="width:15%" ><ww:property value='#session.local.a00042' /></td> 连接时间  -->
						<td style="width:20%" ><ww:property value='#session.local.a00016' /></td><!-- 在线状态 -->
<!--					<td style="width:20%" ><ww:property value='#session.local.a00458' /></td> 版本号 -->
                
						
					</tr>
				 </table>	
             </div>
             <div style="height: 400px;overflow: auto;">
				<table style="text-align: center;margin: 0px;width: 900px;" border="0" cellpadding="0" cellspacing="0">
					<ww:iterator value="reuslts" >
						<tr class="cell_element cell_show">
						  <td style="width:30%" >
						      <ww:property value='name' />
						  </td>
						  <td style="width:20%" >
						     <ww:property value="mark" />
						  </td>
						  <td style="width:20%">
						     <ww:property value="ip" />
						  </td>

						  <td style="width:20%">
						  
						           <ww:if test="state==0"><ww:property value='#session.local.a00425' /></ww:if>
								   <ww:elseif test="state==1"><ww:property value='#session.local.a00426' /></ww:elseif>
								   <ww:elseif test="state==2"><ww:property value='#session.local.a00427' /></ww:elseif>
								   <ww:elseif test="state==10"><ww:property value='#session.local.b00124' /></ww:elseif>
								   <ww:elseif test="state==20"><ww:property value='#session.local.a00681' /></ww:elseif>
								   <ww:elseif test="state==21"><ww:property value='#session.local.a00682' /></ww:elseif>
								   <ww:elseif test="state==22"><ww:property value='#session.local.a00683' /></ww:elseif>
								   <ww:elseif test="state==23"><ww:property value='#session.local.a00684' /></ww:elseif>
								   <ww:elseif test="state==24"><ww:property value='#session.local.a00685' /></ww:elseif>
								   <ww:elseif test="state==25"><ww:property value='#session.local.a00686' /></ww:elseif>
								   <ww:elseif test="state==26"><ww:property value='#session.local.a00687' /></ww:elseif>
								   <ww:elseif test="state==27"><ww:property value='#session.local.b00123' /></ww:elseif>
								   <ww:elseif test="state==28"><ww:property value='#session.local.b00126' /></ww:elseif> 
								   
								   <ww:if test="#session.version_onoff.letvDownFailShow==1">
					 
					                  <i title="<ww:property value='#session.local.a00423' /><ww:property value='#session.local.a00752' />" style="padding: 4px 8px;cursor: pointer;"  class="icon icon-list-alt" onclick="open_see_down_fail(<ww:property value='logid' />,'<ww:property value='mark' />')"   ></i>
					   
				                   </ww:if>
					   
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
				<li><a href="javascript:pageto(<ww:property value='qian' />,'countlogsendclient.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'countlogsendclient.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'countlogsendclient.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'countlogsendclient.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'countlogsendclient.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('offclient.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'countlogsendclient.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if> >10</a>
			     <a href="javascript:setpagetype(20,'countlogsendclient.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'countlogsendclient.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'countlogsendclient.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
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
        
		</div>
	</div>
</div>
</form>
</body>
</html>
