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
  
var b00028="<ww:property value='#session.local.b00028'  />";

function outlog() {

	var sel=document.getElementById("sel").value;

    //获取已经选择的select
    var id_array=new Array();  
	$('input[name="qx"]:checked').each(function(){  
	    id_array.push($(this).val());//向数组中添加元素  
	});  
	var idstr=id_array.join(',');//将数组元素连接起来以构建一个字符串  

	if(idstr.length==0){
		layer.alert("<ww:property value='#session.local.a00018' />");
		return ;
    }
   
    layer.open({
		type: 2,
		area: ['660px', '520px'],
        offset: '10px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: 'outsendlog.vs?idstr='+idstr,
        scrollbar: false,
        end: function(){ 
		    	
		}
    });

	
}



function open_send_client(logid){
	layer.open({
 		 type: 2,
         area: ['1000px', '580px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'countlogsendclient.vs?logid='+logid,
         scrollbar: false,
         closeBtn :1,
         end: function(){ 	  
		      
 		 }
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
			        <span class="function"><ww:property value='#session.local.a00113' /></span>
			        <span class="function"><ww:property value='#session.local.a00114' /></span>
			        <span class="material_bg"><ww:property value='#session.local.a00121' /></span>
			</div>
		</div>
</div>

<div class="c_middle download_manager">
    
    <div class="c_left" >
	
	    <div class="subNav_menu" onclick="open_log()"  name='0'>
		    <ww:property value="#session.local.a00429"/>
		</div><!-- 操作日志 -->
		<div class="subNav_menu" name='1' onclick="open_logsend()" style="color:#ffffff; background-color:#007ccd;">
		    <ww:property value="#session.local.a00121"/>
		</div><!-- 发布日志 -->
		<div class="subNav_menu" onclick="open_logclient()"  name='2'>
		    <ww:property value="#session.local.b00222"/>
		</div><!-- 终端日志 -->
		
		<ww:if test="#session.version_onoff.pwdPloy==1">
			<div class="subNav_menu" onclick="open_log_user_login()"  name='2'>
			       <ww:property  value="#session.local.b00252"/>          
			</div><!-- 登陆退出记录 -->
		</ww:if>
		
	</div>
	
	<div class="c_right">
	    <div class="c_right_header" style="height: 48px;">
		 
			 <div class="row">
			      
			      <div class="col-xs-1">
	                    <select  id="sel" name="sel"  class="form-control input-sm" style="width: 90px;" >
			                 <option  <ww:if test="sel==0"> selected="selected" </ww:if>  value="0"><ww:property value='#session.local.a00066' /></option>
					         <option  <ww:if test="sel==1"> selected="selected" </ww:if>  value="1"><ww:property value='#session.local.a00122' /></option>
					    </select>  
				  </div>
				  
				  <div class="col-xs-2" style="margin-left: 25px;">
				     <input  name="ser"  id="ser"  value="<ww:property value='ser' />" class="form-control input-sm" type="text" placeholder="" style="width: 110px;" />
				  </div> 
				  
				  <div class="col-xs-3" style="margin-left: -28px;" >
				     	<button  onclick="selsc('countlogsendlist.vs')" class="btn btn-sm btn-primary" type="button" style="padding: 4px 8px;"><i class="icon icon-search"></i></button>
				  </div> 
					   	
				  <div class="btn-group" style="float: right;margin-right: 10px;">
<%-- 				  	   <button onclick="del_sel('delsendlog.vs')"   type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button> --%>
				  </div>	  
				  
				  
				    <div class="btn-group" style="float: right;margin-right: 10px;">
<%-- 				  	   <button onclick="open_logsend()"    type="button" class="btn btn-sm btn-primary" ><ww:property value='#session.local.a00121' /></button> --%>
 				           <button onclick="outlog()"    type="button" class="btn btn-sm btn-primary" ><ww:property value='#session.local.a00115' /></button>
<%-- 				       <button onclick="del_sel('delcountlog.vs')"        type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button> --%>
				   </div>	
				   
				   
			 </div>
			 
			 
		</div>
        <!--显示内容-->
        <div style="height: 400px;width: 1050px;margin-top:-20px;" >
             <!-- 固定标题 -->
            <div style="padding-right:17px;margin: 0px;">
               <table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
                  <tr class="cell_element cell_first">
				    <td style="width:5%" >
				       &nbsp;  <input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/>
                         <!--<ww:property value='#session.local.a00034' />-->
				    </td>
					<td style="width:20%" ><ww:property value='#session.local.a00116' /></td>
					<td style="width:20%" ><ww:property value='#session.local.a00117' /></td>
					<td style="width:10%" ><ww:property value='#session.local.a00124' /></td>
					<td style="width:20%" ><ww:property value='#session.local.a00752' /></td>
				  </tr>   
				</table>
            </div>
            <div style="height:400px;overflow: auto;overflow-y:scroll;">
				<table border="0" cellpadding="0" cellspacing="0" style="margin: 0px;">
				<ww:iterator value="logs">
					<tr class="cell_element cell_show">
					  <td style="width:5%">
					    &nbsp;&nbsp;<input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
                        <!--<ww:property value="id" />-->
					  </td>
					  <td style="width:20%" title="<ww:property value='content'  />">
					     <ww:property value="contentsub"  /> 
					  </td>
					  <td style="width:20%" ><ww:property value="sdate"  /></td>
					  <td style="width:10%" >
					     <ww:property value="uname"  />
					  </td>
					  <td  style="width:20%" >
					        <!-- 查看详情 -->
							<i title="<ww:property value='#session.local.a00752' />" style="padding: 4px 8px;cursor: pointer;float: left;"  class="icon icon-eye-open" onclick="open_send_client(<ww:property value='id' />)"  ></i>
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
				<li><a href="javascript:pageto(<ww:property value='qian' />,'countlogsendlist.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'countlogsendlist.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'countlogsendlist.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'countlogsendlist.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'countlogsendlist.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('countlogsendlist.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'countlogsendlist.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if> >10</a>
			     <a href="javascript:setpagetype(20,'countlogsendlist.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'countlogsendlist.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'countlogsendlist.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			     
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
