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
	 //周期_类型_stime:etime
	 var rv=chestr+"_"+chk+"_"+objtime;

	 window.parent.returnValue=""; 
     window.parent.returnValue=rv; 
     var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
     window.parent.layer.close(index);
   
  }


</script>

</head> 
<body>

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
									      <option  <ww:if test="editHh==0"> selected="selected" </ww:if>  value="00">00</option>  
									      <option  <ww:if test="editHh==1"> selected="selected" </ww:if> value="01">01</option>
									      <option  <ww:if test="editHh==2"> selected="selected" </ww:if> value="02">02</option>
									      <option  <ww:if test="editHh==3"> selected="selected" </ww:if>  value="03">03</option>
									      <option  <ww:if test="editHh==4"> selected="selected" </ww:if> value="04">04</option>
									      <option  <ww:if test="editHh==5"> selected="selected" </ww:if> value="05">05</option>
									      <option  <ww:if test="editHh==6"> selected="selected" </ww:if>value="06">06</option>
									      <option  <ww:if test="editHh==7"> selected="selected" </ww:if> value="07">07</option>
									      <option  <ww:if test="editHh==8"> selected="selected" </ww:if> value="08">08</option>
									      <option  <ww:if test="editHh==9"> selected="selected" </ww:if> value="09">09</option>
									      <option  <ww:if test="editHh==10"> selected="selected" </ww:if> value="10">10</option>
									      <option  <ww:if test="editHh==11"> selected="selected" </ww:if> value="11">11</option>
									      <option  <ww:if test="editHh==12"> selected="selected" </ww:if> value="12">12</option>
									      <option  <ww:if test="editHh==13"> selected="selected" </ww:if> value="13">13</option>
									      <option  <ww:if test="editHh==14"> selected="selected" </ww:if> value="14">14</option>
									      <option  <ww:if test="editHh==15"> selected="selected" </ww:if> value="15">15</option>
									      <option  <ww:if test="editHh==16"> selected="selected" </ww:if> value="16">16</option>
									      <option  <ww:if test="editHh==17"> selected="selected" </ww:if> value="17">17</option>
									      <option  <ww:if test="editHh==18"> selected="selected" </ww:if> value="18">18</option>
									      <option  <ww:if test="editHh==19"> selected="selected" </ww:if> value="19">19</option>
									      <option  <ww:if test="editHh==20"> selected="selected" </ww:if> value="20">20</option>
									      <option  <ww:if test="editHh==21"> selected="selected" </ww:if> value="21">21</option>
									      <option  <ww:if test="editHh==22"> selected="selected" </ww:if> value="22">22</option>
									      <option  <ww:if test="editHh==23"> selected="selected" </ww:if> value="23">23</option>
								      </select>
								      <ww:property value='#session.local.a00494' />&nbsp;&nbsp;
								      <select id="onoffmm" style="width: 100px;">
								      <option  <ww:if test="editMm==0"> selected="selected" </ww:if>  value="00">00</option>
								      <option  <ww:if test="editMm==1"> selected="selected" </ww:if>  value="01">01</option>
								      <option  <ww:if test="editMm==2"> selected="selected" </ww:if>  value="02">02</option>
								      <option  <ww:if test="editMm==3"> selected="selected" </ww:if> value="03">03</option>
								      <option  <ww:if test="editMm==4"> selected="selected" </ww:if> value="04">04</option>
								      <option  <ww:if test="editMm==5"> selected="selected" </ww:if> value="05">05</option>
								      <option  <ww:if test="editMm==6"> selected="selected" </ww:if> value="06">06</option>
								      <option  <ww:if test="editMm==7"> selected="selected" </ww:if> value="07">07</option>
								      <option  <ww:if test="editMm==8"> selected="selected" </ww:if> value="08">08</option>
								      <option  <ww:if test="editMm==9"> selected="selected" </ww:if> value="09">09</option>
								      <option  <ww:if test="editMm==10"> selected="selected" </ww:if> value="10">10</option>
								      <option  <ww:if test="editMm==11"> selected="selected" </ww:if> value="11">11</option>
								      <option  <ww:if test="editMm==12"> selected="selected" </ww:if>value="12">12</option>
								      <option  <ww:if test="editMm==13"> selected="selected" </ww:if>value="13">13</option>
								      <option  <ww:if test="editMm==14"> selected="selected" </ww:if> value="14">14</option>
								      <option  <ww:if test="editMm==15"> selected="selected" </ww:if> value="15">15</option>
								      <option  <ww:if test="editMm==16"> selected="selected" </ww:if> value="16">16</option>
								      <option  <ww:if test="editMm==17"> selected="selected" </ww:if> value="17">17</option>
								      <option  <ww:if test="editMm==18"> selected="selected" </ww:if> value="18">18</option>
								      <option  <ww:if test="editMm==19"> selected="selected" </ww:if>  value="19">19</option>
								      <option  <ww:if test="editMm==20"> selected="selected" </ww:if> value="20">20</option>
								      <option  <ww:if test="editMm==21"> selected="selected" </ww:if> value="21">21</option>
								      <option  <ww:if test="editMm==22"> selected="selected" </ww:if> value="22">22</option>
								      <option  <ww:if test="editMm==23"> selected="selected" </ww:if>value="23">23</option>
								      <option  <ww:if test="editMm==24"> selected="selected" </ww:if> value="24">24</option>       
								      <option  <ww:if test="editMm==25"> selected="selected" </ww:if> value="25">25</option>
								      <option  <ww:if test="editMm==26"> selected="selected" </ww:if> value="26">26</option>
								      <option  <ww:if test="editMm==27"> selected="selected" </ww:if> value="27">27</option>
								      <option  <ww:if test="editMm==28"> selected="selected" </ww:if> value="28">28</option>
								      <option  <ww:if test="editMm==29"> selected="selected" </ww:if> value="29">29</option>
								      <option  <ww:if test="editMm==30"> selected="selected" </ww:if> value="30">30</option>
								      <option  <ww:if test="editMm==31"> selected="selected" </ww:if> value="31">31</option>
								      <option  <ww:if test="editMm==32"> selected="selected" </ww:if> value="32">32</option>
								      <option  <ww:if test="editMm==33"> selected="selected" </ww:if> value="33">33</option>
								      <option  <ww:if test="editMm==34"> selected="selected" </ww:if> value="34">34</option>
								      <option  <ww:if test="editMm==35"> selected="selected" </ww:if> value="35">35</option>
								      <option  <ww:if test="editMm==36"> selected="selected" </ww:if> value="36">36</option>
								      <option  <ww:if test="editMm==37"> selected="selected" </ww:if> value="37">37</option>
								      <option  <ww:if test="editMm==38"> selected="selected" </ww:if> value="38">38</option>
								      <option  <ww:if test="editMm==39"> selected="selected" </ww:if> value="39">39</option>
								      <option  <ww:if test="editMm==40"> selected="selected" </ww:if> value="40">40</option>
								      <option  <ww:if test="editMm==41"> selected="selected" </ww:if>value="41">41</option>
								      <option  <ww:if test="editMm==42"> selected="selected" </ww:if> value="42">42</option>
								      <option  <ww:if test="editMm==43"> selected="selected" </ww:if> value="43">43</option>
								      <option  <ww:if test="editMm==44"> selected="selected" </ww:if> value="44">44</option>
								      <option  <ww:if test="editMm==45"> selected="selected" </ww:if> value="45">45</option>
								      <option  <ww:if test="editMm==46"> selected="selected" </ww:if> value="46">46</option>
								      <option  <ww:if test="editMm==47"> selected="selected" </ww:if> value="47">47</option>
								      <option  <ww:if test="editMm==48"> selected="selected" </ww:if> value="48">48</option> 
								      <option  <ww:if test="editMm==49"> selected="selected" </ww:if> value="49">49</option>
								      <option  <ww:if test="editMm==50"> selected="selected" </ww:if> value="50">50</option>
								      <option  <ww:if test="editMm==51"> selected="selected" </ww:if> value="51">51</option>
								      <option  <ww:if test="editMm==52"> selected="selected" </ww:if> value="52">52</option>
								      <option  <ww:if test="editMm==53"> selected="selected" </ww:if> value="53">53</option>
								      <option  <ww:if test="editMm==54"> selected="selected" </ww:if> value="54">54</option>
								      <option  <ww:if test="editMm==55"> selected="selected" </ww:if> value="55">55</option>
								      <option  <ww:if test="editMm==56"> selected="selected" </ww:if> value="56">56</option>
								      <option  <ww:if test="editMm==57"> selected="selected" </ww:if> value="57">57</option>       
								      <option  <ww:if test="editMm==58"> selected="selected" </ww:if> value="58">58</option>
								      <option  <ww:if test="editMm==59"> selected="selected" </ww:if> value="59">59</option> 
								    </select>  
								     <ww:property value='#session.local.a00495' />         
		                            </td>
		                          </tr>
		                          
		                         <tr>
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00035' />：</th>
		                            <td>
		                                    
		                                    <input id="step2"  checked="checked" name="type" <ww:if test="editType==1">   checked="true"   </ww:if> type="radio" value="1"/> 
										    <ww:property value="#session.local.a00484" />
										    &nbsp;&nbsp;
										    <input id="step3" type="radio" name="type" <ww:if test="editType==0">   checked="true"  </ww:if> value="0"/> 
										    <ww:property value="#session.local.a00485" />
		                            </td>
		                          </tr>
		                          
		                          <tr>
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00493' />：</th>
		                            <td id="step4">   
		                                 <input   name="zq" <ww:if test="editZq1==1"> checked="checked"  </ww:if>   type="checkbox" value="1"/> <ww:property value='#session.local.a00475' />  &nbsp;
									     <input name="zq" <ww:if test="editZq2==2"> checked="checked"  </ww:if>  type="checkbox" value="2"/> <ww:property value='#session.local.a00476' />  &nbsp;
									     <input name="zq" <ww:if test="editZq3==3"> checked="checked"  </ww:if>  type="checkbox" value="3"/> <ww:property value='#session.local.a00478' />  &nbsp;
									     <input name="zq" <ww:if test="editZq4==4"> checked="checked"  </ww:if>  type="checkbox" value="4"/> <ww:property value='#session.local.a00479' />  &nbsp;
									     <input name="zq" <ww:if test="editZq5==5"> checked="checked"  </ww:if>  type="checkbox" value="5"/> <ww:property value='#session.local.a00480' />  &nbsp;
									     <input name="zq" <ww:if test="editZq6==6"> checked="checked"  </ww:if>  type="checkbox" value="6"/> <ww:property value='#session.local.a00481' />  &nbsp;
									     <input name="zq" <ww:if test="editZq7==7"> checked="checked"  </ww:if>  type="checkbox" value="7"/> <ww:property value='#session.local.a00482' />  &nbsp;
									     <input name="zq" <ww:if test="editZq8==8"> checked="checked"  </ww:if>  type="checkbox" value="8"/> <ww:property value='#session.local.a00483' />  &nbsp;
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
