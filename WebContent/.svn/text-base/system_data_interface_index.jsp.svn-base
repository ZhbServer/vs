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
<script type="text/javascript" src="zeroclipboard/ZeroClipboard.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript">
  

/*弹出新增数据接口*/
function open_sjjk_add(){
	layer.open({
 		type: 2,
         area: ['800px', '500px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'system_data_interface_add.jsp',
         scrollbar: false,
         end: function(){ 
		   document.form1.target = "_self";
		   document.form1.action = "tosyscssjjk.vs"; 
		   document.form1.submit();     
 		}
 	});            
} 

//切换参数
function change_syspar(aurl){
	document.form1.action=aurl;
	document.form1.target = "_self";
    document.form1.submit();
 }

function copy(id){  
      var clip = new ZeroClipboard.Client(); //初始化对象  
      ZeroClipboard.setMoviePath("zeroclipboard/ZeroClipboard.swf");
      clip.setHandCursor( true );   //设置手型   
	  var oA   = document.getElementById(id);
      var code = oA.getAttribute('data-code');
      clip.setText(code); 
      clip.addEventListener('complete', function (client) {  //创建监听事件  
       	   layer.msg('<ww:property value='#session.local.a01015' />');
      });  
      clip.glue(id); //将flash覆盖至指定ID的DOM上  
}  

</script>
</head>
<body>
 <form  name="form1" method="post" >
 
	<div class="title bottom">
			<div class="t_container" >
				<div class="loc">
				        <ww:property value='#session.local.a00065' /> :
				        <span class="function"><ww:property value='#session.local.a00010' /></span>
				        <span class="material_bg"><ww:property value='#session.local.a00996' /></span>
				</div>
			</div>
	</div>


	<div class="c_middle download_manager">
	    
	
		<div class="c_left" >
		
			<div class="subNav_menu" onclick="change_syspar('tosyscsfbl.vs')"  name='0' >
			    <ww:property value="#session.local.a00176"/>
			</div><!-- 分辨率 -->
			<div class="subNav_menu" name='1' onclick="change_syspar('tosyscstq.vs')">
			    <ww:property value="#session.local.a00177"/>
			</div><!-- 天气 -->
<!--			<div class="subNav_menu" onclick="change_syspar('tosyscsscreen.vs')"  name='2'>-->
<!--			    <ww:property value="#session.local.a00178"/>-->
<!--			</div> 截屏 -->
   
            <ww:if test="#session.version_onoff.rssOnOff==1">
				<div class="subNav_menu" onclick="change_syspar('tosyscsrss.vs')"  name='2'>
				    <ww:property value="#session.local.a00179"/>
				</div><!-- RSS -->  
			</ww:if>
			<div class="subNav_menu" onclick="change_syspar('tosyscsapk.vs')"  name='2'>
			    APK
			</div><!-- RSS -->
			
			<ww:if test="#session.version_onoff.dataSourceShow==1">
			    <div class="subNav_menu" onclick="change_syspar('tosyscssjjk.vs')"  name='2' style="color:#ffffff; background-color:#007ccd;">
				    <ww:property value='#session.local.a00996' />
				</div><!-- 数据接口 -->
			</ww:if>
			
			<ww:if test="#session.version_onoff.pwdPloy==1">
			    <div class="subNav_menu" onclick="change_syspar('toTimeUpdatePwd.vs')"  name='2'>
				    <ww:property value='#session.local.b00244' />
				</div><!-- 密码策略 -->
		    </ww:if>
			
		</div>
		
		
		<div class="c_right">
		
		    <div class="c_right_header" style="">
			
				 <div class="row">
				      <div class="btn-group" style="float: right;margin-right: 10px;">
				      	   <button style="margin-left: 20px;"  onclick="open_sjjk_add()"   type="button" class="btn btn-sm btn-success"><ww:property value='#session.local.a00021' /></button><!-- 新增 -->
					       <button onclick="del_sel('delsjjk.vs')"        type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button>
					   </div>	
				 </div>
				 
				 
			</div>
	        <!--显示内容-->
	        <div style="height: 400px;width: 1050px;" >
				
				 <!-- 固定标题 -->
	            <div style="padding-right:17px;margin: 0px;">
	                <table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;margin-top: 0px;">
	                    <tr class="cell_element cell_first">
						    <td style="width: 5%;" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
							<td style="width: 10%;"><ww:property value='#session.local.a00133' /></td>
							<td style="width: 30%;"><ww:property value='#session.local.a00996' /></td>
							<td style="width: 30%;"><ww:property value='#session.local.a00016' /></td>
					    </tr>
	                </table>
	            </div>
	            <div style="height: 400px;overflow: auto;overflow-y:scroll;">
				    <table border="0" cellpadding="0" cellspacing="0" style="margin: 0px;">
				         <ww:iterator value="sjjks">
					            <tr class="cell_element cell_show">
								      <td  style="width:5%;" align="center">
									    <input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
									  </td>
									  <td  style="width: 10%;">
									     <ww:property value="name"  /> 
									  </td>
									  <td  style="width: 30%;">    
									     <span  title="<ww:property value='content'  />" id="content<ww:property value='id' />"><ww:property value="content.substring(0,50)"  />...</span>
									  </td>
									  <td  style="width: 30%;">
									  	 <span id="copy<ww:property value='id' />" data-code="<ww:property value='source' />" onclick="javascript:copy('copy<ww:property value='id' />')" onmouseover="javascript:copy('copy<ww:property value='id' />')" style="cursor: pointer;"><ww:property value="#session.local.a00022"  /></span><!-- 复制 -->
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
					<li><a href="javascript:pageto(<ww:property value='qian' />,'tosyscssjjk.vs');" class="pg_f"></a></li>
		            <!--页码显示上-->
					<ww:iterator id="q"  value="ps.qs">
		                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'tosyscssjjk.vs');" ><ww:property value="#q"  /></a> </li>
		            </ww:iterator>
		            
		            <!--当前页码-->
		            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'tosyscssjjk.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
		            
		             <!--页码显示下-->
		            <ww:iterator id="h"  value="ps.hs">
		                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'tosyscssjjk.vs')"><ww:property value="#h"  /></a></li>
		            </ww:iterator>
		            
	                <!--下一页-->
		            <li><a href="javascript:pageto(<ww:property value='hou' />,'tosyscssjjk.vs');" class="pg_e"></a></li>
				</ul>
			    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('tosyscsfbl.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
			    
				<div class="pg_count">
				     
				     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
				     <a href="javascript:setpagetype(10,'tosyscssjjk.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if> >10</a>
				     <a href="javascript:setpagetype(20,'tosyscssjjk.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
				     <a href="javascript:setpagetype(30,'tosyscssjjk.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
				     <a href="javascript:setpagetype(-1,'tosyscssjjk.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
				</div>
				
				<!--隐藏域 -->
	            
	            <!--当前页码-->
				<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
	            <!--总页码-->
	            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
	            <!--每页显示页数-->
	            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
	        
			</div>
		</div>
	</div>
</form>
</body>
</html>
