<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="PRAGMA" content="NO-CACHE" />

<base target="_self" />
<style type="text/css">
A{text-transform:none; text-decoration:none;}  
</style> 
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/common.css"/>

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/icon.css"  />

<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>

<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/easyuiLocal.js"></script>
<script type="text/javascript" src="js/constant.js"></script>

<script src="js/jscolor.js"></script> 


<script   src="zui-1.5.0-dist/dist/lib/sortable/zui.sortable.js"></script>

<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/datagrid-dnd.js"></script>

<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<style>
	/* 为可拖动的条目应用可移动光标类型 */
	#sortableList > .list-group-item {cursor: move}
	
	/* 为正在被拖动的条目应用半透明外观 */
	#sortableList > .list-group-item.dragging {
	  visibility: visible;
	  opacity: .3;
	}
	
    .insert-tab tr{line-height:0px;}

   .insert-tab td{text-align:left;padding-left:0px;}
	
</style>



<script src="js/fresh.js" type="text/javascript" language="javascript"></script>
<script>

    function sel_touch_type(ttypev){

    	 /*隐藏显示串口数据*/
    	 //$("#portReceiveDiv_checkbox_div").hide();
    	 
         /*获取目标触摸类型  状态是5为事件 创建 select*/
         var touchOnclickO= document.getElementById("touchOnclickDivId");

         if(ttypev==5){
             
             /*清空目标事件区域*/
        	 document.getElementById("touchOnclickDivId").innerHTML="";

             /*获取目标元素ID*/
        	 //var targetIds=document.getElementById("targetId").value;
             var targetIds=$("#targetId").val();

        	 var targetId=targetIds.substring(0,5);
        	 
             /*创建事件select*/
        	 var touchOnclckSelect = document.createElement("select");

        	 var currentdivid="<ww:property value='currentdivid'/>";

         	 var imTargetId=currentdivid.substring(0,5);
         	 if(imTargetId=="imggr"){
         		targetId=imTargetId;
             }
         	 if(targetId=="imggr"){
         		touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.b00139'/>","13"));//投射
         		touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00274'/><ww:property value='#session.local.b00236'/>","14"));//全屏滑动
         		$("#targetId option[value='"+currentdivid+"']").remove(); //删除Select
             }else{
            	 /*判断目标元素类型*/
            	 if(imTargetId=="caroY"||imTargetId=="catal")
                 {
            		 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.d00009'/>","14"));//轮播
                 }else if(targetId=="video"){
            		 
            		 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00738'/>","1"));//下一个
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00739'/>","2"));//上一个 
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00740'/>","3"));//播放
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00741'/>","4"));//暂停 
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00742'/>","5"));//停止 
                	 //touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00743'/>","6"));//快退
                	 //touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00744'/>","7"));//快进 
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00746'/>","8"));//恢复
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00274'/>","11"));//全屏
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.b00084'/>","12"));//状态栏
					 //将轮播绑定在轮循播放列表
                 	
                	 
			
                 } else if(targetId=="image"||targetId=="himag"){
                	 
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00738'/>","1"));//下一个
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00739'/>","2"));//上一个           
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00746'/>","8"));//恢复
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00274'/>","11"));//全屏  
                	 
                 }else if(targetId=="htmls")
                 {
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00738'/>","1"));//下一个
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00739'/>","2"));//上一个           
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00746'/>","8"));//恢复
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.d00012'/>","16"));//显示
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00274'/>","11"));//全屏  
                 }else if(targetId=="caroD"||targetId=="searc")
                 {
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.d00012'/>","16"));//显示
                 }else{
                	 
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00738'/>","1"));//下一个
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00739'/>","2"));//上一个           
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.a00746'/>","8"));//恢复
                	 touchOnclckSelect.options.add(new Option("<ww:property value='#session.local.d00012'/>","16"));//显示
                 }

             }
             	 
        	 touchOnclckSelect.id = "touchOnclickSelectId";

              /*注册事件*/
              touchOnclckSelect.onchange= function target_onclick(){ 
            	   
	              var obj = document.getElementById("touchOnclickSelectId"); //selectid
	
	              var index = obj.selectedIndex; // 选中索引
	
	              var text = obj.options[index].text; // 选中文本
	
	              var value = obj.options[index].value; // 选中值
	
	              document.getElementById("targetDivContent").innerHTML=text;
                 
			  };  
        	 
             touchOnclickO.appendChild(touchOnclckSelect);

             /*更新目标操作内容*/

             var obj = document.getElementById("touchOnclickSelectId"); //selectid

             var index = obj.selectedIndex; // 选中索引

             var text = obj.options[index].text; // 选中文本

             var value = obj.options[index].value; // 选中值

             $('#targetDivContent').show();
             
             document.getElementById("targetDivContent").innerHTML=text;

             $('#targetDivContentImg').hide();
         	 $('#targetDivContentVideo').hide();
          	 $('#targetDivContentAppLeft').hide();
          	 $('#targetDivContentHtml').hide();
          	 $('#targetDivContentScene').hide();
             $('#targetDivContentBroadcastLeft').hide();
          	 $('#targetId').show();
          	    
         }else{
             
             document.getElementById("touchOnclickDivId").innerHTML="";
          
             load_targetDivContent(ttypev);
           
         }

         /*获取触发方式*/
  	     var  triggerType=document.getElementById("triggerType").options[document.getElementById("triggerType").options.selectedIndex].value;
     
  	     sel_triggerType_type(triggerType);

    } 

    /*初始化*/
    var tResourcesListJson="";
    var tClientJson="";
    function onload_touch_type(onType){
       
        //onType  初始化为1
       
        if(onType==1){
        	tResourcesListJson="<ww:property value='resourcesListJson'  />";

        	tClientJson="<ww:property value='tClientJson'  />";

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
        				intro: "<ww:property value='#session.local.a00942' /><span style='color:blue'> <ww:property value='#session.local.a00736' /></span><ww:property value='#session.local.a00943' />"
        			},
        			{
    					element: '#touchOnclickDivId',
    					intro: "<ww:property value='#session.local.a00944' /><span style='color:blue'> <ww:property value='#session.local.a00738' /></span>"
            		},
            		{
    					element: '#targetId',
    					intro: "<ww:property value='#session.local.a00945' />(<span style='color:blue'> <ww:property value='#session.local.a00946' />vedio0</span>)"
            		},
            		{
    					element: '#step2',
    					intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00869' /></span><ww:property value='#session.local.a00887' />",
    					position: "top"
            		}
        		  ]  
        		});  

        		intro.start().oncomplete(function() {  
        			intro.exit();  
        	    });

        		intro.onexit(function() {
        			layer.msg("<ww:property value='#session.local.a00864' />");
        			window.parent.returnValue='close';
        		});
        	}
        }



        //显示内容
          
          //var divHtml=window.parent.$("#layerBigDataParameter").val();

          //$("#yxlist").html(divHtml); 
            /**
	       //字体类型
	       var  fonttype=document.getElementById("fonttype").options[document.getElementById("fonttype").options.selectedIndex].value;
	       fonttype2(fonttype); 
	   	 

	       var advancedType="<ww:property value='advancedType' />";
           
	   	   if(advancedType=="1"){
	   	    	     document.getElementById("txtFontSizeAdvancedCheckBox").checked=true;
	   	    	     //获取字体大小
	     	         var fonsize=document.getElementById("txtFontSizeAdvancedSelect").options[document.getElementById("txtFontSizeAdvancedSelect").options.selectedIndex].value;
	     	         fontsize2(fonsize);
	       }else{
	       		     //获取字体大小
	     	         var fonsize=document.getElementById("txtfontsize").options[document.getElementById("txtfontsize").options.selectedIndex].value;
	     	         
	       		     fontsize2(fonsize);
	     	       
	       		     document.getElementById("txtFontSizeAdvancedCheckBox").checked=false;

	           }
	   	     setCheckBoxChange(); 

	     

	       //获取字距
	       var lineH=document.getElementById("lineH").options[document.getElementById("lineH").options.selectedIndex].value;
	       gethsign(lineH);
	       
	       //背景颜色
	       var backcolor=document.getElementById("backcolor").options[document.getElementById("backcolor").options.selectedIndex].value;
	       //alert(backcolor)
	       setbackcolor(backcolor);

	       //字体颜色
	       var fontcolor=document.getElementById("fontcolor").options[document.getElementById("fontcolor").options.selectedIndex].value;
	       setcolor(fontcolor);
           **/
	       
    	
           /*获取触摸类型*/
    	   var targetOnclickId=$('input[name="targetOnclickId"]:checked').val();
       
    	   sel_touch_type(targetOnclickId);


    	   /*获取触发方式*/
    	   var  triggerType=document.getElementById("triggerType").options[document.getElementById("triggerType").options.selectedIndex].value;
       
    	   sel_triggerType_type(triggerType);

    	   
    	   if(triggerType==1){
        	 
                $("#portReceiveDiv").show();

           }else{
               
        	    $("#portReceiveDiv").hide();
        	    

           }



    	   
    	   var clientClickType="<ww:property value='editTouchInteractive.clientClickType' />";
    	   //if(clientClickType==0){
    	   //	   clientClickType=1;
           //}   
           sel_client_click_type(clientClickType);
           //加载已选终端
           if(tClientJson!=""){

           	tClientJson=tClientJson.replace(/&quot;/g,"\"");
           	
               //转换成touch对象组
   		    var objs = eval( "(" + tClientJson + ")" );//转换后的JSON对象
   		  
   		    var  obj; 
   		    clearDgList("dgSelClient");
   		    for(var i=0;i<objs.length;i++){
   			    
   		    	$('#dgSelClient').datagrid('appendRow',{

   		    		tClientName:objs[i].name,
   		    		tClientMark:objs[i].mark
   		        	   
                   });

   			}
           }
       
    	   
    }

    function  setCheckBoxChange(){

    	if($("#txtFontSizeAdvancedCheckBox").is(':checked')){

    		$("#txtFontSizeAdvancedSelect").show(); 
    		
    		$("#txtfontsize").attr("disabled","disabled");  
    		
        }else{
            
        	$("#txtfontsize").removeAttr("disabled");  
        	
        	$("#txtFontSizeAdvancedSelect").hide(); 
        }
    }


    function fonttype2(value){
 	   var font =document.getElementById("yxlist");
 	   font.focus();
 	   
 	   if(font==null)
 		{
 		   //alert("<ww:property value='#session.local.item_alert_seltxt' />");
 		  return;
 		}
 	    if(value==0)
 		{
 		font.style.fontFamily="<ww:property value='#session.local.a00377' />";
 		}
 		else if(value==1)
 		{
 		font.style.fontFamily="<ww:property value='#session.local.a00378' />";
 		}
 		else if(value==2)
 		{
 		font.style.fontFamily="<ww:property value='#session.local.a00379' />";
 		}
 		else if(value==3)
 		{
 		font.style.fontFamily="<ww:property value='#session.local.a00380' />";
 		}
 		else if(value==4)
 		{
 		 font.style.fontFamily="<ww:property value='#session.local.a00381' />";
 		}
 		else if(value==5)
 		{
 		   font.style.fontFamily="<ww:property value='#session.local.a00382' />";
 		}
 		else if(value==6)
 		{
 		   font.style.fontFamily="<ww:property value='#session.local.a00378' />";
 		}
 		else if(value==7)
 		{
 		   font.style.fontFamily="<ww:property value='#session.local.b00135' />";
 		}
 		else if(value==8)
 		{
 		   font.style.fontFamily="<ww:property value='#session.local.b00136' />";
 		}
 		else if(value==9)
 		{
 		   font.style.fontFamily="<ww:property value='#session.local.b00137' />";
 		}
 		else if(value==10)
 		{
 		   font.style.fontFamily="<ww:property value='#session.local.d00020' />";
 		}
 		else if(value==11)
 		{
 		   font.style.fontFamily="<ww:property value='#session.local.d00021' />";
 		}
 		else if(value==12)
 		{
 		   font.style.fontFamily="<ww:property value='#session.local.d00022' />";
 		}
 		
 	}

     function fontsize2(value){
        var font =document.getElementById("yxlist");
 	   if(font==null)
 		{
 		  layer.msg("<ww:property value='#session.local.a00626' />");
 		  return;
 		}
 		var sf=document.getElementById("sf").value;
 		font.setAttribute("fontSize",value);
 	    font.style.fontSize=value*sf+"px"; 

 	    //获取字距
 	    var lineH=document.getElementById("lineH").options[document.getElementById("lineH").options.selectedIndex].value;
 	    gethsign(lineH);
 	       
 	}

     function gethsign(value)
     {
     	var font =document.getElementById("yxlist");
     	
     	if(font==null)
     	{
     	  layer.msg("<ww:property value='#session.local.a00626' />");
     	  return;
     	}

     	var fontSize=18;
     	
         if($("#txtFontSizeAdvancedCheckBox").is(':checked')){

         	fontSize=document.getElementById("txtFontSizeAdvancedSelect").options[document.getElementById("txtFontSizeAdvancedSelect").options.selectedIndex].value;
     		
         }else{
             
         	fontSize=document.getElementById("txtfontsize").options[document.getElementById("txtfontsize").options.selectedIndex].value;
         }

     	var fz=parseInt(fontSize*value);
     	
     	font.setAttribute("lineHeight",fz);
     	var sf=document.getElementById("sf").value;
     	font.style.lineHeight=fz*sf+"px"; 

     }

     /*已选*/
     function seldiv(){

     	 var font =document.getElementById("yxlist");
     	 font.focus();
         window.document.execCommand("SelectAll","false",null);
     	 //font.execCommand("SelectAll",null,null);  

     };
     
     function setcolor(value) {
     	seldiv();
     	document.execCommand("ForeColor", "false", value); 
     }


     function setbackcolor(value) {
     	seldiv();
     	if(value==0){
     		document.execCommand("BackColor", "false", "transparent");
         }else{
         	document.execCommand("BackColor", "false", value);
         }  
     	
     }

     function bold() {
     	seldiv();

     	var fbold=document.getElementById("fbold").value; //加粗(0否 1是)
     	if(fbold==0){
     		document.getElementById("fbold").value=1;
         }else{
         	document.getElementById("fbold").value=0;
         }    
     	   
     	document.execCommand("Bold"); 
     	return;
     }
     function setline() {
     	seldiv();

     	var fsetline=document.getElementById("fsetline").value;//下划线(0否 1是)
     	if(fsetline==0){
     		document.getElementById("fsetline").value=1;
         }else{
         	document.getElementById("fsetline").value=0;
         }    

     	document.execCommand("Underline"); 
     	return;
     }

     function setstrike() {
     	seldiv(); 
     	var fsetstrike=document.getElementById("fsetstrike").value;//中线 (0否 1是)   
     	if(fsetstrike==0){
     		document.getElementById("fsetstrike").value=1;
         }else{
         	document.getElementById("fsetstrike").value=0;
         }    
     	 
     	document.execCommand("StrikeThrough"); 
     	return;
     }

     function itallic() {

     	seldiv();

     	var fitallic=document.getElementById("fitallic").value;//斜体(0否 1是)
     	
     	if(fitallic==0){
     		document.getElementById("fitallic").value=1;
     		document.getElementById("yxlist").innerHTML="<em>"+document.getElementById("yxlist").innerHTML+"</em>";
         }else{
         	document.getElementById("fitallic").value=0;
         	var txtContent=document.getElementById("yxlist").innerHTML;
         	
         	txtContent=txtContent.replace("<em>","");
          	txtContent=txtContent.replace("</em>","");
         	document.getElementById("yxlist").innerHTML=txtContent;
         }    
     	
     	//alert(document.getElementById("yxlist").innerHTML)
     	//document.execCommand("Italic"); 
     	 
     	//return;
     }

     function left() {
     	seldiv();
     	document.execCommand("JustifyLeft"); 
     	return;
     }

     function center() {
     	seldiv();
     	document.execCommand("JustifyCenter"); 
     	return;
     }

     function right() {
     	seldiv();
     	document.execCommand("JustifyRight"); 
     	return;
     }
     
   
    /*保存*/
    function adtouchto(){

    	 endEditing();
    	 endEditingVideo();
    	 endEditingHtml();

    	 //构造
    	 var touchInteractive = new Object();

    	 var targetOnclickId=$('input[name="targetOnclickId"]:checked').val();

    	 //获取已选列表全部数据
     	 var rows; 
     	 
    	 if(targetOnclickId==1||targetOnclickId==2||targetOnclickId==3||targetOnclickId==14){
    		 if(targetOnclickId==1){
    			  rows = $("#dg").datagrid("getRows"); 
             }else if(targetOnclickId==2){
            	  rows = $("#dgVideo").datagrid("getRows");
             }else if(targetOnclickId==3){

                  //获取网页刷新时间秒
                  var aHtmlTtime=$("#aHtmlTtime").val();
                  if(aHtmlTtime.length==0){
                       layer.msg("<ww:property value='#session.local.a00332'/><ww:property value='#session.local.a00691'/>");
                       return;
                  }
                  touchInteractive.tResources=aHtmlTtime; 

            	  rows = $("#dgHtml").datagrid("getRows");
             }else if(targetOnclickId==14){
            	  rows = $("#dgSelFlip").datagrid("getRows");
             }
       	     if(rows.length<1)
       	     {
       	        layer.msg("<ww:property value='#session.local.a00018'/>");
       		    return;
       	     }

         }else if(targetOnclickId==6){
             
        	  var appUrl=$("#appUrl").val();
        	  
        	  if(appUrl.length==0){
        		  layer.msg("<ww:property value='#session.local.a00631'/>");
        		  return;
              }
              
        	  touchInteractive.tResources=appUrl;
                 
         }else if(targetOnclickId==10){

             //获取广播节目编号
             var broadcastNumber=$("#broadcastNumber").val();


             if(broadcastNumber==""){

                  layer.msg("<ww:property value='#session.local.b00102'/><ww:property value='#session.local.a00691'/>");   

                  return;
             }
             
             //获取触摸返回时间
             var tTouchReturnTime=$("#tTouchReturnTime").numberbox('getValue');

             if(tTouchReturnTime==""){
                 
                 layer.msg("<ww:property value='#session.local.a00758'/><ww:property value='#session.local.a00691'/>");
                    
                 return;

             }

             touchInteractive.tResources=broadcastNumber;

             touchInteractive.tTouchReturnTime=tTouchReturnTime;
                
        }else if(targetOnclickId==12){

            //获取串口协议
            var serialPort=$("#serialPort").val();
            
            serialPort=serialPort.replace(/(^\s*)|(\s*$)/g, ""); 

            if(serialPort==""){
                
              layer.msg("<ww:property value='#session.local.b00258'/>");   

              return;

            }
            
            touchInteractive.tResources=serialPort;

           
               
       }else if(targetOnclickId==4){
        	 
        	 var radioVal=$('input[name="qxradio"]:checked').val();
        	 
        	 var radioName=$('input[name="qxradio"]:checked').attr("qxname");

        	 touchInteractive.tResources=radioVal;

        	 touchInteractive.tTypeText=radioName;
                
        }else if(targetOnclickId==15){
       	 

       	         //获取已选终端
       	         var clientRows = $("#dgSelClient").datagrid("getRows");

                 if(clientRows.length==0){

                	  layer.alert("<ww:property value='#session.local.a00416'  />");
                      return;
                 }
       	         
       	         var clientArray=new Array();
       	         var clientObj;
       	         for(var i=0;i<clientRows.length;i++)
  	  	         {
       	        	 clientObj=new Object();
       	        	 clientObj.name=clientRows[i].tClientName;
       	        	 clientObj.mark=clientRows[i].tClientMark;
       	        	 clientArray[clientArray.length]=clientObj;
       	        	 
      	  	     }
       	         touchInteractive.targetClients=clientArray;

       	         var clientClickType=$("#clientClickType").val();
       	         //获取类型
       	         touchInteractive.clientClickType=clientClickType;
       	         //获取已选节目
       	         if(clientClickType==1){

       	        	var radioVal=$('input[name="qxradio"]:checked').val();
   	           	 
   	   	            var radioName=$('input[name="qxradio"]:checked').attr("qxname");

   	   	            
   	   	            if(radioVal==undefined){

   	   	                layer.alert("<ww:property value='#session.local.a00415'  />");
                        return;
   	   	   	        }

   	   	            touchInteractive.tResources=radioVal;
   	
   	   	            touchInteractive.tTypeText="<ww:property value='#session.local.b00376' />[<ww:property value='#session.local.a00599' />]";

           	     }else  if(clientClickType==0){

        	        	var radioVal=$('input[name="qxcommonradio"]:checked').val();
    	           	 
    	   	            var radioName=$('input[name="qxcommonradio"]:checked').attr("qxname");

    	   	            if(radioVal==undefined){

    	   	                layer.alert("<ww:property value='#session.local.a00415'  />");
                            return;
    	   	   	        }

    	   	            touchInteractive.tResources=radioVal;
    	
    	   	            touchInteractive.tTypeText="<ww:property value='#session.local.b00376' />[<ww:property value='#session.local.a00599' />]";

            	  }else if(clientClickType==2){

           	    	    touchInteractive.tTypeText="<ww:property value='#session.local.a00488' />[<ww:property value='#session.local.a00599' />]";

           	     }else if(clientClickType==3){

            	    	touchInteractive.tTypeText="<ww:property value='#session.local.a00487' />[<ww:property value='#session.local.a00599' />]";

            	 }else if(clientClickType==4){

           	    	var clientSerialPort=$("#clientSerialPort").val();
                    
           	    	clientSerialPort=clientSerialPort.replace(/(^\s*)|(\s*$)/g, ""); 

                    if(clientSerialPort==""){
                        
                      layer.msg("<ww:property value='#session.local.b00258'/>");   

                      return;

                    }
                    
                    touchInteractive.tResources=clientSerialPort;

                    touchInteractive.tTypeText="<ww:property value='#session.local.b00376' />[<ww:property value='#session.local.b00255' />]";
                    
               	 }
	        	 
               
       }
    	

        //获取当前元素id
        var currentdivid=document.getElementById("currentdivid").value;

        touchInteractive.tCurrentId = currentdivid;

        var temptTouchKey="<ww:property value='editTouchInteractive.tTouchKey'  />";
      
        if(temptTouchKey==""){
        	touchInteractive.tTouchKey = currentdivid+creade_random();
        }else{
        	touchInteractive.tTouchKey=temptTouchKey;
        }
           

         //获取目标元素id(目标显示区域)
        var targetIds=document.getElementById("targetId").value;
        
        if(targetOnclickId==6||targetOnclickId==4||targetOnclickId==10||targetOnclickId==15){
        	touchInteractive.tTargetId = "no";
        }else{
        	touchInteractive.tTargetId = targetIds;
        }
        if(currentdivid.substring(0,5)=='caroY'&&targetIds.substring(0,5)!='video')
        {
        	layer.msg("<ww:property value='#session.local.d00019'/>");
        	return;
        }
        
		//设置轮播已播指向播放区域
		//if(tOnclick==14)
		//{
		//	var caroY =document.getElementById(currentdivid);
		  //  caroY.attr("tTargetId",targetIds);
		//}

        //目标触摸事件  1.下一个 2.上一个  3.播放  4.暂停  5.停止  6.快退  7.快进  8恢复 
        var tOnclick=0;
        if(targetOnclickId==5){
        	tOnclick=document.getElementById("touchOnclickSelectId").value;
        	touchInteractive.tOnclick=tOnclick;
        } else if (targetOnclickId==16) {
        	tOnclick=document.getElementById("touchOnclickVol").value;
        	touchInteractive.tOnclick=tOnclick;
		}else{
        	touchInteractive.tOnclick=0;
        }

        
        //获取目标触摸类型  1.图片 2.视频 3.网页 4 链接节目 (场景)5 事件/动作  10广播跳转  11文本  12发送串口13翻书
        var targetOnclickId=$('input[name="targetOnclickId"]:checked').val();
        touchInteractive.tType=targetOnclickId;

        

      

    	if(targetOnclickId!=10){
    		 //无触摸返回时间(秒) 默认为0 无效
            touchInteractive.tTouchReturnTime=0;
        }
       
        //资源集合
        var tResourcesList= new Array();
        if(targetOnclickId==1||targetOnclickId==2||targetOnclickId==3||targetOnclickId==14){

        	var isShowIndex=0;
            if(targetOnclickId==14){
            	  

           	   $('input:checkbox[id=isShowIndex]:checked').each(function(k){

           		    isShowIndex=$(this).val();
           		   
           		});
          		
            }
	        var temp;
	        var tTypeText="";
	        for(var i=0;i<rows.length;i++)
	  	    {
		  	      //素材名
		  	      
	        	 if(targetOnclickId==1){
	        		  if(tTypeText==""){
			  			 tTypeText=rows[i].tScName;
				  	  }else{
				  		 tTypeText=tTypeText+","+rows[i].tScName;
					  }
	             }else if(targetOnclickId==2){
	            	 if(tTypeText==""){
			  			 tTypeText=rows[i].tScNameVideo;
				  	  }else{
				  		 tTypeText=tTypeText+","+rows[i].tScNameVideo;
					  }
	             }else if(targetOnclickId==3){
	            	 if(tTypeText==""){
			  			 tTypeText=rows[i].tHtmlUrl;
				  	  }else{
				  		 tTypeText=tTypeText+","+rows[i].tHtmlUrl;
					  }
	             }else if(targetOnclickId==14){

	        		  if(tTypeText==""){
				  			 tTypeText=rows[i].tScName;
					  	  }else{
					  		 tTypeText=tTypeText+","+rows[i].tScName;
					  } 
		          }
	             
	             
		  		 
		  		  var touchBasis = new Object();


		  		  
	              //图片   
                  
		  		  if(targetOnclickId==1){  			  
			  		  
			  		  touchBasis.tbType=1;  //类型
			  		  touchBasis.type=1;    //类型 
			  		  touchBasis.timeoutMillis=rows[i].tScTime;  //切换时长
			  		  touchBasis.path=rows[i].tScFileName;    //播放地址
			  		  touchBasis.inAnim=rows[i].tScTx;   //特效
			  		  touchBasis.sname=rows[i].tScName;//显示名称

			  	  //视频
			      }else if(targetOnclickId==2){
			    	 
			  		  touchBasis.tbType=0;
			  		  touchBasis.type=0;
			  		  touchBasis.timeoutMillis=0;
			  		  touchBasis.path=rows[i].tScFileNameVideo;       //播放地址
			  		  touchBasis.inAnim=0;
			  		  touchBasis.mVol=rows[i].tScVol;
			  		  touchBasis.sname=rows[i].tScNameVideo;//显示名称

				  }else if(targetOnclickId==3){
					  touchBasis.type=-1;
					  touchBasis.htmlUrl=rows[i].tHtmlUrl;
					  touchBasis.htmlQtime=rows[i].tHtmlQtime;
					  touchBasis.mShowNavigation=rows[i].mShowNavigation;
					  touchBasis.mShowPCWeb=rows[i].mShowPCWeb;
					  //获取页面刷新时间
					  var aHtmlTtime=$("#aHtmlTtime").val();
					  touchBasis.tTime=aHtmlTtime;
					   
					 

					//翻书  
				  }else if(targetOnclickId==14){  			  
			  		  
			  		  touchBasis.tbType=1;  //类型
			  		  touchBasis.type=1;    //类型 
			  		
			  		  touchBasis.path=rows[i].tScFileName;    //播放地址
			  		
			  		  touchBasis.sname=rows[i].tScName;//显示名称

			  		  if(i==0){
			  			   touchBasis.isShowIndex=parseInt(isShowIndex);
		       		  }else{
		       			   touchBasis.isShowIndex=0;
		       	      }

			  	  
			      }
			      tResourcesList[i]=touchBasis;
	
		    }
        }else if(targetOnclickId==11){


        	 var font =document.getElementById("yxlist");

        	  //字体类型
             var  fonttype=document.getElementById("fonttype").options[document.getElementById("fonttype").options.selectedIndex].value;
             

              //判断是否启动高级自助选择   字体大小  0不启用高级模式  1启用高级模式
        	  //获取字体大小
        	 var fonsize=18;
        	 var advancedType=0;
        	 if($("#txtFontSizeAdvancedCheckBox").is(':checked')){
        	    	advancedType=1;
        	        fonsize=document.getElementById("txtFontSizeAdvancedSelect").options[document.getElementById("txtFontSizeAdvancedSelect").options.selectedIndex].value;
        	 }else{
        	    	advancedType=0;
        	        fonsize=document.getElementById("txtfontsize").options[document.getElementById("txtfontsize").options.selectedIndex].value;
             }    
        	 
             //获取字距
             var lineH=document.getElementById("lineH").options[document.getElementById("lineH").options.selectedIndex].value;
             //滚动方式
             var gdtype=document.getElementById("gdtype").options[document.getElementById("gdtype").options.selectedIndex].value;
             //滚动速度 
             var gdspeed=document.getElementById("gdspeed").options[document.getElementById("gdspeed").options.selectedIndex].value;


              //背景颜色
             var  bcolor;
             var backcolor=document.getElementById("backcolor").options[document.getElementById("backcolor").options.selectedIndex].value;
             if(backcolor=="#ED1C24"){
		            bcolor="-65536";
		     }
	         if(backcolor=="#3F48CC"){
	            bcolor="-16776961";
	         }
		     if(backcolor=="#FFC90E"){
		            bcolor="-256";
		     }
	         if(backcolor=="#22B14C"){
	            bcolor="-16711936";
	         }
		     if(backcolor=="#FFFFFF"){
		            bcolor="-2"; 
		     }
		     if(backcolor=="#7F7F7F"){
		            bcolor="-7829368";
		     }
		     if(backcolor=="#000000"){
		            bcolor="-16777216";
		     }

              

             //字体颜色
             var fcolor;
             var fontcolor=document.getElementById("fontcolor").options[document.getElementById("fontcolor").options.selectedIndex].value;

             if(fontcolor=="#ED1C24"){
	              fcolor="-65536";
	         }
	         if(fontcolor=="#3F48CC"){
	              fcolor="-16776961";
	         }
	         if(fontcolor=="#FFC90E"){
	              fcolor="-256";
	         }
	         if(fontcolor=="#22B14C"){
	              fcolor="-16711936";
	         }
	         if(fontcolor=="#FFFFFF"){
	              fcolor="-2"; 
	         }
	         if(fontcolor=="#7F7F7F"){
	              fcolor="-7829368";
	         }
	         if(fontcolor=="#000000"){
	             fcolor="-16777216";
	         }         

          
             //数据来源
             var  textDataSource=document.getElementById("textDataSource").options[document.getElementById("textDataSource").options.selectedIndex].value;
             textDataSource=textDataSource.replace(/@/g,"");
       

         	 var fbold=document.getElementById("fbold").value; //加粗(0否 1是)
         	 var fitallic=document.getElementById("fitallic").value;//斜体(0否 1是)
         	 var fsetline=document.getElementById("fsetline").value;//下划线(0否 1是)
         	 var fsetstrike=document.getElementById("fsetstrike").value;//中线 (0否 1是)      

         	
        	 //文本内容
        	 //alert(font.innerHTML)
        	 var fontContent=font.innerHTML; 
        	 fontContent=fontContent.replace(/\*/g,"?");
        	 fontContent=fontContent.replace(/@/g,"");
        	 fontContent=fontContent.replace(/<\/?.+?>/g,"");
        	 fontContent=fontContent.replace(/ /g,"");//dds为得到后的内容
             //文本
        	 var touchBasis = new Object();

             //资源类型  3为文本
        	 touchBasis.type=3;   
        	 //滚动方式  2静态文本0向上滚动1向左滚动3向下滚动
        	 touchBasis.mDirection=gdtype;
        	 //滚动速度
        	 touchBasis.speed=gdspeed;
        	 //背景颜色
        	 touchBasis.bcolor=bcolor;
        	 //文本内容
        	 touchBasis.txtcontent=fontContent; 
        	 touchBasis.ziti=fonttype;//字体样式
        	 touchBasis.fs=fonsize;     //字体大小
        	 touchBasis.lh=parseInt(lineH*fonsize);     //行高
        	 touchBasis.fcolor=fcolor;//字体颜色
        	 touchBasis.fjc=fbold;  //字体是否加粗(0否 1是)
        	 touchBasis.fdx=fsetline;  //是否有下划线
        	 touchBasis.fxx=fitallic;  //是否斜线
        	 touchBasis.fzx=fsetstrike;  //是否中线
        	 touchBasis.ftype=0; //0居左 1居中 2局右
        	 touchBasis.textDataSource=textDataSource; //数据源

     

        	 if($("#txtFontSizeAdvancedCheckBox").is(':checked')){
        		   touchBasis.advancedType=1;
        	        
        	 }else{
        	       touchBasis.advancedType=0;
        	        
             }    
        	 tResourcesList[0]=touchBasis;
        }

        
        
    	touchInteractive.tResourcesList=tResourcesList;


    	if(targetOnclickId==1||targetOnclickId==3||targetOnclickId==14){
        	touchInteractive.tTypeText=tTypeText; 
        }else if(targetOnclickId==2){
        	touchInteractive.tTypeText=tTypeText; 
        }else if(targetOnclickId==5){
            var tTypeText=""; 
            if(tOnclick==1){
            	tTypeText="<ww:property value='#session.local.a00738'/>";
            }else if(tOnclick==2){
            	tTypeText="<ww:property value='#session.local.a00739'/>";
            }else if(tOnclick==3){
            	tTypeText="<ww:property value='#session.local.a00740'/>";
            }else if(tOnclick==4){
            	tTypeText="<ww:property value='#session.local.a00741'/>";
            }else if(tOnclick==5){
            	tTypeText="<ww:property value='#session.local.a00742'/>";
            }else if(tOnclick==6){
            	tTypeText="<ww:property value='#session.local.a00743'/>";
            }else if(tOnclick==7){
            	tTypeText="<ww:property value='#session.local.a00744'/>";
            }else if(tOnclick==8){
            	tTypeText="<ww:property value='#session.local.a00746'/>";
            }else if(tOnclick==11){
            	tTypeText="<ww:property value='#session.local.a00274'/>";
            }else if(tOnclick==12){
            	tTypeText="<ww:property value='#session.local.b00084'/>";
            }else if(tOnclick==13){
            	tTypeText="<ww:property value='#session.local.b00139'/>";
            }else if(tOnclick==14){
            	tTypeText="<ww:property value='#session.local.d00009'/>";
            }else if(tOnclick==16){
            	tTypeText="<ww:property value='#session.local.d00012'/>";
            }    
            touchInteractive.tTypeText=tTypeText;             	
            
        }else if(targetOnclickId==6){

        	touchInteractive.tTypeText="<ww:property value='#session.local.a00629'/>";

        }else if(targetOnclickId==10){
            
        	touchInteractive.tTypeText="<ww:property value='#session.local.b00101'/>";

        }else if(targetOnclickId==11){
            
        	touchInteractive.tTypeText="<ww:property value='#session.local.b00254'/>";//文本

        }else if(targetOnclickId==12){
            
        	touchInteractive.tTypeText="<ww:property value='#session.local.b00255'/>";  //发送串口

        }else if(targetOnclickId==16){
            if(tOnclick==18){
            	touchInteractive.tTypeText="<ww:property value='#session.local.c00068'/>";//音量减少
            }else if (tOnclick==19) {
            	touchInteractive.tTypeText="<ww:property value='#session.local.c00067'/>";//音量增加
			}       	        	
        }


    	if(targetOnclickId==14){
        	
    		   var isShowIndex=0;

    		   $('input:checkbox[id=isShowIndex]:checked').each(function(k){

    			    isShowIndex=$(this).val();
    			   
    		   });
    		   touchInteractive.isShowIndex=isShowIndex;
        }
    	
    	//获取触发类型
    	var  triggerType=document.getElementById("triggerType").options[document.getElementById("triggerType").options.selectedIndex].value;
    	touchInteractive.triggerType=triggerType;

    	if(triggerType==1){


    		var  portReceiveCheckboxV=0;

    		$('input[id="portReceiveDiv_checkbox"]:checked').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数  
    			portReceiveCheckboxV=$(this).val();
   	        });

    		touchInteractive.portReceiveCheckboxV=portReceiveCheckboxV;
    		if(portReceiveCheckboxV==0){
        		
    			//获取接收串口值
            	var portReceive=$("#portReceive").val();
            	portReceive=portReceive.replace(/(^\s*)|(\s*$)/g, "");
            	if(portReceive.length==""){
                    layer.msg("<ww:property value='#session.local.b00258'/>");
                    return;
                }
            	touchInteractive.portReceive=portReceive;

            }else{

            	var portReceiveHead=$("#portReceive_head").val();

            	touchInteractive.portReceiveHead=portReceiveHead;
            	
            	var portReceiveTail=$("#portReceive_tail").val();

            	touchInteractive.portReceiveTail=portReceiveTail;
            	

            }
    		
        }


    	//获取点击加密状态
    	var mOclickPwdFlag=0;

    	$("input[name = mOclickPwdFlag]:checkbox").each(function(){
			if (($(this).prop("checked"))){
				mOclickPwdFlag=$(this).val();
			}									
		})
		
		touchInteractive.mOclickPwdFlag=mOclickPwdFlag;

		
		if(mOclickPwdFlag==1){

                var mOclickPwd=$("#mOclickPwd").val();

                mOclickPwd=$.trim(mOclickPwd);
                        
                if(mOclickPwd.length==0){

                	layer.msg("<ww:property value='#session.local.a00228' />");
                	return;
                }
                
                touchInteractive.mOclickPwd=mOclickPwd;

	    }else{

	    	touchInteractive.mOclickPwd="";

		}
		
	
    	
        
    	var json = JSON.stringify(touchInteractive);
        //alert(json);
    	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
		window.parent.returnValue=json; 
	    window.parent.layer.close(index);

    	//解析
		//var obj = eval( "(" + json + ")" );//转换后的JSON对象
		//alert(obj.tResourcesList.length);//json name
    	
    }

   

    //加载 图片,视频 选择页面 
    function load_targetDivContent(stype){
        
    	 if(stype==4||stype==6||stype==10||stype==12||stype==15){
        	 $('#targetId').hide();
        	 
         }else{

        	 $('#targetId').show();
         }
         
    	$('#targetDivContent').hide();
    	var url="";
        if(stype==1){
        	$('#targetDivContentFlip').hide();
        	$('#targetDivContentAppLeft').hide();
        	$('#targetDivContentImg').show();
        	$('#targetDivContentVideo').hide();
        	$('#targetDivContentHtml').hide();
        	$('#targetDivContentScene').hide();
        	$('#targetDivContentBroadcastLeft').hide();
        	$('#targetDivContentSerialPort').hide();
        	$('#targetDivContentTxt').hide();

        	
        	$('#targetDivContentClient').hide();
        	$("#clientClickTypeDiv").hide();
        	$("#touchOnclickDivId1").hide();
   	        //ajax请求获取数据
            ajaxGetSucaiData(0,"","scGroupComboboxImg",4,"dgImg");
   	    

        }else if(stype==2){
        	$('#targetDivContentFlip').hide();
        	$('#targetDivContentAppLeft').hide();
        	$('#targetDivContentImg').hide();
        	$('#targetDivContentVideo').show();
        	$('#targetDivContentHtml').hide();
        	$('#targetDivContentScene').hide();
        	$('#targetDivContentBroadcastLeft').hide();
        	$('#targetDivContentSerialPort').hide();
        	$('#targetDivContentTxt').hide();
        	//url="totouchscadd.vs?sucai.type=3";
        	//getPart(url, 'targetDivContentVideoLeft');
        	$('#targetDivContentClient').hide();
        	$("#clientClickTypeDiv").hide();
        	$("#touchOnclickDivId1").hide();
            ajaxGetSucaiData(0,"","scGroupComboboxVideo",3,"dgScVideo");
            
        	
        }else if(stype==3){
        	$('#targetDivContentFlip').hide();
        	$('#targetDivContentImg').hide();
        	$('#targetDivContentVideo').hide();
        	$('#targetDivContentAppLeft').hide();
        	$('#targetDivContentScene').hide();
        	$('#targetDivContentHtml').show();
        	$('#targetDivContentBroadcastLeft').hide();
        	$('#targetDivContentSerialPort').hide();
        	$('#targetDivContentTxt').hide();
        	$('#targetDivContentClient').hide();
        	$("#clientClickTypeDiv").hide();
        	$("#touchOnclickDivId1").hide();
        	        	
        }else if(stype==6){
        	$('#targetDivContentFlip').hide();
        	$('#targetDivContentImg').hide();
        	$('#targetDivContentVideo').hide();
        	$('#targetDivContentHtml').hide();
        	$('#targetDivContentScene').hide();
        	$('#targetDivContentAppLeft').show();
        	$('#targetDivContentBroadcastLeft').hide();
        	$('#targetDivContentSerialPort').hide();
        	$('#targetDivContentTxt').hide();
        	$('#targetDivContentClient').hide();
        	$("#clientClickTypeDiv").hide();
        	$("#touchOnclickDivId1").hide();
        	
        }else if(stype==4){
        	$('#targetDivContentFlip').hide();
        	$('#targetDivContentImg').hide();
        	$('#targetDivContentVideo').hide();
        	$('#targetDivContentAppLeft').hide();
        	$('#targetDivContentHtml').hide();     
        	$('#targetDivContentScene').show();
        	$('#targetDivContentBroadcastLeft').hide();
        	$('#targetDivContentSerialPort').hide();
        	$('#targetDivContentTxt').hide();

        	$('#targetDivContentClient').hide();
        	$("#clientClickTypeDiv").hide();
        	$("#touchOnclickDivId1").hide();
        	url="totouchscene.vs?editTouchtResources=<ww:property value='editTouchInteractive.tResources' />";
        	getPart(url, 'targetDivContentSceneLeft');

        }else if(stype==10){
        	$('#targetDivContentFlip').hide();
        	$('#targetDivContentImg').hide();
        	$('#targetDivContentVideo').hide();
        	$('#targetDivContentHtml').hide();
        	$('#targetDivContentScene').hide();
        	$('#targetDivContentAppLeft').hide();
        	$('#targetDivContentBroadcastLeft').show();
        	$('#targetDivContentSerialPort').hide(); 
        	$('#targetDivContentTxt').hide();

        	$('#targetDivContentClient').hide();
        	$("#clientClickTypeDiv").hide();
        	$("#touchOnclickDivId1").hide();
        	var tResources="<ww:property value='editTouchInteractive.tResources'/>";

        	if(isChn(tResources)){
               
        		if(tResources==""){
        			$('#broadcastNumber').numberspinner('setValue', 1);  
                }else{
                	$("#broadcastNumber").numberspinner('setValue',tResources);
                }
                
        		
        		
            }
        	
        	var tTouchReturnTime="<ww:property value='editTouchInteractive.tTouchReturnTime'/>";

        	
        	if(isChn(tTouchReturnTime)){
            
            	if(tTouchReturnTime==""){
            		$("#tTouchReturnTime").numberbox('setValue',-1);
                }else{
                	$("#tTouchReturnTime").numberbox('setValue',tTouchReturnTime);
                }
        		
            }else{

            	$("#tTouchReturnTime").numberbox('setValue',-1);
            }
            
        }else if(stype==12){
        	$('#targetDivContentFlip').hide();
        	$('#targetDivContentImg').hide();
        	$('#targetDivContentVideo').hide();
        	$('#targetDivContentAppLeft').hide();
        	$('#targetDivContentScene').hide();
        	$('#targetDivContentHtml').hide();
        	$('#targetDivContentBroadcastLeft').hide();
        	$('#targetDivContentSerialPort').show();
        	$('#targetDivContentTxt').hide();
        	$('#targetDivContentClient').hide();
        	//targetDivContentTxt
        	$("#clientClickTypeDiv").hide();
        	$("#touchOnclickDivId1").hide();
        	
        }else if(stype==11){
        	$('#targetDivContentFlip').hide();
        	$('#targetDivContentImg').hide();
        	$('#targetDivContentVideo').hide();
        	$('#targetDivContentAppLeft').hide();
        	$('#targetDivContentScene').hide();
        	$('#targetDivContentHtml').hide();
        	$('#targetDivContentBroadcastLeft').hide();
        	$('#targetDivContentSerialPort').hide();
        	$('#targetDivContentTxt').show();
        	$('#targetDivContentClient').hide();
        	$("#clientClickTypeDiv").hide();
        	$("#touchOnclickDivId1").hide();
        	ajaxGetSucaiData(0,"","scGroupComboboxTxt",10,"dgScTxt");

        	

        	var txtTresources="<ww:property value='editTouchInteractive.tResources'/>";

        	if(txtTresources!=""){
            	
        		txtTresources=txtTresources.replace(/&quot;/g,"\"");
        		 
                //转换成touch对象组
    		    var objs = eval( "(" + txtTresources + ")" );//转换后的JSON对象

                //显示内容
    		    $("#yxlist").html(objs[0].txtcontent); 

    		    //字体类型
    		    $("#fonttype").val(objs[0].ziti);


    		    var fbold=$("#fbold").val(); //加粗(0否 1是)
    		    if(fbold==1){
    		    	bold();
        		}
    		    var fitallic=$("#fitallic").val();
    		    if(fitallic==1){
    		    	itallic();
        		}
    		    var setline=$("#setline").val();
    		    if(setline==1){
    		    	setline();
        		}
    		    var setstrike=$("#setstrike").val();
    		    if(setstrike==1){
    		    	setstrike();
        		}
    		    
    		    //字体大小
    		    
    		    
    		    //获取字距
    		

    		    //背景颜色

    		    //字体颜色

    		    //加粗

    		    //文本斜体

    		    //下划线

    		    //中划线

            }

        	
		    
        	

 	       //字体类型
 	       var  fonttype=document.getElementById("fonttype").options[document.getElementById("fonttype").options.selectedIndex].value;
 	       fonttype2(fonttype); 
 	   	 

 	       var advancedType="<ww:property value='advancedType' />";
            
 	   	   if(advancedType=="1"){
 	 	   	   
 	   	    	     document.getElementById("txtFontSizeAdvancedCheckBox").checked=true;
 	   	    	     //获取字体大小
 	     	         var fonsize=document.getElementById("txtFontSizeAdvancedSelect").options[document.getElementById("txtFontSizeAdvancedSelect").options.selectedIndex].value;
 	     	         
 	     	         fontsize2(fonsize);
 	       }else{

      		         //获取字体大小
 	     	         var fonsize=document.getElementById("txtfontsize").options[document.getElementById("txtfontsize").options.selectedIndex].value;
 	     	         
 	       		     fontsize2(fonsize);
 	     	       
 	       		     document.getElementById("txtFontSizeAdvancedCheckBox").checked=false;

 	        }
 	   	    setCheckBoxChange(); 

 	     

 	       //获取字距
 	       var lineH=document.getElementById("lineH").options[document.getElementById("lineH").options.selectedIndex].value;
 	       gethsign(lineH);
 	       
 	       //背景颜色
 	       var backcolor=document.getElementById("backcolor").options[document.getElementById("backcolor").options.selectedIndex].value;
 	       //alert(backcolor)
 	       setbackcolor(backcolor);

 	       //字体颜色
 	       var fontcolor=document.getElementById("fontcolor").options[document.getElementById("fontcolor").options.selectedIndex].value;
 	       setcolor(fontcolor);

 	       
 	       

        }else if(stype==14){
        	$('#targetDivContentFlip').show();
        	$('#targetDivContentAppLeft').hide();
        	$('#targetDivContentImg').hide();
        	$('#targetDivContentVideo').hide();
        	$('#targetDivContentHtml').hide();
        	$('#targetDivContentScene').hide();
        	$('#targetDivContentBroadcastLeft').hide();
        	$('#targetDivContentSerialPort').hide();
        	$('#targetDivContentTxt').hide();
        	$('#targetDivContentClient').hide();
        	$("#clientClickTypeDiv").hide();
        	$("#touchOnclickDivId1").hide();
   	        //ajax请求获取数据
            ajaxGetSucaiData(0,"","scGroupComboboxFlip",4,"dgFlip");
            
            

        }else if(stype==15){
        	$('#targetDivContentFlip').hide();
        	$('#targetDivContentImg').hide();
        	$('#targetDivContentVideo').hide();
        	$('#targetDivContentAppLeft').hide();
        	$('#targetDivContentHtml').hide();     
        	$('#targetDivContentScene').hide();
        	$('#targetDivContentBroadcastLeft').hide();
        	$('#targetDivContentSerialPort').hide();
        	$('#targetDivContentTxt').hide();
        	$('#targetDivContentClient').show();
        	$("#clientClickTypeDiv").show();
        	$("#touchOnclickDivId1").hide();
        	//url="totouchscene.vs?editTouchtResources=<ww:property value='editTouchInteractive.tResources' />";
        	//getPart(url, 'targetDivContentSceneLeft');

        	//终端列表
            ajaxGetClientData(0,"","scGroupComboboxClient","dgClient");
        	
        	
        	
        	//普通节目列表
        	url="totouchscene.vs?itemType=1&editTouchtResources=<ww:property value='editTouchInteractive.tResources' />";
        	getPartFalse(url, 'dgSelClientCommonItem');


        	//节目列表
        	url="totouchscene.vs?editTouchtResources=<ww:property value='editTouchInteractive.tResources' />";
        	getPart(url, 'dgSelClientItem');
        	

        }else if (stype==16) {
       	                   
        	$('#targetDivContentFlip').hide();
        	$('#targetDivContentImg').hide();
        	$('#targetDivContentVideo').hide();
        	$('#targetDivContentHtml').hide();
        	$('#targetDivContentScene').hide();
        	$('#targetDivContentAppLeft').hide();
        	$('#targetDivContentBroadcastLeft').hide();
        	$('#targetDivContentSerialPort').hide();
        	$('#targetDivContentTxt').hide();
        	$('#targetDivContentClient').hide();
        	$("#clientClickTypeDiv").hide();       	
        	$("#touchtriggerType").hide(); 
            $("#touchOnclickDivId1").show();
        		  			  		
        		
		}else{
        	$('#targetDivContentFlip').hide();
        	$('#targetDivContentImg').hide();
        	$('#targetDivContentVideo').hide();
        	$('#targetDivContentAppLeft').hide();
        	$('#targetDivContentScene').hide();
        	$('#targetDivContentHtml').hide();
        	$('#targetDivContentBroadcastLeft').hide();
        	$('#targetDivContentSerialPort').hide();
        	$('#targetDivContentTxt').hide();
        	$("#clientClickTypeDiv").hide();
        	$("#touchOnclickDivId1").hide();
        }

     	//加载已选列表
    
        if(tResourcesListJson!=""){
            
        	tResourcesListJson=tResourcesListJson.replace(/&quot;/g,"\"");
        	
            //转换成touch对象组
		    var objs = eval( "(" + tResourcesListJson + ")" );//转换后的JSON对象
		  
		    var  obj; 
		    for(var i=0;i<objs.length;i++){
			    if(stype==1){
			    	$('#dg').datagrid('appendRow',{

	                    tScName:objs[i].sname,
			        	tScTime:objs[i].timeoutMillis,
			        	tScTx:objs[i].inAnim,
			        	tScFileName:objs[i].path
			        	   
	                });

				}else if(stype==2){
							
					$('#dgVideo').datagrid('appendRow',{

					    tScNameVideo:objs[i].sname,
			        	tScFileNameVideo:objs[i].path,
			        	tScVol:objs[i].mVol
			        	   
	                });
			   }else if(stype==3){

					
					$('#dgHtml').datagrid('appendRow',{

						tHtmlUrl:objs[i].htmlUrl,
						tHtmlQtime:objs[i].htmlQtime,
						mShowNavigation:objs[i].mShowNavigation,
						mShowPCWeb:objs[i].mShowPCWeb
						
	                });
			   }else if(stype==14){
				   
				    if(i==0){

				    	     var isShowIndexInit=objs[i].isShowIndex;

			    		    if(isShowIndexInit==1){
				    		    
			    		    	$("#isShowIndex").attr("checked",true);//选中

				    		}
					}
					
			    	$('#dgSelFlip').datagrid('appendRow',{

	                    tScName:objs[i].sname,
			        	tScFileName:objs[i].path
			        	   
	                });

				}
		    	
			} 
		    tResourcesListJson="";

        }


     
        
        
    	
    }

    /*预览*/
    function yulan(url,stype){ 
        
       	 layer.open({
       	 	    type: 2,
       	 	    title: false,
       	 	    area: ['680px', '530px'],
       	 	    shade: 0.1,
       	 	    closeBtn: 0,
       	 	    shadeClose: true,
       	 	    shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
       	 	    content: url
       	  });
         
    	
    }




	 /*加到列表事件图片*/
	 function addTouchMuti(type){
		var selRows=new Array();
		if(type==1){

			   //获取素材列表已选
	    	  selRows = $('#dgImg').datagrid('getChecked');
	    	 
	    	  $('#dgImg').datagrid('clearSelections');

	    }else if(type==2){
	    	
	    	  selRows = $('#dgScVideo').datagrid('getChecked');
	    	  $('#dgScVideo').datagrid('clearSelections');
	    	
		}else if(type==3){
			
			   //获取网页地址
			   var aHtmlUrl=$("#aHtmlUrl").val();
			   if(aHtmlUrl.length==0){
				  alert("<ww:property value='#session.local.a00722' />"); 
                  return;
			   }
			   //获取切换时间
			   var aHtmlAtime=$("#aHtmlAtime").val();
			   if(aHtmlAtime.length==0){
				   alert("<ww:property value='#session.local.a00287' />");
				   return;
			   }
			   
			   $('#dgHtml').datagrid('appendRow',{
				   tHtmlUrl:aHtmlUrl,
				   tHtmlQtime:aHtmlAtime,
				   mShowNavigation:$('input[name="mShowNavigation"]:checked').val(),
				   mShowPCWeb:$('input[name="mShowPCWeb"]:checked').val()
				   
               });
               return;

	    }else if(type==10){
	    	
	    	  
	    	  //获取素材列表已选
	    	  selRows = $('#dgScTxt').datagrid('getChecked');

	    	  $('#dgScTxt').datagrid('clearSelections');
	    	  
	    	  for(var i=0;i<selRows.length;i++){

	    		  var font =document.getElementById("yxlist");
	    		  
	         	  font.focus();

	         	  var txtContent=selRows[i].tScTxtContent;
  
	         	  txtContent=txtContent.replace(/&lt;/g,"<");
	         	  
	         	  txtContent=txtContent.replace(/&gt;/g,">");
	         	 
	        	  document.getElementById("yxlist").innerHTML=txtContent;
	        	  
	    		  
	          }
	    }else if(type==14){

			   //获取素材列表已选
	    	  selRows = $('#dgFlip').datagrid('getChecked');
	    	 
	    	  $('#dgFlip').datagrid('clearSelections');

	    }else if(type==15){

			   //获取素材列表已选
	    	  selRows = $('#dgClient').datagrid('getChecked');
	    	 
	    	  $('#dgClient').datagrid('clearSelections');

	    }

		if(type!=10){

		    for(var i=0;i<selRows.length;i++){
			{
			 	 
			          if(type==1){
				          
			        	  //创建tr
				          $('#dg').datagrid('appendRow',{
				        	   tScName:selRows[i].tScName,
				        	   tScTime:5,
				        	   tScTx:'6',
				        	   tScFileName:selRows[i].tScFileName
			               });

				      }else if(type==2){

				    	//创建tr
				          $('#dgVideo').datagrid('appendRow',{
				        	   tScNameVideo:selRows[i].tScName,
				        	   tScFileNameVideo:selRows[i].tScFileName,
				        	   tScVol:'100'
			               });
				       
		              }else if(type==14){
				          
			        	  //创建tr
				          $('#dgSelFlip').datagrid('appendRow',{
				        	   tScName:selRows[i].tScName,
				        	   tScFileName:selRows[i].tScFileName
			               });

				      }else if(type==15){
				          
			        	  //创建tr
				          $('#dgSelClient').datagrid('appendRow',{
				        	   tClientName:selRows[i].tClientName,
				        	   tClientMark:selRows[i].tClientMark
			               });

				      }
					  //$('#dg').datagrid('acceptChanges');
			          //$('#dg').datagrid('enableDnd');	          
			   }
			   if(type!=15){
				   onMousePreView();
			   }
			   
			         
			 }
	    }
	
	 }

	 


	 //上移
	 function MoveUp(type) {
         var dg='';
		 if(type==1){
             dg='dg';
		 }else if(type==2){
			 dg='dgVideo';
	     }else if(type==3){
             dg='dgHtml';
		 }else if(type==14){
             dg="dgSelFlip";
	     }

  	     var rows = $("#"+dg).datagrid("getRows");
  	     if(rows.length<1)
	     {
	        return;
	     }
	     
	     var row = $("#"+dg).datagrid('getSelected');
	     var index = $("#"+dg).datagrid('getRowIndex', row);
	     mysort(index, 'up',dg);  
	 }
	 //下移
	 function MoveDown(type) {
		 var dg='';
		 if(type==1){
             dg='dg';
		 }else if(type==2){
			 dg='dgVideo';
	     }else if(type==3){
             dg='dgHtml';
		 }else if(type==14){
             dg="dgSelFlip";
	     }

		 var rows = $("#"+dg).datagrid("getRows");
  	     if(rows.length<1)
	     {
	        return;
	     }

	     
	     var row = $("#"+dg).datagrid('getSelected');
	     var index = $("#"+dg).datagrid('getRowIndex', row);
	     mysort(index, 'down', dg); 
	 }
	 function mysort(index, type, gridname) {
	     if ("up" == type) {
	         if (index != 0) {
	             var toup = $('#' + gridname).datagrid('getData').rows[index];
	             var todown = $('#' + gridname).datagrid('getData').rows[index - 1];
	             $('#' + gridname).datagrid('getData').rows[index] = todown;
	             $('#' + gridname).datagrid('getData').rows[index - 1] = toup;
	             $('#' + gridname).datagrid('refreshRow', index);
	             $('#' + gridname).datagrid('refreshRow', index - 1);
	             $('#' + gridname).datagrid('selectRow', index - 1);
	         }
	     } else if ("down" == type) {
	         var rows = $('#' + gridname).datagrid('getRows').length;
	         if (index != rows - 1) {
	             var todown = $('#' + gridname).datagrid('getData').rows[index];
	             var toup = $('#' + gridname).datagrid('getData').rows[index + 1];
	             $('#' + gridname).datagrid('getData').rows[index + 1] = todown;
	             $('#' + gridname).datagrid('getData').rows[index] = toup;
	             $('#' + gridname).datagrid('refreshRow', index);
	             $('#' + gridname).datagrid('refreshRow', index + 1);
	             $('#' + gridname).datagrid('selectRow', index + 1);
	         }
	     }
	  
	 }
	 //设置所有播放时长(秒)
	 function setPlayAll(type){
		if(type==1){
			 $('#win-time').window('open');
		}
		if(type==2){

			$('#txAll').combobox({
				data:txs,
				valueField:'value',
				textField:'text',
				value:"6"  //默认选中value指定的选项
			});

			$('#win-tx').window('open');
		 }
		 if(type==3){
			 $('#win-qtime-html').window('open');
	     }

	     if(type==4){

	    	 $('#volAll').combobox({
					data:vols,
					valueField:'value',
					textField:'text',
					value:"100"  //默认选中value指定的选项
			 });
				
	    	 $('#win-vol').window('open');

		 }
		
	}

	//修改图片全部切换时间
	function setPlayTimeImgSubmit(){
        if($('#qieAll').val().length==0){
              return;
        }

		 var rows=$("#dg").datagrid("getRows");
		 for(var i=0;i<rows.length;i++)
		 {
			   $('#dg').datagrid('updateRow',{
		        index: i,
		        row: {
		            'tScTime':$('#qieAll').val()
		           
		        }
		      });

		 }
		 
		
	    
	 
	   $('#win-time').window('close', true); 
    }

	//修改网页切换时间秒
	
     function setPlayQTimeHtmlSubmit(){
        
    	 if($('#qieHtmlAll').val().length==0){
             return;
         }

    	 
		 var rows=$("#dgHtml").datagrid("getRows");
		 for(var i=0;i<rows.length;i++)
		 {
			   $('#dgHtml').datagrid('updateRow',{
		        index: i,
		        row: {
		            'tHtmlQtime':$('#qieHtmlAll').val()
		           
		        }
		      });

		 }
	   $('#win-qtime-html').window('close', true); 
    }

	    

	//修改图片全部特效
	function setPlayTxSubmit(){  
        
		 var rows=$("#dg").datagrid("getRows");
		 for(var i=0;i<rows.length;i++)
		 {
			   $('#dg').datagrid('updateRow',{
		        index: i,
		        row: {
		            'tScTx':$('#txAll').combobox('getValue')
		        }
		      });

		 }		 
	   $('#win-tx').window('close', true); 
    }


	   //修改视频全部音量
	 function setPlayVolSubmit(){  
	        
			 var rows=$("#dgVideo").datagrid("getRows");
			 for(var i=0;i<rows.length;i++)
			 {
				   $('#dgVideo').datagrid('updateRow',{
			        index: i,
			        row: {
			            'tScVol':$('#volAll').combobox('getValue')
			        }
			      });

			 }		 
		   $('#win-vol').window('close', true); 
	  }

	  

	//清空素材列表数据
    function clearDgList(gridName){
  	 
        var sucais = $('#'+gridName).datagrid('getRows');
        if (sucais) {
             for (var i = sucais.length - 1; i >= 0; i--) {
                 var index = $('#'+gridName).datagrid('getRowIndex', sucais[i]);
                 $('#'+gridName).datagrid('deleteRow', index);
                 
             }
        }

    }

    //ajax请求获取素材数据   urlType 方式  0普通 1搜索 , urlSelValue 搜索关键词, scGroupId分组ID名    ,scType类型 , scTableGridId grid显示id 
    function ajaxGetSucaiData(urlType,urlSelValue,scGroupId,scType,scTableGridId){

    	  //分组id
	      var myOptValue = $("#"+scGroupId).combobox("getValue") ;

          //拼接data
          var aJaxUrlData="";
          if(urlType==0){
        	  aJaxUrlData="id=1&checkAjaxState=1"+"&gssi.sucaigroupid="+myOptValue+"&sucai.type="+scType;
          }else if(urlType==1){
              
        	  aJaxUrlData="id=1&checkAjaxState=1&sel=1&ser="+urlSelValue+"&gssi.sucaigroupid="+myOptValue+"&sucai.type="+scType;
          }
    	
 	     //ajax请求获取数据
         $.ajax({
				type:'post',
				url:'ajaxToItemSeeSucaiAction.vs',
				data:aJaxUrlData,
				dataType:'json',
				async:true,
				cache:true,
				success:function(data){
			       
                   //清空列表
 	    	      //clearDgList(scTableGridId);
 	    	      //隐藏鼠标悬浮
	    	      $("#preview").hide(); 

	    	      if(scType!=10){
	    	    	  $('#'+scTableGridId).datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(4,2,null,data));
	    	    	  onMousePreView();
		    	  }else{
		    		  $('#'+scTableGridId).datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(10,2,null,data));
			      }
	    	      
	    	   
			
				}
			});	

    }


    //鼠标悬浮预览绑定
    function onMousePreView(){
  		  
         
	    	 $(".datagrid-row").mouseover(function(){  
	              
	            var e = event || window.event;       
	  	        var url = $(this).children("td").eq(2).text();

	  	         
	  	        //alert(url)
	  	        if(url.indexOf(".jpg")!=-1||url.indexOf(".png")!=-1||url.indexOf(".gif")!=-1){
	  	        	
	 			       
	 			    
	  	        }else{

	  	        	 var ind=url.lastIndexOf(".");
	 				 var ads=url.substring(0,ind);
	 			     url=ads+'_.jpg';
			  	 }   
	  	       
	  	       
	  	        if (url == "") {
	  	        	 $("#preview").hide();   
	  	            //$("#show_img").attr("src", "${ctx}/images/person.jpg");  
	  	        } else {  
	  	            $("#show_img").attr("src", "files/" + url);
	  	            //$("#preview").css("top", ($(this).offset().top+10) + "px").css("left", ($(this).offset().left+e.clientX) + "px").show();
	  	            var clientY=e.clientY+5;
	  	            if(e.clientY+100>520){
	  	            	clientY=e.clientY-100;  
		  	        }
	  	            $("#preview").css("top", (clientY) + "px").css("left", (e.clientX+10) + "px").show();        
	  	        }
	  	         
	  	          
	  	    });  
		  	    
	    	$(".datagrid-row").mouseout(function(){  
	  	        $("#preview").hide();  
	  	    });  

	    	

    } 


    //智能返回
    function setSmartSubmit(setv){

    	//$('#broadcastNumber').numberspinner('setValue', setv);  
        
    	$("#tTouchReturnTime").numberbox('setValue',setv);
    }

    //选择触发类型
    function sel_triggerType_type(tVal){

    	  
          if(tVal==0){

        	  $('#portReceiveDiv').hide();
        	  
          }else if(tVal==1){

        	  $('#portReceiveDiv').show();

        	  //判断类型是不是文本
        	  var targetOnclickId=$('input[name="targetOnclickId"]:checked').val();

        	  //alert(targetOnclickId);
        	  
        	  if(targetOnclickId==11){

             	  $("#portReceiveDiv_checkbox_div").show();

             	  onclick_portReceiveDiv_checkbox();

              }else{
            	  
            	  $("#portReceiveDiv_checkbox_div").hide();
            	  
            	  $("#portReceiveDiv_show").hide();

            	  $("#portReceiveDiv_receive").show();
            	  
              }
        	  

          }

    }

    function onclick_portReceiveDiv_checkbox(){

    	     var  portReceiveDiv_checkbox_v=0;

    	     $('input[id="portReceiveDiv_checkbox"]:checked').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数  
    	          portReceiveDiv_checkbox_v=$(this).val();
    	     });

    	     if(portReceiveDiv_checkbox_v==0){

    	    	 
    	    	 $("#portReceiveDiv_receive").show();
    	    	 $("#portReceiveDiv_show").hide();
    	    	 

        	 }else{

        		 $("#portReceiveDiv_receive").hide();
    	    	 $("#portReceiveDiv_show").show();

    	    	 document.getElementById("yxlist").innerHTML="<ww:property value='#session.local.b00319' />";
             }
    	     
    	     

    }



    //选择链接终端类型
    function sel_client_click_type(tVal){

        
      	 if(tVal==0){

      		  $('#dgSelClientItemDiv').hide();
	       	  $('#dgSelClientItemDiv').panel('close');
	       	  $('#dgSelClientPortDiv').panel('close');
	       	  $('#dgSelClientCommonItemDiv').panel('open');
	       	  $('#dgSelClientCommonItemDiv').show();
       	   

         }else if(tVal==1){

        	  $('#dgSelClientItemDiv').show();
        	  $('#dgSelClientItemDiv').panel('open');
        	  $('#dgSelClientPortDiv').panel('close');
        	  $('#dgSelClientCommonItemDiv').panel('close');
        	  $('#dgSelClientCommonItemDiv').hide();

        	  
          }else if(tVal==4){

        	  $('#dgSelClientPortDiv').panel('open');
        	  $('#dgSelClientItemDiv').panel('close');
        	  $('#dgSelClientCommonItemDiv').panel('close');
        	  $('#dgSelClientCommonItemDiv').hide();
           }else{

         	  $('#dgSelClientCommonItemDiv').hide();
        	  $('#dgSelClientItemDiv').hide();
        	  $('#dgSelClientItemDiv').panel('close');
        	  $('#dgSelClientPortDiv').panel('close');
        	  $('#dgSelClientCommonItemDiv').panel('close');

          }	

    }



    //ajax请求获取终端数据   urlType 方式  0普通 1搜索 , urlSelValue 搜索关键词, scGroupId分组ID名    ,scTableGridId grid显示id 
    function ajaxGetClientData(urlType,urlSelValue,scGroupId,scTableGridId){

    	  //分组id
	      var myOptValue = $("#"+scGroupId).combobox("getValue") ;

          //拼接data
          var aJaxUrlData="";
          if(urlType==0){

        	  aJaxUrlData="id=1&checkAjaxState=1"+"&clientGroupId="+myOptValue;
        	  
          }else if(urlType==1){
              
        	  aJaxUrlData="id=1&checkAjaxState=1&sel=1&ser="+urlSelValue+"&clientGroupId="+myOptValue;
          }
    	
 	     //ajax请求获取数据
         $.ajax({
				type:'post',
				url:'ajaxToClientAction.vs',
				data:aJaxUrlData,
				dataType:'json',
				async:true,
				cache:true,
				success:function(data){
			       
                   //清空列表
 	    	      //clearDgList(scTableGridId);
 	    	     //隐藏鼠标悬浮
	    	      $("#preview").hide(); 
	    	      
                  $('#'+scTableGridId).datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(11,2,null,data));
 
				}
			});	

    }
        		 
</script>
</head>
<body onload="onload_touch_type(1)">
    
   
    

    <form method="post" name="form1" action="">
       <div class="panel panel-primary" style="margin: 3px 3px;">
           <div class="panel-heading">
                <ww:property value="#session.local.a00729"/> <!-- 触摸互动 -->
           </div>
          <div class="container clearfix" style="margin: 10px 10px;">
          <div class="main-wrap" style="width:850px;">
		      <div class="result-wrap">
		          <div class="result-content">
		            <table class="insert-tab" width="100%" style="">
			           <tr >
			            <td  style="width: 15%;height: 40px;padding-left: 10px;"><ww:property value="#session.local.a00733"/>:</td><!-- 当前元素id -->
			            <td  style="width: 25%;padding-left: 10px;">
			               <ww:property value="currentdivid"/>
			               <input type="hidden" value="<ww:property value='currentdivid'/>" id="currentdivid"/>
			            </td>
			             <td style="padding-left: 5px;">
			                     
				                <div id="touchOnclickDivId" style="float: left;margin-right:5px;">
				                                     
				                </div>
				                
				                <div id="touchOnclickPwdDiv" style="float: left;margin-left: 5px;">
					                                           设置跳转密码 :  
					                <input type="checkbox" id="mOclickPwdFlag" name="mOclickPwdFlag"   <ww:if test="editTouchInteractive.mOclickPwdFlag==1"> checked="checked"  </ww:if> value="1"/>                          
					                <input type="text"  id="mOclickPwd" name="mOclickPwd"  value="<ww:property value='editTouchInteractive.mOclickPwd'  />" style="width: 100px;"/>
				                </div>
				                
				            </td>
			           </tr>
			          
			           <tr>
				            <td  style="width: 15%;height: 40px;padding-left: 10px;"><ww:property value="#session.local.a00735"/>:<!-- 目标触摸类型 --></td>
				            <td colspan="2" id="step1" style="width: 70%;padding-left: 10px;">
				                 
				                 <!--  <select id="targetOnclickId" onchange="sel_touch_type(this.value)">
				                     <option  <ww:if test="editTouchInteractive.tType==5">selected="selected" </ww:if>   value="5"><ww:property value="#session.local.a00736"/></option>
				                     <option  <ww:if test="editTouchInteractive.tType==1">selected="selected" </ww:if>   value="1"><ww:property value="#session.local.a00061"/></option> 
                                     <option  <ww:if test="editTouchInteractive.tType==2">selected="selected" </ww:if>   value="2"><ww:property value="#session.local.a00060"/></option> 
				                     <option  <ww:if test="editTouchInteractive.tType==3">selected="selected" </ww:if>   value="3"><ww:property value="#session.local.a00189"/></option>
				                     <option  <ww:if test="editTouchInteractive.tType==4">selected="selected" </ww:if>   value="4"><ww:property value="#session.local.a00755"/></option>
				                     <option  <ww:if test="editTouchInteractive.tType==6">selected="selected" </ww:if>   value="6"><ww:property value="#session.local.a00629"/></option> 
				                  </select>
				                  -->
				                  <input onclick="sel_touch_type(this.value)" <ww:if test="editTouchInteractive.tType==5"> checked="checked" </ww:if> name="targetOnclickId" value="5" type="radio"/><ww:property value="#session.local.a00736"/><!-- 事件/动作 -->&nbsp;&nbsp;
				                  <input onclick="sel_touch_type(this.value)" <ww:if test="editTouchInteractive.tType==1"> checked="checked" </ww:if> name="targetOnclickId" value="1" type="radio"/><ww:property value="#session.local.a00061"/><!-- 图片 -->&nbsp;&nbsp;
				                  <input onclick="sel_touch_type(this.value)" <ww:if test="editTouchInteractive.tType==2"> checked="checked" </ww:if> name="targetOnclickId" value="2" type="radio"/><ww:property value="#session.local.a00060"/><!-- 视频 -->&nbsp;&nbsp;
				                  <input onclick="sel_touch_type(this.value)" <ww:if test="editTouchInteractive.tType==3"> checked="checked" </ww:if> name="targetOnclickId" value="3" type="radio"/><ww:property value="#session.local.a00189"/><!-- 网页 -->&nbsp;&nbsp;
				                  <input onclick="sel_touch_type(this.value)" <ww:if test="editTouchInteractive.tType==4"> checked="checked" </ww:if> name="targetOnclickId" value="4" type="radio"/><ww:property value="#session.local.a00755"/><!-- 链接节目 -->&nbsp;&nbsp;
				                  <input onclick="sel_touch_type(this.value)" <ww:if test="editTouchInteractive.tType==6"> checked="checked" </ww:if> name="targetOnclickId" value="6" type="radio"/><ww:property value="#session.local.a00629"/><!-- app跳转 -->&nbsp;&nbsp;
				                  <input onclick="sel_touch_type(this.value)" <ww:if test="editTouchInteractive.tType==10"> checked="checked" </ww:if> name="targetOnclickId" value="10" type="radio"/><ww:property value="#session.local.b00101"/><!-- 广播跳转 -->&nbsp;&nbsp;
				                  <input onclick="sel_touch_type(this.value)" <ww:if test="editTouchInteractive.tType==11"> checked="checked" </ww:if> name="targetOnclickId" value="11" type="radio"/><ww:property value="#session.local.b00254"/><!-- 文本 -->&nbsp;&nbsp;
				                  <input onclick="sel_touch_type(this.value)" <ww:if test="editTouchInteractive.tType==12"> checked="checked" </ww:if> name="targetOnclickId" value="12" type="radio"/><ww:property value="#session.local.b00255"/><!-- 发送串口-->&nbsp;&nbsp;
				                  <input onclick="sel_touch_type(this.value)" <ww:if test="editTouchInteractive.tType==14"> checked="checked" </ww:if> name="targetOnclickId" value="14" type="radio"/><ww:property value="#session.local.b00320"/><!-- 翻书-->&nbsp;&nbsp;
				                  <input onclick="sel_touch_type(this.value)" <ww:if test="editTouchInteractive.tType==15"> checked="checked" </ww:if> name="targetOnclickId" value="15" type="radio"/><ww:property value="#session.local.b00376"/><!-- 链接终端-->&nbsp;&nbsp;
				           		  <input onclick="sel_touch_type(this.value)" <ww:if test="editTouchInteractive.tType==16"> checked="checked" </ww:if> name="targetOnclickId" value="16" type="radio"/><ww:property value="#session.local.a00461"/><!-- 音量-->&nbsp;&nbsp;
				            </td>
				          
			           </tr>
			          
			           <tr>
			            <td  style="width: 15%;height: 40px;padding-left: 10px;"><ww:property value="#session.local.a00734"/>:<!-- 目标显示区域id --></td>
			            <td  colspan="2"  style="width: 25%;padding-left: 10px;">
			            
			                  <div style="float:left; ">
				                  <select id="targetId" onchange="onload_touch_type(2)" >
				                     <ww:iterator value="#request.touchIdList"  id="tId">
				                        <option <ww:if test="#request.editTouchInteractive.tTargetId==#tId">selected="selected"</ww:if> value="<ww:property value='#tId'/>">
				                           <ww:property value="#tId"/>
				                        </option>   
				                     </ww:iterator>
				                       
				                  </select>
			           			       </div>
			                     <div id="touchOnclickDivId1" style="float: left;margin-right:5px;display: none;" >			            		     
			                       <!-- 音量-->  <ww:property value="#session.local.b00259"/>:
				                   <select id="touchOnclickVol">
					                 <option value="19"   <ww:if test='touchInteractive.tOnclick==19'>selected="selected"</ww:if>  >
					                     <!-- 音量增加 -->
					                     <ww:property value="#session.local.c00067"/>
					                  	
					                 </option>
					                 <option value="18" <ww:if test='touchInteractive.tOnclick==18'>selected="selected"</ww:if>>
					                     <!--音量减少 -->
					                     <ww:property value="#session.local.c00068"/>
					                      	
					                 </option>
					               </select>         
				              </div>
			                  <div style="float:left; margin-left: 20px;" id="touchtriggerType">
			                                                             
			                       <ww:property value="#session.local.b00259"/>
			                       <!-- 触发方式--> :
				                   <select   onchange="sel_triggerType_type(value)" id="triggerType">
					                 <option value="0"   <ww:if test='editTouchInteractive.triggerType==0'>selected="selected"</ww:if>  >
					                     <!-- 单击 -->
					                     <ww:property value="#session.local.b00260"/>
					                 </option>
					                 <option value="1" <ww:if test='editTouchInteractive.triggerType==1'>selected="selected"</ww:if>>
					                     <!-- 串口接收 -->
					                     <ww:property value="#session.local.b00256"/>
					                 </option>
					               </select>   
					                                   
				             </div>
				             
				             
				             <div style="float:left; margin-left: 20px;" id="clientClickTypeDiv">
			                                                             
			                       <ww:property value="#session.local.a00035"/>
			                       <!-- 类型 --> :
				                   <select onchange="sel_client_click_type(value)" id="clientClickType">
				                      <option   <ww:if test='editTouchInteractive.clientClickType==0'>selected="selected"</ww:if>   value="0"><ww:property value="#session.local.a00609" /></option><!--  普通节目  -->
					                  <option   <ww:if test='editTouchInteractive.clientClickType==1'>selected="selected"</ww:if>   value="1"><ww:property value="#session.local.a00434" /></option><!--  互动节目  -->
					                  <option   <ww:if test='editTouchInteractive.clientClickType==2'>selected="selected"</ww:if>   value="2"><ww:property value="#session.local.a00488" /></option><!-- 待机 -->
					                  <option   <ww:if test='editTouchInteractive.clientClickType==3'>selected="selected"</ww:if>   value="3"><ww:property value="#session.local.a00487" /></option> <!-- 唤醒 -->
					                  <option   <ww:if test='editTouchInteractive.clientClickType==4'>selected="selected"</ww:if>   value="4"><ww:property value="#session.local.b00255" /></option> <!-- 发送串口 -->
					               </select>   
					                                   
				             </div>
				             
				             
			                 
			                 
			                  
				             <div id="portReceiveDiv" style="float:left;margin-left:20px;display:none;">
				                    
				                    
				                    <div id="portReceiveDiv_checkbox_div" style="float:left;margin-left:20px;display: none;">  
                                        
                                        <!--显示串口数据-->
                                        <ww:property value="#session.local.b00317"/>        
				                        <input   <ww:if test='editTouchInteractive.portReceiveCheckboxV==1'> checked="checked" </ww:if>  onclick="onclick_portReceiveDiv_checkbox()" value="1" id="portReceiveDiv_checkbox" type="checkbox" />
				                     
				                    </div>
				                   
				                   <div id="portReceiveDiv_receive" style="float:left;margin-left:20px;display: none;"> 
				                       
				                       <ww:property value="#session.local.b00257"/>                                 
				                       <input   id="portReceive"  type="text"  value="<ww:property value='editTouchInteractive.triggerType' />" style="width: 80px;"  />
				                       
				                   </div>  
				                      
				                  
					               <div id="portReceiveDiv_show" style="float:left;margin-left:20px;display: none;">  
					               &nbsp;&nbsp;
<!--					                                         头-->
					               <ww:property value="#session.local.b00318"/>        
					               <input type="text" id="portReceive_head"  value="<ww:property value='editTouchInteractive.portReceiveHead' />" style="width: 80px;"/>
					               &nbsp;&nbsp;
					               <div style="display: none;">
					                                         尾                                  
					               <input type="text" id="portReceive_tail"  value="<ww:property value='editTouchInteractive.portReceiveTail' />"  style="width: 80px;"/>
					               </div>
					               
					               </div>
					               
					               
				             </div>
				                    
			            </td>
			            
			            
			          
				            
			           </tr>
			           
			      
			           
			         
			           
			           <tr style="height: 320px;">
			            <td  colspan="3"  style="padding-left: 20px;">
			                   <div id="targetDivContent" style="display: none;">
			                        
			                      
			                   </div>
			                   
			                   <div id="targetDivContentImg" style="display: none;padding-top: 10px">
			                        <div id="targetDivContentImgLeft" class="am_right scrollbar-hover" style="height: 320px;width:350px;float: left;">
                                         <div style="height: 310px;">   
                                          <table id="dgImg" class="easyui-datagrid"  title="<ww:property value='#session.local.b00017'/>" style="width:350px;height:310px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: false,
												toolbar: '#tb0',
												method: 'get',
												nowrap:true	,
												selectOnCheck:true,
												checkOnSelect:true,
												multiple: true,
												pagination: true,
												fit:true
											">
							                <thead>
								                    <tr>
								                        <th data-options="field:'ck',checkbox:true"></th>
														<th data-options="field:'tScName',width:280"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
														<th data-options="field:'tScFileName',hidden:true"></th>
									        	    </tr>
							                 </thead>
			                              </table>
			                              </div>
			                              <div id="tb0" style="height:auto;line-height: 0px;">
												
												<div>
													<ww:property value='#session.local.b00014'  />:<!-- 分组 --> 
													<select  id="scGroupComboboxImg"  class="easyui-combobox" panelHeight="auto" style="width:100px;height: 20px;">
														<option <ww:if test="gssi.sucaigroupid==0">selected="selected" </ww:if>  value="0"><ww:property value='#session.local.a00815'  /></option> <!-- 全部 -->
														<option <ww:if test="gssi.sucaigroupid==-1">selected="selected" </ww:if>  value="-1"><ww:property value='#session.local.b00015'  /></option><!-- 共享 -->
														<ww:iterator value="listsfgpimg">
														       <option  <ww:if test="gssi.sucaigroupid==id">selected="selected" </ww:if>  value="<ww:property value='id'  />"><ww:property value="name"  /></option>
														</ww:iterator>
													</select>
													<input id="ser" class="easyui-searchbox" data-options="prompt:'<ww:property value='#session.local.a00071'  />',searcher:doSearchImg" style="width:100px;height: 20px;"></input>
													
<!--													<a style="height: 20px;" title="<ww:property value='#session.local.a00063' />" href="javascript:open_item_sucai_onload('upimg.jsp')" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick=""></a>-->
	
													<script>
													    //分组combobox事件
													    $("#scGroupComboboxImg").combobox({
													    	onChange : function(){
													    	    
													    		  //ajax请求获取数据
													              ajaxGetSucaiData(0,"","scGroupComboboxImg",4,"dgImg");
													              												    	   
													    	}
														}); 

													    //搜索
														function doSearchImg(value,name){
                                                                   
															      ajaxGetSucaiData(1,value,"scGroupComboboxImg",4,"dgImg");
															    
														}
														
													</script>
												</div>
										   </div>
                                          
                                          
                                          

                                    </div>
			                       
								    <div class="part2_2 part2_2_3" style="float: left;margin-right: 0px; margin-top: 80px;width: 50px;">
										
											
											<button id="step4" onclick="addTouchMuti(1)" class="btn btn-primary"   title="<ww:property value='#session.local.a00270' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-right " ></i>
								            
								            </button>
											<!--添加到已选列表  -->
											
											
											<button style="margin-top: 15px;" onclick="MoveUp(1)" class="btn btn-primary"   title="<ww:property value='#session.local.a00268' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-up " ></i>
								            
								            </button>
								        	<!--上移 -->
											
											
											<button style="margin-top: 15px;" onclick="MoveDown(1)" class="btn btn-primary"   title="<ww:property value='#session.local.a00269' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-down " ></i>
								            
								            </button>
								            <!--下移 -->
								            
								            <button style="margin-top: 15px;" onclick="removeit(1)" class="btn btn-primary"   title="<ww:property value='#session.local.a00025' />"   type="button">
								            
								               <i class="icon  icon-remove-sign " ></i>
								           
								            </button>
								            <!--删除-->
											
											
								    </div>
								    
								    
								    
                                    <!-- 已选图片 -->
						            <div style="float: left;margin: 0px 0px; padding: 0px 0px;" >
						                 <table id="dg" class="easyui-datagrid"  title="<ww:property value="#session.local.b00013"  />" style="width:400px;height:280px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: true,
												toolbar: '#tb',
												method: 'get',
												onClickCell: onClickCell,
												nowrap:true	
											">
							                <thead>
								                    <tr>
														<th data-options="field:'tScName',width:180"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
														<th data-options="field:'tScTime',width:80,
														      
														       editor: 
                                                               { type: 'numberbox', 
                                                                 options: 
                                                                        {  
					                                                       required:true,
					                                                       missingMessage:'<ww:property value='#session.local.a00671'/>'
					                                                    }
                                                                        
                                                               }
                                                               
														"><ww:property value='#session.local.a00747'/></th><!-- 播放时长(秒) -->
														<th data-options="field:'tScFileName',hidden:true"></th>
														<th data-options="field:'tScTx',width:100,formatter:unitformatter,
														    
                                                             editor: 
                                                               { type: 'combobox', 
                                                                 options: 
                                                                        {  
                                                                           data:txs,
                                                                           valueField:'value',
					                                                       textField:'text',
					                                                       method:'get',
					                                                       required:true,
					                                                       editable:false 
					                                                      
                                                                        } 
                                                               }
                                                        "><ww:property value='#session.local.a00265'/></th>
														
									        	    </tr>
							                 </thead>
					                  </table>	           
							          <div id="tb" style="height:auto;line-height: 0px;">
											<a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton"  onclick="setPlayAll(1)">
											<ww:property value='#session.local.a00749'/></a><!-- 设置所有间隔时间(秒) -->
											<a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton"  onclick="setPlayAll(2)">
											<ww:property value='#session.local.a00265'/></a><!-- 设置所有特效 -->
											
<!--											<a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton"  onclick="endEditing()">-->
<!--                                                  <ww:property value='#session.local.b00050'/>-->
<!--                                            </a> 保存更改 -->
																		
									  </div>
								   
						           </div>
			                 </div>
			                 
			                 
			                 <!-- 视频 -->
			                 <div id="targetDivContentVideo" style="display: none;padding-top: 10px;">
			                        <div id="targetDivContentVideoLeft" class="am_right scrollbar-hover" style="height:320px;width:350px;float:left;">
                                          <div style="height: 310px;">  
                                            <table id="dgScVideo" class="easyui-datagrid"  title="<ww:property value='#session.local.b00017'/>" style="width:350px;height:310px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: false,
												toolbar: '#tbdgScVideo',
												method: 'get',
												nowrap:true	,
												selectOnCheck:true,
												checkOnSelect:true,
												multiple: true,
												pagination: true,
												fit:true
											">
							                <thead>
								                    <tr>
								                        <th data-options="field:'ck',checkbox:true"></th>
														<th data-options="field:'tScName',width:280"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
														<th data-options="field:'tScFileName',hidden:true"></th>
									        	    </tr>
							                 </thead>
			                              </table>
			                              </div>
			                              <div id="tbdgScVideo" style="height:auto;line-height: 0px;">
												
												<div>
													<ww:property value='#session.local.b00014'  />:<!-- 分组 --> 
													<select  id="scGroupComboboxVideo"  class="easyui-combobox" panelHeight="auto" style="width:100px;height: 20px;">
														<option <ww:if test="gssi.sucaigroupid==0">selected="selected" </ww:if>  value="0"><ww:property value='#session.local.a00815'  /></option> <!-- 全部 -->
														<option <ww:if test="gssi.sucaigroupid==-1">selected="selected" </ww:if>  value="-1"><ww:property value='#session.local.b00015'  /></option><!-- 共享 -->
														<ww:iterator value="listsfgp">
														       <option  <ww:if test="gssi.sucaigroupid==id">selected="selected" </ww:if>  value="<ww:property value='id'  />"><ww:property value="name"  /></option>
														</ww:iterator>
													</select>
													<input id="ser" class="easyui-searchbox" data-options="prompt:'<ww:property value='#session.local.a00071'  />',searcher:doSearch" style="width:100px;height: 20px;"></input>
													
<!--													<a style="height: 20px;" title="<ww:property value='#session.local.a00063' />" href="javascript:open_item_sucai_onload('upimg.jsp')" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick=""></a>-->
	
													<script>
													    //分组combobox事件
													    $("#scGroupComboboxVideo").combobox({
													    	onChange : function(){
													    		  //ajax请求获取数据
													              ajaxGetSucaiData(0,"","scGroupComboboxVideo",3,"dgScVideo");												    	   
													    	}
														}); 

													    //搜索
														function doSearch(value,name){
															
															    ajaxGetSucaiData(1,value,"scGroupComboboxVideo",3,"dgScVideo");

														}
														
													</script>
												</div>
										   </div>
                                    
                                    
                                    </div>
			                       
								    <div class="part2_2 part2_2_3" style="float: left;margin-right: 0px; margin-top: 80px;width: 50px;">
											
											<button id="step4" onclick="addTouchMuti(2)" class="btn btn-primary"   title="<ww:property value='#session.local.a00270' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-right " ></i>
								            
								            </button>
											
											<!--添加到已选列表  -->
											<button style="margin-top: 15px;" onclick="MoveUp(2)" class="btn btn-primary"   title="<ww:property value='#session.local.a00268' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-up " ></i>
								            
								            </button>
								        	
								        	<!--上移 -->
											
											
											<button style="margin-top: 15px;" onclick="MoveDown(2)" class="btn btn-primary"   title="<ww:property value='#session.local.a00269' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-down " ></i>
								            
								            </button>
								            <!--下移 -->
								            
								            <button style="margin-top: 15px;" onclick="removeit(2)" class="btn btn-primary"   title="<ww:property value='#session.local.a00025' />"   type="button">
								            
								               <i class="icon  icon-remove-sign " ></i>
								           
								            </button>
								            
											<!--删除-->
											
											
								    </div>
								    
								    
								    
                                    <!-- 已选视频 -->
						            <div style="float: left;margin: 0px 0px; padding: 0px 0px;" >
						                 <table id="dgVideo" class="easyui-datagrid"  title="<ww:property value="#session.local.b00013"  />" style="width:400px;height:280px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: true,
												toolbar: '#tbVideo',
												method: 'get',
												onClickCell: onClickCellVideo,
												nowrap:true	
											">
							                <thead>
								                    <tr>
														<th data-options="field:'tScNameVideo',width:270"><ww:property value='#session.local.a00133'/></th>
														
														
														<th data-options="field:'tScVol',width:80,formatter:unitformatterVol,
														    
                                                             editor: 
                                                               {
                                                                 type: 'combobox', 
                                                                 options: 
                                                                        { 
                                                                           data:vols,
                                                                           valueField:'value',
					                                                       textField:'text',
					                                                       method:'get',
					                                                       required:true,
					                                                       editable:false 
                                                                        } 
                                                               }
                                                               
                                                        "><ww:property value='#session.local.b00022'/></th>
                                                        <th data-options="field:'tScFileNameVideo',hidden:true"></th>
									        	    </tr>
							                 </thead>
					                  </table>	               
							         
								      <div id="tbVideo" style="height:auto;line-height: 0px;">
							          	    <a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton"  onclick="setPlayAll(4)">
											<ww:property value='#session.local.b00023'/></a><!-- 设置视频音量 -->
											
<!--											<a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton"  onclick="endEditingVideo()">-->
<!--                                                  <ww:property value='#session.local.b00050'/>-->
<!--                                            </a> 保存更改 -->
														
									  </div>
									   
									    
						           </div>
			                 </div>
			                  
			                 <!-- app --> 
			                <div id="targetDivContentAppLeft" style="display: none;padding-top: 10px;padding-left: 280px;">                                                                                                         
                                    <ww:property value='#session.local.a00630' />:<input name="appUrl" id="appUrl" style="line-height: 20px;" type="text" 
                                    
                                    <ww:if test="editTouchInteractive.tType==6"> 
                                       value="<ww:property value='editTouchInteractive.tResources'/>"
                                    </ww:if>
                                     
                                    />
                            </div>  
                            
                            
                            <!-- 广播跳转 -->
                            
                            <div id="targetDivContentBroadcastLeft" style="display:none;padding-top: 10px;padding-left: 180px;">                                                                                                         
                                    <ww:property value='#session.local.b00102' />:
                                    
                                    
                                    <input id="broadcastNumber" class="easyui-numberspinner"  value="1"  data-options="increment:1,min:1,max:100" style="width:120px;"></input>
                                    
                                    &nbsp;&nbsp;
                                    <ww:property value="#session.local.a00758"/>:
                                    
                                    <input class="easyui-numberbox"  data-options="required:true" missingMessage="<ww:property value='#session.local.a00671'/>"    id="tTouchReturnTime" type="text"  style="float: left;width: 80px;" />
                                    
                                    <a href="javascript:setSmartSubmit(-1);" class="easyui-linkbutton"><ww:property value="#session.local.b00105"/></a>
                                   
                                    <!-- (-1智能返回  按照节目视频或者图片播放时长 ,0不返回,大于0按照数值返回)-->
                                 
                            </div>  
                            
                            
                            <!-- 发送 串口--> 
			                <div id="targetDivContentSerialPort" style="display: none;padding-top: 10px;padding-left:280px;">                                                                                                         
                                    
                                    <ww:property value='#session.local.a00037' /><ww:property value='#session.local.b00257' />:
                                    
                                    <input name="serialPort" id="serialPort" style="line-height: 20px;" type="text" 
                                    
	                                    <ww:if test="editTouchInteractive.tType==12"> 
	                                       value="<ww:property value='editTouchInteractive.tResources'/>"
	                                    </ww:if>
                                     
                                    />
                            </div>  
                            
                            
                            
                            <!-- 网页 -->
                            <div  id="targetDivContentHtml"  style="display:none;padding-top: 10px;padding-left: 50px;">
			                        <div id="targetDivContentHtmlLeft" class="am_right scrollbar-hover" style="height: 280px;width:280px;float: left;">
			                                  <div class="easyui-panel" title="<ww:property value='#session.local.a00667'  />"  style="height: 280px;width:280px;margin: 0px;padding: 0px;line-height: 40px;">
			                                  
	                                            &nbsp;&nbsp;<ww:property value='#session.local.a00189'/>:&nbsp;&nbsp;<input id="aHtmlUrl" type="text"  value="http://"  style="line-height: 20px;width: 200px;"/><br />
	                                            &nbsp;&nbsp;<ww:property value='#session.local.a00720'/>:&nbsp;&nbsp;<input id="aHtmlAtime" type="text" style="line-height: 20px;width: 150px" value="5" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" /><br />
                                                &nbsp;&nbsp;
                                                <ww:property value='#session.local.a00756'/>:
                                                <input name="mShowNavigation" value="1" type="radio"/><ww:property value='#session.local.a00232'/><!-- 是 --> &nbsp;&nbsp;
                                                <input name="mShowNavigation" checked="checked"  value="0" type="radio"/><ww:property value='#session.local.a00233'/><!-- 否 --><br />
                                                <!-- 显示导航栏控件 -->
                                                &nbsp;&nbsp;
                                                <ww:property value='#session.local.a00757'/>:
                                                
                                                <input name="mShowPCWeb"  value="1" type="radio"/><ww:property value='#session.local.b00044'/><!-- PC版 --> &nbsp;&nbsp;
                                                <input name="mShowPCWeb" checked="checked"  value="0" type="radio"/><ww:property value='#session.local.b00045'/><!-- 移动版 --><br />
                                     
                                     
                                            
                                                <div class="easyui-panel" title="<ww:property value='#session.local.b00025' />"  style="height: 91px;width:276px;margin: 0px;padding: 0px;"  >
                                                        &nbsp;&nbsp;
                                                       <ww:property value='#session.local.a00202' />(<ww:property value='#session.local.a00106' />):
                                                       <input id="aHtmlTtime"
		                                               <ww:if test="editTouchInteractive.tType==3"> 
				                                               <ww:if test="editTouchInteractive.tResources==''||editTouchInteractive.tResources==null">value="0"</ww:if>
				                                               <ww:else>value="<ww:property value='editTouchInteractive.tResources' />"</ww:else>
		                                               </ww:if>
		                                               <ww:else>
		                                                    value="0"
		                                               </ww:else>  
		                                               type="text" style="line-height: 20px; width: 80px;" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" /><br />
                                                
                                                </div>
                                              
                                             </div>  
                                    </div>
			                       
                                    
			                       
								    <div class="part2_2 part2_2_3" style="float: left;margin-right: 0px; margin-top: 80px;width: 50px;">
										
											<button id="step4" onclick="addTouchMuti(3)" class="btn btn-primary"   title="<ww:property value='#session.local.a00270' />"   type="button">
								                <i class="icon icon-chevron-sign-right " ></i>
								            </button>
											<!--添加到已选列表  -->
											
											
											<button style="margin-top: 15px;" onclick="MoveUp(3)" class="btn btn-primary"   title="<ww:property value='#session.local.a00268' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-up " ></i>
								            
								            </button>
								        	<!--上移 -->
											
											
											<button style="margin-top: 15px;" onclick="MoveDown(3)" class="btn btn-primary"   title="<ww:property value='#session.local.a00269' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-down " ></i>
								            
								            </button>
								            <!--下移 -->
								            
								            <button style="margin-top: 15px;" onclick="removeit(3)" class="btn btn-primary"   title="<ww:property value='#session.local.a00025' />"   type="button">
								            
								               <i class="icon  icon-remove-sign " ></i>
								           
								            </button>
								            
											<!--删除-->
											
											
								    </div>
								    
								    
								    
                                    <!-- 已选网页 -->
						            <div style="float: left;margin: 0px 0px; padding: 0px 0px;" >
						                 <table id="dgHtml" class="easyui-datagrid"  title="<ww:property value="#session.local.a00267"  />" style="width:400px;height:280px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: true,
												toolbar: '#tbHtml',
												method: 'get',
												onClickCell: onClickCellHtml,
												nowrap:true	
											">
							                <thead>
								                    <tr>
														<th data-options="field:'tHtmlUrl',width:180"><ww:property value='#session.local.a00189'/></th>
														<th data-options="field:'tHtmlQtime',width:70,
														
														      editor: 
                                                               { type: 'numberbox', 
                                                                 options: 
                                                                        {  
					                                                       required:true,
					                                                       missingMessage:'<ww:property value='#session.local.a00671'/>'
					                                                                     
                                                                        }
                                                                        
                                                               }
                                                               
                                                               
														    
														"><ww:property value='#session.local.a00720'/></th>
														<th data-options="field:'mShowNavigation',width:50,
														     formatter:unitformatteronoff,
														     editor: 
                                                               { type: 'combobox', 
                                                                 options: 
                                                                        {  data:onoffs,
                                                                           valueField:'value',
					                                                       textField:'text',
					                                                       method:'get',
					                                                       required:true,
					                                                       editable:false 
					                                                      
                                                                        } 
                                                               }														
														"><ww:property value='#session.local.a00756'/></th><!-- 显示导航栏控件 -->
												        <th data-options="field:'mShowPCWeb',width:50,
												             formatter:unitformatterHtmlType,
														     editor: 
                                                               { type: 'combobox', 
                                                                 options: 
                                                                        {  data:htmlType,
                                                                           valueField:'value',
					                                                       textField:'text',
					                                                       method:'get',
					                                                       required:true,
					                                                       editable:false 
					                                                      
                                                                        } 
                                                               } 
												        "><ww:property value='#session.local.a00757'/></th><!-- 显示桌面样式网页 -->
									        	    </tr>
							                 </thead>
					                  </table>	               
							          <div id="tbHtml" style="height:auto;line-height: 0px;">
											<a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton"  onclick="setPlayAll(3)">
											<ww:property value='#session.local.a00753'/></a><!-- 设置所有间隔时间(秒) -->
											
<!--											<a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton"  onclick="endEditingHtml()">-->
<!--                                                  <ww:property value='#session.local.b00050'/>-->
<!--                                             </a> 保存更改 -->

											
									  </div>
								   
						           </div>
			                 </div>
			                 
			                 
			                 <!-- 场景 -->
			                 <div id="targetDivContentScene" style="display:none;padding-top: 5px;padding-left: 250px;">
			                        
			                        
			                        <div class="easyui-panel" title="<ww:property value='#session.local.a00434'  />" style="height: 280px;width:300px;">
				                        <div id="targetDivContentSceneLeft" class="am_right scrollbar-hover" style="width:280px;float: left;">                                          
	                                    </div>
			                        </div>
			                        
								   
			                 </div>
			                 
			                 <!-- 文本 -->
			                
			                <div id="targetDivContentTxt" style="display: none;padding-top: 10px;">
			                        <div id="targetDivContentTxtLeft" class="am_right scrollbar-hover" style="height:320px;width:350px;float:left;display: none;">
			                        
			                              <div style="height: 290px;width: 350px;">
							                 <table id="dgScTxt" class="easyui-datagrid"  title="<ww:property value='#session.local.b00017'/>" style="width:350px;height:392px;margin: 0px;padding: 0px;"
												data-options="
												    rownumbers:true,
													singleSelect: true,
													toolbar: '#tb0Txt',
													method: 'get',
													nowrap:true	,
													selectOnCheck:true,
													checkOnSelect:true,
													pagination: true,
												    fit:true
												">
								                <thead>
									                    <tr>
									                        <th data-options="field:'ck',checkbox:true"></th>
															<th data-options="field:'tScName',width:280"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
															<th data-options="field:'tScFileName',hidden:true"></th>
															<th data-options="field:'tScTxtContent',hidden:true"></th>
										        	    </tr>
								                 </thead>
						                      </table>	           
							             </div>
							      
							              <div id="tb0Txt" style="height:auto;line-height: 0px;">
												
												<div>
													<ww:property value='#session.local.b00014'  />:<!-- 分组 --> 
													<select  id="scGroupComboboxTxt"  class="easyui-combobox" panelHeight="auto" style="width:100px;height: 20px;">
														<option <ww:if test="gssi.sucaigroupid==0">selected="selected" </ww:if>  value="0"><ww:property value='#session.local.a00815'  /></option> <!-- 全部 -->
														<option <ww:if test="gssi.sucaigroupid==-1">selected="selected" </ww:if>  value="-1"><ww:property value='#session.local.b00015'  /></option><!-- 共享 -->
														<ww:iterator value="listsfgp">
														       <option  <ww:if test="gssi.sucaigroupid==id">selected="selected" </ww:if>  value="<ww:property value='id'  />"><ww:property value="name"  /></option>
														</ww:iterator>
													</select>
													<input id="ser" class="easyui-searchbox" data-options="prompt:'<ww:property value='#session.local.a00071'  />',searcher:doSearchTxt" style="width:100px"></input>
													
													<a style="height: 20px;" title="<ww:property value='#session.local.a00063' />" href="javascript:open_item_sucai_onload('uptxt.jsp')" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick=""></a>
	
													<script>

															 //分组combobox事件
														    $("#scGroupComboboxTxt").combobox({
														    	onChange : function(){
														    	    
														    		  //ajax请求获取数据
														              ajaxGetSucaiData(0,"","scGroupComboboxTxt",10,"dgScTxt");												    	   
														    	}
															}); 
		
														    //搜索
															function doSearchTxt(value,name){

	                                                            ajaxGetSucaiData(1,value,"scGroupComboboxTxt",10,"dgScTxt");
																 
															}
												    
													</script>
													
													
													
												</div>
										  </div>
			                    
                                    
                                    </div>
			                       
								    <div class="part2_2 part2_2_3" style="float: left;margin-right: 0px; margin-top: 80px;width: 50px;display: none;">
											
											<button id="step4" onclick="addTouchMuti(10)" class="btn btn-primary"   title="<ww:property value='#session.local.a00270' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-right " ></i>
								            
								            </button>
										  
											<!--添加到已选列表  -->
											
											
								    </div>
								    
								    
								    
                                    <!-- 已选文本 -->
						           <div id="log" title="<ww:property value="#session.local.b00013"  />"  class="easyui-panel"  style="float: left;margin: 0px 0px; padding: 0px 0px;height: 290px;width: 800px;" >    
						                   
	                                    
	                                        
										      <div   onpaste="javascript:return false;" style="width:400px;height: 250px;font-size: 18px;border: 1px solid #d5d5d5;overflow: auto;margin-left: 15px;margin-top: 5px;float: left;" contentEditable='true'   id="yxlist">
							                      
							           
							                  </div>
							                  
							                  
							                  <div style="float: left;width: 350px;">
							                  
							                         <ul class="ps_2" style="margin-bottom: 0px;">
														<li>
														<!-- 字体-->
														<ww:property value="#session.local.a00538"/>:
														   <select style="width: 50px;" class="sel_first"  title="<ww:property value='#session.local.font_family' />" name="fonttype" id="fonttype"    onchange="fonttype2(this.value)">
															   <option value="0"  <ww:if test='fonttype==0'>selected="selected"</ww:if>   ><ww:property value='#session.local.a00377' /></option>
														       <option value="1"  <ww:if test='fonttype==1'>selected="selected"</ww:if>   ><ww:property value='#session.local.a00374' /></option>
														       <option value="2"  <ww:if test='fonttype==2'>selected="selected"</ww:if>   ><ww:property value='#session.local.a00379' /></option>
															   <option value="3"  <ww:if test='fonttype==3'>selected="selected"</ww:if>   ><ww:property value='#session.local.a00380' /></option>
															   <option value="4"  <ww:if test='fonttype==4'>selected="selected"</ww:if>   ><ww:property value='#session.local.a00381' /></option>
															   <option value="5"  <ww:if test='fonttype==5'>selected="selected"</ww:if>   ><ww:property value='#session.local.a00375' /></option>
															   <option value="6"  <ww:if test='fonttype==6'>selected="selected"</ww:if>   ><ww:property value='#session.local.a00378' /></option>
															   <option value="7"  <ww:if test='fonttype==7'>selected="selected"</ww:if>   ><ww:property value='#session.local.b00135' /></option>
															   <option value="8"  <ww:if test='fonttype==8'>selected="selected"</ww:if>   ><ww:property value='#session.local.b00136' /></option>
															   <option value="9"  <ww:if test='fonttype==9'>selected="selected"</ww:if>   ><ww:property value='#session.local.b00137' /></option>
															   <option value="10"  <ww:if test='fonttype==10'>selected="selected"</ww:if>   ><ww:property value='#session.local.d00020' /></option>
			     											   <option value="11"  <ww:if test='fonttype==11'>selected="selected"</ww:if>   ><ww:property value='#session.local.d00021' /></option>
															   <option value="12"  <ww:if test='fonttype==12'>selected="selected"</ww:if>   ><ww:property value='#session.local.d00022' /></option>
															   
															</select>  
														</li>
														
														<li>
															<!-- 字体大小 -->
															 <ww:property value="#session.local.a00324"/>:
															   <select id="txtfontsize" style="width: 50px;"  title="<ww:property value='#session.local.a00324' />" onchange="fontsize2(this.value)">
															          <option   <ww:if test='txtfontsize==16'>selected="selected"</ww:if>   value="16"><ww:property value="#session.local.b00038" /></option>
														              <option   <ww:if test='txtfontsize==24'>selected="selected"</ww:if>   value="24"><ww:property value="#session.local.b00039" /></option>
														              <option   <ww:if test='txtfontsize==36'>selected="selected"</ww:if>   value="36"><ww:property value="#session.local.b00040" /></option>
														              <option   <ww:if test='txtfontsize==48'>selected="selected"</ww:if>   value="48"><ww:property value="#session.local.b00041" /></option>
														              <option   <ww:if test='txtfontsize==100'>selected="selected"</ww:if>   value="100"><ww:property value="#session.local.b00042" /></option>
															   </select>
															 <!-- 高级 -->
															 &nbsp;&nbsp;
															 <ww:property value="#session.local.b00051"/>  
															 :&nbsp; <input type="checkbox" id="txtFontSizeAdvancedCheckBox"  onchange="setCheckBoxChange()" value="1" style="margin-top: -5px;"/>
															 <select id="txtFontSizeAdvancedSelect"  style="width: 60px;display: none;"  onchange="fontsize2(this.value)">
															 
																	  <option   <ww:if test='txtfontsize==1'>selected="selected"</ww:if>    value="1">1</option>
														              <option   <ww:if test='txtfontsize==2'>selected="selected"</ww:if>    value="2">2</option>
														              <option   <ww:if test='txtfontsize==3'>selected="selected"</ww:if>    value="3">3</option>
														              <option   <ww:if test='txtfontsize==4'>selected="selected"</ww:if>    value="4">4</option>
														              <option   <ww:if test='txtfontsize==5'>selected="selected"</ww:if>    value="5">5</option>
														              <option   <ww:if test='txtfontsize==6'>selected="selected"</ww:if>    value="6">6</option>
														              <option   <ww:if test='txtfontsize==7'>selected="selected"</ww:if>    value="7">7</option>
														              <option   <ww:if test='txtfontsize==8'>selected="selected"</ww:if>    value="8">8</option>
														              <option   <ww:if test='txtfontsize==9'>selected="selected"</ww:if>    value="9">9</option>
														              <option   <ww:if test='txtfontsize==10'>selected="selected"</ww:if>   value="10">10</option>
														              <option   <ww:if test='txtfontsize==11'>selected="selected"</ww:if>   value="11">11</option>
														              <option   <ww:if test='txtfontsize==12'>selected="selected"</ww:if>   value="12">12</option>
														              <option   <ww:if test='txtfontsize==13'>selected="selected"</ww:if>   value="13">13</option>
														              <option   <ww:if test='txtfontsize==14'>selected="selected"</ww:if>   value="14">14</option>
														              <option   <ww:if test='txtfontsize==15'>selected="selected"</ww:if>   value="15">15</option>
														              <option   <ww:if test='txtfontsize==16'>selected="selected"</ww:if>   value="16">16</option>
														              <option   <ww:if test='txtfontsize==17'>selected="selected"</ww:if>   value="17">17</option>
														              <option   <ww:if test='txtfontsize==18'>selected="selected"</ww:if>   value="18">18</option>
														              <option   <ww:if test='txtfontsize==19'>selected="selected"</ww:if>   value="19">19</option>
														              <option   <ww:if test='txtfontsize==20'>selected="selected"</ww:if>   value="20">20</option>
														              <option   <ww:if test='txtfontsize==21'>selected="selected"</ww:if>    value="21">21</option>
														              <option   <ww:if test='txtfontsize==22'>selected="selected"</ww:if>    value="22">22</option>
														              <option   <ww:if test='txtfontsize==23'>selected="selected"</ww:if>     value="23">23</option>
														              <option   <ww:if test='txtfontsize==24'>selected="selected"</ww:if>     value="24">24</option>
														              <option   <ww:if test='txtfontsize==25'>selected="selected"</ww:if>     value="25">25</option>
														              <option   <ww:if test='txtfontsize==26'>selected="selected"</ww:if>      value="26">26</option>
														              <option   <ww:if test='txtfontsize==27'>selected="selected"</ww:if>     value="27">27</option>
														              <option   <ww:if test='txtfontsize==28'>selected="selected"</ww:if>    value="28">28</option>
														              <option   <ww:if test='txtfontsize==29'>selected="selected"</ww:if>    value="29">29</option>
														              <option   <ww:if test='txtfontsize==30'>selected="selected"</ww:if>  value="30">30</option>
														              <option   <ww:if test='txtfontsize==31'>selected="selected"</ww:if>   value="31">31</option>
														              <option   <ww:if test='txtfontsize==32'>selected="selected"</ww:if>    value="32">32</option>
														              <option   <ww:if test='txtfontsize==33'>selected="selected"</ww:if>   value="33">33</option>
														              <option   <ww:if test='txtfontsize==34'>selected="selected"</ww:if>   value="34">34</option>
														              <option   <ww:if test='txtfontsize==35'>selected="selected"</ww:if>  value="35">35</option>
														              <option   <ww:if test='txtfontsize==36'>selected="selected"</ww:if>  value="36">36</option>
														              <option   <ww:if test='txtfontsize==37'>selected="selected"</ww:if>  value="37">37</option>
														              <option   <ww:if test='txtfontsize==38'>selected="selected"</ww:if>  value="38">38</option>
														              <option   <ww:if test='txtfontsize==39'>selected="selected"</ww:if>  value="39">39</option>
														              <option   <ww:if test='txtfontsize==40'>selected="selected"</ww:if>  value="40">40</option>
														              <option   <ww:if test='txtfontsize==41'>selected="selected"</ww:if>  value="41">41</option>
														              <option   <ww:if test='txtfontsize==42'>selected="selected"</ww:if>  value="42">42</option>
														              <option   <ww:if test='txtfontsize==43'>selected="selected"</ww:if>  value="43">43</option>
														              <option   <ww:if test='txtfontsize==44'>selected="selected"</ww:if>  value="44">44</option>
														              <option   <ww:if test='txtfontsize==45'>selected="selected"</ww:if>   value="45">45</option>
														              <option   <ww:if test='txtfontsize==46'>selected="selected"</ww:if>  value="46">46</option>
														              <option   <ww:if test='txtfontsize==47'>selected="selected"</ww:if>  value="47">47</option>
														              <option   <ww:if test='txtfontsize==48'>selected="selected"</ww:if>  value="48">48</option>
														              <option   <ww:if test='txtfontsize==49'>selected="selected"</ww:if>  value="49">49</option>
														              <option   <ww:if test='txtfontsize==50'>selected="selected"</ww:if>   value="50">50</option>
														              <option   <ww:if test='txtfontsize==55'>selected="selected"</ww:if>  value="55">55</option>
														              <option   <ww:if test='txtfontsize==60'>selected="selected"</ww:if>  value="60">60</option>
														              <option   <ww:if test='txtfontsize==65'>selected="selected"</ww:if>  value="65">65</option>
														              <option   <ww:if test='txtfontsize==70'>selected="selected"</ww:if>  value="70">70</option>
														              <option   <ww:if test='txtfontsize==75'>selected="selected"</ww:if>  value="75">75</option>
														              <option   <ww:if test='txtfontsize==80'>selected="selected"</ww:if>  value="80">80</option>
														              <option   <ww:if test='txtfontsize==85'>selected="selected"</ww:if>  value="85">85</option>
														              <option   <ww:if test='txtfontsize==90'>selected="selected"</ww:if>  value="90">90</option>
														              <option   <ww:if test='txtfontsize==95'>selected="selected"</ww:if>   value="95">95</option>
														              <option   <ww:if test='txtfontsize==100'>selected="selected"</ww:if>   value="100">100</option>
														              <option   <ww:if test='txtfontsize==110'>selected="selected"</ww:if>  value="110">110</option>
														              <option   <ww:if test='txtfontsize==120'>selected="selected"</ww:if>  value="120">120</option>
														              <option   <ww:if test='txtfontsize==130'>selected="selected"</ww:if>  value="130">130</option>
														              <option   <ww:if test='txtfontsize==140'>selected="selected"</ww:if>  value="140">140</option>
														              <option   <ww:if test='txtfontsize==150'>selected="selected"</ww:if>  value="150">150</option>
														              <option   <ww:if test='txtfontsize==160'>selected="selected"</ww:if>  value="160">160</option>
														              <option   <ww:if test='txtfontsize==170'>selected="selected"</ww:if>  value="170">170</option>
														              <option   <ww:if test='txtfontsize==180'>selected="selected"</ww:if>  value="180">180</option>
														              <option   <ww:if test='txtfontsize==190'>selected="selected"</ww:if>  value="190">190</option>
														              <option   <ww:if test='txtfontsize==200'>selected="selected"</ww:if>  value="200">200</option>
															 </select>  
													     </li>
													     
														<li>
														<!-- 字体距离 -->
														<ww:property value="#session.local.a00295"/>:
														 <select id="lineH" style="width: 50px;"  title="<ww:property value='#session.local.a00295' />"  onchange="gethsign(this.value)">
															  <option value="1.1"><ww:property value='#session.local.a00295' /></option>
															  
															  <option <ww:if test='lineH==1'>selected="selected"</ww:if>  value="1">1</option>
														    
														      <option <ww:if test='lineH==1.5'>selected="selected"</ww:if> value="1.5">1.5</option>
														     
														      <option <ww:if test='lineH==2'>selected="selected"</ww:if>  value="2">2</option>
														      
														      <option <ww:if test='lineH==2.5'>selected="selected"</ww:if>  value="2.5">2.5</option>
														</select>
														</li>
														<li>
														<!-- 字体颜色 -->
														<ww:property value="#session.local.a00325"/>:
														<select style="width: 50px;"  name="fontcolor" id="fontcolor" onchange="setcolor(this.value)"  title="<ww:property value='#session.local.a00325' />">					 
															  <option  <ww:if test="#request.txtfontcolor=='000000'">selected="selected"</ww:if> value="#000000"><ww:property value='#session.local.a00337' /></option>
															  <option  <ww:if test="#request.txtfontcolor=='FFFFFF'">selected="selected"</ww:if> value="#FFFFFF"><ww:property value='#session.local.a00340' /></option>
															  
															  <option  <ww:if test="#request.txtfontcolor=='3F48CC'">selected="selected"</ww:if> value="#3F48CC"><ww:property value='#session.local.a00339' /></option>
															  <option  <ww:if test="#request.txtfontcolor=='FFC90E'">selected="selected"</ww:if> value="#FFC90E"><ww:property value='#session.local.a00342' /></option>
															  <option  <ww:if test="#request.txtfontcolor=='22B14C'">selected="selected"</ww:if> value="#22B14C"><ww:property value='#session.local.a00341' /></option>
															  
															  <option  <ww:if test="#request.txtfontcolor=='7F7F7F'">selected="selected"</ww:if> value="#7F7F7F"><ww:property value='#session.local.a00343' /></option>
															  
															  <option  <ww:if test="#request.txtfontcolor=='ED1C24'">selected="selected"</ww:if>  value="#ED1C24"><ww:property value='#session.local.a00338' /></option>
														</select>
														</li>
														<li>
														<!-- 滚动方式 -->
														   <ww:property value="#session.local.a00333"/>:
														      <select  style="width: 80px;"  name="type" id="gdtype">
														          <option <ww:if test='gdtype==2'>selected="selected"</ww:if> value="2"><ww:property value="#session.local.a00369" /></option><!-- 静态文本 -->
														          <option <ww:if test='gdtype==0'>selected="selected"</ww:if> value="0"><ww:property value="#session.local.a00370" /></option><!-- 向上滚动 -->
														          <option <ww:if test='gdtype==1'>selected="selected"</ww:if> value="1"><ww:property value="#session.local.a00372" /></option><!-- 向左滚动 -->
														          <option <ww:if test='gdtype==3'>selected="selected"</ww:if> value="3"><ww:property value="#session.local.a00371" /></option><!-- 向下滚动 -->
														      </select>
														</li>
														<li>
														   
														   	<!-- 滚动速度 -->
															<ww:property value="#session.local.a00336"/>:
												            <select style="width: 50px;" name="speed" id="gdspeed">
												               <option <ww:if test='gdspeed==5'>selected="selected"</ww:if> value="5" ><ww:property value="#session.local.b00037" /></option><!-- 超快 -->
												               <option <ww:if test='gdspeed==4'>selected="selected"</ww:if> value="4"><ww:property value="#session.local.b00036" /></option><!-- 快 -->
												               <option <ww:if test='gdspeed==3'>selected="selected"</ww:if> value="3" selected="selected"><ww:property value="#session.local.b00035" /></option><!-- 正常 -->
												               <option <ww:if test='gdspeed==2'>selected="selected"</ww:if>  value="2"><ww:property value="#session.local.b00034" /></option><!--慢 -->
												               <option <ww:if test='gdspeed==1'>selected="selected" </ww:if>value="1"><ww:property value="#session.local.b00033" /></option><!-- 超慢 -->
												            </select>
																				         
														</li>
														
														
														
														<li>
														<!-- 背景颜色 -->
														<ww:property value="#session.local.a00358"/>:
														<select style="width: 50px;" name="backcolor" id="backcolor" onchange="setbackcolor(this.value)" title="<ww:property value='#session.local.a00358' />">
																				  <option  <ww:if test="#request.fbackcolor=='ED1C24'">selected="selected"</ww:if>   value="#ED1C24"><ww:property value='#session.local.a00338' /></option>
																				  <option  <ww:if test="#request.fbackcolor=='3F48CC'">selected="selected"</ww:if>   value="#3F48CC"><ww:property value='#session.local.a00339' /></option>
																				  <option  <ww:if test="#request.fbackcolor=='FFC90E'">selected="selected"</ww:if>   value="#FFC90E"><ww:property value='#session.local.a00342' /></option>
																				  <option  <ww:if test="#request.fbackcolor=='22B14C'">selected="selected"</ww:if>   value="#22B14C"><ww:property value='#session.local.a00341' /></option>
																				  <option  <ww:if test="#request.fbackcolor=='FFFFFF'">selected="selected"</ww:if>   value="#FFFFFF"><ww:property value='#session.local.a00340' /></option>
																				  <option  <ww:if test="#request.fbackcolor=='7F7F7F'">selected="selected"</ww:if>   value="#7F7F7F"><ww:property value='#session.local.a00343' /></option>
																				  <option  <ww:if test="#request.fbackcolor=='000000'">selected="selected"</ww:if>   value="#000000"><ww:property value='#session.local.a00337' /></option>
																				  <option  <ww:if test="#request.fbackcolor==0">selected="selected"</ww:if>   value="0"><ww:property value='#session.local.a00366' /></option> 
														</select> 
														</li>
														
														<li>
														<!-- 数据来源 -->
														<ww:property value="#session.local.b00029"/>:
														    <select style="width: 60px;" name="textDataSource" id="textDataSource">
														           <option <ww:if test='textDataSource==0'>selected="selected"</ww:if> value="0" ><ww:property value="#session.local.b00030"/></option>
														           <option <ww:if test='textDataSource==1'>selected="selected"</ww:if> value="1"><ww:property value="#session.local.b00031"/></option>
														    </select>
														</li>
														
														
														
														<!--<li><a href="javascript:left();"><img src="image/field_style_0.png" alt="field_style"/></a></li>  左对齐 -->
														<!--<li><a href="javascript:center();"><img src="image/field_style_1.png" alt="field_style"/></a></li>  居中  -->
														<!--<li><a href="javascript:right();"><img src="image/field_style_2.png" alt="field_style"/></a></li>  右对齐  -->
														<li>&nbsp;</li>
														<li>&nbsp;</li>
														<li>&nbsp;</li>
														<li><a href="javascript:bold();"><img src="image/field_style_3.png" alt="field_style"/></a></li><!-- 加粗 -->
														<li><a href="javascript:itallic();"><img src="image/field_style_4.png" alt="field_style"/></a></li><!-- 文本斜体 -->
														<li><a href="javascript:setline();"><img src="image/field_style_5.png" alt="field_style"/></a></li><!-- 下划线 -->
														<li><a href="javascript:setstrike();"><img src="image/field_style_6.png" alt="field_style"/></a></li><!-- 中划线 -->
													 </ul>
											         <input  type="hidden"   id="fbold"   name="fbold"            value="<ww:property value='fbold'/>"  />
											         <input  type="hidden"   id="fitallic"   name="fitallic"      value="<ww:property value='fitallic'/>"  />
											         <input  type="hidden"   id="fsetline"   name="fsetline"      value="<ww:property value='fsetline'/>"  />
											         <input  type="hidden"   id="fsetstrike"   name="fsetstrike"  value="<ww:property value='fsetstrike'/>"  />
							                  </div>
										      
										   
										   
						           </div>
			                 </div>
			                 
			                 
			                 <!-- 翻书 -->
			                 
			                 
			                   <div id="targetDivContentFlip" style="display: none;padding-top: 10px">
			                        <div id="targetDivContentFlipLeft" class="am_right scrollbar-hover" style="height: 320px;width:350px;float: left;">
                                         <div style="height: 310px;">   
                                          <table id="dgFlip" class="easyui-datagrid"  title="<ww:property value='#session.local.b00017'/>" style="width:350px;height:310px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: false,
												toolbar: '#tbFlip',
												method: 'get',
												nowrap:true	,
												selectOnCheck:true,
												checkOnSelect:true,
												multiple: true,
												pagination: true,
												fit:true
											">
							                <thead>
								                    <tr>
								                        <th data-options="field:'ck',checkbox:true"></th>
														<th data-options="field:'tScName',width:280"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
														<th data-options="field:'tScFileName',hidden:true"></th>
									        	    </tr>
							                 </thead>
			                              </table>
			                              </div>
			                              <div id="tbFlip" style="height:auto;line-height: 0px;">
												
												<div>
													<ww:property value='#session.local.b00014'  />:<!-- 分组 --> 
													<select  id="scGroupComboboxFlip"  class="easyui-combobox" panelHeight="auto" style="width:100px;height: 20px;">
														<option <ww:if test="gssi.sucaigroupid==0">selected="selected" </ww:if>  value="0"><ww:property value='#session.local.a00815'  /></option> <!-- 全部 -->
														<option <ww:if test="gssi.sucaigroupid==-1">selected="selected" </ww:if>  value="-1"><ww:property value='#session.local.b00015'  /></option><!-- 共享 -->
														<ww:iterator value="listsfgpimg">
														       <option  <ww:if test="gssi.sucaigroupid==id">selected="selected" </ww:if>  value="<ww:property value='id'  />"><ww:property value="name"  /></option>
														</ww:iterator>
													</select>
													<input id="ser" class="easyui-searchbox" data-options="prompt:'<ww:property value='#session.local.a00071'  />',searcher:doSearchImg" style="width:100px;height: 20px;"></input>
													
<!--													<a style="height: 20px;" title="<ww:property value='#session.local.a00063' />" href="javascript:open_item_sucai_onload('upimg.jsp')" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick=""></a>-->
	
													<script>
													    //分组combobox事件
													    $("#scGroupComboboxFlip").combobox({
													    	onChange : function(){
													    	    
													    		  //ajax请求获取数据
													              ajaxGetSucaiData(0,"","scGroupComboboxFlip",4,"dgFlip");
													              												    	   
													    	}
														}); 

													    //搜索
														function doSearchImg(value,name){
                                                                   
															      ajaxGetSucaiData(1,value,"scGroupComboboxFlip",4,"dgFlip");
															    
														}
														
													</script>
												</div>
										   </div>
                                          
                                          
                                          

                                    </div>
			                       
								    <div class="part2_2 part2_2_3" style="float: left;margin-right: 0px; margin-top: 80px;width: 50px;">
										
											
											<button  onclick="addTouchMuti(14)" class="btn btn-primary"   title="<ww:property value='#session.local.a00270' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-right " ></i>
								            
								            </button>
											<!--添加到已选列表  -->
											
											
											<button style="margin-top: 15px;" onclick="MoveUp(14)" class="btn btn-primary"   title="<ww:property value='#session.local.a00268' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-up " ></i>
								            
								            </button>
								        	<!--上移 -->
											
											
											<button style="margin-top: 15px;" onclick="MoveDown(14)" class="btn btn-primary"   title="<ww:property value='#session.local.a00269' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-down " ></i>
								            
								            </button>
								            <!--下移 -->
								            
								            <button style="margin-top: 15px;" onclick="removeit(14)" class="btn btn-primary"   title="<ww:property value='#session.local.a00025' />"   type="button">
								            
								               <i class="icon  icon-remove-sign " ></i>
								           
								            </button>
								            <!--删除-->
											
											
								    </div>
								    
								    
								    
                                    <!-- 已选图片 -->
						            <div style="float: left;margin: 0px 0px; padding: 0px 0px;" >
						                 <table id="dgSelFlip" class="easyui-datagrid"  title="<ww:property value="#session.local.b00013"  />" style="width:400px;height:200px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: true,
												method: 'get',
												onClickCell: onClickCell,
												nowrap:true	
											">
							                <thead>
								                    <tr>
								                    
								                        <th data-options="field:'ck',checkbox:true,hidden:true"></th>
														<th data-options="field:'tScName',width:340"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
													    <th data-options="field:'tScFileName',hidden:true"></th>
													    
									        	    </tr>
							                 </thead>
					                  </table>	           
							         
							         
							         
						            
								   
						           </div>
						           
						           
						            <div  style="float: left;padding: 0px 0px; width:400px;margin-left: 60px;">
						                
					                     <ww:property  value="#session.local.b00321"/>
                                          <!--  第一张图片是否显示为封面 -->
                                         <input type="checkbox"  value="1" id="isShowIndex"/>                                                                  
						              
						              </div>
			                 </div>
			                 
			                 
			                 <!-- 链接终端内容 -->
			                 
			                    <div id="targetDivContentClient" style="display: none;padding-top: 10px">
			                        <div id="targetDivContentClientLeft" class="am_right scrollbar-hover" style="height: 300px;width:300px;float: left;">
                                         <div style="height:280px;">   
                                          <table id="dgClient" class="easyui-datagrid"  title="<ww:property value='#session.local.a00413'/>" style="width:300px;height:300px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: false,
												toolbar: '#tbClient',
												method: 'get',
												nowrap:true	,
												selectOnCheck:true,
												checkOnSelect:true,
												multiple: true,
												pagination: true
												
											">
							                <thead>
								                    <tr>
								                        <th data-options="field:'ck',checkbox:true"></th>
														<th data-options="field:'tClientName',width:280"><ww:property value='#session.local.a00038'/></th><!-- 名称 -->
														<th data-options="field:'tClientMark',hidden:true"></th>
									        	    </tr>
							                 </thead>
			                              </table>
			                              </div>
			                              <div id="tbClient" style="height:auto;line-height: 0px;">
												
												<div>
													<ww:property value='#session.local.b00014'  />:<!-- 分组 --> 
													<select  id="scGroupComboboxClient"  class="easyui-combobox" panelHeight="auto" style="width:100px;height: 20px;"   data-options="editable:false,panelHeight:'auto'"  panelMaxHeight="200px" >
														<option selected="selected" value="0"><ww:property value='#session.local.a00029'  /></option> <!-- 默认 -->
														
														<ww:iterator value="listclientgroups">
														       <option   value="<ww:property value='id'  />"><ww:property value="gname"  /></option>
														</ww:iterator>
													</select>
													<input id="ser" class="easyui-searchbox" data-options="prompt:'<ww:property value='#session.local.a00038'  />',searcher:doSearchClient" style="width:100px;height: 20px;"></input>
													
<!--													<a style="height: 20px;" title="<ww:property value='#session.local.a00063' />" href="javascript:open_item_sucai_onload('upimg.jsp')" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick=""></a>-->
	
													<script>
													    //分组combobox事件
													    $("#scGroupComboboxClient").combobox({
													    	onChange : function(){
													    	    
													    		  //ajax请求获取数据
													              ajaxGetClientData(0,"","scGroupComboboxClient","dgClient");
													              												    	   
													    	}
														}); 

													    //搜索
														function doSearchClient(value,name){
                                                                   
															   ajaxGetClientData(1,value,"scGroupComboboxClient","dgClient");
															    
														}
														
													</script>
												</div>
										   </div>
                                          
                                          
                                          

                                    </div>
			                       
								    <div class="part2_2 part2_2_3" style="float: left;margin-right: 0px; margin-top: 80px;width: 50px;">
										
											
											<button  onclick="addTouchMuti(15)" class="btn btn-primary"   title="<ww:property value='#session.local.a00270' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-right " ></i>
								            
								            </button>
											<!--添加到已选列表  -->
											
								            
								            <button style="margin-top: 15px;" onclick="removeit(15)" class="btn btn-primary"   title="<ww:property value='#session.local.a00025' />"   type="button">
								            
								               <i class="icon  icon-remove-sign " ></i>
								           
								            </button>
								            <!--删除-->
											
											
								    </div>
								    
								    
								    
                                    <!-- 已选终端 -->
						            <div style="float: left;margin: 0px 0px; padding: 0px 0px;margin-right: 20px;" >
						                 <table id="dgSelClient" class="easyui-datagrid"  title="<ww:property value="#session.local.b00377"  />" style="width:200px;height:280px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: true,
											    method: 'get',
												onClickCell: onClickCell,
												nowrap:true	
											">
							                <thead>
								                    <tr>
														<th data-options="field:'tClientName',width:180"><ww:property value='#session.local.a00038'/></th><!-- 名称 -->
												
														<th data-options="field:'tClientMark',hidden:true"></th>
												
														
									        	    </tr>
							                 </thead>
					                  </table>	           
							     
								   
						           </div>
						           
						           
						          
						          <!-- 选择普通节目 --> 
						          <div id="dgSelClientCommonItemDiv" class="easyui-panel" title="<ww:property value='#session.local.a00609'  />" style="height: 280px;width:220px;">
				                        <div id="dgSelClientCommonItem" class="am_right scrollbar-hover" style="width:200px;float: left;margin-left: 5px;">                                          
	                                    </div>
			                      </div>
			                      
			                      
						          
						          
						          
						           <!-- 选择互动节目 --> 
						          <div id="dgSelClientItemDiv" class="easyui-panel" title="<ww:property value='#session.local.a00434'  />" style="height: 280px;width:220px;">
				                        <div id="dgSelClientItem" class="am_right scrollbar-hover" style="width:200px;float: left;margin-left: 5px;">                                          
	                                    </div>
			                      </div>
			                      
			                      
			                      
			                        <!-- 输入串口 --> 
			                       <div id="dgSelClientPortDiv" class="easyui-panel" title="<ww:property value='#session.local.b00257'  />" style="height: 280px;width:220px;">
				                         
				                         <input name="clientSerialPort" id="clientSerialPort" style="margin-left:10px;margin-top:10px;line-height: 20px;" type="text" 
                                    
		                                    <ww:if test="editTouchInteractive.tType==15"> 
		                                       value="<ww:property value='editTouchInteractive.tResources'/>"
		                                    </ww:if>
                                     
                                        />
                                    
			                       </div>
			                      
			                        
			                        
			                 </div>
			                 
			                 
			                 
			            </td>
			           </tr>
			           
			          
			           
			            <tr>
						    <td colspan="3" style="height: 45px;padding-left: 350px;"    >
				                
				                 <button id="step2" class="btn btn-primary" onclick='adtouchto()' type="button"><ww:property value='#session.local.a00080' /></button>
				                 
				                 <button class="btn btn-primary" onclick='close_win_nov()' type="button"><ww:property value='#session.local.a00014' /></button>
				                 
				                 
				            </td>
			            </tr>
			         </table>
                  </div>
		  </div>
		</div>
        </div>
       </div> 	        
	
                                         <script type="text/javascript">


                                           var vols = [
                                                       {"value": "100", "text": "100%" },
								                       { "value": "90", "text": "90%" }, 
											           { "value": "80", "text": "80%" },
											           { "value": "70", "text": "70%" },
											           { "value": "60", "text": "60%" },
											           { "value": "50", "text": "50%" },
											           { "value": "40", "text": "40%" },
											           { "value": "30", "text": "30%" },
											           { "value": "20", "text": "20%" },
											           { "value": "10", "text": "10%" },
											           { "value": "0", "text": "0%" }
										              ];

							              
									        
								             
                                           var txs = [{ "value": "6", "text": "<ww:property value='#session.local.a00029' />" },
								                        { "value": "0", "text": "<ww:property value='#session.local.a00277' />" }, 
											            { "value": "1", "text": "<ww:property value='#session.local.a00278' />" },
											            { "value": "2", "text": "<ww:property value='#session.local.a00279' />" },
											            { "value": "3", "text": "<ww:property value='#session.local.a00280' />" },
											            { "value": "4", "text": "<ww:property value='#session.local.a00281' />" },
											            { "value": "5", "text": "<ww:property value='#session.local.a00266' />" },
											            { "value": "7", "text": "<ww:property value='#session.local.b00057' />" },
											            { "value": "8", "text": "<ww:property value='#session.local.b00058' />" },
											            { "value": "9", "text": "<ww:property value='#session.local.b00059' />" },
											            { "value": "10", "text": "<ww:property value='#session.local.b00060' />" },
											            { "value": "11", "text": "<ww:property value='#session.local.b00061' />" },
											            { "value": "12", "text": "<ww:property value='#session.local.b00062' />" },
											            { "value": "13", "text": "<ww:property value='#session.local.b00063' />" },
											            { "value": "14", "text": "<ww:property value='#session.local.b00064' />" },
											            { "value": "15", "text": "<ww:property value='#session.local.b00065' />" },
											            { "value": "16", "text": "<ww:property value='#session.local.b00056' />" }
											           ];

								             var onoffs = [
												             { "value": "0", "text": "<ww:property value='#session.local.a00233' />" },
								                             { "value": "1", "text": "<ww:property value='#session.local.a00232' />" }
											              ];  

								             var htmlType = [{ "value": "0", "text": "<ww:property value='#session.local.b00045' />" },
									                          { "value": "1", "text": "<ww:property value='#session.local.b00044' />" }
												             ];  
								             

								             function unitformatter(value, rowData, rowIndex) {
									        	    if (value == 6) {
									        	        return "<ww:property value='#session.local.a00029' />";
									        	    }
									        	    for (var i = 0; i < txs.length; i++) {
									        	        if (txs[i].value == value) {
										        	        
									        	            return txs[i].text;
									        	        }
									        	    }
									        	}


								             function unitformatterVol(value, rowData, rowIndex) {
									        	    if (value == "100") {
									        	        return "100%";
									        	    }
									        	    for (var i = 0; i < vols.length; i++) {
									        	        if (vols[i].value == value) {
									        	            return vols[i].text;
									        	        }
									        	    }
									        	}

									        	
								             function unitformatteronoff(value, rowData, rowIndex) {
									        	  
									        	    for (var i = 0; i < onoffs.length; i++) {
									        	        if (onoffs[i].value == value) {
										        	        
									        	            return onoffs[i].text;
									        	        }
									        	    }
									        	}

								             function unitformatterHtmlType(value, rowData, rowIndex) {
									        	  
									        	    for (var i = 0; i < htmlType.length; i++) {
									        	        if (htmlType[i].value == value) {
									        	            return htmlType[i].text;
									        	        }
									        	    }
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
									                //alert(editIndex)
								                	if (editIndex == undefined){return true;}
								        			if ($('#dg').datagrid('validateRow', editIndex)){
									        			
								        				$('#dg').datagrid('endEdit', editIndex);
								        				editIndex = undefined;
								        				return true;
								        			} else {
								        				return false;
								        			}
								        		}

								                function endEditingHtml(){
									                //alert(editIndex)
								                	if (editIndex == undefined){return true;}
								        			if ($('#dgHtml').datagrid('validateRow', editIndex)){
									        			
								        				$('#dgHtml').datagrid('endEdit', editIndex);
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
													}
													
												}


												 function endEditingVideo(){
										                //alert(editIndex)
									                	if (editIndex == undefined){return true;}
									        			if ($('#dgVideo').datagrid('validateRow', editIndex)){
										        			
									        				$('#dgVideo').datagrid('endEdit', editIndex);
									        				editIndex = undefined;
									        				return true;
									        			} else {
									        				return false;
									        			}
									        		}

									        		

                                               function onClickCellVideo(index, field){
													
													if (endEditingVideo()){
														
														$('#dgVideo').datagrid('selectRow', index)
																.datagrid('editCell', {index:index,field:field});
														editIndex = index;
														
													}
													
												}

                                               function onClickCellHtml(index, field){
													
													if (endEditingHtml()){
														$('#dgHtml').datagrid('selectRow', index)
																.datagrid('editCell', {index:index,field:field});
														editIndex = index;
													}
													
												}

												

							                    function removeit(type){
								                    
													if (editIndex == undefined){return;}

													var dg='';

													if(type==1){
											             dg='dg';
													}else if(type==2){
														 dg='dgVideo';
												    }else if(type==3){
											             dg='dgHtml';
													}else if(type==14){
											             dg='dgSelFlip';
													}else if(type==15){
											             dg='dgSelClient';
													}

													var rows=$("#"+dg).datagrid("getRows");
												
													$('#'+dg).datagrid('cancelEdit', editIndex)
															.datagrid('deleteRow', editIndex);

													editIndex = undefined;
												}
						
										      
						                 </script>
</form>

 <!-- 弹出框  播放时长(秒)-->
    <div id="win-time" class="easyui-window"  closed="true" title="<ww:property value='#session.local.a00747' />" style="width:260px;height:120px;"  data-options="left:'530px',top:'260px',collapsible:false,
		minimizable:false,
		maximizable:false" >
		<div style="padding:20px 20px 10px 30px;">
			<p><input class="easyui-numberbox"   data-options="required:true"  missingMessage="<ww:property value='#session.local.a00671'/>"  id="qieAll" type="text" style="float: left;width: 150px;" /><a style="float: right;" href="javascript:setPlayTimeImgSubmit();" class="easyui-linkbutton"><ww:property value="#session.local.a00080"/></a></p>
		</div>  
    </div>
    
    <!-- 弹出框 播放特效-->
    <div id="win-tx" class="easyui-window"  closed="true" title="<ww:property value='#session.local.a00748'/>" style="width:260px;height:120px;"  data-options="left:'530px',top:'260px',collapsible:false,
		minimizable:false,
		maximizable:false" >
		<div style="padding:20px 20px 10px 30px;">
			<p><input class="easyui-combobox"  data-options="editable:false"   id="txAll" type="text" style="float: left;width: 150px;"   /><a style="float: right;" href="javascript:setPlayTxSubmit();" class="easyui-linkbutton"><ww:property value="#session.local.a00080"/></a></p>
			
		</div>  
    </div>
    
    
    <!-- 弹出框  网页切换时间(秒)-->
    <div id="win-qtime-html" class="easyui-window"  closed="true" title="<ww:property value='#session.local.a00753' />" style="width:260px;height:120px;"  data-options="left:'530px',top:'260px',collapsible:false,
		minimizable:false,
		maximizable:false" >
		<div style="padding:20px 20px 10px 30px;">
			<p><input class="easyui-numberbox"   data-options="required:true"  missingMessage="<ww:property value='#session.local.a00671'/>"  id="qieHtmlAll" type="text" style="float: left;width: 150px;" /><a style="float: right;" href="javascript:setPlayQTimeHtmlSubmit();" class="easyui-linkbutton"><ww:property value="#session.local.a00080"/></a></p>
		</div>  
    </div>
    

    <!-- 弹出框 设置音量大小-->
    <div id="win-vol" class="easyui-window"  closed="true" title="<ww:property value='#session.local.b00018'/>" style="width:260px;height:120px;"  data-options="left:'530px',top:'260px',collapsible:false,
		minimizable:false,
		maximizable:false" >
		<div style="padding:20px 20px 10px 30px;">
			<p><input class="easyui-combobox" data-options="editable:false"  id="volAll" type="text" style="float: left;width: 150px;"   /><a style="float: right;" href="javascript:setPlayVolSubmit();" class="easyui-linkbutton"><ww:property value="#session.local.a00080"/></a></p>
		</div>  
    </div>
    
    
<script>
//$('#sortableList').sortable();
</script>

 <!-- 预览显示 -->           
        <div   id="preview"  style="position: absolute;display: none;">
           <img  id="show_img" src=""  height="100px"  width="150px" />   
 </div>
        
 <input type="hidden" id="sf" name="sf"  value="<ww:property value='#request.sf' />" />    <!-- 缩放比 -->
 
</body>
</html>
