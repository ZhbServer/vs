<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<title></title>
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/common.css"/>
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/fresh.js" language="javascript"></script>
<script src="js/jscolor.js"></script> 
<base target="_self" />
<style type="text/css">
A{text-transform:none; text-decoration:none;}   
</style>
<script>
function single_submit()
{

	 //获取样式
	 var stype = document.getElementById("stype").value;

	//获取字体大小
	var sdx= document.getElementById("sdx").value;
    //获取字体颜色
    var sys= document.getElementById("sys").value;
    if(sys==""){
        sys="000000";
    }
    //获取语音播报开关
    var svoice=document.getElementById("svoice").value;

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
  	
	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	//qsing|X*Y*宽*高*样式(1,2,3)*显示行数*字体大小*字体颜色*语音播放(0关 1开)*背景色 (0透明 )
	
	//获取背景颜色
	 var sbjs="";
	 var checkbox = document.getElementById('sbyst');
	 if(checkbox.checked){
		 sbjs="0";
	 }else{
	     sbjs=document.getElementById("sbys").value;
	 }

		
	window.parent.returnValue=""; 
    window.parent.returnValue="qsing|"+xy_x+"*"+xy_y+"*"+width+"*"+height+"*"+stype+"*1*"+sdx+"*"+sys+"*"+svoice+"*"+sbjs; 
    window.parent.layer.close(index);
}

function settcolor(var1) {
	
	ys = var1;

}

function single_return(){
	window.location.href="item_dll.jsp";
}
</script>
</head>
<body>
<form  method="post" name="form1"  >
    
   <div class="container clearfix" style="margin: 10px 10px;">
       <div class="main-wrap">
		   <div class="result-wrap">
		        <div class="result-content">
    
		        <table class="insert-tab" width="100%">
		           <tr>
		            <td style="text-align: right;" width="100"><ww:property value="#session.local.a00537" />:</td><!-- 样式 -->
		            <td>
		               <select id="stype" name="stype">
		                   <option <ww:if test='stype==1'>selected="selected"</ww:if> value="1"><ww:property value="#session.local.a00537" />1</option>
		               </select>
		            </td>
		          </tr>
		          
		        
				   <tr>
		            <td style="text-align: right;"><ww:property value="#session.local.a00324" />:</td><!-- 字体大小 -->
		            <td>
		                <select style="width: 150px;" name="sdx" id="sdx">
	                          <option <ww:if test='sdx==1'>selected="selected"</ww:if>   value="1">1</option>
				              <option <ww:if test='sdx==2'>selected="selected"</ww:if>   value="2">2</option>
				              <option <ww:if test='sdx==3'>selected="selected"</ww:if>   value="3">3</option>
				              <option <ww:if test='sdx==4'>selected="selected"</ww:if>   value="4">4</option>
				              <option <ww:if test='sdx==5'>selected="selected"</ww:if>   value="5">5</option>
				              <option <ww:if test='sdx==6'>selected="selected"</ww:if>   value="6">6</option>
				              <option <ww:if test='sdx==7'>selected="selected"</ww:if>   value="7">7</option>
				              <option <ww:if test='sdx==8'>selected="selected"</ww:if>   value="8">8</option>
				              <option <ww:if test='sdx==9'>selected="selected"</ww:if>   value="9">9</option>
				              <option <ww:if test='sdx==10'>selected="selected"</ww:if>  value="10">10</option>
				              <option <ww:if test='sdx==11'>selected="selected"</ww:if>  value="11">11</option>
				              <option <ww:if test='sdx==12'>selected="selected"</ww:if>  value="12">12</option>
				              <option <ww:if test='sdx==13'>selected="selected"</ww:if>  value="13">13</option>
				              <option <ww:if test='sdx==14'>selected="selected"</ww:if>  value="14">14</option>
				              <option <ww:if test='sdx==15'>selected="selected"</ww:if>  value="15">15</option>
				              <option <ww:if test='sdx==16'>selected="selected"</ww:if>  value="16">16</option>
				              <option <ww:if test='sdx==17'>selected="selected"</ww:if>   value="17">17</option>
				              <option <ww:if test='sdx==null||sdx==18'>selected="selected"</ww:if>    value="18" >18</option>
				              <option <ww:if test='sdx==19'>selected="selected"</ww:if>  value="19">19</option>
				              <option <ww:if test='sdx==20'>selected="selected"</ww:if>  value="20">20</option>
				              <option <ww:if test='sdx==21'>selected="selected"</ww:if>  value="21">21</option>
				              <option <ww:if test='sdx==22'>selected="selected"</ww:if>  value="22">22</option>
				              <option <ww:if test='sdx==23'>selected="selected"</ww:if>  value="23">23</option>
				              <option <ww:if test='sdx==24'>selected="selected"</ww:if>  value="24">24</option>
				              <option <ww:if test='sdx==25'>selected="selected"</ww:if>  value="25">25</option>
				              <option <ww:if test='sdx==26'>selected="selected"</ww:if>  value="26">26</option>
				              <option <ww:if test='sdx==27'>selected="selected"</ww:if>  value="27">27</option>
				              <option <ww:if test='sdx==28'>selected="selected"</ww:if>  value="28">28</option>
				              <option <ww:if test='sdx==29'>selected="selected"</ww:if>  value="29">29</option>
				              <option <ww:if test='sdx==30'>selected="selected"</ww:if>  value="30">30</option>
				              <option <ww:if test='sdx==31'>selected="selected"</ww:if>  value="31">31</option>
				              <option <ww:if test='sdx==32'>selected="selected"</ww:if>  value="32">32</option>
				              <option <ww:if test='sdx==33'>selected="selected"</ww:if>  value="33">33</option>
				              <option <ww:if test='sdx==34'>selected="selected"</ww:if>  value="34">34</option>
				              <option <ww:if test='sdx==35'>selected="selected"</ww:if>  value="35">35</option>
				              <option <ww:if test='sdx==36'>selected="selected"</ww:if>  value="36">36</option>
				              <option <ww:if test='sdx==37'>selected="selected"</ww:if>  value="37">37</option>
				              <option <ww:if test='sdx==38'>selected="selected"</ww:if>  value="38">38</option>
				              <option <ww:if test='sdx==39'>selected="selected"</ww:if>  value="39">39</option>
				              <option <ww:if test='sdx==40'>selected="selected"</ww:if>  value="40">40</option>
				              <option <ww:if test='sdx==41'>selected="selected"</ww:if>  value="41">41</option>
				              <option <ww:if test='sdx==42'>selected="selected"</ww:if>  value="42">42</option>
				              <option <ww:if test='sdx==43'>selected="selected"</ww:if>  value="43">43</option>
				              <option <ww:if test='sdx==44'>selected="selected"</ww:if>  value="44">44</option>
				              <option <ww:if test='sdx==45'>selected="selected"</ww:if>  value="45">45</option>
				              <option <ww:if test='sdx==46'>selected="selected"</ww:if>  value="46">46</option>
				              <option <ww:if test='sdx==47'>selected="selected"</ww:if> value="47">47</option>
				              <option <ww:if test='sdx==48'>selected="selected"</ww:if> value="48">48</option>
				              <option <ww:if test='sdx==49'>selected="selected"</ww:if> value="49">49</option>
				              <option <ww:if test='sdx==50'>selected="selected"</ww:if> value="50">50</option>
				              <option <ww:if test='sdx==55'>selected="selected"</ww:if> value="55">55</option>
				              <option <ww:if test='sdx==60'>selected="selected"</ww:if> value="60">60</option>
				              <option <ww:if test='sdx==65'>selected="selected"</ww:if> value="65">65</option>
				              <option <ww:if test='sdx==70'>selected="selected"</ww:if> value="70">70</option>
				              <option <ww:if test='sdx==75'>selected="selected"</ww:if> value="75">75</option>
				              <option <ww:if test='sdx==80'>selected="selected"</ww:if> value="80">80</option>
				              <option <ww:if test='sdx==85'>selected="selected"</ww:if> value="85">85</option>
				              <option <ww:if test='sdx==90'>selected="selected"</ww:if> value="90">90</option>
				              <option <ww:if test='sdx==95'>selected="selected"</ww:if> value="95">95</option>
				              <option <ww:if test='sdx==100'>selected="selected"</ww:if> value="100">100</option>
				              <option <ww:if test='sdx==110'>selected="selected"</ww:if> value="110">110</option>
				              <option <ww:if test='sdx==120'>selected="selected"</ww:if> value="120">120</option>
				              <option <ww:if test='sdx==130'>selected="selected"</ww:if> value="130">130</option>
				              <option <ww:if test='sdx==140'>selected="selected"</ww:if> value="140">140</option>
				              <option <ww:if test='sdx==150'>selected="selected"</ww:if> value="150">150</option>
				              <option <ww:if test='sdx==160'>selected="selected"</ww:if> value="160">160</option>
				              <option <ww:if test='sdx==170'>selected="selected"</ww:if> value="170">170</option>
				              <option <ww:if test='sdx==180'>selected="selected"</ww:if> value="180">180</option>
				              <option <ww:if test='sdx==190'>selected="selected"</ww:if> value="190">190</option>
				              <option <ww:if test='sdx==200'>selected="selected"</ww:if> value="200">200</option>
				       </select>
		            </td>
		          </tr>
		          <tr>
			            <td style="text-align: right;"><ww:property value="#session.local.a00325" />:</td> <!-- 字体颜色 -->
			            <td width="159" height="25">
			                <input id="sys" class="jscolor{onFineChange:'settcolor(this)'}" style="background-color:#000000;"  <ww:if test="sys==null">value="000000"</ww:if><ww:else>value="<ww:property value='sys'/>"</ww:else>  /> 
			            </td>
			      </tr>
			      
			      
			       <tr>
			            <td style="text-align: right;"><ww:property value="#session.local.a00358" />:</td> <!-- 背景颜色 -->
			            <td width="159" height="25">              
			                <input type="checkbox" value="1" id="sbyst"  <ww:if test="sbyst==null||sbyst==1">checked="checked"</ww:if>   /><ww:property value="#session.local.a00366" />
			                &nbsp; 
			                <input id="sbys" class="jscolor{onFineChange:'settcolor(this)'}" style="background-color:#FFFFFF;"  <ww:if test="sbys==null">value="FFFFFF"</ww:if><ww:else>value="<ww:property value='sbys'/>"</ww:else>  /> 
			            </td>
			      </tr>
			      
			      
			      <tr>
		            <td style="text-align: right;" width="100"><ww:property value="#session.local.a00703" />:</td><!-- 语音播报 -->
		            <td>
		               <select id="svoice" name="svoice">
		                   <option <ww:if test='svoice==0'>selected="selected"</ww:if> value="0">
		                         <ww:property value="#session.local.a00351" />
		                   </option>
		                   <option <ww:if test='svoice==1'>selected="selected"</ww:if> value="1">
		                         <ww:property value="#session.local.a00350" />
		                   </option>
		               </select>
		            </td>
		          </tr>
		          
		        <tr>
		            <td></td>
		            <td>
		                X:
					   <input id="xy_x" name="xy_x" type="text" <ww:if test="xy_x==null">value="0"</ww:if><ww:else>value="<ww:property value='xy_x' />"</ww:else>  style="width: 40px;height: 18px;" value="0"   onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
					    Y:
				       <input id="xy_y" name="xy_y" type="text" <ww:if test="xy_y==null">value="0"</ww:if><ww:else>value="<ww:property value='xy_y' />"</ww:else> style="width: 40px;height: 20px;" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
				       <ww:property value='#session.local.a00032' />:
			           <input name="width" id="width" type="text" style="width:40px;height: 20px;" <ww:if test="width==null">value="200"</ww:if><ww:else>value="<ww:property value='width' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
			           <ww:property value='#session.local.a00033' />:
			           <input name="height" id="height" type="text" style="width:40px;height: 20px;"  <ww:if test="height==null">value="200"</ww:if><ww:else>value="<ww:property value='height' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
		            </td>
			       
			      </tr>

				   <tr style="height:50px;">
		            <td></td>
		            <td>
		               <input  type="button" onclick="single_submit()"  value="<ww:property value='#session.local.a00080' />" style=" width:80px ;color: #495764;font-family:Microsoft YaHei;"   class="button1" />
		               &nbsp;&nbsp; 
		               <input  type="button" onclick="single_return()"  value="<ww:property value='#session.local.a00014' />" style=" width:80px ;color: #495764;font-family:Microsoft YaHei;"   class="button1" />
		               
		            </td>
				   </tr>
		        </table>
             </div>
		  </div>
		</div>
    </div>	    
</form>

</body>
</html>
