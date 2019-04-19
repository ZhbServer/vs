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
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<script type="text/javascript">
var intro;

  function init_self(){
	  var openIntro = <%=request.getParameter("openIntro")%>;

		if(openIntro == '1'){
			intro = introJs();  
			intro.setOptions({
	        doneLabel:"<ww:property value='#session.local.a00863' />",
			showStepNumbers: false,
			showBullets: false,
			exitOnOverlayClick: false,
			overlayOpacity: 0.4,  
			steps: [
			    {
				    element: '#step1',
				    intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00490' /></span>,<ww:property value='#session.local.a00898' />"
				}	
			  ]  
			});  

			document.getElementById("step1").onclick = function (){
				intro.exit();
				plan_add_1();
				document.getElementById("step1").onclick = function (){
					plan_add();
				};
			};

			intro.start().oncomplete(function() {  
				intro.exit();  
				document.getElementById("step1").onclick = function (){
					plan_add();
				};
		    });

			intro.onexit(function() {
				layer.msg("<ww:property value='#session.local.a00864' />");
			});
		}else if(openIntro == '2'){
			intro = introJs();  
			intro.setOptions({
	        doneLabel:"<ww:property value='#session.local.a00863' />",
			showStepNumbers: false,
			showBullets: false,
			exitOnOverlayClick: false,
			overlayOpacity: 0.4,  
			steps: [
			    {
				    element: '#step1',
				    intro: "<ww:property value='#session.local.a00899' /><ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00490' /></span>,<ww:property value='#session.local.a00900' />"
				}	
			  ]  
			});  

			document.getElementById("step1").onclick = function (){
				intro.exit();
				plan_add_2();
				document.getElementById("step1").onclick = function (){
					plan_add();
				};
			};

			intro.start().oncomplete(function() {  
				intro.exit();  
				document.getElementById("step1").onclick = function (){
					plan_add();
				};
		    });

			intro.onexit(function() {
				layer.msg("<ww:property value='#session.local.a00864' />");
			});
		}else if(openIntro == '3'){
			intro = introJs();  
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
					element: '#step2',  
					intro: "<ww:property value='#session.local.a00901' /><span style='color:blue'> <ww:property value='#session.local.a00902' /></span>",
					position: "left"
				},  	
				{  
					element: '#step3',  
					intro: "<ww:property value='#session.local.a00903' /><span style='color:blue'> <ww:property value='#session.local.a00904' /></span>",
					position: "left"
				},
				{
					element: '#step4',  
					intro: "<ww:property value='#session.local.a00905' />"
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


  /*(新手指引)添加开机计划*/
  function plan_add_1(){
	  layer.open({
	 		 type: 2,
	         area: ['800px', '420px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'client_onoff_plan_add.jsp?openIntro=1',
	         scrollbar: false,
	         end: function(){
				  if(window.returnValue==undefined||window.returnValue==""){
					   window.returnValue=""; 
		          
				  }else{
					    var rv=window.returnValue;
					    var task=document.getElementById("task").value;
						if(task.length==0){
						     document.getElementById("task").value=rv;
				  	    }else{
				  	         document.getElementById("task").value=rv+"/"+task;
				  	  	}
						
						document.form1.action = "totimeonoffnew.vs?openIntro=2"; 
						document.form1.submit(); 
				  }    
	 		 }
	 	});   
  }

  /*(新手指引)添加开机计划*/
  function plan_add_2(){
	  layer.open({
	 		 type: 2,
	         area: ['800px', '420px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'client_onoff_plan_add.jsp?openIntro=2',
	         scrollbar: false,
	         end: function(){
				  if(window.returnValue==undefined||window.returnValue==""){
					   window.returnValue=""; 
		          
				  }else{
					    var rv=window.returnValue;
					    var task=document.getElementById("task").value;
						if(task.length==0){
						     document.getElementById("task").value=rv;
				  	    }else{
				  	         document.getElementById("task").value=rv+"/"+task;
				  	  	}
						
						document.form1.action = "totimeonoffnew.vs?openIntro=3"; 
						document.form1.submit(); 
				  }    
	 		 }
	 	});   
  }
  
  /*添加计划*/
  function plan_add(){
	  layer.open({
	 		 type: 2,
	         area: ['800px', '420px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'client_onoff_plan_add.jsp',
	         scrollbar: false,
	         end: function(){
				  if(window.returnValue==undefined||window.returnValue==""){
					   window.returnValue=""; 
		          
				  }else{
					    var rv=window.returnValue;
					    var task=document.getElementById("task").value;
						if(task.length==0){
						     document.getElementById("task").value=rv;
				  	    }else{
				  	         document.getElementById("task").value=rv+"/"+task;
				  	  	}
						
						document.form1.action = "totimeonoffnew.vs"; 
						document.form1.submit(); 
				  }    
	 		 }
	 	});   
  }

  /*提交发送*/
  function plan_onoff_send(){
	  var task=document.getElementById("task").value;
 	  if(task==null||task==""){
     	alert("<ww:property value='#session.local.a00503' />!"); 
         return 
      }        
 	  document.form1.action="fbnewds.vs";
      document.form1.submit();
  }

  //取消
  function qxfsds(){
	  document.getElementById("task").value="";
 	  document.form1.action="fbnewds.vs";
      document.form1.submit();

  } 


  //删除计划
  function onoff_del(theone){

		document.getElementById("selonoff").value=theone;		
		document.form1.action = "onoffdel.vs"; 
		document.form1.submit(); 

  }

  //编辑计划
  function onoff_edit(theone){
	 
	  layer.open({
	 		 type: 2,
	         area: ['800px', '420px'],
	         offset: '10px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'toonoffedit.vs?selonoff='+theone,
	         scrollbar: false,
	         end: function(){
				  if(window.returnValue==undefined||window.returnValue==""){
					   window.returnValue=""; 
		          
				  }else{
					    var rv=window.returnValue;
					    var task=document.getElementById("task").value;

					    if(task.length==0){
						     document.getElementById("task").value=rv;
				  	    }else{

				  	        var tasks = task.split("/");//以逗号作为分隔字符串
				  	       
						    var tempTask="";
						    for(var i=0;i<tasks.length;i++){
						    	
						    	if(theone==tasks[i]){
							    
						    		if(tempTask.length==0){
							    		tempTask=rv;
								    }else{
								    	tempTask=tempTask+"/"+rv
									}
							    }else{
							    	if(tempTask.length==0){
							    		tempTask=tasks[i];
								    }else{
								    	tempTask=tempTask+"/"+tasks[i]
									}
								}
							}

						    document.getElementById("task").value=tempTask;
							

					  	}
					  
					    
						//if(task.length==0){
						//     document.getElementById("task").value=rv;
				  	    //}else{
				  	    //     document.getElementById("task").value=rv+"/"+task;
				  	  	//}
						
						document.form1.action = "totimeonoffnew.vs"; 
						document.form1.submit(); 
				  }    
	 		 }
	 	});   

  }
 
</script>
</head>
<body onload="init_self()">
  <form  name="form1" method="post" >
  
		 <input type="hidden" id="task"   name="task"  value="<ww:property value="task" />" />
		 
		 <input type="hidden" id="selonoff"   name="selonoff" />
		 
		 
		 <input type="hidden" name="cgids" value="<ww:property value='cgids' />"/>
		 <input type="hidden" name="clientids" value="<ww:property value='clientids' />"/>
		 <div class="title bottom">
				<div class="t_container">
				    <div class="loc">
					        &nbsp;&nbsp;<ww:property value='#session.local.a00065' /> :
					        <span class="function"><ww:property value='#session.local.a00159' /></span>
					        <span class="material_bg"><ww:property value='#session.local.a00489' /></span>
					</div>
					
				</div>
		 </div>

          <div class="c_middle download_manager" style="margin: 5px 0px;">
    
	        <div>
	             <div class="c_right_header" >
		
	
						<div class="row">
							 <div class="btn-group" style="float: right;margin-right: 53px;">
								       <button id="step1" onclick="plan_add()"   type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00490' /></button>
								       <button id="step2" onclick="plan_onoff_send()"  type="button" class="btn btn-sm btn-primary" ><ww:property value='#session.local.a00491' /></button>
								       <button id="step3" onclick="qxfsds()"    type="button" class="btn btn-sm btn-primary"  ><ww:property value='#session.local.a00492' /></button>
								       
						     </div>
					     </div>		
			
		          </div>
                  <!--显示内容-->
                  <div >
        
                    <div style="height: 400px;"  >
            
		                  <div style="padding-right:17px;margin-top: -5px;">
		                        <table border="0" cellpadding="0" cellspacing="0">
								      <tr class="cell_element cell_first">
										  <td style="width:30%" align="center"><ww:property value='#session.local.a00493' /></td>
										  <td style="width:30%" align="center"><ww:property value='#session.local.a00035' /></td>
										  <td style="width:20%" align="center"><ww:property value='#session.local.a00248' /></td>
										  <td style="width:20%" align="center"><ww:property value='#session.local.a00016' /></td>
									  </tr>
								  </table>
		                       
		                  </div>
	                    
	                    
			              <div style="height: 400px;overflow: auto;overflow-y:scroll;margin-top: -22px;"> 
							  <table border="0" cellpadding="0" cellspacing="0">
							        <ww:iterator value="ls">
										 <tr class="cell_element cell_show">
												
												<td style="width:30%" align="center">
												    <ww:property value="dayscontent" />
												</td>
												<td style="width:30%"  align="center">
												  <ww:if test="type==0">
												      <ww:property value="#session.local.a00485" />
												  </ww:if>
												  <ww:if test="type==1">
												       <ww:property value="#session.local.a00484" />
												  </ww:if>
												 
												</td>
												<td style="width:20%" align="center">
												  <ww:property value="sdate" />
												</td>
												
												<td style="width:20%" align="center">
												
												    
												     <!-- 编辑 -->
												     <span onclick="onoff_edit('<ww:property value='theone'/>')" style="cursor: pointer;" title="<ww:property value='#session.local.a00024'/>"><i class="icon icon-edit"></i></span>
												     
												     &nbsp;&nbsp;
												     
												     <!-- 删除 -->
												     <span onclick="onoff_del('<ww:property value='theone'/>')" style="cursor: pointer;" title="<ww:property value='#session.local.a00025'/>"><i class="icon icon-times"></i></span>												     
							                    </td>
							 				
										 </tr>
						            </ww:iterator>
							  </table>
						  </div>		        		
                      </div>
		        </div>
           </div>
        </div>
  </form>
</body>
</html>
