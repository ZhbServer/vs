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
		    <ww:property value='#session.local.a00035' />:<ww:property value='#session.local.a00062' />
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
		    <input type="button" onclick="selsc_select('toscenetxt.vs')" value="<ww:property value='#session.local.a00263' />" style="width:50px; height:20px; text-align:center; background-color:#FCA41F; color:#ffffff; cursor:pointer;border: 0px;"/>
		    <!-- 上传 -->
            <!--<input type="button" value="<ww:property value='#session.local.a00063' />" style="width:50px; height:20px; text-align:center; background-color:#FCA41F; color:#ffffff; cursor:pointer;border: 0px;"/>-->
		</div>
		 <!-- 分组 -->
		<div class="c_left am_drop" style="overflow: auto;height: 340px;">
			 <div  onclick="scgroupjump_select(0,'toscenetxt.vs')" class="subNav_sucai"  <ww:if test="gssi.sucaigroupid==0">  style="background-color:#007CCD;color: white;" </ww:if> ><ww:property value='#session.local.a00029' /></div>
			
			
			<ww:iterator value="listsfgp">
				<div <ww:if test="gssi.sucaigroupid==id">  style="background-color:#007CCD;color: white;" </ww:if>  onclick="scgroupjump_select(<ww:property value='id'  />,'toscenetxt.vs')" class="subNav_sucai">
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
							<li><a href="javascript:pageto_select(<ww:property value='qian' />,'toscenetxt.vs');" class="pg_f"></a></li>
				            <!--页码显示上-->
							<ww:iterator id="q"  value="ps.qs">
				                  <li><a href="javascript:pageto_select(<ww:property value='#q'/>,'toscenetxt.vs');" ><ww:property value="#q"  /></a> </li>
				            </ww:iterator>
				            
				            <!--当前页码-->
				            <li><a href="javascript:pageto_select(<ww:property value='#request.id'  />,'toscenetxt.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
				            
				             <!--页码显示下-->
				            <ww:iterator id="h"  value="ps.hs">
				                  <li><a href="javascript:pageto_select(<ww:property value='#h'/>,'toscenetxt.vs')"><ww:property value="#h"  /></a></li>
				            </ww:iterator>
				            
			                <!--下一页-->
				            <li><a href="javascript:pageto_select(<ww:property value='hou' />,'toscenetxt.vs');" class="pg_e"></a></li>
						</ul>
				        <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo_select('toscenetxt.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
				    
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
		<div class="part2_first">
		    <!--显示区域  -->
		    <div class="div_title"><ww:property value='#session.local.a00354' /></div>
		    <textarea></textarea>
		</div>
		<div class="part2_second">
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
		<ul class="ps_2">
		<li>
		  <!-- 字体大小  -->
		  <ww:property value='#session.local.a00324' />：
		  <select>
			 <option value="1">1</option>
             <option value="2">2</option>
             <option value="3">3</option>
             <option value="4">4</option>
             <option value="5">5</option>
             <option value="6">6</option>
             <option value="7">7</option>
             <option value="8">8</option>
             <option value="9">9</option>
             <option value="10">10</option>
             <option value="11">11</option>
             <option value="12">12</option>
             <option value="13">13</option>
             <option value="14">14</option>
             <option value="15">15</option>
             <option value="16">16</option>
             <option value="17">17</option>
             <option value="18">18</option>
             <option value="19">19</option>
             <option value="20">20</option>
             <option value="21">21</option>
             <option value="22">22</option>
             <option value="23">23</option>
             <option value="24"  selected="selected">24</option>
             <option value="25">25</option>
             <option value="26">26</option>
             <option value="27">27</option>
             <option value="28">28</option>
             <option value="29">29</option>
             <option value="30">30</option>
             <option value="31">31</option>
             <option value="32">32</option>
             <option value="33">33</option>
             <option value="34">34</option>
             <option value="35">35</option>
             <option value="36">36</option>
             <option value="37">37</option>
             <option value="38">38</option>
             <option value="39">39</option>
             <option value="40">40</option>
             <option value="41">41</option>
             <option value="42">42</option>
             <option value="43">43</option>
             <option value="44">44</option>
             <option value="45">45</option>
             <option value="46">46</option>
             <option value="47">47</option>
             <option value="48">48</option>
             <option value="49">49</option>
             <option value="50">50</option>
             <option value="55">55</option>
             <option value="60">60</option>
             <option value="65">65</option>
             <option value="70">70</option>
             <option value="75">75</option>
             <option value="80">80</option>
             <option value="85">85</option>
             <option value="90">90</option>
             <option value="95">95</option>
             <option value="100">100</option>
             <option value="110">110</option>
             <option value="120">120</option>
             <option value="130">130</option>
             <option value="140">140</option>
             <option value="150">150</option>
             <option value="160">160</option>
             <option value="170">170</option>
             <option value="180">180</option>
             <option value="190">190</option>
             <option value="200">200</option>
             <option value="210">210</option>
             <option value="220">220</option>
             <option value="230">230</option>
             <option value="240">240</option>
             <option value="250">250</option>
             <option value="260">260</option>
             <option value="270">270</option>
             <option value="280">280</option>
             <option value="290">290</option>
             <option value="300">300</option>
             <option value="320">320</option>
             <option value="340">340</option>
             <option value="360">360</option>
             <option value="380">380</option>
             <option value="400">400</option>
             <option value="420">420</option>
             <option value="440">440</option>
             <option value="460">460</option>
             <option value="480">480</option>
             <option value="500">500</option>
             <option value="550">550</option>
             <option value="600">600</option>
             <option value="650">650</option>
             <option value="700">700</option>
             <option value="750">750</option>
             <option value="800">800</option>
             <option value="850">850</option>
             <option value="900">900</option>
             <option value="950">950</option>
             <option value="1000">1000</option>
		  </select>
		</li>
		<li>
		     <!-- 字体颜色 -->
		    <ww:property value='#session.local.a00325' />：
		    <select>
		         <option value="#ED1C24"><ww:property value='#session.local.a00338' /></option>
				 <option value="#3F48CC"><ww:property value='#session.local.a00339' /></option>
				 <option value="#FFC90E"><ww:property value='#session.local.a00342' /></option>
				 <option value="#22B14C"><ww:property value='#session.local.a00341' /></option>
				 <option value="#FFFFFF"><ww:property value='#session.local.a00340' /></option>
				 <option value="#7F7F7F"><ww:property value='#session.local.a00343' /></option>
				 <option value="#000000" selected="selected"><ww:property value='#session.local.a00337' /></option>
		    </select>
		</li>
		<li>
		滚动方式：
		<select>
		<option></option>
		</select>
		</li>
		<li>
		滚动速度：
		<select>
		<option></option>
		</select>
		</li>
		<li>
        <!--背景颜色-->
		<ww:property value='#session.local.a00358' />：
		<select>
		   <option value="#ED1C24"><ww:property value='#session.local.a00338' /></option>
		   <option value="#3F48CC"><ww:property value='#session.local.a00339' /></option>
		   <option value="#FFC90E"><ww:property value='#session.local.a00342' /></option>
		   <option value="#22B14C"><ww:property value='#session.local.a00341' /></option>
		   <option value="#FFFFFF"><ww:property value='#session.local.a00340' /></option>
		   <option value="#7F7F7F"><ww:property value='#session.local.a00343' /></option>
		   <option value="#000000" selected="selected"><ww:property value='#session.local.a00337' /></option>
		   <option selected="selected" value="0"><ww:property value='#session.local.a00366' /></option>
		</select>
		</li>
		<!--左对齐-->
		<li><a href="#"><img src="image/field_style_0.png" alt="field_style"/></a></li>
		<!--居中-->
		<li><a href="#"><img src="image/field_style_1.png" alt="field_style"/></a></li>
		<!--右对齐-->
		<li><a href="#"><img src="image/field_style_2.png" alt="field_style"/></a></li>
        <!--加粗-->
		<li><a href="#"><img src="image/field_style_3.png" alt="field_style"/></a></li>
        <!--斜线-->
		<li><a href="#"><img src="image/field_style_4.png" alt="field_style"/></a></li>
		<!--下划线-->
		<li><a href="#"><img src="image/field_style_5.png" alt="field_style"/></a></li>
		<!--中线-->
		<li><a href="#"><img src="image/field_style_6.png" alt="field_style"/></a></li>
		<li>
		<!-- 字距 -->
		<ww:property value='#session.local.a00357' />： 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：
		<select>
		   <option selected="selected" value="1">1</option>
           <option value="1.1">1.1</option>
           <option value="1.2">1.2</option>
           <option value="1.3">1.3</option>
           <option value="1.4">1.4</option>
           <option value="1.5">1.5</option>
           <option value="1.6">1.6</option>
           <option value="1.7">1.7</option>
           <option value="1.8">1.8</option>
           <option value="1.9">1.9</option>
           <option value="2">2</option>
		</select>
		</li>
		<li>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</li>
		</ul>
		<!-- 添加已选 -->
		<a href="#" class="op_button">添加已选</a>
		<!-- 上传-->
		<a href="#" class="op_button">上传</a>
		<!-- 保存 -->
		<a href="#" class="op_button">保存</a>
		<!-- 返回-->
		<a href="#" class="op_button">返回</a>
		</div>
</div>
</form>
</body>
</html>