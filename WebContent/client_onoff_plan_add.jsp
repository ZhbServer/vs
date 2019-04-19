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
<link rel="stylesheet" href="css/common.css"/>
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<script type="text/javascript">

function init_self(){
	  var openIntro = <%=request.getParameter("openIntro")%>;

		if(openIntro == '1'){
			var intro = introJs();  
			intro.setOptions({
			prevLabel:"<ww:property value='#session.local.a00861' />", 
	        nextLabel:"<ww:property value='#session.local.a00862' />",
	        skipLabel:"<ww:property value='#session.local.a00863' />",
	        doneLabel:"<ww:property value='#session.local.a00863' />",
			showStepNumbers: false,
			showBullets: false,
			exitOnOverlayClick: false,
			overlayOpacity: 0.4,  
			steps: [
			    {
				    element: '#step1',
				    intro: "<ww:property value='#session.local.a00896' /><span style='color:blue'> <ww:property value='#session.local.a00248' /></span>"
				},  	
				{  
					element: '#step2',  
					intro: "<ww:property value='#session.local.a00897' /><span style='color:blue'> <ww:property value='#session.local.a00484' /></span>"
				},  	
				{  
					element: '#step4',  
					intro: "<ww:property value='#session.local.a00896' /><span style='color:blue'> <ww:property value='#session.local.a00493' /></span>"
				},
				{
					element: '#step5',  
					intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00490' /></span>"
				}
			  ]  
			});  

			intro.start().oncomplete(function() {  
				intro.exit();  
		    });

			intro.onexit(function() {
				layer.msg("<ww:property value='#session.local.a00864' />");
			});
		}else if(openIntro == '2'){
			var intro = introJs();  
			intro.setOptions({
			prevLabel:"<ww:property value='#session.local.a00861' />", 
	        nextLabel:"<ww:property value='#session.local.a00862' />",
	        skipLabel:"<ww:property value='#session.local.a00863' />",
	        doneLabel:"<ww:property value='#session.local.a00863' />",
			showStepNumbers: false,
			showBullets: false,
			exitOnOverlayClick: false,
			overlayOpacity: 0.4,  
			steps: [
			    {
				    element: '#step1',
				    intro: "<ww:property value='#session.local.a00896' /><span style='color:blue'> <ww:property value='#session.local.a00248' /></span>"
				},  	
				{  
					element: '#step3',  
					intro: "<ww:property value='#session.local.a00897' /><span style='color:blue'> <ww:property value='#session.local.a00484' /></span>"
				},  	
				{  
					element: '#step4',  
					intro: "<ww:property value='#session.local.a00896' /><span style='color:blue'> <ww:property value='#session.local.a00493' /></span>"
				},
				{
					element: '#step5',  
					intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00490' /></span>"
				}
			  ]  
			});  

			intro.start().oncomplete(function() {  
				intro.exit();  
		    });

			intro.onexit(function() {
				layer.msg("<ww:property value='#session.local.a00864' />");
			});
		}
}

function addonoffjh(){

    //时间
    var objhh=document.getElementById("onoffhh").value;
    var objmm=document.getElementById("onoffmm").value;
    var objtime=objhh+":"+objmm;
	 //类型  
	 var chk=0;  
	 var chkObjs= document.getElementsByName("type");
	 for(var i=0;i<chkObjs.length;i++){
        if(chkObjs[i].checked){
            chk = chkObjs[i].value;
            break;
        }
    }
 
    //周期
	 var str=document.getElementsByName("zq");
	 var objarray=str.length;
	 var chestr="";
	 for (i=0;i<objarray;i++)
	 {
	   if(str[i].checked == true)
	   {
		  if(str[i].value=="8"){
            chestr="8";
            break;
		  } 
		  if(chestr.length==0){
			 chestr=str[i].value; 
		  }else{
	         chestr+="|"+str[i].value;
		  }
	   }
	 }
	 if(chestr == "")
	 {
	   alert("<ww:property value='#session.local.a00500' />");
	   return;
	 }
	 var rv=chestr+"_"+chk+"_"+objtime;

	 window.parent.returnValue=""; 
     window.parent.returnValue=rv; 
     var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
     window.parent.layer.close(index);
   
  }


</script>

</head> 
<body onload="init_self()">

<br/>
   <form  name="form1" method="post" >
       <div class="container clearfix" style="margin: 50px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		              
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                         <tr>
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00248' />：</th>
		                            <td id="step1">
		                              <select id="onoffhh" style="width: 100px;">
									      <option value="00">00</option>
									      <option value="01">01</option>
									      <option value="02">02</option>
									      <option value="03">03</option>
									      <option value="04">04</option>
									      <option value="05">05</option>
									      <option value="06">06</option>
									      <option value="07">07</option>
									      <option value="08">08</option>
									      <option value="09">09</option>
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
								      </select>
								      <ww:property value='#session.local.a00494' />&nbsp;&nbsp;
								      <select id="onoffmm" style="width: 100px;">
								      <option value="00">00</option>
								      <option value="01">01</option>
								      <option value="02">02</option>
								      <option value="03">03</option>
								      <option value="04">04</option>
								      <option value="05">05</option>
								      <option value="06">06</option>
								      <option value="07">07</option>
								      <option value="08">08</option>
								      <option value="09">09</option>
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
								      <option value="24">24</option>       
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
								      <option value="51">51</option>
								      <option value="52">52</option>
								      <option value="53">53</option>
								      <option value="54">54</option>
								      <option value="55">55</option>
								      <option value="56">56</option>
								      <option value="57">57</option>       
								      <option value="58">58</option>
								      <option value="59">59</option> 
								    </select>  
								     <ww:property value='#session.local.a00495' />         
		                            </td>
		                          </tr>
		                          
		                         <tr>
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00035' />：</th>
		                            <td>
		                                    <input id="step2"  checked="checked" name="type"  type="radio" value="1"/> 
										    <ww:property value="#session.local.a00484" />
										    &nbsp;&nbsp;
										    <input id="step3" type="radio" name="type" value="0"/> 
										    <ww:property value="#session.local.a00485" />
		                            </td>
		                          </tr>
		                          
		                          <tr>
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00493' />：</th>
		                            <td id="step4">
		                                 <input name="zq"  type="checkbox" value="1"/> <ww:property value='#session.local.a00475' /> &nbsp;
									     <input name="zq"  type="checkbox" value="2"/> <ww:property value='#session.local.a00476' />  &nbsp;
									     <input name="zq"  type="checkbox" value="3"/> <ww:property value='#session.local.a00478' /> &nbsp;
									     <input name="zq"  type="checkbox" value="4"/> <ww:property value='#session.local.a00479' />  &nbsp;
									     <input name="zq"  type="checkbox" value="5"/> <ww:property value='#session.local.a00480' />  &nbsp;
									     <input name="zq"  type="checkbox" value="6"/> <ww:property value='#session.local.a00481' />  &nbsp;
									     <input name="zq"  type="checkbox" value="7"/> <ww:property value='#session.local.a00482' />  &nbsp;
									     <input name="zq"  type="checkbox" value="8"/> <ww:property value='#session.local.a00483' />  &nbsp;
		                            </td>
		                          </tr>
		                          
		                           
		                            <tr>
		                                <th></th>
		                                <td>
		                                    <button id="step5" class="btn btn-primary" type="button"  onclick="addonoffjh()"><ww:property value='#session.local.a00490' /></button>
		                                    &nbsp;
<!--		                                    <input class="btn btn-primary btn6 mr10" value="<ww:property value='#session.local.a00020' />" type="button"  onclick="adduser()"/>-->
		                                     <!-- <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">-->
		                                </td>
		                            </tr>
		                        </tbody></table>
		              
		            </div>
		        </div>
		     </div>
  
   </div>
       
       
       
       

      
    
   </form>
</body>
</html>
