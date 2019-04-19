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

<script type="text/javascript" src="zTree/3.53/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="zTree/3.53/jquery.ztree.excheck-3.5.js"></script>
<link rel="stylesheet" href="zTree/3.53/zTreeStyle.css" />

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

</head>
<body>
	<div class="c_right_header" >
	   <div class="row">
		     <div class="col-xs-1">
			    <select  id="sel" name="sel"  class="form-control input-sm" style="width: 90px;" >
					  <option  <ww:if test="sel==0"> selected="selected" </ww:if>   value="0"><ww:property value='#session.local.a00066' /></option>
					  <option  <ww:if test="sel==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.a00071' /></option>
					  <option  <ww:if test="sel==2"> selected="selected" </ww:if>   value="2"><ww:property value='#session.local.a00068' /></option>
	            </select>
	             
			  </div>
			  <div class="col-xs-2" style="margin-left: 25px;">
			     <input  name="ser" id="ser"  class="form-control input-sm" type="text" value="<ww:property value='ser' />" style="width: 110px;" /> 
			  </div> 
			  <div class="col-xs-3" style="margin-left: -28px;" >
			     	<button  onclick="selsc('tosclist.vs')" class="btn btn-sm btn-primary" type="button" style="padding: 4px 8px;"><i class="icon icon-search"></i></button>
			  </div> 
			  
			  <div class="col-xs-4" style="margin-left: -120px;">
			     	<button class="btn btn-sm btn-primary" onclick="replace_sucai_list('tosclist.vs?sucai.type=<ww:property value="sucai.type"/>&pagetype=10&showtype=1')" type="button"><ww:property value='#session.local.a00069' /></button>
			     	<ww:if test="isSelf!=0">
			  		     <button onclick="add_share('addshare.vs',<ww:property value="sucai.type"/>)"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00816' /></button>
			  		</ww:if>
			  </div> 
			  
			   <input type="checkbox"  style="display: none;" id="all" />
			   <ww:if test="isSelf!=0">
				   <div class="btn-group" style="float: right;margin-right: 30px;">
				   	  <button id="selectAll" type="button" onclick="checkAll()" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00019' /></button>
					  <ww:if test="sucai.type == 1">
				   	  	<button id="step2" onclick="openUpload('upbj.jsp',1)"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00063' /></button>
				   	  </ww:if>
				   	  <ww:if test="sucai.type == 2">
				   	  	<button id="step2" onclick="openUpload('upaudio.jsp',2)"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00063' /></button>
				   	  </ww:if>
				   	  <ww:if test="sucai.type == 3">
				   	  	<button id="step2" onclick="openUpload('upvideo.jsp',3)"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00063' /></button>
				   	  </ww:if>
				   	  <ww:if test="sucai.type == 4">
				   	  	<button id="step2" onclick="openUpload('upimg.jsp',4)"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00063' /></button>
				   	  </ww:if>
				   	  <ww:if test="sucai.type == 6">
				   	  	<button id="step2" onclick="openUpload('upppt.jsp',6)"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00063' /></button>
				   	  </ww:if>
				   	  <ww:if test="sucai.type == 7">
				   	  	<button id="step2" onclick="openUpload('upword.jsp',7)"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00063' /></button>
				   	  </ww:if>
				   	  <ww:if test="sucai.type == 8">
				   	  	<button id="step2" onclick="openUpload('upexcel.jsp',8)"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00063' /></button>
				   	  </ww:if>
				   	  <ww:if test="sucai.type == 9">
				   	  	<button id="step2" onclick="openUpload('uppdf.jsp',9)"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00063' /></button>
				   	  </ww:if>
				   	  <ww:if test="sucai.type == 10">
				   	  	<button id="step2" onclick="openUpload('uptxt.jsp',10)"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00063' /></button>
				   	  </ww:if>
					  <button onclick="del_sucai('delsc.vs')"       type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button>
			       </div>			
		       </ww:if>	  
		       
		 </div>
	   
		
	</div>
	      <!--显示内容-->
	      <div class="con" id="con" style="overflow: auto;height: 410px;"  >
	  	   <ul class="display_container" style="padding-left: 0px;">
	  	    
	  	    <ww:set name="spagetype" value="<ww:property value='pagetype'/>"></ww:set> 
	  	    <ww:iterator value="listsc" status="status">
	  	         
	  	         <li  
	  	            
	  	            <ww:if test="(#status.index+1)%4==0&&pagetype==12">class="dl_4" style="margin-right: 20px;" </ww:if>
	  	            <ww:elseif test="(#status.index+1)%4==0&&pagetype!=12">
	  	                class="dl_4" style="margin-right: 3.5px;"
	  	            </ww:elseif>
	  	            onclick="dj(this,<ww:property value='id' />)"
	  	         >
	  	         <input style="position:absolute;margin:7px 0 0 7px;" type="checkbox" id="qx<ww:property value='id' />"  name="qx" value="<ww:property value='id' />"/>
	  	         <div></div>
	  	         
	  	          <ww:if test="type == 1 || type == 4">
    	              <img width="93%" height="93%" src="files/<ww:property value="filename" />" alt="<ww:property value='filename' />"/>
    	          </ww:if>
    	          <ww:if test="type == 2">
    	               <img width="93%" height="93%" src="image/audio_icon.png" alt="<ww:property value='filename' />"/>
    	          </ww:if>
    	           <ww:if test="type == 3">
    	               <img width="93%" height="93%" src="files/<ww:property value="video_img" />" alt="<ww:property value='filename' />"/>
    	           </ww:if>
	  	         
	  	           <ww:if test="type == 6 || type == 7 || type == 8 || type ==9">
	  	              <img width="93%" height="93%" src="files/<ww:property value="filename" />/1.png" alt="<ww:property value='filename' />"/>
	  	           </ww:if>
	  	           
	  	           <ww:if test="type == 10">
	  	               <img width="93%" height="93%" src="image/txt_icon.png" alt="<ww:property value='filename' />"/>
	  	           </ww:if>
	  	        
	  	         
	  	         
	  	         <div class="text">
	  	             <h3 title="<ww:property value="name"/>">&nbsp;<ww:property value="namesub"/></h3>
	  	             <!--<span>&nbsp;<ww:property value='#session.local.a00072' />:<ww:property value="size"/>M</span><br />
	  	             <span>&nbsp;<ww:property value='#session.local.a00068' />:<ww:property value="user"/></span><br />
	  	             <span>&nbsp;<ww:property value='#session.local.a00073' />:<ww:property value="sdate"/></span>-->
	  	         </div>
	  	         </li>
	  	    </ww:iterator>
	  	   
	  	 
		</ul>
		</div>
	      <!--分页-->
	<div class="nav">
		<ul class="pg">
	              <!-- 上一页-->
			<li><a href="javascript:pageto_sc(<ww:property value='qian' />,'tosclistajax.vs');" class="pg_f"></a></li>
	           <!--页码显示上-->
			<ww:iterator id="q"  value="ps.qs">
	                 <li><a href="javascript:pageto_sc(<ww:property value='#q'/>,'tosclistajax.vs');" ><ww:property value="#q"  /></a> </li>
	           </ww:iterator>
	           
	           <!--当前页码-->
	           <li><a href="javascript:pageto_sc(<ww:property value='#request.id'  />,'tosclistajax.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	           
	            <!--页码显示下-->
	           <ww:iterator id="h"  value="ps.hs">
	                 <li><a href="javascript:pageto_sc(<ww:property value='#h'/>,'tosclistajax.vs');"><ww:property value="#h"  /></a></li>
	           </ww:iterator>
	           
	              <!--下一页-->
	           <li><a href="javascript:pageto_sc(<ww:property value='hou' />,'tosclistajax.vs');" class="pg_e"></a></li>
		</ul>
	    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('tosclistajax.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
	    
		<div class="pg_count">
		     
		     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
		     <a href="javascript:setpagetype_sc(10,'tosclistajax.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
		     <a href="javascript:setpagetype_sc(20,'tosclistajax.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
		     <a href="javascript:setpagetype_sc(30,'tosclistajax.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
		     <a href="javascript:setpagetype_sc(-1,'tosclistajax.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
		</div>
		
		<!--隐藏域 -->
	          
	          <!--当前页码-->
		<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
	          <!--总页码-->
	          <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
	          <!--每页显示页数-->
	          <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
	          <!--素材类型-->
	          <input type="hidden" name="sucai.type" id="sctype" value="<ww:property value="sucai.type"/>"/> 
	          <!--分组-->
	          <input type="hidden" name="gssi.sucaigroupid"  id="gpid" value="<ww:property value='gssi.sucaigroupid'/>"/>
	          <!--树id-->
		<input type="hidden" name="treeid"  id="treeid" value=""/>
	          <!--页面显示类型 -->
	          <input type="hidden" name="showtype"  id="showtype" value="2"/>
         </div>
</body>
</html>
