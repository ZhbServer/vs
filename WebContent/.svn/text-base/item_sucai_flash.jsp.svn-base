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
 
a:visited {color:#343F51;};
a:link {color:#343F51;};
.dblistse{font-size: 14px;font-family: Microsoft YaHei; background-color: #77B2EE;} 
/*background-color:#134AFF;*/
/*overflow:hidden*/
</style>
<script type="text/javascript">
 /*预览图片*/
 function selif(iurl){
    
     document.getElementById("selif").src="itemseeflash.vs?fname="+iurl;

     //赋值
     //document.getElementById("selfile").value=iurl;

 }
/*加到列表事件*/
 function addMuti(){
    var str=document.getElementsByName("qx");
    var objarray=str.length;
  
    var chestr="";
 
    var count=0;
    for (i=0;i<objarray;i++)
    {
 	 var sel=document.getElementById("dblistse");
 	
      if(str[i].checked == true)
      {
    	 count++;
     	
       
     
      }
    }
    if(count!=1){
        layer.msg("<ww:property value='#session.local.a00289'/>");
        return;
    }
    for (i=0;i<objarray;i++)
    {
 	 var sel=document.getElementById("dblistse");
 	
      if(str[i].checked == true)
      {
    	  sel.options.remove(0);   
     	  var strs= new Array(); 
          var svalues=str[i].value;
          strs=svalues.split("_");
       
          sel.options.add(new Option(strs[1],strs[0]));  
      }
    }
           
 }


	
 //移除option
 function removeOption(){ 
    var sel=document.getElementById("dblistse");   
	   for(var i=sel.options.length-1;i>=0;i--){  
	     if(sel.options[i].selected){  
	        sel.options.remove(i);   
	     }  
	   }   
	}

   
 //获取select值
 function getselect(){
 	    var sel=document.getElementById("dblistse");
	    var filenames="";
		var temp;
		for(var i=0;i<sel.options.length;i++)
		{
		  temp= sel.options[i].value;
		  if(i==0)
		  {
		    filenames=temp;
		  }
		  else
		  {
		    filenames+="|"+temp;
		  }
		}
		
		document.getElementById("filenames").value=filenames;

 }
 /*搜索*/
 function  selsc_select(url){
	 getselect();
	 selsc(url);
 }
 /*分组跳转*/
 function scgroupjump_select(id,url){
	 getselect();
	 scgroupjump(id,url);
 }
 /*分页*/
 function pageto_select(type,url){
	 getselect();
	 pageto(type,url);
 }
 function gogo_select(url){
	 getselect();
	 gogo(url);
 }

//保存
function gosubmit()  {  
      var sel=document.getElementById("dblistse");  
	  if(sel.options.length<1)
	  {
	    layer.msg("<ww:property value='#session.local.a00282'/>");
		return false;
	  }
	  var xy_x = document.getElementById("xy_x").value;
	  var xy_y = document.getElementById("xy_y").value;   
      var width = document.getElementById("width").value;
	  var height = document.getElementById("height").value;
	
	  if(xy_x<0){
			layer.msg("<ww:property value='#session.local.a00283' />");
	        return false;
	   }
	  if(xy_y<0){
			layer.msg("<ww:property value='#session.local.a00284' />");
	        return false;
	  }
	  if(width<=0){
		layer.msg("<ww:property value='#session.local.a00285' />");
        return false;
	  }
	  if(height<=0)
	  {
		  layer.msg("<ww:property value='#session.local.a00286' />");
          return false;
	  }
	
      var filenames="";
	  var temp;
	  for(var i=0;i<sel.options.length;i++)
	  {
	      temp= sel.options[i].value;
		  if(i==0){ filenames=temp;}
		  else
		  {filenames+="|"+temp;}
	  }
	  document.getElementById("filenames").value=filenames;
	  return true;
 }  
 function savaSubmit(){
      if(gosubmit()){
     	 document.form1.action="adflashto.vs";
     	 document.form1.submit();

      }
      
 }
</script>
</head>
<body>
 <form  name="form1" method="post" >
<!--上-->
<div class="part1">
	<div class="part1_container">
	
		<div class="am_two_left">
			<!-- 预览 -->
			<div class="div_title"><ww:property value='#session.local.a00253' />
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        <!-- 添加背景 -->
<!--		        <input type="button"  onclick="addBj()" value="<ww:property value='#session.local.a00271' />" style="width:55px; height:20px; text-align:center; background-color:#FCA41F; color:#ffffff; cursor:pointer;border: 0px;"/>-->
			    &nbsp;&nbsp;
			    <!-- 取消背景 -->
<!--			    <input type="button"  onclick="unBj()" value="<ww:property value='#session.local.a00272' />" style="width:55px; height:20px; text-align:center; background-color:#FCA41F; color:#ffffff; cursor:pointer;border: 0px;"/>-->
			</div>
			<!-- 预览展示 -->
			<div>
<!--	<img id="selimg" src="image/material_add/container_pci.jpg" width="100%" height="338px;"/>-->
			    <iframe id="selif" src="" width="100%" height="338px" frameborder=0></iframe>
			</div>
		
		</div>
		<div class="am_two_right">
		<div class=" div_title div_type">      
		    <!-- 类型:背景 -->
		    <ww:property value='#session.local.a00035' />:Flash
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		    <select id="sel" name="sel">
		             <option  <ww:if test="sel==0"> selected="selected" </ww:if>   value="0"><ww:property value='#session.local.a00066' /></option>
					 <option  <ww:if test="sel==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.a00067' /></option>
					 <option  <ww:if test="sel==2"> selected="selected" </ww:if>   value="2"><ww:property value='#session.local.a00068' /></option>
		    </select>    
		    :
		    <input name="ser"  type="text" class="sea_text" value="<ww:property value='ser' />"/>
			<!-- 搜索 -->
		    <input type="button" onclick="selsc_select('tosceneflash.vs')" value="<ww:property value='#session.local.a00263' />" style="width:50px; height:20px; text-align:center; background-color:#FCA41F; color:#ffffff; cursor:pointer;border: 0px;"/>
		    <!-- 上传 -->
            <!--<input type="button" value="<ww:property value='#session.local.a00063' />" style="width:50px; height:20px; text-align:center; background-color:#FCA41F; color:#ffffff; cursor:pointer;border: 0px;"/>-->
		</div>
		 <!-- 分组 -->
		<div class="c_left am_drop" style="overflow: auto;height: 340px;">
			 <div  onclick="scgroupjump_select(0,'tosceneflash.vs')" class="subNav_sucai"  <ww:if test="gssi.sucaigroupid==0">  style="background-color:#007CCD;color: white;" </ww:if> ><ww:property value='#session.local.a00029' /></div>
			
			
			<ww:iterator value="listsfgp">
				<div <ww:if test="gssi.sucaigroupid==id">  style="background-color:#007CCD;color: white;" </ww:if>  onclick="scgroupjump_select(<ww:property value='id'  />,'tosceneflash.vs')" class="subNav_sucai">
				   <ww:property value="name"  />
				   <ww:if test="#session.urid!=userid">
                         (<ww:property value="uname" />)
                   </ww:if>
				</div>
			</ww:iterator>
			
			
		</div>
		 <!--素材列表-->
		<div class="c_right am_right">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr class="cell_element cell_first">
					<td align="center">
<!--					    <input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/>-->
					    <ww:property value='#session.local.a00016' />  
					</td><!-- 操作  -->
					<td width="50%"><ww:property value='#session.local.a00067' /></td><!--文件名 -->
					<td><ww:property value='#session.local.a00072' /></td><!--文件大小 -->
					<td><ww:property value='#session.local.a00068' /></td><!--上传用户 -->
<!--					<td><ww:property value='#session.local.a00073' /></td>上传时间 -->
				</tr>
				
				<ww:iterator value="listsc" status="groupStatus">
				    <tr class="cell_element">
					  <td align="center"><input value="<ww:property value='id' />_<ww:property value='name' />" type="checkbox" class="check_box" name="qx" id="qx_<ww:property value="#groupStatus.index" />" /></td>
					  <td><a title="<ww:property value="name"/>" style="text-decoration:none;display:inline;" href="javascript:selif('<ww:property value='filename'/>');"><ww:property value="namesub"/></a></td>
					  <td><ww:property value="size"/>M</td>
					  <td><ww:property value="user"/></td>
<!--					  <td><ww:property value="sdate"/></td>-->
				   </tr>
				</ww:iterator>			
			  </table>
               <!--分页-->
                 
		      <div class="nav" style="bottom:0px;">
						<ul class="pg">
			                <!-- 上一页-->
							<li><a href="javascript:pageto_select(<ww:property value='qian' />,'tosceneflash.vs');" class="pg_f"></a></li>
				            <!--页码显示上-->
							<ww:iterator id="q"  value="ps.qs">
				                  <li><a href="javascript:pageto_select(<ww:property value='#q'/>,'tosceneflash.vs');" ><ww:property value="#q"  /></a> </li>
				            </ww:iterator>
				            
				            <!--当前页码-->
				            <li><a href="javascript:pageto_select(<ww:property value='#request.id'  />,'tosceneflash.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
				            
				             <!--页码显示下-->
				            <ww:iterator id="h"  value="ps.hs">
				                  <li><a href="javascript:pageto_select(<ww:property value='#h'/>,'tosceneflash.vs')"><ww:property value="#h"  /></a></li>
				            </ww:iterator>
				            
			                <!--下一页-->
				            <li><a href="javascript:pageto_select(<ww:property value='hou' />,'tosceneflash.vs');" class="pg_e"></a></li>
						</ul>
				        <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo_select('tosceneflash.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
				    
						<div class="pg_count">
						     
						    <!--  <span><ww:property value='#session.local.a00079' /></span>
						     <a href="javascript:setpagetype(10,'tosclist.vs');" <ww:if test='pagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
						     <a href="javascript:setpagetype(20,'tosclist.vs');" <ww:if test='pagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
						     <a href="javascript:setpagetype(30,'tosclist.vs');" <ww:if test='pagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a> -->
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
		            <!-- 选中背景 -->
		            <input type="hidden" name="selfile"  id="selfile" value=""/>
                    <!--缩放-->
                    <input type="hidden" id="sf" value="<ww:property value="sf"/>" name="sf" />
                    <!--已选列表-->
                    <input type="hidden"  name="filenames" id="filenames" /> 
                    <input type="hidden" value="<ww:property value='mfile'/>" name="mfile" id="mfile" />
		   </div>
	    </div>
		</div>
	
	</div>
</div>
<!--下-->
<div class="part2">
	<div class="part2_left">
        <!--左-->
		<div class="px_show">
		   <div>X:
			   <span>
			       <input id="xy_x" name="xy_x" type="text" <ww:if test="xy_x==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_x' />"</ww:else>  style="width: 40px;height: 18px;" value="0"   onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
			       
			   
			   </span>
		   </div>
		   <div>Y:
		      <span><input id="xy_y" name="xy_y" type="text" <ww:if test="xy_y==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_y' />"</ww:else> style="width: 40px;height: 20px;" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
		      </span>
		   </div>
		   <div>
		       <ww:property value='#session.local.a00032' />:
		         <span>
		            <input name="width" id="width" type="text" style="width:40px;height: 20px;" <ww:if test="width==0">value="300"</ww:if><ww:else>value="<ww:property value='width' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
		          </span>
		   </div><!-- 宽 -->
		   <div>
		      <ww:property value='#session.local.a00033' />:
		          <span>
		              <input name="height" id="height" type="text" style="width:40px;height: 20px;"  <ww:if test="height==0">value="300"</ww:if><ww:else>value="<ww:property value='height' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
		          </span>
		   </div><!-- 高-->
	    </div>
		<div class="clear"></div>
	
		<div class="clear"></div>
		<!-- 按比例 --> 
	    <div style="margin-top: 25px;" class="special">
<!--        <input <ww:if test='bl==1'>checked="checked"</ww:if> type="checkbox" value="1" name="blflag" />-->
<!--        <ww:property value='#session.local.a00288' />-->
		
		</div>
<!--		<div class="prev_button"></div>-->
	</div>
	<div class="part2_2">
		<div class="div_title"><ww:property value='#session.local.a00267' /></div><!-- 已选列表 -->
		<div class="part2_2_container">
	
			  <select style="width:74%; height:180px; border:1px solid #d5d5d5;overflow-y:scroll;float:left;" class="dblistse"  id="dblistse" multiple name="list2" size="14"  >  
	                    <ww:iterator value="yxsclist">
	                       <option value="<ww:property value='id' />">
	                          <ww:property value="name" />
	                       </option>
	                    </ww:iterator>
	           </select>
	        
		<div class="part2_2_3">
			<a href="javascript:addMuti();"><ww:property value='#session.local.a00270' /></a>  <!-- 添加到已选列表 -->
<!--			<a href="javascript:upOption();"><ww:property value='#session.local.a00268' /></a>   上移 -->
<!--			<a href="javascript:bottomOption();"><ww:property value='#session.local.a00269' /></a>   下移-->
			<a href="javascript:removeOption();"><ww:property value='#session.local.a00025' /></a>  <!-- 删除 -->
		</div>
		</div>
	</div>
	<div class="part2_3">
	<a href="javascript:openupload_item('upflash.jsp',5,'tosceneflash.vs');"><img src="image/<ww:property value='#session.local.a00000' />/am_upload.png" alt="上传"/></a>  <!-- 上传 -->
	<a href="javascript:savaSubmit();"><img src="image/<ww:property value='#session.local.a00000' />/am_save.png" alt="保存"/></a>    <!-- 保存 -->
	<a href="javascript:close_win_nov();"><img src="image/<ww:property value='#session.local.a00000' />/am_return.png" alt="返回"/></a>  <!-- 返回-->
	</div>
</div>
</form>
</body>
</html>