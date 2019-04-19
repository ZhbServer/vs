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
     	    fix: false, //不固定
     	    area: ['680px', '530px'],
     	    shade: 0.1,
     	    closeBtn: 0,
     	    shadeClose: true,
     	    shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
     	    content: url
     	});
    }   
</script>
</head>
<body>

 <form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			       <ww:property value='#session.local.a00065' /> :<span class="function"><ww:property value='#session.local.a00007' /></span><span class="material_bg"><ww:property value='#session.local.a00058' /></span>
			</div>
			<div class="material_show">
				<ul>
				<li><a href="tosclist.vs?sucai.type=1&gssi.sucaigroupid=0" style="background-color:#007CCD;"><ww:property value='#session.local.a00058' /></a></li>
				<li><a href="tosclist.vs?sucai.type=4&gssi.sucaigroupid=0"><ww:property value='#session.local.a00061' /></a></li>
				<li><a href="tosclist.vs?sucai.type=3&gssi.sucaigroupid=0"><ww:property value='#session.local.a00060' /></a></li>
				<li><a href="tosclist.vs?sucai.type=2&gssi.sucaigroupid=0"><ww:property value='#session.local.a00059' /></a></li>
				<li><a href="tosclist.vs?sucai.type=5&gssi.sucaigroupid=0">Flash</a></li>
				<li><a href="tosclist.vs?sucai.type=6&gssi.sucaigroupid=0">PPT</a></li>
				<li><a href="tosclist.vs?sucai.type=7&gssi.sucaigroupid=0">Word</a></li>
				<li><a href="tosclist.vs?sucai.type=8&gssi.sucaigroupid=0">Excel</a></li>
				<li><a href="tosclist.vs?sucai.type=9&gssi.sucaigroupid=0">PDF</a></li>
				<li><a href="tosclist.vs?sucai.type=10&gssi.sucaigroupid=0"><ww:property value='#session.local.a00062' /></a></li>
				</ul>
			</div>
		</div>
</div>

<div class="c_middle">
    
    <!--分组-->
	<div class="c_left">
	    <div style="overflow: auto;height: 490px;">
			<div  onclick="scgroupjump(0,'tosclist.vs')" class="subNav_sucai"  <ww:if test="gssi.sucaigroupid==0">  style="background-color:#007CCD;color: white;" </ww:if> ><ww:property value='#session.local.a00029' /></div>
			
			
			<ww:iterator value="listsfgp">
				<div <ww:if test="gssi.sucaigroupid==id">  style="background-color:#007CCD;color: white;" </ww:if>  onclick="scgroupjump(<ww:property value='id'  />,'tosclist.vs')" class="subNav_sucai">
				   <ww:property value="name"  />
				   <ww:if test="#session.urid!=userid">
                         (<ww:property value="uname" />)
                   </ww:if>
				</div>
			</ww:iterator>
			
			<div class="m_left_bottom">
			<!-- <a href="#" class="mlb_classify"><ww:property value='#session.local.a00023' /></a>-->
			<a href="javascript:openScGroup(1);" class="mlb_edit"><ww:property value='#session.local.a00024' /></a>
			</div>
		</div>    
	</div>
	
    <!--素材菜单-->
	<div class="c_right">
		<div class="c_right_header" >
		
		     <div class="xlk">
		        <select id="sel" name="sel" style="font-size: 15px; ">
		             <option  <ww:if test="sel==0"> selected="selected" </ww:if>   value="0"><ww:property value='#session.local.a00066' /></option>
					 <option  <ww:if test="sel==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.a00067' /></option>
					 <option  <ww:if test="sel==2"> selected="selected" </ww:if>   value="2"><ww:property value='#session.local.a00068' /></option>
				 </select>  
			 </div>

			<div class="search white" >
				<input name="ser"  type="text" class="sea_text" value="<ww:property value='ser' />"/>
				<input type="button" class="sea_button" onclick="selsc('tosclist.vs')"/>
			</div>
			<ul>
<!--				<li><a href="tosclist.vs?sucai.type=1&gssi.sucaigroupid=0"><ww:property value='#session.local.a00069' /></a></li>-->
				<li><a style="background-color:#B5B5B5;" onclick="replace_sucai_list('tosclist.vs?sucai.type=1&pagetype=12&showtype=2')"><ww:property value='#session.local.a00070' /></a></li>
			</ul>
			<ul class="op_r">
			<li><a href="javascript:openUpload('upbj.jsp',1);"><ww:property value='#session.local.a00063' /></a></li>
			<li><a href="javascript:del_sel('delsc.vs');"><ww:property value='#session.local.a00025' /></a></li>
			</ul>
		</div>
        <!--显示内容-->
        <div style="height: 400px;" >
          <!-- 固定标题 -->
          <div style="padding-right:17px;">
	            <table border="0" cellspacing="0" cellpadding="0">
	              <tr class="cell_element cell_first">
					<td style="width:10%" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
					<td style="width:30%"><ww:property value='#session.local.a00071'/></td>
					<td style="width:10%"><ww:property value='#session.local.a00072' /></td>
					<td style="width:10%"><ww:property value='#session.local.a00026' /></td>
					<td style="width:20%"><ww:property value='#session.local.a00073' /></td>
					<td style="width:20%"><ww:property value='#session.local.a00068' /></td>
				  </tr>
	            </table>
            </div>
            <div style="height: 400px;overflow: auto;overflow-y:scroll;">
				<table border="0" cellpadding="0" cellspacing="0">
					<ww:iterator value="listsc">
					
						<tr class="cell_element cell_show">
						  <td style="width:10%" align="center"><input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/></td>
						  <td style="width:30%"><ww:property value="name"/></td>
						  <td style="width:10%"><ww:property value="size"/>M</td>
						  <td style="width:10%"><a href="javascript:yulan('seeimg.vs?fname=<ww:property value="filename" />');" class="pre_pic"><img width="40" height="25" src="files/_<ww:property value="filename" />"  alt="<ww:property value='#session.local.a00026' />"/><div class="zoom"></div></a></td>
						  <td style="width:20%"><ww:property value="sdate"/></td>
						  <td style="width:20%"><ww:property value="user"/></td>
						</tr>
					
					</ww:iterator>
				</table>
			</div>
		</div>
        <!--分页-->
		<div class="nav" >
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'tosclist.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'tosclist.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'tosclist.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'tosclist.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'tosclist.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('tosclist.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'tosclist.vs');" <ww:if test='pagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
			     <a href="javascript:setpagetype(20,'tosclist.vs');" <ww:if test='pagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'tosclist.vs');" <ww:if test='pagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(<ww:property value='total'/>,'tosclist.vs');" <ww:if test='pagetype==total'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			</div>
			
			<!--隐藏域 -->
            
            <!--当前页码-->
			<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
            <!--总页码-->
            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
            <!--每页显示页数-->
            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='pagetype'/>" />
            <!--素材类型-->
            <input type="hidden" name="sucai.type" value="<ww:property value="sucai.type"/>"/> 
            <!--分组-->
            <input type="hidden" name="gssi.sucaigroupid"  id="gpid" value="<ww:property value='gssi.sucaigroupid'/>"/>
            <!--页面显示类型 -->
            <input type="hidden" name="showtype"  id="showtype" value="1"/>
		</div>
	</div>
</div>
</form>
</body>
</html>
