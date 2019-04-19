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
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/My97DatePicker/<ww:property value='#session.local.a00000' />_WdatePicker.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<style type="">

 .inputFileWrapper label{
            display: block;
            float: left;
            position: relative;
        }
        .inputFileWrapper input[type="file"]{
            position: absolute;
            width: 1px;
            height: 1px;
            clip:rect(0,0,0,0);
        }
        .inputFileWrapper .custorm-style{
            display: block;
            
            height: 30px;
            margin-top: 5px;
        }
        .inputFileWrapper .custorm-style .left-button{
            width: 80px;
            line-height: 30px;
            background: #0a67fb;
            color: #fff;
            display: block;
            text-align: center;
            float: left;
        }
        .inputFileWrapper .custorm-style .right-text{
            width: 300px;
            height: 30px;
            line-height: 30px;
            display: block;
            float: right;
            padding: 4px;
            border: 1px solid #008ac7;
            overflow: hidden;
            -ms-text-overflow: ellipsis;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        

</style>
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
			    element: '#vol',
			    intro: "<ww:property value='#session.local.a00414' /><span style='color:blue'> <ww:property value='#session.local.a00461' /></span>"
			},  	
			{  
				element: '#step1',  
				intro: "<ww:property value='#session.local.a00892' /><span style='color:blue'> <ww:property value='#session.local.a00893' /></span>,<ww:property value='#session.local.a00894' />"
			},
			{
				element: '#step2',  
				intro: "<ww:property value='#session.local.a00895' />"
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

/*设置终端音量*/
function client_cs_vol(){
	
    document.form1.action="fbcsvol.vs";
    document.form1.submit(); 
    
} 

/*连接超时设置*/
function client_cs_connectovertime(){    
     document.form1.action="fbcsconnvertime.vs";
     document.form1.submit();   
}

/*下载限速*/
function client_cs_downset(){
	 document.form1.action="fbcsdownset.vs";
     document.form1.submit();   
}


/*触摸间隔*/
function client_cs_touchspacetimeset(){

	 var urltime=document.getElementById("urltime").value;
     if(urltime<1)
		{
		  layer.msg("<ww:property value='#session.local.a00472' />");
		  return;
		}
	 if(urltime.length>8){

		 layer.msg("<ww:property value='#session.local.a00635' />");
         return;
     }	
     document.form1.action="fbcstouchspacetime.vs";
     document.form1.submit();   
}



/*程序更新*/
function client_cs_upclient(){
	//var gx=document.getElementById("gx").value;
	//if(gx.length<1)
	//{
	//	layer.msg("<ww:property value='#session.local.a00473' />");
	//    return;
	//}
 
	var apkfilename=$("#apkfilename  option:selected").val();
	
	if(apkfilename==undefined){
		layer.msg("<ww:property value='#session.local.a00473' />");
		return;
	}
	//alert(apkfilename)
	document.form1.action="fbcsupclient.vs";
    document.form1.submit();       
}


/*获取终端信息*/
function client_cs_info(){
	  document.form1.action="fbcsinfo.vs";
      document.form1.submit();     
 }

/*修改无节目播放图片*/
function client_cs_upnoitem(){
	
	var filename=document.getElementById("noitem").value;

	var mime = filename.toLowerCase().substr(filename.lastIndexOf(".")); 
	
	if(mime==".jpg"||mime==".png") 
	{
		 document.form1.action="fbcsupnoitem.vs";
		 document.form1.submit();       
	}else{
		layer.msg("<ww:property value='#session.local.a00624' />"); 
	}
}

//发送回传数据(按时间) 
function getTimeWriteInfo(){

		var sdate=document.getElementById("sdate").value;
		var edate=document.getElementById("edate").value;

		if(sdate.length!=10)
		{
			layer.msg("<ww:property value='#session.local.a00542' />");
		    return;
		} 
		 if(edate.length!=10)
		 {
			layer.msg("<ww:property value='#session.local.a00543' />");
		   return;
		 } 
		 var flag=comptime(sdate,edate);
		 if(flag){
			 document.form1.action="fbcstimewriteinfo.vs";
			 document.form1.submit();
         }else{
        	   layer.msg("<ww:property value='#session.local.a00544' />");
			   return;
		 }
	 
}
//判断开始日期和结束日期
function comptime(beginTime,endTime){
      var beginTimes=beginTime.substring(0,10).split('-');
      var endTimes=endTime.substring(0,10).split('-');
      beginTime=beginTimes[1]+'-'+beginTimes[2]+'-'+beginTimes[0]+' '+beginTime.substring(10,19);
      endTime=endTimes[1]+'-'+endTimes[2]+'-'+endTimes[0]+' '+endTime.substring(10,19);
	   var a =Date.parse(endTime)-Date.parse(beginTime);
	   if(a<0){
	       return false;
	   }else{
	       return true;
	   }
}


/*设置终端密码*/
function client_cs_cpw(){
	 //var clientPaw=document.getElementById("clientPaw").value;
     //if(clientPaw.length==0){
     //	layer.msg("<ww:property value='#session.local.a00195' />");
     //   return ;
     //}
	 document.form1.action="fbcscpw.vs";
     document.form1.submit();   
}

/*设置人数统计方式*/
function client_cs_peopleCountType(){
	
	document.form1.action="fbcspeoplecounttype.vs";
    document.form1.submit();   
	 
}

/*设置人数统计返回时间*/
function client_cs_peopleGetTime(){

	var peopleCountGetTime=$("#peopleCountGetTime").val();
	
	if(peopleCountGetTime.length==0){
        layer.msg("<ww:property value='#session.local.b00114' /><ww:property value='#session.local.a00691' />");
        return;
    }

	document.form1.action="fbcspeoplecountgettime.vs";
    document.form1.submit();   

}


/*设置获取终端日志*/
function client_cs_log(){
	
	document.form1.action="fbcsgetclientlog.vs";
    document.form1.submit();   
	 
}

/*新增apk跳转*/
function toAddApk(){
	
	window.parent.location.href="tosyscsapk.vs";
	
}

/*录像控制*/
function client_cs_camera(){

	document.form1.action="fbcscameraset.vs";
    document.form1.submit();
	
}

/*设置广告位*/
function client_cs_adv(){

    var advertisementValue=$("#advertisementValue").val();

	
	if(advertisementValue.length==0){
        layer.msg("<ww:property value='#session.local.a00195' />");
        return;
    }

	if(isNaN(Number(advertisementValue))){  //当输入不是数字的时候，Number后返回的值是NaN;然后用isNaN判断。
         layer.msg("<ww:property value='#session.local.a00671'  />");
         return
    }

	document.form1.action="fbAdvertisement.vs";
    document.form1.submit();
    
} 


function checkUrl(str) { 
	var RegUrl = new RegExp(); 
	RegUrl.compile("[A-Za-z0-9-_]+\\.[A-Za-z0-9-_%&\?\/.=]+$");
	if (!RegUrl.test(str)) { 
		
		return false; 
	} 
		return true; 
} 



//只验证ipv4地址
function ipvalidate(ip) {
  var val = /([0-9]{1,3}\.{1}){3}[0-9]{1,3}/;
  var vald = val.exec(ip);
  if (vald == null) {
      
      return false;
  }
  if (vald != '') {
      if (vald[0] != ip) {
          
          return false;
      }
  }
  return true;

}

/*设置终端指向服务端IP*/
function client_cs_setIp(){

    var setClientIp=$("#setClientIp").val();

	
	if(setClientIp.length==0){
        layer.msg("<ww:property value='#session.local.b00341' />");
        return;
    }
	
	var ipFlag=false;
	
	if(ipvalidate(setClientIp)){
		
		
		ipFlag=true;
		
	}else if(checkUrl(setClientIp)){
		
		ipFlag=true;
	}
	
	if(!ipFlag){
		layer.msg("<ww:property value='#session.local.b00009' />");
		return;
	}
	
	
	layer.confirm("<ww:property value='#session.local.b00340' />", {icon:3, title:"提示"}, function(index){
		  
		document.form1.action="fbcsSetClientIp.vs";
	    document.form1.submit();
	    
   });

	
    
} 


/*录像控制*/
function client_cs_doubleScreen_switch(){

	document.form1.action="fbcsSetClientDoubelScreenSwitch.vs";
    document.form1.submit();
	
}

 

</script>

 <script>
     var fileBtn = $("input[type=file]");
     fileBtn.on("change", function(){
         var index = $(this).val().lastIndexOf("\\");
         var sFileName = $(this).val().substr((index+1));
         $("#rightText").html(sFileName);
     });
 </script>


</head>
<body onload="init_self()"  >
<form name="form1" method="post" enctype="multipart/form-data">
<div class="title bottom">
		<div class="t_container" >
			<div class="loc">
		        <ww:property value='#session.local.a00065' /> :
		        <span class="function"><ww:property value='#session.local.a00240' /></span>
		        <span class="material_bg"><ww:property value='#session.local.a00459' /></span>
			</div>
			<div class="material_show">
				
			</div>
		</div>
</div>

<div class="c_middle download_manager" >
    <div>
	    <div class="c_right_header" >
		
		    <ul class="op_r">
			 <!--<li><a href="javascript:open_cg1_add();"><ww:property value='#session.local.a00021' /></a></li>-->
             <!--<li><a href="javascript:del_sel('delcg1.vs');"><ww:property value='#session.local.a00025' /></a></li>-->
			</ul>
		</div>
        <!--显示内容-->
        <div style="height: 530px;width: 1050px;margin-top: -30px;overflow: auto;" >
			 <table class="insert-tab" width="70%">
                        <tbody>
                         <tr>
                            <th width="200px"><ww:property value='#session.local.a00461' />：</th><!-- 音量 -->
                            <td width="220px">
                                  <select name="vol" style="width:80px"  id="vol">
									     <option value="0">0%</option>
									     <option value="10">10%</option>
									     <option value="20">20%</option>
									     <option value="30">30%</option>
									     <option value="40">40%</option>
									     <option value="50">50%</option>
									     <option value="60">60%</option>
									     <option value="70">70%</option>
									     <option value="80">80%</option>
									     <option value="90">90%</option>
									     <option value="100">100%</option>
									     
						  			</select>
						  			
						  			<input id="step1"  class="btn btn-primary btn6 mr10" style="width: 50px;height: 30px;" value="<ww:property value='#session.local.a00460' />" type="button"  onclick="client_cs_vol()"/> 
                            </td>
                            
                            
                           <td width="200px" style="text-align: right;"><ww:property value='#session.local.a00462' />：</td><!-- 连接超时 -->
                            <td>
                            	<select id="lian" style="width:80px" name="lian">
					                  <option value="5">5</option>
					                  <option selected="selected" value="10">10</option>
					                  <option value="15">15</option>
					                  <option value="20">20</option>
					                  <option value="25">25</option>
					                  <option value="30">30</option>
			                    </select>
                                <input class="btn btn-primary btn6 mr10" style="width: 50px;height: 30px;" value="<ww:property value='#session.local.a00460' />" type="button"  onclick="client_cs_connectovertime()"/>
                            </td>
                            
                            
                            
                         </tr>
                         
                         
                         <!-- 
                         <tr>
                            <th width="200"><ww:property value='#session.local.a00463' />：</th>  下载限速 
                            <td>
                                 <input  name="xiansu" style="width:200px;height: 25px;line-height: 25px;"  id="xiansu"  onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  />
                            </td>
                            <td><input class="btn btn-primary btn6 mr10" style="width: 120px;height: 30px;"  value="<ww:property value='#session.local.a00460' />" type="button"  onclick="client_cs_downset()"/></td>
                         </tr>
                         -->
                         
                         
                         < >
                               <th><ww:property value='#session.local.a00464' />：</th> <!-- 触摸间隔 -->
                               <td>
                                  <input  name="urltime" style="width:80px;height: 25px;line-height: 25px;"  id="urltime"  onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  />
                                  <input class="btn btn-primary btn6 mr10" style="width: 50px;height: 30px;"  value="<ww:property value='#session.local.a00460' />" type="button"  onclick="client_cs_touchspacetimeset()"/>
                               </td>
                               
                               <td style="text-align: right;" ><ww:property value='#session.local.a00465' />：</td> <!-- 程序更新 -->
                               <td>
                                  
                                 
<!-- 					                 <div class="inputFileWrapper"> -->
<!-- 								      <label for="gx"> -->
<!-- 								         <input type="file" id="gx" name="gx"/> -->
<!-- 								         <span class="custorm-style"> -->
<%-- 								             <span class="left-button" ><ww:property  value="#session.local.a00063"/></span> --%>
								            
<!-- 								          </span> -->
								        
<!-- 								     </label> -->
<!-- 								     </div> -->
								     
								      <select name="apkfilename" id="apkfilename">
								      
									        <ww:iterator value="apks">
										    
										        <option value="<ww:property value='filename' />"> <ww:property value="name" /> </option>
										    
									        </ww:iterator>
                                      
                                      </select>
                                      
                                      
                                      <ww:if test="#session.sysset==0">
															    
									  </ww:if>
									  <ww:else>
									     <i onclick="toAddApk()" style="cursor: pointer;" title="<ww:property value='#session.local.a00021' />"  class="icon icon-plus-sign"></i>
									  </ww:else>

                                      <input class="btn btn-primary btn6 mr10" style="width: 50px;height: 30px;"  value="<ww:property value='#session.local.a00460' />" type="button"  onclick="client_cs_upclient()"/>
                                    
                                </td>
                         </tr>
                         
<!--                         <tr>-->
<!--                                <th><ww:property value='#session.local.a00466' />：</th>-->
<!--                                <td>-->
<!--                                  <input class="btn btn-primary btn6 mr10" style="width: 120px;height: 30px;"  value="<ww:property value='#session.local.a00460' />" type="button"  onclick="client_cs_info()"/>-->
<!--                                </td>-->
<!--                         </tr>-->
                        
                         
                       
                         
                         
                         <tr>
                            <th width="60"><ww:property value='#session.local.a00769' />：</th><!-- 设置终端密码 -->
                            <td>
                                 <input  name="clientPaw" style="width:80px;line-height: 25px;height: 25px;"  id="clientPaw"   />
                            <input class="btn btn-primary btn6 mr10" style="width: 50px;height: 30px;"  value="<ww:property value='#session.local.a00460' />" type="button"  onclick="client_cs_cpw()"/></td>
                            
                            
                            <td width="60" style="text-align: right;" ><ww:property value='#session.local.b00332' />:</td><!-- 感应方式 -->
                            <td>
                                 
                                 <select name="peopleCountType" style="width:150px;">
									      <option value="0"><ww:property value="#session.local.a00020"  /></option><!-- 关 -->
									      <option value="1"><ww:property value="#session.local.b00112"  /></option><!-- 人脸识别 -->
									      <option value="2"><ww:property value="#session.local.b00333"  /></option><!-- GPIO感应播放节目 -->
									      <option value="3"><ww:property value="#session.local.b00334"  /></option><!-- GPIO感应亮屏 -->
									      <option value="4"><ww:property value="#session.local.b00335"  /></option><!-- GPIO感应灭屏 -->
									      <option value="5"><ww:property value="#session.local.b00336"  /></option><!-- GPIO感应缩放屏幕 -->
									      <option value="6"><ww:property value="#session.local.b00337"  /></option><!-- GPIO感应io按钮刷新logo -->
									      <option value="7"><ww:property value="#session.local.b00338"  /></option><!-- GPIO感应人数统计 -->
									      
                                 </select>
                                 <input class="btn btn-primary btn6 mr10" style="width: 50px;height: 30px;"  value="<ww:property value='#session.local.a00460' />" type="button"  onclick="client_cs_peopleCountType()"/>
                                 
                             </td>
                            
                            
                         </tr>
                         
                         
                         
                      
                         
                         
                          <tr>
                            <th width="60"><ww:property value='#session.local.b00114' />：</th><!-- 人数统计回传时间(分) -->
                            <td>
                                 <input  name="peopleCountGetTime" style="width:80px;line-height: 25px;height: 25px;"  id="peopleCountGetTime"  onkeyup="this.value=this.value.replace(/\D/g,'')"  />
                                 <input class="btn btn-primary btn6 mr10" style="width: 50px;height: 30px;"  value="<ww:property value='#session.local.a00460' />" type="button"  onclick="client_cs_peopleGetTime()"/>
                            
                            </td>
                            
                            
                            <td width="60" style="text-align: right;" ><ww:property value='#session.local.b00221' />：</td><!-- 获取终端日志-->
                            <td>
                                 
                                 <input class="btn btn-primary btn6 mr10" style="width: 50px;height: 30px;"  value="<ww:property value='#session.local.a00460' />" type="button"  onclick="client_cs_log()"/>
                                 
                             </td>
                             
                             
                         </tr>
                         
                         
                        <tr>
                            <th width="60"><ww:property value='#session.local.b00263' />：</th><!-- 录像控制 -->
                            <td>
                                 
                                 <select name="cameravar"  style="width:80px">
								
								    	    <option value="0"><ww:property value='#session.local.b00264' /></option><!-- 关闭 -->
<!--								    	<option value="1"><ww:property value="#session.local.b00265" /></option>感应拍照 -->
								    	    <option value="2"><ww:property value="#session.local.b00266" /></option><!--录像存档 -->
<!--								    	<option value="3"><ww:property value="#session.local.b00267" /></option>实时监控 -->
<!--								    	<option value="4"><ww:property value="#session.local.b00268" /></option>自动拍照 -->
								    	
							    </select>
                                 <input class="btn btn-primary btn6 mr10" style="width: 50px;height: 30px;"  value="<ww:property value='#session.local.a00460' />" type="button"  onclick="client_cs_camera()"/>
                            
                            </td>
                            
                            
                            <!-- <td width="60"  colspan="2" style="text-align: right;" ></td>-->
                            
                            <td width="60" style="text-align: right;"  >
                            
                               <ww:if test="#session.version_onoff.advertisingSpaceOnoff==1">
                               <ww:property value='#session.local.b00292' />：
                               </ww:if>
                               
                             </td><!-- 设置广告位 -->
                            <td>
                            
                               <ww:if test="#session.version_onoff.advertisingSpaceOnoff==1">
                                 <input  name="advertisementValue" style="width:80px;line-height: 25px;height: 25px;"  id="advertisementValue"   />
                                 
                                 <input class="btn btn-primary btn6 mr10" style="width: 50px;height: 30px;"  value="<ww:property value='#session.local.a00460' />" type="button"  onclick="client_cs_adv()"/>
                                 
                               </ww:if>  
                            
                            </td>
                            
                         </tr>
                         
                         <tr>
                            <th width="60"><ww:property value='#session.local.b00339' />：</th><!-- 终端指向IP -->
                            <td>
                                 
                                 <input  name="setClientIp" style="width:120px;line-height: 25px;height: 25px;"  id="setClientIp"   />
                                 <input class="btn btn-primary btn6 mr10" style="width: 50px;height: 30px;"  value="<ww:property value='#session.local.a00460' />" type="button"  onclick="client_cs_setIp()"/>
                            
                            </td>
                            
                            
                            <!-- <td width="60"  colspan="2" style="text-align: right;" ></td>-->
                            
                            <td width="60" style="text-align: right;"  >
                            
                                
                                <ww:if test="#session.version_onoff.viceItemOnOff==1">
                            
                                    <ww:property value='#session.local.b00359' />
                                
                                </ww:if>   
                            </td>
                            <td>
                            
                              <ww:if test="#session.version_onoff.viceItemOnOff==1">
                              
                                 <select name="doubleScreenSwitch"  style="width:80px">
								    	    <option value="false"><ww:property value='#session.local.a00351' /></option><!-- 关闭 -->
								    	    <option value="true"><ww:property value="#session.local.a00350" /></option><!-- 打开 -->								    	
							     </select>
                                 <input class="btn btn-primary btn6 mr10" style="width: 50px;height: 30px;"  value="<ww:property value='#session.local.a00460' />" type="button"  onclick="client_cs_doubleScreen_switch()"/>
                             
                              </ww:if>  
                                 
                            
                            </td>
                             
                         </tr>
                         
                       
                           <tr>
                               <th><ww:property value="#session.local.a00698"  /> 
                                                                                             ：</th> 
                                <td colspan="3">
                                    <!-- 回传数据(按时间段) -->
                                    <select name="cameratype" style="width:80px; ">
									      <option value="2"><ww:property value="#session.local.a00697"  /></option><!-- 录像 -->
<!--									      <option value="1"><ww:property value="#session.local.a00696"  /></option> 拍照 -->
                                     </select>
                                     <!--开始时间:-->
                                     <ww:property value="#session.local.a00540"/>:
                                     <input id="sdate" type="text" name="sdate"  style="height: 22px;width: 120px;line-height: 25px;"    onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>                                                              
                                                                                                     
                                     <!--结束时间:  -->
                                     <ww:property value="#session.local.a00541"/>:                                                                 
                                     <input id="edate" type="text" name="edate"  style="height: 22px;width: 120px;line-height: 25px;"    onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>                                                                   
                                     <input class="btn btn-primary btn6 mr10" style="width: 50px;height: 30px;" value="<ww:property value='#session.local.a00460' />" type="button"  onclick="getTimeWriteInfo()"/>
                                    
                               </td>
                               
                         </tr>
                         
                          <tr>
                               <th><ww:property value='#session.local.a00623' />：</th> <!-- 修改无节目播放图片 -->
                               <td colspan="2">
                                    
                                    
                                      <!-- 消息展示的内容区 -->
							                <div class="display-area" id="display-area" style="margin-left: 0px;margin-top: 5px;">
							                     <img id="preview"  alt="" style="position: relative;width: 359px;height: 205px;" src="images/no.jpg"  />
							                </div>
							                <!-- 电视机图像的底座   -->
							                <div class="handle-top" style="margin-left: 160px;"></div>
							                <div class="handle-bottom" style="margin-left: 80px;"></div>  
							   </td>
							   <td>
							   
							       
                                     <div class="inputFileWrapper">
								      <label for="noitem">
								         <input type="file" id="noitem" name="noitem"  onchange="previewImage(this)"/>
								         <span class="custorm-style">
								             <span class="left-button"    ><ww:property  value="#session.local.a00026"/></span>
								             

								             </span>
								     </label>
								     </div>
								    
								    
                                   <input class="btn btn-primary btn6 mr10" style="width: 50px;height: 30px;margin-top: 5px;margin-left: 5px;" value="<ww:property value='#session.local.a00460' />" type="button"  onclick="client_cs_upnoitem()"/>
                                   
                             </td>
                             
                             
                         </tr>
                         
                        </tbody>
		        </table>
		</div>
        <!--分页-->
		
	</div>
</div>
<input type="hidden" value="<ww:property value='clientids'/>" name="clientids"  id="clientids" />     <!-- 终端ids -->
<input type="hidden" value="<ww:property value='cgids'/>" name="cgids" id="cgids"/>                   <!-- 终端分组ids -->
<script>
//上传图片前预览
function previewImage(file) {
    var MAXWIDTH = 120;  // 最大图片宽度
    var MAXHEIGHT = 120;  // 最大图片高度
    if (file.files && file.files[0]) {
        var img = document.getElementById('preview');
        img.onload = function () {
            var rect = getZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            img.width = rect.width;
            img.height = rect.height;
        }
        var reader = new FileReader();
        reader.onload = function (evt) { 
            img.src = evt.target.result; 
        }
        reader.readAsDataURL(file.files[0]);
      } else {
          //兼容IE
          file.select();
          var src = document.selection.createRange().text;
          var img = document.getElementById('preview');
          img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
      }
}

// 获取缩放的尺寸
function getZoomParam(maxWidth, maxHeight, width, height) {
    var param = { top: 0, left: 0, width: width, height: height };
    if (width > maxWidth || height > maxHeight) {
        rateWidth = width / maxWidth;
        rateHeight = height / maxHeight;
        if (rateWidth > rateHeight) {
            param.width = maxWidth;
            param.height = Math.round(height / rateWidth);
        } else {
            param.width = Math.round(width / rateHeight);
            param.height = maxHeight;
        }
    }
    param.left = Math.round((maxWidth - param.width) / 2);
    param.top = Math.round((maxHeight - param.height) / 2);
    return param;
}



</script>
</form>
</body>
</html>
