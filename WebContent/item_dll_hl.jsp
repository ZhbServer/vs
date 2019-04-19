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
<script src="js/jscolor.js"></script> 
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/fresh.js" language="javascript"></script>
<base target="_self" />
<style type="text/css">
A{text-transform:none; text-decoration:none;}   
</style>

<script>
function cratehlshow(stype){
	//获取选中获取行
    var cskeys=document.getElementsByName('cskeys'); 
	var cskeystrs="";
	for(var i=0;i<cskeys.length;i++) 
    { 
      if(cskeys[i].checked==true) 
      { 
         if(cskeystrs.length==0){
        	 cskeystrs=cskeys[i].value;
         }else{
        	 cskeystrs=cskeystrs+","+cskeys[i].value;
         } 
      } 
    }
	//获取选中列
    var symbols=document.getElementsByName('symbols'); 
	
	var symbolstrs="";
	for(var i=0;i<symbols.length;i++) 
    { 
      if(symbols[i].checked==true) 
      { 
         if(symbolstrs.length==0){
        	 symbolstrs=symbols[i].value;
         }else{
        	 symbolstrs=symbolstrs+","+symbols[i].value;
         } 
      } 
    }
  
    //获取字体颜色
    var hlFontColor=document.getElementById("hlFontColor").value;
    //获取字体大小
    var hlFontSize=document.getElementById("hlFontSize").value;
    if(stype==1){
    	window.open("selhlshow.vs?cskeystrs="+cskeystrs+"&symbolstrs="+symbolstrs+"&hlFontColor="+hlFontColor+"&hlFontSize="+hlFontSize);
    }else if(stype==2){
    	 var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引 
         //刷新时间小时
        
         var showurl="http://<ww:property value='#session.ip' />:<ww:property value='#session.tomcat_port' />/vs/selhlshow.vs?cskeystrs="+cskeystrs+"&symbolstrs="+symbolstrs+"&hlFontColor="+hlFontColor+"&hlFontSize="+hlFontSize;
         showurl=encodeURI(showurl); 
         showurl=encodeURI(showurl); 
         //x|y|宽|高|显示行(多个用',')|显示列(多个用',')|字体颜色|字体大小|url|刷新时间
    	 window.parent.returnValue="";
    	 window.parent.returnValue=$("#xy_x").val()+"|"+$("#xy_y").val()+"|"+$("#width").val()+"|"+$("#height").val()+"|"+cskeystrs+"|"+symbolstrs+"|"+hlFontColor+"|"+hlFontSize+"|"+showurl+"|"+$("#rtime").val(); 
         window.parent.layer.close(index);
    }
    
	
}

</script> 
</head>
<body>
<form action="adhtmlto.vs"  method="post" name="form1" onsubmit="return gosubmit();">

	 <div class="container clearfix" style="margin: 50px 50px;">
          <div class="main-wrap">
		      <div class="result-wrap">
		            <div class="result-content">
		            
		            
					<table class="insert-tab" width="100%">
					     <tr>
					            <td width="100" style="text-align: center;">
					               <select>
					                  <option><ww:property value="#session.local.a00618"  /></option><!-- 货币汇率 -->
					               </select>  
					                   
					            </td>
					            <td style="text-align: center;">
					                X:
								   <input id="xy_x" name="xy_x" type="text" <ww:if test="xy_x==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_x' />"</ww:else>  style="width: 40px;height: 18px;" value="0"   onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
								    Y:
							       <input id="xy_y" name="xy_y" type="text" <ww:if test="xy_y==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_y' />"</ww:else> style="width: 40px;height: 20px;" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
							       <ww:property value='#session.local.a00032' />:
						           <input name="width" id="width" type="text" style="width:40px;height: 20px;" <ww:if test="width==0">value="800"</ww:if><ww:else>value="<ww:property value='width' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
						           <ww:property value='#session.local.a00033' />:
						           <input name="height" id="height" type="text" style="width:40px;height: 20px;"  <ww:if test="height==0">value="500"</ww:if><ww:else>value="<ww:property value='height' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
					            </td>
					            
					            <td style="text-align: center;">
                                    <!-- 刷新(小时)-->
					                <ww:property value="#session.local.a00620"/>                            
					                <select id="rtime"  name="rtime">
					                    <option <ww:if test="hlRtime==1">selected="selected"</ww:if>  value="1">1</option>  
										<option <ww:if test="hlRtime==2">selected="selected"</ww:if>  value="2">2</option>
										<option <ww:if test="hlRtime==3">selected="selected"</ww:if>  value="3">3</option>
										<option <ww:if test="hlRtime==4">selected="selected"</ww:if>  value="4">4</option>
										<option <ww:if test="hlRtime==5">selected="selected"</ww:if>  value="5">5</option>
										<option <ww:if test="hlRtime==6">selected="selected"</ww:if>  value="6">6</option>
										<option <ww:if test="hlRtime==7">selected="selected"</ww:if>  value="7">7</option>
										<option <ww:if test="hlRtime==8">selected="selected"</ww:if>  value="8">8</option>
										<option <ww:if test="hlRtime==9">selected="selected"</ww:if>  value="9">9</option>
										<option <ww:if test="hlRtime==10">selected="selected"</ww:if> value="10">10</option>
										<option <ww:if test="hlRtime==11">selected="selected"</ww:if> value="11">11</option>
										<option <ww:if test="hlRtime==12">selected="selected"</ww:if> value="12">12</option>
										<option <ww:if test="hlRtime==13">selected="selected"</ww:if> value="13">13</option>
										<option <ww:if test="hlRtime==14">selected="selected"</ww:if> value="14">14</option>
										<option <ww:if test="hlRtime==15">selected="selected"</ww:if> value="15">15</option>
										<option <ww:if test="hlRtime==16">selected="selected"</ww:if> value="16">16</option>
										<option <ww:if test="hlRtime==17">selected="selected"</ww:if> value="17">17</option>
										<option <ww:if test="hlRtime==18">selected="selected"</ww:if> value="18">18</option>
										<option <ww:if test="hlRtime==19">selected="selected"</ww:if> value="19">19</option>
										<option <ww:if test="hlRtime==20">selected="selected"</ww:if> value="20">20</option>
										<option <ww:if test="hlRtime==21">selected="selected"</ww:if> value="21">21</option>
										<option <ww:if test="hlRtime==22">selected="selected"</ww:if> value="22">22</option>
										<option <ww:if test="hlRtime==23">selected="selected"</ww:if> value="23">23</option>
										<option <ww:if test="hlRtime==24">selected="selected"</ww:if> value="24">24</option>
					                </select>
					            </td>
					            
					             <td style="text-align: center;">
                                   <!--  字体大小-->
					                <ww:property value="#session.local.a00324"/>                   
					                <select id="hlFontSize" name="hlFontSize">
						                  <option <ww:if test="hlFontSize==1">selected="selected"</ww:if> value="1">1</option>
								          <option <ww:if test="hlFontSize==2">selected="selected"</ww:if> value="2">2</option>
								          <option <ww:if test="hlFontSize==3">selected="selected"</ww:if> value="3">3</option>
							              <option <ww:if test="hlFontSize==4">selected="selected"</ww:if> value="4">4</option>
							              <option <ww:if test="hlFontSize==5">selected="selected"</ww:if> value="5">5</option>
							              <option <ww:if test="hlFontSize==6">selected="selected"</ww:if> value="6">6</option>
							              <option <ww:if test="hlFontSize==7">selected="selected"</ww:if> value="7">7</option>
							              <option <ww:if test="hlFontSize==8">selected="selected"</ww:if> value="8">8</option>
							              <option <ww:if test="hlFontSize==9">selected="selected"</ww:if> value="9">9</option>
							              <option <ww:if test="hlFontSize==10">selected="selected"</ww:if> value="10">10</option>
							              <option <ww:if test="hlFontSize==11">selected="selected"</ww:if> value="11">11</option>
							              <option <ww:if test="hlFontSize==12">selected="selected"</ww:if> value="12" >12</option>
							              <option <ww:if test="hlFontSize==13">selected="selected"</ww:if> value="13">13</option>
							              <option <ww:if test="hlFontSize==14">selected="selected"</ww:if> value="14">14</option>
							              <option <ww:if test="hlFontSize==15">selected="selected"</ww:if> value="15">15</option>
							              <option <ww:if test="hlFontSize==16">selected="selected"</ww:if> value="16">16</option>
							              <option <ww:if test="hlFontSize==17">selected="selected"</ww:if> value="17">17</option>
							              <option <ww:if test="hlFontSize==18">selected="selected"</ww:if> value="18" selected="selected">18</option>
							              <option <ww:if test="hlFontSize==19">selected="selected"</ww:if> value="19">19</option>
							              <option <ww:if test="hlFontSize==20">selected="selected"</ww:if> value="20">20</option>
							              <option <ww:if test="hlFontSize==21">selected="selected"</ww:if>value="21">21</option>
							              <option <ww:if test="hlFontSize==22">selected="selected"</ww:if>value="22">22</option>
							              <option <ww:if test="hlFontSize==23">selected="selected"</ww:if> value="23">23</option>
							              <option <ww:if test="hlFontSize==24">selected="selected"</ww:if> value="24">24</option>
							              <option <ww:if test="hlFontSize==25">selected="selected"</ww:if> value="25">25</option>
							              <option <ww:if test="hlFontSize==26">selected="selected"</ww:if> value="26">26</option>
							              <option <ww:if test="hlFontSize==27">selected="selected"</ww:if> value="27">27</option>
							              <option <ww:if test="hlFontSize==28">selected="selected"</ww:if> value="28">28</option>
							              <option <ww:if test="hlFontSize==29">selected="selected"</ww:if> value="29">29</option>
							              <option <ww:if test="hlFontSize==30">selected="selected"</ww:if> value="30">30</option>
							              <option <ww:if test="hlFontSize==31">selected="selected"</ww:if> value="31">31</option>
							              <option <ww:if test="hlFontSize==32">selected="selected"</ww:if> value="32">32</option>
							              <option <ww:if test="hlFontSize==33">selected="selected"</ww:if> value="33">33</option>
							              <option <ww:if test="hlFontSize==34">selected="selected"</ww:if> value="34">34</option>
							              <option <ww:if test="hlFontSize==35">selected="selected"</ww:if> value="35">35</option>
							              <option <ww:if test="hlFontSize==36">selected="selected"</ww:if> value="36">36</option>
							              <option <ww:if test="hlFontSize==37">selected="selected"</ww:if> value="37">37</option>
							              <option <ww:if test="hlFontSize==38">selected="selected"</ww:if> value="38">38</option>
							              <option <ww:if test="hlFontSize==39">selected="selected"</ww:if> value="39">39</option>
							              <option <ww:if test="hlFontSize==40">selected="selected"</ww:if> value="40">40</option>
							              <option <ww:if test="hlFontSize==41">selected="selected"</ww:if> value="41">41</option>
							              <option <ww:if test="hlFontSize==42">selected="selected"</ww:if> value="42">42</option>
							              <option <ww:if test="hlFontSize==43">selected="selected"</ww:if> value="43">43</option>
							              <option <ww:if test="hlFontSize==44">selected="selected"</ww:if> value="44">44</option>
							              <option <ww:if test="hlFontSize==45">selected="selected"</ww:if> value="45">45</option>
							              <option <ww:if test="hlFontSize==46">selected="selected"</ww:if> value="46">46</option>
							              <option <ww:if test="hlFontSize==47">selected="selected"</ww:if> value="47">47</option>
							              <option <ww:if test="hlFontSize==48">selected="selected"</ww:if> value="48">48</option>
							              <option <ww:if test="hlFontSize==49">selected="selected"</ww:if> value="49">49</option>
							              <option <ww:if test="hlFontSize==50">selected="selected"</ww:if> value="50">50</option>
							              <option <ww:if test="hlFontSize==55">selected="selected"</ww:if> value="55">55</option>
							              <option <ww:if test="hlFontSize==60">selected="selected"</ww:if> value="60">60</option>
							              <option <ww:if test="hlFontSize==65">selected="selected"</ww:if> value="65">65</option>
							              <option <ww:if test="hlFontSize==70">selected="selected"</ww:if> value="70">70</option>
							              <option <ww:if test="hlFontSize==75">selected="selected"</ww:if> value="75">75</option>
							              <option <ww:if test="hlFontSize==80">selected="selected"</ww:if> value="80">80</option>
							              <option <ww:if test="hlFontSize==85">selected="selected"</ww:if> value="85">85</option>
							              <option <ww:if test="hlFontSize==90">selected="selected"</ww:if> value="90">90</option>
							              <option <ww:if test="hlFontSize==95">selected="selected"</ww:if> value="95">95</option>
							              <option <ww:if test="hlFontSize==100">selected="selected"</ww:if> value="100">100</option>
							              <option <ww:if test="hlFontSize==110">selected="selected"</ww:if> value="110">110</option>
							              <option <ww:if test="hlFontSize==120">selected="selected"</ww:if> value="120">120</option>
							              <option <ww:if test="hlFontSize==130">selected="selected"</ww:if> value="130">130</option>
							              <option <ww:if test="hlFontSize==140">selected="selected"</ww:if> value="140">140</option>
							              <option <ww:if test="hlFontSize==150">selected="selected"</ww:if> value="150">150</option>
							              <option <ww:if test="hlFontSize==160">selected="selected"</ww:if> value="160">160</option>
							              <option <ww:if test="hlFontSize==170">selected="selected"</ww:if> value="170">170</option>
							              <option <ww:if test="hlFontSize==180">selected="selected"</ww:if> value="180">180</option>
							              <option <ww:if test="hlFontSize==190">selected="selected"</ww:if> value="190">190</option>
							              <option <ww:if test="hlFontSize==200">selected="selected"</ww:if> value="200">200</option>
							              <option <ww:if test="hlFontSize==210">selected="selected"</ww:if> value="210">210</option>
							              <option <ww:if test="hlFontSize==220">selected="selected"</ww:if> value="220">220</option>
							              <option <ww:if test="hlFontSize==230">selected="selected"</ww:if> value="230">230</option>
							              <option <ww:if test="hlFontSize==240">selected="selected"</ww:if> value="240">240</option>
							              <option <ww:if test="hlFontSize==250">selected="selected"</ww:if> value="250">250</option>
							              <option <ww:if test="hlFontSize==260">selected="selected"</ww:if> value="260">260</option>
							              <option <ww:if test="hlFontSize==270">selected="selected"</ww:if> value="270">270</option>
							              <option <ww:if test="hlFontSize==280">selected="selected"</ww:if> value="280">280</option>
							              <option <ww:if test="hlFontSize==290">selected="selected"</ww:if> value="290">290</option>
							              <option <ww:if test="hlFontSize==300">selected="selected"</ww:if> value="300">300</option>
					                </select>                             
					                                             
						        </td> 
						        <td style="text-align: center;">
                                    <!--字体颜色-->
                                    <ww:property value="#session.local.a00325"/>
						            <input class="jscolor" name="hlFontColor" id="hlFontColor" value="<ww:property value='hlFontColor'/>" /> 
						        </td>    
					            
					      </tr>
					         
						  <tr>
						     <td style="text-align: center;">
                             <!--行显示-->
						     <ww:property value="#session.local.a00621"/>
						     </td> 
					         <td colspan="4">
					                                 
					             <ww:iterator value="csss">
					                 <ww:property value="csvalue" />
					                 <input
					                   <ww:if test="nameDisplayStr==cskey">checked="checked"</ww:if>
					                   <ww:if test="mBuyPriceDisplayStr==cskey">checked="checked"</ww:if>
					                   <ww:if test="fBuyPriceDisplayStr==cskey">checked="checked"</ww:if>
					                   <ww:if test="mSellPriceDisplayStr==cskey">checked="checked"</ww:if>
					                   <ww:if test="fSellPriceDisplayStr==cskey">checked="checked"</ww:if>
					                   <ww:if test="bankConversionPriceDisplayStr==cskey">checked="checked"</ww:if>
					                   <ww:if test="sdateDisplayStr==cskey">checked="checked"</ww:if>
					                   <ww:if test="stimeDisplayStr==cskey">checked="checked"</ww:if>
					                   value="<ww:property value='cskey'/>" name="cskeys" type="checkbox"   />&nbsp;&nbsp;
					             </ww:iterator>                       
					         </td>
					      </tr>
						 <tr>
						     <td style="text-align: center;">
                                 <!--列显示-->
						        <ww:property value="#session.local.a00622"/>
						     </td> 
					         <td colspan="4">
					                           
					             <ww:iterator value="dataHls" status="status">
					                 <ww:property value="name"/>
					                 <input  
					                 <ww:iterator value="symbols_show" status="loop" >
					                        <ww:if test="symbol==symbols_show[#loop.index]">checked="checked"</ww:if>
					                 </ww:iterator> 
					                 value="<ww:property value='symbol'/>"  name="symbols" type="checkbox" />&nbsp;&nbsp;
					                 <ww:if test="#status.index==11">
					                 <br/>
					                 </ww:if>
					             </ww:iterator>                       
					                                  
					         </td>
					      </tr>	
							  
					         
					      <tr>
						     <td colspan="5" style="text-align: center;" height="50px;">
                                 <input onclick="cratehlshow(1)"  type="button" value="<ww:property value='#session.local.a00026' />" style=" width:80px ;color: #495764;font-family:Microsoft YaHei;"   class="button1" />
                                 &nbsp;&nbsp;
                                 <input onclick="cratehlshow(2)"  type="button" value="<ww:property value='#session.local.a00080' />" style=" width:80px ;color: #495764;font-family:Microsoft YaHei;"   class="button1" />
						     </td> 
					         
					      </tr>	    
					        
							
							
					       </table>

            </div>
		  </div>
		</div>
    </div>	         
<input style="width:50px;"   type="hidden" id="gao"  name="gao"  value="300" />
</form>

</body>
</html>
