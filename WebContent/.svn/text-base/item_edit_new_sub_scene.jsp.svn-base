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
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/icon.css"  />
<link rel="stylesheet" href="css/colpick.css" type="text/css"/>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<link href="css/ruler.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/edit/jquery-ui.css" />
<link rel="stylesheet" href="css/edit/proMake.css" />
<style type="text/css">

	body,html{
		width:100%;
		height:100%;
		margin:0px;
		padding:0px;
		border:0px;
		font-size:13px;
		font-family:Microsoft YaHei;
	    /*background-color:#134AFF;*/
	    overflow:hidden;
	}

	.editcss
	{
	        background: url(image/video.jpg);
			background-size:cover;
			filter : progid:DXImageTransform.Microsoft.AlphaImageLoader ( sizingMethod='scale' , src='images/video.jpg') ;
			background-size:100% 100%;
	}
	
   

</style>


<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/jq/jquery.min.js"></script>

<!--<script type="text/javascript" src="jquery-ui-1.9.2.custom/js/jquery-1.8.3.js"></script>-->
<!--<script type="text/javascript" src="jquery-ui-1.9.2.custom/js/jquery-ui-1.9.2.custom.js"></script>-->
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>


<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>



<script src="js/edit/jquery-1.9.1.js" type="text/javascript" ></script>
<script src="js/item.js"  type="text/javascript" ></script>
<script src="js/edit/script.js" type="text/javascript"></script>
<script src="js/edit/jquery-ui.js"  type="text/javascript"></script>
<script src="js/edit/jquery-ui.min.js"  type="text/javascript"></script>
<script src="js/edit/textEditor.js"  type="text/javascript" ></script>
<script type="text/javascript" src="js/cookie.js"></script>
<script src="js/colpick.js" type="text/javascript"></script>

  
<script type="text/javascript">

	//节目制作导引
	var a00309="<ww:property value='#session.local.a00309' />";
	var a00303="<ww:property value='#session.local.a00303' />";
	var a00304="<ww:property value='#session.local.a00304' />"; 
	var a00305="<ww:property value='#session.local.a00305' />";
	var a00306="<ww:property value='#session.local.a00306' />";
	var a00307="<ww:property value='#session.local.a00307' />";
	var a00308="<ww:property value='#session.local.a00308' />";
	var a00297="<ww:property value='#session.local.a00297' />";
	var a00298="<ww:property value='#session.local.a00298' />"; 
	var a00299="<ww:property value='#session.local.a00299' />";
	var a00494="<ww:property value='#session.local.a00494' />";
	var a00495="<ww:property value='#session.local.a00495' />";
	var a00106="<ww:property value='#session.local.a00106' />";
	var a00300="<ww:property value='#session.local.a00300' />";
	var a00301="<ww:property value='#session.local.a00301' />";
	var a00302="<ww:property value='#session.local.a00302' />";
	var a00093="<ww:property value='#session.local.a00093' />";
	var b00046="<ww:property value='#session.local.b00046' />";
	var a00732="<ww:property value='#session.local.a00732' />";
	var a00080="<ww:property value='#session.local.a00080' />";
    var a00041="<ww:property value='#session.local.a00041' />";
    var a00670="<ww:property value='#session.local.a00670' />";
    var b00277="<ww:property value='#session.local.b00277' />";
    var b00347="<ww:property value='#session.local.b00347' />";
    var rssOnOff="<ww:property value='#session.version_onoff.rssOnOff' />";

    var conditionalOnOff=0;
    
	var widget = [];
	var eflag = "new";
	var localObj;


	  //图片
    //$("#add_img").on("click",open_win_img);   

    //节目制作导引
 

    //帮助 导引
    var intro;
    

    //当前窗口行高
    var openh;

    
    
    //初始化
    $(function(){
     
    	var localJsonStr="<ww:property value='#session.localJson' />";

   	    localJsonStr=localJsonStr.replace(/&quot;/g,"'");
   	     	  
        localObj = eval( "(" + localJsonStr + ")" );//转换后的JSON对象
     				    
   	    //$("#tabs").tabs();
   	    $( ".menu_new" ).menu();  
   	  
   	    var openIntro = <%=request.getParameter("openIntro")%>;
       
        
	    if(openIntro == '1'){
		    
		    
		    
		    intro = introJs();  
		    openIntro = null;
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
						element: '#pm_right',  
						intro: "<ww:property value='#session.local.a00910' />",
					    position: "right"
					},
					{
						element: '#step2',  
						intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'><ww:property value='#session.local.a00060' /></span><ww:property value='#session.local.a00911' />",
						position: "bottom"
					},
					{
						element: '#step3',  
						intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00061' /></span><ww:property value='#session.local.a00911' />",
						position: "bottom"
					},
					{
						element: '#topfd1',
						intro: "<ww:property value='#session.local.a00912' /><span style='color:blue'> <ww:property value='#session.local.a00913' /></span><ww:property value='#session.local.a00914' />",
						position: "right"
					},
					{
						element: '#step4',  
						intro: "<ww:property value='#session.local.a00915' /><span style='color:blue'> <ww:property value='#session.local.a00916' /></span>",
						position: "top"
					},
					{
						element: '#step5',  
						intro: "<ww:property value='#session.local.a00917' /><ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00027' /></span>,<ww:property value='#session.local.a00918' />",
						position: "top"
					}
				]  
		   }).start();  

		   intro.oncomplete(function() {
			   intro.exit();
			  
	       });
		
		   intro.onexit(function() {

			
			    $("#openIntro").val(0);
			      
			    layer.msg("<ww:property value='#session.local.a00864' />");
			//openIntro = 2;
			//$("#step2 a").attr("href","javascript:open_win_video();"); 
		    });
	   }

	 
	   //启动浏览器自适应
	   //autoHeight();
     
  
   		   
    });



    //跳转弹出副屏节目
    function open_sub_screen(){

        //var showurl="toNewScene.vs?item.name="+rv1+"&item.fblid="+rv2+"&token="+originalArray[0]+"&itemViceType="+itemViceType+"&screenType="+screenType;
	    layer.open({
		      
			  type: 2,
	          area: ['900px', 525+'px'],
	          offset: '40px',
	          title:false,
	          fix:false, //不固定
	          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	          content: "toNewScene.vs?item.name=1&item.fblid=1&screenType=1",
	          scrollbar: false,
	          end: function(){ 
		        
					
			  }
		});
		

    }

   
</script>
</head>
<body>
<script type="text/javascript"> 
    document.body.onselectstart=document.body.oncontextmenu=function(){ return false;} 
</script> 

<form  name="form1" method="post" >
<!--头部-->
<!--<div class="footer">-->
<!--   -->
<!--</div>-->

<div  id="content" style="width:100%;">
	<div class="c_middle pm_middle">
 
		<!--左边菜单-->
		<div    class="pm_right" id="pm_right" style="float: left;border:5px solid #e5e5e5;width: 80px;">
			<div  style="background-color:#EEEEEE;" id="c_right_id" >
				<div class="pr_container"   >
	                <!--功能菜单-->
					<ul class="menu_new"     style="padding-left:0px;margin-left:0px; float: none;background-color: rgb(238, 238, 238);border: 0px;">
					  
					</ul>
	             
	                      
		         
				</div>
			  </div>
		  </div>
		  
		  <div class="pm_mid" style="margin: 0% 0% 0% 0%">
		    
		       <!--制作区-->
		        <div class="blank_box "  id="blank_box_id" style="margin:-1px 0px 0px -10px;overflow: hidden; ">
                    
                     <div class="content-main grid"   style="border: 0px;background: white; background-image: url('images/bg.png');background-position:18px 18px;">
						 
						 <div  id="content-main-edit" class="content-main-edit" style="margin: 19px 0px 0px 19px; overflow: hidden;">
						     <div id="topfd1" class="content-center" style="background-color:#CFDBE5;opacity:0.8;position: relative;">
								
						     </div>
						 </div>
						
						 <div id="hRule" class="hRule"   ></div>
	                     <div id="vRule" class="vRule" style="height: 100%"></div>       
	                   	                 	
					</div>
					
		        </div>
		        
		        
		        
		       <!--制作区下方菜单-->
		        <div class="pm_mid_footer" style="margin-left:2%;margin-top: 0px;">
		        		
		            <div>
		            
                        <button style="margin-left: -50px;margin-top:-3px;display: none;" class="btn  btn-primary" onclick="change_scene_size(1)" type="button"><i class="icon icon-plus-sign"></i></button> 
                       
                        <div> 
                           <input type="text" disabled="disabled"  value="" id="sfv" style="border:0; color:#f6931f; font-weight:bold;width: 40px;margin-top:0px;text-align: center;display: none;" /> <!-- 百分比显示 -->
                        </div>
                        
                        <button style="margin-left:50px;margin-top:-3px;display:none;" class="btn btn-primary" onclick="change_scene_size(2)" type="button"><i class="icon icon-minus-sign"></i></button> 
		         
		            </div>
		            				
		            <!-- 当前分辨率 -->
					<div style="float: left;margin-top: 0px;display: none;">
					     <ww:property value='#session.local.a00251' /> : 
					     <input  id="itemfbl" type="text" value="<ww:property value='#request.twidth'/>*<ww:property value='#request.theight'/>" style="width:100px;color:#626262;" disabled="disabled"/>
					     <!-- <select><option>1024*768</option></select> -->
					</div>
					 <!-- 节目名 --> 
					<div style="float: left;margin-top: 0px;display: none;">
					     <ww:property value='#session.local.a00255' /> : <input id="itemname" type="text" name='itemname' value="<ww:property value='#request.item.name' />" style="width:100px;color:#626262;"/>
					</div>
					<!-- 节目时长 -->
					<div style="float: left;margin-top:0px;display: none;">
					     <ww:property value='#session.local.a00252' /> : <input type="text" id="stime" name="stime"  <ww:if test='#request.item.stime==0'>value="30"</ww:if><ww:else>value="<ww:property value='#request.item.stime' />"</ww:else>  style="width:60px;color:#626262;"/><ww:property value='#session.local.a00106' />
					     &nbsp;&nbsp;&nbsp;   
					     <span> <ww:property value='#session.local.b00082' />:</span>        

					</div>
					
                    <!-- 智能播放 -->
					<div style="float: left;margin-top: 0px;margin-left:-5px;display: none;" title="<ww:property value='#session.local.b00194' />">  
					     <input onclick="smartPlayOnclickNew()" style="margin: 0px;" type="checkbox"  value="-1"  id="smartPlay"  name="smartPlay"/>
					</div>

					<!-- 预览 -->
				    <button id="step4" style="margin-top:-5px;margin-left: 100px;display: none;" class="btn  btn-primary" onclick="save_item(0)" type="button"><ww:property value='#session.local.a00253' /></button> 
					
					<!-- 保存 -->
					<button id="step5"   style="margin-top:-5px;margin-left: 500px;" class="btn  btn-primary" onclick="save_item(1)" type="button"><ww:property value='#session.local.a00254' /></button>
					
				

		           
		          </div>
		     </div>
		     
		     
		     <div class="pm_right" id="pm_right_set" style="width: 270px;margin-right: 30px;">
		     
		          <div id="pm_right_pro"  style="display: none;">
		          
		              <ul class="pm_right_content" id="pm_right_content_id" style="padding-left: 0px;background-color: rgb(238, 238, 238);">
			               <li >
                             <a>
                               <!--<ww:property value='#session.local.a00133' />:&nbsp;&nbsp;-->
                                ID
                                :&nbsp;&nbsp;
                                <span id="lname" ></span>
                                <input type="hidden"  id="currentdivid"/>
                             </a>
                           </li><!-- 名称 -->
			               <li ><a><ww:property value='#session.local.a00035' />:&nbsp;&nbsp;<span id="ltype" ></span></a></li><!-- 类型 --> 
			               
			              <li style="height: 35px;padding:5px 0px 0px 10px;">
			                   <input type='checkbox' checked="checked" class='menu-Sorption' id='Sorption' /><ww:property value="#session.local.b00165" /><br><!-- 自动吸附 -->
			              </li>
			              
			                 
			    		   <li>
						        <a>
						            x&nbsp;&nbsp;<input class="number-label"   id="lleft" type="text" style="width: 40px;height: 18px;margin-left: 2px;line-height: 18px;line-height: 18px;" value="0"    onafterpaste="this.value=this.value.replace(/\D/g,'')" />px&nbsp;
						            y&nbsp;&nbsp;<input class="number-label"   id="ltop" type="text" style="width: 40px;height: 18px;margin-left: 2px;line-height: 18px;line-height: 18px;" value="0"     onafterpaste="this.value=this.value.replace(/\D/g,'')"/>px
						        </a>
						   </li>
			               <li>
			                  <a>
			                    <!-- 宽 --><ww:property value='#session.local.a00032' />&nbsp;<input class="number-label"  type="text" id="lwidth" style="width: 40px;height: 18px;line-height: 18px;line-height: 18px;" value="0"    onafterpaste="this.value=this.value.replace(/\D/g,'')" />px&nbsp;
			                    <!-- 高 --><ww:property value='#session.local.a00033' />&nbsp;<input class="number-label"  type="text" id="lheight" style="width: 40px;height: 18px;line-height: 18px;line-height: 18px;" value="0"   onafterpaste="this.value=this.value.replace(/\D/g,'')" />px&nbsp;
			                  </a>
			               </li>
			               
<!--			     <li >-->
<!--			          <a style="font-size: 13px;"><ww:property value="#session.local.a00775"/></a> -->
<!--					  <input type="checkbox"   value="1"  id="gridAdsorption"/>-->
<!--					  <input style="line-height: 34px;display:none;" type="checkbox" id="validityCheck" name="validityCheck"  value="1" />-->
<!--			     </li>-->
			      
			     
						    <li style="display: none;"><a><ww:property value="#session.local.a00448"/>:&nbsp;&nbsp;<span id="bgname"></span></a></li><!-- 背景图 -->
						    <li style="display: none;" ><a><ww:property value="#session.local.a00449"/>:&nbsp;&nbsp;</a></li><!--背景音乐 -->
						    <li style="display: none;" style="border-bottom:5px solid #e5e5e5;" ><a><span id="bgaudio"></span></a></li>
			     
			    
			    
		
			
			          </ul>  
			          
			          
		          </div>
		          
		          <div id="pm_right_pub" >
		              <ul class="pm_right_content" id="pm_right_content_id" style="padding-left: 0px;background-color: rgb(238, 238, 238);">
		                
		                  <li style="height: 35px;padding:5px 0px 0px 10px;cursor: pointer;display: none;" id="bg_color_set"  title="<ww:property value='#session.local.a00449'/>" >
			                
			              </li>
		                  <!-- 
		                     <span style="display: block;float: left;" ><ww:property value="#session.local.a00358" />:</span>
			                 <span style="float: left;"  class="bgm_show_span" id="bgm_show"></span>
			              -->
			                   
		                  <li style="height: 35px;padding:5px 0px 0px 10px;cursor: pointer;display: none;" id="bgm_bn" title="<ww:property value='#session.local.a00449'/>" >
			                   <span style="display: block;float: left;" ><i class="icon icon-music"></i>:</span>
			                   <span style="float: left;"  class="bgm_show_span" id="bgm_show"></span>
			              </li>
			              
		                 <li style="height: 35px;padding:6px 0px 0px 10px;">
<!--		                    <button id="for_align_left"  class="btn  btn-primary btn-mini"  type="button"><ww:property value="#session.local.a00363" /></button> 左对齐 -->
		                    <img id="for_align_left" class="button_hover" style="cursor: pointer;" src="image/item/align_left.png" width="20" height="20" title="<ww:property value="#session.local.a00363" />" />
		                    &nbsp;&nbsp;
<!--							<button id="for_align_right" class="btn  btn-primary btn-mini"  type="button"><ww:property value="#session.local.a00365" /></button> 右对齐 -->
							<img id="for_align_right" class="button_hover" style="cursor: pointer;" src="image/item/align_right.png" width="20" height="20" title="<ww:property value="#session.local.a00365" />" />
							&nbsp;&nbsp;
<!--							<button id="for_align_top" class="btn  btn-primary btn-mini"  type="button"><ww:property value="#session.local.b00163" /></button> 上对齐 -->
							<img id="for_align_top" class="button_hover"  style="cursor: pointer;" src="image/item/align_top.png" width="20" height="20" title="<ww:property value="#session.local.b00163" />" />
							&nbsp;&nbsp;
<!--							<button id="for_align_bottom" class="btn  btn-primary  btn-mini"  type="button"><ww:property value="#session.local.b00164" /></button> 下对齐 -->
							<img id="for_align_bottom" class="button_hover" style="cursor: pointer;" src="image/item/align_bottom.png" width="20" height="20" title="<ww:property value="#session.local.b00164" />" />
							&nbsp;&nbsp; <!-- 水平 -->
						   <img id="for_align_level" class="button_hover"  style="cursor: pointer;" src="image/item/align_level.png" width="20" height="20" title="<ww:property value="#session.local.b00189" />" />
							&nbsp;&nbsp; <!-- 垂直 -->
							 <img id="for_align_vertical" class="button_hover"  style="cursor: pointer;" src="image/item/align_vertical.png" width="20" height="20" title="<ww:property value="#session.local.b00190" />" /> 
		                 </li>
		                 
		                 <li style="padding:5px 0px 5px 10px;">
		                  
		                    
<!--		                    <button id="for_align_width" class="btn  btn-primary  btn-primary btn-mini"  type="button"><ww:property value="#session.local.b00166" /></button>-->
		                    
		                    <!-- 同宽 -->
		                    <input type="radio" name="radiowidth" value="0" checked><ww:property value="#session.local.b00168" />   <!-- 最小 -->
		                    <input type="radio" name="radiowidth" value="1"><ww:property value="#session.local.b00169" /> <!-- 最大 -->
		                    <img id="for_align_width" class="button_hover" style="cursor: pointer;" src="image/item/align_width.png" width="20" height="20" title="<ww:property value="#session.local.b00166" />" />
		                    <br>
<!--					    <button id="for_align_height" class="btn  btn-primary  btn-primary btn-mini"  type="button"><ww:property value="#session.local.b00167" /></button> -->
							
							<!-- 同高 -->
							<input type="radio" name="radioheight" value="0" checked><ww:property value="#session.local.b00168" /> <!--最小 -->
							<input type="radio" name="radioheight" value="1"><ww:property value="#session.local.b00169" />    <!--最大 -->
							<img id="for_align_height" class="button_hover" style="cursor: pointer;" src="image/item/align_height.png" width="20" height="20" title="<ww:property value="#session.local.b00167" />" />
	          
		                 </li>
		                 
		                 <li style="padding:5px 0px 5px 10px;">
		                    <button id="for_dom_check" class="btn  btn-primary  btn-primary btn-mini"  type="button"><ww:property value="#session.local.a00019" /></button><!-- 全选 -->
		                    
		                    <button id="for_dom_orcheck" class="btn  btn-primary  btn-primary btn-mini"  type="button"><ww:property value="#session.local.a00951" /></button><!-- 反选 -->
		                     
		                    <button id="for_dom_nocheck" class="btn  btn-primary  btn-primary btn-mini"  type="button"><ww:property value="#session.local.b00170" /></button><!-- 全不选 -->
		                     
		                   
		                 </li>
		                 
		                 <li style="padding:5px 0px 5px 5px;">
		                    <fieldset style="width: 250px;padding:0 0 0 5px;">
							   <legend style="background-color:#eeeeee;border:1px solid #eeeeee;font-size:12px;padding: 0px;width: auto;">
							       <ww:property value="#session.local.b00178"/><!-- 元素列表 -->
							   </legend>
						       <div id="elementList" style="display: block;overflow: auto;margin-top:-20px;">
							</fieldset>
		                                                      
		                    
                            </div>
		                 </li>
		                 
		              </ul>
		            
		          </div>
		         
		     </div>
	    </div>
     </div>
     
	 <input type="hidden" name="mfile" id="mfile" value="<ww:property value='#session.scene.filename'/>" />  <!-- 节目文件包名 -->
	
	 <input type="hidden" id="seecontent"	name="seecontent" />   <!-- 预览生成 html页面 --> 
	
	 <input type="hidden" id="gcontent" name="gcontent" />   <!-- x86 生成 html页面 暂不用-->
	
	 <input type="hidden" id="content" name="content"  />     <!-- 安卓 生成html页面 暂不用 -->
	
	 <input type="hidden" id="fcontent" name="fcontent" />  <!-- 节目所有关联文件名 -->
	
	 <input type="hidden" id="mcontent" name="mcontent"  value="<ww:property value='#session.subscene.mcontent' />"/>  <!-- html网页内容 -->
	
	 <input type="hidden" id="sf" name="sf"  value="<ww:property value='#session.subscene.sf' />" />    <!-- 缩放比 -->
	
	 <input type="hidden" id="citykey" name="citykey"/>      <!-- 天气 -->
	   
	 <input type="hidden" id="text" name="text" />  <!-- 文本 -->
	
	 <input type="hidden" id="rsskey" name="rsskey"/> <!-- rss数据源  -->
	
	 <input type="hidden" id="ip" value="<ww:property value='#session.ip' />"/>   <!-- 服务器ip地址 -->
	
	 <input type="hidden" id="timeTxt" name="timeTxt"/>    <!-- 时间 -->  
	
	 <input type="hidden" id="av" name="av"/>             <!-- av数据源 -->
	
	 <input type="hidden" id="ssshow" name="ssshow"/>      <!-- 实时显示 -->
	
	 <input type="hidden" id="streamurl" name="streamurl"/>  <!-- 流媒体 -->
	
	 <input type="hidden" id="gncj" name="gncj"/>     <!-- 功能插件 -->
	
	 <input type="hidden" id="bginfo" name="bginfo"/>   <!--背景  -->
	
	 <input type="hidden" id="lcsh" name="lcsh"/>     <!-- 楼层 -->
	
	 <input type="hidden" id="html" name="html"/>  <!-- 网页 -->
	
	 <input type="hidden" id="jptxt" name="jptxt"/>           <!-- 截屏 -->
	
	 <input type="hidden" id="appstrs" name="appstrs"/>       <!-- app跳转 -->
	
	 <input type="hidden" id="code2" name="code2"/>            <!-- 二维码 -->
	
	 <input type="hidden" id="netcamera" name="netcamera"/>    <!-- 网络摄像头 -->  
	
	 <input type="hidden" id="queue_many" name="queue_many"/>      <!-- 排队叫号 大屏 -->
	
	 <input type="hidden" id="queue_single" name="queue_single"/>  <!-- 排队叫号 小屏 -->
	
	 <input type="hidden" id="bus_data" name="bus_data"/>     <!-- 公交站 -->
	
	 <input type="hidden" id="jsonImgs" name="jsonImgs"/>  <!-- 图片集合 -->
	
	 <input type="hidden" id="jsonVideos" name="jsonVideos"/>  <!-- 视频集合 -->
	
	 <input type="hidden" id="jsonDlls" name="jsonDlls"/>   <!-- 插件集合 -->
	
	 <input type="hidden" id="layerBigDataParameter"/>  <!-- 弹出框编辑大数据传输 -->
							
	 <input type="hidden" id="jsonSource" name="jsonSource"/>		<!-- 数据源集合 -->				
	
	 <input type="hidden" id="jsonDllItem" name="jsonDllItem"/>		<!-- 控件节目集合 -->
	 
	 <input type="hidden" id="jsonImgsGroup" name="jsonImgsGroup"/>		<!-- 相册 -->
	 
	 <input type="hidden" id="tx" name="tx"  value="<ww:property value='#session.subscene.tx'/>" />   <!--x 分辨率 -->
	 
	 <input type="hidden" id="ty" name="ty"  value="<ww:property value='#session.subscene.ty'/>"  />   <!--y 分辨率 -->
	 			
	 <input type="hidden" id="editStime" name="editStime"  value="<ww:property value='#request.item.stime' />" />
	 
	 <input type="hidden" id="itemType" name="itemType" value="<ww:property value='itemType'  />"/>  		
     
     <input type="hidden" id="localJson"  value="<ww:property value='#session.localJson' />"/>  		
    
     <input type="hidden" id="openIntro"  value="<ww:property value='openIntro' />"/>
     
     <input type="hidden" id="jsonImgsFlip" name="jsonImgsFlip"/>		<!-- 翻书图片 -->
     
     <input type="hidden" id="itemViceType" name="itemViceType" value="<ww:property value='itemViceType' />" />
     
     <input type="hidden" id="screenType" name="screenType" value="<ww:property value='screenType' />" />
     
     <input type="hidden" id="screenTypeHtml" name="screenTypeHtml" value="1" />
     
     <input type="hidden" id="layerBigDataParameterMap"/>  <!-- 文本框传值json -->
     
      <input type="hidden" id="upFblSave"    name="upFblSave" value="0"/> <!-- 修改分辨率保存的节目 -->
      
       <input type="hidden" id="upFblId"    name="upFblId" value="0"/> <!-- 需要修改的分辨率 -->
     
    
     

     
    
   </form>
<!--   <div class="footer" style="background-image:url('');"> -->
<!--   </div>-->
  </body>
</html>
