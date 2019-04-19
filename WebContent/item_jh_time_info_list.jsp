<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base target="_self" />
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

<script>
//返回计划
function go_itemjh(jhtype){
	document.form1.action="jhlist.vs?jhtype="+jhtype;
	document.form1.target = "_self";
    document.form1.submit();
}

</script>
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


</script>
</head>
<body>

<form  name="form1" method="post" >
<input type="hidden" value="<ww:property  value='jhid'/>" name="jhid" id="jhid"/>
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			       <ww:property value='#session.local.a00065' /> :<span class="function"><ww:property value='#session.local.a00645' /></span><span class="material_bg"><ww:property value='#session.local.a00647' />><ww:property  value="jhName"/></span>
			</div>
			<div class="material_show">
				<ul>
<!--				<li><a style="background-color:#007CCD;" href=""><ww:property value='#session.local.a00646' /></a></li>-->
<!--				<li><a href=""><ww:property value='#session.local.a00647' /></a></li>-->
<!--				<li><a href=""><ww:property value='#session.local.a00648' /></a></li>-->
				</ul>
			</div>
		</div>
</div>

<div class="c_middle download_manager">
    
    <!--分组-->

	
    <!--节目菜单-->
		<div>
	    <div class="c_right_header" >
		
		     <!-- <div class="xlk">
		        <select id="sel" name="sel" style="font-size: 15px; ">
		             
		             <option  <ww:if test="sel==0"> selected="selected" </ww:if>   value="0"><ww:property value='#session.local.a00066' /></option>
					 <option  <ww:if test="sel==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.a00255' /></option>					 
				 </select>  
			 </div> 
			<div class="search white" >
				<input name="ser"  type="text" class="sea_text" value="<ww:property value='ser' />"/>
				<input type="button" class="sea_button" onclick="selsc('toiteminteractlist.vs')"/>
			</div>
			-->
			<ul>
<!--				<li><a href="tosclist.vs?sucai.type=1&gssi.sucaigroupid=0"><ww:property value='#session.local.a00069' /></a></li>-->
<!--				<li><a style="background-color:#B5B5B5;" href="tosclist.vs?sucai.type=1&gssi.sucaigroupid=0&pagetype=12&showtype=2"><ww:property value='#session.local.a00070' /></a></li>-->
			</ul>
			<div class="row">
		         <div class="btn-group" style="float: right;margin-right: 30px;">
		              <button onclick="go_itemjh(1)"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00014' /></button><!-- 返回 -->
		         </div>
		    </div>
		</div>
        <!--显示内容-->
         <div style="height: 400px;width: 1050px;margin-top: -10px;" >
           <!-- 固定标题 -->
           <div style="padding-right:17px;margin: 0px;">
               <table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
					<tr class="cell_element cell_first">
					<td width="30%">&nbsp;<ww:property value='#session.local.a00599' /></td><!-- 节目 -->
					<td width="20%"><ww:property value='#session.local.a00493' /></td><!-- 周期-->
					<td width="20%"><ww:property value='#session.local.a00540' /></td><!-- 开始时间-->
					<td width="20%"><ww:property value='#session.local.a00541' /></td><!-- 结束时间-->
					
					</tr>
				</table>
            </div>
            <div style="height: 400px;overflow: auto;overflow-y:scroll;">
               <table border="0" cellpadding="0" cellspacing="0" style="margin-top:0px;margin-bottom: 0px;">
	                <ww:iterator value="jhitems">
					<tr class="cell_element cell_show">
					   <td width="30%"><a  style="width: 100%;display: block;overflow: auto;color: #343F51;" href="javascript:open_items('<ww:property value='itemids'/>_1');"><ww:property value="itemnames"/></a></td>
					   <td width="20%">
					      
					      <ww:if test="day==8">
					          <ww:property value="#session.local.a00483"/>
					      </ww:if>
					      <ww:elseif test="day==1">
					          <ww:property value="#session.local.a00475"/>
					      </ww:elseif>
					      <ww:elseif test="day==2">
					          <ww:property value="#session.local.a00476"/>
					      </ww:elseif>
					      <ww:elseif test="day==3">
					          <ww:property value="#session.local.a00478"/>
					      </ww:elseif>
					      <ww:elseif test="day==4">
					          <ww:property value="#session.local.a00479"/>
					      </ww:elseif>
					      <ww:elseif test="day==5">
					          <ww:property value="#session.local.a00480"/>
					      </ww:elseif>
					      <ww:elseif test="day==6">
					          <ww:property value="#session.local.a00481"/>
					      </ww:elseif>
					      <ww:elseif test="day==7">
					          <ww:property value="#session.local.a00482"/>
					      </ww:elseif>
					  </td>
					  <td width="20%"><ww:property value="sdate"/></td>
					  <td width="20%"><ww:property value="edate"/></td>
					</tr>
				    </ww:iterator>
			    </table>
            </div>
		</div>
     
        <!--分页-->
		<div class="nav">
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'jhtimeiteminfo.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'jhtimeiteminfo.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'jhtimeiteminfo.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'jhtimeiteminfo.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'jhtimeiteminfo.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('jhtimeiteminfo.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'jhtimeiteminfo.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
			     <a href="javascript:setpagetype(20,'jhtimeiteminfo.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'jhtimeiteminfo.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'jhtimeiteminfo.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			</div>
			
			<!--隐藏域 -->
            
            <!--当前页码-->
			<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
            <!--总页码-->
            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
            <!--每页显示页数-->
            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
            
            <!--计划类型-->
            <input type="hidden" name="jhtype"  id="jhtype" value="<ww:property value='jhtype'/>" />
        
		</div>
	</div>
</div>
</form>
</body>
</html>
