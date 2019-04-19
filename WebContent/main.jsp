<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name=”viewport” content=”width=device-width, initial-scale=1″ />

<title><ww:property  value="#session.local.a00064"/></title><!-- 信息发布 -->
<link rel="stylesheet" href="css/index.css"/>
<script type="text/javascript"  src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/time.js"></script>
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="js/two_menu_adm.js"></script>
<script type="text/javascript" src="js/cookie.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<style>
body,html{
width:100%;
height:100%;
margin:0px;
padding:0px;
border:0px;
/*color:#FF0000;*/
font-family:Microsoft YaHei;
/*background-color:#134AFF;*/
/*overflow:hidden*/
}
</style>
<script type="text/javascript">

    /*启动获取浏览器高度自适应屏幕*/
    window.onload = function()
    {
    	setCookie("initLoginFlag",1);
    	var cookies = getCookie("tft");
    	
    	if(cookies == null){
    		$("#hide1").css('display','block');
    		$("#hide2").css('display','block');
    		$("#hide3").css('display','block');
    		$("#help").css('color','black'); 
    		$("#hide2").css('left',($("#help").offset().left-7)+"px");
    		
        	$("#hide3").css('left',($("#help").offset().left-7)+"px");
    		setCookie("tft","1");
    	}

        var h = document.body.clientHeight;
      
        var ih=0;
      
        if(h-116>560){
             ih=h-116; 
        }else{
             ih=560;
        }
        
        document.getElementById("content").style.height=(ih)+"px"; 
        
     
        if("<ww:property value='#session.version_onoff.cutt' />"==1){
            /*定时器*/
            setTimeout("ajax_get_hz_c()",60000);
        }


        if("<ww:property value='#session.version_onoff.clientLxOnOff' />"==1){
            /*定时器*/
            setTimeout("ajax_get_lx_client()",60000);
        }

        


        if("<ww:property value='#request.show_menu' />"==1){
        	skip_iframe("toitemlist.vs?igr.itemgroupid=<ww:property value='#request.igid'/>&isMax=<ww:property value='#request.isMax'/>");
        }else if("<ww:property value='#request.show_menu' />"==2){
        	skip_iframe("toiteminteractlist.vs?igr.itemgroupid=<ww:property value='#request.igid'/>&isMax=<ww:property value='#request.isMax'/>");
        }else{
        	skip_iframe('index.vs');
        }
        
    };

    window.onresize = function () {
    	$("#hide2").css('left',($("#help").offset().left-7)+"px");
    	$("#hide3").css('left',($("#help").offset().left-7)+"px");
    }

    function openGuide(index){
		if(index == '1'){
			skip_iframe('operatguide.vs');
			$("#hide1").css('display','none');
    		$("#hide2").css('display','none');   
    		$("#hide3").css('display','none');
    		$("#help").css('color','white');
		}else{
			$("#hide1").css('display','none');
    		$("#hide2").css('display','none');   
    		$("#hide3").css('display','none');
    		$("#help").css('color','white');
		}
    }
   
    /*二级功能菜单跳转*/
    function skip_iframe(surl){

    	 if("<ww:property value='#session.version_onoff.pwdPloy'  />"==1){

             var pwdHistory ="<ww:property value='#session.pwdHistory' />";

             if(pwdHistory==0){
                   //layer.alert("首次登陆请修改密码");
                   layer.alert("<ww:property value='#session.local.b00242'  />");
                   //首次登陆系统请修改密码,修改成功后请重新登陆
                   $("#content").html("<div style='font-size:23px;margin:10% 0px 0px 30%;'><ww:property value='#session.local.b00243'  /></div>");
                   return
             }

             if(pwdHistory==-1){
                 //密码过期重新修改
                 layer.alert("<ww:property value='#session.local.b00246'  />");
                 
                 $("#content").html("<div style='font-size:23px;margin:10% 0px 0px 45%;'><ww:property value='#session.local.b00246'  /></div>");
                 return
           }
             
    	 }  	 
         document.getElementById("c_iframe").src=surl;
    }

    /*修改密码*/
    function up_password(){

    	layer.open({
    		  type: 2,
    		  title: false,
    		  area: ['630px', '360px'],
    		  shade: 0.8,
    		  closeBtn: 0,
    		  shadeClose: true,
    		  shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
    		  content: 'main_update_pwd.jsp',
    		  end: function(){ 
		    		if(window.returnValue==undefined||window.returnValue==""){
						window.returnValue=""; 
		            }else{
					    window.returnValue=""; 
			            layer.msg("<ww:property value='#session.local.a00499' />");
					}     
		 	   }
    		});
    }


    /*系统信息*/
    function open_systeminfo(){
           layer.open({
    		  type: 2,
    		  title: false,
    		  offset: '30px',
    		  area: ['630px', '400px'],
    		  shade: 0.8,
    		  closeBtn: 0,
    		  shadeClose: true,
    		  shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
    		  content: 'indexsysteminfo.vs',
    		  end: function(){}
    		});
    } 

    /*定时刷新获取换纸提醒*/
    function ajax_get_hz_c(){
    	$.ajax({
			type:'post',
			url:'ajaxgethz.vs',
			//data:"password="+password+"&account="+account+"&yzcode="+yzcode,
			datatype:'json',
			async:true,
			success:function(data){		  
			   document.getElementById("hzs").innerHTML="("+data+")"; 
			   document.getElementById("hzs2").innerHTML="("+data+")"; 
			}
		});
    }



    /*定时刷新获取提醒*/
    function ajax_get_item_warning(){
    	$.ajax({
			type:'post',
			url:'ajaxgetwarningitem.vs',
			//data:"password="+password+"&account="+account+"&yzcode="+yzcode,
			datatype:'json',
			async:true,
			success:function(data){		  
			   document.getElementById("wis").innerHTML="("+data+")"; 
			   document.getElementById("twis").innerHTML="("+data+")"; 
			}
		});
    }



    /*定时刷新获取提醒*/
    function ajax_get_lx_client(){
    	$.ajax({
			type:'post',
			url:'ajaxGetLxClientCount.vs',
			//data:"password="+password+"&account="+account+"&yzcode="+yzcode,
			datatype:'json',
			async:true,
			success:function(data){		  
			   document.getElementById("lxOut2").innerHTML="("+data+")"; 
			   document.getElementById("lxOut").innerHTML="("+data+")"; 
			}
		});
    }

    

    


    /*换纸终端显示*/
    function hz_client_show(){

    	layer.open({
    		  type: 2,
    		  title: false,
    		  area: ['1100px', '600px'],
    		  shade: 0.8,
    		  //closeBtn: 0,
    		  shadeClose: true,
    		  shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
    		  content: 'tohzclient.vs',
    		  end: function(){ 
		    		
		 	   }
    		});
    }

    /*终端三天预警显示*/
    
    function client_lx_client(){

    	layer.open({
  		  type: 2,
  		  title: false,
  		  area: ['1100px', '600px'],
  		  shade: 0.8,
  		  //closeBtn: 0,
  		  shadeClose: true,
  		  shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
  		  content: 'clientLxYjList.vs',
  		  end: function(){ 
		    		
		  }
  		});

    }
    
    
    
    
    

    /*修改jdbc*/
    function up_jdbc_password(){

    	layer.open({
    		  type: 2,
    		  title: false,
    		  area: ['630px', '360px'],
    		  shade: 0.8,
    		  closeBtn: 0,
    		  shadeClose: true,
    		  shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
    		  content: 'main_update_jdbc_pwd.jsp',
    		  end: function(){ 
		    		if(window.returnValue==undefined||window.returnValue==""){
						window.returnValue=""; 
		            }else{
					    window.returnValue=""; 
			            layer.msg("<ww:property value='#session.local.b00248'  />");
					}     
		 	   }
    		});
    }



    /*预警节目列表*/
    function warning_item(){

    	layer.open({
    		  type: 2,
    		  title: false,
    		  area: ['1100px', '600px'],
    		  shade: 0.8,
    		  closeBtn: 0,
    		  shadeClose: true,
    		  shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
    		  content: 'towarningitem.vs',
    		  end: function(){ 
		    		if(window.returnValue==undefined||window.returnValue==""){
						window.returnValue=""; 
		            }else{
					    window.returnValue=""; 
			            layer.msg("<ww:property value='#session.local.a00499' />");
					}     
		 	   }
    		});
    }
    

</script>
</head>
<body>
<div class="header">
	<div class="head_container">
		<div class="logo">
		   <img src="image/<ww:property value='#session.local.a00000' />/logo.png"/>
		</div>
	<div class="header_right"  style="margin-top: 20px;">

	<div class="header_right_2">
	<ul>
	<li class="first"><a href="javascript:skip_iframe('index.vs')"><ww:property  value="#session.local.a00405"/></a></li><!-- 首页 -->
	<li>
		<input type="hidden" value="1" />
		<a  href="javascript:skip_iframe('tosclist.vs?sucai.type=1&gssi.sucaigroupid=0')"><ww:property  value="#session.local.a00007"/></a> <!-- 素材管理 -->
		<div class="two_menu">
		<div class="top_pic"></div>
			<a href="javascript:skip_iframe('tosclist.vs?sucai.type=1&gssi.sucaigroupid=0')"><ww:property value='#session.local.a00058' /></a>
			<a href="javascript:skip_iframe('tosclist.vs?sucai.type=4&gssi.sucaigroupid=0')"><ww:property value='#session.local.a00061' /></a>
			<a href="javascript:skip_iframe('tosclist.vs?sucai.type=3&gssi.sucaigroupid=0')"><ww:property value='#session.local.a00060' /></a>
			<a href="javascript:skip_iframe('tosclist.vs?sucai.type=2&gssi.sucaigroupid=0')"><ww:property value='#session.local.a00059' /></a>
			<a href="javascript:skip_iframe('tosclist.vs?sucai.type=6&gssi.sucaigroupid=0')">PPT</a>
			<a href="javascript:skip_iframe('tosclist.vs?sucai.type=7&gssi.sucaigroupid=0')">Word</a>
			<a href="javascript:skip_iframe('tosclist.vs?sucai.type=8&gssi.sucaigroupid=0')">Excel</a>
			<a href="javascript:skip_iframe('tosclist.vs?sucai.type=9&gssi.sucaigroupid=0')">PDF</a>
			<a href="javascript:skip_iframe('tosclist.vs?sucai.type=10&gssi.sucaigroupid=0')">TXT</a>
	    </div>
	</li>
	<li>
		<input type="hidden" value="2" />
		<a href="javascript:skip_iframe('toitemlist.vs?igr.itemgroupid=0')"><ww:property  value="#session.local.a00008"/></a><!-- 节目管理 -->
		<div class="two_menu">
		<div class="top_pic"></div>
		<a href="javascript:skip_iframe('toitemlist.vs?igr.itemgroupid=0')"><ww:property  value="#session.local.a00609"/></a> <!-- 节目列表 -->
		<a href="javascript:skip_iframe('toiteminteractlist.vs?igr.itemgroupid=0')"><ww:property  value="#session.local.a00434"/></a> <!-- 互动列表 -->
		<a href="javascript:skip_iframe('jhlist.vs?jhtype=1')"><ww:property  value="#session.local.a00645"/></a> <!-- 计划管理 -->
		<a href="javascript:skip_iframe('tonoticejhlist.vs')"><ww:property value='#session.local.a00534' /></a>  <!-- 通知发布 -->
		
		
		<a href="javascript:skip_iframe('totreasurelist.vs')"><ww:property value='#session.local.c00036' /></a>  <!-- 宝箱活动 -->
		
		<ww:if test="#session.version_onoff.tblogoShow==1">
		     <a href="javascript:skip_iframe('totbjhlist.vs')"><ww:property value='#session.local.b00212' /></a> <!-- 台标发布 -->
        </ww:if>
        
		 
		<ww:if test="#session.version_onoff.voiceBroadcastShow==1">
		     <a href="javascript:skip_iframe('tovoicebroadcastlist.vs')"><ww:property value='#session.local.a00703' /></a><!-- 语音播报 -->
        </ww:if>
        
        
        <ww:if test="#session.version_onoff.factoryPlanShow==1">
        	<a href="javascript:skip_iframe('fplist.vs')"><ww:property value='#session.local.a01042' /></a>     <!-- 工厂计划 -->
        </ww:if>
        
        
        <ww:if test="#session.version_onoff.projectorOnOff==1">
        	<a href="javascript:skip_iframe('toprojectionlist.vs')"><ww:property value='#session.local.b00278' /></a><!-- 投影仪 -->
        </ww:if>
        
        
         <ww:if test="#session.version_onoff.dataInfoOnOff==1">
        	<a href="javascript:skip_iframe('todatalist.vs')"><ww:property value='#session.local.b00348' /></a>  <!-- 数据发送  -->
         </ww:if>
        
        
        
        
        
<!--		<a href="program_list2.html">下载管理</a>-->
<!--		<a href="program_management_publish.html">发布节目</a>-->
<!--		<a href="program_management_download.html">执行结果</a>-->
		</div>
	</li>
	<li>
		<input type="hidden" value="3" />
		<a href="javascript:skip_iframe('c/seecslist1.vs')"><ww:property  value="#session.local.a00240"/></a> <!-- 终端管理 -->
		<div class="two_menu">
		<div class="top_pic"></div>
			<a href="javascript:skip_iframe('c/seecslist1.vs')"><ww:property  value="#session.local.a00154"/></a>  <!-- 终端设置 -->
			<!--<a href="javascript:skip_iframe('seecg1list.vs')"><ww:property  value="#session.local.a00155"/></a>-->   <!-- 分组设置 -->
			<a href="javascript:skip_iframe('toclientcs.vs')"><ww:property value='#session.local.a00156' /></a><!-- 终端控制 -->
			<!--<a href="javascript:skip_iframe('toclientonoff.vs')"><ww:property value='#session.local.a00159' /></a>--><!-- 开关设置 -->
			<a href="javascript:skip_iframe('toclientclear.vs')"><ww:property value='#session.local.a00157' /></a><!-- 终端清理 --> 
<!--        <a href="terminal_manager.html">开关设置</a>-->
		</div>
	</li>

	<li>
		<input type="hidden" value="4" />
		<a href="javascript:skip_iframe('user.vs')"><ww:property  value="#session.local.a00010"/></a> <!-- 系统管理 -->
		<div class="two_menu">
		<div class="top_pic"></div>
		
		<a href="javascript:skip_iframe('user.vs')"><ww:property  value="#session.local.a00132"/></a>    <!-- 用户管理 -->
		
		<a href="javascript:skip_iframe('topowerlist.vs')"><ww:property  value="#session.local.a00161"/></a> <!-- 权限管理 -->
		
		<ww:if test="#session.sysset==1">
		   <a href="javascript:skip_iframe('tosyscsfbl.vs')"><ww:property  value="#session.local.a00528"/></a>  <!-- 系统参数 -->
		</ww:if>
		
		<a href="javascript:skip_iframe('countloglist.vs')"><ww:property  value="#session.local.a00529"/></a> <!-- 日志查看 -->
		
		<ww:if test="#session.version_onoff.editJdbcOnOff==1">
		
		    <a href="javascript:up_jdbc_password();"><ww:property value='#session.local.b00247'  /></a> <!-- 数据库连接 -->
		
		</ww:if>
		
		
		
		
		
		</div>
	</li>
	
	<ww:if test="#session.version_onoff.countShow==1">
	<li class="count">
		<input type="hidden" value="5" />
		<a href="javascript:skip_iframe('selscpc.vs?stype=4')"><ww:property  value="#session.local.a00113"/></a> <!-- 统计查看-->
		<div class="two_menu">
		<div class="top_pic"></div>
		
			<a href="javascript:skip_iframe('selscpc.vs?stype=4')"><ww:property value='#session.local.a00852' /></a> <!-- 播放统计 -->
			<a href="javascript:skip_iframe('zxtimeist.vs')"><ww:property value='#session.local.a00856' /></a> <!-- 在线时长 -->
			<ww:if test="#session.version_onoff.peopleCountShow==1">
			<a href="javascript:skip_iframe('toPeopleCountList.vs')"><ww:property value='#session.local.b00115' /></a> <!-- 人数统计 -->
			</ww:if>
		
			<ww:if test="#session.version_onoff.advertisingSpaceOnoff==1">
			   <a href="javascript:skip_iframe('advertisingPlayCount.vs')"><ww:property value='#session.local.b00295' /></a> <!-- 广告位统计 -->
			</ww:if>
			
		</div>
	</li>
	</ww:if>
	
	
    <li>
		<input type="hidden" value="6" />
		<a class="introjs-showElement introjs-relativePosition" id="help" href="javascript:skip_iframe('operatguide.vs')"><ww:property value='#session.local.a00845' /></a>
		<div class="two_menu">
		<div class="top_pic"></div>
		<a href="javascript:skip_iframe('operatguide.vs')"><ww:property value='#session.local.a00846' /></a>
		</div>
	</li>


	
	
	<ww:if test="#session.version_onoff.khshow==1">
		<li class="count"><a><ww:property value="#session.local.a00665"/></a> <!-- 客户管理-->
			<div class="two_menu">
				  <div class="top_pic"></div>
				  <ww:if test="#session.version_onoff.cutt==1">
				     <a href="javascript:skip_iframe('tocutlist.vs')"><ww:property  value="#session.local.a00668"/></a> <!-- 切纸管理 -->
				  </ww:if>
				  
				  <ww:if test="#session.version_onoff.queue==1">
				     <a href="javascript:skip_iframe('toqueuebig.vs')"><ww:property  value="#session.local.a00704"/></a> <!-- 排队叫号 -->
				  </ww:if>
				  
				  <ww:if test="#session.version_onoff.bus==1">
				     <a href="javascript:skip_iframe('tobus.vs')"><ww:property  value="#session.local.a00771"/></a> <!-- 公交巴士 -->
				  </ww:if>
				  
			</div>
		</li>
	</ww:if>
	
	<li style="margin-left: 50px;background:url(image/top_1.jpg) no-repeat scroll left center;">
		<input type="hidden" value="7" />
		<a href="#"  title="<ww:property  value='#session.urname'/>" style="font-size: 10px; margin-left: -5px;"> 
		   <ww:if test="#session.urname.length()>10">
		         <ww:property  value="#session.urname.substring(0,10)"/>...
		   </ww:if>
		   <ww:else>
		      <ww:property  value="#session.urname"/>
		   </ww:else>
		   <ww:if test="#session.version_onoff.cutt==1">
		      <span id="hzs" style="color: red;">(<ww:property value="hzc"/>)</span>
		   </ww:if>
		   <ww:if test="#session.version_onoff.warningitemOnOff==1">
		      <span id="twis" style="color: red;">(<ww:property value="wic"/>)</span>
		   </ww:if>
		   
		   <ww:if test="#session.version_onoff.clientLxOnOff==1">
		      <span id="lxOut" style="color: red;">(<ww:property value="lxOut"/>)</span>
		   </ww:if>
		   
		   
		   
		</a> <!-- 统计查看-->
		<div class="two_menu">
		<div class="top_pic"></div>
		   <ww:if test="#session.version_onoff.warningitemOnOff==1">
		        <a style="font-size: 10px; "  href="javascript:warning_item();">
		          
		           <ww:property value='#session.local.b00306' />
		           
		           <span id="wis" style="color:red;">(<ww:property value="wic"/>)</span></a>
		          
		       <!-- 预警提醒 -->
		   </ww:if> 
		    <a style="font-size: 10px; "  href="javascript:up_password();"><ww:property  value="#session.local.a00526"/></a><!-- 修改密码 -->
	        <a style="font-size: 10px; "  href="javascript:open_systeminfo();"><ww:property  value="#session.local.a00517"/></a>    <!-- 系统信息 -->
	        
	        <ww:if test="#session.version_onoff.cutt==1">
	          <a href="javascript:hz_client_show();">
	          <ww:property value="#session.local.a00680"/><!-- 换纸提醒 -->
	          <span id="hzs2" style="color:red;">(<ww:property value="hzc"/>)</span></a>    
	        </ww:if>
	        
	        
	         <ww:if test="#session.version_onoff.clientLxOnOff==1">
	          <a href="javascript:client_lx_client();">
	          <ww:property value="#session.local.b00327"/><!-- 离线三天提醒 -->
	          <span id="lxOut2" style="color:red;">(<ww:property value="lxOut"/>)</span></a>    
	        </ww:if>
	        
	        <a style="font-size: 10px; " href="out.vs"><ww:property  value="#session.local.a00013"/></a> <!-- 退出-->
		</div>
	</li>
	
	
<!--	<li class="count"><a href="javascript:skip_iframe('c/seecg1list_test.vs')">帮助</a>-->
<!--		<div class="two_menu">-->
<!--		<div class="top_pic"></div>-->
<!--		<a href="statistics_show.html">统计查看页面</a>-->
<!--		<a href="login.html">登录页面</a>-->
<!--		</div>-->
<!--	</li>-->
	</ul>
	</div>
	</div>
	</div>
</div>
<div  id="content" style="width:100%;" >
	
	<iframe id="c_iframe"  width="100%" height="100%" scrolling="no" frameborder="no" border="0"></iframe>
</div>
<div class="footer">

 
</div>
<div id="hide1" class="introjs-overlay" style="top: 0;bottom: 0; left: 0;right: 0;position: fixed;opacity: 0.6;display:none;"></div>
<div id="hide2" class="introjs-helperLayer " style="width: 44px; height:29px; top:23px;display:none;"></div>
<div id="hide3" class="introjs-tooltipReferenceLayer" style="width: 44px; height:29px; top:23px;display:none;">
	<div class="introjs-tooltip" style="left: 10px; top: 40px;">
		<div class="introjs-tooltiptext"><ww:property  value="#session.local.a00860"/>?</div>
		<div class="introjs-arrow top" style="display: inherit;"></div>
		<div class="introjs-tooltipbuttons">
			<a type="button" onclick="openGuide('1')" class="introjs-button introjs-prevbutton"><ww:property  value="#session.local.a00232"/></a>
			<a type="button" onclick="openGuide('0')" class="introjs-button introjs-nextbutton"><ww:property  value="#session.local.a00233"/></a>
		</div>
	</div>
</div>
</body>
</html>