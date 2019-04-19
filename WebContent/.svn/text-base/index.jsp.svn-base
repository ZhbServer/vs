<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet"  href="css/index.css"  type="text/css" />
<link rel="stylesheet"  href="css/reset.css"  type="text/css" />
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<script type="text/javascript" src="js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="js/jay.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<style>
a{text-decoration:none;}
</style>
<script type="text/javascript">
var openIntro;

function init_self(){
	document.form1.target = "_self";

	openIntro = <%=request.getParameter("openIntro")%>;

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
		overlayOpacity: 0.6,  
		steps: [
			{
			    element: '#step0',
			    intro: "<ww:property value='#session.local.a00875' />"
			}, 	  	
			{  
				element: '#step1',  
				intro: "<ww:property value='#session.local.a00876' />",
				position: "top"
			}
		  ]  
		});  

		document.getElementById("step1").onclick = function (){
			intro.exit();
			open_noenter_client_1();
			document.getElementById("step1").onclick = function (){
				open_noenter_client();
			};
		};
		intro.start().oncomplete(function() {  
			intro.exit();  
	    });

		intro.onexit(function() {
			layer.msg("<ww:property value='#session.local.a00864' />");
			document.getElementById("step1").onclick = function (){
				open_noenter_client();
			};
		});
	}

}

/*(新手指引)弹出未录入终端*/
function open_noenter_client_1(){
	 layer.open({
	 		type: 2,
	         area: ['1100px', '600px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'tonoclient.vs?openIntro=1',
	         scrollbar: false,
	         end: function(){ 	  
			      window.location.href="index.vs";
	 		 }
	 	});   
	
}

/*弹出未录入终端*/
function open_noenter_client(){
	 layer.open({
	 		type: 2,
	         area: ['1100px', '600px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'tonoclient.vs',
	         scrollbar: false,
	         end: function(){ 	  
			      window.location.href="index.vs";
	 		 }
	 	});   
	
}

/*上传素材快捷方式*/
function replace_up_sucai(){
    
	 window.location.href="tosclist.vs?sucai.type=1&gssi.sucaigroupid=0";
}

/*在线终端*/
function open_zx_client(){
	layer.open({
 		 type: 2,
         area: ['1100px', '600px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'onclient.vs',
         scrollbar: false,
         end: function(){ 	  
		      
 		 }
 	});   
	
}



/*离线终端*/
function open_off_client(){
	layer.open({
 		type: 2,
         area: ['1100px', '600px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'offclient.vs',
         scrollbar: false,
         end: function(){ 	  
		      
 		 }
 	});   
	
}
/*未审核节目*/
function open_nooncheck_item(){
	layer.open({
 		type: 2,
         area: ['1100px', '600px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'tonoocheckitem.vs',
         scrollbar: false,
         end: function(){ 	  
		      window.location.href="index.vs";
 		 }
 	});   
	
}


/*未审核计划*/
function open_nooncheck_jh(){
	layer.open({
 		type: 2,
         area: ['1100px', '600px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'tonoocheckjh.vs?type=1',
         scrollbar: false,
         end: function(){ 	  
		      window.location.href="index.vs";
 		 }
 	});   
	
}


/*未审核数据*/
function open_nooncheck_dish(){
	layer.open({
 		type: 2,
         area: ['1100px', '600px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'tonoocheckdata.vs',
         scrollbar: false,
         end: function(){ 	  
		      window.location.href="index.vs";
 		 }
 	});   
	
}

 
</script>
</head>
<body onload="init_self()">
 <form  name="form1" method="post" >
	<div class="title">
		<div class="t_container">
		<div class="loc">
		     <ww:property value='#session.local.a00065' />:
		        <span>
		        <ww:property value='#session.local.a00405' />
		        </span>
		</div>
		
		</div>
	</div>

<div class="content_container">
<div class="content">
<div class="content_left">
<div class="left_1">
<div><img src="image/left_1.png" /></div>
<!-- 终端总数 -->
<div class="cou_show"><ww:property value='#session.local.a00399' />
     <span>
        <input type="text"  disabled="disabled" style="width: 30px;background-color:transparent;border: 0px;text-align: center;font-size: 15px;" value="<ww:property value='cocount' />"/>
        
    </span><ww:property value='#session.local.a00406' />
</div>
</div>
<div class="left_2">
<ul>
<!-- 在线终端 -->
<li class="online" ><ww:property value='#session.local.a00400' /> 

     <span onclick="open_zx_client()"  >
      
       <input  type="text"  disabled="disabled" style="width: 30px;background-color:transparent;border: 0px;text-align: center;font-size: 15px;cursor:pointer;" value="<ww:property value='onclient' />"/>
      
     </span>
     
     <ww:property value='#session.local.a00406' />
</li>
<!-- 离线终端 -->
<li class="outline" ><ww:property value='#session.local.a00401' /> 
      
      <span onclick="open_off_client()"  >
      
           <input  type="text"  disabled="disabled" style="width: 30px;background-color:transparent;border: 0px;text-align: center;font-size: 15px;cursor:pointer;" value="<ww:property value='offclient' />"/>
      
      </span>     
    
      <ww:property value='#session.local.a00406' />
</li>
<!-- 未审核节目 -->
<li class="oncheckitem" >
<!--<li class="oncheckitem">-->

    <ww:property value='#session.local.a00594' /> 
     
      
         <span onclick="open_nooncheck_item()"  >
      
           <input  type="text"  disabled="disabled" style="width: 30px;background-color:transparent;border: 0px;text-align: center;font-size: 15px;cursor:pointer;" value="<ww:property value='nocheckitem' />"/>
      
         </span>     
      
      
     <ww:property value='#session.local.a00834' />
    
</li>

<!-- 未审核计划 -->
<li class="oncheckjh" >


    <ww:property value='#session.local.b00302' /> 
     
      
         <span onclick="open_nooncheck_jh()"  >
      
           <input  type="text"  disabled="disabled" style="width: 30px;background-color:transparent;border: 0px;text-align: center;font-size: 15px;cursor:pointer;" value="<ww:property value='nocheckjh' />"/>
      
         </span>     
      
      
     <ww:property value='#session.local.a00834' />
    
</li>

<ww:if test="#session.version_onoff.dishOnOff==1"> 
	<!-- 未审核数据-->
	<li class="oncheckjh" >
	
	
	                      未审核数据
	     
	      
	         <span onclick="open_nooncheck_dish()"  >
	      
	           <input  type="text"  disabled="disabled" style="width: 30px;background-color:transparent;border: 0px;text-align: center;font-size: 15px;cursor:pointer;" value="<ww:property value='nocheckdata' />"/>
	      
	         </span>     
	      
	      
	                    个
	    
	</li>
</ww:if>



<!-- 未播放节目终端 -->
<li style="background-image: url('');display: none;" >
<!--<li class="no_play">-->
<!--  <ww:property value='#session.local.a00403' /><span>0</span><ww:property value='#session.local.a00406' />-->
 </li>

  <ww:if test="#session.version_onoff.le_entershow==1"> 
		<li class="no_entry"  >
		<!-- 未录入终端 -->
		<div><ww:property value='#session.local.a00404' />
		
		   
		     
		      <span id="step1" onclick="open_noenter_client()"  >
      
                    <input  type="text"  disabled="disabled" style="width: 30px;background-color:transparent;border: 0px;text-align:center;font-size: 15px;cursor:pointer;" value="<ww:property value='noterminal' />"/>
      
              </span>  
         
		     <ww:property value='#session.local.a00406' />
		 </div>
		</li>
  </ww:if>


</ul>
</div>
</div>

<div class="content_right" style="margin-left: 70px;">
<ul>
<li><a href="javascript:replace_up_sucai();"><img src="image/<ww:property value='#session.local.a00000' />/content_1.jpg"/></a></li><!-- 上传素材 -->
<li><a href="javascript:openAddNewItem();"><img src="image/<ww:property value='#session.local.a00000' />/content_2.jpg"/></a></li><!-- 制作节目 -->
<li class="cr3"><a href="toitemlist.vs?igr.itemgroupid=0"><img src="image/<ww:property value='#session.local.a00000' />/content_3.jpg"/></a></li><!-- 发布节目  -->
<li class="cr3"><a href="javascript:open_result_last();"><img src="image/<ww:property value='#session.local.a00000' />/content_4.jpg"/></a></li><!-- 终端监控 -->
<!-- 
<li style="margin-top:20px;" class="cr3"><img src="image/<ww:property value='#session.local.a00000' />/content_5.jpg"/></li>
<li style="margin-top:20px;" class="cr3"><img src="image/<ww:property value='#session.local.a00000' />/content_6.jpg"/></li>
-->
</ul>



</div>

<!-- 
<div style="float:left: ;margin-left: 100px;margin-left: 500px;font-size: 15px;font-weight: bold;">
  <ul style="float: left;margin-top: 5px;">
     <li style="float: left;margin-right: 80px;">远程控制</li>
     <li style="float: left;margin-right: 80px;">分层管理</li>
     <li style="float: left;margin-right: 80px;">数据统计</li>
  </ul>
</div>
-->
<div style="float:right;display:none;" >
  <img src="image/logo_jlt.jpg"  />
</div>

</div>
</div>
</form>
</body>
</html>
