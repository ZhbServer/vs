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
         end: function(){ 	  
		      
 		 }
 	});   
	
}

//切换最新
function open_last(){
	document.form1.target="_self";
	document.form1.action="reusltlast.vs";
    document.form1.submit();  
}
</script>
</head>
<body>
 <form  name="form1" method="post" >
<input type="hidden" value="<ww:property value='rlid'  />" name="rlid" />
<div class="title bottom">
		<div class="t_container">
			
			<div class="loc">
			      &nbsp;&nbsp; <ww:property value='#session.local.a00420' />
			</div>
			
		</div>
		
		
			
</div>

<div class="c_middle download_manager">
    <div>
	    <div class="c_right_header" >
	    	<div class="row">
				<div class="btn-group" style="float: right;margin-right: 50px;">
		      	    <button onclick="open_last()"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00014' />
		      	    </button>
		        </div>
			</div>
		</div>
        <!--显示内容-->
        <div style="overflow: auto;height: 420px;width: 1050px;margin-top: -20px;margin-left: 30px;" >
			<table border="0" cellpadding="0" cellspacing="0">
			<tr class="cell_element cell_first">
		 
				<td style="width:40%" ><ww:property value='#session.local.a00116' /></td>
				<td style="width:20%" ><ww:property value='#session.local.a00117' /></td>
				<td style="width:20%" ><ww:property value='#session.local.a00124' /></td>
				<td style="width:10%" ><ww:property value='#session.local.a00752' /></td>
			
			
			</tr>
			<ww:iterator value="logs">
				<tr class="cell_element">
				      <td style="width:40%" title="<ww:property value='content'  />">
					     <ww:property value="contentsub"  /> 
					  </td>
					  <td style="width:20%" ><ww:property value="sdate"  /></td>
					  <td style="width:20%" >
					     <ww:property value="uname"  />
					  </td>
					  <td>
					        <!-- 查看详情 -->
							<i title="<ww:property value='#session.local.a00752' />" style="padding: 4px 8px;cursor: pointer;float: left;"  class="icon icon-eye-open" onclick="open_send_client(<ww:property value='id' />)"  ></i>
							
							
					  </td>
				</tr>
			</ww:iterator>
			</table>
		</div>
		
		<!--分页-->
		<div class="nav" style="width: 1000px;margin-left:20px;margin-top: -15px;">
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'reusltlasthistory.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'reusltlasthistory.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'reusltlasthistory.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'reusltlasthistory.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'reusltlasthistory.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('countlogsendlist.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'reusltlasthistory.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
			     <a href="javascript:setpagetype(20,'reusltlasthistory.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'reusltlasthistory.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'reusltlasthistory.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			
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
