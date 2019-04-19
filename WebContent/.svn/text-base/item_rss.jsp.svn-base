<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<title></title>
<base target="_self" />
<style type="text/css">
A{text-transform:none; text-decoration:none;}   
</style>
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/common.css"/>

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/icon.css"  />
<script type="text/javascript" src="js/constant.js"></script>


<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/fresh.js" language="javascript"></script>
<script>


    //初始化
    function onload_data(){

    	 //显示内容
        var  layerBigDataParameter=window.parent.$("#layerBigDataParameter").val();

	    if(layerBigDataParameter!=""){

	    	    //转换成touch对象组
    		    var layerBigDataParameterObj = eval( "(" + layerBigDataParameter + ")" );//转换后的JSON对象
                
    		    $("#rsslist").val(layerBigDataParameterObj.rurl);

    		    $("#xstime").val(layerBigDataParameterObj.refreshTime);

    		    $("#gdfs").val(layerBigDataParameterObj.gdfs);

    		    $("#speed").val(layerBigDataParameterObj.speed);

    		    $("#dx").val(layerBigDataParameterObj.dx);

    		    
    		    $("#fontcolor").val(layerBigDataParameterObj.ys);


    		    url=layerBigDataParameterObj.rurl;
    		    
    			tqid=layerBigDataParameterObj.rurl;

    			ys =layerBigDataParameterObj.ys;

    			
    		    if(layerBigDataParameterObj.gdfs==1)
    			{
    			   document.getElementById("show").src="getrss.vs?url=" + layerBigDataParameterObj.rurl + "&ys=" + layerBigDataParameterObj.ys + "&dx=" + layerBigDataParameterObj.dx +  "&speed=" + layerBigDataParameterObj.speed+ "&gd=" + gd;
    			}
    			else
    			{
    			   document.getElementById("show").src="getrss2.vs?url=" + layerBigDataParameterObj.rurl + "&ys=" + layerBigDataParameterObj.ys + "&dx=" + layerBigDataParameterObj.dx +  "&speed=" + layerBigDataParameterObj.speed+ "&gd=" + gd;
    			}

    			
    		    

    		    

		}
    }



    function MM_showHideLayers() { 
	  var i,p,v,obj,args=MM_showHideLayers.arguments;
	  for (i=0; i<(args.length-2); i+=3) 
	  with (document) if (getElementById && ((obj=getElementById(args[i]))!=null)) { v=args[i+2];
	    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
	    obj.visibility=v; }
	}

	var ys = "000000";
	var idd=0;
	var gd=195;
	var tqid=0;
	var url="";
	function see(var1) {
		if (var1.length < 1) {
            layer.msg("<ww:property value='#session.local.a00344' />");
			return;
		}
		url=var1;
		tqid=url;
		ys =$("#fontcolor").val();
		var dx = document.getElementById("dx").value;
		var zt = document.getElementById("zt").value;
		var speed = document.getElementById("speed").value;
		var gdfs = document.getElementById("gdfs").value;
		
		if(gdfs==1)
		{
		     document.getElementById("show").src="getrss.vs?url=" + url + "&ys=" + ys + "&dx=" + dx + "&zt=" + zt+ "&speed=" + speed+ "&gd=" + gd;
		}
		else
		{
		     document.getElementById("show").src="getrss2.vs?url=" + url + "&ys=" + ys + "&dx=" + dx + "&zt=" + zt+ "&speed=" + speed+ "&gd=" + gd;
		}
	}
	function settcolor(var1) {
		if ( tqid < 1) {
	          alert("<ww:property value='#session.local.a00344' />");
				return;
			}
		ys = var1;
		var dx = document.getElementById("dx").value;
		var zt = document.getElementById("zt").value;
		var speed = document.getElementById("speed").value;
		var gdfs = document.getElementById("gdfs").value;
		if(gdfs==1)
		{
		document.getElementById("show").src="getrss.vs?url=" + url + "&ys=" + ys + "&dx=" + dx + "&zt=" + zt+ "&speed=" + speed+ "&gd=" + gd;
		}
		else
		{
		document.getElementById("show").src="getrss2.vs?url=" + url + "&ys=" + ys + "&dx=" + dx + "&zt=" + zt+ "&speed=" + speed+ "&gd=" + gd;
		}
	    
	}
	function ztto(var1) {
		if ( tqid < 1) {
	           alert("<ww:property value='#session.local.a00344' />");
				return;
			} 
		var dx = document.getElementById("dx").value;
		var zt = document.getElementById("zt").value;
		var speed = document.getElementById("speed").value;
		var gdfs = document.getElementById("gdfs").value;
		ys =$("#fontcolor").val();
		if(gdfs==1)
		{
		document.getElementById("show").src="getrss.vs?url=" + url + "&ys=" + ys + "&dx=" + dx + "&zt=" + zt+ "&speed=" + speed+ "&gd=" + gd;
		}
		else
		{
		document.getElementById("show").src="getrss2.vs?url=" + url + "&ys=" + ys + "&dx=" + dx + "&zt=" + zt+ "&speed=" + speed+ "&gd=" + gd;
		}
		
	}
		function gdfsto() {
		if ( tqid < 1) {
	           alert("<ww:property value='#session.local.a00344' />");
				return;
			} 
		var dx = document.getElementById("dx").value;
		var zt = document.getElementById("zt").value;
		var speed = document.getElementById("speed").value;
		var gdfs = document.getElementById("gdfs").value;
		
		ys =$("#fontcolor").val();
		if(gdfs==1)
		{
		document.getElementById("show").src="getrss.vs?url=" + url + "&ys=" + ys + "&dx=" + dx + "&zt=" + zt+ "&speed=" + speed+ "&gd=" + gd;
		}
		else
		{
		document.getElementById("show").src="getrss2.vs?url=" + url + "&ys=" + ys + "&dx=" + dx + "&zt=" + zt+ "&speed=" + speed+ "&gd=" + gd;
		}
		
	}
	function speedto(var1) {
		if ( tqid < 1) {
	           alert("<ww:property value='#session.local.a00344' />");
				return;
			} 
		var dx = document.getElementById("dx").value;
		var zt = document.getElementById("zt").value;
		var gdfs = document.getElementById("gdfs").value;
		var speed = document.getElementById("speed").value;
		ys =$("#fontcolor").val();
		if(gdfs==1)
		{
		document.getElementById("show").src="getrss.vs?url=" + url + "&ys=" + ys + "&dx=" + dx + "&zt=" + zt+ "&speed=" + speed+ "&gd=" + gd;
		}
		else
		{
		document.getElementById("show").src="getrss2.vs?url=" + url + "&ys=" + ys + "&dx=" + dx + "&zt=" + zt+ "&speed=" + speed+ "&gd=" + gd;
		}
		
	}
	function dxto(var1) {
		if ( tqid < 1) {
	           alert("<ww:property value='#session.local.a00344' />");
				return;
			} 
		var dx = document.getElementById("dx").value;
		var zt = document.getElementById("zt").value;
		var speed = document.getElementById("speed").value;
		var gdfs = document.getElementById("gdfs").value;
		ys =$("#fontcolor").val();
		if(gdfs==1)
		{
		document.getElementById("show").src="getrss.vs?url=" + url + "&ys=" + ys + "&dx=" + dx + "&zt=" + zt+ "&speed=" + speed+ "&gd=" + gd;
		}
		else
		{
		document.getElementById("show").src="getrss2.vs?url=" + url + "&ys=" + ys + "&dx=" + dx + "&zt=" + zt+ "&speed=" + speed+ "&gd=" + gd;
		}
		
	} 

	function send() {
		if ( tqid < 1) {
	           alert("<ww:property value='#session.local.a00344' />");
				return;
			} 
		var dx = document.getElementById("dx").value;
		var zt = document.getElementById("zt").value;
		var ip = document.getElementById("ip").value;
		var speed = document.getElementById("speed").value;
		var gdfs = document.getElementById("gdfs").value;
		var xstime = document.getElementById("xstime").value;
		var sf=document.getElementById("sf").value;
		if(xstime<1)
		{
		  alert("<ww:property value='#session.local.item_rss_alert_renovate_time0' />");
		  return;
		}
		var xy_x = document.getElementById("xy_x").value;
		var xy_y = document.getElementById("xy_y").value;   
	    var width = document.getElementById("width").value;
		var height = document.getElementById("height").value;
		if(xy_x<0){
				layer.msg("<ww:property value='#session.local.a00283' />");
		        return;
		}
		if(xy_y<0){
				layer.msg("<ww:property value='#session.local.a00284' />");
		        return;
		}
		if(width<=0){
			layer.msg("<ww:property value='#session.local.a00285' />");
	       return;
		}
		if(height<=0)
		{
			  layer.msg("<ww:property value='#session.local.a00286' />");
	         return;
		}   
		var time=xstime;
		var outname;
		if(gdfs==1)
		{
		    outname="http://"+ip+":<ww:property value='#session.tomcat_port' />/vs/getrss.vs?url=" + url + "&ys=" + ys + "&dx=" + dx + "&zt=" + zt+ "&speed=" + speed+ "&gd=" + gdfs+"|"+time+"|"+width+"|"+height+"|"+xy_x+"|"+xy_y;
		}
		else
		{
		    outname="http://"+ip+":<ww:property value='#session.tomcat_port' />/vs/getrss2.vs?url=" + url + "&ys=" + ys + "&dx=" + dx + "&zt=" + zt+ "&speed=" + speed+ "&gd=" + gdfs+"|"+time+"|"+width+"|"+height+"|"+xy_x+"|"+xy_y;
		}
		var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	  	window.parent.returnValue=outname; 
	    window.parent.layer.close(index);
	}

	function  fastAddParameterRss(){

	    	//弹出
	    	layer.open({
	     		type: 2,
	             area: ['700px', '300px'],
	             offset: '10px',
	             title:false,
	             fix: false, //不固定
	             shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	             content: 'system_cs_rss_add.jsp',
	             scrollbar: false,
	             end: function(data){

	                    

	    				 $.ajax({
	    						type:'post',
	    						url:'ajaxrssall.vs',
	    						dataType:'json',
	    						async:true,
	    						cache:true,
	    						success:function(data){

	    					           document.getElementById("rsslist").options.length=0;
	    							   var obj=document.getElementById('rsslist'); 
	    		
	    					    	   //清空   
	    					    	   
	    						       for(i=0;i<data.length;i++)
	    							   {
	    			                         
	    						    	   obj.options.add(new Option(data[i].name,data[i].url)); //这个兼容IE与firefox
	    						    	   see(data[i].url); 
	    						    	 
	    							
	    							    }
	    					      
	    						}
	    					});

	    			
	            
	    		     
	    	       
	    		      
	    		   
	     		 }
	     	});          
	    	
	    }
		
</script>
</head>
<body onload="onload_data()">
    <div id="Layer4"  style="position: absolute; left: 138px; top: 300px; width: 111px; height: 133px; z-index: 1; visibility: hidden">
  	    <a href="#" onclick="MM_showHideLayers('Layer4','','hide')">
	    <img src="image/pallete.gif" width="151" height="133" usemap="#timepallete" border="0" /></a>
	</div>
    <form method="post" name="form1" action="toadrss.vs">
    
      <div class="panel panel-primary" style="margin: 3px 3px;">
           <div class="panel-heading">
               RSS
           </div>
            
    
					     <div class="container clearfix" style="margin: 10px 10px;">
					          <div class="main-wrap">
							      <div class="result-wrap">
							            <div class="result-content">
								          <table class="insert-tab" width="100%">
								
								          <tr>
								            <td colspan="2" align="center" style="text-align: center;"><iframe  width="600" height="150" id="show" designmode='On' allowtransparency='true'   marginwidth='0'  marginheight='0' frameborder='0' ></iframe></td>
								          </tr>
										  <tr>
								            <td  style="text-align: right;" width="200px;"><ww:property value='#session.local.a00331' />：</td>
								            <td>
								               <select onchange="see(this.value)"  id="rsslist"  style="width: 150px;">
													<option value=""></option>
													<ww:iterator value="list">
														<option value="<ww:property  value="url"/>"><ww:property  value="name" /></option>
													</ww:iterator>
											    </select>
											    
											    <ww:if test="#session.sysset==0">
															    
												 </ww:if>
												 <ww:else>
													  <i onclick="fastAddParameterRss()" style="cursor: pointer;" title="<ww:property value='#session.local.a00021' />"  class="icon icon-plus-sign"></i>
												 </ww:else>
						   
						   
											</td>
								          </tr>
										  <tr>
								            <td style="text-align: right;"><ww:property value='#session.local.a00332' />：</td>
								            <td> <input  name="xstime" id="xstime"  value="3600" size="6" maxlength="6" style="width: 150px;height: 25px;line-height: 25px;"/> 
								            </td>
								          </tr>
										   <tr>
								            <td style="text-align: right;"><ww:property value='#session.local.a00333' />：</td>
								            <td>
								               <select name="select3" id="gdfs" onchange="gdfsto()" style="width: 150px;">
								               <option value="1"><ww:property value='#session.local.a00334' /></option>
								               <option value="2"><ww:property value='#session.local.a00335' /></option>
								               </select>
								            </td>		
								          </tr>
										   <tr>
								            <td style="text-align: right;"><ww:property value='#session.local.a00336' />：</td>
								            <td><select name="select" id="speed" onchange="speedto(this.value)" style="width: 150px;">
								              <option  value="1">1</option>
								              <option  value="2">2</option>
								              <option  value="3" selected="selected" >3</option>
											  <!--<option  value="4" >4</option>
											  <option  value="5" >5</option>
											  <option  value="6" >6</option>-->
								            </select></td>
								          </tr>
										  <tr>
								            <td style="text-align: right;"><ww:property value='#session.local.a00324' />：</td>
								            <td><select name="select2" id="dx" style="width: 150px;"
													onchange="dxto(this.value)">
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
								              <option value="12" >12</option>
								              <option value="13">13</option>
								              <option value="14">14</option>
								              <option value="15">15</option>
								              <option value="16">16</option>
								              <option value="17">17</option>
								              <option value="18" >18</option>
								              <option value="19">19</option>
								              <option value="20">20</option>
								              <option value="21">21</option>
								              <option value="22">22</option>
								              <option value="23">23</option>
								              <option value="24" >24</option>
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
								              <option value="36" selected="selected">36</option>
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
								            </select></td>
								          </tr>
										  <tr>
								            <td style="text-align: right;"><ww:property value='#session.local.a00325' />：</td>
								            <td>
								              <select name="fontcolor" id="fontcolor" onchange="settcolor(this.value)"   style="height: 25px;width:150px;background-color: #DADADA; border: 1px;cursor: pointer;	">					 
														  <option value="ED1C24"><ww:property value='#session.local.a00338' /></option>
														  <option value="3F48CC"><ww:property value='#session.local.a00339' /></option>
														  <option value="FFC90E"><ww:property value='#session.local.a00342' /></option>
														  <option value="22B14C"><ww:property value='#session.local.a00341' /></option>
														  <option value="FFFFFF"><ww:property value='#session.local.a00340' /></option>
														  <option value="7F7F7F"><ww:property value='#session.local.a00343' /></option>
														  <option value="000000" selected="selected"><ww:property value='#session.local.a00337' /></option>
											   </select>
								          </td>
								          </tr>
								           <tr style="display: none;">
								               <td style="text-align: right;"></td>
										       <td>
							                    X:
											   <input id="xy_x" name="xy_x" type="text" <ww:if test="xy_x==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_x' />"</ww:else>  style="width: 40px;height: 18px;" value="0"   onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
											    Y:
										       <input id="xy_y" name="xy_y" type="text" <ww:if test="xy_y==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_y' />"</ww:else> style="width: 40px;height: 20px;" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
										       <ww:property value='#session.local.a00032' />:
									           <input name="width" id="width" type="text" style="width:40px;height: 20px;" <ww:if test="width==0">value="400"</ww:if><ww:else>value="<ww:property value='width' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
									           <ww:property value='#session.local.a00033' />:
									           <input name="height" id="height" type="text" style="width:40px;height: 20px;"  <ww:if test="height==0">value="300"</ww:if><ww:else>value="<ww:property value='height' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
									           </td>
										   </tr>
								          
										   <tr>
										    <td></td>
								            <td>
								         						            
								               <button class="btn btn-primary" onclick='send()' type="button"><ww:property value='#session.local.a00080' /></button>
				                 
				                               <button class="btn btn-primary" onclick='close_win_nov()' type="button"><ww:property value='#session.local.a00014' /></button>
		                
		                
		                
								            </td>
								           </tr>
								        </table>
					        </div>
					      </div>
					    </div>
					 </div>
			</div>		 	     
<input  type="hidden" id="ip" value="<ww:property value="ip"/>" />
<input  type="hidden" id="zt" value="0" />
<input type="hidden" id="sf" value="<ww:property value="sf"/>" name="sf"/>
</form>

</body>
</html>
