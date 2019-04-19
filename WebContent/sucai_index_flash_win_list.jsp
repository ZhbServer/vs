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
width:100%;
height:100%;
margin:0px;
padding:0px;
border:0px;
font-family:Microsoft YaHei;
}
.con ul li{float:left;position:relative;overflow:hidden;cursor:pointer;}
.text{width:185px;height:25px;background:rgba(0,0,0,0.6);/*透明背景色，不透明其文字内容*/position:absolute;left:0;bottom:0;color:#fff;font-family:"微软雅黑";}
.text h3{font-size:14px;height:30px;margin-top:5px;}
.text span{font-size:12px;}

.dl_4{cursor:pointer;float:left; background:url(image/ithemsbg.png) left top no-repeat;}
.display_container .dl_4 { width:190px;height:128px; background-image:url(image/ithemsbg.png);}

/*background-color:#134AFF;*/
/*overflow:hidden*/
</style>
<!--[if lte IE 9]>

   <style type="text/css">

   .text {
       background:transparent;
       filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#7f000000,endColorstr=#7f000000);
       zoom: 1;
    }

    </style>

<![endif]-->

<script type="text/javascript">


var b00028="<ww:property value='#session.local.b00028'  />";
/*预览图片*/
function yulan(url){ 
     //window.open(url);

     layer.open({
    	    type: 2,
    	    title: false,
    	    area: ['670px', '520px'],
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
			       <ww:property value='#session.local.a00065' /> :<span class="function"><ww:property value='#session.local.a00007' /></span><span class="material_bg">Flash</span>
			</div>
			<div class="material_show">
			
			</div>
		</div>
</div>

<div class="c_middle">
    
    <!--分组-->
	<div class="c_left">
		<div class="m_left_bottom">
			<!-- <a href="#" class="mlb_classify"><ww:property value='#session.local.a00023' /></a>-->
			<a href="javascript:openScGroup(5);" class="mlb_edit"><ww:property value='#session.local.a00024' /></a>
		</div>
	    <div style="overflow: auto;height: 490px;">
			<div  onclick="scgroupjump(0,'tosclist.vs')" class="subNav_sucai"  <ww:if test="gssi.sucaigroupid==0">  style="background-color:#007CCD;color: white;" </ww:if> ><ww:property value='#session.local.a00815' /></div>
			
			<ww:iterator value="listsfgp">
				<div title="<ww:property value="name"  />" <ww:if test="gssi.sucaigroupid==id">  style="background-color:#007CCD;color: white;" </ww:if>  onclick="scgroupjump(<ww:property value='id'  />,'tosclist.vs')" class="subNav_sucai">
				   <ww:property value="name"  />
				   <ww:if test="#session.urid!=userid">
                         (<ww:property value="uname" />)
                   </ww:if>
				</div>
			</ww:iterator>
			
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
				<li><a style="background-color:#B5B5B5;"  onclick="replace_sucai_list('tosclist.vs?sucai.type=5&showtype=1')"><ww:property value='#session.local.a00069' /></a></li>
<!--				<li><a href="tosclistwin.vs?sucai.type=1&gssi.sucaigroupid=0&pagetype=12"><ww:property value='#session.local.a00070' /></a></li>-->
			</ul>
			<ul class="op_r">
			<li><a href="javascript:openUpload('upflash.jsp',5);"><ww:property value='#session.local.a00063' /></a></li>
			<li><a href="javascript:del_sel('delsc.vs');"><ww:property value='#session.local.a00025' /></a></li>
			<li><a href="#" id="selectAll"><ww:property value='#session.local.a00019' /><input type="checkbox"  style="display: none;" id="all" /></a></li>
			</ul>
			
		</div>
        <!--显示内容-->
        <div class="con" id="con" style="overflow: auto;height: 410px;"  >
    	   <ul class="display_container">
    	    
    	    <ww:set name="spagetype" value="<ww:property value='pagetype'/>"></ww:set> 
    	    <ww:iterator value="listsc" status="status">
    	         
    	         <li  ondblclick="yulan('seeflash.vs?fname=<ww:property value='filename' />')"
    	            
    	            <ww:if test="(#status.index+1)%4==0&&pagetype==12">class="dl_4" style="margin-right: 20px;" </ww:if>
    	            <ww:elseif test="(#status.index+1)%4==0&&pagetype!=12">
    	                class="dl_4" style="margin-right: 3.5px;"
    	            </ww:elseif>
    	            onclick="dj(this,<ww:property value='id' />)"
    	         >
    	         <input style="position:absolute;margin:7px 0 0 7px;" type="checkbox" id="qx<ww:property value='id' />"  name="qx" value="<ww:property value='id' />"/>
    	         <div></div>
    	         <img width="93%" height="93%" src="image/flash_icon.jpg" alt="<ww:property value='filename' />"/>
    	         <div class="text">
    	             <h3 title="<ww:property value="name"/>">&nbsp;&nbsp;<ww:property value="namesub"/></h3>
    	             <!--<span>&nbsp;&nbsp;<ww:property value='#session.local.a00072' />:<ww:property value="size"/>M</span><br />
    	             <span>&nbsp;&nbsp;<ww:property value='#session.local.a00068' />:<ww:property value="user"/></span><br />
    	             <span>&nbsp;&nbsp;<ww:property value='#session.local.a00073' />:<ww:property value="sdate"/></span>
    	         --></div>
    	         </li>
    	    </ww:iterator>
    	   
    	 
			</ul>
			</div>
        <!--分页-->
		<div class="nav">
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
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'tosclist.vs');"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'tosclist.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('tosclist.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(12,'tosclist.vs');" <ww:if test='#session.publicPagetype==12'>style="background-color:#FFA534;"</ww:if>  >12</a>
			     <a href="javascript:setpagetype(24,'tosclist.vs');" <ww:if test='#session.publicPagetype==24'>style="background-color:#FFA534;"</ww:if> >24</a>
			     <a href="javascript:setpagetype(48,'tosclist.vs');" <ww:if test='#session.publicPagetype==48'>style="background-color:#FFA534;"</ww:if> >48</a>
			     <a href="javascript:setpagetype(-1,'tosclist.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
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
            
            <!--页面显示类型 -->
            <input type="hidden" name="showtype"  id="showtype" value="2"/>
            
		</div>
	</div>
</div>
<script>
/*鼠标浮动*/
/*$(".con ul li").hover(function(){
	$(this).find(".text").stop().animate({height:"185px"},400);
	$(this).find(".text h3").stop().animate({paddingTop:"70px"},400);
},function(){
	$(this).find(".text").stop().animate({height:"25px"},400);
	$(this).find(".text h3").stop().animate({paddingTop:"0px"},400);
});*/
</script>
</form>
</body>
</html>
