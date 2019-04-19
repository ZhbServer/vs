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
<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />

<script type="text/javascript" src="zTree/3.52/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="zTree/3.52/jquery.ztree.excheck-3.5.js"></script>
<link rel="stylesheet" href="zTree/3.52/zTreeStyle.css" />

<style>
body,html{
margin:0px;
padding:0px;
border:0px;
}
</style>
<script type="text/javascript">
var itemsname;

//返回选中的节目
function onclickitem(){	

	$("#items").find('input[type=checkbox]').bind("click", function(){ 
        //当前的checkbox是否选中
        if(this.checked){
            //除当前的checkbox其他的都不选中
            $("#items").find('input[type=checkbox]').not(this).attr("checked", false); 
        }
	});

	$("#itemname td").click(function(){
		
		var item=$(this).next().text();				 	 
		itemsname=$.trim(item);				
    });	 			
	
}

//保存
function sel_item(){
	 var qx=$('input:checkbox[name="qx"]:checked').val();
		
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
	    layer.msg("<ww:property value='#session.local.a00415' />"); 
	    return; 
	   }
				  
	  	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引		

	  	window.parent.returnValue=itemsname+"|"+qx; 
	  							 
	     window.parent.layer.close(index);
		
}
</script>
</head>
<body>
<form  name="form1" method="post" >
<div class="title bottom" style="width: 600px;">
		<div class="t_container">
			<div class="loc" style="margin-left: 20px;">						        
				 <span class="material_bg"><ww:property value='#session.local.c00040' /></span>				        			      
			</div>			
		</div>
		
</div>

<div style="width: 600px;">
    
	<div class="c_right_header" style="height: 35px;">  		
			<div class="row" style="width: 600px;">
				<div class="col-xs-1" style="margin-left: 5px;">
				    
			            <select  id="sel" name="sel"  class="form-control input-sm" style="width: 90px;" >              
						   <option  <ww:if test="sel==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.a00255' /></option>					 
					    </select>  
		             
				  </div>
				  <div class="col-xs-2" style="margin-left: 25px;">
				      <input  name="ser" id="ser" class="form-control input-sm" type="text" style="width: 130px;" value="<ww:property value='ser' />"/>
				  </div> 
				  <div class="col-xs-3" style="margin-left: 28px;width:50px;" >
				     	<button  onclick="selsc('toaddtreasureitem.vs')" class="btn btn-sm btn-primary" type="button" style="padding: 4px 8px;cursor: pointer;"><i class="icon icon-search"></i></button>
				  </div> 
			
			
			    <div class="btn-group" style="float: right;">
			        &nbsp;
					  <button onclick="sel_item()"   style="margin-right: 3px;cursor: pointer;"    type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00080' /></button>
					
			    </div>	
			</div>
		</div>
         <!--显示内容-->
        <div style="height: 400px;width: 550px;" >
        
            <!-- 固定标题 -->
            <div style="padding-right:17px;margin-left: 30px;width: 550px;">
            
            	<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;width: 550px;">
						<tr class="cell_element cell_first " >
							<td width="40%" align="center"><ww:property value='#session.local.a00330' /></td>
							<td width="60%"><ww:property value='#session.local.a00255' /></td>																	
						</tr>
				</table>
                 
             </div>
             <div style="height: 400px;width: 550px;overflow: auto;margin-left: 30px;" id="items">
				<table border="0" cellpadding="0" cellspacing="0" style="margin-top:0px;margin-bottom: 0px;width: 550px;">
		                <ww:iterator value="items">
						<tr class="cell_element cell_show" id="itemname">
						  <td width="40%" align="center">
						  	<input  onclick="onclickitem()"  isgx="<ww:property value='isgx' />"  oncheckvalue="<ww:property value='ocheck' />" type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
						  </td>
						  <td width="60%" style="line-height: 25px;" class="name" >						      
						      <ww:property value="name"/>						         						      						     					      
						  </td>						 						 						 					 
						</tr>
					    </ww:iterator>
				    </table>
			</div>
		</div>
        <!--分页-->
        	<div class="nav" style="width: 600px;margin-top: -2px">
	       
				<ul class="pg" style="width: 250px;">
	                <!-- 上一页-->
					<li><a href="javascript:pageto(<ww:property value='qian' />,'toaddtreasureitem.vs');" class="pg_f"></a></li>
		            <!--页码显示上-->
					<ww:iterator id="q"  value="ps.qs">
		                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'toaddtreasureitem.vs');" ><ww:property value="#q"  /></a> </li>
		            </ww:iterator>
		            
		            <!--当前页码-->
		            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'toaddtreasureitem.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
		            
		             <!--页码显示下-->
		            <ww:iterator id="h"  value="ps.hs">
		                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'toaddtreasureitem.vs')"><ww:property value="#h"  /></a></li>
		            </ww:iterator>
		            
	                <!--下一页-->
		            <li><a href="javascript:pageto(<ww:property value='hou' />,'toaddtreasureitem.vs');" class="pg_e"></a></li>
					
					
				</ul>
				
				<div style="width: 280px;" class="pg_count" >
				     
				     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
				     <a href="javascript:setpagetype(10,'toaddtreasureitem.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
				     <a href="javascript:setpagetype(20,'toaddtreasureitem.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
				     <a href="javascript:setpagetype(30,'toaddtreasureitem.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
				     <a href="javascript:setpagetype(-1,'toaddtreasureitem.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
				</div>
				
				<!--隐藏域 -->
	            
	            <!--当前页码-->
				<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
	            <!--总页码-->
	            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
	            <!--每页显示页数-->
	            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
	            <!--分组-->
	            <input type="hidden" name="igr.itemgroupid"  id="gpid" value="<ww:property value='igr.itemgroupid'/>"/>
	            <!--树id-->
				<input type="hidden" name="treeid"  id="treeid" value=""/>			   
						
       	</div>
	
	
</div>
</form>
</body>
</html>
