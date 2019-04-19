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
	
    a:hover {border: 0px;}  a:visited {border: 0px;} a:link {border: 0px;}  

</style>


<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/jq/jquery.min.js"></script>

<script type="text/javascript" src="jquery-ui-1.9.2.custom/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="jquery-ui-1.9.2.custom/js/jquery-ui-1.9.2.custom.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>


<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>


<!--<script src="js/edit/jquery-1.9.1.js" type="text/javascript" ></script>-->
<script src="js/item.js"  type="text/javascript" ></script>
<script src="js/edit/script.js" type="text/javascript"></script>
<script src="js/edit/jquery-ui.js"  type="text/javascript"></script>
<script src="js/edit/jquery-ui.min.js"  type="text/javascript"></script>
<script src="js/edit/textEditor.js"  type="text/javascript" ></script>
<script type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript" src="js/util.js"></script>


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
	var flag = false;
	var openIntro;
	

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
        $(".menu_new").menu();  

		
     	var openIntro = <%=request.getParameter("openIntro")%>;
 	    if(openIntro == '1'){
 	 	    
 		     flag = true;
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
			 				intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00060' /></span><ww:property value='#session.local.a00911' />"
			 			},
			 			
			 			{
			 				element: '#step3',  
			 				intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00061' /></span><ww:property value='#session.local.a00911' />"
			 			},
			 			{
			 				element: '#topfd1',
			 				intro: "<ww:property value='#session.local.a00925' /><span style='color:blue'> <ww:property value='#session.local.a00913' /></span><ww:property value='#session.local.a00926' />",
			 				position: "right"
			 			},
			 			{
			 				element: '#step31',
			 				intro: "<ww:property value='#session.local.a00927' />,<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00652' /></span><ww:property value='#session.local.a00887' />",
			 				position: "left"
			 			},
			 			{
			 				element: '#step4',  
			 				intro: "<ww:property value='#session.local.a00928' />",
			 				position: "top"
			 			},
			 			{
			 				element: '#step5',  
			 				intro: "<ww:property value='#session.local.a00917' /><span style='color:blue'> <ww:property value='#session.local.a00874' /></span><ww:property value='#session.local.a00929' />",
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
		 			
		 			flag = false;
		 			
		 		});
 	    }

	 
	   //启动浏览器自适应
	   //autoHeight();

 	   $("#tabs").tabs();
   		   
    });


    //修改节目分辨率
    function up_item_fbl(id){

    	layer.confirm("<ww:property value='#session.local.b00372' />", {icon: 3, title:"<ww:property value='#session.local.a00093' />"}, function(index){

    		$("#upFblSave").val(1);

        	$("#upFblId").val(id);

        	//保存节目跳转
        	save_item(1);
   	   
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
		<div class="pm_right" id="pm_right" style="float: left;border:5px solid #e5e5e5;width: 80px;">
		<div style="background-color:#EEEEEE;" id="c_right_id" >
			<div class="pr_container"   >
			
                <!--功能菜单-->
				<ul class="menu_new" style="padding-left:0px;margin-left:0px; float: none;background-color: rgb(238, 238, 238);border: 0px;">
				  
				</ul>
             
			</div>
		  </div>
		  </div>
		  
		  <div class="pm_mid" style="margin: 0% 0% 0% 0%">
		    
		       <!--制作区-->
		        <div class="blank_box "  id="blank_box_id" style="margin:-1px 0px 0px -10px;overflow: hidden; ">
                    
                     <div class="content-main grid"   style="border: 0px;background: white; background-image: url('images/bg.png');background-position:18px 18px;">
                     
						 <div  id="content-main-edit" class="content-main-edit" style="margin: 19px 0px 0px 19px; overflow: hidden;">
						     <!-- #CFDBE5 -->
						     <div id="topfd1" class="content-center" style="background-color:#FFFFFF;opacity:0.8;position: relative;">
								   
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
                        
                        <button style="margin-left:50px;margin-top:-3px;display: none;" class="btn  btn-primary" onclick="change_scene_size(2)" type="button"><i class="icon icon-minus-sign"></i></button> 
		         
		            </div>
		            				
		            <!-- 当前分辨率 -->
					<div style="float: left;margin-top: 0px;">
					
					     <ww:property value='#session.local.a00251' /> : 
					     
					     <input  id="itemfbl" type="text" value="<ww:property value='#request.twidth'/>*<ww:property value='#request.theight'/>" style="width:100px;color:#626262;display: none;" disabled="disabled" />
					     
					     
					     <select onchange="up_item_fbl(this.value)">
					        <ww:iterator value="fbls">
					             <option  <ww:if test="#session.scene.fblId==id"> selected="selected"  </ww:if> value="<ww:property value='id'  />"><ww:property value="name" /></option>
					        </ww:iterator>
					     </select> 
					     
					     <!-- <select><option>1024*768</option></select> -->
					</div>
					
					<!-- 节目名 --> 
					<div style="float: left;margin-top: 0px;">
					
					     <ww:property value='#session.local.a00255' /> : <input id="itemname" type="text" name='itemname' value="<ww:property value='#session.interactitem.name' />" style="width:100px;color:#626262;"/>
					
					</div>
					
					<!-- 场景名 -->
					<div style="display: none;">
					  
					     <ww:property value='#session.local.a00435' /> : <input type="text" id="name" name="name"   style="width:60px;color:#626262;" value="<ww:property value='#session.scene.name' />" />
					
					</div>
					
					<!-- 节目时长 -->
					<div style="float: left;margin-top: 0px;display: none;">
					
					     <ww:property value='#session.local.a00252' /> : <input type="text" id="stime" name="stime"  <ww:if test='#request.item.stime==0'>value="30"</ww:if><ww:else>value="<ww:property value='#request.item.stime' />"</ww:else>  style="width:60px;color:#626262;"/><ww:property value='#session.local.a00106' />
					     &nbsp;&nbsp;&nbsp;<ww:property value='#session.local.b00082' />:
					</div>
					
					<!-- 热区域 -->
				    <button style="margin-top:-5px;" class="btn btn-primary"   id="buttonArea"   type="button"><ww:property value='#session.local.b00047' /></button>
				    
					<!-- 预览 -->
				    <button id="step4" style="margin-top:-5px;" class="btn  btn-primary" onclick="save_item(0)" type="button"><ww:property value='#session.local.a00253' /></button> 
					<!-- 保存 -->
					<button id="step5"   style="margin-top:-5px;" class="btn  btn-primary" onclick="save_item(1)" type="button"><ww:property value='#session.local.a00254' /></button>
					
					
					<ww:if test="itemViceType==1">					
					<!-- 副屏节目 -->
					<button    style="margin-top:-5px;" class="btn  btn-warning" onclick="open_sub_screen(2)" type="button"><ww:property value='#session.local.b00355' /></button>
					
					</ww:if>
					
					<!-- 返回 -->				
					<button   style="margin-top:-5px;" class="btn  btn-primary" onclick="a_win_local('returnmain.vs?show_menu=2')" type="button"><ww:property value='#session.local.a00013' /></button>
		        
		            <button   style="margin-top:-5px;float: right;" class="btn  btn-primary" onclick="itemFastHelp()" type="button" title="<ww:property value='#session.local.a00845'/>" ><i class="icon icon-question"></i></button>
		            
		          </div>
		     </div>
		     
		     
		     <div class="pm_right" id="pm_right_set" style="width: 270px;">
		     
		          <div id="pm_right_pro"  style="display: none;">
		          
		              <ul class="pm_right_content" id="pm_right_content_id" style="padding-left: 0px;background-color: rgb(238, 238, 238);">
			               <li >
                             <a>
                               <!--<ww:property value='#session.local.a00133' />:&nbsp;&nbsp;-->
                                ID
                                :&nbsp;&nbsp;
                               <span id="lname" class="zhegequyumingshi"></span>
                               <input type="hidden"  id="currentdivid"/>
                             </a>
                           </li><!-- 名称 -->
			               <li ><a><ww:property value='#session.local.a00035' />:&nbsp;&nbsp;<span id="ltype" ></span></a></li><!-- 类型 -->
			               
			               <li style="height: 35px;padding:5px 0px 0px 10px;">
			               
			                   <input type='checkbox' class='menu-Sorption' id='Sorption' /><ww:property value="#session.local.b00165" /><br><!-- 自动吸附 -->
			               
			               </li>
			              
			    		   <li>
						        <a>
						            x&nbsp;&nbsp;<input class="number-label"   id="lleft" type="text" style="width: 40px;height: 18px;margin-left: 2px;line-height: 18px;line-height: 18px;" value="0"    onafterpaste="this.value=this.value.replace(/\D/g,'')" />px&nbsp;
						            y&nbsp;&nbsp;<input class="number-label"   id="ltop"  type="text" style="width: 40px;height: 18px;margin-left: 2px;line-height: 18px;line-height: 18px;" value="0"     onafterpaste="this.value=this.value.replace(/\D/g,'')"/>px
						        </a>
						   </li>
						   
			               <li>
			                  <a>
			                    <!-- 宽 --><ww:property value='#session.local.a00032' />&nbsp;<input class="number-label"  type="text" id="lwidth" style="width: 40px;height: 18px;line-height: 18px;line-height: 18px;" value="0"    onafterpaste="this.value=this.value.replace(/\D/g,'')" />px&nbsp;
			                    <!-- 高 --><ww:property value='#session.local.a00033' />&nbsp;<input class="number-label"  type="text" id="lheight" style="width: 40px;height: 18px;line-height: 18px;line-height: 18px;" value="0"   onafterpaste="this.value=this.value.replace(/\D/g,'')" />px&nbsp;
			                  </a>
			               </li>
			               <li>
			               		<a>
			               			<!-- 设置已播未播显示素材数 -->
			               			<ww:property value='#session.local.d00011' />&nbsp;
			               			<input class="number-label"  type="text" id="ycCount" style="width: 40px;height: 18px;line-height: 18px;line-height: 18px;" value="0"    onafterpaste="this.value=this.value.replace(/\D/g,'')" />个元素&nbsp;
			               		</a>
			               </li>
			                     <ww:if test="#session.version_onoff.cllComponentOnOff==1">
			              
				              <li style="height: 35px;padding:5px 0px 0px 10px;">
				                   <input type='checkbox' checked="checked" class='' onChange="2"  id='elementHide' /><ww:property value="#session.local.b00362" /><br/><!-- 控件隐藏 -->
				              </li>
			              </ww:if>
			            
			               
			               <li>
			               
		
			                        <script>
			                     
			                        </script>
			                 
			                  
			                        <div  id="tabs"  style="border: 0px;overflow: auto;">
								 
					                         
					                         
					                         <!-- <div title="<ww:property value="#session.local.a00625"  />" data-options="" style="height: 180px;">
												  
												         <ul>
												          
													           <ww:iterator value="scenes">
																     <li <ww:if test="filename==#session.scene.filename"> style="background-color:#007CCC;" </ww:if>><a href="javascript:save(1,'sel','<ww:property value='filename' />');"><ww:property value="name" /></a></li>
															   </ww:iterator>
														   
												         </ul>
												        
												    		
										     </div> -->
					                           <div id="step31">
										          <table id="dg"  title="<ww:property value='#session.local.a00729'  />"   class="easyui-datagrid" style="width:266px;border: 0px;overflow: auto;"
													data-options="
														singleSelect: true,
														toolbar: '#tb',
														method: 'get',
														onClickCell: onClickCell,
														border: false,
														nowrap:true	
													">
													<thead>
										                    <tr>
																<th data-options="field:'tTargetId',width:80"><ww:property value='#session.local.a00751'/></th><!-- 目标 -->
																<th data-options="field:'tTypeText',width:80,formatter:formatTitle"><ww:property value='#session.local.a00752'/></th><!-- 详情 -->
																<th data-options="field:'tTouchReturnTime',width:90" ><ww:property value='#session.local.a00758'/></th><!-- 触摸返回(秒) -->
																<th data-options="field:'tTouchKey',hidden:true"></th>
											        	    </tr>
									                 </thead>
												  </table>
												</div>  	           
										          <div id="tb" style="height:auto" >
														<a href="javascript:void(0)" style="height: 25px;padding-left: 0px;width: 40px;" class="easyui-linkbutton"  onclick="touch_edit(1)"><ww:property value="#session.local.a00652"  /></a><!-- 添加 -->
														<a href="javascript:void(0)" style="height: 25px;padding-left: 0px;" class="easyui-linkbutton"  onclick="touch_edit(2)"><ww:property value="#session.local.a00024"  /></a><!-- 编辑 -->
														<a href="javascript:void(0)" style="height: 25px;padding-left: 0px;" class="easyui-linkbutton"  onclick="removeit()"><ww:property value="#session.local.a00025"  /></a><!-- 删除 -->
														<a href="javascript:void(0)" style="height: 25px;padding-left: 0px;"  class="easyui-linkbutton"  onclick="setTouchReturnTime()">
			                                                 <ww:property value='#session.local.b00174'  />
			                                            </a><!-- 设置触摸返回 -->
													   								
												  </div>
								             
								                 <!-- 弹出框  播放时长(秒)-->
											    <div id="win-time" class="easyui-window"  closed="true" title="<ww:property value='#session.local.a00747' />" style="width:260px;height:120px;"  data-options="left:'510px',top:'160px',collapsible:false,
													minimizable:false,
													maximizable:false" >
													<div style="padding:20px 20px 10px 30px;">
														<p><input class="easyui-numberbox"  data-options="required:true" missingMessage="<ww:property value='#session.local.a00671'/>"    id="qieAll" type="text"  style="float: left;width: 150px;" /><a style="float: right;" href="javascript:setPlayTimeImgSubmit();" class="easyui-linkbutton"><ww:property value="#session.local.a00080"/></a></p>
													</div>  
											    </div>
    
								       
								               <script type="text/javascript">

								                 //设置触摸返回时间(秒)
								        	     function setTouchReturnTime(){


								        	    	   if(editIndex==undefined){

								        	        	   layer.msg("<ww:property value='#session.local.b00173'  />");
									        	           return;

									        	        }
								        	    	    layer.prompt({title: '<ww:property value='#session.local.b00174'  />'},function(val, index){

								        	    	    	  if(checkValNumber(val)){
								        	    	    		  $('#dg').datagrid('updateRow',{
									        	    	 		        index: editIndex,
									        	    	 		        row: {
									        	    	 		            'tTouchReturnTime':val
									        	    	 		        }
									        	    	 		  });
								        	    	    		  accptClickValue();	
										        	    		  layer.close(index);
									        	    	      }else{
									        	    	    	  layer.msg("<ww:property value='#session.local.a00671' />");
									        	    	    	  setTouchReturnTime();
										        	    	  }
									        	    		 
								        	    		});
								                 } 

										          $.extend($.fn.datagrid.methods, {
											  			editCell: function(jq,param){
											  				return jq.each(function(){
											  					var opts = $(this).datagrid('options');
											  					var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
											  					for(var i=0; i<fields.length; i++){
											  						var col = $(this).datagrid('getColumnOption', fields[i]);
											  						col.editor1 = col.editor;
											  						if (fields[i] != param.field){
											  							col.editor = null;
											  						}
											  					}
											  					$(this).datagrid('beginEdit', param.index);
											  					for(var i=0; i<fields.length; i++){
											  						var col = $(this).datagrid('getColumnOption', fields[i]);
											  						col.editor = col.editor1;
											  					}
											  				});
											  			}
											  		});

			          
			                                        var editIndex = undefined;
		
									                function endEditing(){
										                
									                	if (editIndex == undefined){return true;}
									                	
									        			if ($('#dg').datagrid('validateRow', editIndex)){
						
									        				$('#dg').datagrid('endEdit', editIndex);

									        				editIndex = undefined;

									        				return true;
									        				
									        			} else {
										        			
									        				return false;

										        		}
									        		}


			        		
													function onClickCell(index, field){
													
														if (endEditing()){
															
															$('#dg').datagrid('selectRow', index)
																	.datagrid('editCell', {index:index,field:field});
															
															editIndex = index;
						
						                                    var row = $('#dg').datagrid('getSelected');

									        				if (row){
						
									        					$("input[name = checkdom]:checkbox").each(function(){		
										        						
									        			    		if ($("input[eId="+$(this).attr("eId")+"]").prop("checked")){

									        			    			var currentDiv=$("#"+$(this).attr("eId")); 
						
									        			    			var tTouchReturnTime =row.tTouchReturnTime;
									        			    			 
											        					 //获取当前元素已经绑定的 touch字符串  
													 					var mtouchs=currentDiv.attr("mtouchs");
									
													 					//融合追加
												                        var mtouchsArray=new Array();
												                        
													 					//转换成touch对象组
													 			    	var objs = eval( "(" + mtouchs + ")" );//转换后的JSON对象 
													 			    	for(var j=0;j<objs.length;j++){
													 			    		if(objs[j]==null){}else{
														 			    		
														 			    		if(row.tTouchKey==objs[j].tTouchKey){
															 			    		
															 			    		if(tTouchReturnTime==""){
																 			    		
															 			    			tTouchReturnTime=0;

																	 			    }
																 			        
																 			        if(objs[j].tTouchReturnTime!=tTouchReturnTime){
																	 			        
																 			        	objs[j].tTouchReturnTime=tTouchReturnTime;
																 			        }
															 			    		
															 			        }
													 			    		}
														 				}
													 			    	//重新绑定
													 					currentDiv.attr("mtouchs",JSON.stringify(objs)); 		 
									        			    			
									        			    		}
									        			    		
									        			    	});	
							
									        				}
														}
						
													}
							
								                    function removeit(){
						
														if (editIndex == undefined){return;}
						
												    	//获取当前 选中元素id
												    	var currentDiv;
												    	
												    	$("input[name = checkdom]:checkbox").each(function(){
													    				
												    		if ($("input[eId="+$(this).attr("eId")+"]").prop("checked")){
												    			currentDiv=$("#"+$(this).attr("eId"));  
												    		}
												    		
												    	});	
						
														var rows=$("#dg").datagrid("getRows");
														for(var i=0;i<rows.length;i++)
														{  
															if(editIndex==i){
																
																//获取标识值
																var value=rows[i].tTouchKey;  
							
																 //获取当前元素已经绑定的 touch字符串  
											 					var mtouchs=currentDiv.attr("mtouchs");
							
											 					//融合追加
										                        var mtouchsArray=new Array();
										                        
											 					//转换成touch对象组
											 			    	var objs = eval( "(" + mtouchs + ")" );//转换后的JSON对象 
											 			    	for(var j=0;j<objs.length;j++){
											 			    		if(objs[j]==null){}else{
												 			    		if(value!=objs[j].tTouchKey){
												 			    			mtouchsArray[j]=objs[j];
													 			        }
											 			    		}
												 				}
											 			    	//重新绑定
											 					currentDiv.attr("mtouchs",JSON.stringify(mtouchsArray)); 					 							
															}
															
													    }
														
														$('#dg').datagrid('cancelEdit', editIndex)
																.datagrid('deleteRow', editIndex);
														editIndex = undefined;
													}
							
											        function formatTitle(val,row){
															return '<span class="easyui-tooltip" title="'+val+'">'+val+'</span>';	
												    }

	                               </script>
			             
								  </div>
								
								
								
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
		          
		          <div id="pm_right_pub">
		          
		              <ul class="pm_right_content" id="pm_right_content_id" style="padding-left: 0px;background-color: rgb(238, 238, 238);">
		                
		                
		                  <li style="height: 35px;padding:5px 0px 0px 10px;cursor: pointer;" id="bg_color_set"  title="<ww:property value='#session.local.a00449'/>" >
			                   <span style="display: block;float: left;" ><ww:property value="#session.local.a00358" />:</span><!-- 背景颜色 -->
			                   <span style="float: left;"  class="bgm_show_span" id="bgm_show"></span>
			              </li>
			              
		                  <li style="height: 35px;padding:5px 0px 0px 10px;cursor: pointer;display: none;" id="bgm_bn" title="<ww:property value='#session.local.a00449'/>" >
			                   <span style="display: block;float: left;" ><i class="icon icon-music"></i>:</span>
			                   <span style="float: left;"  class="bgm_show_span" id="bgm_show"></span>
			              </li>
		              
		                 <li style="height: 35px;padding:6px 0px 0px 10px;">
<!--		                 <button id="for_align_left"  class="btn  btn-primary btn-mini"  type="button"><ww:property value="#session.local.a00363" /></button> 左对齐 -->
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
		                  
		                    
<!--		                <button id="for_align_width" class="btn  btn-primary  btn-primary btn-mini"  type="button"><ww:property value="#session.local.b00166" /></button>-->
		                    
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
							    </div>
                            </fieldset>
		                 </li>
		                 
		              </ul>
		            
		          </div>
		         
		     </div>
	    </div>
     </div>
     
	 <input type="hidden" name="mfile" id="mfile" value="<ww:property value='#session.scene.filename'/>" />  <!-- 节目文件包名 -->
	
	 <input type="hidden" id="seecontent"	name="seecontent" />   <!-- 预览生成 html页面 --> 
	
	 <input type="hidden" id="gcontent" name="gcontent" />   <!-- x86 生成 html页面 暂不用-->
	
	 <input type="hidden" id="content" name="content" />     <!-- 安卓 生成html页面 暂不用 -->
	
	 <input type="hidden" id="fcontent" name="fcontent" />  <!-- 节目所有关联文件名 -->
	
	 <input type="hidden" id="mcontent" name="mcontent"  value="<ww:property value='#session.scene.mcontent' />"/>  <!-- html网页内容 -->
	
	 <input type="hidden" id="sf" name="sf"  value="<ww:property value='#session.scene.sf' />" />    <!-- 缩放比 -->
	
	 <input type="hidden" id="citykey" name="citykey"/>      <!-- 天气 -->
	   
	 <input type="hidden" id="text" name="text" />  <!-- 文本 -->
	
	 <input type="hidden" id="rsskey" name="rsskey"/> <!-- rss数据源  -->
	
	 <input type="hidden" id="ip" value="<ww:property value='#session.ip' />"/>   <!-- 服务器ip地址 -->
	
	 <input type="hidden" id="timeTxt" name="timeTxt"/>    <!-- 时间 -->  
	
	 <input type="hidden" id="av" name="av"/>       <!-- av数据源 -->
	
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
	 
	 <input type="hidden" id="tx" name="tx"  value="<ww:property value='#session.scene.tx'/>" />   <!--x 分辨率 -->
	 
	 <input type="hidden" id="ty" name="ty"  value="<ww:property value='#session.scene.ty'/>"  />   <!--y 分辨率 -->
	 			
	 <input type="hidden" id="editStime" name="editStime"  value="<ww:property value='#request.item.stime' />" />
	 
	 <input type="hidden" id="jsonTouchs" name="jsonTouchs"/>

     <input type="hidden" id="jsonRecyclers" name="jsonRecyclers"/>
     
     <input type="hidden" id="itemType" name="itemType" value="2"/>
	 
	 <input type="hidden" id="localJson"  value="<ww:property value='#session.localJson' />"/>
	 
	 <input type="hidden" id="openIntro"  value="<ww:property value='openIntro' />"/>
	
	 <input type="hidden" id="interactGroupShowState"  value="<ww:property value='#session.version_onoff.interactGroupShowState' />"/>	
     
     <input type="hidden" id="jsonImgsFlip" name="jsonImgsFlip"/> <!-- 翻书图片 -->
      
     <input type="hidden" id="itemViceType" name="itemViceType" value="<ww:property value='itemViceType' />" />
     
     <input type="hidden" id="screenType" name="screenType" value="<ww:property value='screenType' />" />
     
     <input type="hidden" id="screenTypeHtml" name="screenTypeHtml" value="0" />
     
     <input type="hidden" id="layerBigDataParameterMap"/>  <!-- 文本框传值json -->
     
     <input type="hidden" id="upFblSave"    name="upFblSave" value="0"/> <!-- 修改分辨率保存的节目 -->
     
     <input type="hidden" id="upFblId"    name="upFblId" value="<ww:property value='upFblId' />"/> <!-- 需要修改的分辨率 -->

     
      
   </form>
<!--   <div class="footer" style="background-image:url('');"> -->
<!--   </div>-->
  </body>
</html>
