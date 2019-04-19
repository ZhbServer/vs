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



function addjhitem(){
    var jhid=document.getElementById("jhid").value;
	layer.open({
		type: 2,
        area: ['1180px', '440px'],
        offset: '20px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: 'toadjhitem.vs?igr.itemgroupid=0&jhid='+jhid+"&jhtype=1",
        scrollbar: false,
        end: function(){ 
    	 
		   if(window.returnValue==undefined||window.returnValue==""){
			   window.returnValue=""; 
              
		   }else{
			   var rv= window.returnValue;
			   window.returnValue="";
			   //以下是调用上面的函数
		       var mb = myBrowser();
		      
		       if ("Chrome" == mb) {
			    	window.location.href="jhtimeitemlist.vs?jhid="+jhid;
			   }else{
				    window.open("jhtimeitemlist.vs?jhid="+jhid,"_self");
			   }  
		   }               
		}
	});
	
}
function open_items(itemIdsAndType){
	   layer.open({
			type: 2,
	        area: ['620px', '400px'],
	        offset: '20px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: 'tocpplayitem.vs?itemIdsAndType='+itemIdsAndType,
	        scrollbar: false,
	        end: function(){ 
	    	          
			}
		});
}

//删除
function deljhitem(){

	//选择终端
    var ids=document.getElementsByName('qx'); 
	var count=0;
	var itemsids="";
	for(var i=0;i<ids.length;i++) 
    { 
      if(ids[i].checked==true) 
      { 
       
         count++;
      } 
    } 
    if(count==0) 
    {     
          layer.msg("<ww:property value='#session.local.a00018' />"); 
          return ; 
    }
    layer.confirm("<ww:property value='#session.local.a00092' />?", {icon: 3, title:"<ww:property value='#session.local.a00093' />",btn: ["<ww:property value='#session.local.a00080' />", "<ww:property value='#session.local.a00014' />"]}, function(index,layero){
	    document.form1.action="deljhitem.vs?jhtype=1";
	    document.form1.submit();  
    });
}
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
	    <div class="c_right_header" style="height: 48px;">
		
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
		         <div class="btn-group" style="float: right;margin-right: 50px;">
		             <button onclick="addjhitem()"      type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00387' /></button><!-- 添加节目 -->
			         <button onclick="onhref('jhlist.vs?jhtype=1')"      type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00655' /></button><!-- 返回 -->
			         <button onclick="deljhitem()"  type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button><!-- 删除 -->			      			      
			     </div>	
		      
		    </div>
		    
		    
		</div>
        <!--显示内容-->
         <div style="height: 400px;width: 1050px;margin-top: -20px;" >
           <!-- 固定标题 -->
           <div style="padding-right:17px;margin-left: 30px;">
               <table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
					<tr class="cell_element cell_first">
					<td width="10%" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
					<td width="30%">&nbsp;<ww:property value='#session.local.a00599' /></td><!-- 节目 -->
					<td width="20%"><ww:property value='#session.local.a00493' /></td><!-- 周期-->
					<td width="20%"><ww:property value='#session.local.a00540' /></td><!-- 开始时间-->
					<td width="20%"><ww:property value='#session.local.a00541' /></td><!-- 结束时间-->
					
					</tr>
				</table>
            </div>
            <div style="height: 400px;margin-top:-5px;margin-left: 30px;">
               <table border="0" cellpadding="0" cellspacing="0" style="margin-top:0px;margin-bottom: 0px;">
	                <ww:iterator value="jhitems">
					<tr class="cell_element cell_show">
					  <td width="10%" align="center"><input oncheckvalue="<ww:property value='ocheck' />"  type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/></td>
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
		<div class="nav" style="width: 1000px;margin-left:20px;">
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'jhtimeitemlist.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'jhtimeitemlist.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'jhtimeitemlist.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'jhtimeitemlist.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'jhtimeitemlist.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('jhtimeitemlist.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'jhtimeitemlist.vs');" <ww:if test='pagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
			     <a href="javascript:setpagetype(20,'jhtimeitemlist.vs');" <ww:if test='pagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'jhtimeitemlist.vs');" <ww:if test='pagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(<ww:property value='total'/>,'jhtimeitemlist.vs');" <ww:if test='pagetype==total'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			</div>
			
			<!--隐藏域 -->
            
            <!--当前页码-->
			<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
            <!--总页码-->
            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
            <!--每页显示页数-->
            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='pagetype'/>" />
           
		</div>
	</div>
</div>
</form>
</body>
</html>
