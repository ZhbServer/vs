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
margin:0px;
padding:0px;
border:0px;
}
/*background-color:#134AFF;*/
/*overflow:hidden*/
</style>
<script type="text/javascript">
 

    /*预览图片*/
    function yulan(url){ 
         //window.open(url);
    	 layer.open({
     	    type: 2,
     	    title: false,
     	    fix: false, //不固定
     	   area: ['900px', '550px'],
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
			       <ww:property value='#session.local.a00065' /> :
			        <span class="function"><ww:property value='#session.local.a00007' /></span>
			        
			        <ww:if test="type==1">
			           <span class="function"><ww:property value='#session.local.a00058' /></span>
			        </ww:if>
			        <ww:elseif test="type==4">
			           <span class="function"><ww:property value='#session.local.a00061' /></span>
			        </ww:elseif>
			        <ww:elseif test="type==3">
			           <span class="function"><ww:property value='#session.local.a00060' /></span>
			        </ww:elseif>
			        <ww:elseif test="type==2">
			           <span class="function"><ww:property value='#session.local.a00059' /></span>
			        </ww:elseif>
			        <ww:elseif test="type==5">
			           <span class="function">Flash</span>
			        </ww:elseif>
			        <ww:elseif test="type==6">
			           <span class="function">PPT</span>
			        </ww:elseif>
			        <ww:elseif test="type==7">
			           <span class="function">Word</span>
			        </ww:elseif>
			        <ww:elseif test="type==8">
			           <span class="function">Excel</span>
			        </ww:elseif>
			        <ww:elseif test="type==9">
			           <span class="function">PDF</span>
			        </ww:elseif>
			        <ww:elseif test="type==10">
			           <span class="function"><ww:property value='#session.local.a00062' /></span>
			        </ww:elseif>
			        
					<span class="material_bg"> <ww:property value='#session.local.a00817' /></span>
			</div>
			<div class="material_show">
			
			</div>
		</div>
</div>

<div class="c_middle">
    
    <!--素材菜单-->
	<div class="c_right" style="width:99%;">
		<div class="c_right_header" >
			<div class="row">
				<div class="btn-group" style="float: right;margin-right: 30px;">
					  <button onclick="history.go(-1);"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00014' /></button>
		       </div>
			</div>
		</div>
        <!--显示内容-->
        <div style="height: 400px;" >
          <!-- 固定标题 -->
          <div style="padding-right:17px;">
	            <table border="0" cellspacing="0" cellpadding="0">
	              <tr class="cell_element cell_first">
					<td style="width:20%"><ww:property value='#session.local.a00071'/></td>
					<td style="width:20%"><ww:property value='#session.local.a00067'/></td>
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
						  <td style="width:20%"><ww:property value="name"/></td>
						  <td style="width:20%"><ww:property value="filename"/></td>
						  <td style="width:10%"><ww:property value="size"/>M</td>
						  <td style="width:10%">
						  	<ww:if test="type == 1">
						  		<a href="javascript:yulan('seeimg.vs?scid=<ww:property value="id" />&lbyl=1');" class="pre_pic">
							  		<img width="40" height="25" src="files/_<ww:property value="filename" />"  alt="<ww:property value='#session.local.a00026' />"/>
							  		<div class="zoom"></div>
							  	</a>
						  	</ww:if>
						  	<ww:if test="type == 2">
						  		<a href="javascript:yulan('seevideo.vs?scid=<ww:property value='id' />&lbyl=1');" class="pre_pic">
							  		<img width="40" height="25" src="image/audio_icon.png"  alt="<ww:property value='#session.local.a00026' />"/>
							  		<div class="zoom"></div>
						  		</a>
						  	</ww:if>
						  	<ww:if test="type == 3">
						  		<a href="javascript:yulan('seevideo.vs?scid=<ww:property value='id' />&lbyl=1');" class="pre_pic">
						  			<img width="40" height="25" src="files/<ww:property value="video_img" />"  alt="<ww:property value='#session.local.a00026' />"/>
						  			<div class="zoom"></div>
						  		</a>
						  	</ww:if>
						  	<ww:if test="type == 4">
						  		<a href="javascript:yulan('seeimg.vs?scid=<ww:property value="id" />&lbyl=1');" class="pre_pic">
							  		<img width="40" height="25" src="files/_<ww:property value="filename" />"  alt="<ww:property value='#session.local.a00026' />"/>
							  		<div class="zoom"></div>
						  		</a>
						  	</ww:if>
						  	<ww:if test="type == 5">
						  		<a href="javascript:yulan('seeflash.vs?scid=<ww:property value='id' />&lbyl=1');" class="pre_pic">
							  		<img width="40" height="25" src="image/flash_icon.jpg"  alt="<ww:property value='#session.local.a00026' />"/>
							  		<div class="zoom"></div>
						  		</a>
						  	</ww:if>
						  	<ww:if test="type == 6">
						  		<a href="javascript:yulan('seepics.vs?scid=<ww:property value='id' />&lbyl=1');" class="pre_pic">
							  		<img width="40" height="25" src="files/<ww:property value="filename" />/1.png"  alt="<ww:property value='#session.local.a00026' />"/>
							  		<div class="zoom"></div>
						  		</a>
						  	</ww:if>
						  	<ww:if test="type == 7">
						  		<a href="javascript:yulan('seepics.vs?scid=<ww:property value='id' />&lbyl=1');" class="pre_pic">
							  		<img width="40" height="25" src="files/<ww:property value="filename" />/1.png"  alt="<ww:property value='#session.local.a00026' />"/>
							  		<div class="zoom"></div>
						  		</a>
						  	</ww:if>
						  	<ww:if test="type == 8">
						  		<a href="javascript:yulan('seepics.vs?scid=<ww:property value='id' />&lbyl=1');" class="pre_pic">
							  		<img width="40" height="25" src="files/<ww:property value="filename" />/1.png"  alt="<ww:property value='#session.local.a00026' />"/>
							  		<div class="zoom"></div>
						  		</a>
						  	</ww:if>
						  	<ww:if test="type == 9">
						  		<a href="javascript:yulan('seepics.vs?scid=<ww:property value='id' />&lbyl=1');" class="pre_pic">
							  		<img width="40" height="25" src="files/<ww:property value="filename" />/1.png"  alt="<ww:property value='#session.local.a00026' />"/>
							  		<div class="zoom"></div>
						  		</a>
						  	</ww:if>
						  	<ww:if test="type == 10">
						  		<a href="javascript:yulan('seetxt.vs?scid=<ww:property value='id' />&lbyl=1');" class="pre_pic">
							  		<img width="40" height="25" src="image/txt_icon.png"  alt="<ww:property value='#session.local.a00026' />"/>
							  		<div class="zoom"></div>
						  		</a>
						  	</ww:if>
						  </td>
						  <td style="width:20%"><ww:property value="sdate"/></td>
						  <td style="width:20%"><ww:property value="user"/></td>
						</tr>
					
					</ww:iterator>
				</table>
			</div>
		</div>
        <!--分页-->
		<div class="nav">
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'toseeshare.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'toseeshare.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'toseeshare.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'toseeshare.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'toseeshare.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('tosclist.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'toseeshare.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
			     <a href="javascript:setpagetype(20,'toseeshare.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'toseeshare.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'toseeshare.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			</div>
			
			<!--隐藏域 -->
            
            <!--当前页码-->
			<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
            <!--总页码-->
            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
            <!--每页显示页数-->
            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
            <!--页面显示类型 -->
            <input type="hidden" name="showtype"  id="showtype" value="1"/>
		</div>
	</div>
</div>
</form>
</body>
</html>
