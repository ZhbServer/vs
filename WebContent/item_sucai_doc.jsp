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
<link rel="stylesheet" href="css/colpick.css" type="text/css"/>


<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/easyuiLocal.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script src="js/jscolor.js"></script> 


<script   src="zui-1.5.0-dist/dist/lib/sortable/zui.sortable.js"></script>

<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/datagrid-dnd.js"></script>

<script src="js/fresh.js" type="text/javascript" language="javascript"></script>
<script src="js/colpick.js" type="text/javascript"></script>
<style>
	/* 为可拖动的条目应用可移动光标类型 */
	#sortableList > .list-group-item {cursor: move}
	
	/* 为正在被拖动的条目应用半透明外观 */
	#sortableList > .list-group-item.dragging {
	  visibility: visible;
	  opacity: .3;
	}
	
	input[type="radio"] {
    line-height: normal;
    margin: 0px 0px 0px;
    margin-top: 0px;
    margin-right: 0px;
    margin-bottom: 0px;
    margin-left: 0px;
   }
   em{font-style:italic;} 
   
   .insert-tab tr{line-height:0px;}

   .insert-tab td{text-align:left;padding-left:0px;}
   
   
</style>



<script>


      //初始化
      function onload_data(){
    	  
    	    //素材列表
    	    var  initSucaiListJson="<ww:property value='initSucaiListJson' />";

    	    if(initSucaiListJson!=""){
    	    	//分组id
    	 	    var myOptValue = $("#scGroupCombobox").combobox("getValue") ;
    		    $.ajax({
	 				type:'post',
	 				url:'ajaxToItemSeeSucaiAction.vs',
	 				data:"id=1&checkAjaxState=1"+"&gssi.sucaigroupid="+myOptValue+"&sucai.type="+$("#sucaiType").val(),
	 				dataType:'json',
	 				async:true,
	 				cache:true,
	 				success:function(data){
                         $('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(10,2,null,data));
	 				}
	 			});

    	    } 


  	           //显示内容
  	             
  	           var divHtml=window.parent.$("#layerBigDataParameter").val();
            
  	           $("#yxlist").html(divHtml); 
  	             
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
    	       
    	   

    	       //字体颜色
    	       var fontcolor=document.getElementById("fontcolor").options[document.getElementById("fontcolor").options.selectedIndex].value;

    	       var layerBigDataParameterMap=window.parent.$("#layerBigDataParameterMap").val();

    	

    	       if(layerBigDataParameterMap!=""){

        	      
                   var layerBigDataParameterMapObj = eval( "(" + layerBigDataParameterMap + ")" );//转换后的JSON对象
 
                   var highFontColor =layerBigDataParameterMapObj.highFontColor;

                   var fontColorCb=layerBigDataParameterMapObj.fontColorCb;

                   if(fontColorCb==1){

                	         $("#colpickFontColor").attr("colpickFontColor",highFontColor);

                	         $("#colpickFontColor").css({
      	    		       
    	    	               "backgroundColor":highFontColor
    	    	               
    	    		         });

                	         $("#txtFontColorAdvancedCheckBox").attr("checked",'true');//全选 

                   }else{

                	   setcolor(fontcolor);
                	   
                   }



                   var highBgColor =layerBigDataParameterMapObj.highBgColor;

                   var bgColorCb=layerBigDataParameterMapObj.bgColorCb;

                   //alert(highBgColor+"  "+bgColorCb)

                   if(bgColorCb==1){

                	         $("#colpickBgColor").attr("colpickBgColor",highBgColor);

                	         $("#colpickBgColor").css({
      	    		       
    	    	               "backgroundColor":highBgColor
    	    	               
    	    		         });

                	         $("#txtBgColorAdvancedCheckBox").attr("checked",'true');//全选 

                   }else{

                	   setbackcolor(backcolor);
                	   
                   }
                   


                   

        	   }else{

        		   setcolor(fontcolor);

        		   setbackcolor(backcolor);
        		   
               }
    	     

    	      
    	       var cllComponentOnOff="<ww:property value='#session.version_onoff.cllComponentOnOff' />";

          	  
          	   if(cllComponentOnOff==1){

          		  var relationKey="<ww:property value='relationKey' />";

       	       
       	          $("#relationKey").val(relationKey);
          		 
               }


                   


          	    //字体颜色
          	    $('#colpickFontColor').colpick({
          		    
          	    			layout:'rgbhex',
          	    			color:'#000000',
          	    			onSubmit:function(hsb,hex,rgb,el) {
          	    				
          	    			 	 $(el).colpickHide();
          	    			 	 
          	    			     $("#colpickFontColor").attr("colpickFontColor",'#'+hex);

          	    				 $("#colpickFontColor").css({
          	    		       
          	    	               "backgroundColor":'#'+hex
          	    	               
          	    		         });

          	    		         
          	    				  if($("#txtFontColorAdvancedCheckBox").is(':checked')){

          	    					 setcolor('#'+hex);
          	    		    		
          	    		          }else{
          	    		            
          	    		        	
          	    		          }
          	    				
             	    	          
          	    			},
          	    			onShow:function(o){
          	    				var obj = $(o);
          	    				var divheight = parseInt(obj.css("height"));
          	    				var divtop = parseInt(obj.css("top"));
          	    				var divleft = parseInt(obj.css("left"));
          	    				obj.css("left",divleft+50);//120//修改颜色插件的位置，修复添加多语言后，右边不能完全显示的问题
          	    				if((divheight+divtop)>parseInt($(window).height())){
          	    					obj.css("top",divtop-divheight+10);
          	    				}			
          	    			}
          	    		}
          	     );




          	    //背景颜色
          	    $('#colpickBgColor').colpick({
          		    
          	    			layout:'rgbhex',
          	    			color:'#000000',
          	    			onSubmit:function(hsb,hex,rgb,el) {
          	    				
          	    			 	 $(el).colpickHide();
          	    			 	 
          	    			     $("#colpickBgColor").attr("colpickBgColor",'#'+hex);

          	    				 $("#colpickBgColor").css({
          	    		       
          	    	               "backgroundColor":'#'+hex
          	    	               
          	    		         });

          	    		         
          	    				  if($("#txtBgColorAdvancedCheckBox").is(':checked')){

          	    					setbackcolor('#'+hex);
          	    		    		
          	    		          }else{
          	    		            
          	    		        	
          	    		          }
          	    				
             	    	          
          	    			},
          	    			onShow:function(o){
          	    				var obj = $(o);
          	    				var divheight = parseInt(obj.css("height"));
          	    				var divtop = parseInt(obj.css("top"));
          	    				var divleft = parseInt(obj.css("left"));
          	    				obj.css("left",divleft+50);//120//修改颜色插件的位置，修复添加多语言后，右边不能完全显示的问题
          	    				if((divheight+divtop)>parseInt($(window).height())){
          	    					obj.css("top",divtop-divheight+10);
          	    				}			
          	    			}
          	    		}
          	     );

    	       
            
       }

      //鼠标悬浮预览绑定
      function onMousePreView(){
    		  
           
	    	 $(".datagrid-row").mouseover(function(){  
	              
	            var e = event || window.event;       
	  	        var url = $(this).children("td").eq(2).text();
	  	       
	  	        if (url == "") {
	  	        	 $("#preview").hide();   
	  	            //$("#show_img").attr("src", "${ctx}/images/person.jpg");  
	  	        } else {  
	  	            //$("#show_img").attr("src", "files/" + url);
	  	            //$("#preview").css("top", ($(this).offset().top+10) + "px").css("left", ($(this).offset().left+e.clientX) + "px").show();
	  	            //var clientY=e.clientY+5;
	  	            //if(e.clientY+100>520){
	  	            //	clientY=e.clientY-100;  
		  	        //}
	  	            //$("#preview").css("top", (clientY) + "px").css("left", (e.clientX+10) + "px").show();         
	  	        }
	  	         
	  	          
	  	    });  
	    	$(".datagrid-row").mouseout(function(){  
	  	        $("#preview").hide();  
	  	    });  

	    	

      } 
      
  
            
 

      //清空素材列表数据
      function clearDgList(){
    	 
          var sucais = $('#dg').datagrid('getRows');
          if (sucais) {
               for (var i = sucais.length - 1; i >= 0; i--) {
            	   
                   var index = $('#dg').datagrid('getRowIndex', sucais[i]);
                   $('#dg').datagrid('deleteRow', index);
                   
               }
          }

      }


      /*弹出上传页面*/
      function open_item_sucai_onload(url){
      	 
    	   //分组id
 	       var myOptValue = $("#scGroupCombobox").combobox("getValue") ;

    	   if(myOptValue==-1){
              layer.msg("<ww:property value='#session.local.b00016'/>");
              return;
           }
 	       
      	   layer.open({
      			type: 2,
      		    area: ['700px', '430px'],
    	        offset: '30px',
      	        fix: false, //不固定
      	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
      	        content: url,
      	        scrollbar: false,
      	        title:false,
      	        end: function(){ 
     	        
      	    	   /*添加素材操作日志*/
      	    	   getpartnodiv("addlogsucai.vs?sucaiType="+$("#sucaiType").val());
      	    	   
      	    	   /*刷新页面*/
      	    	   clearDgList();
      	    	   
      	    	   $.ajax({
		 				type:'post',
		 				url:'ajaxToItemSeeSucaiAction.vs',
		 				data:"id=1&checkAjaxState=1"+"&gssi.sucaigroupid="+myOptValue+"&sucai.type="+$("#sucaiType").val(),
		 				dataType:'json',
		 				async:true,
		 				cache:true,
		 				success:function(data){

      	    		          $('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(10,2,null,data));
		 			      
		 				}
		 			});
      			}
      		});            
      }

      //添加到播放列表
      function addPlayMuti(){
           //获取素材列表已选
    	  var selRows = $('#dg').datagrid('getChecked');
    	  $('#dg').datagrid('clearSelections');
    	  
    	  for(var i=0;i<selRows.length;i++){

    		  var font =document.getElementById("yxlist");
    		  
         	  font.focus();

         	  var txtContent=selRows[i].tScTxtContent;
   
         	  txtContent=txtContent.replace(/&lt;/g,"<");
         	  
         	  txtContent=txtContent.replace(/&gt;/g,">");
         	 
        	  document.getElementById("yxlist").innerHTML=txtContent;


        	  if($("#txtFontColorAdvancedCheckBox").is(':checked')){

        		  setcolor($("#colpickFontColor").attr("colpickFontColor"));
          		
              }else{

            	  //字体颜色
                  var fontcolor=document.getElementById("fontcolor").options[document.getElementById("fontcolor").options.selectedIndex].value;
                  //var fontcolor=$("#colpickFontColor").attr("colpickFontColor");
                  
                  setcolor(fontcolor);
                  
              	
              }


        	  if($("#txtBgColorAdvancedCheckBox").is(':checked')){

        		  setbackcolor($("#colpickBgColor").attr("colpickBgColor"));
          		
              }else{

            	  //字体颜色
                  var backcolor=document.getElementById("backcolor").options[document.getElementById("backcolor").options.selectedIndex].value;
                  
                  setbackcolor(backcolor);
                  
              	
              }
              
        	  
        	  
    		  
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
        window.document.execCommand("SelectAll",null,null);
    	   

    };
    
    function setcolor(value) {
    	seldiv();
    	document.execCommand("ForeColor", "false", value); 
    }

    //普通设置字体颜色
    function generalSetColor(value){
        
    	  if($("#txtFontColorAdvancedCheckBox").is(':checked')){

          	 
      		
          }else{
              
        	   setcolor(value);
          	   
          }

    }

    function setbackcolor(value) {
    	seldiv();
    	if(value==0){
    		document.execCommand("BackColor", "false", "transparent");
        }else{
        	document.execCommand("BackColor", "false", value);
        }  
    	
    }


    //普通设置背景颜色
    function generalSetBgColor(value){
        
    	  if($("#txtBgColorAdvancedCheckBox").is(':checked')){

          }else{
              
        	  setbackcolor(value);
          	   
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


    function savaSubmit(){
        
      	  //var xy_x = document.getElementById("xy_x").value;
      	  //var xy_y = document.getElementById("xy_y").value;   
          //  var width = document.getElementById("width").value;
      	  //var height = document.getElementById("height").value;
      	  var xy_x=0;
      	  var xy_y=0;
      	  var width=300;
      	  var height=300;
      	  var font =document.getElementById("yxlist");



      	  //字体类型
           var  fonttype=document.getElementById("fonttype").options[document.getElementById("fonttype").options.selectedIndex].text;


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
           var backcolor=document.getElementById("backcolor").options[document.getElementById("backcolor").options.selectedIndex].value;

           //高级背景颜色
           var bgColorCb=0;
           var highBgColor="";
           if($("#txtBgColorAdvancedCheckBox").is(':checked')){

        	   highBgColor=$("#colpickBgColor").attr("colpickBgColor");
        	   bgColorCb=1;
           }else{
               
        	   highBgColor=backcolor;
        	   bgColorCb=0;
           }

           

           //字体颜色
           var fontcolor=document.getElementById("fontcolor").options[document.getElementById("fontcolor").options.selectedIndex].value;


           //高级字体颜色
           var fontColorCb=0;
           var highFontColor="";
           if($("#txtFontColorAdvancedCheckBox").is(':checked')){

        	   highFontColor=$("#colpickFontColor").attr("colpickFontColor");
        	   fontColorCb=1;
           }else{
               
        	   highFontColor=fontcolor;
        	   fontColorCb=0;
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

      	   var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
      	 
      	   window.parent.returnValue=""; 

      	   var cllComponentOnOff="<ww:property value='#session.version_onoff.cllComponentOnOff' />";

      	   var relationKey="";

      	   if(cllComponentOnOff==1){

      		   relationKey=$("#relationKey").val();
      		 
           }

      	 
      	   //X@Y@宽@高@字体类型@字体大小@字距@滚动方式@滚动速度@文本内容@背景颜色@字体颜色@加粗@斜体@下划线@中线@key(二次开发)@高级字体颜色@高级字体颜色checkbox
           window.parent.returnValue=xy_x+"@"+xy_y+"@"+width+"@"+height+"@"+fonttype+"@"+fonsize+"@"+lineH
                                     +"@"+gdtype+"@"+gdspeed+"@"+fontContent+"@"+backcolor+"@"+fontcolor
                                     +"@"+fbold+"@"+fitallic+"@"+fsetline+"@"+fsetstrike+"@"+textDataSource+"@"+advancedType+"@"+relationKey+"@"+highFontColor+"@"+fontColorCb+"@"+highBgColor+"@"+bgColorCb; 

           setLayerBigDataParameterMap("");

           window.parent.layer.close(index);
           
       	   //document.form1.action="adimageto.vs";
       	   //document.form1.submit();

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

    function checkEnter(){

    	  var e = window.event ;
       
          if (e.keyCode == 13 && !e.shiftKey) {

            	alert( "<ww:property value='#session.local.b00354'  />  Shift+Enter ");

            	e.returnValue = false;

          }else if(e.keyCode == 13 && e.shiftKey){

          }

    }
    document.oncontextmenu=new Function("event.returnValue=false;");
    //document.onselectstart=new Function("event.returnValue=false;");
</script>
</head>
<body onload="onload_data()">
    
    <form method="post" name="form1" action="">
       <div class="panel panel-primary" style="margin: 3px 3px;">
           <div class="panel-heading">
                TXT
           </div>
          <div class="container clearfix" style="margin: 10px 10px;">
          <div class="main-wrap" style="width:950px;">
		      <div class="result-wrap">
		          <div class="result-content">
		            <table class="insert-tab" width="100%" style="text-align: center;">
			           
			           <tr style="height: 280px;">
			            <td  colspan="3"  style="padding-left: 20px;">
			                   <div id="targetDivContent" style="display: none;">
			                        
			                   </div>
			                   
			                   <div id="targetDivContentImg" style="padding-top: 10px;">
			                        
			                        <!-- 文本列表 -->
						            <div style="float: left;margin: 0px 0px 10px 0px; padding: 0px 0px;" >
						               <div style="height: 392px;width: 350px;">
							                 <table id="dg" class="easyui-datagrid"  title="<ww:property value='#session.local.b00017'/>" style="width:350px;height:392px;margin: 0px;padding: 0px;"
												data-options="
												    rownumbers:true,
													singleSelect: true,
													toolbar: '#tb0',
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
							      
							              <div id="tb0" style="height:auto;line-height: 0px;">
												
												<div>
													<ww:property value='#session.local.b00014'  />:<!-- 分组 --> 
													<select  id="scGroupCombobox"  class="easyui-combobox" panelHeight="auto" style="width:100px;height: 20px;">
														<option <ww:if test="gssi.sucaigroupid==0">selected="selected" </ww:if>  value="0"><ww:property value='#session.local.a00815'  /></option> <!-- 全部 -->
														<option <ww:if test="gssi.sucaigroupid==-1">selected="selected" </ww:if>  value="-1"><ww:property value='#session.local.b00015'  /></option><!-- 共享 -->
														<ww:iterator value="listsfgp">
														       <option  <ww:if test="gssi.sucaigroupid==id">selected="selected" </ww:if>  value="<ww:property value='id'  />"><ww:property value="name"  /></option>
														</ww:iterator>
													</select>
													<input id="ser" class="easyui-searchbox" data-options="prompt:'<ww:property value='#session.local.a00071'  />',searcher:doSearch" style="width:100px"></input>
													
													<a style="height: 20px;" title="<ww:property value='#session.local.a00063' />" href="javascript:open_item_sucai_onload('uptxt.jsp')" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick=""></a>
	
													<script>
													    //分组combobox事件
													    $("#scGroupCombobox").combobox({
													    	onChange : function(){
													    	     //$('#ser').combo('setText','');  
													    	
													    	     //分组id
													    	     var myOptValue = $("#scGroupCombobox").combobox("getValue") ;
													    	   
													    	     //ajax请求获取数据
                                                                 $.ajax({
													 				type:'post',
													 				url:'ajaxToItemSeeSucaiAction.vs',
													 				data:"id=1&checkAjaxState=1"+"&gssi.sucaigroupid="+myOptValue+"&sucai.type="+$("#sucaiType").val(),
													 				dataType:'json',
													 				async:true,
													 				cache:true,
													 				success:function(data){
                                                                     
													    	    	   //隐藏鼠标悬浮
													    	    	   $("#preview").hide();

													    	    	   $('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(10,2,null,data));
													    	    	    
													 
													 				}
													 			});													    	   
													    	}
														}); 

													    //搜索
														function doSearch(value,name){
															  var myOptValue = $("#scGroupCombobox").combobox("getValue") ;
															  $.ajax({
													 				type:'post',
													 				url:'ajaxToItemSeeSucaiAction.vs',
													 				data:"id=1&checkAjaxState=1&sel=1&ser="+value+"&gssi.sucaigroupid="+myOptValue+"&sucai.type="+$("#sucaiType").val(),
													 				dataType:'json',
													 				async:true,
													 				cache:true,
													 				success:function(data){
													 			       
																       $('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(10,2,null,data));
																      
													 				}
															  });
															
														}
														
													</script>
													
													
													
												</div>
										  </div>
	
								   
						           </div>
						           
								    <div class="part2_2 part2_2_3" style="float: left;margin-right: 0px; margin-top: 80px;width: 50px;">
											<button  onclick="addPlayMuti()" class="btn btn-primary"   title="<ww:property value='#session.local.a00270' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-right " ></i>
								            
								            </button>
											<!--添加到已选列表  -->
											
								    </div>
								    
								    
								    
                                    
						           
						           
						           <div id="log" title="<ww:property value="#session.local.b00013"  />"  class="easyui-panel"  style="float: left;margin: 0px 0px; padding: 0px 0px;height: 390px;width: 500px;" >
	                                    
	                                        
										      <div  onkeydown="checkEnter()"   onpaste="javascript:return false;" style="width:460px;height: 200px;font-size: 18px;border: 1px solid #d5d5d5;overflow: auto;margin-left: 15px;margin-top: 5px;" contentEditable='true'   id="yxlist">
							                      
							           
							                  </div>
										      
										   
										    <div>
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
						<select style="width: 50px;"  name="fontcolor" id="fontcolor" onchange="generalSetColor(this.value)"  title="<ww:property value='#session.local.a00325' />">					 
							  <option  <ww:if test="#request.txtfontcolor=='000000'">selected="selected"</ww:if> value="#000000"><ww:property value='#session.local.a00337' /></option>
							  <option  <ww:if test="#request.txtfontcolor=='FFFFFF'">selected="selected"</ww:if> value="#FFFFFF"><ww:property value='#session.local.a00340' /></option>
							  
							  <option  <ww:if test="#request.txtfontcolor=='3F48CC'">selected="selected"</ww:if> value="#3F48CC"><ww:property value='#session.local.a00339' /></option>
							  <option  <ww:if test="#request.txtfontcolor=='FFC90E'">selected="selected"</ww:if> value="#FFC90E"><ww:property value='#session.local.a00342' /></option>
							  <option  <ww:if test="#request.txtfontcolor=='22B14C'">selected="selected"</ww:if> value="#22B14C"><ww:property value='#session.local.a00341' /></option>
							  
							  <option  <ww:if test="#request.txtfontcolor=='7F7F7F'">selected="selected"</ww:if> value="#7F7F7F"><ww:property value='#session.local.a00343' /></option>
							  
							  <option  <ww:if test="#request.txtfontcolor=='ED1C24'">selected="selected"</ww:if>  value="#ED1C24"><ww:property value='#session.local.a00338' /></option>
						</select>
						
						<input type="checkbox" id="txtFontColorAdvancedCheckBox"  onchange="" value="1" style="margin-top: -5px;"/>
						
						<span id="colpickFontColor" style="width: 20px;height: 25px;background-color: #000000;display: block;float: right;cursor: pointer;margin-left: 5px;">
						
						</span>
						
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
				               <option <ww:if test='gdspeed==3'>selected="selected"</ww:if> value="3"><ww:property value="#session.local.b00035" /></option><!-- 正常 -->
				               <option <ww:if test='gdspeed==2'>selected="selected"</ww:if>  value="2"><ww:property value="#session.local.b00034" /></option><!--慢 -->
				               <option <ww:if test='gdspeed==1'>selected="selected" </ww:if>value="1"><ww:property value="#session.local.b00033" /></option><!-- 超慢 -->
				            </select>
												         
						</li>
						
						
						
						<li>
						<!-- 背景颜色 -->
						<ww:property value="#session.local.a00358"/>:
						<select style="width: 50px;" name="backcolor" id="backcolor" onchange="generalSetBgColor(this.value)" title="<ww:property value='#session.local.a00358' />">
												
							  <option  <ww:if test="#request.fbackcolor=='ED1C24'">selected="selected"</ww:if>   value="#ED1C24"><ww:property value='#session.local.a00338' /></option>
							  <option  <ww:if test="#request.fbackcolor=='3F48CC'">selected="selected"</ww:if>   value="#3F48CC"><ww:property value='#session.local.a00339' /></option>
							  <option  <ww:if test="#request.fbackcolor=='FFC90E'">selected="selected"</ww:if>   value="#FFC90E"><ww:property value='#session.local.a00342' /></option>
							  <option  <ww:if test="#request.fbackcolor=='22B14C'">selected="selected"</ww:if>   value="#22B14C"><ww:property value='#session.local.a00341' /></option>
							  <option  <ww:if test="#request.fbackcolor=='FFFFFF'">selected="selected"</ww:if>   value="#FFFFFF"><ww:property value='#session.local.a00340' /></option>
							  <option  <ww:if test="#request.fbackcolor=='7F7F7F'">selected="selected"</ww:if>   value="#7F7F7F"><ww:property value='#session.local.a00343' /></option>
							  <option  <ww:if test="#request.fbackcolor=='000000'">selected="selected"</ww:if>   value="#000000"><ww:property value='#session.local.a00337' /></option>
							  <option  <ww:if test="#request.fbackcolor==0">selected="selected"</ww:if>   value="0"><ww:property value='#session.local.a00366' /></option>
												   
						</select> 
						
						<input type="checkbox" id="txtBgColorAdvancedCheckBox"  onchange="" value="1" style="margin-top: -5px;"/>
						
						<span id="colpickBgColor" style="width: 20px;height: 25px;background-color: #000000;display: block;float: right;cursor: pointer;margin-left: 5px;">
						</span>
						
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
						
						<ww:if test="#session.version_onoff.cllComponentOnOff==1">
						
						       <li>key:<input type="text" name='relationKey'  id="relationKey"  style="width: 80px;height: 27px;" /></li>
						
						</ww:if>
						
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
			                 
			                  
			                 
			            </td>
			       </tr>
			           
			       <tr>
					    <td colspan="3" style="height: 45px;padding-left: 350px;"    >
			                 <button class="btn btn-primary" onclick='savaSubmit()' type="button"><ww:property value='#session.local.a00080' /></button>
			                 
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

									        
								             
								             var txs = [{ "value": "6", "text": "<ww:property value='#session.local.a00029' />" },
								                        { "value": "0", "text": "<ww:property value='#session.local.a00277' />" }, 
											            { "value": "1", "text": "<ww:property value='#session.local.a00278' />" },
											            { "value": "2", "text": "<ww:property value='#session.local.a00279' />" },
											            { "value": "3", "text": "<ww:property value='#session.local.a00280' />" },
											            { "value": "4", "text": "<ww:property value='#session.local.a00281' />" },
											            { "value": "5", "text": "<ww:property value='#session.local.a00266' />" }
											           ];

								             var onoffs = [
												             { "value": "0", "text": "<ww:property value='#session.local.a00233' />" },
								                             { "value": "1", "text": "<ww:property value='#session.local.a00232' />" }
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


								             function unitformatteronoff(value, rowData, rowIndex) {
									        	  
									        	    for (var i = 0; i < onoffs.length; i++) {
									        	        if (onoffs[i].value == value) {
										        	        
									        	            return onoffs[i].text;
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
								        			if ($('#dgPlay').datagrid('validateRow', editIndex)){
									        			
								        				$('#dgPlay').datagrid('endEdit', editIndex);
								        				editIndex = undefined;
								        				return true;
								        			} else {
								        				return false;
								        			}
								        		}

								               

								        		

								        		
												function onClickCell(index, field){
													
													if (endEditing()){
														$('#dgPlay').datagrid('selectRow', index)
																.datagrid('editCell', {index:index,field:field});
														editIndex = index;
													}
													
												}


							                    function removeit(type){
													if (editIndex == undefined){return;}

													  var dg='';
													  if(type==0){
													       dg='dgPlay';
													  }else if(type==1){
													       dg='dg';
													  }else if(type==2){
													 	   dg='dgVideo';
													  }else if(type==3){
													       dg='dgHtml';
													  }


													
													var rows=$("#"+dg).datagrid("getRows");
												
													
													$('#'+dg).datagrid('cancelEdit', editIndex)
															.datagrid('deleteRow', editIndex);
													editIndex = undefined;
												}

							                   
										      
						                 </script>
						       
			
		<!--隐藏域 -->
		            
		<!--当前页码-->			       
		<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />          
        <!--素材类型-->
        <input type="hidden" name="sucai.type"  id="sucaiType" value="<ww:property value="sucai.type"/>"/> 
        <!--分组-->
        <input type="hidden" name="gssi.sucaigroupid"  id="gpid" value="<ww:property value='gssi.sucaigroupid'/>"/>
        <!--节目文件名 --> 
        <input type="hidden" value="<ww:property value='mfile'/>" name="mfile" id="mfile" />
        <!-- 数据源 -->
        <input type="hidden" value="" name="jsonData" id="jsonData" />
        
        <input type="hidden" id="sf" value="<ww:property value="sf"/>" name="sf" />
             
        <!-- 预览显示 -->           
        <div   id="preview"  style="position: absolute;display: none;">
           <img  id="show_img" src=""  height="100px"  width="150px" />   
        </div>
                                    
</form>
 <!-- 弹出框  播放时长(秒)-->
    <div id="win-time" class="easyui-window"  closed="true" title="<ww:property value='#session.local.a00747' />)" style="width:260px;height:120px;"  data-options="left:'510px',top:'160px',collapsible:false,
		minimizable:false,
		maximizable:false" >
		<div style="padding:20px 20px 10px 30px;">
			<p><input class="easyui-numberbox"  id="qieAll" type="text"  style="float: left;width: 150px;" /><a style="float: right;" href="javascript:setPlayTimeImgSubmit();" class="easyui-linkbutton"><ww:property value="#session.local.a00080"/></a></p>
		</div>  
    </div>
    
    <!-- 弹出框 播放特效-->
    <div id="win-tx" class="easyui-window"  closed="true" title="<ww:property value='#session.local.a00748'/>)" style="width:260px;height:120px;"  data-options="left:'510px',top:'160px',collapsible:false,
		minimizable:false,
		maximizable:false" >
		<div style="padding:20px 20px 10px 30px;">
			<p><input class="easyui-combobox"   id="txAll" type="text" style="float: left;width: 150px;"   /><a style="float: right;" href="javascript:setPlayTxSubmit();" class="easyui-linkbutton"><ww:property value="#session.local.a00080"/></a></p>
			
		</div>  
    </div>
    
<script>
//$('#sortableList').sortable();
</script>
</body>
</html>
