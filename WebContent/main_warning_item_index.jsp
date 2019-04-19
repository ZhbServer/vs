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


<link rel="stylesheet" href="../css/index.css"/>
<script type="text/javascript" src="../js/jq/jquery.js"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>
<script type="text/javascript" src="../js/two_menu.js"></script>
<script type="text/javascript" src="../js/fresh.js"></script>
<script type="text/javascript" src="../js/constant.js"></script>
<script type="text/javascript" src="../js/<ww:property value='#session.local.a00000' />/common.js"></script>

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="../zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript">
  




//审核
function ocheckjh(otype){
	 var ids=document.getElementsByName('qx');
     var isSel=false; 
	  for(var i=0;i<ids.length;i++) 
	   { 
	    if(ids[i].checked==true) 
	    { 
	    isSel=true; 
	     break; 
	    } 
	   } 
	   if(isSel==false) 
	   { 
	    layer.msg("<ww:property value='#session.local.b00305' />"); 
	    return ; 
	   }
       document.form1.action="onocheckjh.vs?type=1&otype="+otype;
	   document.form1.submit();
}

//节目详情
function item_info(id){
	
	 layer.open({
		type: 2,
		area: ['1000px', '500px'],
		offset: '20px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: "seeiteminfo.vs?itemId="+id,
        scrollbar: false,
        end: function(){ 
    	   
		}
	 }); 
}


//查看
function jh_see(jhid,posType){
  
    window.location.href="jhtimesee.vs?jhid="+jhid+"&posType="+posType;   
	
}



</script>
</head>
<body>
 <form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			
			         &nbsp;&nbsp; <ww:property value='#session.local.a00405' /> :
	
				        <span class="material_bg"><ww:property value='#session.local.b00306' /></span>
				        
			      
			</div>
			<div class="material_show" style="margin-right: -55px;">
			
			</div>
		</div>
</div>

<div class="c_middle download_manager">
    

	
	<div>
	    <div class="c_right_header" style="height: 48px;">
		
			<div class="row" style="display: none;">
			    <div class="btn-group" style="float: right;margin-right: 50px;">
			          <button onclick="page_jump_href('tonoocheckjh.vs?type=1')"       type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00822' /></button>
					  <button onclick="page_jump_href('tonoocheckjh.vs?type=2')"   type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00823' /></button>
					  &nbsp;
					  <button onclick="ocheckjh(1)"   style="margin-left: 20px;"    type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00596' /></button>
					  <button onclick="ocheckjh(3)"   type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00592' /></button>
			    </div>	
			</div>
		</div>
         <!--显示内容-->
        <div style="height: 400px;width: 1080px;margin-top: -10px;" >
        
            <!-- 固定标题 -->
            <div style="padding-right:17px;margin-left: 30px;">
                 <table style="margin: 0px;" border="0" cellpadding="0" cellspacing="0">
					<tr class="cell_element cell_first">
					   
<!--					    <td style="width:20%" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>-->
						
						<td style="width:5%"></td>
						
						<td style="width:20%"><ww:property value='#session.local.a00038' /></td><!-- 终端名 -->
						
					    <td style="width:15%"><ww:property value='#session.local.a00040' /></td><!-- 终端标识 -->
					    
					    <td style="width:25%"><ww:property value='#session.local.a00255' /></td><!-- 节目名 -->
					    
					    <td style="width:15%"><ww:property value='#session.local.b00307' /></td><!-- 结束时间 -->
					    
                        <!--<td style="width:10%"><ww:property value='#session.local.a00016' /></td> 操作-->
					    
				   </tr>
				 </table>	
             </div>
             <div style="height: 400px;overflow: auto;margin-top:2px;margin-left: 30px;">
				<table style="margin: 0px;" border="0" cellpadding="0" cellspacing="0">
				
					<ww:iterator value="listis">
						 <tr class="cell_element cell_show">
<!--						 <td style="width:20%" align="center">-->
<!--						     <input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>-->
<!--                              <ww:property value="id" />-->
<!--						  </td>-->
                          <td style="width:5%"></td>
                          
						  <td style="width:20%">
						  
						           <ww:if test="clientname.length()>20"><ww:property  value="clientname.substring(0,20)"/>...</ww:if>
						           <ww:else><ww:property value='clientname' /></ww:else>
						    
						  </td>
						
						
						  <td style="width:15%">
						     <ww:property value="mark" />
						  </td>
						  
						  <td style="width:25%">
						         <ww:if test="itemNames.length()>20"><ww:property  value="itemNames.substring(0,20)"/>...</ww:if>
						         <ww:else><ww:property value='itemNames' /></ww:else>
						  </td>
						  
						  
						  <td style="width:15%">
						     <ww:property value="edate" />
						  </td>
						
						  
<!--						  <td style="width: 10%">-->
<!--						  -->
<!--						        详情 -->
<!--							  	  <span title="<ww:property value='#session.local.a00752' />" onclick="item_info(<ww:property value='id'/>)" style="cursor: pointer;margin-right: 5px;">-->
<!--							  	    -->
<!--							  	     <i class="icon icon-list-alt"></i>-->
<!--							  	   -->
<!--							  	  </span>-->
<!--							  	  -->
<!--						  </td>-->
						</tr>
					</ww:iterator>				
				</table>
			</div>
		</div>
        <!--分页-->
		<div class="nav" style="width: 1000px;margin-left:20px;">
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'towarningitem.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'towarningitem.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'towarningitem.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'towarningitem.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'towarningitem.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('tonoclient.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'towarningitem.vs');" <ww:if test='pagetype==10'>style="background-color:#FFA534;"</ww:if> >10</a>
			     <a href="javascript:setpagetype(20,'towarningitem.vs');" <ww:if test='pagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'towarningitem.vs');" <ww:if test='pagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(<ww:property value='total'/>,'towarningitem.vs');" <ww:if test='pagetype==total'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
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
