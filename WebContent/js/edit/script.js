//项目访问地址
var pUrl = $("#pUrl").val();
var ctxStatic = $("#ctxStatic").val();
var curDiv;
var curScene = $("#topfd1");
var ycCount=5;

//节目标准字体计算(横屏 高400px是18像素，竖屏 宽710是18px)
var standardFontSize = 18;
var standardWidth = 710;
var standardHeight = 400;

var standardfsize = 18;
var standardscalefsize = 18;

var pHost = window.location.host;

//是否竖屏
var isVertical = false;

//是否支持天气
var isSupportWeatherFlag = null;

//是否已经保存标志
var isSaved = false;
//提交表单后是否保存为已经保存标志
var submitSavedFlag = false;
//提交表单后否跳转到下一步
var submitToNext = false;

//撤销、重做功能基础数据
var historical = [];
var curKey = -1;
var curHis = "";

//定时器key-value记录,用于注销定时器功能
var timerTasks = {}; 

//支持超链接/场景跳转功能的类型跳转
var skip = "text_edit,img_edit,office_edit,ppt_edit,excel_edit,word_edit,";

//textEditor
var textEditorTool = $("#textEditor");

//节目语言
var programLanguage = "";

//是否大屏幕(屏幕垂直高度大于等于1000px)
var isBigScreen = null;

//正在拖动的图片的父级DIV
var $srcImgDiv = null; 
//控件编辑区素材拖拽改变顺序回调方法对象(编辑区、垂直顺序、公用)
//使用方法：
//1.需要拖拽的项增加class "edit_drag_item",增加回调key属性 attr "dragtype"
//2.增加回调方法 以回调key属性("dragtype")的值为键，回调方法为值 ，add到 EditorAreaDragCallbackMethod对象中,该回调方法有2个参数，第一个是拖拽的项(JQ对象)，第二个是停止拖拽坐标的项(JQ对象)
//注意：如果拖拽项没设置edit_drag_item将不能拖拽，没设置dragtype属性，将不会触发回调方法，触发方法时，编辑区的元素顺序已经发生改变
var editorAreaDragCallbackMethod = {};

/****统计显示必须资源，用于生成节目文件*****/
//功能集
var functionalitySet = {};
//素材集
var materialCollection = {};
//素材id集
var materialIds = "";
//素材集
var materialJH = {};

//素材库当次选中素材记录
var materialSelected = null;

//替换flag only-one
var materialReplaceFlag = false;
//当前图片素材序号(用于替换和在当前素材后添加素材)
var imgReplaceNo = null;
//当前视频素材序号(用于替换和在当前素材后添加素材)
var videoReplaceNo = null;
//当前文档素材序号(用于替换和在当前素材后添加素材)
var officeReplaceNo = null;
//当前混播素材素材序号(用于替换和在当前素材后添加素材)
var mixedReplaceNo = null;


//图片控件初始化参数
var initImgWidth = 200;
var initImgHeight = 200;



$("#for_backg_edit").addClass("active");
var curSceneCount = 1;
var total = 0;
var curelement = null;
var preelement = null;
var prev = null;
var $curImgList = [];
var zindex = 0;
var widget = [];
var snapline_h = $("#designer_op_snapline_h");
var snapline_v = $("#designer_op_snapline_v");

//场景缩放比例
var scale = 0;
//节目宽高
var programWidth = 0;
var programHeight = 0;
//节目显示宽高
var programShowWidth = 0;
var programShowHeight = 0;
var isEditProgramShow = true;

//场景宽高
var sceneWidth = 0;
var sceneHeight = 0;

var weather_wratio = 0.05;
var weather_hratio = 0.1;

/**
* 将秒数换成时分秒格式
*/
 function formatSeconds(value) {
    var theTime = parseInt(value);// 秒
    var theTime1 = 0;// 分
    var theTime2 = 0;// 小时
    if(theTime >= 60) {
        theTime1 = parseInt(theTime/60);
        theTime = parseInt(theTime%60);
        if(theTime1 >= 60) {
            theTime2 = parseInt(theTime1/60);
            theTime1 = parseInt(theTime1%60);
        }
    }
    console.log("传入的参数---------------"+value);
    console.log("秒-----------------"+theTime);
    console.log("分-----------------"+theTime1);
    console.log("时-----------------"+theTime2);
     if(theTime < 10){
    	theTime = "0" + theTime;
     }
     var result = ""+theTime;     
     if(theTime1 > 0) {    	
    	 if(theTime1 < 10){
    		 theTime1 = "0" + theTime1;
   	     }
    	 result = ""+theTime1+":"+result;
     }else{
    	 result = ""+"00"+":"+result;
     }
     if(theTime2 > 0) {    	
    	 result = ""+theTime2+":"+result;
     }else{
    	 console.log("时1 result："+result);
    	 result = "00:"+result;
     }
    return result;
}
 
function sortNumber(a,b){
	return a - b;
}

//单击元素显示值
function displayMaterialInfo(id,x,y,w,h,readonly){						
	$("#lname").html(id);
	$("#lleft").val( Math.round(x/$("#sf").val()));
	$("#ltop").val( Math.round(y/$("#sf").val()));
	$("#lwidth").val(Math.round(w/$("#sf").val()));
	$("#lheight").val(Math.round(h/$("#sf").val()));
	if($("#"+id).attr("ycCount")==null||$("#"+id).attr("ycCount")==0)
	{
		$("#ycCount").val(ycCount);
	}else
	{
		$("#ycCount").val($("#"+id).attr("ycCount"));
	}

	if (readonly!=null){
		$(".number-input").attr("disabled",readonly);
	}else{
		$(".number-input").attr("disabled",false);
	}
	
	//alert($("#"+id).css("zIndex"));

    /*元素类型*/
    var ctype=id.substring(0,5);
    console.log("ctype: "+ctype);
    var ctypeShow="";
     
     //页面根据元素类型显示相应的文字说明
     if(ctype=="image"){

		    ctypeShow=localObj.a00061;
		  
			var selfElement=$("#"+id); 
			
			var yxSucaiListJson=selfElement.attr("jsonData");
			
			var layerBigDataParameterObj = eval( "(" + yxSucaiListJson + ")" );//转换后的JSON对象
            
			if(layerBigDataParameterObj.blflag==1){
				
				 selfElement.css({
					
			  	      "width":Math.round(selfElement.height()*layerBigDataParameterObj.bl)+"px"
			  	      
			     });
			}
			  
		   
		    
		
		    
	    
     }else if(ctype=="video"){
	     
	      ctypeShow=localObj.a00060;
	      
     }else if(ctype=="myppt"){
	     
	      ctypeShow="PPT";
	      
     }else if(ctype=="mydoc"){
	     
	      ctypeShow="Word";
	      
     }else if(ctype=="myxls"){
	     
	      ctypeShow="Excel";
	      
     }else if(ctype=="mypdf"){
	     
	      ctypeShow="PDF";
	      
     }else if(ctype=="fonts"){
	     
	      ctypeShow=localObj.a00062;
	      
     }else if(ctype=="mynew"){
	     
	      ctypeShow="Rss";
	      
	 }else if(ctype=="mytqs"){
		 
		ctypeShow=localObj.a00177;
		var mytqsobj=$("#"+id); 
		
		var fontsize_width = parseInt(mytqsobj.css("width"))/4.0;	
		
		mytqsobj.css({
			
  	      "fontSize":Math.round(fontsize_width*0.5)+"px"
  	      
        });
	    
		
		
	 }else if(ctype=="mytim"){
		
		ctypeShow=localObj.a00248;
		
	  
		
	 }else if(ctype=="htmls"){
		 
		ctypeShow=localObj.a00189;
		
	 }else if(ctype=="mycam"){
		 
		ctypeShow=localObj.a00692;
		
	 }else if(ctype=="qsing"){
		 
		ctypeShow=localObj.a00701;
		
	 }else if(ctype=="qmany"){
		 
		ctypeShow=localObj.a00700;
		
	 }else if(ctype=="seejp"){
		 
		ctypeShow=localObj.a00178;
		
	 }else if(ctype=="mybus"){
		 
		ctypeShow=localObj.a00774;
		
	 }else if(ctype=="charg"){
		 
		ctypeShow=localObj.b00090;
		
	 }else if(ctype=="sourc"){
		 
		ctypeShow=localObj.a00996;
		
	 }else if(ctype=="dllIt"){
		 
		ctypeShow=localObj.b00118;
		
	 }else if(ctype=="imggr"){
		 
		ctypeShow=localObj.b00127;
			
	 }else if(ctype=="imgfl"){
		 
			ctypeShow=localObj.b00320;
				
     }else if(ctype=="himag"){
		 
			ctypeShow=localObj.b00047;
				
	}else if(ctype=="envir"){
		 
		ctypeShow=localObj.b00159;
			
    }else if(ctype=="eleva"){
		 
		ctypeShow=localObj.b00277;
			
     }else if(ctype=="mycal"){
		 
 		ctypeShow="mycall";
 			
     }else if(ctype=="faceR"){
    	ctypeShow=localObj.b00112;
     }else if(ctype=="caroY")
     {
    	 ctypeShow=localObj.d00007;
     }else if(ctype=="caroD")
     {
    	 ctypeShow=localObj.d00008;
     }else if(ctype=="searc")
     {
    	ctypeShow=localObj.a00263; 
     }else if(ctype=="catal")
     {
    	ctypeShow=localObj.d00013;
     }else{		 
		ctypeShow="";
	 }
     console.log("ctypeShow: "+ctypeShow);
     $("#ltype").html(ctypeShow);
     
}
 
 /*function domMove(orientation){
	var flag = "";
	var value = "";
	switch(orientation){
		case "left":
			flag = "left";
			value = -1;
		break;
		case "top":
			flag = "top";
			value = -1;
		break;
		case "right":
			flag = "left";
			value = 1;
		break;
		case "bottom":
			flag = "top";
			value = 1;
		break;				
	}
	
$("input[name = checkdom]:checkbox").each(function(){
	if ($("input[id="+$(this).attr("id")+"]").prop("checked")){
					
		$("#"+$(this).attr("id")).css(flag,parseInt($("#"+$(this).attr("id")).css(flag))+value)
					//displayMaterialInfo($(this).attr("id")),0,0,parseInt(curScene.css("width")),parseInt(curScene.css("height")),true);	
		displayMaterialInfo($(this).attr("id"),parseInt($("#"+$(this).attr("id")).css("left")),parseInt($("#"+$(this).attr("id")).css("top")),parseInt($("#"+$(this).attr("id")).css("width")),parseInt($("#"+$(this).attr("id")).css("height")));	 				
			}									
	})
		
}*/

 function domchange(flag,value){
	 var curScene = $("#topfd1");
	 console.log("flag:"+flag+"---------value:"+value);
		$("input[name = checkdom]:checkbox").each(function(){			
		if ($("input[eId="+$(this).attr("eId")+"]").prop("checked")){									
			if(!$("#"+$(this).attr("eId")).attr("lock")){													
				switch(flag){
				case "left":
					console.log(flag+":"+parseInt($("#"+$(this).attr("eId")).css(flag))+"----场景："+parseInt(curScene.css("width")));
					if ((0<=parseInt($("#"+$(this).attr("eId")).css(flag))+value)&&(parseInt($("#"+$(this).attr("eId")).css(flag))+value+parseInt($("#"+$(this).attr("eId")).css("width"))<=parseInt(curScene.css("width")))){
						
						$("#"+$(this).attr("eId")).css(flag,parseInt($("#"+$(this).attr("eId")).css(flag))+value);
					}
				
				break;
				case "top":
					console.log(flag+":"+parseInt($("#"+$(this).attr("eId")).css(flag))+"----场景："+parseInt(curScene.css("heig")));
					if ((0<=parseInt($("#"+$(this).attr("eId")).css(flag))+value)&&(parseInt($("#"+$(this).attr("eId")).css(flag))+value+parseInt($("#"+$(this).attr("eId")).css("height"))<=parseInt(curScene.css("height")))){
						$("#"+$(this).attr("eId")).css(flag,parseInt($("#"+$(this).attr("eId")).css(flag))+value);
					}
				break;
				case "width":
				if ((0<=parseInt($("#"+$(this).attr("eId")).css(flag))+parseInt($("#"+$(this).attr("eId")).css(flag))+value)&&(parseInt($("#"+$(this).attr("eId")).css("left"))+parseInt($("#"+$(this).attr("eId")).css(flag))+value<=parseInt(curScene.css("width")))){
						$("#"+$(this).attr("eId")).css(flag,parseInt($("#"+$(this).attr("eId")).css(flag))+value);
					}
				break;
				case "height":
				if ((0<=parseInt($("#"+$(this).attr("eId")).css(flag))+value)&&(parseInt($("#"+$(this).attr("eId")).css("top"))+parseInt($("#"+$(this).attr("eId")).css(flag))+value<=parseInt(curScene.css("height")))){
						$("#"+$(this).attr("eId")).css(flag,parseInt($("#"+$(this).attr("eId")).css(flag))+value);
					}
				break;
				
				}
					
			
					//displayMaterialInfo($(this).attr("id")),0,0,parseInt(curScene.css("width")),parseInt(curScene.css("height")),true);	
				displayMaterialInfo($(this).attr("eId"),parseInt($("#"+$(this).attr("eId")).css("left")),parseInt($("#"+$(this).attr("eId")).css("top")),parseInt($("#"+$(this).attr("eId")).css("width")),parseInt($("#"+$(this).attr("eId")).css("height")));
			}			
		}										
	})
		
}


 


//根据屏幕大小变更设置
function updateShowByScreen(){
	if(isBigScreen){
		$(".widget").addClass("widget-big");
	}else{
		$(".widget").removeClass("widget-big");
	}
}

var localObj;

$(function(){	
	
	
	 var h = document.body.clientHeight;
	/****************************************生成操作菜单**************************************/
    
    //动态创建菜单列表
    
    var menu_ui=$(".menu_new");
    
    var localJsonStr=$("#localJson").val();

	localJsonStr=localJsonStr.replace(/&quot;/g,"'");
	     	  
    localObj = eval( "(" + localJsonStr + ")" );//转换后的JSON对象
   
    
    //集合
    var menu_array=new Array();
    
    //图片
    var menu_img=$("<li id='step3' class='menu_li' style='height:66px;'><a id='for_img_edit'><img src='image/menu_img/menu_img.png' />"+localObj.a00061+"</a></li>");
    menu_array[menu_array.length]=menu_img;
    
    menu_img.click(function(){
    	addimg();
    });
    
    //视频
    var menu_video=$("<li id='step2' class='menu_li' style='height:66px;><a id='for_video_edit' ><img src='image/menu_img/menu_video.png'/>"+localObj.a00060+"</a></li>");
    menu_array[menu_array.length]=menu_video;
    
    menu_video.click(function(){
    	addvideo();
    });
    
    //时钟
    var menu_time=$("<li class='menu_li' style='height:66px;><a id='for_time_edit'><img src='image/menu_img/menu_time.png'/>"+localObj.a00248+"</a></li>");
    menu_array[menu_array.length]=menu_time;
    
    menu_time.click(function(){
    	addtime();
    });
    
    if($("#screenTypeHtml").val()==1){
    	
    	
    }else{
    	
    	//文档(TxT)
        var menu_doc=$("<li class='menu_li' style='height:66px;><a id='for_doc_edit' ><img src='image/menu_img/menu_doc.png'/>TXT</a></li>");
        menu_array[menu_array.length]=menu_doc;
        
        menu_doc.click(function(){
        	adddoc();
        });
        
        //背景
        var menu_bg=$("<li class='menu_li' style='height:66px;><a id='for_bg_edit'><img src='image/menu_img/menu_bg.png'/>"+localObj.a00058+"</a></li>");
        menu_array[menu_array.length]=menu_bg;
        
        menu_bg.click(function(){
        	addbj();
        });
        
        //天气
        var menu_weather=$("<li class='menu_li' style='height:66px;><a id='for_weather_edit'><img src='image/menu_img/menu_weather.png'/>"+localObj.a00177+"</a></li>");
        menu_array[menu_array.length]=menu_weather;
        
        menu_weather.click(function(){
        	addweather();
        });
        
        
        //网页
        var menu_html=$("<li class='menu_li' style='height:66px;><a id='for_html_edit'><img src='image/menu_img/menu_html.png'/>"+localObj.b00026+"</a></li>");
        menu_array[menu_array.length]=menu_html;
        menu_html.click(function(){
        	 
        	addhtml();
        	
        });
        
        
        //音频
        var menu_audio=$("<li class='menu_li' style='height:66px;><a href='javascript:open_win_audio();'><img src='image/menu_img/menu_audio.png'/>"+localObj.a00059+"</a></li>");
        menu_array[menu_array.length]=menu_audio;
        
        menu_audio.click(function(){
       	 
        	addaudio();
        	
        });
        
        
        $("#bgm_bn").click(function(){
        	
        	addaudio();
        	
        });
        
      
        
        
        //多媒体
        var menu_media=$("<li class='menu_li' style='height:66px;><a href='javascript:open_win_media();'><img src='image/menu_img/menu_media.png'/>"+localObj.b00024+"</a></li>");
        menu_array[menu_array.length]=menu_media;
        
        menu_media.click(function(){
          	 
        	addmedia();
        	
        });
        
        
        //PPT
        var menu_ppt=$("<li class='menu_li' style='height:66px;><a id='for_ppt_edit'><img src='image/menu_img/menu_ppt.png'/>PPT</a></li>");
        menu_array[menu_array.length]=menu_ppt;
        
        menu_ppt.click(function(){
       	 
        	addoffices('myppt');
        	
        });
        
        
        //WORD
        var menu_word=$("<li class='menu_li' style='height:66px;><a id='for_word_edit'><img src='image/menu_img/menu_word.png'/>Word</a></li>");
        menu_array[menu_array.length]=menu_word;
        
        menu_word.click(function(){
          	 
        	addoffices('mydoc');
        	
        });
        
        
        //Excel
        var menu_excel=$("<li class='menu_li' style='height:66px;><a id='for_excel_edit'><img src='image/menu_img/menu_excel.png'/>Excel</a></li>");
        menu_array[menu_array.length]=menu_excel;
        
        menu_excel.click(function(){
         	 
        	addoffices('myxls');
        	
        });
        
        
        //PDF
        var menu_pdf=$("<li class='menu_li' style='height:66px;><a id='for_pdf_edit'><img src='image/menu_img/menu_pdf.png'/>PDF</a></li>");
        menu_array[menu_array.length]=menu_pdf;
        
        
        menu_pdf.click(function(){
        	 
        	addoffices('mypdf');
        	
        });
        
        
        //摄像
        var menu_netcamera=$("<li class='menu_li' style='height:66px;><a id='for_camera_edit'><img src='image/menu_img/menu_camera.png'/>"+localObj.a00692+"</a></li>");
        menu_array[menu_array.length]=menu_netcamera;
        
        menu_netcamera.click(function(){
         	 
        	addnetcamera();
        	
        });
        
        
        
        
        //二维码  默认隐藏
        //var menu_code=$("<li><a href='javascript:open_win_code();'><img src='image/"+a00000+"/code.png'/></a></li>");
        //menu_array[menu_array.length]=menu_code;
        
        
        //插件
        var menu_dll=$("<li class='menu_li' style='height:66px;><a id='for_dll_edit' ><img src='image/menu_img/menu_dll.png'/></a>"+localObj.b00093+"</li>");
        menu_array[menu_array.length]=menu_dll;
        
        menu_dll.click(function(){
        	 
        	adddll();
        	
        });
        
        //相册
        var menu_imgGroup=$("<li class='menu_li' style='height:66px;><a id='for_imgGroup_edit'><img src='image/menu_img/menu_img_group.png'/>"+localObj.b00127+"</a></li>");
        menu_array[menu_array.length]=menu_imgGroup;
        
        menu_imgGroup.click(function(){
       	 
        	addimggroup();
        	
        });
        
        
        //翻书插件
        var menu_imgGroup=$("<li class='menu_li' style='height:66px;><a id='for_imgFlip_edit'><img src='image/menu_img/menu_img_flip.png'/>"+localObj.b00320+"</a></li>");
        menu_array[menu_array.length]=menu_imgGroup;
        
        menu_imgGroup.click(function(){
       	 
        	addimgflip();
        	
        });
        
        //轮播插件
        if($("#itemType").val()==2){
        var menu_Carousel=$("<li class='menu_li' style='height:66px;><a id='for_carousel_edit'><img src='image/menu_img/menu_audio.png'/>"+localObj.d00007+"</a></li>");
         menu_array[menu_array.length]=menu_Carousel;
        
         menu_Carousel.click(function(){
       	 
        	addCarousel();
        	
         });
        }
     /*   //KTV插件(轮播优化)
        var menu_Catalog=$("<li class='menu_li' style='height:66px;><a id='for_catalog_edit'><img src='image/menu_img/menu_audio.png'/>"+localObj.d00013+"</a></li>");
        menu_array[menu_array.length]=menu_Catalog;
        
        menu_Catalog.click(function(){
       	 
        	addCatalog();
        	
        });
        */
        if(rssOnOff==1){
    	    //rss
    	    var menu_rss=$("<li class='menu_li' style='height:66px;><a id='for_rss_edit'><img src='image/menu_img/menu_rss.png'/>rss</a></li>");
    	    menu_array[menu_array.length]=menu_rss;
    	    
    	    menu_rss.click(function(){
    	   	 
    	    	addrss();
    	    	
    	    });
        }
        
        
        if($("#itemType").val()==2){
        	
        	if($("#interactGroupShowState").val()==1){
        		
        		//区域
                var menu_interactGroup=$("<li class='menu_li' style='height:66px;><a id='for_interactgroup_edit'><img src='image/menu_img/menu_region.png'/>"+localObj.b00171+"</a></li>");
                menu_array[menu_array.length]=menu_interactGroup;
                menu_interactGroup.click(function(){
                	
                	addinteractgroup();
                	
                });
            	
        	}
        	
        }
      
        
        
        
      
        
    }
    
    
    
    
  
    //其他
    var menu_other=$("<li  class='menu_li' style='height:66px;><a href='#'><img src='image/menu_img/menu_others.png'/>"+localObj.b00172+"</a></li>");
    //menu_array[menu_array.length]=menu_other;
    
    
    var menuShowNum=parseInt(h/80);
    
    for(var i=0;i<menuShowNum;i++){
 	   
       if(i==(menuShowNum-1)){
    	   if($("#screenTypeHtml").val()==1){}else{
        	   menu_ui.append(menu_other);    		   
    	   }

       }else{
    	   if(menu_array.length>i){
    	      menu_ui.append(menu_array[i]);
    	   }
       }	   
    }
    
    var menu_other_hidden=$("<ul class='menu_other_hidden' style='position: absolute;float:left;width:320px;top:438px;left:55px;background-color: rgb(238, 238, 238);height:170px;overflow: auto;'></ul>");
    //未显示菜单
    for(var i=menuShowNum-1;i<menu_array.length;i++){
  	   
    	//console.log(menu_array[i].html());
    	menu_other_hidden.append(menu_array[i]);
    }
    menu_other.append(menu_other_hidden);
    
    
    //注册热区域
    var button_area=$("#buttonArea");
    
    button_area.click(function(){
      	 
    	addarea();
    	
    });
    
    
 
    //背景色
    $('#bg_color_set').colpick({
	    
    			layout:'rgbhex',
    			color:'#FFFFFF',
    			onSubmit:function(hsb,hex,rgb,el) {
    				$("#topfd1").css('background-color','#'+hex).attr("val",'#'+hex).change();	
    				$(el).colpickHide();
    				$("#bgm_show").html('#'+hex);
    				$("#topfd1").attr("bgColor",'#'+hex);
    			},
    			onShow:function(o){
    				var obj = $(o);
    				var divheight = parseInt(obj.css("height"));
    				var divtop = parseInt(obj.css("top"));
    				var divleft = parseInt(obj.css("left"));
    				obj.css("left",divleft+120);//120//修改颜色插件的位置，修复添加多语言后，右边不能完全显示的问题
    				if((divheight+divtop)>parseInt($(window).height())){
    					obj.css("top",divtop-divheight+10);
    				}			
    			}
    		}
     );
    
    
   
    
     
    
    /*******************************自适应屏幕***********************************************/
    
   
    
    //浏览器  高 宽
    var h = document.body.clientHeight;
    var w = document.body.clientWidth;
    openh=h-40;
    cjzoom=$("#sf").val();
    
    $("#content").height(h-60);  
    
    $("#c_right_id").height(h-64);
    //$(".menu_new").height(h-40);
    //编辑区内容
    $("#blank_box_id").height(h-60);
    $("#blank_box_id").width(w-80-270-10);
    $(".content-main").height(h-70);
    $(".content-main").width(w-80-270-20);
    
    $(".pm_mid_footer").width(w-80-270-10);
 
    //$("#pm_left_content_id").height(h+50);
    
    //元素列表
    $("#elementList").height(h-215);
  
  
    $("#tabs").height(h-200);
    
    //右 div  
    $("#pm_right").height(h+50);
    
    
   
    $("#pm_right_set").css("marginTop",-(h-15));
    
    $("#pm_right_set").height(h+50);
    
    //标尺
    $("#hRule").width(w-80-270-10);
    $("#vRule").height(h-10);
    
    $( "#sfv" ).val((cjzoom*100)+"%" ); 
    
    //判断修改
    var ms=$("#mcontent").val();
  
    //自适应
    //
    //var fblH=$("#ty").val();
    
    var tx=$("#tx").val();

    var ty=$("#ty").val();
    
    var blank_box_id_height=h-90;
    
    var blank_box_id_width=$("#content-main-edit").css("width").replace(/px/g,"");
  
    AdaptiveSfNew(ty,blank_box_id_height,100,tx,blank_box_id_width);
   
	$( "#sfv" ).val((cjzoom*100)+"%" );

	$("#sf").val(cjzoom);

    tx=Math.round(tx*cjzoom);
    ty=Math.round(ty*cjzoom);

 	
    if(tx!=0&&ty!=0){
   	   $("#topfd1").width(tx);
   	   $("#topfd1").height(ty);
    }
  
  
    if(ms==""){ 
    		
    }else{

 	      var sceneObj=JSON.parse(ms);
  
          total=sceneObj.currenttotal;
          
          $("#topfd1").attr("bgtopfd",sceneObj.bgtopfd);
          $("#topfd1").attr("bgname",sceneObj.bgname);
          $("#topfd1").attr("bgnameUrl",sceneObj.bgnameUrl);
          $("#topfd1").attr("title",sceneObj.title);
          $("#topfd1").attr("bgColor",sceneObj.bgColor);
         
          $("#topfd1").css({
	           "backgroundImage":sceneObj.bgtopfd,
	           "backgroundSize":"cover",
	           "filter":"progid:DXImageTransform.Microsoft.AlphaImageLoader ( sizingMethod='scale' , src='"+sceneObj.bgtopfd+"')",
               "backgroundSize":"100% 100%",
               "backgroundColor":sceneObj.bgColor
	
          });
          
          $("#bgm_show").html(sceneObj.bgColor);
          
          var allElementArry=sceneObj.allElementArry;
          var curScene = $("#topfd1");
          //轮播三种插件集合
    	  var caros=new Array();
    	  //轮播背景
    	  var lbbj=null;
          for(var i = 0;i<allElementArry.length;i++)
 		  {
         	   //获取元素
        	   var get_add=$(allElementArry[i]);
         	   
        	   //获取元素类型
         	   var elementType=get_add.attr("elementType");
         	   
         	  
			
         	   var new_add;

         	   
			   switch (elementType) {
				
					   case "image" :
				       case "mydoc" :
				       case "myxls" :
				       case "mypdf" :
				       case "myppt" :
				       case "teller" :
					    	
					    	 
					    	new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'  class='element active image elementBorder' title='' curimglist='' from='img_edit'  style='"+get_add.attr("style")+"'   ><img src='"+get_add.attr("src")+"' style='width:100%;height:100%'></div>");
							
					    	//播放时长
				            new_add.attr("ptime",get_add.attr("ptime"));
				           
				            //数据源
				            new_add.attr("jsonData",get_add.attr("jsonData"));
				            
				            new_add.attr("tellerKey",get_add.attr("tellerKey"));
				            
				            break;    

				  
				            

					    case "video":
					    case "caroD":
					    case "catal":
					    	var elementVideoType = get_add.attr("elementVideoType");
					    	
					    	if(elementVideoType=="video"){
					    		
					    		new_add = $("<div id='"+get_add.attr("id")+"'  elementType='"+elementType+"'  elementVideoType='video'    class='element active video elementBorder' title='' curimglist='' from='img_edit'  style='"+get_add.attr("style")+"'   ><img  src='image/video_bg.png'  style='width:100%;height:100%'></div>");	
					    	
					    	}else if(elementVideoType=="videoMedia"){
					    		
					    		new_add = $("<div id='"+get_add.attr("id")+"'  elementType='"+elementType+"'  elementVideoType='videoMedia'  class='element active video elementBorder' title='' curimglist='' from='img_edit'  style='"+get_add.attr("style")+"'   >"+get_add.attr("id")+"</div>");
					    		
					    		new_add.css({
		                    	      "fontSize":Math.round(36*cjzoom)+"px" 
		                        });
					    	}else if(elementVideoType=="caroD"||elementVideoType=="catal")
					    	{
					    		new_add = $("<div id='"+get_add.attr("id")+"'  elementType='"+elementType+"' ycCount='"+get_add.attr("ycCount")+"'   elementVideoType='"+elementVideoType+"'  class='element active video elementBorder' title='' curimglist='' from='img_edit' elementHide='true'  style='"+get_add.attr("style")+"'>"+get_add.attr("id")+"</div>");
					    		new_add.css({
		                    	      "fontSize":Math.round(36*cjzoom)+"px" 
		                        });
                            	
                            	new_add.attr("elementHide",get_add.attr("elementHide"));							
								
								new_add.attr("bgnameUrl",get_add.attr("bgnameUrl"));
						
								new_add.attr("bgname",get_add.attr("bgname"));
								
								new_add.attr("bgtopfd",get_add.attr("bgtopfd"));
								
								new_add.attr("ycCount",get_add.attr("ycCount"));

					    	}
					    	
					    	new_add.attr("elementVideoType",get_add.attr("elementVideoType"));
							
					    	//播放时长
				            new_add.attr("ptime",get_add.attr("ptime"));
				           
				            //数据源
				            new_add.attr("jsonData",get_add.attr("jsonData"));
				            
							break;
							
                         case "fonts":
					    	
                            new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'  class='element active fonts elementBorder' title='"+get_add.attr("title")+"'    style='"+get_add.attr("style")+"'   ><div class='doc_content'></div></div>");
							
                            new_add.css({
	                    	      "fontSize":Math.round(get_add.attr("txtfontsize")*cjzoom)+"px" ,"fontFamily":get_add.attr("fonttype"),
	                              "lineHeight":Math.round(Math.round(get_add.attr("txtfontsize")*get_add.attr("lineH"))*cjzoom)+"px"
	                            });
                            
                            new_add.find(".doc_content").html(get_add.attr("doc_content"));


                            new_add.attr("fontSize",get_add.attr("fontSize"));
                            
                            new_add.attr("lineHeight",parseInt(get_add.attr("fontSize")*get_add.attr("lineH")));
		                    
                            new_add.attr("fonttype",get_add.attr("fonttype"));     //字体类型
                            
		                    new_add.attr("txtfontsize",get_add.attr("txtfontsize"));//字体大小
                            
                            new_add.attr("lineH",get_add.attr("lineH"));       //字距
                            
                            new_add.attr("gdtype",get_add.attr("gdtype"));     //滚动方式
                            
                            new_add.attr("gdspeed",get_add.attr("gdspeed"));   //滚动速度 
	                     
                            new_add.attr("backcolor",get_add.attr("backcolor"));   //背景颜色
                            
                            new_add.attr("fontcolor",get_add.attr("fontcolor"));   //字体颜色 
	
                            new_add.attr("fbold",get_add.attr("fbold"));        //加粗
                            
                            new_add.attr("fitallic",get_add.attr("fitallic"));    //斜体
                            
                            new_add.attr("fsetline",get_add.attr("fsetline"));    //下划线
                            
                            new_add.attr("fsetstrike",get_add.attr("fsetstrike"));  //中线
                            
                            new_add.attr("textDataSource",get_add.attr("textDataSource"));   //数据来源
                            
                            new_add.attr("advancedType",get_add.attr("advancedType"));   //设置字体大小 0普通 1高级
						  
                            new_add.attr("relationKey",get_add.attr("relationKey"));   //设置字体大小 0普通 1高级
                            
                            new_add.attr("doc_content",get_add.attr("doc_content"));
                            
                            new_add.attr("highFontColor",get_add.attr("highFontColor"));
                            
                            new_add.attr("fontColorCb",get_add.attr("fontColorCb"));
                            
                            
                            new_add.attr("highBgColor",get_add.attr("highBgColor"));
                            
                            new_add.attr("bgColorCb",get_add.attr("bgColorCb"));
                            
                            
	                        
				            
							break;			
                        case "mytime":
                        	
                        	 new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'   class='element active mytime elementBorder' title='' curimglist='' from='mytime_edit'  style='"+get_add.attr("style")+"'   ><div class='time_content'><div></div>");
 							
 				             //数据源
 				             new_add.attr("jsonData",get_add.attr("jsonData"));
 				             
 				             new_add.css({
		                    	      "color":"#"+get_add.attr("fcolor"),
		                    	      "fontSize":Math.round(get_add.attr("fs")*cjzoom)+"px",
		                    	      "lineHeight":Math.round(get_add.attr("fs")*cjzoom)*1.3+"px",
		                    	      "zIndex":total
		                      });
	                    
 				              new_add.attr("tType",get_add.attr("tType"));

 				              new_add.attr("tsType",get_add.attr("tsType"));
	
 				              new_add.attr("fs",get_add.attr("fs"));
	
 				              new_add.attr("fcolor",get_add.attr("fcolor"));
	
 				              new_add.attr("ttDa",get_add.attr("ttDa"));
	
 				              new_add.attr("ttHo",get_add.attr("ttHo"));
	
 				              new_add.attr("ttMi",get_add.attr("ttMi"));
	
 				              new_add.attr("ttSs",get_add.attr("ttSs"));
	
 				              new_add.attr("ttTimePoint",get_add.attr("ttTimePoint"));
	
 				              new_add.attr("advancedType",get_add.attr("advancedType"));
	
 				              new_add.attr("unitShow",get_add.attr("unitShow"));

 				              new_add.attr("mytimContent",get_add.attr("mytimContent"));
                      
 				              new_add.find(".time_content").text(get_add.attr("mytimContent"));
						 
 							break;
 							
                        case "mytqs":
                        	
                        	var sortableListSpans=get_add.attr("sortableListSpans");
                        	
                        	
                         	var gif="";
        	               	var content="";
        	               	var day="";
        	               
        	               	$.ajax({
                                    url:'ajaxGetTq.vs',
        			                data:{
            					        city : sortableListSpans.split("--")[0]
            					        
        				            },
        							 type:'post',  
        						     cache:false,  
        						     dataType:'json',  
        						     async:false,
        						     success:function(data) {
        							     
        							    //显示图片
        							    gif = data.gif.split("|")[0];
        							    //alert(gif);
        							    //温度
        							    content=data.content.split("|")[0];
        							    //alert(content);
        							    //天气
        							    day=data.day.split("|")[0];
        							    //alert(day)
        							    	
        							    //flag=true;
        							      
        							 }
        					});
        	               	
        	               	
        	                var city="";
    			            if(gif==""){
    			            	gif="w_clear.png";
    			            	city="&nbsp;&nbsp;&nbsp;"+sortableListSpans.split("--")[0];
    			            }else{
    			            	city=sortableListSpans.split("--")[0];
    			            }
        	              
        	                
        	                
        	               	new_add = $("<div id='"+get_add.attr("id")+"'  elementType='"+elementType+"'   class='element active mytqs elementBorder' title='' curimglist='' from='mytqs_edit'  style='"+get_add.attr("style")+"'   >"+
        	               			"<img src='image/weather/"+gif+"' style='width:50%;height:50%;opacity:0.8;'><br/>"+
        	               			"" +city+"&nbsp;&nbsp;&nbsp;"+day+"<br/>"+
        	               			""+content+	
        	               	"</div>");
                        	
                        	
                        	var fontsize_width = parseInt(new_add.css("width"))/4.0;	
                    		
                        	new_add.css({
                        		
                        		 "fontSize":Math.round(fontsize_width*0.5)+"px"
                        		 
	                        });
                        	
                        	new_add.attr("title",get_add.attr("title"));
                        	
                        	new_add.attr("fresh",get_add.attr("fresh"));
					    	  
                        	new_add.attr("dx",get_add.attr("dx"));  
                        	
					    	  
                        	new_add.attr("wfcolor",get_add.attr("wfcolor"));  
					    	  
                        	new_add.attr("sortableListSpans",get_add.attr("sortableListSpans")); 
					    	                        	
                        	break;
 						
                        case "htmls":
                        	
                            new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'  class='element active htmls elementBorder' title='' curimglist='' from='htmls_edit'  style='"+get_add.attr("style")+"'   >"+get_add.attr("id")+"</div>");
                        	
                        	new_add.css({
                        		
	                    	      "fontSize":Math.round(36*cjzoom)+"px"
	                    	      
	                        });
                        	
                        	new_add.attr("title",get_add.attr("title"));
                        	
                        	new_add.attr("time",get_add.attr("time"));
					    	  
                        	new_add.attr("gun",get_add.attr("gun"));  
					    	  
                        	new_add.attr("sortableListSpans",get_add.attr("sortableListSpans")); 
                        	
                        	break;
                        	

						 case "caroY":
							    new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"' ycCount='"+get_add.attr("ycCount")+"'  class='element active  elementBorder'  curimglist='' from='"+elementType+"_edit'  style='"+get_add.attr("style")+"'   >"+get_add.attr("id")+"</div>");
	                        	
							    new_add.css({
		                    	      "fontSize":Math.round(36*cjzoom)+"px" 
		                           });
							    new_add.attr("title",get_add.attr("title"));
	                        	
							    new_add.attr("type",110);
	                        	
							    new_add.attr("elementHide",get_add.attr("elementHide"));							
								
								new_add.attr("bgnameUrl",get_add.attr("bgnameUrl"));
						
								new_add.attr("bgname",get_add.attr("bgname"));
								
								new_add.attr("bgtopfd",get_add.attr("bgtopfd"));
								
								new_add.attr("ycCount",get_add.attr("ycCount"));
	                                             	
	                        	break;
	                        	
						 case "searc":  
							 		new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'   class='element active  elementBorder'  curimglist='' from='"+elementType+"_edit'  style='"+get_add.attr("style")+"'   >"+get_add.attr("id")+"</div>");
	                        	
							 	   new_add.css({
		                    	      "fontSize":Math.round(36*cjzoom)+"px" 
		                           });
	                        	
							 	   new_add.attr("title",get_add.attr("title"));
	                        	
							 	   new_add.attr("type",get_add.attr("type"));
	                        	
							 	   new_add.attr("tTargetId",get_add.attr("tTargetId"));
	                         	
							       new_add.attr("bj",get_add.attr("bj"));
							   	   	   	
	                        	
							   	   break;
						 case "cqybj":
							 		new_add= $("<div id='"+get_add.attr("id")+"'   type='carobj' elementType='"+elementType+"' " +
							 					" class='element active mydll elementBorder'  " +
							 					"from='"+elementType+"_edit' style='"+get_add.attr("style")+"'></div>");
							 		new_add.attr("bgtopfd",get_add.attr("bgtopfd"));
							 		new_add.attr("bgname",get_add.attr("bgname"));
							 		new_add.attr("bgnameUrl",get_add.attr("bgnameUrl"));	
							 		new_add.css({
	    						           "backgroundImage":get_add.attr("bgtopfd"),
	    						           "backgroundSize":"cover",
	    						           "filter":"progid:DXImageTransform.Microsoft.AlphaImageLoader ( sizingMethod='scale' , src='"+get_add.attr("bgtopfd")+"')",
	    					               "backgroundSize":"100% 100%" 
	    						
	    					       });
							 		lbbj=new_add;
							 		break;
							 		
                         case "mycam":
                         case "qmany":
						 case "qsing":
						 case "mybus":
						 case "envir":	 	 
						 case "face":
							 
                        	new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'   class='element active  elementBorder'  curimglist='' from='"+elementType+"_edit'  style='"+get_add.attr("style")+"'   >"+get_add.attr("id")+"</div>");
                        	
                        	new_add.css({
	                    	      "fontSize":Math.round(36*cjzoom)+"px" 
	                           });
                        	
                        	new_add.attr("title",get_add.attr("title"));
                        	
                        	new_add.attr("type",get_add.attr("type"));
                        	
                        	if(get_add.attr("type")==105){
                        		
                        		new_add.attr("happyVal",get_add.attr("happyVal"));
                        		
                        		new_add.attr("uncomVal",get_add.attr("uncomVal"));
                        		
                        	}
                        	
                                             	
                        	break;
                        	
                         case  "imggr":
                        	 
                        	new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'   class='element active imggr elementBorder' title='' curimglist=''  from='"+elementType+"_edit'  style='"+get_add.attr("style")+"'   >"+get_add.attr("id")+"</div>");
                         	
                         	new_add.css({
 	                    	      "fontSize":Math.round(36*cjzoom)+"px" 
 	                           });
                         	
                         	new_add.attr("ptime",get_add.attr("ptime"));
                         	
                         	new_add.attr("jsonData",get_add.attr("jsonData"));
                         	
                          	break;
                          	
                         case "charg": 	
                        	 
                        	 new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'   class='element active  elementBorder' title='' curimglist=''  from='"+elementType+"_edit'  style='"+get_add.attr("style")+"'   >"+get_add.attr("id")+"</div>");
                          	
                          	 new_add.css({
  	                    	      "fontSize":Math.round(36*cjzoom)+"px" 
  	                           });
                          	
                          	 new_add.attr("jsonStr",get_add.attr("jsonStr"));
                          	
                        	 break;
                        	 
                         case "source": 	
                        	 
                        	 var objs = eval( "(" + get_add.attr("jsonStr") + ")" );//转换后的JSON对象
                        	 
                        	  //设置背景色
		    				 var  tableBorderColor=objs.borderColor;
		    				  
		    				 if(tableBorderColor=="-65536"){
		    			    	  
		    					tableBorderColor="#ED1C24";
		    			    	  
		  				     }else if(tableBorderColor=="-16776961"){
		  			        	
		  				    	tableBorderColor="#3F48CC";
		  			        	
		  			         }else  if(tableBorderColor=="-256"){
		  				    
		  			        	tableBorderColor="#FFC90E";
		  				    	
		  				     }else if(tableBorderColor=="-16711936"){
		  			        	 
		  				    	tableBorderColor="#22B14C";
		  			            
		  			         }else  if(tableBorderColor=="-2"){
		  				    	
		  			        	tableBorderColor="#FFFFFF";
		  			        	
		  				     }else  if(tableBorderColor=="-7829368"){
		  				    	
		  				    	tableBorderColor="#7F7F7F";
		  				    	
		  				     }else  if(tableBorderColor=="-16777216"){
		  				    	 
		  				    	tableBorderColor="#000000";
		  				     
		  				     }
                        	 
            				 var createTable="";
		    				 if(objs.showType==1&&objs.titleState==1){
		    					 objs.rows=objs.rows+1;
		    				 }else if(objs.showType==2&&objs.titleState==1){
		    				 	 objs.cols=objs.cols+1;
		    				 }
            				 for(var z=0;z<objs.rows;z++){
		    					 createTable+="<tr>";
                		    	 for(var j=0;j<objs.cols;j++){
                		    		 
                		    		 if(objs.showType==2){
                		    			 
                		    			 if(j==0){
                		    				
	                    		    		 createTable+="<td style='border:"+objs.borderState+"px solid "+tableBorderColor+";'>"+objs.title[z].value+"</td>";	
	                    		    		
                		    			 }else{
                		    				
                		    				 createTable+="<td style='border:"+objs.borderState+"px solid "+tableBorderColor+";'>value</td>";	
	                    		    	
                		    			 }
                		    		 }else  if(objs.showType==1){
                		    			 
                		    			 if(z==0){
                		    				  
                		    				 createTable+="<td style='border:"+objs.borderState+"px solid "+tableBorderColor+";'>"+objs.title[j].value+"</td>";	
	                    		    		
                		    			 }else{
                		    				
	                    		    		 createTable+="<td style='border:"+objs.borderState+"px solid "+tableBorderColor+";'>value</td>";	
	                    		    		
                		    			 }
                		    			 
                		    		 }else{
                		    			 
                    		    			 createTable+="<td style='border:"+objs.borderState+"px solid "+tableBorderColor+";'>value</td>";	
                    		    		
                		    		 }
                		    		
                		    		 
                		    	 }
                		    	 createTable+="</tr>"; 
                		     }
                        	 
            				 
            				  //设置背景色
		    				 var  tableBgColor=objs.title[0].bgColor;
		    				  
		    				 if(tableBgColor=="-65536"){
		    			    	  
		    					 tableBgColor="#ED1C24";
		    			    	  
		  				     }else if(tableBgColor=="-16776961"){
		  			        	
		  				    	tableBgColor="#3F48CC";
		  			        	
		  			         }else  if(tableBgColor=="-256"){
		  				    
		  			        	tableBgColor="#FFC90E";
		  				    	
		  				     }else if(tableBgColor=="-16711936"){
		  			        	 
		  				    	tableBgColor="#22B14C";
		  			            
		  			         }else  if(tableBgColor=="-2"){
		  				    	
		  			        	tableBgColor="#FFFFFF";
		  			        	
		  				     }else  if(tableBgColor=="-7829368"){
		  				    	
		  				    	tableBgColor="#7F7F7F";
		  				    	
		  				     }else  if(tableBgColor=="-16777216"){
		  				    	 
		  				    	tableBgColor="#000000";
		  				    	
		  				     }
		    				 
		    				 //创建元素
		                     var new_add = $("<div id='"+get_add.attr("id")+"' elementType='source'     class='element active mydll elementBorder'  curimglist='' from='mydll_edit'   style='"+get_add.attr("style")+"' >"+
		                    		     "<table class='source_content'  style='width:100%;height:100%;table-layout:fixed;text-align: center;border-collapse:collapse;' >" +
		                    		     
		                    		    
		                    		      createTable
		                    		     
		                    		      //"<tr><td style='border:1px solid black;'>21</td><td style='border:1px solid black;'>22</td></tr>" +
		                    		     
		                    		      +"</table>"
		                    		      +"</div>");
				         
		                      //设置字体颜色
		                      var  tableFontColor=objs.title[0].fontColor;
		    				  
 		    				 if(tableFontColor=="-65536"){
 		    			    	  
 		    					 tableFontColor="#ED1C24";
 		    			    	  
 		  				     }else if(tableFontColor=="-16776961"){
 		  			        	
 		  				    	tableFontColor="#3F48CC";
 		  			        	
 		  			         }else  if(tableFontColor=="-256"){
 		  				    
 		  			        	tableFontColor="#FFC90E";
 		  				    	
 		  				     }else if(tableFontColor=="-16711936"){
 		  			        	 
 		  				    	tableFontColor="#22B14C";
 		  			            
 		  			         }else  if(tableFontColor=="-2"){
 		  				    	
 		  			        	tableFontColor="#FFFFFF";
 		  				     }else  if(tableFontColor=="-7829368"){
 		  				    	
 		  				    	tableFontColor="#7F7F7F";
 		  				    	
 		  				     }else  if(tableFontColor=="-16777216"){
 		  				    	tableFontColor="#000000";
 		  				     }
		                      
		                      
 		    				 var selfFontSize=12;
		                       if(objs.title[0].fontSize==-1){
		                    	   selfFontSize=12;
		                       }else{
		                    	   selfFontSize=objs.title[0].fontSize;  
		                       }
 		    				 new_add.css({
 		    					      "fontSize":Math.round(selfFontSize*sf)+"px",
		                              "color":tableFontColor
		                     });
		                    
		                       new_add.attr("jsonStr",get_add.attr("jsonStr"));
                          	   new_add.attr("fontSize",get_add.attr("fontSize"));
                          	   new_add.attr("lineHeight",get_add.attr("lineHeight"));
                          	
                        	 break;
                        	 
                         case "dllItem": 	
                        	 
                        	 new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'   class='element active  elementBorder' title='' curimglist=''  from='"+elementType+"_edit'  style='"+get_add.attr("style")+"'   >"+get_add.attr("id")+"</div>");
                          	
                          	 new_add.css({
  	                    	      "fontSize":Math.round(36*cjzoom)+"px" 
  	                         });
                          	
                          	 new_add.attr("jsonData",get_add.attr("jsonData"));
                          	 new_add.attr("fontSize",get_add.attr("fontSize"));
                          	 new_add.attr("lineHeight",get_add.attr("lineHeight"));
                          	
                        	 break;	
                        	 
                        	 
                          case "myigs": 	
                        	 
                        	 new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'   class='element active  elementBorder' title='' curimglist=''  from='"+elementType+"_edit'  style='"+get_add.attr("style")+"'   >"+get_add.attr("id")+"</div>");
                          	
                          	 new_add.css({
  	                    	      "fontSize":Math.round(36*cjzoom)+"px" 
  	                           });
                          	
                          	 new_add.attr("interactGroupShowNumber",get_add.attr("interactGroupShowNumber"));
                          	 new_add.attr("recycler",get_add.attr("recycler"));
                          	 new_add.attr("treeData",get_add.attr("treeData"));
                          	
                        	 break;		 
                        	 
                        	 
                          case "mynew": 	
                         	 
                         	 new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'   class='element active  elementBorder' title='' curimglist=''  from='"+elementType+"_edit'  style='"+get_add.attr("style")+"'   >"+get_add.attr("id")+"</div>");
                           	
                           	 new_add.css({
                           		  "fontSize":Math.round(36*sf)+"px" ,"fontFamily":"微软雅黑",
	                              "lineHeight":Math.round(36*sf)+"px"
   	                         });
                           	
                           	 new_add.attr("timee",get_add.attr("timee"));
							
                           	 new_add.attr("rsssrc",get_add.attr("rv"));
                           	 
                           	 new_add.attr("rssSource",get_add.attr("rssSource"));
							 
                         	 break;	
                         	 
                          case "eleva":
 						 	
                            new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'   class='element active  elementBorder'  curimglist='' from='"+elementType+"_edit'  style='"+get_add.attr("style")+"'   ><img src='image/info_bg.png' style='width:100%;height:100%;opacity:0.8;'></div>");
                         	
                         	new_add.css({
                         		
 	                    	     "fontSize":Math.round(36*cjzoom)+"px" 
 	                        
                         	});
                         	
                        	new_add.attr("city",get_add.attr("city"));
                        	
                         	new_add.attr("title",get_add.attr("title"));
                                              	
                          	break;
                        	 
                          case  "imgfl":
                         	 
                          	new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'   class='element active imgfl elementBorder' title='' curimglist=''  from='"+elementType+"_edit'  style='"+get_add.attr("style")+"'   >"+get_add.attr("id")+"</div>");
                           	
                           	new_add.css({
   	                    	      "fontSize":Math.round(36*cjzoom)+"px" 
   	                           });
                           	
                           	new_add.attr("ptime",get_add.attr("ptime"));
                           	
                           	new_add.attr("jsonData",get_add.attr("jsonData"));
                           	
                            	break;
                            	
                           case  "ports":	
                            	new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'   class='element active  elementBorder'  curimglist='' from='"+elementType+"_edit'  style='"+get_add.attr("style")+"'   >"+get_add.attr("id")+"</div>");
                            	
                            	new_add.css({
    	                    	      "fontSize":Math.round(36*cjzoom)+"px" 
    	                           }); 	
                            	
                            	break;
                            	
                           case  "mycall":	
                           	new_add = $("<div  parmeter='"+get_add.attr("parmeter")+"'   callUrl='"+get_add.attr("callUrl")+"'  id='"+get_add.attr("id")+"' elementType='"+elementType+"'   class='element active  elementBorder'  curimglist='' from='"+elementType+"_edit'  style='"+get_add.attr("style")+"'   >"+get_add.attr("id")+"</div>");
                           	
                           	new_add.css({
   	                    	      "fontSize":Math.round(36*cjzoom)+"px" 
   	                           }); 	
                           	
                           	break;
                            	
                          	default:
					        // ...
                          		
			    }
			
                new_add.attr("elementHide",get_add.attr("elementHide")); //控件隐藏
         	   
         	    new_add.attr("relationCall",get_add.attr("relationCall")); //关联叫号元素
             
         	    
         	    if($("#upFblId").val()==0){
         	        
         	    	new_add.css("left",Math.round(get_add.attr("left")*cjzoom));
        			
    			    new_add.css("top",Math.round(get_add.attr("top")*cjzoom));
         	    	
         	    }else{
         	    	
         	    	new_add.css("left",0);
         	    	
             	    new_add.css("top",0);
             	    
         	    }
         	    
         	    
         	  
			    new_add.css("width",Math.round(get_add.attr("width")*cjzoom));
			
			    new_add.css("height",Math.round(get_add.attr("height")*cjzoom));
             
			    
			    var mtouchs=get_add.attr("mtouchs");
		   		
			    if(mtouchs==undefined||mtouchs==null){
		   				
		   		}else{
		   			
		   	    	new_add.attr("mtouchs",mtouchs);
		   	    	
		   		}
			    

			    if(get_add.attr("id")=="video10000"){
			    	
			    	
		            var objs = eval( "(" + get_add.attr("jsonData") + ")" );//转换后的JSON对象
		           
		            var audioNames="";
		            
		            for(var j=0;j<objs.mMediaList.length;j++){
						if(j==0){
							audioNames=objs.mMediaList[j].sname;
						}else{
							audioNames+=","+objs.mMediaList[j].sname;
						}
						
					}
					$("#bgm_show").text(audioNames);
					
					var addAudio = $("<div id='audioShow'   title='"+localObj.a00449+"'  curimglist='' from='video_edit' style='top:5px;left:"+($("#topfd1").width()-70)+"px;display:block;width:60px;height:60px;position: absolute;z-index:"+10000+";cursor: pointer;' ><img src='image/bg_music.png' style='width:100%;height:100%'></div>");
	                    
	                addAudio.click(function(){
	                      	 
	                    	addaudio();
	                    	
	                });
	                    
	                curScene.append(addAudio);
	                    
	                    
	                    
			    }else{
			    	 //绑定编辑框
	                resizeinitfn($(new_add));

	                draginitfn($(new_add));
	                
	                new_add.removeClass("active");
	                
	                new_add.attr("lock",get_add.attr("lock"));
	                
	                $("#elementList").append("<div><input type='checkbox' eId="+get_add.attr("id")+" name='checkdom'/>"+get_add.attr("id")+"<br></div>");
			    }
                
      
			    	curScene.append(new_add);
			  
		
					
 		 }
   
          //$("#elementList").html($("#topfd1").attr("elementList"));

          var checkStime=sceneObj.checkStime;

	      if(checkStime==-1){
	        	 $("[name = smartPlay]:checkbox").attr("checked", true);
	      }else{
	
	             $("#stime").val($("#editStime").val());
	      }
                    
        
                
    }
    
    
    /***********************************************************************************************/
	    
    
	//var addscene = $(".addscene");
	var curScene = $("#topfd1");
	console.log("开始就运行");
	//判断是否大屏幕
	if(screen.height >= 1000){
		isBigScreen = true;
	}
	
	updateShowByScreen();

	//图片失败加载处理
	$('.thumbnail-img').on("error",function(){
	    $(this).siblings(".bg-def").show();
	    $(this).remove();
	});/*live屏蔽*/

	
	//监听键盘
	document.onkeydown = keydown;//onkeydown事件调用方式 </script>
	
	//播放与暂停音频
	$(".pauseMusic").hide();
	$(".playMusic").on("click",function(){
		$(".pauseMusic").click();
		$(this).parent().find(".pauseMusic").show();
		$(this).hide();
		$(this).parent().find(".amazingaudioplayer-play").click();
	});
	$(".pauseMusic").on("click",function(){
		$(this).parent().find(".playMusic").show();
		$(this).hide();
		$(this).parent().find(".amazingaudioplayer-pause").click();
	});

	 //resizeinitfn($(".element"));	 
	 //那隐藏域的值初始编辑区的width height
	 //curScene.width(parseInt($("#width").val())-20);
	 //curScene.height(parseInt($("#height").val())-20);

	 var menubarWidth = parseInt($(".menubar").css("width")); 
	 var contentRight = parseInt($(".content-right").css("width"));
	 var contentLeft = parseInt($(".content-left").css("width"));
	 
	 var sceneRegion = menubarWidth - contentRight - contentLeft - 135; 
	 //console.log("menubarWidth:"+menubarWidth);
	 //console.log("contentRight:"+contentRight);
	 //console.log("sceneRegion:"+sceneRegion);
	 
	 programWidth = parseInt($("#programWidth").val());
	
	 programHeight = parseInt($("#programHeight").val());
		programWidth = 1920;
		programHeight =1080;
	 
	 //如果是16:9或9:16则不设置默认
	 if((programWidth == 1920 && programHeight == 1080)||(programWidth == 1080 && programHeight == 1920)){
		 programShowWidth = 0;
		 programShowHeight = 0;
	 }else{
		 programShowWidth = programWidth;
		 programShowHeight = programHeight;
		 isEditProgramShow = false;
	 }
	 
	 //console.log("programWidth:"+programWidth);
	 //console.log("programHeight:"+programHeight);
	 
	 if(programHeight > programWidth){
		 isVertical = true;
		 $(".backg_tpl_item").addClass("vertical");
	 }
	 
	 scale = sceneRegion/programWidth;
	 
	 //console.log("scale:"+scale);
	 
	 sceneWidth = sceneRegion;
	 sceneWidth = parseInt($("#topfd1").css("width"));
	 //sceneHeight = programHeight*scale;
	 sceneHeight = parseInt($("#topfd1").css("height"));
	 console.log("sceneWidth1:"+sceneWidth);
	 console.log("sceneHeight1:"+sceneHeight);
	 //alert(contentMain+" | "+contentRight+" | "+contentLeft+" | "+menubarWidth);
	 
	 $("#width").val(sceneWidth);
	 $("#height").val(sceneHeight);
	 
	 //不确定是哪里，给初始化的场景增加了20宽、高，找到地方之前，先减20处理（应该是标尺插件加的，现在不用了,所以不用加）
	 $(".create-content .content-center-topfd").width(sceneWidth);
	 $(".create-content .content-center-topfd").height(sceneHeight);
	 
	 //节目语言

	 
	 //计算场景时长
	 sceneLong(curScene);
	 
	 //节目标准字体计算
	 var fscale = 1;
	 if(programWidth > programHeight){
		fscale = programHeight/standardHeight;
	 }else{
		fscale = programWidth/standardWidth;
	 }
	 standardfsize = standardFontSize*fscale;
	 standardscalefsize = standardfsize*scale;
	 
	 $(".create-content .content-center-topfd").attr("standardfsize",standardfsize).css("font-size",standardscalefsize+"px");
	 
	 //场景高度调整
	 //alert("c:"+$(".content-left").css("height"));
	 //alert("p:"+$(".backg_tpl_op").css("height"));
	 //$(".backg_tpl").height(parseInt($(".content-left").css("height"))-parseInt($(".backg_tpl_op").css("height")));
	 
	 
	 //窗口调整，编辑器自适应宽度，左右侧固定
	 var getWindowSize = function(){
		return ["Height","Width"].map(function(name){
		  return window["inner"+name] ||
			document.compatMode == "CSS1Compat" && document.documentElement[ "client" + name ] || document.body[ "client" + name ];
		});
	};
	
	function getScrollbarWidth(op) {
	    return op[0].offsetWidth - op[0].clientWidth;
	}
	
	
function topfd1change(pwidth,pheight){
		
		var scalewidth = parseInt($("#program-width-info").attr("value"));
		var scaleheight = parseInt($("#program-height-info").attr("value"));
		if (scaleheight>scalewidth){
			pwidth-=50;
			//竖屏，以宽确定高
			//console.log("竖屏");
			$("#topfd1").css("width",pwidth);
			$("#topfd1").css("height",(pwidth/scalewidth)*scaleheight);
		}else{
			//横屏,需要自动确定宽高，
			if ((pwidth/scalewidth)*scaleheight<=pheight){
				//以宽为主
				$("#topfd1").css("width",pwidth);
				$("#topfd1").css("height",(pwidth/scalewidth)*scaleheight);
				//console.log("以宽为主");
			}else if((pheight/scaleheight)*scalewidth<=pwidth) {
				//以高为主
				$("#topfd1").css("width",(pheight/scaleheight)*scalewidth);
				$("#topfd1").css("height",pheight);	
				//console.log("以高为主");
			}
			
		}
		 sceneWidth = parseInt($("#topfd1").css("width"));
		 sceneHeight = parseInt($("#topfd1").css("height"));
		
		
	}

	
	function wSize(){
		var strs=getWindowSize().toString().split(",");
		var width = strs[1] - $(".content-left").width() - $(".content-right").width();
		var scrollbarWidth = getScrollbarWidth($("body"));
		 if(document.body.style.overflow!="hidden"&&document.body.scroll!="no"&&
				    document.body.scrollHeight > document.body.offsetHeight){
			 			var lastWidth = width;
			 			//var lastWidth = width - 17;
					}else{
						 var lastWidth = width;
					}
		//$(".content-main").css("width", lastWidth);			
		//$(".content-main").css("height", strs[0]-90);	
		//$(".content-main").css("margin-left", $(".content-left").width());	
	
	 	//$(".content-main-edit").css("width", lastWidth);
		//$(".content-main-edit").css("height", strs[0] - 90);	
		//console.log(getScrollbarWidth($(".content-main")));
		 
		
			
			
	}

	$(window).resize(function(){
		wSize();
	});
	
	wSize(); // 在主窗体中定义，设置调整目标
	

	//下拉触发事件(公用)
	$(".dropdown-menu .dropdown-menu-sel").on("click",function(){
		var target = $($(this).parent().attr("for"));
		
		if(target.length > 0){
			if(target.is("input")){
				
				
				target.val($(this).find("span").attr("val")).change();
				//curelement.css("font-size",$(this).find("span").attr("val"));
				
			}else{
				target.attr("val",$(this).find("span").attr("val")).html($(this).find("span").html()).change();
				
			}
		}
	});
	

	//编辑区点击编辑页
	$(".editpage.host").click(function(){
		if(!$(this).hasClass("active")){
			//$(this).addClass("active").siblings().removeClass("active");
			$(".content-right").find(".op-label").hide();
			$(".content-right").find("."+$(".widget.active").attr("for")).show();
		}
	});
	
	//编辑区点击动作页
	$(".editpage.act").click(function(){
		if(!$(this).hasClass("active")){
			//$(this).addClass("active").siblings().removeClass("active");
			$(".content-right").find(".op-label").hide();
			if($(".widget.active").attr("for") == "backg_edit"){
				//$(".menu-sceneanim").click();
				$(".sceneanim_edit").show();
				var sceneanimitem = $(".sceneanim_item[sceneanimClass='"+curScene.attr("cursceneanimclass")+"']");
				if(sceneanimitem.length < 1){
					$(".sceneanim_item[sceneanimClass='none']").addClass("active").siblings(".sceneanim_item.active").removeClass("active");
				}else{
					sceneanimitem.addClass("active").siblings(".sceneanim_item.active").removeClass("active");
				}
			}else{
				//$(".menu-anim").click();
                var typeEdit=$(this).prev().find("span").text();
				$(".anim_edit").show();
                $(".anim_edit .host").find("span").text(typeEdit);
				var animitem = $(".anim_item[animClass='"+curelement.attr("curanimclass")+"']");
				if(animitem.length < 1){
					$(".anim_item[animClass='none']").addClass("active").siblings(".anim_item.active").removeClass("active");
				}else{
					animitem.addClass("active").siblings(".anim_item.active").removeClass("active");
				}
			}
		}
	});
	
	//点击更多
	$("#more_widget").click(function(e){
		showdynamicwidgetmenu(e);
	});
	
	//导航栏图标点击 切换编辑状态
	$(".widget").click(function(){
		//如果是有自己处理标识class,这里不作处理，直接return
		if($(this).hasClass("self-processing")){
			return;
		}
		if($(this).attr("id") === "for_weather_edit" && !weatherIsSupport()){
			//检查是否支持天气
			return;
		}
		if(!$(this).hasClass("active")){
			$(".widget").removeClass("active");
			$(this).addClass("active");
		}
		//使得对应的编辑框显示			
		$(".content-right").find(".op-label").hide();
		$(".content-right").find("."+$(this).attr("for")).show();
		//个性化设置
		var id = $(this).attr("id");
		if(id == "for_backg_edit"){
			$(".backg_tpl_item.active").click();
		}else if(id == "for_music_edit"){
			$(".backg_tpl_item.active").click();
			updateMusicWrap();
			openmateriallibrary();
		}
	});
	
	//更新背景图片编辑区(back)
	function updateBackWrap(obj){
		if(!obj){
			obj = curScene;
		}
		var imgsrc = obj.attr("backsrc");
		var name = obj.attr("backname");
		var attrid = obj.attr("backattrid");
		var bgcolor = obj.attr("bgcolor");
		
		if(bgcolor){
			$(".bgcolor_item").each(function(){
				if($(this).css("background-color") == bgcolor){
					$(this).addClass("active").siblings().removeClass("active");
				}else{
					$(this).removeClass("active");
				}
			});
		}
		
		if(!imgsrc || imgsrc == ""){
			$(".backg_img_wrap").hide();
			$(".backg_edit .add-item-hl").show();
			//更换选中元素的状态图
			$(".backg_edit").find(".backg_img_item img").removeAttr("attrid").removeAttr("alt").attr("src","").removeAttr("style");
			$(".backg_edit").find(".backg_img_item .backg_img_item_name,.backg_img_item .backg_img_item_ratio").text("");	
		}else{
			$(".backg_edit .add-item-hl").hide();
			$(".backg_img_wrap").show();
			var url = "url(http://"+pHost+imgsrc+")";
			//更换选中元素的状态图
			$(".backg_edit").find(".backg_img_item img").attr("attrid",attrid).attr("alt",name).attr("src",imgsrc);
			//更新图片分辨率
			var img = new Image();
			img.src = imgsrc;
			img.onload = function(){
				$(".backg_edit").find(".backg_img_item .backg_img_item_ratio").text(img.width+"X"+img.height);
				$(".delBackImgBtn").removeClass("color-gray");
			};
			//显示图片名字
			$(".backg_edit").find(".backg_img_item .backg_img_item_name").text(name);		
		}
	}
	
	//背景设置-颜色(back)
	function backgroundColorSetting(bgcolor,obj){
		console
		if(!obj){
			obj = curScene;
		}
		var index = parseInt(obj.attr("id").replace(/topfd/,""));
		var tpl_item = $("#tpl_item_"+index);//缩略图
		if(!bgcolor){
			obj.css("background-color","white").removeAttr("bgcolor");
			tpl_item.removeAttr("bgcolor");
		}else{
			obj.css("background-color",bgcolor).attr("bgcolor",bgcolor);
			tpl_item.attr("bgcolor",bgcolor);
		}
	}
	
	//背景设置-图片(imgsrc参数不可用代表背景图设为空)(back)
	function backgroundImgSetting(imgsrc,name,attrid,obj){
		if(!obj){
			obj = curScene;
		}
		var index = parseInt(obj.attr("id").replace(/topfd/,""));
		var tpl_item = $("#tpl_item_"+index);//缩略图
		if(!imgsrc || imgsrc === ""){
			//给场景设置背景图片属性
			obj.css("background-image","").removeAttr("backsrc").removeAttr("backname").removeAttr("backattrid");
			//给场景缩略图设置属性
			tpl_item.removeAttr("backsrc").removeAttr("backname").removeAttr("backattrid");
		}else{
			var url = "url(http://"+pHost+imgsrc+")";
			///给场景设置背景图片属性
			obj.css("background-image",url).attr("backattrid",attrid).attr("backname",name).attr("backsrc",imgsrc);
			//给场景缩略图设置属性
			tpl_item.attr("backsrc",imgsrc).attr("backname",name).attr("backattrid",attrid);
		}
		//随时缩略图
		//sceneThumbnail(saveFlag);
	}
	
	//清理历史选中素材数据(公用)
	$(".clear-select-material,.edit-handle.edit-add,.edit-handle.edit-replace").on("click",function(){
		clearMaterialSelectSave();
		$(".material-item.up-modal-m-i").removeClass("active");
	});
	
	//清理素材库素材唯一选择标识(公用)
	$(".clear-select-material-onlyone,.edit-handle.edit-add").on("click",function(){
		$(".material-item.up-modal-m-i").removeClass('only-one');
	});
	
	//素材选择框图片的点击事件(公用)
	$(".material-item.up-modal-m-i").on("click",function(){
		var obj = $(this);
		//是否保存所选素材（换页不清空）
		var isSaveMaterialSelect = false;
		//暂时只在混播生效，所以加了模态框要求
		if(obj.parents(".material-modal.save-material-select").length > 0){
			isSaveMaterialSelect = true;
		}
		var type = obj.parents(".material-modal").attr("type");
		if((obj.hasClass("only-one") && type != "mixed") || materialReplaceFlag){
			//单选
			if(!obj.hasClass("active")){
				obj.addClass("active").siblings(".active").removeClass("active");
				if(isSaveMaterialSelect){
					clearMaterialSelectSave();
					materialSelectSave(null,obj);
				}
			}
		}else{
			//多选
			if(!obj.hasClass("active")){
				obj.addClass("active");
				if(isSaveMaterialSelect){
					materialSelectSave(null,obj);
					showMaterialSelectNum();
				}
			}else{
				obj.removeClass("active");
				if(isSaveMaterialSelect){
					clearMaterialSelectSave(null,obj);
					showMaterialSelectNum();
				}
			}
		}
	});
	

	
	//背景素材选择框图片的确认背景图事件(back)
	$("#backModal .confirm").on("click",function(){
		var obj = $("#backModal .material-item.up-modal-m-i.active");
		if(obj.length == 1){
			var imgsrc = obj.find("img").attr("osrc");
			var name = obj.find("img").attr("alt");
			var attrid = obj.find("img").attr("attrid");
			obj.removeClass("active");
			backgroundImgSetting(imgsrc,name,attrid);
			//更新背景编辑区
			updateBackWrap();
			$('#backModal').modal('hide');
			//随时缩略图
			sceneThumbnail();	
		}else {
			top.$.jBox.tip($.i18n.prop("progForm.pleaseThroughClickToSelectMaterial"));
		}
	});
	
	//根据编辑区素材设置当前元素的素材属性--用于拖拽(img)
	var setCurImgByEdit = function(drag,drop){
		$curImgList = [];
		curelement.attr("curimglist","");
		if($(".img_edit").find(".img_item").length){
			$(".img_edit").find(".img_item").each(function(){
				$(this).find(".img_item_index").text($(this).index()+1);
				var src = $(this).find("img").attr("src");
				var name = $(this).find("img").attr("alt");
				var attrid = $(this).find("img").attr("attrid");
				$curImgList.push({"src":src,"name":name,"attrid":attrid});
			});
			curelement.attr("curimglist",JSON.stringify($curImgList));
		}
		//更新编辑区
		updateImgWrap();
		//随时缩略图
		sceneThumbnail();
	};
	//把回调方法放到回调方法对象中
	editorAreaDragCallbackMethod["img"] = setCurImgByEdit;
	
	//替换图片(img)
	var imgReplaceFlag = false;
	//$(".img_edit .img-replace").on("click",function(){
	$(document).on("click",".img_edit .img-replace",function(){
		var imgindex = parseInt($(this).attr("imgindex"));
		if(!imgReplaceFlag){
			imgReplaceFlag = true;
			materialReplaceFlag = true;
			if(!isNaN(imgindex)){
				imgReplaceNo = imgindex;
				$('#imgModal .material-item.up-modal-m-i').addClass('only-one');
				$('#imgModal').modal('show');
			}else{
				$("#addimg").click();
			}
			imgReplaceFlag = false;
		}
	});
	
	//在当前素材之后添加素材(img)
	var imgAfterAddFlag = false;
	$(".img_edit .img-after-add").on("click",function(){
		if(!imgAfterAddFlag){
			imgAfterAddFlag = true;
			//materialReplaceFlag = false;
			var imgindex = parseInt($(this).parents(".edit-hover").find(".img_index").html());
			if(!isNaN(imgindex)){
				imgReplaceNo = imgindex;
				$('#imgModal .material-item.up-modal-m-i').removeClass('only-one');
				$('#imgModal').modal('show');
			}else{
				$("#addimg").click();
			}
			imgAfterAddFlag = false;
		}
	});
	
	//更新图片编辑区(img)
	function updateImgWrap(){
		//处理缓存，保证缓存数据是当前元素数据($curImgList)
		updateCurImgList();
		//更新编辑区
		var size = $curImgList.length;
		var img_edit = $(".img_edit");
		//删除添加提醒和历史内容
		img_edit.find(".img_wrap").html("");
		if(size>0){
			//当前元素src
			var osrc = curelement.find("img").attr("src");
			//插入数据到编辑区
			for(var i=0;i<size;i++){
				var src = $curImgList[i].src;
				var imgindex = (i+1);
				img_edit.find(".img_wrap")
				.append("<div class='img_item edit_drag_item edit-hover' dragtype='img'><div class='img_item_front'><span class='img_index'>"+imgindex+"</span></div><div class='img_item_back'><img class='img-ico' src='"+src+"' alt='"+$curImgList[i].name+"' attrid='"+$curImgList[i].attrid+"'></img><div class='info_item_line'><div class='img_item_name ellipsis' title=''>"+$curImgList[i].name+"</div><div class='img-ratio ellipsis'></div></div><div class='handle_item_line'><div class='edit-handle edit-replace img-replace' imgindex='"+imgindex+"' title='"+"替换"+"'></div><div class='edit-handle edit-del img-del' attrid='"+$curImgList[i].attrid+"' title='"+"删除"+"'></div></div></div></div>");
				
				if(i < 1){
					if(osrc != src){
						curelement.find("img").attr("src",src);
						osrc = src;
					}
				}else{
					if(!osrc || osrc == ""){
						curelement.find("img").attr("src",src);
					}
				}
				//更新图片分辨率
				updateImgRatio(src,function(imgWidth,imgHeight,aid){
					$(".img_edit .img_wrap .img-ico[attrid='"+aid+"']").parent().find(".img-ratio").text(imgWidth+"x"+imgHeight);
					//删除功能开启
					//$(".img_edit .img-del").show();
				},$curImgList[i].attrid);
			}
			//清空功能开启
			$(".img_edit .emptyimg").removeClass("color-gray");
			$(".img_edit .emptyimg").show();
			//切换时间选择显示
			img_edit.find(".switchingTime").show();
			//更新切换时间显示
			var imgdelay = curelement.attr("delay");
			if(!imgdelay || imgdelay == ""){
				imgdelay = 5;
			}
			$(".img_edit .switchingTime .imgdelay").val(imgdelay);
		}else{
			//切换时间选择隐藏
			img_edit.find(".switchingTime").hide();
			$(".img_edit .switchingTime .imgdelay").val(5);
			curelement.find("img").removeAttr("src");
			//增加添加提醒
			//img_edit.append("<div class='tip-add'><div class='tip-add-img'></div><div class='tip-add-text'>"+$.i18n.prop("progForm.addPictureInfo")+"</div></div>");
			//清空功能隐藏
			$(".img_edit .emptyimg").hide();
		}
		prev = curelement;
		updateShowSize();
	}

	/**元素第一次加载图片，自动根据图片大小和场景缩放比例缩放设置图片方框(img)*/
	function initImgAtuoSize(elementid){
		//如果没定义imgwidth，则当作是第一次，会对元素进行缩放显示
		var ele = $("#"+elementid);
		//图片元素从没图片素材，到有图片素材，都会自动缩放
		//if(!ele.attr("imgwidth")){
		//只要图片元素的宽高是初始值都会进行初始化
		if(parseInt(ele.css("width"))==initImgWidth && parseInt(ele.css("height")) == initImgHeight){
			var imgsrc = $("#"+elementid).find("img").attr("src");
			//调用公用方法获取图片宽高，并传入方法处理图片宽高缩放
			updateImgRatio(imgsrc,function(imgwidth,imgheight,eid){
				var obj = $("#"+eid);
				obj.attr("imgwidth",imgwidth+"px");
				obj.attr("imgheight",imgheight+"px");
				//如果缩放比例为0，则设置为1，即不进行缩放
				if(scale == 0){
					scale = 1;
				}
				var imgscalewidth = imgwidth*scale;
				var imgscaleheight = imgheight*scale;
				var maxwidthend = sceneWidth - parseInt(obj.css("left"));
				var maxheightend = sceneHeight - parseInt(obj.css("top"));
				//如果根据节目场景缩放比例缩放图片后，超出画面，则按最大值再进行缩放
				if(imgscalewidth > maxwidthend || imgscaleheight > maxheightend){
					var imgwscale = maxwidthend/imgscalewidth
					var imghscale = maxheightend/imgscaleheight;
					if(imgwscale<=imghscale){
						imgscalewidth = imgscalewidth*imgwscale;
						imgscaleheight = imgscaleheight*imgwscale;
					}else{
						imgscalewidth = imgscalewidth*imghscale;
						imgscaleheight = imgscaleheight*imghscale;
					}
				}
				
				//设置元素宽高
				obj.css({"width":imgscalewidth+"px","height":imgscaleheight+"px"});
				//随时缩略图
				sceneThumbnail();
			},elementid);
		}
	}
	
	//记录选中的图片对象(img)
	function imgSelected(selectObj){
		var obj = selectObj.find("img");
		var src = obj.attr("osrc");
		var name = obj.attr("alt");
		var attrid = obj.attr("attrid");
		var long = 5;
		var type = "img";
	
		return {"type":type,"src":src,"name":name,"attrid":attrid,"long":long};
	}
	
	//图片素材选择框图片的确认图片事件(img)
	$("#imgModal .confirm").on("click",function(){		
		//判断是否有选中素材
		/*if($("#imgModal .material-item.up-modal-m-i.active").length == 0){
			//top.$.jBox.tip($.i18n.prop("progForm.pleaseThroughClickToSelectMaterial"));
			layer.msg("没有选中的素材，请重新选择素材");
			return;
		}*/
	
		//处理缓存，保证缓存数据是当前元素数据($curImgList)
		updateCurImgList();

		/*var typeObj = materialSelected["img"];
		for(var attrid in typeObj){
			var material = typeObj[attrid];
			var curimglen = $curImgList.length;
			if(curimglen < 1){
				curelement.find("img").attr("src",material.src);		
				initImgAtuoSize(curelement.attr("id"));
			}
			if(materialReplaceFlag && imgReplaceNo && !isNaN(imgReplaceNo) && $curImgList.length > 0){
				var index = imgReplaceNo - 1;
				$curImgList[index] = material;
				imgReplaceNo = null;
				materialReplaceFlag = false;
			}else if(imgReplaceNo && !isNaN(imgReplaceNo)){
				$curImgList.splice(imgReplaceNo,0,material);
				imgReplaceNo++;
			}else if(material){
				$curImgList.push(material);
			}
		}测试屏蔽,这个处理选中数据*/
	
		var data={type: "img", src: "img1.png", name: "测试.jpg", long: "5",attrid:"47a9148ebe8528c0a83fd"}
		$curImgList.push(data);
/*		//选中数据处理
		$("#imgModal .material-item.up-modal-m-i.active").each(function(){
			var obj = $(this).find("img");
			var src = obj.attr("osrc");
			var name = obj.attr("alt");
			var attrid = obj.attr("attrid");
			//console.log("确定之前的$curImgList");
			//console.log($curImgList.length);
			//第一张图片自适应
			var curimglen = $curImgList.length;
			if(curimglen < 1){
				curelement.find("img").attr("src",src);		
				initImgAtuoSize(curelement.attr("id"));
			}
			

			
			if(materialReplaceFlag && imgReplaceNo && !isNaN(imgReplaceNo) && curimglen > 0){
				var index = imgReplaceNo - 1;
				$curImgList[index].attrid = attrid;
				$curImgList[index].name = name;
				$curImgList[index].src = src;
				imgReplaceNo = null;
				materialReplaceFlag = false;
			}else if(imgReplaceNo && !isNaN(imgReplaceNo)){
				$curImgList.splice(imgReplaceNo,0,{"src":src,"name":name,"attrid":attrid});
				imgReplaceNo++;
			}else{
				$curImgList.push({"src":src,"name":name,"attrid":attrid});
			}
		});*/
		
		//数据更新到元素
		if($curImgList.length < 1){
			//该元素没有图片，
			curelement.find("img").attr("src","");
			curelement.attr("curimglist","");
		}else{
			//该元素有图片
			curelement.attr("curimglist",JSON.stringify($curImgList));			
			//比较场景时长
			//设置默认的图片切换时间
			var imgdelay = $(".img_edit .imgdelay").val();
			if(!imgdelay){
				$(".img_edit .imgdelay").val(5);
				imgdelay = 5;
			}
			if(curelement){
				curelement.attr("delay",imgdelay);
			}
			//更新场景时长
			sceneLong(curScene);
		}
		
		//更新图片编辑区
		updateImgWrap();

		//取消选中状态
		$("#imgModal").find(".up-modal-m-i").removeClass("active");
		$("#imgModal").modal("hide");
		
		//随时缩略图
		sceneThumbnail();
	});
	
	//输入设置切换时间(img)
	$('#imgdelay-input').bind('input propertychange', function() { 
		if($(this).val().length < 1){
			return;
		}
		var oimgdelay = null;
		var imgdelay = null;
		try{
			oimgdelay = parseInt(curelement.attr("delay"));
			imgdelay = parseInt($(this).val());
			if(isNaN(imgdelay)){
				imgdelay = 3;
			}
		}catch(e){
			console.log("#imgdelay-input 数据异常 imgdelay："+$(this).val()+"  oimgdelay:"+curelement.attr("delay"));
			oimgdelay = 0;
			imgdelay = 5;
		}
		$(this).val(imgdelay);
		if(oimgdelay!=imgdelay && imgdelay >= 3){
			curelement.attr("delay",imgdelay);
			//更新场景时长
			sceneLong(curScene);
		}
    });  
	
	//切换时间校验(img)
	$('#imgdelay-input').bind('focusout', function() { 
		imgdelay = parseInt($(this).val());
		if(isNaN(imgdelay) || imgdelay < 3){
			$(this).val(3);
			top.$.jBox.tip($.i18n.prop("progForm.minSwitchingTime"));
			$(this).focus();
		}
    });  
	
	//选择设置切换时间(img)
	$(".img_edit .dropdown-menu li").on("click",function(){
		var oimgdelay = parseInt($("#imgdelay-input").val());
		var imgdelay = parseInt($(this).find(".opentree").attr("val"));
		if(oimgdelay!=imgdelay){
			$("#imgdelay-input").val(imgdelay);
			curelement.attr("delay",imgdelay);
			//更新场景时长
			sceneLong(curScene);
		}
	});
	
	//清空图片(img)
	
	$(document).on("click",".img_edit .emptyimg",function(){
		if(!$(this).hasClass("color-gray")){
			curelement.attr("curimglist","");
			$curImgList = [];
			//更新图片编辑区
			
			updateImgWrap();
			//更新场景时长
			sceneLong(curScene);
			//随时缩略图
			sceneThumbnail();
		}
	});
	
	//删除已有素材(img)
	$(document).on("click",".img_item .img-del",function(){
		//处理缓存，保证缓存数据是当前元素数据($curImgList)
		console.log("img-del");
		updateCurImgList();
		var attrid = $(this).attr("attrid");
		for(var i=0,size=$curImgList.length;i<size;i++){
			if($curImgList[i].attrid == attrid){
				$curImgList.splice(i, 1);
				break;
			}
		}
		
		curelement.attr("curimglist",JSON.stringify($curImgList));
		//更新图片编辑区
		
		updateImgWrap();
		//更新场景时长
		sceneLong(curScene);
		//随时缩略图
		sceneThumbnail();
	});
	
	//增加图片元素(img)
	function addimg(guide) {
		
		var openIntro=0;
	    if($("#openIntro").val()==""||$("#openIntro").val()==0){
	    	openIntro=0;
	    }else{
	    	openIntro=1;
	    }
	    
	    
		console.log("for_img_edit click");
		var curScene = $("#topfd1");
		var sf=$("#sf").val();
	    var mfile=$("#mfile").val();
	    window.returnValue=""; 
	    layer.open({
		      
			  type: 2,
	          area: ['900px', 525+'px'],
	          offset: '40px',
	          title:false,
	          fix:false, //不固定
	          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	          content: 'tosceneimg.vs?sucai.type=4&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile+"&openIntro="+openIntro,
	          scrollbar: false,
	          end: function(){ 
		        
					 if(window.returnValue==undefined||window.returnValue==""){
					     window.returnValue=""; 			            
					 }else{

					    //解析json 
					    var rv=window.returnValue;
					    rv=rv.replace(/&quot;/g,"\"");
			            //转换成touch对象组
					    var objs = eval( "(" + rv + ")" );//转换后的JSON对象
	                  
	                    //获取素材播放时长
	                    var ptime=objs.mPlayTimes;
	                    
	                    
	                   //for(var i=0;i<20;i++){
	                	   
	                    //创建元素
		                var add = $("<div id='image"+total+"' elementType='image'  class='element active image elementBorder' title='' curimglist='' from='img_edit' style='top:0px;left:0px;display:block;width:"+Math.round((objs.mWidth)*sf)+"px;height:"+Math.round((objs.mHeight)*sf)+"px;position: absolute;z-index:"+total+";background-color:#fff;opacity:0.8;' ><img src='files/"+mfile+"/"+objs.mMediaList[0].path+"' style='width:100%;height:100%;opacity:0.8;'></div>");
		                 
		                //播放时长
		                add.attr("ptime",ptime);
		                  
		                //数据源
		                add.attr("jsonData",rv);

		                draginitfn($(add));
		                //绑定编辑框
		                resizeinitfn($(add));
		                //add.resizable();				
						var curScene = $("#topfd1");
							
						curScene.append(add);
							
						$("#elementList").append("<div><input type='checkbox' eId=image"+total+" name='checkdom'/>image"+total+"<br></div>");
							
						total++;
	                    
						getItemStime();
						
						//初始化元素
						addElementInitPro(add);
						
	                   //} 		
					
						
				 }           
			}
		});
		
		
        //$(add).mousedown();
        /* redo();*/
		//更新图片编辑区
		//updateImgWrap();
		//更新元素位置在当前可视范围内
		//var top = $(".content-main-edit").scrollTop();
		//add.css("top",top+"px");
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下)
	    //sceneThumbnail();
		//openmateriallibrary();
	}
	
	
	
	//增加柜员元素(teller)
	function addteller() {
		
		var openIntro=0;
	    if($("#openIntro").val()==""||$("#openIntro").val()==0){
	    	openIntro=0;
	    }else{
	    	openIntro=1;
	    }
	    
	    
		console.log("for_img_edit click");
		var curScene = $("#topfd1");
		var sf=$("#sf").val();
	    var mfile=$("#mfile").val();
	    window.returnValue=""; 
	    layer.open({
		      
			  type: 2,
	          area: ['900px', 525+'px'],
	          offset: '40px',
	          title:false,
	          fix:false, //不固定
	          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	          content: 'tosceneteller.vs?sucai.type=4&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile+"&openIntro="+openIntro,
	          scrollbar: false,
	          end: function(){ 
		        
					 if(window.returnValue==undefined||window.returnValue==""){
					     window.returnValue=""; 			            
					 }else{

					    //解析json 
					    var rv=window.returnValue;
					    rv=rv.replace(/&quot;/g,"\"");
			            //转换成touch对象组
					    var objs = eval( "(" + rv + ")" );//转换后的JSON对象
	                  
	                    //获取素材播放时长
	                    var ptime=objs.mPlayTimes;
	                    
	                    
	                   //for(var i=0;i<20;i++){
	                	   
	                    //创建元素
		                var add = $("<div id='teller"+total+"' elementType='teller'  class='element active image elementBorder' title='' curimglist='' from='img_edit' style='top:0px;left:0px;display:block;width:"+Math.round((objs.mWidth)*sf)+"px;height:"+Math.round((objs.mHeight)*sf)+"px;position: absolute;z-index:"+total+";background-color:#fff;opacity:0.8;' ><img src='files/"+mfile+"/"+objs.mMediaList[0].path+"' style='width:100%;height:100%;opacity:0.8;'></div>");
		                 
		                //播放时长
		                add.attr("ptime",ptime);
		                
		                //key
		                add.attr("tellerKey",objs.tellerKey);
		                  
		                //数据源
		                add.attr("jsonData",rv);

		                draginitfn($(add));
		                //绑定编辑框
		                resizeinitfn($(add));
		                //add.resizable();				
						var curScene = $("#topfd1");
							
						curScene.append(add);
							
						$("#elementList").append("<div><input type='checkbox' eId=teller"+total+" name='checkdom'/>teller"+total+"<br></div>");
							
						total++;
	                    
						//getItemStime();
						
						//初始化元素
						addElementInitPro(add);
						
	                   //} 		
					
						
				 }           
			}
		});
		
		
        //$(add).mousedown();
        /* redo();*/
		//更新图片编辑区
		//updateImgWrap();
		//更新元素位置在当前可视范围内
		//var top = $(".content-main-edit").scrollTop();
		//add.css("top",top+"px");
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下)
	    //sceneThumbnail();
		//openmateriallibrary();
	}
	

	
	//增加视频元素(video)
	function addvideo(){
		   
		    
		    var openIntro=0;
		    if($("#openIntro").val()==""||$("#openIntro").val()==0){
		    	openIntro=0;
		    }else{
		    	openIntro=1;
		    }
	        console.log("for_video_edit click");
			var curScene = $("#topfd1");
			var sf=$("#sf").val();
		    var mfile=$("#mfile").val();
		    window.returnValue=""; 
		    layer.open({
			      
				  type: 2,
		          area: ['900px', 525+'px'],
		          offset: '40px',
		          title:false,
		          fix:false, //不固定
		          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		          content: 'toscenevideo.vs?sucai.type=3&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile+"&openIntro="+openIntro,
		          scrollbar: false,
		          end: function(){ 
			        
						 if(window.returnValue==undefined||window.returnValue==""){
						     window.returnValue=""; 			            
						 }else{

						    //解析json 
						    var rv=window.returnValue;
						    rv=rv.replace(/&quot;/g,"\"");
				            //转换成touch对象组
						    var objs = eval( "(" + rv + ")" );//转换后的JSON对象
		                  
		                    //获取素材播放时长
		                    var ptime=objs.mPlayTimes;
		                    
		                    //创建元素
		                    var add = $("<div id='video"+total+"'  elementType='video'  " +
		                    		"elementVideoType='video'  " +
		                    		"class='element active video elementBorder' title='' " +
		                    		"curimglist='' from='video_edit' style='top:0px;left:0px;display:block;width:"
		                    		+Math.round((objs.mWidth)*sf)+"px;height:"+Math.round((objs.mHeight)*sf)+
		                    		"px;position: absolute;z-index:"+total+";opacity:0.8;' ><img src='image/video_bg.png' " +
		                    				"style='width:100%;height:100%;opacity:0.8;'></div>");
		                 
		                    //播放时长
		                    add.attr("ptime",ptime);
		                  
		                     //数据源
		                    add.attr("jsonData",rv);

		                    //拖动
		                    draginitfn($(add));
		                    //绑定编辑框
		                    resizeinitfn($(add));
		                        				
							
							var curScene = $("#topfd1");
							
							curScene.append(add);
							
							$("#elementList").append("<div><input type='checkbox' eId=video"+total+" name='checkdom'/>video"+total+"<br></div>");
							
							total++;
							
							getItemStime();
							
							//初始化元素
							addElementInitPro(add);
					 }           
				}
			});
		
		

		
		//更新视频编辑区
		//updateVideoWrap();
		
		//更新元素位置在当前可视范围内
	//	var top = $(".content-main-edit").scrollTop();
		//add.css("top",top+"px");
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下) 	   
		//sceneThumbnail();
		//openmateriallibrary();
	}
	

	
	//新增文档
	function adddoc(){
		    console.log("for_doc_edit click");
			var curScene = $("#topfd1");
			var sf=$("#sf").val();
		    var mfile=$("#mfile").val();
		    setLayerBigDataParameter("");
		    window.returnValue=""; 
		    layer.open({
			      
				  type: 2,
				  area: ['980px', 525+'px'],
		          offset: '40px',
		          title:false,
		          fix:false, //不固定
		          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		          content: 'toscenedoc.vs?sucai.type=10&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile,
		          scrollbar: false,
		          end: function(){ 
			        
						 if(window.returnValue==undefined||window.returnValue==""){
						     window.returnValue=""; 			            
						 }else{
							 
							 
							//X@Y@宽@高@字体类型@字体大小@字距@滚动方式@滚动速度@文本内容

			 				var rv=window.returnValue;
			                 
							var tres=rv.split('@');
							var w=tres[2];
							var h=tres[3];
							var xy_x=tres[0];
					        var xy_y=tres[1];

					         var showBgColor="";
				             
				             if(tres[22]==1){
				            	 
				            	 showBgColor=tres[21];
				            	 
				             }else{
				            	 
				            	 showBgColor=tres[10];
				            	 
				             }
				            
					
						   
		                    
		                    //创建元素
		                    var add = $("<div id='fonts"+total+"'  elementType='fonts'   class='element active fonts elementBorder' title='"+tres[7]+"-"+tres[8]+"' curimglist='' from='video_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";overflow:hidden;opacity:0.8;' ><div class='doc_content'></div></div>");
		                 
		                    add.css({
		                    	      "fontSize":Math.round(tres[5]*sf)+"px" ,"fontFamily":tres[4],
		                              "lineHeight":Math.round(Math.round(tres[5]*tres[6])*sf)+"px",
		                              "backgroundColor":showBgColor
		                            });
		                    
		                    add.find(".doc_content").html(tres[9]);
		                    
		                    //add.html(tres[9]);
		                    
		                    add.attr("fontSize",tres[5]);
		                    add.attr("lineHeight",parseInt(tres[5]*tres[6]));
		                    
		  				    add.attr("fonttype",tres[4]);     //字体类型
	                        add.attr("txtfontsize",tres[5]);  //字体大小
	                        add.attr("lineH",tres[6]);        //字距
	                        add.attr("gdtype",tres[7]);       //滚动方式
	                        
	                        add.attr("gdspeed",tres[8]);      //滚动速度 
	                     
	                        add.attr("backcolor",tres[10]);   //背景颜色
	                        add.attr("fontcolor",tres[11]);   //字体颜色 
	
	                        add.attr("fbold",tres[12]);       //加粗
						    add.attr("fitallic",tres[13]);    //斜体
						    add.attr("fsetline",tres[14]);    //下划线
						    add.attr("fsetstrike",tres[15]);  //中线
	                        add.attr("textDataSource",tres[16]);  //数据来源
	                        add.attr("advancedType",tres[17]);  //设置字体大小 0普通 1高级
	                        
	                      
	                        add.attr("relationKey",tres[18]);  //二次开发设置key
	                        
	                        add.attr("highFontColor",tres[19]);  //高级字体颜色
	                        add.attr("fontColorCb",tres[20]);  //高级字体颜色checkbox
	                        
	                        
	                        add.attr("highBgColor",tres[21]);  //高级背景颜色
	                        add.attr("bgColorCb",tres[22]);  //高级背景颜色checkbox
	                        
	                        
						  
	                        add.attr("doc_content",tres[9]);
		                      
	                        
	                        draginitfn($(add));
		                  
		                    //绑定编辑框
		                    resizeinitfn($(add));
		                        				
							
							var curScene = $("#topfd1");
							
							curScene.append(add);
							
							$("#elementList").append("<div><input type='checkbox' eId=fonts"+total+" name='checkdom'/>fonts"+total+"<br></div>");
							
							total++;
							
							//初始化元素
							addElementInitPro(add);
						
					 }           
				}
			});
	}
	
	
	//增加时间元素(time)
	function addtime(){
		   
	        console.log("for_time_edit click");
			var curScene = $("#topfd1");
			var sf=$("#sf").val();
		    var mfile=$("#mfile").val();
		    window.returnValue=""; 
		    layer.open({
			      
				  type: 2,
				  area: ['800px', '500px'],
		          offset: '40px',
		          title:false,
		          fix:false, //不固定
		          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		          content: "toadtime.vs?sf="+sf,
		          scrollbar: false,
		          end: function(){ 
			        
						 if(window.returnValue==undefined||window.returnValue==""){
						     window.returnValue=""; 			            
						 }else{

						    //解析json 
						    var rv=window.returnValue;
						    
						    rv=rv.replace(/&quot;/g,"\"");
						    
				            //转换成touch对象组
						    var obj= eval( "(" + rv + ")" );//转换后的JSON对象
		                  
		                    //创建元素
		                    var add = $("<div id='mytime"+total+"'   elementType='mytime'   class='element active mytime elementBorder' title='' curimglist='' from='mytime_edit' style='top:0px;left:0px;display:block;width:"+Math.round(300*sf)+"px;height:"+Math.round(100*sf)+"px;position: absolute;z-index:"+total+";font-family:微软雅黑;opacity:0.8;' ><div class='time_content'><div></div>");
		                 
		                     //数据源
		                    add.attr("jsonData",rv);
		                    
		                    add.css({
		                    	      "color":"#"+obj.fcolor,
		                    	      "fontSize":Math.round(obj.fs*sf)+"px",
		                    	      "lineHeight":Math.round(obj.fs*sf)*1.3+"px",
		                    	      "zIndex":total
		                    	    });
		                    
		                     add.attr("tType",obj.tType);

							 add.attr("tsType",obj.tsType);

							 add.attr("fs",obj.fs);

							 add.attr("fcolor",obj.fcolor);

							 add.attr("ttDa",obj.ttDa);

							 add.attr("ttHo",obj.ttHo);

							 add.attr("ttMi",obj.ttMi);

							 add.attr("ttSs",obj.ttSs);

							 add.attr("ttTimePoint",obj.ttTimePoint);

							 add.attr("advancedType",obj.advancedType);

							 add.attr("unitShow",obj.unitShow);

							 
                             var mytimContent=getTimeShowStyle(obj.tType,obj.tsType,obj.ttDa,obj.ttHo,obj.ttMi,obj.ttSs,obj.unitShow); 
					
                             //time_content
                             add.find(".time_content").text(mytimContent);
							 //add.html(mytimContent);
                             
                             add.attr("mytimContent",mytimContent);

                             draginitfn($(add));
		                     //绑定编辑框
		                     resizeinitfn($(add));
		                        											
							 var curScene = $("#topfd1");
							
							 curScene.append(add);
							
							 $("#elementList").append("<div><input type='checkbox' eId=mytime"+total+" name='checkdom'/>mytime"+total+"<br></div>");
							
							 total++;
							 
 							 //初始化元素
							 addElementInitPro(add);
							 
						
					 }           
				}
			});
		
		

		
		//更新视频编辑区
		//updateVideoWrap();
		
		//更新元素位置在当前可视范围内
	   //	var top = $(".content-main-edit").scrollTop();
		//add.css("top",top+"px");
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下) 	   
		//sceneThumbnail();
		//openmateriallibrary();
	}
	
	
	
	//增加背景
	function addbj(){
		console.log("for_bg_edit click");
		var curScene = $("#topfd1");
		var sf=$("#sf").val();
	    var mfile=$("#mfile").val();
	    
	    //素材名
		var bgname =curScene.attr("bgname");

		  //素材fileName名
		var bgnameUrl=curScene.attr("bgnameUrl");

		  //0表示为无场景
		if(bgname==undefined||bgname=="0"){
			 bgname="null";
			 bgnameUrl="null";
		} 
		  
		  
	    window.returnValue=""; 
	    
	    layer.open({
	    	
			  type: 2,
	          area: ['900px', 525+'px'],
	          offset: '40px',
	          title:false,
	          fix:false, //不固定
	          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	          content: 'toscenebj.vs?sucai.type=1&gssi.sucaigroupid=0&sf='+sf+"&bgname="+bgname+"&bgnameUrl="+bgnameUrl,
	          scrollbar: false,
	          end: function(){ 
	    	      
	                var rv=window.returnValue;

	                if(rv==""){
	                	
	                	return;
	                	
	                }else if(rv=="unbj"){
		              curScene.css({"backgroundImage":"url(files/"+rv+")"});
	                  //curScene.attr("title",rv.split("/")[1]);
		              curScene.attr("title","");
	                  curScene.attr("bgname","0");
	                  curScene.attr("bgnameUrl","");
	                  
	      
	                }else{
		
				      var rvs=rv.split("$");
				      var bgtopfd="url(files/"+rvs[0]+")";
				      curScene.attr("title",rv.split("/")[1]);
				
				      curScene.css({
					           "backgroundImage":bgtopfd,
					           "backgroundSize":"cover",
					           "filter":"progid:DXImageTransform.Microsoft.AlphaImageLoader ( sizingMethod='scale' , src='"+bgtopfd+"')",
				               "backgroundSize":"100% 100%" 
					
				       });
				       
				       curScene.attr("bgtopfd",bgtopfd);
				       curScene.attr("bgname",rvs[1]);
				       curScene.attr("bgnameUrl",rvs[0].split("/")[1]);
			          //document.getElementById("bgname").innerHTML=rvs[1];
                    }
			  }    
		   });
		
		
	}
	
	//新增区域背景
	/*	function addqybj()
		{
			var curScene = $();
			
			
		}*/
	
	
	//增加网页(html)
	function addhtml(){
		console.log("for_html_edit click");
		var curScene = $("#topfd1");
		var sf=$("#sf").val();
	    var mfile=$("#mfile").val();
  
	    window.returnValue=""; 
	    
	    layer.open({
	    	
			  type: 2,
			  area: ['800px', '500px'],
	          offset: '40px',
	          title:false,
	          fix:false, //不固定
	          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	          content: "toadhtml.vs",
	          scrollbar: false,
	          end: function(){ 
	    	      
	    	     if(window.returnValue==undefined||window.returnValue==""){
	    		
	    		    window.returnValue="";
	    		
			     }else{
				 
				    var rv=window.returnValue;
	                
				    var rv=window.returnValue;
					var tres=rv.split('*');
					
					rv=tres[0];
					
				    var xy_x=tres[0];
		            var xy_y=tres[1];
					var w=tres[2];
					var h=tres[3];
					var times=tres[4];
					var gun=tres[5];
		            //创建元素
                    var add = $("<div id='htmls"+total+"'  elementType='htmls'  class='element active htmls elementBorder' title='"+tres[4]+"*"+tres[5]+"*"+tres[6]+"' curimglist='' from='htmls_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";background-color:#3CB371;font-family:微软雅黑;color:#000000;opacity:0.8;' >htmls"+total+"</div>");
                 
                    add.css({
                    	      "fontSize":Math.round(36*sf)+"px" 
                           });
                    
              
                    add.attr("time",tres[4]);
                    add.attr("gun",tres[5]);
                    add.attr("sortableListSpans",tres[6]);
                    
                    draginitfn($(add));
                    
                    //绑定编辑框
                    resizeinitfn($(add));
                        											
					var curScene = $("#topfd1");
					
					curScene.append(add);
					
					$("#elementList").append("<div><input type='checkbox' eId=htmls"+total+" name='checkdom'/>htmls"+total+"<br></div>");
					
					total++;
					
					//初始化元素
					addElementInitPro(add);
	
		          }	
	      
			  }    
		   });
	}	
	
	
	//增加天气
	function addweather(){
		
		console.log("for_weather_edit click");
		var curScene = $("#topfd1");
		var sf=$("#sf").val();
	    var mfile=$("#mfile").val();
  
	    window.returnValue=""; 
	    
	    layer.open({
	    	
			  type: 2,
			  area: ['800px', '500px'],
	          offset: '40px',
	          title:false,
	          fix:false, //不固定
	          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	          content: "toadtq.vs?sf="+sf,
	          scrollbar: false,
	          end: function(){ 
	    	      
	    	
	    	       if(window.returnValue==undefined||window.returnValue==""){
			            window.returnValue=""; 			            
			       }else{
			    	    var rv=window.returnValue;
		               
	                    var tres=rv.split('*');
						
						var w=tres[2];
						var h=tres[3];
					    var xy_x=tres[0];
			            var xy_y=tres[1];
			            var wtype=tres[8];
			            //alert(wtype);
			        	var gif="";
		               	var content="";
		               	var day="";
		               
		               	$.ajax({
	                            url:'ajaxGetTq.vs',
				                data:{
	    					        city : tres[7].split("--")[0]
	    					        
					            },
								 type:'post',  
							     cache:false,  
							     dataType:'json',  
							     async:false,
							     success:function(data) {
								     
								    //显示图片
								    gif = data.gif.split("|")[0];
								    //alert(gif);
								    //温度
								    content=data.content.split("|")[0];
								    //alert(content);
								    //天气
								    day=data.day.split("|")[0];
								    //alert(day)
								    	
								    //flag=true;
								      
								 }
						});
		               	
			            var city="";
			            if(gif==""){
			            	gif="w_clear.png";
			            	city="&nbsp;&nbsp;&nbsp;"+tres[7].split("--")[0];
			            }else{
			            	city=tres[7].split("--")[0];
			            }
			            var add;
			            //根据样式拼接
			            //创建元素 
			       
			            	  add = $("<div id='mytqs"+total+"'  elementType='mytqs'  class='element active mytqs elementBorder' title='"+tres[4]+"*"+tres[5]+"*"+tres[6]+"*"+tres[7]+"*"+tres[8]+"' curimglist='' from='mytqs_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";font-family:微软雅黑;color:#"+tres[6]+";opacity:0.8;text-align: center;' >" +
			                    		"<img src='image/weather/"+gif+"' style='width:50%;height:50%;opacity:0.8;'><br/>"+
			                    		"" +city+"&nbsp;&nbsp;&nbsp;"+day+"<br/>"+
			                    		""+content+
			                    		"</div>");
			            	   add.css({
			                  	      "fontSize":Math.round(36*sf)+"px" 
			                         });	                    
	                    //alert(tres[7]);
	                    add.attr("fresh",tres[4]);
	                    add.attr("dx",tres[5]);
	                    add.attr("wfcolor",tres[6]);
	                    add.attr("sortableListSpans",tres[7]);
	                    
	                    draginitfn($(add));
	                    
	                    //绑定编辑框
	                    resizeinitfn($(add));
	                        											
						var curScene = $("#topfd1");
						
						curScene.append(add);
						
						$("#elementList").append("<div><input type='checkbox' eId=mytqs"+total+" name='checkdom'/>mytqs"+total+"<br></div>");
						
						total++;	   
						
						//初始化元素
						addElementInitPro(add);
			       } 
	               
			   }    
		   });
		
	}
	
	
	//增加区域(互动组)
	function addinteractgroup(){
		
		console.log("for_interactGroup_edit click");
		var curScene = $("#topfd1");
		var sf=$("#sf").val();
	    var mfile=$("#mfile").val();
	    
	    var myigsId="myigs"+total;
	    var touchIds="";
	    $("input[name = checkdom]:checkbox").each(function(){
	   
	    	if(touchIds.length==0){
				  touchIds=$(this).attr("eId");
			}else{
				  touchIds=touchIds+"*"+$(this).attr("eId");
			} 
	     });
	    
	    if(touchIds.length==0){
	    	touchIds=myigsId;
	    }else{
	    	 touchIds=touchIds+"*"+myigsId;
	    }
	   
	    
	    //创建对象
	  	var recycler=new Object();
	  	recycler.id=myigsId;
	  	recycler.name=myigsId;
	  	recycler.interactGroupNumber=3;
	  	var jsonStr=JSON.stringify(recycler);
	  	jsonStr=jsonStr.replace(/"/g,"'");

		 
	  	var treeData="";
		
		url="toInteractGroupTouch.vs?currentdiv="+jsonStr+"&touchIds="+touchIds+"&treeData="+treeData;

	    window.returnValue=""; 
	    
	    layer.open({
	    	
	    	type: 2,
 			area: ['900px', 600+'px'],
 	        offset: '10px',
 	        title:false,
 	        fix: false, //不固定
 	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
 	        content: url,
 	        scrollbar: false,
 	        end: function(){
 	            if(window.returnValue==undefined||window.returnValue==""){
 				     window.returnValue=""; 			            
 				}else{
	 					var rv=window.returnValue;
	  					
					   	var w=300;
					   	var h=300;
					    var xy_x=0;
			            var xy_y=0;
			            
			            //创建元素
	                    var add = $("<div id='"+myigsId+"'  elementType='myigs'  class='element active myigs elementBorder' title='' curimglist='' from='myigs_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";background-color:#8DB6CD;font-family:微软雅黑;color:#000000;opacity:0.8;' >"+myigsId+"</div>");
	                 
	                    add.css({
	                    	      "fontSize":Math.round(36*sf)+"px" 
	                           });
	                    
	              
	                    var rvs=rv.split("$");
	                    if(rvs.length==2){
	                          
	                    	  var recyclerReturn= eval( "(" + rvs[0] + ")" );
	                    	  
	                    	  add.attr("interactGroupShowNumber",recyclerReturn.interactGroupNumber); 
	                    	  add.attr("recycler",rvs[0]);
	    					  add.attr("treeData",rvs[1]);
	                    }
	                    
	                    draginitfn($(add));
	                    //绑定编辑框
	                    resizeinitfn($(add));
	                        											
						var curScene = $("#topfd1");
						
						curScene.append(add);
						
						$("#elementList").append("<div><input type='checkbox' eId="+myigsId+" name='checkdom'/>"+myigsId+"<br></div>");
						
						total++;
						
						//初始化元素
						addElementInitPro(add);

						
			       } 
	               
			   }    
		   });
		
	}
	
	
	//增加office元素(img)
	function addoffices(myoffice) {
		
		console.log("for_office_edit click");
		var curScene = $("#topfd1");
		var sf=$("#sf").val();
	    var mfile=$("#mfile").val();
	    
	    if(myoffice=="myppt"){
			   
	     	   url='tosceneppt.vs?sucai.type=6&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile;
	     	   
	    }else if(myoffice=="mydoc"){
		       
	     	   url='tosceneword.vs?sucai.type=7&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile;
	     	   
	    }else if(myoffice=="myxls"){
		       
	     	   url='tosceneexcel.vs?sucai.type=8&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile;
	     	
	    }else if(myoffice=="mypdf"){
		       
	     	   url='toscenepdf.vs?sucai.type=9&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile;
	  
	    } 	 
	    
	    window.returnValue=""; 
	    layer.open({     
			  type: 2,
			  area: ['900px', 530+'px'],
	          offset: '40px',
	          title:false,
	          fix:false, //不固定
	          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	          content: url,
	          scrollbar: false,
	          end: function(){ 
		        
					 if(window.returnValue==undefined||window.returnValue==""){
					     window.returnValue=""; 			            
					 }else{

					    //解析json 
					    var rv=window.returnValue;
					    rv=rv.replace(/&quot;/g,"\"");
			            //转换成touch对象组
					    var objs = eval( "(" + rv + ")" );//转换后的JSON对象
	                  
	                    //获取素材播放时长
	                    var ptime=objs.mPlayTimes;
	                    
	                    //创建元素
	                    var add = $("<div id='"+myoffice+total+"'   elementType='"+myoffice+"'  class='element active office elementBorder' title='' curimglist='' from='img_edit' style='top:0px;left:0px;display:block;width:"+Math.round((objs.mWidth)*sf)+"px;height:"+Math.round((objs.mHeight)*sf)+"px;position: absolute;z-index:"+total+";background-color:#fff;opacity:0.8;' ><img src='files/"+mfile+"/"+objs.mMediaList[0].path+"' style='width:100%;height:100%;opacity:0.8;'></div>");
	                 
	                    //播放时长
	                    add.attr("ptime",ptime);
	                  
	                     //数据源
	                    add.attr("jsonData",rv);
	                    

	                    draginitfn($(add));

	                    //绑定编辑框
	                    resizeinitfn($(add));
	                        				
						
						var curScene = $("#topfd1");
						
						curScene.append(add);
						
						$("#elementList").append("<div><input type='checkbox' eId="+myoffice+total+" name='checkdom'/>"+myoffice+total+"<br></div>");
						
						total++;
						
						//初始化元素
						addElementInitPro(add);

						
					
				 }           
			}
		});
		
		
        //$(add).mousedown();
        /* redo();*/
		//更新图片编辑区
		//updateImgWrap();
		//更新元素位置在当前可视范围内
		//var top = $(".content-main-edit").scrollTop();
		//add.css("top",top+"px");
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下)
	    //sceneThumbnail();
		//openmateriallibrary();
	}
	
	//增加音频
    function addaudio(){
		   
	        console.log("for_audio_edit click");
			var curScene = $("#topfd1");
		    var yxSucaiListJson="";
		    var yxmusics=$("#video10000");
		    console.log("yxmusics:"+yxmusics);
			if(yxmusics!=null){
				 yxSucaiListJson=yxmusics.attr("jsonData");
				 console.log("yxSucaiListJson:"+yxSucaiListJson);
				 if(yxSucaiListJson==null||yxSucaiListJson==undefined){
					 yxSucaiListJson="";
				 }else{
					 yxSucaiListJson=yxSucaiListJson.replace(/"/g,"'"); 
				 }
				 
		    }
			    
			var sf=$("#sf").val();
		    var mfile=$("#mfile").val();
		    window.returnValue=""; 
		    layer.open({
			      
				  type: 2,
		          area: ['900px', 525+'px'],
		          offset: '40px',
		          title:false,
		          fix:false, //不固定
		          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		          content: 'tosceneaudio.vs?sucai.type=2&gssi.sucaigroupid=0&mfile='+mfile+"&yxSucaiListJson="+yxSucaiListJson,
		          scrollbar: false,
		          end: function(){ 
			        
						 if(window.returnValue==undefined||window.returnValue==""){
						     window.returnValue=""; 			            
						 }else{

						    //解析json 
						    var rv=window.returnValue;
						   
						    if(rv=="clear"){
						    	$("#bgm_show").text("");
						    	$("#video10000").remove();
						    	$("#audioShow").remove();
						    }else{
						    	
						    	    rv=rv.replace(/&quot;/g,"\"");
						            //转换成touch对象组
								    var objs = eval( "(" + rv + ")" );//转换后的JSON对象
				                  
				                    //获取素材播放时长
				                    var ptime=objs.mPlayTimes;
				                    
				                    $("#video10000").remove();
				                    //创建元素
				                    var add = $("<div id='video10000'  elementType='video'  elementVideoType='video'  class='element active audio' title='' curimglist='' from='audio_edit' style='top:0px;left:0px;display:block;width:1px;height:1px;position: absolute;' ></div>");
				                 
				                    //播放时长
				                    add.attr("ptime",ptime);
				                  
				                     //数据源
				                    add.attr("jsonData",rv);

				                    //绑定编辑框
				                    //resizeinitfn($(add));
				                        				
									
									var curScene = $("#topfd1");
									
									curScene.append(add);
									
//									$("#elementList").append("<div><input type='checkbox' eId=video"+total+" name='checkdom'/>video"+total+"<br></div>");
									
									//total++;
									
									getItemStime();
									

									var audioNames="";
									for(i=0;i<objs.mMediaList.length;i++){
										if(i==0){
											audioNames=objs.mMediaList[i].sname;
										}else{
											audioNames+=","+objs.mMediaList[i].sname;
										}
										
									}
									
									$("#bgm_show").text(audioNames);
									
									
									//添加显示
									
									

				                    var addAudio = $("<div id='audioShow'   title='"+localObj.a00449+"' curimglist='' from='video_edit' style='top:5px;left:"+($("#topfd1").width()-90)+"px;display:block;width:60px;height:60px;position: absolute;z-index:"+10000+";cursor: pointer;' ><img src='image/bg_music.png' style='width:100%;height:100%'></div>");
				                    
				                    addAudio.click(function(){
				                      	 
				                    	addaudio();
				                    	
				                    });
				                    
				                    curScene.append(addAudio);
				                    
						    	
						    }
						  
							
							
						
					 }           
				}
			});
		
		

		
		//更新视频编辑区
		//updateVideoWrap();
		
		//更新元素位置在当前可视范围内
	//	var top = $(".content-main-edit").scrollTop();
		//add.css("top",top+"px");
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下) 	   
		//sceneThumbnail();
		//openmateriallibrary();
	}
	
  //轮播插件
	function addCarousel()
	{
		//var elementHide=false;
		var curScene = $("#topfd1");
		var sf=$("#sf").val();
	    var mfile=$("#mfile").val();
	    var addDX;
	    var w=350;
 		var h=500;
 	    var searchId="searc"+total;
 		var caroD="caroD"+total;
 	    var caroY="caroY"+total;
 				   	    var addSearch=$("<div id='"+searchId+"'  type='111'    elementType='searc'     " +
				    	  		"class='element active mydll elementBorder'  curimglist='' " +
				    	  		"from='mydll_edit' tTargetId='"+caroD+"' style='top:0px;left:0px;display:block;width:"+
				    	  		Math.round((350)*sf)+"px;height:"+Math.round((80)*sf)+"px;position: absolute;z-index:"
				    	  		+total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;' >"+searchId+"</div>");
 				   	    		addSearch.css({
 				   	    			"fontSize":Math.round(36*sf)+"px"
 				   	    		});
 				   	    		//addSearch.attr("elementHide",elementHide);
 				   	    var addYX= $("<div id='"+caroY+"'  type='110'    elementType='caroY'     " +
					    	  		"class='element active mydll elementBorder'  curimglist='' " +
					    	  		"from='mydll_edit' style='top:0px;left:0px;display:block;width:"+
					    	  		Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"
					    	  		+total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;' >"+caroY+"</div>");
					    			addYX.css({
					    				"fontSize":Math.round(36*sf)+"px"
					    			});		
					    			//addYX.attr("elementHide",elementHide);
 				   	     layer.open({
 							      
 								  type: 2,
 						          area: ['900px', 525+'px'],
 						          offset: '40px',
 						          title:false,
 						          fix:false, //不固定
 						          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
 						          content: 'toscenevideo.vs?sucai.type=3&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile+"&openIntro="+openIntro+"&yMb="+caroY+"&ssMb="+searchId,
 						          scrollbar: false,
 						          end: function(){ 
 							        
 									

 										    //解析json 
 										    var rv=window.returnValue;
 										    rv=rv.replace(/&quot;/g,"\"");
 								            //转换成touch对象组
 										    var objs = eval( "(" + rv + ")" );//转换后的JSON对象
 						                    //alert(JSON.stringify(objs));
 						                    //获取素材播放时长
 						                    var ptime=objs.mPlayTimes;
 						                    
 						                    //创建元素
 						                    addDX = $("<div id="+caroD+"   elementType='caroD'  elementVideoType='caroD' " +
 						                    		" class='element active video elementBorder' title='' curimglist=''" +
 						                    		" from='caroD_edit' style='background-color:#000000;font-family:微软雅黑;color:#FFFFFF;" +
 						                    		"top:0px;left:0px;display:block;width:"
 						                    		+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: " +
 						                    				"absolute;z-index:"+total+";' >"+caroD+"</div>");
 						                    
 						                  addDX.css({
 						    				"fontSize":Math.round(36*sf)+"px"
 						                  });		
 						                 
 						                  	//addDX.attr("type",112);
 						                  //	addDx.attr("elementHide",elementHide);
 						                  	
 						                    //播放时长
 						                    addDX.attr("ptime",ptime);
 						                  
 						                     //数据源
 						                    addDX.attr("jsonData",rv);
 						                    draginitfn($(addDX));
 						                    resizeinitfn($(addDX));
 										    getItemStime();
 										    addElementInitPro(addDX);
 									        draginitfn($(addSearch));
 					                       
 					                         draginitfn($(addYX));
 					                         //绑定编辑框
 						                     resizeinitfn($(addSearch));
 						                     
 						                     resizeinitfn($(addYX));
 						                     
 											 var curScene = $("#topfd1");
 											 curScene.append($(addSearch));
 											 curScene.append($(addDX));
 											 curScene.append($(addYX));
 											  $("#elementList").append("<div><input type='checkbox' eId='"+searchId+"' name='checkdom'/>"+searchId+"<br></div>");
 											  $("#elementList").append("<div><input type='checkbox' eId='"+caroD+"' name='checkdom'/>"+caroD+"<br></div>");
 											  $("#elementList").append("<div><input type='checkbox' eId='"+caroY+"' name='checkdom'/>"+caroY+"<br></div>");
 											  total++;	     
 									   	  
 										    	 //构造
 										     var touchInteractive = new Object();
 											  //初始化元素
 											 
 											  addElementInitPro(addYX);
 											  addElementInitPro(addSearch);
 								}
 							});
	}
	//KTV插件(轮播优化) 暂不用
	function addCatalog()
	{
		// var elementHide=false;
		var curScene = $("#topfd1");
		var sf=$("#sf").val();
	    var mfile=$("#mfile").val();
	    var addDX;
	    var w=350;
 		var h=328;
 	    var searchId="searc"+total;
 		var caroD="caroD"+total;
 	    var caroY="caroY"+total;
 	    var bgname =0;
        var carobj="cqybj"+total;
		  // 素材fileName名
		var bgnameUrl=null;
		  // 0表示为无背景
		if(bgname==undefined||bgname=="0"){
			 bgname="null";
			 bgnameUrl="null";
		} 
		 var add;
 		 var addSearch=$("<div id='"+searchId+"'  type='111'    elementType='searc'     " +
				    	"class='element active mydll elementBorder'  curimglist='' " +
				    	"from='mydll_edit' tTargetId='"+caroD+"' style='top:0px;left:0px;display:block;width:"+
				    	Math.round((350)*sf)+"px;height:"+Math.round((80)*sf)+"px;position: absolute;z-index:"
				    	+total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;' >"+searchId+"</div>");
 				   	    addSearch.css({
 				   	    			"fontSize":Math.round(36*sf)+"px"
 				   	    });
 				   	addSearch.attr("bj",carobj);
 				   	    		// addSearch.attr("elementHide",elementHide);
 		 var addYX= $("<div id='"+caroY+"'  type='110'    elementType='caroY'     " +
					 "class='element active mydll elementBorder'  curimglist='' " +
					 "from='mydll_edit' style='top:0px;left:0px;display:block;width:"+
					 Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"
					 +total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;' >"+caroY+"</div>");
					    			addYX.css({
					    				"fontSize":Math.round(36*sf)+"px"
					    			});		
					    			addYX.attr("bj",carobj);
					    			// addYX.attr("elementHide",elementHide);
					     layer.open({
					    			    	
					    			type: 2,
					    		    area: ['900px', 525+'px'],
					    		    offset: '40px',
					    		    title:false,
					    		    fix:false, // 不固定
					    		    shift: Math.ceil(Math.random()*6), // 0-6的动画形式，-1不开启
					    		    content: 'toscenebj.vs?sucai.type=1&gssi.sucaigroupid=0&sf='+sf+"&bgname="+bgname+"&bgnameUrl="+bgnameUrl,
					    		    scrollbar: false,
					    		    end: function(){ 
					    		    	   var rv=window.returnValue;
					    		                if(rv==""){
					    		                	
					    		                	return;
					    		                	
					    		                }else{
					    			
					    					      var rvs=rv.split("$");
					    					      var bgtopfd="url(files/"+rvs[0]+")";
					    					      add= $("<div id='"+carobj+"'   type='cqybj' elementType='cqybj' from='cqybj_edit' class='element active mydll elementBorder'  style='display:block;width:"+Math.round((800)*sf)+"px;height:"+Math.round((500)*sf)+"px;position: absolute;z-index:0;background-color:#000000;font-family:微软雅黑;color:#FFFFFF;'></div>");
					    					      add.attr("title",rv.split("/")[1]);
					    					      add.css({
					    						           "backgroundImage":bgtopfd,
					    						           "backgroundSize":"cover",
					    						           "filter":"progid:DXImageTransform.Microsoft.AlphaImageLoader ( sizingMethod='scale' , src='"+bgtopfd+"')",
					    					               "backgroundSize":"100% 100%" 
					    						
					    					       });
					    					      bgnameUrl=rvs[0].split("/")[1];
					    					      add.attr("bgtopfd",bgtopfd);
					    					  	  add.attr("bgname",rvs[1]);
					    					      add.attr("bgnameUrl",bgnameUrl);					    					   
					    					      curScene.append(add);
					    						  draginitfn($(add));
					    			                    // 绑定编辑框
					    			              resizeinitfn($(add));
					    						  addElementInitPro($(add));
					    				          // document.getElementById("bgname").innerHTML=rvs[1];
					    				   				
					    						    	layer.open({
					    	 							      
					    	 								  type: 2,
					    	 						          area: ['900px', 525+'px'],
					    	 						          offset: '40px',
					    	 						          title:false,
					    	 						          fix:false, // 不固定
					    	 						          shift: Math.ceil(Math.random()*6), // 0-6的动画形式，-1不开启
					    	 						          content: 'toscenevideo.vs?sucai.type=3&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile+"&openIntro="+openIntro+"&yMb="+caroY,
					    	 						          scrollbar: false,
					    	 						          end: function(){ 
					    	 						        	  		// 解析json
					    	 										    var rv=window.returnValue;
					    	 										    rv=rv.replace(/&quot;/g,"\"");
					    	 								            // 转换成touch对象组
					    	 										    var objs = eval( "(" + rv + ")" );// 转换后的JSON对象
					    	 						                    // alert(JSON.stringify(objs));
					    	 						                    // 获取素材播放时长
					    	 						                    var ptime=objs.mPlayTimes;
					    	 						                    
					    	 						                    // 创建元素
					    	 						                    addDX = $("<div id="+caroD+"   elementType='caroD'  elementVideoType='caroD' " +
					    	 						                    		" class='element active video elementBorder' title='' curimglist=''" +
					    	 						                    		" from='caroD_edit' style='background-color:#000000;font-family:微软雅黑;color:#FFFFFF;" +
					    	 						                    		"top:0px;left:0px;display:block;width:"
					    	 						                    		+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: " +
					    	 						                    				"absolute;z-index:"+total+";opacity:0.8;' >"+caroD+"</div>");
					    	 						                    
					    	 						                  addDX.css({
					    	 						    				"fontSize":Math.round(36*sf)+"px"
					    	 						                  });		
					    	 						             
					    	 						                  	// addDX.attr("type",112);
					    	 						                  // addDx.attr("elementHide",elementHide);
					    	 						                  	
					    	 						                    // 播放时长
					    	 						                    addDX.attr("ptime",ptime);
					    	 						                    addDX.attr("mBackground",bgnameUrl);
					    	 						                     // 数据源
					    	 						                    addDX.attr("jsonData",rv);
					    	 						                    addDX.attr("bj",carobj);
					    	 						                    draginitfn($(addDX));
					    	 						                    resizeinitfn($(addDX));
					    	 										    getItemStime();
					    	 										    addElementInitPro(addDX);
					    	 									        draginitfn($(addSearch));
					    	 					                       
					    	 					                         draginitfn($(addYX));
					    	 					                         // 绑定编辑框
					    	 						                     resizeinitfn($(addSearch));
					    	 						                     
					    	 						                     resizeinitfn($(addYX));
					    	 											 add.append($(addSearch));
					    	 											 add.append($(addDX));
					    	 											 add.append($(addYX));
					    	 											  $("#elementList").append("<div><input type='checkbox' eId='"+carobj+"' name='checkdom'/>"+carobj+"<br></div>");
					    	 											  $("#elementList").append("<div><input type='checkbox' eId='"+searchId+"' name='checkdom'/>"+searchId+"<br></div>");
					    	 											  $("#elementList").append("<div><input type='checkbox' eId='"+caroD+"' name='checkdom'/>"+caroD+"<br></div>");
					    	 											  $("#elementList").append("<div><input type='checkbox' eId='"+caroY+"' name='checkdom'/>"+caroY+"<br></div>");
					    	 											  total++;	     
					    	 									   	  
					    	 											  // 初始化元素
					    	 											 
					    	 											  addElementInitPro(addYX);
					    	 											  addElementInitPro(addSearch);
					    	 										
					    	 										
					    	 								}
					    	 							});		  
					    	                    }
					    				  }    
					    			   });
	}
     //增加录像
	function addmedia(){
		
		console.log("for_media_edit click");
		var curScene = $("#topfd1");
		var sf=$("#sf").val();
	    var mfile=$("#mfile").val();
  
	    window.returnValue=""; 
	    
	    layer.open({
	    	
			  type: 2,
			  area: ['800px', '500px'],
	          offset: '40px',
	          title:false,
	          fix:false, //不固定
	          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	          content: "tomedia.vs",
	          scrollbar: false,
	          end: function(){ 
	    	      
	    	
	    	       if(window.returnValue==undefined||window.returnValue==""){
			            window.returnValue=""; 			            
			       }else{
			    	   //解析json 
					    var rv=window.returnValue;
					    rv=rv.replace(/&quot;/g,"\"");
					    //转换后的JSON对象
					    var objs = eval( "(" + rv + ")" );
			            
			            //创建元素
	                    var add = $("<div id='video"+total+"'  elementType='video'  elementVideoType='videoMedia'   class='element active video elementBorder'  curimglist='' from='video_edit' style='top:0px;left:0px;display:block;width:"+Math.round((objs.mWidth)*sf)+"px;height:"+Math.round((objs.mHeight)*sf)+"px;position: absolute;z-index:"+total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;opacity:0.8;' >video"+total+"</div>");
	                 
	                    add.css({
	                    	      "fontSize":Math.round(36*sf)+"px" 
	                           });
	                    
	              
	                    add.attr("jsonData",rv);
	                    
	                    add.attr("ptime",-1);

	                    draginitfn($(add));
	                    //绑定编辑框
	                    resizeinitfn($(add));
	                        											
						var curScene = $("#topfd1");
						
						curScene.append(add);
						
						$("#elementList").append("<div><input type='checkbox' eId=video"+total+" name='checkdom'/>video"+total+"<br></div>");
						
						total++;	 
						
						//初始化元素
						addElementInitPro(add);
			       } 
	               
			   }    
		   });
		
	}
	
	
	//增加网络摄像
	function addnetcamera(){
		
		console.log("for_netcamera_edit click");
		var curScene = $("#topfd1");
		var sf=$("#sf").val();
	    var mfile=$("#mfile").val();
  
	    window.returnValue=""; 
	    
	    layer.open({
	    	
			  type: 2,
			  area: ['600px', '400px'],
	          offset: '40px',
	          title:false,
	          fix:false, //不固定
	          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	          content: "item_camera.jsp",
	          scrollbar: false,
	          end: function(){ 
	    	      
	    	
	    	       if(window.returnValue==undefined||window.returnValue==""){
			            window.returnValue=""; 			            
			       }else{
			    	     var rv=window.returnValue;
						 var tres=rv.split('*');
					   	 var w=tres[2];
					   	 var h=tres[3];
					   	 var xy_x=tres[0];
			             var xy_y=tres[1];
			            
			            //创建元素
	                    var add = $("<div id='mycam"+total+"'  elementType='mycam'    title='"+tres[4]+"*"+tres[5]+"*"+tres[6]+"*"+tres[7]+"'   class='element active mycam elementBorder'  curimglist='' from='mycam_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";background-color:#B4EEB4;font-family:微软雅黑;color:#000000;opacity:0.8;' >mycam"+total+"</div>");
	                 
	                    add.css({
	                    	      "fontSize":Math.round(36*sf)+"px" 
	                           });
	                    
	              
	                    //add.attr("jsonData",rv);
	                    draginitfn($(add));
	                    //绑定编辑框
	                    resizeinitfn($(add));
	                        											
						var curScene = $("#topfd1");
						
						curScene.append(add);
						
						$("#elementList").append("<div><input type='checkbox' eId=mycam"+total+" name='checkdom'/>mycam"+total+"<br></div>");
						
						total++;
						
						//初始化元素
						addElementInitPro(add);
			       } 
	               
			   }    
		   });
		
	}
	


	//增加控件
	function adddll(){
		
		console.log("for_dll_edit click");
		var curScene = $("#topfd1");
		var sf=$("#sf").val();
	    var mfile=$("#mfile").val();
  
	    window.returnValue=""; 
	    
	    layer.open({
	    	
			  type: 2,
			  area: ['600px', '400px'],
	          offset: '40px',
	          title:false,
	          fix:false, //不固定
	          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	          content: "item_dll.jsp",
	          scrollbar: false,
	          end: function(){ 
	    	      
	    	      
	    	       if(window.returnValue==undefined||window.returnValue==""){
			            window.returnValue=""; 			            
			       }else{
			    	   
			    	    var rv=window.returnValue;
			    	    
						var tres=rv.split('|');
	                    var dllTitle="";
	                    var xy_x=0;
  		                var xy_y=0;
                  	    var w=0;
  				   	    var h=0;
  				   	    var dllId="";
  				   	    var jsonStr="";
	                    if(tres[0]=="qmany"){
	                    	 var tress=tres[1].split('*');
	                         if(tress.length==10){
	                        	 
	                        	  xy_x=tress[0];
	        		              xy_y=tress[1];
	                        	  w=tress[2];
	        				   	  h=tress[3];
	        				   	  
	        				   	  dllTitle=tress[4]+"*"+tress[5]+"*"+tress[6]+"*"+tress[7]+"*"+tress[8]+"*"+tress[9];
	        				   	  
	        				   	  dllId="qmany"+total;
	        				   	  
	        				   	 //创建元素
	   	                           var add = $("<div id='"+dllId+"'  elementType='qmany'   title='"+dllTitle+"'   class='element active mydll elementBorder'  curimglist='' from='mydll_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;opacity:0.8;' >"+dllId+"</div>");
	   	                           
	   	                           
	   	                           add.css({
		                    	      "fontSize":Math.round(36*sf)+"px" 
		                           });
	   	                        
	   	                           draginitfn($(add));
	   	                           //绑定编辑框
	   		                       resizeinitfn($(add));
	   		                        											
	   							   var curScene = $("#topfd1");
	   							
	   							  curScene.append(add);
	   							
	   							  $("#elementList").append("<div><input type='checkbox' eId='"+dllId+"' name='checkdom'/>'"+dllId+"'<br></div>");
	   							
	   							  total++;
	   							  
	   							  //初始化元素
	   							  addElementInitPro(add);
	        				   	  
	                         }
	                      }else if(tres[0]=="qsing"){
		                    	 var tress=tres[1].split('*');
		                         if(tress.length==10){
		                        	 
		                        	  xy_x=tress[0];
		        		              xy_y=tress[1];
		                        	  w=tress[2];
		        				   	  h=tress[3];
		        				   	  
		        				   	  dllTitle=tress[4]+"*"+tress[5]+"*"+tress[6]+"*"+tress[7]+"*"+tress[8]+"*"+tress[9];
		        				   	  
		        				   	  dllId="qsing"+total;
		        				   	  
		        				   	 //创建元素
		   	                           var add = $("<div id='"+dllId+"' elementType='qsing'  title='"+dllTitle+"'   class='element active mydll'  curimglist='' from='mydll_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;' >"+dllId+"</div>");
		   	                           
		   	                           add.css({
			                    	      "fontSize":Math.round(36*sf)+"px" 
			                           });
		   	                           draginitfn($(add));
		   	                           //绑定编辑框
		   		                       resizeinitfn($(add));
		   		                        											
		   							  var curScene = $("#topfd1");
		   							
		   							  curScene.append(add);
		   							
		   							  $("#elementList").append("<div><input type='checkbox' eId='"+dllId+"' name='checkdom'/>'"+dllId+"'<br></div>");
		   							
		   							  total++;	  
		   							  
		   							  //初始化元素
		   							  addElementInitPro(add);
		   							  
		        				   	  
		                         }
		                   }else if(tres[0]=="mybus"){
		                    	 var tress=tres[1].split('*');
		                         if(tress.length==8){
		                        	 
		                        	  xy_x=tress[0];
		        		              xy_y=tress[1];
		                        	  w=tress[2];
		        				   	  h=tress[3];
		        				   	  
		        				   	  dllTitle=tress[4]+"*"+tress[5]+"*"+tress[6]+"*"+tress[7];
		        				   	  
		        				   	  dllId="mybus"+total;
		        				   	  
		        				   	  
		        				   	   //创建元素
		   	                           var add = $("<div id='"+dllId+"'  elementType='mybus'  title='"+dllTitle+"'   class='element active mydll elementBorder'  curimglist='' from='mydll_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;' >"+dllId+"</div>");
		   	                           
		   	                           add.css({
			                    	      "fontSize":Math.round(36*sf)+"px" 
			                            });
		   	                        
		   	                           draginitfn($(add));
		   	                           //绑定编辑框
		   		                       resizeinitfn($(add));
		   		                        											
		   							   var curScene = $("#topfd1");
		   							
		   							   curScene.append(add);
		   							
		   							   $("#elementList").append("<div><input type='checkbox' eId='"+dllId+"' name='checkdom'/>'"+dllId+"'<br></div>");
		   							
		   							   total++;	    
		   							   
		   							   //初始化元素
		   							   addElementInitPro(add);
		        				   	  
		                         }
		                    }else if(tres[0]=="charg"){
		                    	 var tress=tres[1].split('*');
		                         if(tress.length==7){
		                        	 
		                        	  xy_x=tress[0];
		        		              xy_y=tress[1];
		                        	  w=tress[2];
		        				   	  h=tress[3];
		        				   	  
		        				   	  
		        				   	  
		        				   	  dllId="charg"+total;
		        				   	  
		        				   	  var programDll=new Object();
			      					  programDll.rows=tress[5];
			      					  programDll.columns=tress[6];
			      					  programDll.type=101;

			      					  jsonStr=JSON.stringify(programDll);
			      				  	  jsonStr=jsonStr.replace(/"/g,"'");
			      				  	  
			      				  	  
			      				  	  //创建元素
       		                          var add = $("<div id='"+dllId+"'  elementType='charg'  title='"+dllTitle+"'   class='element active mydll elementBorder'  curimglist='' from='mydll_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;' >"+dllId+"</div>");
       				         
       		                 
       		                          add.css({
       		                    	      "fontSize":Math.round(36*sf)+"px" 
       		                          });
       		                    
       		                           add.attr("jsonStr",jsonStr);
         		    				
       		                           draginitfn($(add));
         		    				  //绑定编辑框
			  		                   resizeinitfn($(add));
			  		                        											
			  						   var curScene = $("#topfd1");
			  							
			  						   curScene.append(add);
			  							
			  						   $("#elementList").append("<div><input type='checkbox' eId='"+dllId+"' name='checkdom'/>"+dllId+"<br></div>");
			  							
			  						   total++;	             
			      				  	  
			  						   //初始化元素
			  						   addElementInitPro(add);
			      				  	  
		                         }
		                    }else if(tres[0]=="source"){
		                    	
		                    	setLayerBigDataParameter("");
		        		    	window.returnValue="";
		        		    	layer.open({
		        		    		type: 2,
		        		    		area: ['980px', 520+'px'],
		        		    		offset: '40px',
		        		    		title:false,
		        		    		fix:false, //不固定
		        		    		shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		        		    		content: 'todatasource.vs',
		        		    		scrollbar: false,
		        		    		end: function(){ 
		        		    			 if(window.returnValue==undefined||window.returnValue==""){
		        		    				window.returnValue=""; 			            
		        		    			 }else{
		        		    				 var rv=window.returnValue;
		        		    				 
		        		    				//转换成touch对象组
		        		    				 var objs = eval( "(" + rv + ")" );//转换后的JSON对象
		        		    				 
		        		    				
		        		    				 w=objs.mWidth;
		        		    				 h=objs.mHeight;
		        		    				 xy_x=0;
		        		    				 xy_y=0;
		        		    				
		        		    				
		        		    				 dllId="source"+total;
		        		    						 
		        		    				
		        		    				 //jsonStr=tres[0];
		        		    				  //jsonStr=jsonStr.replace(/'/g,"\"");
		        		    				 
		        		    				  //设置背景色
		        		    				 var  tableBorderColor=objs.borderColor;
		        		    				  
		        		    				 if(tableBorderColor=="-65536"){
		        		    			    	  
		        		    					 tableBorderColor="#ED1C24";
		        		    			    	  
		        		  				     }else if(tableBorderColor=="-16776961"){
		        		  			        	
		        		  				    	tableBorderColor="#3F48CC";
		        		  			        	
		        		  			         }else  if(tableBorderColor=="-256"){
		        		  				    
		        		  			        	tableBorderColor="#FFC90E";
		        		  				    	
		        		  				     }else if(tableBorderColor=="-16711936"){
		        		  			        	 
		        		  				    	tableBorderColor="#22B14C";
		        		  			            
		        		  			         }else  if(tableBorderColor=="-2"){
		        		  				    	
		        		  			        	tableBorderColor="#FFFFFF";
		        		  				     }else  if(tableBorderColor=="-7829368"){
		        		  				    	
		        		  				    	tableBorderColor="#7F7F7F";
		        		  				    	
		        		  				     }else  if(tableBorderColor=="-16777216"){
		        		  				    	 
		        		  				    	tableBorderColor="#000000";
		        		  				    	
		        		  				     }
		        		    				 
		        		    				 
		        		    				 var createTable="";
		        		    				 if(objs.showType==1&&objs.titleState==1){
		        		    					 objs.rows=objs.rows+1;
		        		    				 }else if(objs.showType==2&&objs.titleState==1){
		        		    				  objs.cols=objs.cols+1;
		        		    				 }
		        		    				 for(var i=0;i<objs.rows;i++){
		        		    					 createTable+="<tr>";
    		                    		    	 for(var j=0;j<objs.cols;j++){
    		                    		    		 
    		                    		    		 if(objs.showType==2){
    		                    		    			 if(j==0){
    		                    		    				
    	    		                    		    			 createTable+="<td style='border:"+objs.borderState+"px solid "+tableBorderColor+";'>"+objs.title[i].value+"</td>";	
    	    		                    		    		
    		                    		    			 }else{
    		                    		    				
    	    		                    		    			 createTable+="<td style='border:"+objs.borderState+"px solid "+tableBorderColor+";'>value</td>";	
    	    		                    		    		
    		                    		    				 
    		                    		    			 }
    		                    		    		 }else  if(objs.showType==1){
    		                    		    			 if(i==0){
    		                    		    				  
    		                    		    				 createTable+="<td style='border:"+objs.borderState+"px solid "+tableBorderColor+";'>"+objs.title[j].value+"</td>";	
    	    		                    		    		
    		                    		    			 }else{
    		                    		    				
    	    		                    		    		 createTable+="<td style='border:"+objs.borderState+"px solid "+tableBorderColor+";'>value</td>";	
    	    		                    		    		
    		                    		    			 }
    		                    		    		 }else{
    		                    		    			 
	    		                    		    			createTable+="<td style='border:"+objs.borderState+"px solid "+tableBorderColor+";'>value</td>";	
	    		                    		    		
    		                    		    		 }
    		                    		    		
    		                    		    		 
    		                    		    	 }
    		                    		    	 createTable+="</tr>"; 
    		                    		     }
		        		    				 
		        		    				  //设置背景色
		        		    				 var  tableBgColor=objs.title[0].bgColor;
		        		    				  
		        		    				 if(tableBgColor=="-65536"){
		        		    			    	  
		        		    					 tableBgColor="#ED1C24";
		        		    			    	  
		        		  				     }else if(tableBgColor=="-16776961"){
		        		  			        	
		        		  				    	tableBgColor="#3F48CC";
		        		  			        	
		        		  			         }else  if(tableBgColor=="-256"){
		        		  				    
		        		  			        	tableBgColor="#FFC90E";
		        		  				    	
		        		  				     }else if(tableBgColor=="-16711936"){
		        		  			        	 
		        		  				    	tableBgColor="#22B14C";
		        		  			            
		        		  			         }else  if(tableBgColor=="-2"){
		        		  				    	
		        		  			        	tableBgColor="#FFFFFF";
		        		  				     }else  if(tableBgColor=="-7829368"){
		        		  				    	
		        		  				    	tableBgColor="#7F7F7F";
		        		  				    	
		        		  				     }else  if(tableBgColor=="-16777216"){
		        		  				    	tableBgColor="#000000";
		        		  				     }
		        		  				     
		        		    				  
		        		    				  //创建元素
		        		                      var add = $("<div id='"+dllId+"' elementType='source'     class='element active mydll elementBorder'  curimglist='' from='mydll_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";font-family:微软雅黑;background-color:"+tableBgColor+";' >"+
		        		                    		     "<table class='source_content' style='width:100%;height:100%;table-layout:fixed;text-align: center;border-collapse:collapse;' >" +
		        		                    		     
		        		                    		    
		        		                    		      createTable
		        		                    		     
		        		                    		      //"<tr><td style='border:1px solid black;'>21</td><td style='border:1px solid black;'>22</td></tr>" +
		        		                    		     
		        		                    		      +"</table>"
		        		                    		      +"</div>");
		        				         
		        		                 
		        		                      //设置背景色
			        		    				 var  tableFontColor=objs.title[0].fontColor;
			        		    				  
			        		    				 if(tableFontColor=="-65536"){
			        		    			    	  
			        		    					 tableFontColor="#ED1C24";
			        		    			    	  
			        		  				     }else if(tableFontColor=="-16776961"){
			        		  			        	
			        		  				    	tableFontColor="#3F48CC";
			        		  			        	
			        		  			         }else  if(tableFontColor=="-256"){
			        		  				    
			        		  			        	tableFontColor="#FFC90E";
			        		  				    	
			        		  				     }else if(tableFontColor=="-16711936"){
			        		  			        	 
			        		  				    	tableFontColor="#22B14C";
			        		  			            
			        		  			         }else  if(tableFontColor=="-2"){
			        		  				    	
			        		  			        	tableFontColor="#FFFFFF";
			        		  				     }else  if(tableFontColor=="-7829368"){
			        		  				    	
			        		  				    	tableFontColor="#7F7F7F";
			        		  				    	
			        		  				     }else  if(tableFontColor=="-16777216"){
			        		  				    	tableFontColor="#000000";
			        		  				     }
		        		                      
			        		    			   var selfFontSize=12;
		        		                       if(objs.title[0].fontSize==-1){
		        		                    	   selfFontSize=12;
		        		                       }else{
		        		                    	   selfFontSize=objs.title[0].fontSize;  
		        		                       }
		        		                       add.css({
		        		                    	      "fontSize":Math.round(selfFontSize*sf)+"px",
		        		                              "color":tableFontColor
		        		                       });
		        		                    
		        		                       add.attr("jsonStr",rv);
		          		    				   add.attr("fontSize",24);
		          		    				   add.attr("lineHeight",24);
		          		    				   
		          		    				   draginitfn($(add));
		          		    				   //绑定编辑框
					  		                   resizeinitfn($(add));
					  		                        											
					  						   var curScene = $("#topfd1");
					  							
					  						   curScene.append(add);
					  							
					  						   $("#elementList").append("<div><input type='checkbox' eId='"+dllId+"' name='checkdom'/>"+dllId+"<br></div>");
					  							
					  						   total++;
					  						   
					  						   //初始化元素
					  						   addElementInitPro(add);
					  						   
		        		                       
		        		    				 
		        		    			}
		        		    		}
		        		    	});

		                    	
		                    }else if(tres[0]=="dllItem"){
		                    	
		                    	setLayerBigDataParameter("");
		        		    	
		        		    	window.returnValue="";

		        		    	var dllItemUser=getDllItemBindUserNew();
		        		    	var jsonStr=JSON.stringify(dllItemUser);
		        				jsonStr=jsonStr.replace(/"/g,"'");
		        				
		        				$.ajax({
		 	                           url:'ajaxSaveSession.vs',
						                data:{
		        					        jsonStr : jsonStr,
		        					        jsonData : ''
							            },
										 type:'post',  
									     cache:false,  
									     dataType:'json',  
									     success:function(data) {
										
										 }
								});
		        				
		        				
		        		    	layer.open({
		        		    		type: 2,
		        		    		area: ['980px', 530+'px'],
		        		    		offset: '40px',
		        		    		title:false,
		        		    		fix:false, //不固定
		        		    		shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		        		    		content: 'toAdDllItem.vs',
		        		    		scrollbar: false,
		        		    		end: function(){ 
		        		    			 if(window.returnValue==undefined||window.returnValue==""){
		        		    				window.returnValue=""; 			            
		        		    			 }else{
		        		    				 

		        		    				 //解析json 
		        							 var rv=window.returnValue;
		        							 rv=rv.replace(/&quot;/g,"\"");
		        					         //转换成touch对象组
		        							 var objs = eval( "(" + rv + ")" );//转换后的JSON对象

		        							
		        							 w=objs.mWidth;
		        		    				 h=objs.mHeight;
		        		    				 xy_x=0;
		        		    				 xy_y=0;
		        		                     dllId="dllIt"+total;
		       		                      
		        		    				 
		        		    				 //数据源
								          
								             jsonStr=rv;
								             
								              //创建元素
						                      var add = $("<div id='"+dllId+"'   elementType='dllItem'   title='"+dllTitle+"'   class='element active mydll elementBorder'  curimglist='' from='mydll_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;' >"+dllId+"</div>");

								              add.css({
					                    	      "fontSize":Math.round(36*sf)+"px" 
					                          });
								              
								              add.attr("jsonData",jsonStr);
				  		    				  add.attr("fontSize",24);
				  		    				  add.attr("lineHeight",24);
				  		    				  
				  		    				  draginitfn($(add));
				  		    				  //绑定编辑框
				  		                      resizeinitfn($(add));
				  		                        											
				  							  var curScene = $("#topfd1");
				  							
				  							  curScene.append(add);
				  							
				  							  $("#elementList").append("<div><input type='checkbox' eId='"+dllId+"' name='checkdom'/>"+dllId+"<br></div>");
				  							
				  							  total++;	             
				  							  
				  							  //初始化元素
				  							  addElementInitPro(add);
								             
		        		    			  }
		        		    		    }
		        		    	 });
		        	
	    
		                    	
			      				  	  
		                   }else if(tres[0]=="envir"){
		                    	
		                        	  xy_x=0;
		        		              xy_y=0;
		                        	  w=300;
		        				   	  h=300;
		        				   	 
		        				   	  dllId="envir"+total;
		        				   	 
		        				   	  var envirs=tres[1].split("*")
		        				   	  
		        				   	  var add;
		        				   	  
		        				   	  if(envirs.length==3){
		        				   		  
		        				   		
				   	                         add = $("<div id='"+dllId+"'  type='"+envirs[0]+"'  happyVal='"+envirs[1]+"'    uncomVal='"+envirs[2]+"'   elementType='envir'  title='"+dllTitle+"'   class='element active mydll elementBorder'  curimglist='' from='mydll_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;' >"+dllId+"</div>");
				   	                           
				   	                        
				   	                         
		        				   	  }else{
		        				   		  
		        				   		 
				   	                         add = $("<div id='"+dllId+"'  type='"+tres[1]+"'      elementType='envir'  title='"+dllTitle+"'   class='element active mydll elementBorder'  curimglist='' from='mydll_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;' >"+dllId+"</div>");
				   	                           
				   	                         
		        				   	  }
		        				   	 
		        				   	 
		        				   	  
		        				   	
		        				   	 add.css({
			                    	      "fontSize":Math.round(36*sf)+"px" 
			                         });
		   	                        
		   	                         draginitfn($(add));
		   	                         //绑定编辑框
		   		                     resizeinitfn($(add));
		   		                        											
		   							  var curScene = $("#topfd1");
		   							
		   							  curScene.append(add);
		   							
		   							  $("#elementList").append("<div><input type='checkbox' eId='"+dllId+"' name='checkdom'/>'"+dllId+"'<br></div>");
		   							
		   							  total++;	     
		        				   	  
		   							  //初始化元素
		   							  addElementInitPro(add);
		                         
		                      }else if(tres[0]=="eleva"){
			                    	
	                        	     xy_x=0;
	        		              
	                        	     xy_y=0;
	                        	  
	                        	     w=300;
	        				   	  
	                        	     h=300;
	        				   	 
	        				   	     dllId="eleva"+total;
	        				   	  
	        				   	    //创建元素
	   	                            var add = $("<div id='"+dllId+"' elementType='eleva'  title='"+dllTitle+"'   class='element active mydll elementBorder'  curimglist='' from='mydll_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";opacity:0.8;' ><img src='image/info_bg.png' style='width:100%;height:100%;opacity:0.8;'></div>");
	   	                           
	   	                            add.css({
	   	                            	
		                    	      "fontSize":Math.round(36*sf)+"px" 
		                            
	   	                            });
	   	                   
	   	                            add.attr("city",tres[1]);
	   	                         
	   	                            draginitfn($(add));
	   	                            //绑定编辑框
	   		                        resizeinitfn($(add));
	   		                        											
	   							    var curScene = $("#topfd1");
	   							
	   							    curScene.append(add);
	   							
	   							    $("#elementList").append("<div><input type='checkbox' eId='"+dllId+"' name='checkdom'/>'"+dllId+"'<br></div>");
	   							
	   							    total++;	     
	        				   	  
	   							    //初始化元素
	   							    addElementInitPro(add);
	                         
	                      }else if(tres[0]=="ports"){
		                    	      
	                    	        var count=0;
	                    	        $("input[name = checkdom]:checkbox").each(function(){
	                    			 //for(var i=0;i<checkdoms.length;i++){
	                    	             div=$("#"+$(this).attr("eId"));
	                    				 
	                    				 key=div.attr("id").substring(0,5);
	                    				 
	                    				 if(key=="ports"){
	                    					 count++;
	                    				 }
	                    				 
	                    	         });	 
	                    				 
	                    	         if(count!=0){
	                    	        	 
	                    	        	 layer.alert("资源接口插件已存在");
	                    	        	 return;
	                    	         }
	                    	  
	                    	         var tress=tres[1].split('*');
		                      
		                        	 
		                        	  xy_x=0;
		        		              xy_y=0;
		                        	  w=300;
		        				   	  h=300;
		        				   	  
		        				   
		        				   	  dllId="ports"+total;
		        				   	  
		        				   	 //创建元素
		   	                           var add = $("<div id='"+dllId+"' elementType='ports'  title=''   class='element active mydll'  curimglist='' from='mydll_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;' >"+dllId+"</div>");
		   	                           
		   	                           add.css({
			                    	      "fontSize":Math.round(36*sf)+"px" 
			                           });
		   	                           draginitfn($(add));
		   	                           //绑定编辑框
		   		                       resizeinitfn($(add));
		   		                        											
		   							  var curScene = $("#topfd1");
		   							
		   							  curScene.append(add);
		   							
		   							  $("#elementList").append("<div><input type='checkbox' eId='"+dllId+"' name='checkdom'/>'"+dllId+"'<br></div>");
		   							
		   							  total++;	  
		   							  
		   							  //初始化元素
		   							  addElementInitPro(add);
		   							  
		        				   	  
		                         
		                   }else if(tres[0]=="ports"){
	                    	      
                   		 
                   			
                   	  
                   	         var tress=tres[1].split('*');
	                      
	                        	 
	                        	  xy_x=0;
	        		              xy_y=0;
	                        	  w=300;
	        				   	  h=300;
	        				   	  
	        				   
	        				   	  dllId="ports"+total;
	        				   	  
	        				   	 //创建元素
	   	                           var add = $("<div id='"+dllId+"' elementType='ports'  title=''   class='element active mydll'  curimglist='' from='mydll_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;' >"+dllId+"</div>");
	   	                           
	   	                           add.css({
		                    	      "fontSize":Math.round(36*sf)+"px" 
		                           });
	   	                           draginitfn($(add));
	   	                           //绑定编辑框
	   		                       resizeinitfn($(add));
	   		                        											
	   							  var curScene = $("#topfd1");
	   							
	   							  curScene.append(add);
	   							
	   							  $("#elementList").append("<div><input type='checkbox' eId='"+dllId+"' name='checkdom'/>'"+dllId+"'<br></div>");
	   							
	   							  total++;	  
	   							  
	   							  //初始化元素
	   							  addElementInitPro(add);
	   							  
	        				   	  
	                         
	                   }else if(tres[0]=="mycall"){
                 	      
	                        	  xy_x=0;
	        		              xy_y=0;
	                        	  w=300;
	        				   	  h=300;
	        				   	  
	        				   
	        				   	  dllId="mycall"+total;
	        				   	  
	        				   	   var parmeter="";
	        				   	   if(tres.length==3){
	        				   		   
	        				   		  parmeter=tres[2];
	        				   		  
	        				   	   }
	        				   	   //创建元素
	   	                           var add = $("<div id='"+dllId+"'  parmeter='"+parmeter+"'      callUrl='myCall.xml'  elementType='mycall'  title=''   class='element active mydll'  curimglist='' from='mydll_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;' >"+dllId+"</div>");
	   	                           
	   	                           add.css({
		                    	      "fontSize":Math.round(36*sf)+"px" 
		                           });
	   	                           draginitfn($(add));
	   	                           //绑定编辑框
	   		                       resizeinitfn($(add));
	   		                        											
	   							  var curScene = $("#topfd1");
	   							
	   							  curScene.append(add);
	   							
	   							  $("#elementList").append("<div><input type='checkbox' eId='"+dllId+"' name='checkdom'/>'"+dllId+"'<br></div>");
	   							
	   							  total++;	  
	   							  
	   							  //初始化元素
	   							  addElementInitPro(add);
	   							
	                   }else if(tres[0]=="teller"){
	                	   
	                	         addteller();
	                	   
	                   }else if(tres[0]="face")
	                   {
	                	   
	                	   w=300;
    					   h=300;
    				   	         dllId="faceR"+total;
    				   	 
    				    	  var faces=tres[1].split("*")
    				   	  
    				    	  var add;
    				   	  
                    add = $("<div id='"+dllId+"'   type='"+faces[0]+"'  happyVal='"+faces[1]+"'    uncomVal='"+faces[2]+"'   elementType='face'  title='"+dllTitle+"'   class='element active mydll elementBorder'  curimglist='' from='mydll_edit' style='top:80px;left:200px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;' >"+dllId+"</div>");
                    	add.css({
                    	      "fontSize":Math.round(36*sf)+"px" 
                         });
    
	                         draginitfn($(add));
	                         //绑定编辑框
		                     resizeinitfn($(add));
		                        											
							  var curScene = $("#topfd1");
							
							  curScene.append(add);
							
							  $("#elementList").append("<div><input type='checkbox' eId='"+dllId+"' name='checkdom'/>'"+dllId+"'<br></div>");
							
							  total++;	     
    				   	  
							  //初始化元素
							  addElementInitPro(add);
	                   }		
	                    	
			    	     
			       } 
	               
			   }    
		   });
		
	}
	
	function addarea(){
		
		   //构造集合对象
	  	   var programComplexMediaManager=new Object();
	  	   programComplexMediaManager.mLeft=0;
	  	   programComplexMediaManager.mTop=0;
	  	   programComplexMediaManager.mWidth=150;
	  	   programComplexMediaManager.mHeight=80;
		   var mMediaList= new Array();
	       //图片播放总时长
		   var mPlayTimes=0;
		   
		   var scBasis = new Object();
		   scBasis.tbType=1;  //类型
		   scBasis.type=1;    //类型 
		   scBasis.timeoutMillis=5;  //切换时长
		   scBasis.path="transpant.png";    //播放地址
		   scBasis.inAnim=6;   //特效
		   scBasis.sname="transpant.png";//显示名称
		   mPlayTimes=mPlayTimes+5;//播放时长
		   mMediaList[0]=scBasis;
	 	   
	       programComplexMediaManager.mPlayTimes=mPlayTimes;//播放总时长
	       programComplexMediaManager.mMediaList=mMediaList;//素材播放列表
		        
		   var json = JSON.stringify(programComplexMediaManager);

			//解析json 
		   var rv=json;
		   rv=rv.replace(/&quot;/g,"\"");
	       //转换成touch对象组
		   var objs = eval( "(" + rv + ")" );//转换后的JSON对象
			
			
		   //获取素材播放时长
	       var ptime=objs.mPlayTimes;
		   //创建元素
		   var sf=$("#sf").val();
		    
		    //创建元素
           var add = $("<div id='himag"+total+"' elementType='image'  class='element active image elementBorder' title='' curimglist='' from='img_edit' style='top:0px;left:0px;display:block;width:"+Math.round((objs.mWidth)*sf)+"px;height:"+Math.round((objs.mHeight)*sf)+"px;position: absolute;z-index:"+total+";background-color:#fff;opacity:0.8;' ><img src='image/black.png' style='width:100%;height:100%'></div>");
             
           //播放时长
           add.attr("ptime",ptime);
              
           //数据源
           add.attr("jsonData",rv);

           draginitfn($(add));
           //绑定编辑框
           resizeinitfn($(add));
                    				
		   var curScene = $("#topfd1");
				
		   curScene.append(add);
				
		   $("#elementList").append("<div><input type='checkbox' eId=himag"+total+" name='checkdom'/>himag"+total+"<br></div>");
				
		   total++;
		    
		   //初始化元素
		   addElementInitPro(add); 
	       
	       
		
	}
	
	
    //相册
	function addimggroup(){
		console.log("for_imggroup_edit click");
		var curScene = $("#topfd1");
		var sf=$("#sf").val();
	    var mfile=$("#mfile").val();
  
	    window.returnValue=""; 
	    
	    layer.open({
	    	
			  type: 2,
			  area: ['900px', 525+'px'],
	          offset: '40px',
	          title:false,
	          fix:false, //不固定
	          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	          content: 'tosceneimgGroup.vs?sucai.type=4&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile,
	          scrollbar: false,
	          end: function(){ 
	    	      
	    	
	    	       if(window.returnValue==undefined||window.returnValue==""){
			            window.returnValue=""; 			            
			       }else{
			    	   //解析json 
					    var rv=window.returnValue;
					    rv=rv.replace(/&quot;/g,"\"");
					    //转换后的JSON对象
					    var objs = eval( "(" + rv + ")" );
			            
			            //创建元素
	                    var add = $("<div id='imggr"+total+"' elementType='imggr'    class='element active imggr elementBorder'  curimglist='' from='imggr_edit' style='top:0px;left:0px;display:block;width:"+Math.round((objs.mWidth)*sf)+"px;height:"+Math.round((objs.mHeight)*sf)+"px;position: absolute;z-index:"+total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;opacity:0.8;' >imggr"+total+"</div>");
	                 
	                    add.css({
	                    	      "fontSize":Math.round(36*sf)+"px" 
	                           });
	                    
	              
	                    //播放时长
						add.attr("ptime",0);
						//数据源
						add.attr("jsonData",rv);
	                    
						draginitfn($(add));
	                    //绑定编辑框
	                    resizeinitfn($(add));
	                        											
						var curScene = $("#topfd1");
						
						curScene.append(add);
						
						$("#elementList").append("<div><input type='checkbox' eId=imggr"+total+" name='checkdom'/>imggr"+total+"<br></div>");
						
						total++;
						
						//初始化元素
						addElementInitPro(add);
						
			       } 
	               
			   }    
		   });
		
	}
	
	
	
	 //翻书
	function addimgflip(){
		console.log("for_imgflip_edit click");
		var curScene = $("#topfd1");
		var sf=$("#sf").val();
	    var mfile=$("#mfile").val();
  
	    window.returnValue=""; 
	    
	    layer.open({
	    	
			  type: 2,
			  area: ['900px', 525+'px'],
	          offset: '40px',
	          title:false,
	          fix:false, //不固定
	          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	          content: 'tosceneimgFlip.vs?sucai.type=4&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile,
	          scrollbar: false,
	          end: function(){ 
	    	      
	    	
	    	       if(window.returnValue==undefined||window.returnValue==""){
			            window.returnValue=""; 			            
			       }else{
			    	   //解析json 
					    var rv=window.returnValue;
					    rv=rv.replace(/&quot;/g,"\"");
					    //转换后的JSON对象
					    var objs = eval( "(" + rv + ")" );
			            
			            //创建元素
	                    var add = $("<div id='imgfl"+total+"' elementType='imgfl'    class='element active imgfl elementBorder'  curimglist='' from='imggr_edit' style='top:0px;left:0px;display:block;width:"+Math.round((objs.mWidth)*sf)+"px;height:"+Math.round((objs.mHeight)*sf)+"px;position: absolute;z-index:"+total+";background-color:#000000;font-family:微软雅黑;color:#FFFFFF;opacity:0.8;' >imgfl"+total+"</div>");
	                 
	                    add.css({
	                    	      "fontSize":Math.round(36*sf)+"px" 
	                           });
	                    
	              
	                    //播放时长
						add.attr("ptime",0);
						//数据源
						add.attr("jsonData",rv);
	                    
						draginitfn($(add));
	                    //绑定编辑框
	                    resizeinitfn($(add));
	                        											
						var curScene = $("#topfd1");
						
						curScene.append(add);
						
						$("#elementList").append("<div><input type='checkbox' eId=imgfl"+total+" name='checkdom'/>imgfl"+total+"<br></div>");
						
						total++;
						
						//初始化元素
						addElementInitPro(add);
						
			       } 
	               
			   }    
		   });
		
	}
	
	
	
	//增加rss
	function addrss() {
		
		console.log("for_rss_edit click");
		var curScene = $("#topfd1");
		var sf=$("#sf").val();
	    var mfile=$("#mfile").val();
	    window.returnValue=""; 
	    layer.open({
		      
			  type: 2,
	          area: ['800px', 550+'px'],
	          offset: '20px',
	          title:false,
	          fix:false, //不固定
	          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	          content: "toadrss.vs?sf="+sf,
	          scrollbar: false,
	          end: function(){ 
		        
					 if(window.returnValue==undefined||window.returnValue==""){
					     window.returnValue=""; 			            
					 }else{

						   var rv=window.returnValue;
							var tres=rv.split('|');
							rv=tres[0];
							var timee=tres[1];
							var w=tres[2];
							var h=tres[3];
							var xy_x=0;
				            var xy_y=0;
							if(tres.length==6){
								xy_x=tres[4];
								xy_y=tres[5];
							}
							
				          
		                    //创建元素
		                    var add = $("<div id='mynew"+total+"'  elementType='mynew'   class='element active fonts elementBorder'  curimglist='' from='mynew_edit' style='top:0px;left:0px;display:block;width:"+Math.round((w)*sf)+"px;height:"+Math.round((h)*sf)+"px;position: absolute;z-index:"+total+";overflow:hidden;opacity:0.8;' >mynew"+total+"</div>");
		                 
		                    add.css({
		                    	      "fontSize":Math.round(36*sf)+"px" ,"fontFamily":"微软雅黑",
		                              "lineHeight":Math.round(36*sf)+"px"
		                            });
		                    
		                    //add.find(".doc_content").html(tres[9]);
		                    
		                    //add.html(tres[9]);
		                    
							add.attr("timee",timee);
										
							add.attr("rsssrc",rv);
							
							var rsssrcs=rv.split("&");
							
							var rssSource=new Object();

						    rssSource.rurl= rsssrcs[0].split("=")[1];
						    
						    rssSource.dx=rsssrcs[2].split("=")[1];
						    
						    rssSource.ys=rsssrcs[1].split("=")[1];
						    
						    rssSource.speed=rsssrcs[4].split("=")[1];
						    
						    rssSource.refreshTime=timee;
						    
						  
						    rssSource.gdfs=rsssrcs[5].split("=")[1];
						    
						    add.attr("rssSource",JSON.stringify(rssSource));
		                      
	                        draginitfn($(add));
		                  
		                    //绑定编辑框
		                    resizeinitfn($(add));
		                        
							var curScene = $("#topfd1");
							
							curScene.append(add);
							
							$("#elementList").append("<div><input type='checkbox' eId=mynew"+total+" name='checkdom'/>mynew"+total+"<br></div>");
							
							total++;
							
							//初始化元素
							addElementInitPro(add);
					
						
				     }           
			}
		});
		
		
        //$(add).mousedown();
        /* redo();*/
		//更新图片编辑区
		//updateImgWrap();
		//更新元素位置在当前可视范围内
		//var top = $(".content-main-edit").scrollTop();
		//add.css("top",top+"px");
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下)
	    //sceneThumbnail();
		//openmateriallibrary();
	}
	
	
	
	//添加元素初始化属性 
	function addElementInitPro(add){
		
		
		curelement = $(add);
		cancelDomCheckbox();
		$("input[eId="+add.attr("id")+"]").prop("checked",true);
		displayMaterialInfo($(add).attr("id"),parseInt($(add).css("left")),parseInt($(add).css("top")),parseInt($(add).css("width")),parseInt($(add).css("height")))
		
		
	}
    
	//样式类型(materialApk)
	$(".materialApk_edit .curelechange").on("change",function(e){
		var obj = $(this);
		var val = null;
		var param = $(this).attr("param");
		var minval = obj.attr("minval");
		if(obj.is("input")){
			val = $(this).val();
			if(param === "backtime"){
				if(minval && val != "无"){
					var v = parseInt(val);
					if(val.length == 0 || isNaN(v) || v < parseInt(minval)){
						v = minval;
					}
					$(this).val(v);
				}else{
					$(this).val(val);
				}
			}else{
				if(minval){
					var v = parseInt(val);
					if(val.length == 0 || isNaN(v) || v < parseInt(minval)){
						v = minval;
					}
					$(this).val(v);
				}else{
					$(this).val(val);
				}
			}
		}else{
			val = $(this).attr("val");
		}

		if(param === "backtime"){
			if(val === "无"){
				curelement.attr(param,0);
			}else{
				var v = parseInt(val);
				if(minval && isNaN(v)){
					v = minval;
				}
				curelement.attr(param,v);
			}
		}else{
			curelement.attr(param,val);
		}
		//是否刷新控件元素
		var isrefresh = $(this).attr("isrefresh");
		if(isrefresh === "1"){
			getMaterialApk(curelement,false);
		}
		//是否刷新编辑区
		var isrefreshedit = $(this).attr("isrefreshedit");
		if(isrefreshedit === "1"){
			updateMaterialApkWrap(curelement);
		}
		//随时缩略图
		sceneThumbnail();
	});
	
	//设置APK图片(materialApk)
	$("#materialApkIconModal .confirm").on("click",function(){
		var obj = $("#materialApkIconModal .material-item.up-modal-m-i.active");
		if(obj.length == 1){
			var imgsrc = obj.find("img").attr("osrc");
			var name = obj.find("img").attr("alt");
			var attrid = obj.find("img").attr("attrid");
			obj.removeClass("active");
			curelement.attr("imgid",attrid).attr("imgidsrc",imgsrc);
		}else {
			top.$.jBox.tip($.i18n.prop("progForm.pleaseThroughClickToSelectMaterial"));
		}
		//更新控件元素显示
		getMaterialApk();
		//更新背景编辑区
		updateMaterialApkWrap();
		$('#materialApkIconModal').modal('hide');
		//随时缩略图
		sceneThumbnail();
	});	
	
	//显示元素APK(materialApk)
	function getMaterialApk(obj){
		if(!obj){
			obj = curelement;
		}
		
		var seltype = obj.attr("seltype");
		var imgid = obj.attr("imgid");
		var imgidsrc = obj.attr("imgidsrc");
		var backtime = obj.attr("backtime");
		var imgsrc = obj.attr("imgsrc");
		var path = obj.attr("path");
		var packagename = obj.attr("packagename");
		var size = obj.attr("size");
		var version = obj.attr("version");
		var name = obj.attr("name");
		var setname = obj.attr("setname");
		var attrid = obj.attr("attrid");
		
		if(attrid && attrid.length > 0){
			if(seltype === "1"){
/*				if(name && name.length > 0){
					var i = name.lastIndexOf('.');
					var nameStr = name.substring(0,i);
					curelement.find("img").css("height","80%");
					curelement.find(".apk-show-name").html(nameStr);
				}else{
					curelement.find("img").css("height","100%");
					curelement.find(".apk-show-name").html("");
				}*/
				curelement.find("img").css("height","80%");
				curelement.find(".apk-show-name").html("APK");
				curelement.find("img").attr("src",imgsrc);
			}else if(seltype === "2"){
				if(setname && setname.length > 0){
					curelement.find("img").css("height","80%");
					curelement.find(".apk-show-name").html(setname);
				}else{
					curelement.find("img").css("height","100%");
					curelement.find(".apk-show-name").html("");
				}
				if(imgidsrc && imgidsrc.length > 0){
					curelement.find("img").attr("src",imgidsrc);
				}else{
					curelement.find("img").attr("src",imgsrc);
				}
			}
		}else{
			//没有选择APK素材
			curelement.find("img").removeAttr("src").css("height","100%");
			curelement.find(".apk-show-name").html("");
		}
	}
	
	//删除素材APK(materialApk)
	$(".materialApk_edit .delmaterialApk").on("click",function(){
		curelement.removeAttr("size").removeAttr("path").removeAttr("version").removeAttr("packagename").removeAttr("imgsrc").removeAttr("name").removeAttr("attrid");
		getMaterialApk();
		updateMaterialApkWrap();
		//随时缩略图
		sceneThumbnail();
	});
	
	//删除素材APK图标(materialApk)
	$(".materialApk_edit .del-apk-icon").on("click",function(){
		curelement.attr("imgid","").attr("imgidsrc","");
		getMaterialApk();
		updateMaterialApkWrap();
		//随时缩略图
		sceneThumbnail();
	});
	
	//上传图片-素材APK图标(materialApk)
	$("#materialApkIconUpload").on("click",function(){
		$("#imgUpload .webuploader-element-invisible").click();
	});
	
	//增加素材APK元素(materialApk)
	function addmaterialApk(){
		total++;
		var add = $("<div id='materialApk_"+total+"' class='element active materialApk' title=''  curimglist='' from='materialApk_edit' style='top:0px;left:0px;display:block;width:"+initImgWidth+"px;height:"+initImgHeight+"px;position: absolute;z-index:"+total+";background-color:#fff;' ><img src='' style='width:100%;height:100%'><div class='apk-show-name'></div></div>");
		//设置默认值
		$(add).attr({
			"seltype":"1",
			"imgid":"",
			"backtime":0,
			"setname":""
		});
		
		draginitfn($(add));
		resizeinitfn($(add));
        curScene.append(add);
        $(add).mousedown();
        /* redo();*/
		//更新图片编辑区
        updateMaterialApkWrap();
		//更新元素位置在当前可视范围内
		var top = $(".content-main-edit").scrollTop();
		add.css("top",top+"px");
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下)
		sceneThumbnail();
		openmateriallibrary();
	}
	
	//更新素材APK编辑区(materialApk)
	function updateMaterialApkWrap(obj){
		if(!obj){
			obj = curelement;
		}
		var seltype = obj.attr("seltype");
		var imgid = obj.attr("imgid");
		var imgidsrc = obj.attr("imgidsrc");
		var backtime = parseInt(obj.attr("backtime"));
		var imgsrc = obj.attr("imgsrc");
		var path = obj.attr("path");
		var packagename = obj.attr("packagename");
		var size = obj.attr("size");
		var version = obj.attr("version");
		var name = obj.attr("name");
		var setname = obj.attr("setname");
		var attrid = obj.attr("attrid");
		
		var showSrc = null;
		if(imgid && imgid.length > 0 && imgidsrc && imgidsrc.length > 0){
			showSrc = imgidsrc;
		}else{
			showSrc = imgsrc;
		}
		
		//返回时间
		var backtimeStr = null;
		if(backtime && !isNaN(backtime) && backtime > 0){
			backtimeStr = backtime+"";
		}else{
			backtimeStr = $.i18n.prop("terminalMonitor.nothing");
		}
		$("#apk-backtime-btn-label").val(backtimeStr);
		
		//根据样式类型改变编辑区
		if(seltype === "1"){
			$(".materialApk_edit .apk-typle-2").hide();
			$(".materialApk_edit .apk-typle-1").show();
		}else{
			$(".materialApk_edit .apk-typle-1").hide();
			$(".materialApk_edit .apk-typle-2").show();
			if(imgid && imgid.length > 0){
				$(".materialApk_edit .apk-typle-2 .apk-icon-div-set").hide();
				$(".materialApk_edit .apk-typle-2 .apk-icon-div-show").show();
				$(".materialApk_edit .apk-typle-2 .apk-icon-div-show .apk-icon-item-img").attr("src",imgidsrc);
			}else{
				$(".materialApk_edit .apk-typle-2 .apk-icon-div-show").hide();
				$(".materialApk_edit .apk-typle-2 .apk-icon-div-set").show();
			}
		}
		
		if(!attrid || attrid == ""){
			$(".materialApk_wrap").hide();
			$(".materialApk_edit .add-item-hl").show();
			//更换选中元素的状态图
			$(".materialApk_edit").find(".materialApk_img_item img").removeAttr("size").removeAttr("path").attr("backtime",backtime).attr("imgid",imgid).removeAttr("version").removeAttr("packagename").removeAttr("imgsrc").removeAttr("name").removeAttr("attrid").removeAttr("alt").attr("src","").removeAttr("style");
			$(".materialApk_edit").find(".materialApk_img_item .materialApk_img_item_name").text("");	
		}else{
			$(".materialApk_edit .add-item-hl").hide();
			$(".materialApk_wrap").show();
			//更换选中元素的状态图
			$(".materialApk_edit").find(".materialApk_img_item img").attr("size",size).attr("path",path).attr("backtime",backtime).attr("imgid",imgid).attr("version",version).attr("packagename",packagename).attr("imgsrc",imgsrc).attr("name",name).attr("attrid",attrid).attr("alt",name).attr("src",showSrc);
			//显示图片名字
			$(".materialApk_edit").find(".materialApk_img_item .materialApk_img_item_name").text(name);		
		}
	}
	
	//素材APK选择框APK的确认事件(materialApk)
	$("#materialApkModal .confirm").on("click",function(){
		var obj = $("#materialApkModal .material-item.up-modal-m-i.active");
		if(obj.length == 1){
			var path = obj.find("img").attr("path");
			var imgsrc = obj.find("img").attr("src");
			var name = obj.find("img").attr("alt");
			var attrid = obj.find("img").attr("attrid");
			var packagename = obj.find("img").attr("packagename");
			var version = obj.find("img").attr("version");
			var size = obj.find("img").attr("size");
			obj.removeClass("active");
			
			curelement.attr("size",size).attr("path",path).attr("imgsrc",imgsrc).attr("packagename",packagename).attr("version",version).attr("name",name).attr("attrid",attrid);
			//更新控件元素显示
			getMaterialApk();
			//更新背景编辑区
			updateMaterialApkWrap();
			$('#materialApkModal').modal('hide');
			//随时缩略图
			sceneThumbnail();	
		}else {
			top.$.jBox.tip($.i18n.prop("progForm.pleaseThroughClickToSelectMaterial"));
		}
	});
	
	
	//增加文档元素(office)
	function addoffice(){
		total++;
		var add = $("<div id='office_"+total+"' officetype='ppt' class='office element active' title='' curimglist='' from='office_edit' style='left:0px;top:0px;z-index:"+total+";position:absolute;width:200px; height:200px;background-color:#fff'><img src='' style='width:100%;height:100%'></div>");
		draginitfn($(add));
		resizeinitfn($(add));
		curScene.append(add);
		$(add).mousedown();
		/* redo();*/
		//更新元素位置在当前可视范围内
		var top = $(".content-main-edit").scrollTop();
		add.css("top",top+"px");
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下) 	   
		sceneThumbnail();
		openmateriallibrary();
	}
	
	//替换文档(office)
	var officeReplaceFlag = false;
	$(".office_edit .office-replace").on("click",function(){
		var officeindex = parseInt($(this).attr("officeindex"));
		if(!officeReplaceFlag){
			officeReplaceFlag = true;
			materialReplaceFlag = true;
			if(!isNaN(officeindex)){
				officeReplaceNo = officeindex;
				$('#officeModal .material-item.up-modal-m-i').addClass('only-one');
				$('#officeModal').modal('show');
			}else{
				$("#addoffice").click();
			}
			officeReplaceFlag = false;
		}
	});
	
	//在当前素材之后添加素材(office)
	var officeAfterAddFlag = false;
	$(".office_edit .office-after-add").on("click",function(){
		if(!officeAfterAddFlag){
			officeAfterAddFlag = true;
			var officeindex = parseInt($(this).parents(".edit-hover").find(".img_index").html());
			if(!isNaN(officeindex)){
				officeReplaceNo = officeindex;
				$('#officeModal').modal('show');
			}else{
				$("#addoffice").click();
			}
			officeAfterAddFlag = false;
		}
	});
	
	//选择素材框-切换素材类型(office)
	$(".officetype").on("click",function(){
		var obj = $(this);
		var officetype = obj.attr("officetype");
		if($('#officeModal').attr("officetype") != officetype){
			$('#officeModal').removeClass('m-excel').removeClass('m-word').removeClass('m-pdf').removeClass('m-ppt').addClass('m-'+officetype).attr('officetype',officetype);
			$('#officeName').val('');
			hRes(parseInt($("#officeModal .m-row").attr("pagesize")),officetype);
		}
    });
	
	//图片素材选择框图片的确认图片事件(office)
	$("#officeModal .confirm").on("click",function(){		
		//判断是否有选中素材
		if($("#officeModal .material-item.up-modal-m-i.active").length == 0){
			top.$.jBox.tip($.i18n.prop("progForm.pleaseThroughClickToSelectMaterial"));
			return;
		}
		//处理缓存，保证缓存数据是当前元素数据($curImgList)
	
		updateCurImgList();

		//判断是否变更了文档类型，如果是，清空历史数据,更新文档类型
		if(curelement.attr("officetype") != $("#officeModal").attr("officetype")){
			$curImgList.length = 0;
			curelement.attr("curimglist","").attr("officetype",$("#officeModal").attr("officetype"));
			curelement.removeClass("ppt").removeClass("excel").removeClass("word").removeClass("pdf");//.addClass($("#officeModal").attr("officetype"))
		}
		
		
		//选中数据处理
		$("#officeModal .material-item.up-modal-m-i.active").each(function(){
			//console.log("准备判断是否超过20张图片");
			//不允许超过20个文档
			//if($curImgList.length >= 20){
			//	console.log("超过了20个文档");
			//	return false;
			//}
			//获取素材参数
			var obj = $(this).find(".bg-office");
			var imglist = obj.attr("imglist")
			if(imglist){
				imglist = imglist.replace(/\\/g,"/");
			}
			var src = obj.attr("src");
			if(src){
				src = src.replace(/\\/g,"/");
			}else if(officetype === "word" || officetype === "excel"){
				src = "/apm-web/static/images/program/"+officetype+"Modal-big.png";
			}else {
				var arr = imglist.split(",");
				if(arr){
					src = arr[0].substring(1);
				}
				if(!src){
					src = "/apm-web/static/images/program/"+officetype+"Modal-big.png";
				}
			}
			var name = obj.attr("alt");

			var url = obj.attr("url");
			var attrid = obj.attr("attrid");
			var note = obj.attr("note");
			var htmlurl = obj.attr("htmlurl");
			if($curImgList.length == 0){
				curelement.find("img").attr("src",src);					
			}
			var officetype = $("#officeModal").attr("officetype");
			
			if(materialReplaceFlag && officeReplaceNo && !isNaN(officeReplaceNo) && $curImgList.length > 0){
				var index = officeReplaceNo - 1;
				if((officetype == "word" || officetype == "excel")){
					$.ajax({
						url:pUrl + "/fileInfosa/download",
						async:false,
						data:{"id": attrid,"type":officetype+"_path"},
						success:function(data){
							$curImgList[index].attrid = attrid;
							$curImgList[index].name = name;
							$curImgList[index].src = src;
							$curImgList[index].url = url;
							$curImgList[index].htmlurl = data;
							$curImgList[index].note = note;
						}
					});
				}else{
					$curImgList[index].attrid = attrid;
					$curImgList[index].name = name;
					$curImgList[index].src = src;
					$curImgList[index].imglist = imglist;
					$curImgList[index].url = url;
					$curImgList[index].htmlurl = htmlurl;
					$curImgList[index].note = note;
				}
				officeReplaceNo = null;
				materialReplaceFlag = false;
			}else if(officeReplaceNo && !isNaN(officeReplaceNo)){
				if((officetype == "word" || officetype == "excel")){
					$.ajax({
						url:pUrl + "/fileInfosa/download",
						async:false,
						data:{"id": attrid,"type":officetype+"_path"},
						success:function(data){
							$curImgList.splice(officeReplaceNo,0,{"src":src,"name":name,"note":note,"url":url,"htmlurl":data,"attrid":attrid});
						}
					});
				}else{
					$curImgList.splice(officeReplaceNo,0,{"src":src,"name":name,"imglist":imglist,"url":url,"htmlurl":htmlurl,"note":note,"attrid":attrid});
				}
				officeReplaceNo++;
			}else{
				if((officetype == "word" || officetype == "excel")){
					$.ajax({
						url:pUrl + "/fileInfosa/download",
						async:false,
						data:{"id": attrid,"type":officetype+"_path"},
						success:function(data){
							$curImgList.push({"src":src,"name":name,"note":note,"url":url,"htmlurl":data,"attrid":attrid});
						}
					});
				}else{
					$curImgList.push({"src":src,"name":name,"imglist":imglist,"url":url,"htmlurl":htmlurl,"note":note,"attrid":attrid});
				}
			}
		});
		
		//数据更新到元素
		if($curImgList.length < 1){
			//该元素有素材，
			curelement.find("img").attr("src","");
			curelement.attr("curimglist","");
		}else{
			//该元素没素材
			curelement.attr("curimglist",JSON.stringify($curImgList));			
		}
		
		//更新文档数据到编辑区
		updateOfficeWrap();

		//取消选中状态
		$("#officeModal .up-modal-m-i").removeClass("active");
		$("#officeModal").modal("hide");
		//随时缩略图
		sceneThumbnail();
		sceneLong(curScene);
	});
	
	//清空素材(office)
	$(".office_edit .emptyoffice").on("click",function(){
		if(!$(this).hasClass("color-gray")){
			curelement.attr("curimglist","");
			$curImgList = [];
			//更新素材编辑区
			updateOfficeWrap();
			//随时缩略图
			sceneThumbnail();
		}
	});
	
	//删除已有素材(office)
	$(".office_item .office-del").on("click",function(){
		//处理缓存，保证缓存数据是当前元素数据($curImgList)
	
		updateCurImgList();
		var attrid = $(this).attr("attrid");
		for(var i=0,size=$curImgList.length;i<size;i++){
			if($curImgList[i].attrid == attrid){
				$curImgList.splice(i, 1);
				break;
			}
		}
		curelement.attr("curimglist",JSON.stringify($curImgList));
		//更新素材编辑区
		updateOfficeWrap();
		//更新场景时长
		sceneLong(curScene);
		//随时缩略图
		sceneThumbnail();
	});
	
	//更新文档数据到编辑区(office)
	function updateOfficeWrap(obj){
		if(!obj){
			obj = curelement;
		}
		var officetype = obj.attr("officetype");
		//处理缓存，保证缓存数据是当前元素数据($curImgList)
		console.log("updateOfficeWrap");
		updateCurImgList();
		//更新编辑区
		var size = $curImgList.length;
		if(size>0){
			//删除添加提醒和历史内容
			$(".office_edit .office_wrap").html("");
			//当前元素src
			var osrc = curelement.find("img").attr("src");
			//插入数据到编辑区
			for(var i=0;i<size;i++){
				var src = $curImgList[i].src;
				var icoImg = null;
				if(src){
					icoImg = src;
				}else{
					icoImg = "/apm-web/static/images/program/"+officetype+"Modal-big.png";
				}
				var officeindex = (i+1);
				//$(".office_edit .office_wrap").append("<div class='office_item'                                            ><div class='office_item_front'><span class='img_index'>"+officeindex+"</span></div><div class='office_item_back'><img class='img-ico' src='"+icoImg+"' alt='"+$curImgList[i].name+"' attrid='"+$curImgList[i].attrid+"'></img>							  <div class='office_item_name ellipsis' title='"+$curImgList[i].name+"'>"+$curImgList[i].name+"</div><div class='img-ratio' title='"+$curImgList[i].name+"'         ></div><div class='pull-right btnu office-del' attrid='"+$curImgList[i].attrid+"'>"+$.i18n.prop("roleList.delete")+"</div></div></div>");
				$(".office_edit .office_wrap").append("<div class='office_item edit_drag_item edit-hover' dragtype='office'><div class='office_item_front'><span class='img_index'>"+officeindex+"</span></div><div class='office_item_back'><img class='img-ico' src='"+icoImg+"' alt='"+$curImgList[i].name+"' attrid='"+$curImgList[i].attrid+"'></img><div class='info_item_line'><div class='office_item_name ellipsis' title='"+$curImgList[i].name+"'>"+$curImgList[i].name+"</div><div class='img-ratio ellipsis' title='"+$curImgList[i].name+"'></div><div class='edit-handle edit-add office-after-add' title='"+$.i18n.prop("progFrom.add")+"'></div><div class='edit-handle edit-replace office-replace' officeindex='"+officeindex+"' title='"+$.i18n.prop("progFrom.replace")+"'></div><div class='edit-handle edit-del office-del' attrid='"+$curImgList[i].attrid+"' title='"+$.i18n.prop("progFrom.delete")+"'></div></div></div></div>");

				if(i < 1){
					if(osrc != src){
						curelement.find("img").attr("src",src);
						osrc = src;
					}
				}else{
					if(!osrc || osrc == ""){
						curelement.find("img").attr("src",src);
					}
				}
			}
			//清空功能开启
			$(".office_edit .emptyoffice").removeClass("color-gray");
		}else{
			curelement.find("img").removeAttr("src");
			//增加添加提醒
			$(".office_edit .office_wrap").html("");
			//.append("<div class='tip-add'><div class='tip-add-img'></div><div class='tip-add-text'>"+$.i18n.prop("progForm.addDocInfo")+"</div></div>");
			//清空功能关闭
			$(".office_edit .emptyoffice").addClass("color-gray");
		}
		prev = curelement;
		updateShowSize();
	}
	
	//增加信号源元素(port)
	function addport(){
		//判断如果是竖屏不允许添加信号源
		if(isVerticalTip()){
			return;
		}
		if(!isHasVsAndTip()){
			return;
		}
		total++;
		var add = $("<div id='port_"+total+"' class='element active port' title=''  from='port_edit' porttype='1' style='top:0px;left:0px;display:block;width:200px;height:200px;position: absolute;z-index:"+total+";' ><img src='' style='width:100%;height:100%'></div>");
		draginitfn($(add));
		resizeinitfn($(add));
        curScene.append(add);
        $(add).mousedown();
		//更新元素位置在当前可视范围内
		var top = $(".content-main-edit").scrollTop();
		add.css("top",top+"px");
		//更新信号源编辑区
		updatePortWrap();
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下)
		sceneThumbnail();
		//openmateriallibrary();
	}
	
	//刷新信号源编辑区(port)
	function updatePortWrap(obj){
		if(!obj){
			obj = curelement;
		}
		var portType = obj.attr("porttype");
		$(".port_edit .port_row .radio_icon").removeClass("selected");
		$(".port_edit .port_row .radio_icon[type='"+portType+"']").addClass("selected");
		updateShowSize();
	}
	
	//增加混播元素(mixed)
	function addmixed(){
		total++;
		var add = $("<div id='mixed_"+total+"' class='element active mixed' title='' curimglist='' from='mixed_edit' style='top:0px;left:0px;display:block;width:200px;height:200px;position: absolute;z-index:"+total+";' ><img src='' style='width:100%;height:100%'></div>");
		draginitfn($(add));
		resizeinitfn($(add));
        curScene.append(add);
        $(add).mousedown();
		//更新元素位置在当前可视范围内
		var top = $(".content-main-edit").scrollTop();
		add.css("top",top+"px");
		//$curImgList.push({"src":"/apm-web/apm_file/img_path/590828343260f2a70c33814ec69b18f8.png","name":"7972b705-ddc1-c028-24fc-1d107d60297a.png","attrid":"47a06a287131fac0a811c"});
		//$curImgList.push({"src":"/apm-web/apm_file/img_path/ea85025693ab162a19588f55dff7bbaf.png","name":"c0e85c55-1f98-3cb7-2953-845e9fc2d5c6.png","attrid":"47a06a287135afc0a811c"});
		//$curImgList.push({"src":"/apm-web/apm_file/img_path/f57e25f939d592ef15813df199b3a545.png","name":"8bc1e28b-802c-593b-9c9d-5202f3f2148b.png","attrid":"47a06a28713194c0a811c"});
		//$curImgList.push({"src":src,"name":name,"attrid":attrid});
		//add.attr("curimglist",JSON.stringify($curImgList));
		//更新混播编辑区
		updateMixedWrap();
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下)
		sceneThumbnail();
		openmateriallibrary();
	}
	
	//根据编辑区素材设置当前元素的素材属性--用于拖拽(mixed)
	var setCurMixedByEdit = function(drag,drop){
		$curImgList = [];
		curelement.attr("curimglist","");
		if($(".mixed_edit .mixed_item").length > 0){
			$(".mixed_edit .mixed_item").each(function(){
				var obj = $(this);
				var mixed = null;
				if(obj.hasClass("mixed_img")){
					var img = obj.find("img");
					mixed = {"type":"img","src":img.attr("src"),"name":img.attr("alt"),"attrid":img.attr("attrid"),"long":img.attr("long")};
				}else if(obj.hasClass("mixed_video")){
					var img = obj.find("img");
					mixed = {"type":"video","src":img.attr("src"),"name":img.attr("alt"),"source":img.attr("source"),"long":img.attr("long"),"attrid":img.attr("attrid")};
				}else if(obj.hasClass("mixed_streamMedia")){
					var img = obj.find("img");
					mixed = {"type":"streamMedia","source":img.attr("source"),"name":img.attr("alt"),"attrid":img.attr("attrid"),"long":img.attr("long")};
				}else if(obj.hasClass("mixed_webpage")){
					var img = obj.find("img");
					mixed = {"type":"webpage","source":img.attr("source"),"name":img.attr("alt"),"attrid":img.attr("attrid"),"long":img.attr("long")};
				}
				if(mixed){
					obj.find(".mixed_item_front .img_index").text(obj.index()+1);
					$curImgList.push(mixed);
				}
			});
			curelement.attr("curimglist",JSON.stringify($curImgList));
		}
		//更新编辑区
		updateMixedWrap();
		//随时缩略图
		sceneThumbnail();
	};
	//把回调方法放到回调方法对象中
	editorAreaDragCallbackMethod["mixed"] = setCurMixedByEdit;
	
	//是否允许选择视频素材页和流媒体页(mixed)
	function mixedNotAllowPage(){
		var element = isHasVs(curelement);
		if(element){
			var mtypedivs = $(".material-type-line .material-type-div[type='video'],.material-type-div[type='streamMedia']");
			mtypedivs.addClass("color-gray");
			//判断如果当前素材页是视频或流媒体，自动切换到图片
			mtypedivs.each(function(){
				var obj = $(this);
				if(obj.hasClass("active")){
					$("#mixedModal .material-right").html("");
					setTimeout(function(){
						$(".material-type-line .material-type-div[type='img']").click();
					},300);
					return false;
				}
			});
		}else{
			$(".material-type-line").find(".material-type-div[type='video'],.material-type-div[type='streamMedia']").removeClass("color-gray");
		}
	}
	
	//视频对象生成混播编辑区项(mixed)
	function videoMixedHtml(obj,index){
		//var obj = {"type":type,"src":src,"name":name,"source":source,"long":long,"attrid":attrid};
		var html = "<div class='mixed_item edit_drag_item edit-hover mixed_video' dragtype='mixed' min='1'>" +
						"<div class='mixed_item_front'>" +
							"<span class='img_index'>"+index+"</span>" +
						"</div>" +
						"<div class='mixed_item_back'>" +
							"<img class='img-ico' src='"+obj.src+"' alt='"+obj.name+"' attrid='"+obj.attrid+"' source='"+obj.source+"' long='"+obj.long+"'></img>" +
							"<div class='info_item_line'>" +
								"<div class='mixed_item_name ellipsis' title=''>"+obj.name+"</div>" +
								"<div class='mixed_item_time mixed_edit_time ellipsis'>"+formatSeconds(obj.long)+"</div>" +
								"<div class='mixed_edit_time_div hide'>"+
									"<span class='mixed_edit_time_span'>"+
					    				"<input type='text' class='hour' maxlength='2' value='00'>"+
					    				"<span class='colon'>:</span>"+
					    				"<input type='text' class='minute' maxlength='2' value='00'>"+
					    				"<span class='colon'>:</span>"+
					    				"<input type='text' class='second' maxlength='2' value='00'>"+   
					    			"</span>"+
					    		"</div>"+
								"<div class='edit-handle edit-alter' title='"+$.i18n.prop("progFrom.edit")+"'></div>" +
								"<div class='edit-handle edit-add mixed-after-add' title='"+$.i18n.prop("progFrom.add")+"'></div>" +
								"<div class='edit-handle edit-replace mixed-replace' mixedindex='"+index+"' title='"+$.i18n.prop("progFrom.replace")+"'></div>" +
								"<div class='edit-handle edit-del mixed-del' attrid='"+obj.attrid+"' title='"+$.i18n.prop("progFrom.delete")+"'></div>" +
							"</div>" +
						"</div>" +
					"</div>";
		return html;
	}
	
	//图片对象生成混播编辑区项(mixed)
	function imgMixedHtml(obj,index){
		//var obj = {"type":type,"src":src,"name":name,"attrid":attrid,"long":long};
		var html = "<div class='mixed_item edit_drag_item edit-hover mixed_img' dragtype='mixed' min='3'>" +
						"<div class='mixed_item_front'>" +
							"<span class='img_index'>"+index+"</span>" +
						"</div>" +
						"<div class='mixed_item_back'>" +
							"<img class='img-ico' src='"+obj.src+"' alt='"+obj.name+"' attrid='"+obj.attrid+"' long='"+obj.long+"'></img>" +
							"<div class='info_item_line'>" +
							"<div class='mixed_item_name ellipsis' title=''>"+obj.name+"</div>" +
								"<div class='mixed_item_ratio ellipsis'></div>" +
								"<div class='mixed_item_ratio_time mixed_edit_time ellipsis'>"+formatSeconds(obj.long)+"</div>" +
								"<div class='mixed_edit_time_div hide'>"+
									"<span class='mixed_edit_time_span'>"+
						    			"<input type='text' class='hour' maxlength='2' value='00'>"+
						    			"<span class='colon'>:</span>"+
						    			"<input type='text' class='minute' maxlength='2' value='00'>"+
						    			"<span class='colon'>:</span>"+
						    			"<input type='text' class='second' maxlength='2' value='00'>"+   
						    			"</span>"+
						    	"</div>"+
								"<div class='edit-handle edit-alter' title='"+$.i18n.prop("progFrom.edit")+"'></div>" +
								"<div class='edit-handle edit-add mixed-after-add' title='"+$.i18n.prop("progFrom.add")+"'></div>" +
								"<div class='edit-handle edit-replace mixed-replace' mixedindex='"+index+"' title='"+$.i18n.prop("progFrom.replace")+"'></div>" +
								"<div class='edit-handle edit-del mixed-del' attrid='"+obj.attrid+"' title='"+$.i18n.prop("progFrom.delete")+"'></div>" +
							"</div>" +
						"</div>" +
					"</div>";
		return html;
	}
	
	//网页对象生成混播编辑区项(mixed)
	function webpageMixedHtml(obj,index){
		//var obj = {"type":type,"source":source,"name":name,"attrid":attrid,"long":long};
		var src = "/apm-web/static/images/program/webpageModal-big.png";//网页图片
		var html = "<div class='mixed_item edit_drag_item edit-hover mixed_webpage' dragtype='mixed' min='1'>" +
						"<div class='mixed_item_front'>" +
							"<span class='img_index'>"+index+"</span>" +
						"</div>" +
						"<div class='mixed_item_back'>" +
							"<img class='img-ico' src='"+src+"' alt='"+obj.name+"' source='"+obj.source+"' attrid='"+obj.attrid+"' long='"+obj.long+"'></img>" +
							"<div class='info_item_line'>" +
							"<div class='mixed_item_name ellipsis' title=''>"+obj.name+"</div>" +
								"<div class='mixed_item_time mixed_edit_time ellipsis'>"+formatSeconds(obj.long)+"</div>" +
								"<div class='mixed_edit_time_div hide'>"+
									"<span class='mixed_edit_time_span'>"+
							    		"<input type='text' class='hour' maxlength='2' value='00'>"+
							    		"<span class='colon'>:</span>"+
							    		"<input type='text' class='minute' maxlength='2' value='00'>"+
							    		"<span class='colon'>:</span>"+
							    		"<input type='text' class='second' maxlength='2' value='00'>"+   
							    	"</span>"+
						    	"</div>"+
								"<div class='edit-handle edit-alter' title='"+$.i18n.prop("progFrom.edit")+"'></div>" +
								"<div class='edit-handle edit-add mixed-after-add' title='"+$.i18n.prop("progFrom.add")+"'></div>" +
								"<div class='edit-handle edit-replace mixed-replace' mixedindex='"+index+"' title='"+$.i18n.prop("progFrom.replace")+"'></div>" +
								"<div class='edit-handle edit-del mixed-del' attrid='"+obj.attrid+"' title='"+$.i18n.prop("progFrom.delete")+"'></div>" +
							"</div>" +
						"</div>" +
					"</div>";
		return html;
	}
	
	//流媒体对象生成混播编辑区项(mixed)
	function streamMixedHtml(obj,index){
		//var obj = {"type":type,"source":source,"name":name,"attrid":attrid,"long":long};
		var src = "/apm-web/static/images/program/streamMedia-big.png";//流媒体图片
		var html = "<div class='mixed_item edit_drag_item edit-hover mixed_streamMedia' dragtype='mixed' min='1'>" +
					"<div class='mixed_item_front'>" +
						"<span class='img_index'>"+index+"</span>" +
					"</div>" +
					"<div class='mixed_item_back'>" +
						"<img class='img-ico' src='"+src+"' alt='"+obj.name+"' source='"+obj.source+"' attrid='"+obj.attrid+"' long='"+obj.long+"'></img>" +
						"<div class='info_item_line'>" +
						"<div class='mixed_item_name ellipsis' title=''>"+obj.name+"</div>" +
							"<div class='mixed_item_time mixed_edit_time ellipsis'>"+formatSeconds(obj.long)+"</div>" +
							"<div class='mixed_edit_time_div hide'>"+
								"<span class='mixed_edit_time_span'>"+
						    		"<input type='text' class='hour' maxlength='2' value='00'>"+
						    		"<span class='colon'>:</span>"+
						    		"<input type='text' class='minute' maxlength='2' value='00'>"+
						    		"<span class='colon'>:</span>"+
						    		"<input type='text' class='second' maxlength='2' value='00'>"+   
						    	"</span>"+
					    	"</div>"+
							"<div class='edit-handle edit-alter' title='"+$.i18n.prop("progFrom.edit")+"'></div>" +
							"<div class='edit-handle edit-add mixed-after-add' title='"+$.i18n.prop("progFrom.add")+"'></div>" +
							"<div class='edit-handle edit-replace mixed-replace' mixedindex='"+index+"' title='"+$.i18n.prop("progFrom.replace")+"'></div>" +
							"<div class='edit-handle edit-del mixed-del' attrid='"+obj.attrid+"' title='"+$.i18n.prop("progFrom.delete")+"'></div>" +
						"</div>" +
					"</div>" +
				"</div>";
		return html;
	}
	
	//上传混播素材(mixed)
	$("#mixedUpload").on("click",function(){
		var modal = $(this).parents(".material-modal");
		var typeDiv = modal.find(".material-type-line .switch-material-type.active");
		if(typeDiv.length > 0){
			var type = typeDiv.attr("type");
			if(type === "img"){
				$("#imgUpload .webuploader-element-invisible").click();
			}else if(type === "video"){
				$("#videoUpload .webuploader-element-invisible").click();
			}else if(type === "streamMedia"){
				$("#streamMediaNew").click();
			}else if(type === "webpage"){
				$("#webpageNew").click();
			}
		}
	});
	
	//更新混播编辑区(mixed)
	function updateMixedWrap(obj){
		if(!obj){
			obj = curelement;
		}
		//处理缓存，保证缓存数据是当前元素数据($curImgList)
	
		updateCurImgList();
		//更新编辑区
		var size = $curImgList.length;
		if(size>0){
			//删除添加提醒和历史内容
			$(".mixed_edit").find(".mixed_wrap").html("");
			//当前元素src
			var osrc = obj.find("img").attr("src");
			//插入数据到编辑区
			for(var i=0;i<size;i++){
/*				if(!$curImgList[i]){
					continue;
				}*/
				var type = $curImgList[i].type;
				var src = null;
				//视频编辑项
				var mixedindex = (i+1);
				if(type === "img"){
					src = $curImgList[i].src;
					$(".mixed_edit .mixed_wrap").append(imgMixedHtml($curImgList[i],mixedindex));
					//更新图片分辨率
					updateImgRatio(src,function(imgWidth,imgHeight,aid){
						$(".mixed_edit .mixed_wrap .img-ico[attrid='"+aid+"']").parent().find(".mixed_item_ratio").text(imgWidth+"x"+imgHeight);
						//删除功能开启
						//$(".img_edit .img-del").show();
					},$curImgList[i].attrid);
				}else if(type === "streamMedia"){
					src = "/apm-web/static/images/program/streamMedia-big.png";
					$(".mixed_edit .mixed_wrap").append(streamMixedHtml($curImgList[i],mixedindex));
				}else if(type === "webpage"){
					src = "/apm-web/static/images/program/webpageModal-big.png";
					$(".mixed_edit .mixed_wrap").append(webpageMixedHtml($curImgList[i],mixedindex));
				}else if(type === "video"){
					src = $curImgList[i].src;
					$(".mixed_edit .mixed_wrap").append(videoMixedHtml($curImgList[i],mixedindex));
				}

				//当前元素显示第一张缩略图
				if(i < 1){
					if(osrc != src){
						obj.find("img").attr("src",src);
						osrc = src;
					}
				}else{
					if(!osrc || osrc == ""){
						obj.find("img").attr("src",src);
					}
				}

			}
			//清空功能开启
			$(".mixed_edit .emptymixed").removeClass("color-gray");
		}else{
			obj.find("img").removeAttr("src");
			//增加添加提醒
			$(".mixed_edit .mixed_wrap").html("");
			//.append("<div class='tip-add'><div class='tip-add-img'></div><div class='tip-add-text'>"+$.i18n.prop("progForm.addVideoInfo")+"</div></div>");
			//清空功能关闭
			$(".mixed_edit .emptymixed").addClass("color-gray");
		}
		prev = obj;
		updateShowSize();
	}
	
	//显示素材选中数量(mixed)
	function showMaterialSelectNum(){
		var typeNum = statisticsMaterialActice();
		if(typeNum){
			for(var type in typeNum){
				var obj = $(".material-modal:visible .material-type-line .material-select-num[type='"+type+"']");
				if(obj.length > 0){
					var num = parseInt(typeNum[type]);
					if(!isNaN(num) && num > 0){
						obj.html(num).removeClass("hide");
					}else{
						obj.html("").addClass("hide");
					}
				}
			}
		}
	}
	
	//记录选中的素材对象(公用)
	function materialSelectSave(type,obj){
		if(obj && obj.length > 0){
			if(!materialSelected){
				materialSelected = {};
			}
			if(!type){
				type = obj.parents(".material-mainer").attr("type");
				if(!type){
					var modalId = obj.parents(".material-modal").attr("id");
					if(modalId === "imgModal"){
						type = "img";
					}else if(modalId === "streamMediaModal"){
						type = "streamMedia";
					}else if(modalId === "webpageModal"){
						type = "webpage";
					}else if(modalId === "videoModal"){
						type = "video";
					}
				}
			}
			var material = null;
			if(type === "img"){
				material = imgSelected(obj);
			}else if(type === "streamMedia"){
				material = streamMediaSelected(obj);
			}else if(type === "webpage"){
				material = webpageSelected(obj);
			}else if(type === "video"){
				material = videoSelected(obj);
			}
			if(material){
				var attrid = material.attrid;
				if(attrid){
					var typeObj = materialSelected[type];
					if(!typeObj){
						typeObj = {};
						materialSelected[type] = typeObj;
					}
					materialSelected[type][attrid] = material;
				}
			}
		}
	}
	
	//根据传入type清除选中的素材对象记录，不传type全清空,传obj代表清除该素材对象(公用)
	function clearMaterialSelectSave(type,obj){
		if(!type && obj){
			type = obj.parents(".material-mainer").attr("type");
		}
		if(!type){
			materialSelected = null;
		}else if(materialSelected){
			if(obj){
				var attrid = obj.find("img").attr("attrid");
				var typeObj = materialSelected[type];
				if(typeObj){
					materialSelected[type][attrid] = undefined;
				}
			}else{
				materialSelected[type] = {};
			}
		}
	}
	
	//混播素材编辑时间失去焦点，保存更改值(mixed)
	//$(".mixed_edit .mixed_edit_time_div").on("blur",function(event){
		$(document).on("blur",".mixed_edit .mixed_edit_time_div",function(event){
		var relatedTarget = event.relatedTarget;
		var obj = $(this);
		var h = parseInt(obj.find("input.hour").val());
		var m = parseInt(obj.find("input.minute").val());
		var s = parseInt(obj.find("input.second").val());
		if(!isNaN(h) && h > 23){
			h = 23;
			obj.find(".hour").val(h);
		}
		if(!isNaN(m) && m > 59){
			m = 59;
			obj.find(".minute").val(m);
		}
		if(!isNaN(s) && s > 59){
			s = 59;
			obj.find(".second").val(s);
		}
		if(!relatedTarget||$(relatedTarget).parents(".mixed_edit_time_div").length == 0){
			var parent = obj.parents(".mixed_item");
			var oldobj = parent.find("img");
			var mixed_edit_time = obj.siblings(".mixed_edit_time");
			var index = parseInt(parent.find(".img_index").html()) - 1;
			if(mixed_edit_time.hasClass("hide")){
				if(isNaN(h)||isNaN(m)||isNaN(s)){
					//输入不合法还原历史数据
					var long = $curImgList[index].long;
					var hmsStr = formatSeconds(long);
					var hms = hmsStr.split(":");
					obj.find(".hour").val(hms[0]);
					obj.find(".minute").val(hms[1]);
					obj.find(".second").val(hms[2]);
				}else{
					//输入少于最小值，使用最小值
					var min = parseInt(parent.attr("min"));
					if(isNaN(min)){
						min = 1;
					}
					var newlong = ((h*60)+m)*60+s;
					if(newlong < min){
						newlong = min;
					}
				
					updateCurImgList();
					$curImgList[index].long = newlong;
					curelement.attr("curimglist",JSON.stringify($curImgList));
					mixed_edit_time.html(formatSeconds(newlong));
					oldobj.attr("long",newlong);
					obj.addClass("hide");
					mixed_edit_time.removeClass("hide");
					sceneLong(curScene);
				}
			}
		}
	});
	
	//混播素材编辑(mixed)
	$(".mixed_edit .edit-alter").on("click",function(){
		var parent = $(this).parents(".mixed_item");
		var obj = parent.find("img");
		var mixed_edit_time = parent.find(".mixed_edit_time");
		if(!mixed_edit_time.hasClass("hide")){
			var long = obj.attr("long");
			var hmsStr = formatSeconds(long);
			var hms = hmsStr.split(":");
			var mixed_edit_time_div = parent.find(".mixed_edit_time_div");
			mixed_edit_time.addClass("hide");
			mixed_edit_time_div.removeClass("hide");
			mixed_edit_time_div.find(".hour").val(hms[0]);
			mixed_edit_time_div.find(".minute").val(hms[1]);
			mixed_edit_time_div.find(".second").val(hms[2]).focus();
		}
	});
	
	//混播素材库换素材类型(mixed)
	var mixedSwitchMaterialTypeFlag = false;
	$(".switch-material-type").on("click",function(){
		if(!mixedSwitchMaterialTypeFlag){
			mixedSwitchMaterialTypeFlag = true;
			var obj = $(this);
			if(obj.hasClass("color-gray")){
				top.$.jBox.tip($.i18n.prop("progForm.dontSupportUsingMultiChannelVideo"));
				mixedSwitchMaterialTypeFlag = false;
			}else{
				obj.addClass("active").siblings().removeClass("active");
				var type = obj.attr("type");
				var pageSize = obj.attr("pageSize");
				$(".material-modal:visible .search-btn").attr("type",type).attr("pageSize",pageSize).click();
				setTimeout(function(){
					mixedSwitchMaterialTypeFlag = false;
				},500);
			}
		}
	});
	
	//删除已有素材(mixed)
	$(".mixed_edit .mixed-del").on("click",function(){
		//处理缓存，保证缓存数据是当前元素数据($curImgList)
		updateCurImgList();
		var attrid = $(this).attr("attrid");
		for(var i=0,size=$curImgList.length;i<size;i++){
			if($curImgList[i].attrid == attrid){
				$curImgList.splice(i, 1);
				break;
			}
		}
		
		curelement.attr("curimglist",JSON.stringify($curImgList));
		//更新编辑区
		updateMixedWrap();
		//更新场景时长
		sceneLong(curScene);
		//随时缩略图
		sceneThumbnail();
	});
	
	//替换混播素材(mixed)
	var mixedReplaceFlag = false;
	$(".mixed_edit .mixed-replace").on("click",function(){
		var mixedindex = parseInt($(this).attr("mixedindex"));
		if(!mixedReplaceFlag){
			mixedReplaceFlag = true;
			materialReplaceFlag = true;
			if(!isNaN(mixedindex)){
				mixedReplaceNo = mixedindex;
				//$('#mixedModal .material-item.up-modal-m-i').addClass('only-one');
				mixedNotAllowPage();
				$('#mixedModal').modal('show');
			}else{
				$("#addmixed").click();
			}
			mixedReplaceFlag = false;
		}
	});
	
	//在当前素材之后添加素材(mixed)
	var mixedAfterAddFlag = false;
	$(".mixed_edit .mixed-after-add").on("click",function(){
		if(!mixedAfterAddFlag){
			mixedAfterAddFlag = true;
			var mixedindex = parseInt($(this).parents(".edit-hover").find(".img_index").html());
			if(!isNaN(mixedindex)){
				mixedReplaceNo = mixedindex;
				mixedNotAllowPage();
				$('#mixedModal').modal('show');
			}else{
				$("#addmixed").click();
			}
			mixedAfterAddFlag = false;
		}
	});
	
	//清空混播素材(mixed)
	$(".mixed_edit .emptymixed").on("click",function(){
		if(!$(this).hasClass("color-gray")){
			curelement.attr("curimglist","");
			$curImgList = [];
			//更新混播编辑区
			updateMixedWrap();
			//更新场景时长
			sceneLong(curScene);
			//随时缩略图
			sceneThumbnail();
		}
	});
	
	//添加混播素材前,清理选中素材记录
	$("#addmixed").on("click",function(){
		mixedNotAllowPage();
		clearMaterialSelectSave();
		$("#mixedModal").find(".material-item.up-modal-m-i.active").removeClass("active");
		$("#mixedModal").find(".material-select-num").addClass("hide");
	});
	
	//统计各素材类型选中数量(mixed)
	function statisticsMaterialActice(){
		var typeNum = {};
		if(materialSelected){
			for(var type in materialSelected){
				var typeObj = materialSelected[type];
				if(typeObj){
					typeNum[type] = 0;
					for(var attrid in typeObj){
						if(typeObj[attrid]){
							typeNum[type] += 1;
						}
					}
				}
			}
		}
		return typeNum;
	}
	
	//确认添加选中素材到混播控件中(mixed)
	$("#mixedModal").find(".confirm").on("click",function(){
		//判断是否有选中素材
		if(!materialSelected){
			top.$.jBox.tip($.i18n.prop("progForm.pleaseThroughClickToSelectMaterial"));
			return;
		}
		//处理缓存，保证缓存数据是当前元素数据($curImgList)
		updateCurImgList();
		//遍历选中记录
		for(var type in materialSelected){
			var typeObj = materialSelected[type];
			for(var attrid in typeObj){
				var material = typeObj[attrid];
				if(materialReplaceFlag && mixedReplaceNo && !isNaN(mixedReplaceNo) && $curImgList.length > 0){
					var index = mixedReplaceNo - 1;
					$curImgList[index] = material;
					mixedReplaceNo = null;
					materialReplaceFlag = false;
				}else if(mixedReplaceNo && !isNaN(mixedReplaceNo)){
					$curImgList.splice(mixedReplaceNo,0,material);
					mixedReplaceNo++;
				}else if(material){
					$curImgList.push(material);
				}
			}
		}
		
		if($curImgList.length < 1){
			curelement.attr("curimglist","");
		}else{
			curelement.attr("curimglist",JSON.stringify($curImgList));
		}
		
		//清空选中记录
		clearMaterialSelectSave();
		
		//隐藏和取消已选中样式
		$("#mixedModal").find(".material-item.up-modal-m-i.active").removeClass("active");
		$("#mixedModal").find(".material-select-num").addClass("hide");
		$("#mixedModal").modal("hide");

		//更新混播编辑区
		updateMixedWrap();
		sceneLong(curScene);
		//随时缩略图
		sceneThumbnail();
	});	
	
	//增加网页元素(webpage)
	function addwebpage() {
		total++;
		var curScene = $("#topfd1");
		var add = $("<div id='webpage_"+total+"' class='element active webpage' title='' curimglist='' from='webpage_edit' style='top:0px;left:0px;display:block;width:200px;height:200px;position: absolute;z-index:"+total+";' ><img src='' style='width:100%;height:100%'></div>");
		draginitfn($(add));
		resizeinitfn($(add));
        curScene.append(add);
        $(add).mousedown();
        /* redo();*/
		//更新网页编辑区
		//updateImgWrap();
		//更新元素位置在当前可视范围内
		var top = $(".content-main-edit").scrollTop();
		add.css("top",top+"px");
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下)
		sceneThumbnail();
		openmateriallibrary();
	}
	
	//检测是否有填名字(webpage)
	//$(".webpagebox-input-name").live("input propertychange",function(){
		$(document).on("input propertychange",".webpagebox-input-name",function(){
		$(this).parent().find(".hint-red").remove();
		if($(this).val().length<1){
			$(this).parent().append("<div class='webpagebox-hint hint-red'>"+$.i18n.prop("resWebPage.pleaseInputPageName")+"</div>");
		}
	});
	
	//增加网页元素(webpage)
	$(".webpageboxconfirm").on("click",function(){
		var flag = true;
		var inputDiv = $(".webpagebox-input-div");
		if(inputDiv.find(".hint-red,.hint-blue").length < 1){
			if($(".webpagebox .http-detection").hasClass("color-gray")){
				inputDiv.append("<div class='webpagebox-hint hint-red'>"+$.i18n.prop("progForm.pleaseCheckWebPage")+"</div>");
			}else{
				httpdetectionAutoAffirm = true;
				$(".webpagebox .http-detection").click();
			}
			flag = false;
		}
		var inputNameDiv = $(".webpagebox-input-name");
		if(inputNameDiv.val().length<1){
			inputNameDiv.parent().find(".hint-red").remove();
			inputNameDiv.parent().append("<div class='webpagebox-hint hint-red'>"+$.i18n.prop("resWebPage.pleaseInputPageName")+"</div>");
			flag = false;
		}
		if(flag && curelement != null && inputDiv.find(".hint-blue").length == 1){
			var input = $(".webpagebox-input").val();
			if(input.indexOf("http://") < 0){
				input = "http://"+input;
			}
			var inputName = inputNameDiv.val();
			
			//保存网页数据到数据库
			$.ajax({
				url:"/apm-web/a/webpage/ajaxNewWebpage",
				dataType:"text",
				data:{"path":input,"name":inputName},
				async:false,
				success:function(data){
					if(data != "fail"){
						var mrow = $(".material-modal.cur-modal .m-row");
						 if(mrow.length == 0){
							 var materialRight = $(".material-modal.cur-modal").find(".material-right.pull-right");
							 materialRight.prepend("<div class='material-mainer'><div class='m-row' pagesize='12'>").find(".notFoundData").remove();
							 mrow = materialRight.find(".m-row");
						 }
						var divHtml = "<div class='material-item up-modal-m-i only-one'>"+
			       	  	"<div class='thumbnail'>"+
			       	  		"<div class='thumbnail-upload'>"+
								 "<img class='bgimg' src='/apm-web/static/images/program/webpageModal.png' source='"+input+"' alt='"+inputName+"' attrid='"+data+"'>"+
							"</div>"+
					    "</div>"+
					    "<div class='caption'>"+
							"<h3 class='ellipsis' data-toggle='tooltip' data-placement='right' title='"+inputName+"'>"+inputName+"</h3>"+			        
					    "</div>"+
					    "<div class='material-check'></div>"+
					   "</div>";
						mrow.prepend(divHtml);
						//已上传的图片显示超过当页数量的隐藏掉
						if(mrow.find(".material-item:visible").length>parseInt(mrow.attr("pagesize"))){
							mrow.find(".material-item.up-modal-m-i:visible:last").hide();
						}
					}else{
						top.$.jBox.tip($.i18n.prop("progForm.createWebpageMaterialFail"),'warning');
					}
				},error:function(){
					top.$.jBox.tip($.i18n.prop("progPublishSet.connectException"),'warning');
				}
			});

			$("#contextmenu-mask").remove();
			$(".webpagebox").remove();
			$(".material-modal.cur-modal").removeClass("cur-modal").modal("show");
		}
	});
	
	//移除网页(webpage)
	$(".webpage_edit .delwebpage").on("click",function(){
		curelement.removeAttr("source").removeAttr("name").removeAttr("attrid");
		updateWebpageWrap();
	});
	
	//更新网页编辑区(webpage)
	function updateWebpageWrap(obj){
		if(!obj){
			obj = curelement;
		}
		var source = obj.attr("source");
		var webpageWrap = $(".webpage_edit .webpage_wrap");
		if(source && source.length > 0){
			$(".webpage_edit .add-item-hl").hide();
			webpageWrap.find(".webpage_img_item_name").html(obj.attr("name")).attr("title",obj.attr("name"));
			webpageWrap.find(".webpage_img_item_url").html(obj.attr("source"));
			webpageWrap.find(".webpage_img_item_img").attr("attrid",obj.attr("attrid"));			
			webpageWrap.show();
			//移除功能开启
			$(".webpage_edit .delwebpage").removeClass("color-gray");
		}else{
			//增加添加提醒
			webpageWrap.hide();
			//.append("<div class='tip-add'><div class='tip-add-img'></div><div class='tip-add-text'>"+$.i18n.prop("progForm.addWebpageInfo")+"</div></div>");
			$(".webpage_edit .add-item-hl").show();
			//移除功能关闭
			$(".webpage_edit .delwebpage").addClass("color-gray");
		}
		updateShowSize();
	}
	
	//记录网页对象(webpage)
	function webpageSelected(selectObj){
		var obj = selectObj.find("img");
		var source = obj.attr("source");
		var name = obj.attr("alt");
		var attrid = obj.attr("attrid");
		var long = 30;
		var type = "webpage";
		return {"type":type,"source":source,"name":name,"attrid":attrid,"long":long};
	}
	
	//确认添加选中网页到网页控件中(webpage)
	$("#webpageModal").find(".confirm").on("click",function(){
		//判断是否有选中素材
		if($("#webpageModal .up-modal-m-i.active").length == 0){
			top.$.jBox.tip($.i18n.prop("progForm.pleaseThroughClickToSelectMaterial"));
			return;
		}
		//设置视频数据到元素中
		var webpageimg = $("#webpageModal").find(".up-modal-m-i.active img");
		curelement.attr("source",webpageimg.attr("source")).attr("name",webpageimg.attr("alt")).attr("attrid",webpageimg.attr("attrid"));
		
		//隐藏和取消已选中样式
		webpageimg.parent().removeClass("active");
		$("#webpageModal").modal("hide");

		//更新网页编辑区
		updateWebpageWrap();
		//随时缩略图
		sceneThumbnail();
	});	
	
	//倒计时时间校对设置为0秒(countdown)
	var countdowndateRevise = function(dateStr){
		if(dateStr.length < 17){
			dateStr += ":00";
		}else{
			dateStr = dateStr.substring(0,dateStr.length - 2) + "00";
		}
		return dateStr;
	}
	
	//增加倒计时元素(countdown)
	function addcountdown(){	
		total++;
		var add = $("<div id='countdown_"+total+"' class='countdown element active' title='' transparent='0' bgcolor='#FFFFFF' txtcolor='#000000' fontsize='2' from='countdown_edit' style='text-align:center;background-color:#FFF;font-size:2em;left:0px;top:0px;z-index:"+total+";position:absolute;width:555px;height:94px;'></div>");
		//默认明天作为截止时间
		var time = new Date();
		time.setDate(time.getDate()+1);
		add.attr("countdowndate",countdowndateRevise(dateStr(time)));
		//定时更新倒计时
		//var countdownscript = 
		//	"<script>" +
	 	//		"timerTasks['#countdown_"+total+"'] = setInterval(\"setcountdown('#countdown_"+total+"')\",1000);" +
	 	//	"<\/script>";
		var box = $("<div class='countdown-box'><div class='countdown-content'>"+getRTime(time.getTime())+"</div></div>");
		add.append(box);
		draginitfn($(add));
		resizeinitfn($(add));
		curScene.append(add);
		var idselect = "#countdown_"+total;
		//初始化定时器 注释掉节目制作过程中不动
		//var newInterval = setInterval(function(){setcountdown(idselect);},1000);
		//$(add).attr("interval",newInterval);
		//timerTasks["#countdown_"+total] = newInterval;
		$(add).mousedown();
		//更新元素位置在当前可视范围内
		var top = $(".content-main-edit").scrollTop();
		add.css("top",top+"px");
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下) 	
		sceneThumbnail();
	}	
	
	//刷新倒计时(countdown)
	function refreshCountdown(obj){
		if(!obj){
			obj = curelement;
		}
		if(obj.attr("countdowndate")){
			var countdowndate = obj.attr("countdowndate");
			$(".countdown_edit").find(".countdowndate").val(countdowndate.substring(0,countdowndate.length-3));
		}					
		if(obj.attr("transparent")){
			var transparenthtml = $(".countdown_edit").find(".transparent").parent().find(".dropdown-menu-sel span[val='"+obj.attr("transparent")+"']").html();
			$(".countdown_edit").find(".transparent").attr("val",obj.attr("transparent")).html(transparenthtml);
		}
		if(obj.attr("fontsize")){
			var fontsizelabel = $(".countdown_edit").find(".fontsize");
			var fontsizehtml = fontsizelabel.parent().find(".dropdown-menu-sel span[val='"+obj.attr("fontsize")+"']").html();
			$(".countdown_edit").find(".fontsize").attr("val",obj.attr("fontsize")).html(fontsizehtml);
		}
		if(obj.attr("txtcolor")){
			$(".countdown_edit").find(".txtcolor").attr("val",obj.attr("txtcolor")).css("background-color",obj.attr("txtcolor"));
		}		
		if(obj.attr("bgcolor")){
			$(".countdown_edit").find(".bgcolor").attr("val",obj.attr("bgcolor")).css("background-color",obj.attr("bgcolor"));
		}		
	}

	//编辑修改截止时间(countdown)
	$(".countdowndate").on("change",function(){
		curelement.attr("countdowndate",countdowndateRevise($(this).val()));
		//随时缩略图
		sceneThumbnail();
	});
	
	/*$("#panel").on("click","div",function(){
  alert("x");
}).find("div").addClass("x"); 　*/

	//countdowndate设置参数(countdown)
	//$(".countdown_edit").find(".fontsize").live("change",function(){
	$(".countdown_edit").on("change",".fontsize",function(){
		var item = $(this).attr("val");
		var fontsize = null;
		var width = null;
		var height = null;
		if(item == "4"){
			//特大
			fontsize = 4;
			width = 631*scale;
			height = 371*scale;
		}else if(item == "3"){
			//大
			fontsize = 3;
			width = 460*scale;
			height = 271*scale;
		}else if(item == "1"){
			//小
			fontsize = 1;
			width = 307*scale;
			height = 50*scale;
		}else{
			//中
			fontsize = 2;
			width = 555*scale;
			height = 94*scale;
		}
		//设置属性
		var curwidth = parseInt(curelement.css("width"));
		var curheight = parseInt(curelement.css("height"));
		//if(curwidth<width){
			//curelement.css("width",width+"px");
		//}
		//if(curheight<height){
			//curelement.css("height",height+"px");
		//}
		curelement.css("font-size",fontsize+"em").attr("fontsize",item);
		//随时缩略图
		sceneThumbnail();
	});
	
	//countdowndate设置参数(countdown)
	//$(".countdown_edit").find(".txtcolor").live("change",function(){
	$(".countdown_edit").on("change",".txtcolor",function(){
		curelement.attr("txtcolor",$(this).attr("val")).css("color",$(this).attr("val"));
		//随时缩略图
		sceneThumbnail();
	});
	
	//countdowndate设置参数(countdown)
	//$(".countdown_edit").find(".transparent").live("change",function(){
	$(".countdown_edit").on("change",".transparent",function(){	
		if($(this).attr("val") == "1"){
			curelement.attr("transparent","1");
			curelement.css("background-color","transparent");
		}else{
			curelement.attr("transparent","0");
			curelement.css("background-color",curelement.attr("bgcolor"));
		}
		//随时缩略图
		sceneThumbnail();
	});
	
	//countdowndate设置参数(countdown)
	//$(".countdown_edit").find(".bgcolor").live("change",function(){
	$(".countdown_edit").on("change",".bgcolor",function(){	
		curelement.attr("bgcolor",$(this).attr("val"));
		if(curelement.attr("transparent") != "1"){
			curelement.css("background-color",$(this).attr("val"));
		}
		//随时缩略图
		sceneThumbnail();
	});
	
	//配合终端视频要求现在视频最高层(video,mixed,streamMedia)
	function videotop(){
    	var mixed = curScene.find(".mixed");
    	if(mixed&&mixed.length>0){
    		curScene.append(mixed);
    		mixed.css("zIndex",total+1);
    	}
    	var video = curScene.find(".video,.streamMedia,.port");
    	if(video&&video.length>0){
    		curScene.append(video);
    		video.css("zIndex",total+2);
    	}
	}
	
	//根据编辑区素材设置当前元素的素材属性--用于拖拽(video)
	var setCurVideoByEdit = function(drag,drop){
		//视频控件
		$curImgList = [];
		curelement.attr("curimglist","");
		if($(".video_wrap").find(".video_item").length){
			$(".video_wrap .video_item .img-ico").each(function(){
				var src = $(this).attr("src");
				var name = $(this).attr("alt");
				var long = $(this).attr("long");
				var source = $(this).attr("source");
				var attrid = $(this).attr("attrid");
				$curImgList.push({"src":src,"name":name,"source":source,"long":long,"attrid":attrid});
			});
			curelement.attr("curimglist",JSON.stringify($curImgList));
		}
		//更新编辑区
		updateVideoWrap();
		//随时缩略图
		sceneThumbnail();
	};
	//把回调方法放到回调方法对象中
	editorAreaDragCallbackMethod["video"] = setCurVideoByEdit;
	
	

	
	//替换视频(video)
	var videoReplaceFlag = false;
	$(document).on("click",".video_edit .video-replace",function(){
		var videoindex = parseInt($(this).attr("videoindex"));
		if(!videoReplaceFlag){
			videoReplaceFlag = true;
			materialReplaceFlag = true;
			if(!isNaN(videoindex)){
				videoReplaceNo = videoindex;
				$('#videoModal .material-item.up-modal-m-i').addClass('only-one');
				$('#videoModal').modal('show');
			}else{
				$("#addvideo").click();
			}
			videoReplaceFlag = false;
		}
	});
	

	
	$("#videoModal").on('show.bs.modal', function() {
		layer.msg("模态组件打开");
       
    })
	
	$("#videoModal").on('hide.bs.modal', function() {
		layer.msg("模态组件关闭");
       
    })
	

	
	//在当前素材之后添加素材(video)
	var videoAfterAddFlag = false;
	$(".video_edit .video-after-add").on("click",function(){
		var videoindex = parseInt($(this).parents(".edit-hover").find(".img_index").html());
		if(!videoAfterAddFlag){
			videoAfterAddFlag = true;
			if(!isNaN(videoindex)){
				videoReplaceNo = videoindex;
				$('#videoModal .material-item.up-modal-m-i').removeClass('only-one');
				$('#videoModal').modal('show');
			}else{
				$("#addvideo").click();
			}
			videoAfterAddFlag = false;
		}
	});
	
	//记录选中的视频对象(video)
	function videoSelected(selectObj){
		var obj = selectObj.find("img");
		var src = obj.attr("src");
		var name = obj.attr("alt");
		var long = obj.attr("long");
		var source = obj.attr("source");
		var attrid = obj.attr("attrid");
		var type = "video";
		return {"type":type,"src":src,"name":name,"source":source,"long":long,"attrid":attrid};
	}
	
	//video素材的确定按钮(video)
	$("#videoModal").find(".confirm").on("click",function(){
		//判断是否有选中素材
		/*if($("#videoModal .up-modal-m-i.active").length == 0){
			//top.$.jBox.tip($.i18n.prop("progForm.pleaseThroughClickToSelectMaterial"));
			//top.$.jBox.tip("你总要选个东西呀");
			layer.tips('老大，你总要选个东西呀', '吸附元素选择器，如#id');
			return;
		}*/
		//处理缓存，保证缓存数据是当前元素数据($curImgList)
	
		updateCurImgList();

		/*var typeObj = materialSelected["video"];
		for(var attrid in typeObj){
			var material = typeObj[attrid];
			if(materialReplaceFlag && videoReplaceNo && !isNaN(videoReplaceNo) && $curImgList.length > 0){
				var index = videoReplaceNo - 1;
				$curImgList[index] = material;
				videoReplaceNo = null;
				materialReplaceFlag = false;
			}else if(videoReplaceNo && !isNaN(videoReplaceNo)){
				$curImgList.splice(videoReplaceNo,0,material);
				videoReplaceNo++;
			}else if(material){//添加
				$curImgList.push(material);
			}
		}这里是测试屏蔽的*/
		//这里模拟一个数据添加到curImglist
		var data={type: "video", src: "img1.png", name: "测试.mp4", source: "mosou.mp4", long: "101",attrid:"47a93e3ebc4a61c0a83fd"}
		$curImgList.push(data);
		
/*		//设置视频数据到元素中
		$("#videoModal").find(".up-modal-m-i").each(function(){
			if($(this).hasClass("active")){
				var src = $(this).find("img").attr("src");
				var name = $(this).find("img").attr("alt");
				var long = $(this).find("img").attr("long");
				var source = $(this).find("img").attr("source");
				var attrid = $(this).find("img").attr("attrid");
				
				if(materialReplaceFlag && videoReplaceNo && !isNaN(videoReplaceNo) && $curImgList.length > 0){
					var index = videoReplaceNo - 1;
					$curImgList[index].attrid = attrid;
					$curImgList[index].name = name;
					$curImgList[index].src = src;
					$curImgList[index].source = source;
					$curImgList[index].long = long;
					videoReplaceNo = null;
					materialReplaceFlag = false;
				}else if(videoReplaceNo && !isNaN(videoReplaceNo)){
					$curImgList.splice(videoReplaceNo,0,{"src":src,"name":name,"source":source,"long":long,"attrid":attrid});
					videoReplaceNo++;
				}else{
					$curImgList.push({"src":src,"name":name,"source":source,"long":long,"attrid":attrid});
				}
			}
		});	*/

		if($curImgList.length < 1){
			curelement.attr("curimglist","");
		}else{
			curelement.attr("curimglist",JSON.stringify($curImgList));
		}
		console.log("有没有 执行到这里："+$curImgList)
		//隐藏和取消已选中样式
		$("#videoModal").find(".up-modal-m-i").removeClass("active");
		$("#videoModal").modal("hide");
		prev = curelement;
		//更新视频编辑区
		updateVideoWrap();
		sceneLong(curScene);
		//随时缩略图
		sceneThumbnail();
	});	
	
	//更新视频编辑区(video)
	function updateVideoWrap(){
		//处理缓存，保证缓存数据是当前元素数据($curImgList)
	
		updateCurImgList();
		//更新编辑区
		var size = $curImgList.length;
		if(size>0){
			//删除添加提醒和历史内容
			$(".video_edit").find(".video_wrap").html("");
			//当前元素src
			var osrc = curelement.find("img").attr("src");
			//插入数据到编辑区
			for(var i=0;i<size;i++){
				var src = $curImgList[i].src;
				//视频编辑项
				var videoindex = (i+1);
				$(".video_edit .video_wrap").append("<div class='video_item edit_drag_item edit-hover' dragtype='video'><div class='video_item_front'><span class='img_index'>"+videoindex+"</span></div><div class='video_item_back'><img class='img-ico' src='"+src+"' alt='"+$curImgList[i].name+"' attrid='"+$curImgList[i].attrid+"' source='"+$curImgList[i].source+"' long='"+$curImgList[i].long+"'></img><div class='info_item_line' ><div class='video_item_name ellipsis' title=''>"+$curImgList[i].name+"</div><div class='video_item_time ellipsis'>"+formatSeconds($curImgList[i].long)+"</div><div class='edit-handle edit-replace video-replace' videoindex='"+videoindex+"' title='"+"替换"+"'></div><div class='edit-handle edit-del video-del' attrid='"+$curImgList[i].attrid+"' title='"+"删除"+"'></div></div></div></div>");
				//当前元素显示第一张缩略图
				if(i < 1){
					if(osrc != src){
						curelement.find("img").attr("src",src);
						osrc = src;
					}
				}else{
					if(!osrc || osrc == ""){
						curelement.find("img").attr("src",src);
					}
				}
			}
			//清空功能开启
			$(".video_edit .emptyvideo").removeClass("color-gray");
		}else{
			curelement.find("img").removeAttr("src");
			//增加添加提醒
			$(".video_edit .video_wrap").html("");
			//.append("<div class='tip-add'><div class='tip-add-img'></div><div class='tip-add-text'>"+$.i18n.prop("progForm.addVideoInfo")+"</div></div>");
			//清空功能关闭
			$(".video_edit .emptyvideo").addClass("color-gray");
		}
		prev = curelement;
		updateShowSize();
	}
	
	//删除已有素材(video)
	$(document).on("click",".video_edit .video-del",function(){
	//$(".video_edit .video-del").on("click",function(){
		//处理缓存，保证缓存数据是当前元素数据($curImgList)
		updateCurImgList();
		var attrid = $(this).attr("attrid");
		for(var i=0,size=$curImgList.length;i<size;i++){
			if($curImgList[i].attrid == attrid){
				$curImgList.splice(i, 1);
				break;
			}
		}
		
		curelement.attr("curimglist",JSON.stringify($curImgList));
		//更新编辑区
		updateVideoWrap();
		//更新场景时长
		sceneLong(curScene);
		//随时缩略图
		sceneThumbnail();
	});
	
	//清空已有素材(video)
	$(".video_edit .emptyvideo").on("click",function(){
		if(!$(this).hasClass("color-gray")){
			curelement.attr("curimglist","");
			$curImgList = [];
			//更新图片编辑区
			updateVideoWrap();
			//更新场景时长
			sceneLong(curScene);
			//随时缩略图
			sceneThumbnail();
		}
	});

	//取消编辑状态(text)
	function cancelEditor(obj){
	    if(!obj){
	    	obj = curelement;
	    }
	    textEditorTool.textEditor("contenteditable","false");
	    obj.find(".ql-editor").parent().css("cursor","default");	
	    //obj.find(".ql-editor").attr("contenteditable",false).parent().css("cursor","default");	    
	}
	
	//更新编辑区样式(text)
	function updateTextWrap(obj){
		console.log("更新编辑区样式");
	    if(!obj){
	    	obj = curelement;
	    }
	
		$("#Sorption").prop("checked",isSorption());
		
		
		
		
		
		
		if(obj.attr("fontsize")){
			$(".fontsize").val(obj.attr("fontsize"));
		}
		if (obj.attr("fontsize")){
			
		}
		if(obj.attr("txtcolor")){
			$(".txtcolor").attr("val",obj.attr("txtcolor")).css("background-color",obj.attr("txtcolor"));
		}
		if(obj.attr("transparent")){
			var transparenthtml = $(".transparent").parent().find(".dropdown-menu-sel span[val='"+obj.attr("transparent")+"']").html();
			$(".transparent").attr("val",obj.attr("transparent")).html(transparenthtml);
		}
		if(obj.attr("bgcolor")){
			$(".bgcolor").attr("val",obj.attr("bgcolor")).css("background-color",obj.attr("bgcolor"));
		}		
		if(obj.attr("txtanimtype")){
			$(".text_edit .play-types-content-item[val='"+obj.attr("txtanimtype")+"']").addClass("active").siblings(".active").removeClass("active");
		}else{
			$(".text_edit .play-types-content-item.scroll-none").addClass("active").siblings(".active").removeClass("active");
		}
		if(obj.find(".toolbar .bold").hasClass("active")){
			$(".text_edit .fonttype[type='bold']").addClass("active");
		}else{
			$(".text_edit .fonttype[type='bold']").removeClass("active");
		}
		if(obj.find(".toolbar .italic").hasClass("active")){
			$(".text_edit .fonttype[type='italic']").addClass("active");
		}else{
			$(".text_edit .fonttype[type='italic']").removeClass("active");
		}
		if(obj.find(".toolbar .underline").hasClass("active")){
			$(".text_edit .fonttype[type='underline']").addClass("active");
		}else{
			$(".text_edit .fonttype[type='underline']").removeClass("active");
		}
		
		console.log("left:"+obj);
		displayMaterialInfo(obj.attr("id"),parseInt(obj.css("left")),parseInt(obj.css("top")),parseInt(obj.css("width")),parseInt(obj.css("height")));
		$(".text_edit .fonttype[type='"+$("#text-fonttype-align").val()+"']").addClass("active").siblings(".fonttype").removeClass("active");
		showhidefontduration(obj);
	}
	

	
	$(".number-input").on("input propertychange change",function(){				
			
		var item = parseInt($(this).val());
		//输入不合法
		if(isNaN(item)||item < 1){
			$(this).val("");
			return;
		}
		switch($(this).attr("id")){
			case "lleft":
			curelement.css("left",item)
			break;
			case "ltop":
			curelement.css("top",item)
			break;
			case "lwidth":
			curelement.css("width",item)
			break;
			case "lheight":
			curelement.css("height",item)
			break;
		}
		
		console.log(curelement.attr("id")+"---"+$(this).attr("id")+"----"+item);
		
		/*$(this).val(item);
		if(parseInt(curelement.attr("fontsize")) != item){
			var fontsize = item/standardscalefsize;
			var fontsize = item/18;
			curelement.css("font-size",fontsize+"em").attr("fontsize",item);
			//随时缩略图
			console.log("改变字体大小:"+fontsize);
			sceneThumbnail();
		}*/
	});	
	
	//清除样式(text)
	$(".clearstyle").on("click",function(){
		var content = curelement.find(".ql-editor");
		var txtHtml = content.html().replace(/<[^>]+>/g,"");
		content.html(txtHtml);
		curelement.css("");
	    curelement.css("font-size",(24/standardscalefsize)+"em").attr("fontsize","24");
		curelement.css("background-color","#fff").attr("bgcolor","#fff");
		curelement.css("color",'#000').attr("txtcolor","#000");
		curelement.removeAttr("txtanimtype");
		content.focus();
		updateTextWrap();	
		setTimeout(function(){
			//对齐属性手动显示为左对齐
			$(".text_edit .glyphicon-align-left.fonttype-align").click();
			//console.log("清除样式(text)");
		},100);
		//随时缩略图
		sceneThumbnail();
	});

	//text设置播放类型(text)
	$(".text_edit .txtanim .play-types-content-item").on("click",function(){
		if(!$(this).hasClass("active")){
			$(this).addClass("active").siblings(".active").removeClass("active");
			curelement.attr("txtanimtype",$(this).attr("val"));
			showhidefontduration(curelement);
		}
		//随时缩略图
		sceneThumbnail();
	});
	
	//显示/禁止播放速度(text)
	function showhidefontduration(obj){
		if(!obj){
			obj = curelement;
		}
		var txtanimtype = obj.attr("txtanimtype");
		if(!txtanimtype || txtanimtype === "none"){
			if($(".textmask").length == 0){
				$(".text_edit .op-label-item.duration-item").before(pmask(null,"textmask",$(".text_edit .op-label-item.duration-item"),'0',{"height":5}));
				$("#text-duration-btn-label").attr("val",0).html("无");
				$(".text_edit .op-label-item.duration-item").addClass("color-gray");
			}
		}else{
			$(".text_edit .op-label-item.duration-item").removeClass("color-gray");
			$(".textmask").remove();
			var val = obj.attr("txtanimtypeduration");
			var htmlobj = $(".text_edit .op-label-item.duration-item .opentree[val='"+val+"']");
			var html = null;
			if(!val || htmlobj.length == 0){
				html = $.i18n.prop("msgMake.general");
				val = "30";
				obj.attr("txtanimtypeduration",val);
			}else{
				html = htmlobj.html();
			}
			$("#text-duration-btn-label").attr("val",val).html(html).removeClass("color-gray");
		}
	}
	
	//text设置播放速度(text)
	$("#text-duration-btn-label").on("change",function(){
		if(!$(this).hasClass("active")){
			var txtanimtypeduration = $(this).attr("val");
			curelement.attr("txtanimtypeduration",txtanimtypeduration);
		}
		//随时缩略图
		sceneThumbnail();
	});
	
	//字体大小设置(text)
	$(".fontsize").on("input propertychange change",function(){				
		//var item = parseInt($("#text-fonsize-btn-label").val());
		var item = parseInt($(this).val());
		//输入不合法
		if(isNaN(item)||item < 1){
			$(this).val("");
			return;
		}

		$(this).val(item);
		if(parseInt(curelement.attr("fontsize")) != item){
			var fontsize = item/standardscalefsize;
			var fontsize = item/18;
			curelement.css("font-size",fontsize+"em").attr("fontsize",item);
			//随时缩略图
			console.log("改变字体大小:"+fontsize);
			sceneThumbnail();
		}
	});	
	
	//点击字体大小下拉，焦点落到输入框中(text)
	$("#text-fonsize-btn").on("click",function(){
		$("#text-fonsize-btn-label").focus();
	});
	
	//修改字体颜色(text)
	$(".txtcolor").on("change",function(){
		curelement.attr("txtcolor",$(this).attr("val")).css("color",$(this).attr("val"));
		
		//随时缩略图
		sceneThumbnail();
	});
	
	//修改背景是否透明(text)
	$(document).on("change",".transparent",function(){
		console.log("修改背景是否透明(text)");
		if($(this).attr("val") == "1"){
			curelement.attr("transparent","1");
			curelement.css("background-color","transparent");
		}else{
			curelement.attr("transparent","0");
			curelement.css("background-color",curelement.attr("bgcolor"));
		}
		//随时缩略图
		sceneThumbnail();
	});
	
	//修改背景颜色(text)
	$(".bgcolor").on("change",function(){
	console.log("修改背景颜色(text)");
		curelement.attr("bgcolor",$(this).attr("val"));
		if(curelement.attr("transparent") != "1"){
			curelement.css("background-color",$(this).attr("val"));
		}
		//随时缩略图
		sceneThumbnail();
	});
	
	//局部对齐文本样式(text)
	$(".text_wrap .fonttype-align").on("click",function(){
		//1
		//var editor = getQuill("#"+curelement.find(".ql-container").attr("id"));
		//editor.formatLine(parseInt(curelement.attr("rangestart")), parseInt(curelement.attr("rangeend")), 'align', $(this).attr("type"));
		console.log("对齐有没有运行");
		$(this).addClass("active").siblings(".fonttype-align").removeClass("active");
		
		//2
		//console.log("文本样式1 type:"+$(this).attr("type")+"   "+$(".text_edit .ql-align").length);
		$(".text_edit .ql-align option[value='"+$(this).attr("type")+"']").attr("selected",true).siblings().removeAttr("selected");
		
		textEditorTool.textEditor("fontJustify",$(this).attr("type"));
		
		//随时缩略图
		sceneThumbnail();
		return false;
	});
	
	//字体样式(text)
	$(".text_wrap .ql-bold , .text_wrap .ql-italic , .text_wrap .ql-underline").on("click",function(){		
		if($(this).hasClass("active")){
			$(this).removeClass("active");
			textEditorTool.textEditor("fontStyle",$(this).attr("type"),false);
		}else{
			$(this).addClass("active");
			textEditorTool.textEditor("fontStyle",$(this).attr("type"),true);
		}
		//textEditorTool.textEditor("fontStyle",$(this).attr("type"));
		sceneThumbnail();
		return false;
	});	
		
		//初始化编辑器(text)
	function initTxtEditor(){
   	    textEditorTool.textEditor({
   	    	keydownEventHandle:function(e){
   	    		//console.log("keydownEventHandle");
   	    		sceneThumbnail("NOT_SAVE_HIS");
   	    	},
   	    	keydownStopHandle:function(e){
   	    	//	console.log("keydownStopHandle");
   	    		sceneThumbnail();
   	    	},
   	    	mousedownEventHandle:function(e){
   			    //如果按下的是右键，则执行函数
				console.log("执行了这里吗");
   			    if(3 == e.which && isNolock()){
   			    	if(curelement){
   			    		showcontextmenu(e,curelement.get(0));
   			    	}
   			    } 
   	    	}
   	    });
	}
	//增加text(text)
	function addtxt(){
		total++;
		
		var standardscalefsize=18;
		var add = $("<div id='fonts_"+total+"' fontsize='24' bgcolor='#fff' transparent='0' txtcolor='#000' class='ui-state-active element font active' title='' from='text_edit' style='width:162px;min-height:24px;position:absolute;top:0px;left:0px;z-index:"+total+";color:#000;text-align:left;background-color:#fff;font-size:"+(24/standardscalefsize)+"em;' txtanimtype='none' />");
		$(add).append("<div id='textarea_fonts_"+total+"' class='ql-editor' style='width:100%;height:100%;overflow:hidden;'><span class='palceholder'>&nbsp;</span></div>");//双击此处进行编辑
		//初始化退拽 缩放
		draginitfn($(add));
		resizeinitfn($(add));
		
   	    curScene.append(add);
		addscene.append("<div><input type='checkbox' id=fonts_"+total+" name='checkdom'/>fonts_"+total+"<br></div>");
   	    //文本框，第一次onchange不记录历史
   	    var saveFlag = "NOT_SAVE_HIS";
   	    
   	    //初始化编辑器
   	    initTxtEditor();
   	    //var editor = getQuill('#textarea_fonts_'+total);
   	    $(".backg_tpl_item.active").click();
   	    //curScene.click();
   	    $(add).mousedown();
   	    $(add).css("height","85px");
		//更新元素位置在当前可视范围内
		var top = $(".content-main-edit").scrollTop();
		add.css("top",top+"px");
	    //随时缩略图
	    sceneThumbnail();   
	}	
	
	//增加日期(date)
	function adddate(){
		total++;
		//var add = $("<div id='date_"+total+"' class='date element active' title=''  timezone=8 datestyle=1 from='date_edit' style='font-size:13px;left:0px;top:0px;z-index:"+total+";position:absolute;width:401px; height:100px;'><div class='op-beijingtime-box c-clearfix'> <p class='op-beijingtime-time op-time' id=''></p><p class='op-beijingtime-datebox op-date' id=''> </p></div></div>");
		var add = $("<div id='date_"+total+"' class='date element active' title='' timezone=8 dateStyle='1' fontsize='2' txtcolor='#000' from='date_edit' style='font-size:1em;left:0px;top:0px;z-index:"+total+";position:absolute;width:353px; height:44px;'><div class='op-beijingtime-box c-clearfix'><p class='op-beijingtime-datebox op-date' id=''> </p><p class='op-beijingtime-time op-time' id=''></p><p class='op-beijingtime-weekbox op-week' id=''> </p></div></div>");

		curScene.append(add);
		$(add).mousedown();
		window.baidu_time(getTimeString(new Date(), 8).getTime(),$("#date_"+total));
		//$(add).draggable({containment: ".content-center"}); 
		draginitfn($(add));
		//$(add).resizable({containment: ".content-center",handles: "n, e, s, w, ne, se, sw, nw"}); 
		resizeinitfn($(add));
		//更新元素位置在当前可视范围内
		var top = $(".content-main-edit").scrollTop();
		add.css("top",top+"px");
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下) 	   
		sceneThumbnail();
	}
	
	//修改日期格式(date)
	$(".date_edit .dateStyle").on("click",function(){
		if(!$(this).hasClass("active")){
			$(this).addClass("active").siblings(".active").removeClass("active");
			curelement.attr("dateStyle",$(this).attr("val"));
			getDateStyle(this);
		}
		sceneThumbnail();
	});
	
	//修改字体大小(date)
	$(".date_edit .fontsize").on("change",function(){
		var item = $(this).attr("val");
		var fontsize = null;
		var width = null;
		var height = null;
		if(item == "4"){
			//特大
			fontsize = 3;
			width = 286;
			height = 419;
		}else if(item == "3"){
			//大
			fontsize = 2;
			width = 537;
			height = 99;
		}else if(item == "1"){
			//小
			fontsize = 0.6;
			width = 192;
			height = 24;
		}else{
			//中
			fontsize = 1;
			width = 293;
			height = 44;
		}
		//设置属性
		//var curwidth = parseInt(curelement.css("width"));
		//var curheight = parseInt(curelement.css("height"));
		//if(curwidth<width){
			//curelement.css("width",width+"px");
		//}
		//if(curheight<height){
			//curelement.css("height",height+"px");
		//}
		curelement.css("font-size",fontsize+"em").attr("fontsize",item);
		//随时缩略图
		sceneThumbnail();
	});
	
	//日期字体颜色(date)
	$(".date_edit .txtcolor").on("change",function(){
		curelement.attr("txtcolor",$(this).attr("val")).css("color",$(this).attr("val"));
		//随时缩略图
		sceneThumbnail();
	});	
		
	//编辑修改时区(date)
	$(".date_edit .timezone").on("change",function(){
		var timezone = parseInt($(this).attr("val"));
		curelement.attr("timezone",timezone); 
		window.baidu_time(getTimeString(new Date(),timezone).getTime(),curelement);
		sceneThumbnail();
	});

	//粗体
	$(".date_edit .glyphicon-bold").on("click",function(){
		
		if(curelement.css("font-weight") != 'bold'){
			curelement.css("font-weight","bold");
			$(this).addClass("active");
		}else{
			curelement.css("font-weight","normal");
			$(this).removeClass("active");
		}
		sceneThumbnail();
	});
	
	//斜体
	$(".date_edit .glyphicon-italic").on("click",function(){
		if(curelement.css("font-style") != 'italic'){
			curelement.css("font-style","italic");
			$(this).addClass("active");
		}else{
			curelement.css("font-style","normal");
			$(this).removeClass("active");
		}
		sceneThumbnail();
	});
	
	//刷新日期控件
	function refreshDate(obj){
		if(!obj){
			obj = curelement;
		}
		if(obj.attr("timezone")){
			var timezonelabel = $(".date_edit .timezone");
			var timezonehtml = timezonelabel.parent().find(".dropdown-menu-sel span[val='"+obj.attr("timezone")+"']").html();
			timezonelabel.attr("val",obj.attr("timezone")).html(timezonehtml);
		}
		if(obj.attr("datestyle")){
			$(".date_edit .dateStyle[val='"+obj.attr("datestyle")+"']").addClass("active").siblings(".active").removeClass("active");
		}
		if(obj.attr("fontsize")){
			var fontsizelabel = $(".date_edit .fontsize");
			var fontsizehtml = fontsizelabel.parent().find(".dropdown-menu-sel span[val='"+obj.attr("fontsize")+"']").html();
			fontsizelabel.attr("val",obj.attr("fontsize")).html(fontsizehtml);
		}
		if(obj.attr("txtcolor")){
			$(".date_edit .txtcolor").attr("val",obj.attr("txtcolor")).css("background-color",obj.attr("txtcolor"));
		}
		if(obj.css("font-weight") == "bold"){
			$(".date_edit").find(".glyphicon-bold").addClass("active");
		}else{
			$(".date_edit").find(".glyphicon-bold").removeClass("active");
		}
		if(obj.css("font-style") == "italic"){
			$(".date_edit").find(".glyphicon-italic").addClass("active");
		}else{
			$(".date_edit").find(".glyphicon-italic").removeClass("active");
		}
	}

    //选择设置地图的方式：手动输入还是直接获取终端的位置(map)
    $("#map-selectStyle-btn-label").on("change",function(){
        if($(this).attr("val") === "0"){
            $(".op-label-item.manual").addClass("hide");    
            curelement.attr("seltype","0");
            mapInfo(curelement,false);
        }else{
            $(".op-label-item.manual").removeClass("hide");    
            curelement.attr("seltype","1");
            
            //改为不显示国家，直接使用第一个(中国)
            //$(".map_edit .cnty-item").show(500);
            $(".map_edit .cnty-item").hide();
            $(".map_edit .cnty-item li:first").click();
        }    
        //mapInfo(curelement,false);
    });
    
    //地图设置国家(map)
    $("#map-cnty-btn-label").on("change",function(){
    	var cntyName = $(this).attr("val");
    	//刷新所选
    	if(cntyName && cntyName.length > 0 && cntyName != $(".map_edit .cnty").attr('val')){
    		$(".map_edit .cnty").attr("val",cntyName).html(getCityName(cntyName));
    		$(".map_edit .cnty-item").show();
    	}
    	
    	var provinceUl = $(".map_edit .province-ul");
    	var isSelProvince = false;
    	if((curelement && curelement.attr("cnty") != cntyName)){
    		isSelProvince = true;
    	}
    	
    	//刷新下拉列表
    	if(provinceUl.find("ul").length < 1 || isSelProvince){
    		$(".map_edit .province-item").show();
    		//清空区域
    		provinceUl.html("");
    		var provArray = cntyprovince[cntyName];
    		for(var i=0;i<provArray.length;i++){
    			var provName = provArray[i];
    			provinceUl.append("<li class='dropdown-menu-sel ellipsis'><span class='opentree text-left' title='"+getCityName(provName)+"' val='"+provName+"'>"+getCityName(provName)+"</span></li>");
    		}
    	}
    	
    	//更新
    	if(isSelProvince){
    		if(provinceUl.find(".dropdown-menu-sel span").length == 1){
    			provinceUl.find(".dropdown-menu-sel span").click();
    		}else{
    			$(".map_edit .province").attr("val","").html($.i18n.prop("progForm.pleaseSelectProvince"));
    			$(".map_edit .city").attr("val","").html($.i18n.prop("progForm.pleaseSelctCity"));
    			$(".map_edit .city-item").hide();
    		}
    	}
    });
    
    //地图设置区域
    //function set_province(provinceName,city){
    $("#map-province-btn-label").on("change",function(){
    	var provinceName = $(this).attr("val");
    	var city = curelement.attr("city");
    	//刷新所选
    	if(city && city != '-'){
    		$(".map_edit .city").attr("val",city).html(getCityName(city));
    		$(".map_edit .city-item").show();
    	}
    	if(provinceName && provinceName.length > 0 && provinceName != $(".map_edit .province").attr('val')){
    		$(".map_edit .province").attr("val",provinceName).html(getCityName(provinceName));
    		$(".map_edit .province-item").show();
    	}
    		
    	var cityUl = $(".map_edit .city-ul");
    	var isSelCity = false;
    	if((curelement && curelement.attr("province") != provinceName) || $(".map_edit .cnty").attr("val") != curelement.attr("cnty")){
    		isSelCity = true;
    	}
    	//刷新下拉列表
    	if(cityUl.find("ul").length < 1 || isSelCity){
    		$(".map_edit .city-item").show();
    		//清空城市
    		cityUl.html("");
    		var cnty_province = $("#map-cnty-btn-label").attr("val")+"_"+provinceName;
    		var cityArray = cntyprovincecity[cnty_province];
    		//遍历城市
    		for(var i=0;i<cityArray.length;i++){
    			var cityName = cityArray[i];
    			cityUl.append("<li class='dropdown-menu-sel ellipsis' ><span class='opentree text-left' title='"+getCityName(cityName)+"' val='"+cityName+"'>"+getCityName(cityName)+"</span></li>");
    		}
    	}
    	
    	//设置城市
    	if(city === '-'){
    		cityUl.find("li span:first").click();
    	}else if(city){
    		if(isSelCity){
    			var cityli = cityUl.find("li span[val='"+city+"']");
    			if(cityli.length > 0){
    				cityli.click();
    			}else{
    				cityUl.find("li span:first").click();
    			}
    		}
    	}else{
    		$(".map_edit .city").attr("val","").html($.i18n.prop("progForm.pleaseSelctCity"));
    	}
    });
    
    //修改城市(map)
    $("#map-city-btn-label").on("change",function(){
    	curelement.attr("city",$(this).html());
		curelement.attr("province",$(".map_edit .province").attr("val"));
		curelement.attr("cnty",$(".map_edit .cnty").attr("val"));
    });
    
    //修改地图类型(map)
    $("#map-selectPosition-btn-label").on("change",function(){
    	var maptype = $(this).attr("val");
    	curelement.attr("maptype",maptype);
		updateMapType();
    });
    
    //查询(map)
    $("#search-map").on("click",function(){
    	$("#r-result").show(500);
    	var value = $(this).siblings("input").val();
    	curelement.attr("target",value);
    	var city = curelement.attr("city");
    	var id = curelement.find(".mapdiv").attr("id");
    	map = baidumapinit(id);
    	if(!city || city === ""){
    		var local = new BMap.LocalSearch(map, {
    			renderOptions:{map: map, panel:"r-result"}
    		});
    		local.search(value);
    	}else{
        	var myKeys = [value, city];
        	var local = new BMap.LocalSearch(map, {
        		renderOptions:{map: map, panel:"r-result"},
        		pageCapacity:3
        	});
        	local.searchInBounds(myKeys, map.getBounds());
    	}
    });
    
    /**
     * 更新地图数据到地图控件元素
     * curMap 修改的map控件元素对象(如果不设置,则认为使用当前控件元素)
     * map 百度map对象(如果不设置，则认为使用当前控件元素中.mapdiv的map对象)
     */
    function updateElePoint(curMap,map){
    	var point = null;
    	if(!curMap){
    		curMap = curelement;
    	}
    	if(!map){
        	var id = curMap.find(".mapdiv").attr("id");
        	if(id){
        		map = baidumapObjs[id];
        	}
    	}
    	if(map && curMap){
    		point = map.getCenter();
    		if(point){
    			curMap.attr("longitude",point.lng).attr("latitude",point.lat);
    		}
    	}
    	return point;
    }
    
    //根据当前元素的maptype属性，设置地图类型(map)
    function updateMapType(map,curMap){
    	if(!curMap){
    		curMap = curelement;
    	}
    	if(!map && curMap){
    		var id = curMap.find(".mapdiv").attr("id");
    		map = baidumapObjs[id];
    	}
    	if(curMap && map){
    		//设置地图类型
    		var maptype = curMap.attr("maptype");
        	if(maptype === "BMAP_HYBRID_MAP"){
        		map.setMapType(BMAP_HYBRID_MAP);
        	}else if(maptype === "BMAP_PERSPECTIVE_MAP"){
        	    map.setCurrentCity(curMap.attr("city"));  //设置当前城市 
        		map.setMapType(BMAP_PERSPECTIVE_MAP);     //修改地图类型为3D地图  
        	}else{
        		map.setMapType(BMAP_NORMAL_MAP);
        	}
    	}
    }
    
    //选择搜索的地址(map)
    $("#r-result li").on("click",function(){
    	var h = $(this).find("a").prev().html();
    	if(h){
        	var re = /<[^>]+>/gi;
        	var target = h.replace(re,'');
        	$(".map_edit .target-item input").val(target);
        	curelement.attr("target",target);
        	var myGeo = new BMap.Geocoder();
        	// 将地址解析结果显示在地图上,并调整地图视野
        	var id = curelement.find(".mapdiv").attr("id");
        	//map = baidumapObjs[id];
        	//if(!map){
        	//	map = baidumapinit(id);
        	//}
        	//map.clearOverlays();
        	map = baidumapinit(id);
        	//城市
        	var	city = curelement.attr("city");
        	if(!city || city === ""){
        		city = "all";
        	}
			var zoom = parseInt(curelement.attr("zoom"));
			if(!isNaN(zoom)){
				map.setZoom(zoom);
			}
        	//curelement.attr("longitude","").attr("latitude","");
        	myGeo.getPoint(target, function(point){
        		if (point) {
        			myGeo.getLocation(point, function(rs){
        				var addComp = rs.addressComponents;
        				curelement.attr("city",addComp.city);
        				updateMapType(map,curelement);
        	        	//设置地点
        				map.centerAndZoom(point, zoom);
            			var marker = new BMap.Marker(point);
            			map.addOverlay(marker);
            	    	updateElePoint(curelement,map);
        			});    
        		}else{
        			console.log("您选择地址没有解析到结果!");
        		}
        	}, city);
        	$("#r-result").hide(500);
    	}
    });

    //获取当前城市(map)
/*    var localCityName = null;
    function baiduLocalCityName(result){
    	localCityName = result.name;
    	//var cityName = result.name;
		//map.setCenter(cityName);
		//alert("当前定位城市:"+cityName);
	}
    new BMap.LocalCity().get(baiduLocalCityName);*/
    
	//地图初始化(map)
	function mapinit(){	
		total++;
		var add = $("<div id='map_"+total+"' class='map element' title='' from='map_edit' style='left:0px;top:0px;z-index:"+total+";position:absolute;'></div>");	
		//设置默认值
		$(add).attr({
			"seltype":"0",
			"city":"",
			"province":"",
			"cnty":"",
			"maptype":"BMAP_NORMAL_MAP",
			"longitude":"",
			"latitude":"",
			"zoom":16,
			"target":"",
		}).css({"width":"240px","height":"110px"});
		mapInfo(add, true);
		refreshMapDataEditInfo(add);
	}	
	
	//根据城市名定位(map)
	function theLocation(city,map){
		if(city != ""){
			map.centerAndZoom(city,11);      // 用城市名设置地图中心点
		}
	}
	
	//百度地图初始化(map)
	var baidumapObjs = {};
	function baidumapinit(id){
		var map = new BMap.Map(id);
		// 添加缩放控件
		map.addControl(new BMap.NavigationControl({type:BMAP_NAVIGATION_CONTROL_ZOOM}));        
		//由于点击事件会被百度捕获,并且不冒泡，所以模拟松手，避免以为一直长按着鼠标
		map.addEventListener("zoomstart", function(type, target) {
			var eleid = id.substring(0,id.length-4);
			$("#"+eleid).mouseup();
		});
		//监听缩放结束事件
		map.addEventListener("zoomend", function(type, target) {
			var eleid = id.substring(0,id.length-4);
			$("#"+eleid).attr("zoom",map.getZoom());
		});
		map.disableDoubleClickZoom();
		map.disableDragging();
		baidumapObjs[id] = map;
		return map;
	}
	
	//生成地图控件元素内容(map)
	function mapInfo(curMap,isNew,notSave){
		//var stocktable =  $("<div class='exchangetable' style='font-size:1em;color:"+color+";"+bgcolorstr+"'></div>");
		var baidumapid = curMap.attr("id")+"_map";
		var mapdiv =  $("<div id="+baidumapid+" class='mapdiv' style='font-size:1em;height:100%;'></div>");
		if(curMap.attr("seltype") === "0"){
			mapdiv.append("<img src='/apm-web/static/images/program/map.png' style='width:100%;height:100%;'></img>");
			curMap.find(".mapdiv").remove();
			curMap.append(mapdiv);
		}else{
			curMap.find(".mapdiv").remove();
			curMap.append(mapdiv);
			var target = curMap.attr("target");
			if(target && target.length > 0){
				map = baidumapinit(baidumapid);
				if(curMap.attr("longitude").length > 0 && curMap.attr("latitude").length > 0){
					var longitude = curMap.attr("longitude")*1;
					var latitude = curMap.attr("latitude")*1;
					map.setCenter(new BMap.Point(longitude, latitude));
				}
/*				var local = new BMap.LocalSearch(map,{
					renderOptions:{map: map}
				});
				local.search(target);*/
				var city = curMap.attr("city");
				if(!city||city.length < 1){
					city = "all";
				}
				var zoom = parseInt(curMap.attr("zoom"));
				if(isNaN(zoom)){
					zoom = 16;
				}
				var myGeo = new BMap.Geocoder();
		    	myGeo.getPoint(target, function(point){
		    		if (point) {
		    			map.centerAndZoom(point, zoom);
		    			var marker = new BMap.Marker(point);
		    			map.addOverlay(marker);
		    		}else{
		    			console.log("您选择地址没有解析到结果!");
		    		}
		    	}, city);
		    	
				//更新地图类型
		    	updateMapType(map,curMap);
			}else{
				mapdiv.append("<img src='/apm-web/static/images/program/map.png' style='width:100%;height:100%;'></img>");
			}
		}
		if(!notSave){
			if(!isNew){
				curMap.removeClass("active");
				curMap.mousedown();
				//刷新缩略图
				sceneThumbnail();
			}else{
				var frameOverlay = $('<div class="frameOverlay"></div>');
				curMap.append(frameOverlay);
				draginitfn(curMap);
				//绑定事件处理，当停止拉伸控件大小，重新画地图
				var eventListener = {};
				eventListener.stop = function(event, ui){
					redrawMap();
				}
				resizeinitfn(curMap,eventListener);			
				curScene.append(curMap);

				curelement = curMap;
				curelement.mousedown();

				//更新元素位置在当前可视范围内
				var top = $(".content-main-edit").scrollTop();
				curelement.css("top",top+"px");
				//刷新缩略图
				sceneThumbnail();
			}
		}
	}
	
	//根据地图控件元素属性，重绘地图
	function redrawMap(curMap){
		if(!curMap){
			curMap = curelement;
		}
		var seltype = curMap.attr("seltype");
		var target = curMap.attr("target");
		if(seltype === "1" && target && target.trim().length > 0){
			var baidumapid = curMap.attr("id")+"_map";
			var map = baidumapinit(baidumapid);
			
			var zoom = parseInt(curMap.attr("zoom"));
			if(isNaN(zoom)){
				zoom = 16;
			}
			var longitude = curMap.attr("longitude")*1;
			var latitude = curMap.attr("latitude")*1;
			if(!isNaN(longitude) && !isNaN(latitude)){
				var point = new BMap.Point(longitude,latitude);
				updateMapType(map,curMap);
				map.centerAndZoom(point, zoom);
				map.addOverlay(new BMap.Marker(point));
			}else{
				var point = updateElePoint(curMap);
				if(point){
					updateMapType(map,curMap);
					map.centerAndZoom(point, zoom);
        			map.addOverlay(new BMap.Marker(point));
				}
			}
		}
	}
	
	//刷新地图编辑区(map)
	function refreshMapDataEditInfo(obj){
		if(!obj){
			obj = curelement;
		}
		
		//国家、区域、城市
		var cntyName = obj.attr("cnty");
		var provinceName = obj.attr("province");
		var cityName = obj.attr("city");
		if(!cntyName || cntyName === ''){
			$(".map_edit .cnty").attr("val","").html($.i18n.prop("progForm.pleaseSelectCnty"));
			$(".map_edit .province-item,.map_edit .city-item").hide();
		}else{
			$(".map_edit .cnty-item span[val='"+cntyName+"']").click();
			//set_cnty(cntyName);
			if(provinceName && provinceName.length > 0){
				$(".map_edit .province-item span[val='"+provinceName+"']").click();
			}else{
				$(".map_edit .city-item").hide();
			}
		}
		//地图样式
		var mapitem = $(".map_edit .dropdown-menu-sel .opentree[val='"+obj.attr("maptype")+"']");
		var maptypeval = mapitem.attr("val");
		var maptypehtml = mapitem.html();
		$("#map-selectPosition-btn-label").attr("val",maptypeval).html(maptypehtml);
		//目标
		$(".map_edit .target-item input").val(obj.attr("target"));
		//还原位置类型
		$(".map_edit .mapPlacedType[val='"+obj.attr("seltype")+"']").click();
	}    
    	
	//汽车班次--- 切换频率/字体大小/每屏行数/表格颜色/背景颜色(numberofruns)
	$(".numberofruns_edit .curelechange").on("change",function(e){
		var obj = $(this);
		var val = null;
		if(obj.is("input")){
			val = $(this).val();
			var minval = obj.attr("minval");
			if(minval){
				var v = parseInt(val);
				if(val.length == 0 || isNaN(v)||v < parseInt(minval)){
					val = minval;
					$(this).val(val);
				}
			}
		}else{
			val = $(this).attr("val");
		}
		var isrefresh = $(this).attr("isrefresh");
		var param = $(this).attr("param");
		curelement.attr(param,val);
		if(isrefresh === "1"){
			getNumberofruns(curelement,false);
		}
	});
    
	//设置汽车班次控件无数据时显示的图片(numberofruns)
	$("#numberofrunsImgModal .confirm").on("click",function(){
		var obj = $("#numberofrunsImgModal .material-item.up-modal-m-i.active");
		if(obj.length == 1){
			var imgsrc = obj.find("img").attr("osrc");
			var name = obj.find("img").attr("alt");
			var attrid = obj.find("img").attr("attrid");
			obj.removeClass("active");
			curelement.attr("imgid",attrid).attr("imgidsrc",imgsrc);
		}else {
			top.$.jBox.tip($.i18n.prop("progForm.pleaseThroughClickToSelectMaterial"));
		}
		//更新控件元素显示
		getNumberofruns(curelement,false);
		//更新背景编辑区
		refreshNumberofrunsDataEditInfo();
		$('#numberofrunsImgModal').modal('hide');
		//随时缩略图
		sceneThumbnail();
	});	
	
	//汽车班次初始化(numberofruns)
	function numberofrunsinit(){
		total++;
		var add = $("<div id='numberofruns_"+total+"' class='numberofruns element' title='' from='numberofruns_edit' style='left:0px;top:0px;z-index:"+total+";position:absolute;'></div>");	
		//设置默认值
		$(add).attr({
			"fontRatio":0.008,
			"isList":"0",
			"switchtime":15,
			"selfontsize":12,
			"seltxtcolor":"#E80000",
			"selbgcolor":"#CFFED3",
			"checkinoffice":"0",
			"wayroll":2,
			"rolltime":"15",
			"imgid":"",
			"imgidsrc":""
		}).css({"width":"340px","height":"200px"});
		getNumberofruns(add,true);
		refreshNumberofrunsDataEditInfo(add);
	}	
	
	//请求服务器-班次json数据(numberofruns)
	var findNumberofrunsFlag = false;
	//班次数据
	var numberofrunsDataRecord = {};
	function findNumberofruns(type,callbackFlag,curNumberofruns,isNew,notSave){
		if(!findNumberofrunsFlag){
			findNumberofrunsFlag = true;
			var param = {"type":"1","uri":"http://127.0.0.1:8283/apiserver/findBus","checkinoffice":curNumberofruns.attr("checkinoffice")};
			$.ajax({
				url:"/apm-web/f/common/apiStore",
				dataType:"jsonp",
				jsonp:'jsonpcallback',
				data:param,
				success:function(data){
					numberofrunsDataRecord[type] = data;
					if(callbackFlag){
						getNumberofruns(curNumberofruns,isNew,notSave)
					}
					findNumberofrunsFlag = false;
				},error:function(){
					findNumberofrunsFlag = false;
					//应该删除元素，提示获取数据失败
				}
			});
		}
	}
	
	//刷新汽车班次控件元素显示(numberofruns)
	function getNumberofruns(curNumberofruns,isNew,notSave){
		if(!curNumberofruns){
			curNumberofruns = curelement;
		}
		var type = "1";
		var numberofrunsData = numberofrunsDataRecord[type];
		//判断是否有数据
		if(!numberofrunsData){
			console.log("not numberofrunsData");
			//获取数据，获取成功回调getNumberofruns
			findNumberofruns(type,true,curNumberofruns,isNew,notSave);
		}else{
			console.log("has numberofrunsData");
			//有数据
			var border = drawNumberofrunsBorder(curNumberofruns,notSave,isNew);
			numberofrunsInfo(numberofrunsData, curNumberofruns, isNew,notSave,border);
			refreshNumberofrunsDataEditInfo(curNumberofruns);
		}
	}
	
	//生成汽车班次控件元素内容(numberofruns)//numberofrunsData, curNumberofruns, isNew,notSave,border
	function numberofrunsInfo(array,curNumberofruns,isNew,notSave,border){
		//填班次内容
		var len = array.length;
		if(len > 0){
			//有数据
			var obj = array[0];
			var type = obj["type"]+"";
			var typeStr = null;
			if(type === "0"){
				typeStr = "开始候车";
			}else if(type === "1"){
				typeStr = "开始检票";
			}else if(type === "2"){
				typeStr = "停止检票";
			}
			border.append("<div class='numberofruns-single'>" +
					"<div class='numberofruns-single-one'>" +
							"<div class='busid'>" +
								"<span>车次</span>"+
								"<div class='separate'>&nbsp;:&nbsp;</div>"+
								"<span>"+obj["busID"].trim()+"</span>"+
							"</div>" +
							"<div class='departure-time'>" +
								"<span>发车时间</span>"+
								"<div class='separate'>&nbsp;:&nbsp;</div>"+
								"<span>"+dateTimeTohm(obj["startTime"].trim())+"</span>"+
							"</div>" +
					"</div>"+
					"<div class='numberofruns-single-two'>" +
						"<span>开往</span>"+
						"<div class='separate'>&nbsp;:&nbsp;</div>"+
						"<span>"+obj["endStationName"].trim()+"</span>"+
					"</div>"+
					"<div class='numberofruns-single-three'>" +
						typeStr+
					"</div>"+
					"<div class='numberofruns-single-four'>" +
						"<div class='way-title'>途径" +
						"<div class='separate'>&nbsp;:&nbsp;</div>"+
						"</div>"+
						"<div class='way-content'>"+obj["way"].trim()+"</div>"+
					"</div>"+
					"</div>");
		}else{
			//无数据
			var notdatainfo = $("<div class='numberofrunsnotdata-info'></div>");
			var imgid = curNumberofruns.attr("imgid");
			var imgidsrc = curNumberofruns.attr("imgidsrc");
			if(!imgid && imgid.length > 0){
				notdatainfo.append("<img class='numberofrunsnotdata-img' src='"+imgidsrc+"' ></img>");//onerror='this.src=\"/apm-web/apm_file/img_path/f794da20a79b40306479e6f047cf2354.png\"'
			}
			border.append(notdatainfo);
		}
		//刷新缩略图
		sceneThumbnail();
		//控制元素框大小
		minwh(curNumberofruns);
	}
	
	//未获取数据前绘制表格(numberofruns)边框
	function drawNumberofrunsBorder(curNumberofruns,notSave,isNew){
		var tablecss = "";
		//字体大小
		var selfontsize = parseInt(curNumberofruns.attr("selfontsize"));
		var fontRatio = parseFloat(curNumberofruns.attr("fontRatio"));
		tablecss += "font-size:"+(0.7+(selfontsize*fontRatio))+"em;";
		//背景颜色
		var selbgcolor = curNumberofruns.attr("selbgcolor");
		tablecss += "background-color:"+selbgcolor+";";
		var seltxtcolor = curNumberofruns.attr("seltxtcolor");
		tablecss += "color:"+seltxtcolor+";";
		var border =  $("<div class='numberofruns-content minwh' style='"+tablecss+"'></div>");
		curNumberofruns.find(".numberofruns-content").remove();
		curNumberofruns.append(border);
		if(!notSave){
			if(!isNew){
				curNumberofruns.removeClass("active");
				curNumberofruns.mousedown();
				//刷新缩略图
				sceneThumbnail();
			}else{
				var frameOverlay = $('<div class="frameOverlay"></div>');
				curNumberofruns.append(frameOverlay);
				draginitfn(curNumberofruns);
				resizeinitfn(curNumberofruns);			
				curScene.append(curNumberofruns);

				curelement = curNumberofruns;
				curelement.mousedown();

				//更新元素位置在当前可视范围内
				var top = $(".content-main-edit").scrollTop();
				curelement.css("top",top+"px");
				//刷新缩略图
				sceneThumbnail();
			}
		}
		return border;
	}
	
	//刷新汽车班次编辑区(numberofruns)
	function refreshNumberofrunsDataEditInfo(obj){
		if(!obj){
			obj = curelement;
		}

		//检票口
		var checkinoffice = parseInt(obj.attr("checkinoffice"));
		$(".numberofruns_edit .curelechange[param='checkinoffice']").val(checkinoffice);
		
		//切换频率
		var switchtime = parseInt(obj.attr("switchtime"));
		$(".numberofruns_edit .curelechange[param='switchtime']").val(switchtime);
		
		//字体大小
		var selfontsize = obj.attr("selfontsize");
		$(".numberofruns_edit .curelechange[param='selfontsize']").val(selfontsize);

		//字体颜色
		var seltxtcolor = obj.attr("seltxtcolor");
		$(".numberofruns_edit .curelechange[param='seltxtcolor']").attr("val",seltxtcolor).css("background-color",seltxtcolor);
		
		//背景颜色
		var selbgcolor = obj.attr("selbgcolor");
		$(".numberofruns_edit .curelechange[param='selbgcolor']").attr("val",selbgcolor).css("background-color",selbgcolor);
	
		//途径滚动类型
		var wayroll = obj.attr("wayroll");
		var wayrollHtml = $(".numberofruns_edit .curelechange[param='wayroll']").siblings(".dropdown-menu").find(".dropdown-menu-sel span[val='"+wayroll+"']").html();
		$(".numberofruns_edit .curelechange[param='wayroll']").attr("val",wayroll).html(wayrollHtml);

		//滚动时长
		var rolltime = parseInt(obj.attr("rolltime"));
		$(".numberofruns_edit .curelechange[param='rolltime']").val(rolltime);

		//无数据图片
		var imgidsrc = obj.attr("imgidsrc");
		if(imgidsrc && imgidsrc.length > 0){
			$(".numberofrunsNotDataImg-item.numberofrunsNotDataImg-div-set").hide();
			$(".numberofrunsNotDataImg-item.numberofrunsNotDataImg-div-show").show().find("img").attr("src",imgidsrc);
		}else{
			$(".numberofrunsNotDataImg-item.numberofrunsNotDataImg-div-show").hide();
			$(".numberofrunsNotDataImg-item.numberofrunsNotDataImg-div-set").show();
		}
	}
	
	//删除汽车班次无数据图标(numberofruns)
	$(".numberofruns_edit .del-numberofrunsNotDataImg").on("click",function(){
		curelement.attr("imgid","").attr("imgidsrc","");
		getNumberofruns(curelement);
		refreshNumberofrunsDataEditInfo();
		//随时缩略图
		sceneThumbnail();
	});
	
	//上传图片-汽车班次无数据图标(numberofruns)
	$("#numberofrunsImgUpload").on("click",function(){
		$("#imgUpload .webuploader-element-invisible").click();
	});
	
    //查询(stock)
	var searchStockFlag = false;
    $("#search-stock").on("click",function(){
    	var code = $(this).siblings("input").val();
    	curelement.attr("code",code);
    	searchStockFlag = true;
    	getStock(curelement,false);
    });
    
	//切换频率/字体大小/每屏行数/表格颜色/背景颜色(stock)
	$(".stock_edit .curelechange").on("change",function(e){
		var obj = $(this);
		var val = null;
		if(obj.is("input")){
			val = $(this).val();
			var minval = obj.attr("minval");
			if(minval){
				var v = parseInt(val);
				if(val.length == 0 || isNaN(v)||v < parseInt(minval)){
					val = minval;
					$(this).val(val);
				}
			}
		}else{
			val = $(this).attr("val");
		}
		var isrefresh = $(this).attr("isrefresh");
		var param = $(this).attr("param");
		curelement.attr(param,val);
		if(isrefresh === "1"){
			getStock(curelement,false);
		}
	});
    
	//股票初始化(stock)
	function stockinit(){
		total++;
		var add = $("<div id='stock_"+total+"' class='stock element' title='' from='stock_edit' style='left:0px;top:0px;z-index:"+total+";position:absolute;'></div>");	
		//设置默认值
		$(add).attr({
			"fontRatio":0.008,
			"isList":"1",
			"bazaar":"sh",
			"code":"",
			"switchtime":15,
			"selfontsize":12,
			"sellinenum":10,
			"selbgcolor":"#FFFFFF",
			"seltablecolor":"#000000",
		}).css({"width":"240px","height":"110px"});
		getStock(add,true);
		refreshStockDataEditInfo(add);
	}	
	
	//刷新股票控件元素显示(stock)
	var stockDataRecord = {};
	function getStock(curStock,isNew,notSave){
		if(!curStock){
			curStock = curelement;
		}
		var datekey = dateStr(null,"ymd")+"";
		var isList = curStock.attr("isList");
		var bazaar = curStock.attr("bazaar");
		var sellinenum = parseInt(curStock.attr("sellinenum"));
		if(isNaN(sellinenum)){
			sellinenum = 10;
		}
		var code = curStock.attr("code");
		if(!code){
			code = "";
		}
		var page = parseInt(curStock.attr("page"));
		if(isNaN(page)){
			page = 1;
		}
		var key = bazaar+"_"+isList+"_3_"+page+"_"+code;
		var stockData = null;
		var da = stockDataRecord[key];
		if(da && da.ymd == datekey){
			//当天缓存汇率的数据
			stockData = da.stockData;
		}
		
		if(stockData){
			console.log("获取历史汇率数据");
			var stocktable=drawStockTable(curStock,notSave,isNew);
			stockInfo(stockData, curStock, isNew,notSave,stocktable);
			refreshStockDataEditInfo(curStock);
		}else{
			var stocktable=drawStockTable(curStock,notSave,isNew);
			//根据设置获取对应数据
			var param = null;
			if(bazaar === "sz"){
				if(isList === "1"){
					param = {"type":3,"page":page,"uri":"http://web.juhe.cn:8080/finance/stock/szall"};
				}else{
					param = {"gid":"sz"+code,"uri":"http://web.juhe.cn:8080/finance/stock/hs"};
				}
			}else if(bazaar === "usa"){
				if(isList === "1"){
					param = {"type":3,"page":page,"uri":"http://web.juhe.cn:8080/finance/stock/usaall"};
				}else{
					param = {"gid":code,"uri":"http://web.juhe.cn:8080/finance/stock/usa"};
				}
			}else if(bazaar === "hk"){
				if(isList === "1"){
					param = {"type":3,"page":page,"uri":"http://web.juhe.cn:8080/finance/stock/hkall"};
				}else{
					param = {"num":code,"uri":"http://web.juhe.cn:8080/finance/stock/hk"};
				}
			}else{
				//(bazaar === "sh")
				if(isList === "1"){
					param = {"type":3,"page":page,"uri":"http://web.juhe.cn:8080/finance/stock/shall"};
				}else{
					param = {"gid":"sh"+code,"uri":"http://web.juhe.cn:8080/finance/stock/hs"};
				}
			}

			$.ajax({
				url:"/apm-web/f/common/apiStore",
				dataType:"jsonp",
				jsonp:'jsonpcallback',
				data:param,
				success:function(data){
					stockData = data;
					stockInfo(stockData, curStock, isNew,notSave,stocktable);
					stockDataRecord[key] = {"stockData":stockData,"ymd":datekey};
					refreshStockDataEditInfo(curStock);
					if(stockData.error_code === 202102 && searchStockFlag){
						top.$.jBox.tip($.i18n.prop("progForm.notFoundStock"));
					}
					searchStockFlag = false;
				},error:function(){
					searchStockFlag = false;
				}
			});
		}
	}
	
	//生成股票控件元素内容(stock)
	function stockInfo(obj,curStock,isNew,notSave,stocktable){
		var isList = curStock.attr("isList");
		var bazaar = curStock.attr("bazaar");
		var sellinenum = parseInt(curStock.attr("sellinenum"));
		
		var thtrcss = "";
		var trcss = "";
		//tablecss += "font-size:"+selfontsize*fontRatio+"em;";
		//表格颜色
		var seltablecolor = curStock.attr("seltablecolor");
		thtrcss += "background-color:"+seltablecolor+";";
		trcss += "border-top:1px solid "+seltablecolor+";";
		
		//var stocktable =  $("<div class='exchangetable' style='font-size:1em;color:"+color+";"+bgcolorstr+"'></div>");

		var code = curStock.attr("code");
		if(!code){
			code = "";
		}
		
		var result = obj.result;

		if(bazaar === "sz"){
			if(programLanguage.indexOf("zh") === 0){
				stocktable.append("<tr class='head' style='"+thtrcss+"'><th>股票代码</th><th>股票名称</th><th>最新价</th><th>昨收</th><th>今开</th><th>最高</th><th>最低</th><th>成交量</th><th>买入</th><th>卖出</th><th>涨跌额</th><th>涨跌幅</th></tr>");
			}else{
				stocktable.append("<tr class='head' style='"+thtrcss+"'><th>code</th><th>name</th><th>latest</th><th>preclose</th><th>open</th><th>todayMax</th><th>todayMin</th><th>turnover</th><th>buy</th><th>sell</th><th>pricechange</th><th>changepercent</th></tr>");
			}
			if(isList === "1"){
				for(var i=0;i<result.data.length && i < sellinenum;i++){
					var r = result.data[i];
					var symbol = r.symbol;
					if(symbol.substr(0,2) === 'sz'){
						symbol = symbol.substr(2);
					}
					stocktable.append("<tr style='"+trcss+"'><td>"+symbol+"</td><td>"+r.name+"</td><td>"+r.trade+"</td><td>"+r.settlement+"</td><td>"+r.open+"</td><td>"+r.high+"</td><td>"+r.low+"</td><td>"+r.amount+"</td><td>"+r.buy+"</td><td>"+r.sell+"</td><td>"+r.pricechange+"</td><td>"+r.changepercent+"</td></tr>");
				}
			}else{
				if(result.length > 0){
					var r = result[0].data;
					var symbol = r.gid;
					if(symbol.substr(0,2) === 'sz'){
						symbol = symbol.substr(2);
					}
					stocktable.append("<tr style='"+trcss+"'><td>"+symbol+"</td><td>"+r.name+"</td><td>"+r.nowPri+"</td><td>"+r.yestodEndPri+"</td><td>"+r.todayStartPri+"</td><td>"+r.todayMax+"</td><td>"+r.todayMin+"</td><td>"+r.traNumber+"</td><td>"+r.competitivePri+"</td><td>"+r.reservePri+"</td><td>"+r.increase+"</td><td>"+r.increPer+"</td></tr>");
				}else{
					stocktable.append("<tr style='"+trcss+"'><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
				}
			}
		}else if(bazaar === "usa"){
			if(programLanguage.indexOf("zh") === 0){
				stocktable.append("<tr class='head' style='"+thtrcss+"'><th>股票代码</th><th>股票名称</th><th>最新价</th><th>昨收</th><th>今开</th><th>最高</th><th>最低</th><th>成交量</th><th>涨跌额</th><th>涨跌幅</th></tr>");
			}else{
				stocktable.append("<tr class='head' style='"+thtrcss+"'><th>code</th><th>name</th><th>latest</th><th>preclose</th><th>open</th><th>todayMax</th><th>todayMin</th><th>turnover</th><th>pricechange</th><th>changepercent</th></tr>");
			}
			if(isList === "1"){
				for(var i=0;i<result.data.length && i < sellinenum;i++){
					var r = result.data[i];
					stocktable.append("<tr style='"+trcss+"'><td>"+r.symbol+"</td><td>"+r.cname+"</td><td>"+r.price+"</td><td>"+r.preclose+"</td><td>"+r.open+"</td><td>"+r.high+"</td><td>"+r.low+"</td><td>"+r.volume+"</td><td>"+r.diff+"</td><td>"+r.chg+"</td></tr>");
				}
			}else{
				if(result.length > 0){
					var r = result[0].data;
					stocktable.append("<tr style='"+trcss+"'><td>"+r.gid+"</td><td>"+r.name+"</td><td>"+r.lastestpri+"</td><td>"+r.formpri+"</td><td>"+r.openpri+"</td><td>"+r.maxpri+"</td><td>"+r.minpri+"</td><td>"+r.traAmount+"</td><td>"+r.uppic+"</td><td>"+r.limit+"</td></tr>");
				}else{
					stocktable.append("<tr style='"+trcss+"'><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
				}
			}
		}else if(bazaar === "hk"){
			if(programLanguage.indexOf("zh") === 0){
				stocktable.append("<tr class='head' style='"+thtrcss+"'><th>股票代码</th><th>股票名称</th><th>最新价</th><th>昨收</th><th>今开</th><th>最高</th><th>最低</th><th>成交量</th><th>买入</th><th>卖出</th><th>涨跌额</th><th>涨跌幅</th></tr>");
			}else{
				stocktable.append("<tr class='head' style='"+thtrcss+"'><th>code</th><th>name</th><th>latest</th><th>preclose</th><th>open</th><th>todayMax</th><th>todayMin</th><th>turnover</th><th>buy</th><th>sell</th><th>pricechange</th><th>changepercent</th></tr>");
			}
			if(isList === "1"){
				for(var i=0;i<result.data.length && i < sellinenum;i++){
					var r = result.data[i];
					stocktable.append("<tr style='"+trcss+"'><td>"+r.symbol+"</td><td>"+r.name+"</td><td>"+r.lasttrade+"</td><td>"+r.prevclose+"</td><td>"+r.open+"</td><td>"+r.high+"</td><td>"+r.low+"</td><td>"+r.volume+"</td><td>"+r.buy+"</td><td>"+r.sell+"</td><td>"+r.pricechange+"</td><td>"+r.changepercent+"</td></tr>");
				}
			}else{
				if(result.length > 0){
					var r = result[0].data;
					var rgid = r.gid;
					if(rgid.substr(0,2) === 'hk'){
						rgid = rgid.substr(2);
					}
					stocktable.append("<tr style='"+trcss+"'><td>"+rgid+"</td><td>"+r.name+"</td><td>"+r.lastestpri+"</td><td>"+r.formpri+"</td><td>"+r.openpri+"</td><td>"+r.maxpri+"</td><td>"+r.minpri+"</td><td>"+r.traNumber+"</td><td>"+r.inpic+"</td><td>"+r.outpic+"</td><td>"+r.uppic+"</td><td>"+r.limit+"</td></tr>");
				}else{
					stocktable.append("<tr style='"+trcss+"'><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
				}
			}
		}else{
			if(programLanguage.indexOf("zh") === 0){
				stocktable.append("<tr class='head' style='"+thtrcss+"'><th>股票代码</th><th>股票名称</th><th>最新价</th><th>昨收</th><th>今开</th><th>最高</th><th>最低</th><th>成交量</th><th>买入</th><th>卖出</th><th>涨跌额</th><th>涨跌幅</th></tr>");
			}else{
				stocktable.append("<tr class='head' style='"+thtrcss+"'><th>code</th><th>name</th><th>latest</th><th>preclose</th><th>open</th><th>todayMax</th><th>todayMin</th><th>turnover</th><th>buy</th><th>sell</th><th>pricechange</th><th>changepercent</th></tr>");
			}
			//(bazaar === "sh")
			if(isList === "1"){
				for(var i=0;i<result.data.length && i < sellinenum;i++){
					var r = result.data[i];
					var symbol = r.symbol;
					if(symbol.substr(0,2) === 'sh'){
						symbol = symbol.substr(2);
					}
					stocktable.append("<tr style='"+trcss+"'><td>"+symbol+"</td><td>"+r.name+"</td><td>"+r.trade+"</td><td>"+r.settlement+"</td><td>"+r.open+"</td><td>"+r.high+"</td><td>"+r.low+"</td><td>"+r.volume+"</td><td>"+r.buy+"</td><td>"+r.sell+"</td><td>"+r.pricechange+"</td><td>"+r.changepercent+"</td></tr>");
				}
			}else{
				if(result.length > 0){
					var r = result[0].data;
					var symbol = r.gid;
					if(symbol.substr(0,2) === 'sh'){
						symbol = symbol.substr(2);
					}
					stocktable.append("<tr style='"+trcss+"'><td>"+symbol+"</td><td>"+r.name+"</td><td>"+r.nowPri+"</td><td>"+r.yestodEndPri+"</td><td>"+r.todayStartPri+"</td><td>"+r.todayMax+"</td><td>"+r.todayMin+"</td><td>"+r.traNumber+"</td><td>"+r.competitivePri+"</td><td>"+r.reservePri+"</td><td>"+r.increase+"</td><td>"+r.increPer+"</td></tr>");
				}else{
					stocktable.append("<tr style='"+trcss+"'><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
				}
			}
		}
		//刷新缩略图
		sceneThumbnail();
		//控制元素框大小
		minwh(curStock);
	}
	
	//未获取数据前绘制表格
	function drawStockTable(curStock,notSave,isNew){
		var tablecss = "";
		//字体大小
		var selfontsize = parseInt(curStock.attr("selfontsize"));
		var fontRatio = parseFloat(curStock.attr("fontRatio"));
		tablecss += "font-size:"+(0.7+(selfontsize*fontRatio))+"em;";
		//背景颜色
		var selbgcolor = curStock.attr("selbgcolor");
		tablecss += "background-color:"+selbgcolor+";";
		var seltablecolor = curStock.attr("seltablecolor");
		tablecss += "border:1px solid "+seltablecolor+";";
		var stocktable =  $("<table class='stocktable minwh' style='"+tablecss+"'></table>");
		curStock.find(".stocktable").remove();
		curStock.append(stocktable);
		if(!notSave){
			if(!isNew){
				curStock.removeClass("active");
				curStock.mousedown();
				//刷新缩略图
				sceneThumbnail();
			}else{
				var frameOverlay = $('<div class="frameOverlay"></div>');
				curStock.append(frameOverlay);
				draginitfn(curStock);
				resizeinitfn(curStock);			
				curScene.append(curStock);

				curelement = curStock;
				curelement.mousedown();

				//更新元素位置在当前可视范围内
				var top = $(".content-main-edit").scrollTop();
				curelement.css("top",top+"px");
				//刷新缩略图
				sceneThumbnail();
			}
		}
		return stocktable;
	}
	
	//刷新股票编辑区(stock)
	function refreshStockDataEditInfo(obj){
		if(!obj){
			obj = curelement;
		}

		//列表或单股
		var isList = obj.attr("isList");
		var isListHtml = $(".stock_edit .curelechange[param='isList']").siblings(".dropdown-menu").find(".dropdown-menu-sel span[val='"+isList+"']").html();
		$(".stock_edit .curelechange[param='isList']").attr("val",isList).html(isListHtml);
        		
		//市场
		var bazaar = obj.attr("bazaar");
		var bazaarHtml = $(".stock_edit .curelechange[param='bazaar']").siblings(".dropdown-menu").find(".dropdown-menu-sel span[val='"+bazaar+"']").html();
		$(".stock_edit .curelechange[param='bazaar']").attr("val",bazaar).html(bazaarHtml);
		
		//切换频率
		var switchtime = parseInt(obj.attr("switchtime"));
		$(".stock_edit .curelechange[param='switchtime']").val(switchtime);
		
		//字体大小
		var selfontsize = obj.attr("selfontsize");
		$(".stock_edit .curelechange[param='selfontsize']").val(selfontsize);

		//行数
		var sellinenum = obj.attr("sellinenum");
		$(".stock_edit .curelechange[param='sellinenum']").attr("val",sellinenum).html(sellinenum);

		//背景颜色
		var selbgcolor = obj.attr("selbgcolor");
		$(".stock_edit .curelechange[param='selbgcolor']").attr("val",selbgcolor).css("background-color",selbgcolor);

		//表格颜色
		var seltablecolor = obj.attr("seltablecolor");
		$(".stock_edit .curelechange[param='seltablecolor']").attr("val",seltablecolor).css("background-color",seltablecolor);
	
  		$(".stockmask").remove();
		if(isList === "1"){
            $(".op-label-item.stock-list").removeClass("disable");
            $(".op-label-item.single-stock").addClass("hide");  
    		//股票代码
    		$(".stock_edit .stock-code-input").val("");
        }else{
            $(".op-label-item.single-stock").removeClass("hide"); 
            $(".op-label-item.stock-list").addClass("disable");
    		//股票代码
    		$(".stock_edit .stock-code-input").val(obj.attr("code"));
			if($(".stockmask").length == 0){
				$(".stock_edit .stock-list-switchtime").before(pmask(null,"stockmask",$(".stock_edit .stock-list-switchtime"),'0',{"height":10,"width":20},1));
				$("#stock-switchFreq-btn-label").val("");
				$(".stock_edit .stock-list-sellinenum").before(pmask(null,"stockmask",$(".stock_edit .stock-list-sellinenum"),'0',{"height":10,"width":20},1));
				$("#stock-lines-btn-label").html(" ");
				//$("#text-duration-btn-label").attr("val",0).html("无");
			}
        }   
	}
    
	//初始化汇率选择(exchange)
	var initExchangeUlFlag = false;
	function initExchangeUl(){
		if(!initExchangeUlFlag){
			initExchangeUlFlag = true;
			var obj = $(".targetcurrency .dropdown-menu-ul");
			if(obj.hasClass("notinit")){
				obj.removeClass("notinit");
				var result = exchangeDataRecord.exchangeData.result;
				for(var i=0;i<result.length;i++){
					var r = result[i];
					for(var key in r){
						obj.append("<li class='dropdown-menu-self select-span' val="+key+"><div class='opentree text-left'><div class='select-img'></div> <span class='select-name'>"+key+"</span></div></li>");
					}
				}
			}
			initExchangeUlFlag = false;
		}
	}
	
    //切换汇率的样式类型(exchange)
    $(".exchageStyle").on("click",function(){
        $(this).addClass("active").siblings().removeClass("active");
        curelement.attr("selstyle",$(this).attr("val"));
        getExchange(curelement,false);
    });
	
	//切换频率/字体大小/每屏行数/表格颜色/背景颜色(exchange)
	$(".exchange_edit .curelechange").on("change",function(e){
		var obj = $(this);
		var val = null;
		if(obj.is("input")){
			val = $(this).val();
			var minval = obj.attr("minval");
			if(minval){
				var v = parseInt(val);
				if(val.length == 0 || isNaN(v)||v < parseInt(minval)){
					val = minval;
					$(this).val(val);
				}
			}
		}else{
			val = $(this).attr("val");
		}
		var isrefresh = $(this).attr("isrefresh");
		var param = $(this).attr("param");
		curelement.attr(param,val);
		if(isrefresh === "1"){
			getExchange(curelement,false);
		}
	});
	
	//目标货币触发事件(exchange)
	$(".targetcurrency button").on("click",function(e){
		var targetcurrency = $(".targetcurrency");
		if(targetcurrency.hasClass("open")){
			targetcurrency.removeClass("open");
		}else{
			targetcurrency.addClass("open");
			$(".targetcurrency .dropdown-menu-ul").one("blur",function(){
				targetcurrencyblur();
			});
			$(".targetcurrency .dropdown-menu-ul").focus();
		}
	});
	
	//目标货币失去焦点(exchange)
	function targetcurrencyblur(){
		var selfs = $(".targetcurrency .dropdown-menu-ul .dropdown-menu-self.active");
		var target = "";
		if(selfs.length > 0){
			var value = [];
			var names = [];
			selfs.each(function(){
				var obj = $(this);
				value.push(obj.attr("val"));
			});
			target = value.join(",");
			curelement.attr("target",target);
			getExchange(curelement,false);
		}else{
			var obj = $(".targetcurrency .dropdown-menu-ul .dropdown-menu-self:first");
			obj.addClass("active");
			target = obj.attr("val");
			curelement.attr("target",target);
			getExchange(curelement,false);
		}
		$(".targetcurrency").removeClass("open");
		targetcurrencyeditupdate();
	}
	
	//根据汇率元素更新编辑区的目标(exchange)
	function targetcurrencyeditupdate(){
		var selfs = $(".targetcurrency .dropdown-menu-ul .dropdown-menu-self.active");
		var target = "";
		if(selfs.length > 0){
			var value = [];
			var names = [];
			selfs.each(function(){
				var obj = $(this);
				value.push(obj.attr("val"));
				names.push(obj.find(".select-name").html())
			});
			$("#exchange-targetCurrency-btn-label").attr("val",target).html(names.join(","));
		}else{
			var obj = $(".targetcurrency .dropdown-menu-ul .dropdown-menu-self:first");
			obj.addClass("active");
			target = obj.attr("val");
			$("#exchange-targetCurrency-btn-label").attr("val",target).html(obj.find(".select-name").html());
		}
	}
	
	//目标货币触发事件(exchange)
	$(".targetcurrency .dropdown-menu-ul .dropdown-menu-self").on("click",function(){
		var obj = $(this);
		if(obj.hasClass("active")){
			obj.removeClass("active");
		}else{
			obj.addClass("active");
			if(obj.attr("val") === "def"){
				obj.siblings().removeClass("active");
			}else{
				obj.siblings(".dropdown-menu-self[val='def']").removeClass("active");
			}
		}
	});

	//汇率初始化(exchange)
	function exchangeinit(){	
		total++;
		var add = $("<div id='exchange_"+total+"' class='exchange element' title='' from='exchange_edit' style='left:0px;top:0px;z-index:"+total+";position:absolute;'></div>");	
		//设置默认值
		$(add).attr({
			"fontRatio":0.008,
			"selstyle":"1",
			"target":"def",
			"switchtime":"15",
			"selfontsize":"24",
			"sellinenum":"10",
			"selbgcolor":"#FFFFFF",
			"seltablecolor":"#000000",
		}).css({"width":"220px","height":"200px"});
		getExchange(add,true);
		refreshExchangeEditInfo(add);
	}	
	
	//刷新汇率控件元素显示(exchange)
	var exchangeDataRecord = {};
	function getExchange(curExchange,isNew,notSave){
		if(!curExchange){
			curExchange = curelement;
		}
		var datekey = dateStr(null,"ymd")+"";

		var exchangeData = null;
		if(exchangeDataRecord.ymd == datekey){
			//当天缓存汇率的数据
			exchangeData = exchangeDataRecord.exchangeData;
		}
		
		if(exchangeData){
			console.log("获取历史汇率数据");
			var exchangetable=drawExchangeTable(curExchange,notSave,isNew);
			exchangeInfo(exchangeData, curExchange, isNew,notSave,exchangetable);
			refreshExchangeEditInfo(curExchange);
			initExchangeUl();
		}else{
			console.log("重新获取汇率数据");
			var exchangetable=drawExchangeTable(curExchange,notSave,isNew);
			$.ajax({
				url:"/apm-web/f/common/apiStore",
				dataType:"jsonp",
				jsonp:'jsonpcallback',
				data:{"type":1,"uri":"http://web.juhe.cn:8080/finance/exchange/rmbquot"},
				success:function(data){
					exchangeData = data;
					exchangeInfo(data, curExchange, isNew,notSave,exchangetable);
					exchangeDataRecord = {"exchangeData":exchangeData,"ymd":datekey};
					refreshExchangeEditInfo(curExchange);
					initExchangeUl();
				},error:function(){

				}
			});
		}
	}
	
	//生成汇率控件元素内容(exchange)
	function exchangeInfo(obj,curExchange,isNew,notSave,exchangetable){
		//目标货币
		var target = curExchange.attr("target")+",";
		//样式类型
		var selstyle = curExchange.attr("selstyle");
		//背景颜色
		var selbgcolor = curExchange.attr("selbgcolor");
		//表格颜色
		var seltablecolor = curExchange.attr("seltablecolor");
		//行数
		var sellinenum = parseInt(curExchange.attr("sellinenum"));
		var rs = obj.result;
		var result = [{}];
		if(target && target != "def,"){
			//过滤出要求的数据
			for(var i=0;i<rs.length;i++){
				var r = rs[i];
				for(var key in r){
					if(target.indexOf(key+",") > -1){
						result[0][key] = r[key];
					}
				}
			}
		}else{
			result = rs;
		}
		var trcss = "";
		var thtrcss = "";
		thtrcss += "background-color:"+seltablecolor+";";
		trcss += "border-top:1px solid "+seltablecolor+";";
		var j = 0;
		if(selstyle === "1"){
			if(programLanguage.indexOf("zh") === 0){
				exchangetable.append("<tr class='head' style='"+thtrcss+"'><th>货币名称</th><th>买入价</th><th>卖出价</th></tr>");
			}else{
				exchangetable.append("<tr class='head' style='"+thtrcss+"'><th>name</th><th>buy</th><th>sell</th></tr>");
			}
			for(var i=0;i<result.length;i++){
				var r = result[i];
				for(var key in r){
					if(sellinenum > j){
						exchangetable.append("<tr style='"+trcss+"'><td>"+key+"</td><td class='buy'>"+r[key].fBuyPri+"</td><td class='sell'>"+r[key].fSellPri+"</td></tr>");
						j++;
					}
				}
			}
		}else if(selstyle === "2"){
			for(var i=0;i<result.length;i++){
				var r = result[i];
				for(var key in r){
					if(sellinenum > j){
						exchangetable.append("<tr style='"+trcss+"'><td>"+key+"</td><td class='buy'>"+r[key].fBuyPri+"</td><td class='sell'>"+r[key].fSellPri+"</td></tr>");
						j++;
					}
				}
			}
		}else{
			if(programLanguage.indexOf("zh") === 0){
				exchangetable.append("<tr class='head' style='"+thtrcss+"'><th>货币名称</th><th>现汇买入</th><th>现钞买入</th><th>现汇卖出</th><th>银行折算</th><th>发布时间</th></tr>");
			}else{
				exchangetable.append("<tr class='head' style='"+thtrcss+"'><th>name</th><th>spot buy</th><th>cash buy</th><th>spot sell</th><th>bank discount</th><th>release time</th></tr>");
			}
			for(var i=0;i<result.length;i++){
				var r = result[i];
				for(var key in r){
					if(sellinenum > j){
						exchangetable.append("<tr style='"+trcss+"'><td>"+key+"</td><td class=''>"+r[key].fBuyPri+"</td><td class=''>"+r[key].mBuyPri+"</td><td class=''>"+r[key].fSellPri+"</td><td class=''>"+r[key].bankConversionPri+"</td><td class=''>"+r[key].time+"</td></tr>");
						j++;
					}
				}
			}
		}
		//刷新缩略图
		sceneThumbnail();
		//控制元素框大小
		minwh(curExchange);
	}
	
	//数据未获取前绘制汇率表格
	function drawExchangeTable(curExchange,notSave,isNew){
		//背景颜色
		var selbgcolor = curExchange.attr("selbgcolor");
		var tablecss = "";
		//切换频率
		var switchtime = parseInt(curExchange.attr("switchtime"));
		//字体大小
		var selfontsize = parseInt(curExchange.attr("selfontsize"));
		var fontRatio = parseFloat(curExchange.attr("fontRatio"));
		tablecss += "font-size:"+(0.7+(selfontsize*fontRatio))+"em;";
		//tablecss += "font-size:"+selfontsize*fontRatio+"em;";
		tablecss += "background-color:"+selbgcolor+";";
		//表格颜色
		var seltablecolor = curExchange.attr("seltablecolor");
		tablecss += "border:1px solid "+seltablecolor+";";
		var exchangetable =  $("<table class='exchangetable minwh' style='"+tablecss+"'></table>");
		if(!notSave){
			if(!isNew){
				curExchange.find(".exchangetable").remove();
				curExchange.append(exchangetable);
				curExchange.removeClass("active");
				curExchange.mousedown();
			}else{
				curExchange.append(exchangetable);
				var frameOverlay = $('<div class="frameOverlay"></div>');
				curExchange.append(frameOverlay);
				draginitfn(curExchange);
				resizeinitfn(curExchange);			
				curScene.append(curExchange);

				curelement = curExchange;
				curelement.mousedown();

				//更新元素位置在当前可视范围内
				var top = $(".content-main-edit").scrollTop();
				curelement.css("top",top+"px");
			}
		}
		return exchangetable;
	}
	
	//刷新汇率编辑区(exchange)
	function refreshExchangeEditInfo(obj){
		if(!obj){
			obj = curelement;
		}

		//样式类型
		if(obj.attr("selstyle")){
			$(".exchange_edit .exchageStyle[val='"+obj.attr("selstyle")+"']").addClass("active").siblings().removeClass("active");
		}

		//目标货币
		var target = obj.attr("target");
		var targets = [];
		if(!target){
			targets.push("def");
		}else{
			targets = target.split(",");
		}
		$(".exchange_edit .targetcurrency .select-span").removeClass("active");
		for(var i=0;i<targets.length;i++){
			$(".exchange_edit .targetcurrency .select-span[val='"+targets[i]+"']").addClass("active");
		}
		targetcurrencyeditupdate();
		
		//切换频率
		var switchtime = parseInt(obj.attr("switchtime"));
		$(".exchange_edit .curelechange[param='switchtime']").val(switchtime);

		//字体大小
		var selfontsize = obj.attr("selfontsize");
		$(".exchange_edit .curelechange[param='selfontsize']").val(selfontsize);

		//行数
		var sellinenum = obj.attr("sellinenum");
		$(".exchange_edit .curelechange[param='sellinenum']").attr("val",sellinenum).html(sellinenum);

		//背景颜色
		var selbgcolor = obj.attr("selbgcolor");
		$(".exchange_edit .curelechange[param='selbgcolor']").attr("val",selbgcolor).css("background-color",selbgcolor);

		//表格颜色
		var seltablecolor = obj.attr("seltablecolor");
		$(".exchange_edit .curelechange[param='seltablecolor']").attr("val",seltablecolor).css("background-color",seltablecolor);
	}
    
	//流媒体初始化(streamMedia)
	function streamMediainit(){
		total++;
		var add = $("<div id='streamMedia_"+total+"' class='element active streamMedia' title='' from='streamMedia_edit' style='top:0px;left:0px;display:block;position:absolute;z-index:"+total+";'><img src='' style='width:100%;height:100%'></div>");
		//设置默认值
		$(add).attr({
			"source":"",
			"name":"",
			"attrid":"",
		}).css({"width":"200px","height":"200px"});
		draginitfn($(add));
		resizeinitfn($(add));
        curScene.append(add);
        $(add).mousedown();
		//更新元素位置在当前可视范围内
		var top = $(".content-main-edit").scrollTop();
		add.css("top",top+"px");
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下)
		sceneThumbnail();
	}	
	
	//增加流媒体控件元素(streamMedia)
	function addstreamMedia() {
		if(!isHasVsAndTip()){
			return ;
		}
		if(curScene.find(".streamMedia").length == 0 ){
			streamMediainit();		
			openmateriallibrary();
		}else{
			curScene.find(".streamMedia").mousedown();
		}
	}
	
	//检测是否有填名字(streamMedia)
	$(".streamMediabox-input-name").on("input propertychange",function(){
		$(this).parent().find(".hint-red").remove();
		if($(this).val().length<1){
			$(this).parent().append("<div class='streamMediabox-hint hint-red'>"+$.i18n.prop("resWebPage.pleaseInputPageName")+"</div>");
		}
	});
	
	//增加流媒体元素(streamMedia)
	$(".streamMediaboxconfirm").on("click",function(){
		var flag = true;
		var inputDiv = $(".streamMediabox-input-div");
/*		if(inputDiv.find(".hint-red,.hint-blue").length < 1){
			console.log("streamMediaboxconfirm2");
			if($(".streamMediabox .http-detection").hasClass("color-gray")){
				console.log("streamMediaboxconfirm3");
				inputDiv.append("<div class='streamMediabox-hint hint-red'>"+$.i18n.prop("progForm.pleaseCheckWebPage")+"</div>");
			}else{
				console.log("streamMediaboxconfirm4");
				httpdetectionAutoAffirm = true;
				$(".streamMediabox .http-detection").click();
			}
			console.log("streamMediaboxconfirm5");
			flag = false;
		}*/
		var inputNameDiv = $(".streamMediabox-input-name");
		if(inputNameDiv.val().length<1){
			inputNameDiv.parent().find(".hint-red").remove();
			inputNameDiv.parent().append("<div class='streamMediabox-hint hint-red'>"+$.i18n.prop("resWebPage.pleaseInputPageName")+"</div>");
			flag = false;
		}
		if(flag && curelement != null){
		//if(flag && curelement != null && inputDiv.find(".hint-blue").length == 1){
			var input = $(".streamMediabox-input").val();
			var inputName = inputNameDiv.val();
			
			//保存流媒体数据到数据库
			$.ajax({
				url:"/apm-web/a/streamMedia/ajaxNewStreamMedia",
				dataType:"text",
				data:{"path":input,"name":inputName},
				async:false,
				success:function(data){
					if(data != "fail"){
						var mrow = $(".material-modal.cur-modal .m-row");
						 if(mrow.length == 0){
							 var materialRight = $(".material-modal.cur-modal").find(".material-right.pull-right");
							 materialRight.prepend("<div class='material-mainer'><div class='m-row' pagesize='12'>").find(".notFoundData").remove();
							 mrow = materialRight.find(".m-row");
						 }
						var divHtml = "<div class='material-item up-modal-m-i only-one'>"+
			       	  	"<div class='thumbnail'>"+
			       	  		"<div class='thumbnail-upload'>"+
								 "<img class='bgimg' src='/apm-web/static/images/program/streamMediaModal.png' source='"+input+"' alt='"+inputName+"' attrid='"+data.id+"'>"+
							"</div>"+
					    "</div>"+
					    "<div class='caption'>"+
							"<h3 class='ellipsis' data-toggle='tooltip' data-placement='right' title='"+inputName+"'>"+inputName+"</h3>"+			        
					    "</div>"+
					    "<div class='material-check'></div>"+
					   "</div>";
						mrow.prepend(divHtml);
						//已上传的图片显示超过当页数量的隐藏掉
						if(mrow.find(".material-item:visible").length>parseInt(mrow.attr("pagesize"))){
							mrow.find(".material-item.up-modal-m-i:visible:last").hide();
						}
					}else{
						top.$.jBox.tip($.i18n.prop("progForm.createWebpageMaterialFail"),'warning');
					}
				},error:function(){
					top.$.jBox.tip($.i18n.prop("progPublishSet.connectException"),'warning');
				}
			});
			$("#contextmenu-mask").remove();
			$(".streamMediabox").remove();
			$(".material-modal.cur-modal").removeClass("cur-modal").modal("show");
		}
	});
	
	//移除流媒体(streamMedia)
	$(".streamMedia_edit .delstreamMedia").on("click",function(){
		curelement.removeAttr("source").removeAttr("name").removeAttr("attrid");
		updatestreamMediaWrap();
	});
	
	//刷新流媒体编辑区(streamMedia)
	function updatestreamMediaWrap(obj){
		if(!obj){
			obj = curelement;
		}
		var source = obj.attr("source");
		var streamMediaWrap = $(".streamMedia_edit .streamMedia_wrap");
		if(source && source.length > 0){
			$(".streamMedia_edit .add-item-hl").hide();
			streamMediaWrap.find(".streamMedia_img_item_name").html(obj.attr("name")).attr("title",obj.attr("name"));
			streamMediaWrap.find(".streamMedia_img_item_url").html(obj.attr("source"));
			streamMediaWrap.find(".streamMedia_img_item_img").attr("attrid",obj.attr("attrid"));			
			streamMediaWrap.show();
			//移除功能开启
			$(".streamMedia_edit .delstreamMedia").removeClass("color-gray");
		}else{
			//增加添加提醒
			streamMediaWrap.hide();
			//.append("<div class='tip-add'><div class='tip-add-img'></div><div class='tip-add-text'>"+$.i18n.prop("progForm.addWebpageInfo")+"</div></div>");
			$(".streamMedia_edit .add-item-hl").show();
			//移除功能关闭
			$(".streamMedia_edit .delstreamMedia").addClass("color-gray");
		}

		updateShowSize();
	}
	
	//记录选中的流媒体对象(streamMedia)
	function streamMediaSelected(selectObj){
		var obj = selectObj.find("img");
		var source = obj.attr("source");
		var name = obj.attr("alt");
		var attrid = obj.attr("attrid");
		var type = "streamMedia";
		var long = 30;
		return {"type":type,"source":source,"name":name,"attrid":attrid,"long":long};
	}
	
	//确认添加选中流媒体到流媒体控件中(streamMedia)
	//$("#streamMediaModal").find(".confirm").live("click",function(){
	$("#streamMediaModal").on("click",".confirm",function(){
		//判断是否有选中素材
		if($("#streamMediaModal .up-modal-m-i.active").length == 0){
			top.$.jBox.tip($.i18n.prop("progForm.pleaseThroughClickToSelectMaterial"));
			return;
		}
		//设置视频数据到元素中
		var streamMediaimg = $("#streamMediaModal").find(".up-modal-m-i.active img");
		curelement.attr("source",streamMediaimg.attr("source")).attr("name",streamMediaimg.attr("alt")).attr("attrid",streamMediaimg.attr("attrid"));
		
		//隐藏和取消已选中样式
		streamMediaimg.parents(".material-item.up-modal-m-i").removeClass("active");
		$("#streamMediaModal").modal("hide");

		//更新流媒体编辑区
		updatestreamMediaWrap();
		//随时缩略图
		sceneThumbnail();
	});
	
	//是否支持天气获取(weather)
	function weatherIsSupport(){
		if(isSupportWeatherFlag == null){
			isSupportWeatherFlag = false;
			$.ajax({
				url:"/apm-web/f/common/isSupportWeather",
				dataType:"text",
				async:false,
				//data:{"city":"北京","language":"zh-Hans"},
				//jsonp:'jsonpcallback',
				success:function(data){
					if(data && data === "true"){
						isSupportWeatherFlag = true;
					}
				},error:function(){
				}
			});
		}
		return isSupportWeatherFlag;
	}
	
	//天气初始化(weather)
	function weatherinit(){	
		total++;
		var add = $("<div id='weather_"+total+"' class='weather element' title='' from='weather_edit' style='font-size:12px;left:0px;top:0px;z-index:"+total+";position:absolute;'></div>");	
		//设置默认值
		$(add).attr({
			"selstyle":"1",
			"cnty":"",
			"province":"",
			"seltqcolor":"#65A7F3",
			"selcounty":"",
			"selcolor":"#666666",
			"transparent":"0",
			"selbgcolor":"#FFFFFF",
			"selsize":"",
		}).css({"width":"240px","height":"110px"});
		getTQ(add,true);
	}	

	/**
	 * 根据城市名获取新天气(weather)
	 */
	var cityWeatherData = {}; 
	function getTQ(curWeather,isNew){
		if(!curWeather){
			curWeather = curelement;
		}
		var datekey = dateStr(null,"ymd")+"";
		var city = curWeather.attr("selcity");
		if(!city || city == "0"){
			//city = "北京";
			tqInfo(null, curWeather, isNew);
			refreshTqEditInfo(curWeather);
		}else{
			var citydata = null;
			var da = cityWeatherData[city]; 
			if(da){
				if(da.ymd == datekey){
					//当天缓存天气的数据
					citydata = da.citydata;
				}
			}
			if(citydata){
				console.log("获取历史天气数据");
				tqInfo(citydata, curWeather, isNew);
				refreshTqEditInfo(curWeather);
			}else{
				console.log("重新获取天气数据");
				$.ajax({
					//url:"http://auth.gzxbh.com:8088/apmserver-web/f/model/weather",
					url:"/apm-web/f/common/weather",
					//url:"/apm-web/a/program/requestWeather",
					dataType:"jsonp",
					//dataType:"jsonp",
					data:{"city":city,"language":"zh-Hans"},
					jsonp:'jsonpcallback',
					success:function(data){
						console.log("city-data:"+data);
						console.log(data);
						tqInfo(data, curWeather, isNew);
						cityWeatherData[city] = {"citydata":data,"ymd":datekey};
						refreshTqEditInfo(curWeather);
					},error:function(){
						//我们服务器获取不到数据直接访问中国天气网
/*						$.ajax({
							url:"http://wthrcdn.etouch.cn/weather_mini?city="+city,
							dataType:"jsonp",
							success:function(data){
								tqInfo(data, curWeather, isNew);
								cityWeatherData[city] = {"citydata":data,"ymd":datekey};
								refreshTqEditInfo(curWeather);
							}
						});*/
					}
				});
			}
		}
	}
	
	//生成天气元素内容(weather)
	function tqInfo(obj,curWeather,isNew){
		//size
		var fontsize = 9;
		var icosize = 24;
		var selsize = parseInt(curWeather.attr("selsize"));
		if(!selsize){
			selsize = 1; 
		}
		//bg color
		var bgcolorstr = null;
		var bgcolor = curWeather.attr("selbgcolor");
		var transparent = curWeather.attr("transparent");
		if(!bgcolor||transparent == '1'){
			bgcolorstr = ""; 
		}else{
			bgcolorstr = "background-color:"+bgcolor+";";
		}
		//txt color
		var color = curWeather.attr("selcolor");
		if(!color){
			color = "#000000"; 
		}
		var tqtable =  $("<div class='tqtable' style='font-size:1em;color:"+color+";"+bgcolorstr+"'></div>");
		//style
		var style = curWeather.attr("selstyle");
		if(!style){
			style = "1";
		}
		var city = curWeather.attr("selcity");
		if(!city || city == "0"){
			//city = "北京";
			tqtable=$("<img class='tqtable' style='width:100%;height:100%' tqstyle='"+style+"'></img>");
		}else{
			var i = 0;
			var datekey = dateStr(null,"y-m-d").trim();
			for(;i<obj.weathers.length;){
				if(obj.weathers[i].dateStr.trim() === datekey){
					break;
				}else{
					i++;
				}
			}
			if("1" == style){
				var tqrow = $("<div class='row weatherstyle1'></div>");
				tqrow.append("<div class='cell'><div class='tqcity'>"+getCityName(obj.cityName)+"</div></div>");
				tqrow.append("<div class='cell'>" +
								"<div class='tqdate'>"+obj.weathers[i].dateStr+"</div>" +
							"</div>"+
							"<div class='cell'>" +
								"<div class='tqtype'>"+getTqState(obj.weathers[i].state)+"</div>" +
							"</div>" +
							"<div class='cell'>" +
								"<div class='tqtemperature'>"+obj.weathers[i].temp+"</div>" +
							"</div>");
				tqtable.append(tqrow);
				tqtable.attr("height","100%");
			}else if("2" == style){
				var tqrow = $("<div class='row weatherstyle2'></div>");
				/*tqrow.append("<div class='cell'><div class='tqcity'>"+obj.city+"</div></div>");*/
				tqrow.append("<div class='cell'>" +
								"<div class='tqtype'>" +
									getTqImg(obj.weathers[i].state)+"" +
								"</div>" +
							 "</div>" +
							 "<div class='cell'>" +
							 	"<div class='tqdate'>"+obj.weathers[i].temp+"&nbsp;"+getTqState(obj.weathers[i].state)+"</div>" +
							 	"<div class='tqtemperature'>"+getCityName(obj.cityName)+"&nbsp;"+obj.weathers[i].dateStr+"</div>" +
							 "</div>");
				tqtable.append(tqrow);
				tqtable.attr("height","100%");
			}else if("3" == style){
				var tqrow = $("<div class='row weatherstyle3'></div>");
				/*tqrow.append("<div class='cell'><div class='tqcity'>"+obj.city+"</div></div>");*/
				var day = null;
				var daystrs = [];
				if(programLanguage.indexOf("zh") == 0){
					daystrs.push("今天");
					daystrs.push("明天");
					daystrs.push("后天");
				}else{
					daystrs.push("one");
					daystrs.push("two");
					daystrs.push("three");
				}
				if(i + 3 >= obj.weathers.length){
					i = obj.weathers.length-3;
				}
				for(var n=0;i<obj.weathers.length&&n<3;i++,n++){
					day = daystrs[n];
					tqrow.append("<div class='cell'>" +
									"<div class='tqcity'>"+day+"&nbsp;"+getCityName(obj.cityName)+"</div>"+
									"<div class='tqtype'>" +
										getTqImg(obj.weathers[i].state)+"</div>" +
										"<div class='tqtemperature'>"+obj.weathers[i].temp+"</div>" +
									 	"<div class='tqdate'>"+getTqState(obj.weathers[i].state)+"</div>" +
								 "</div>");
				}
				tqtable.append(tqrow);
				tqtable.attr("height","100%");
			}
			//tq color
			var tqcolor = curWeather.attr("seltqcolor");
			if(!tqcolor){
				tqcolor = "#65A7F3"; 
			}
			tqtable.find(".tqtype .tqico").css("color",tqcolor);
		}
		
		if(!isNew){
			curWeather.find(".tqtable").remove();
			curWeather.append(tqtable);
			curWeather.removeClass("active");
			//curelement = null;
			curWeather.mousedown();
			//刷新缩略图
			sceneThumbnail();
			//curelement = curWeather;
			//curelement.dblclick();
			//curelement = curWeather;
		}else{
			curWeather.append(tqtable);
			var frameOverlay = $('<div class="frameOverlay"></div>');
			curWeather.append(frameOverlay);
			draginitfn(curWeather);
			//curWeather.draggable({containment: ".content-center"});
			resizeinitfontfn(curWeather,weather_wratio,weather_hratio);
/*			curWeather.resizable({
				containment: ".content-center",
				resize:function(event, ui){
					//var height = ui.size.height;
					//var width = ui.size.width;
					ui.element.css("font-size",(ui.size.width*0.05)+"px");
					//随时缩略图
					sceneThumbnail("NOT_SAVE_HIS");
				},
				handles: "n, e, s, w, ne, se, sw, nw",
				start:function(event, ui){
					if(curelement == null || !isNolock()){
						$(obj).droppable( 'enable' ); 
					}
				},					   
			    stop:function(event, ui) {
				    //随时缩略图(因为想更新缩略图的时候存上一步、下一步的缓存，所以拖拽元素结束的时候更新缩略图)
				    sceneThumbnail();
			    }
			});*/
			
			curScene.append(curWeather);
			//curWeather.removeClass("active");
			//curScene.click();
			//curelement = null;
			curelement = curWeather;
			curelement.mousedown();
			//curelement = curWeather;
			//curWeather.click();
			//更新元素位置在当前可视范围内
			var top = $(".content-main-edit").scrollTop();
			curelement.css("top",top+"px");
			//刷新缩略图
			sceneThumbnail();
		}
	}

	Date.prototype.Format = function (fmt) { //author: meizz 
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
	
	/**
	 * 根据传入字符串返回img,如果找不到img则返回传入字符串
	 */
	function getTqImg(type){
		//return "<img style='width:100%;height:auto;' src='/apm-web/static/images/tq/"+type+".png' alt='"+type+"'></img>";
		var tgico = tqicoMap[type];
		if(!tgico){
			if(type.indexOf("雷")>=0||type.indexOf("Thunder")>=0){
				tgico = "&#xe61f;";
			}else if(type.indexOf("雨")>=0||type.indexOf("Rain")>=0){
				tgico = "&#xe61b;";
			}else if(type.indexOf("雪")>=0||type.indexOf("Snow")>=0){
				tgico = "&#xe616;";
			}else if(type.indexOf("风")>=0||type.indexOf("Gale")>=0||type.indexOf("Breeze")>=0){
				tgico = "&#xe60c;";
			}else if(type.indexOf("Sunny")>=0){
				tgico = "&#xe609;";
			}else {
				tgico = "&#xe61b;";
			}
		}
		return "<i class='icon iconfont tqico'>"+tgico+"</i>"
	}	
	
	
	
	//增加汇率(exchange)
	function addexchange(){
		if(curScene.find(".exchange").length == 0 ){
			exchangeinit();		
		}else{
			curScene.find(".exchange").mousedown();
		}
	}	
	
	//增加股票(stock)
	function addstock(){
		if(curScene.find(".stock").length == 0 ){
			stockinit();		
		}else{
			curScene.find(".stock").mousedown();
		}
	}
	
	//增加汽车班次(numberofruns)
	function addnumberofruns(){
		if(curScene.find(".numberofruns").length == 0 ){
			numberofrunsinit();		
		}else{
			curScene.find(".numberofruns").mousedown();
		}
	}
	
	//增加地图(map)
	function addmap(){
		if(curScene.find(".map").length == 0 ){
			mapinit();		
		}else{
			curScene.find(".map").mousedown();
		}
	}	

	//触发缩略图(公用)
	$("#sceneThumbnail").on("click",function(){
		sceneThumbnail();
	});
	
	//编辑修改天气样式(weather)
	$(".selstyle").on("click",function(){
		var obj = $(this);
		if(!obj.hasClass("active")){
			obj.addClass("active").siblings().removeClass("active");
			curelement.attr("selstyle",obj.attr("selstyle"));
			getTQ(curelement,false);
		}
	});
	
	//编辑修改天气城市(weather)
	//$(".weather_edit .city").live("change",function(){
	$(document).on("change",".weather_edit .city",function(){
		var city = $(this).attr("val");
		if(city && city.length > 0){
			curelement.attr("selcity",$(this).attr("val"));
			curelement.attr("province",$(".weather_edit .province").attr("val"));
			curelement.attr("cnty",$(".weather_edit .cnty").attr("val"));
			getTQ(curelement,false);
		}
	});
	
	//修改天气颜色(weather)
	//$(".weather_edit .tqcolor").live("change",function(){
	$(document).on("change",".weather_edit .tqcolor",function(){
		curelement.attr("seltqcolor",$(this).attr("val"));
		getTQ(curelement,false);
	});

	//修改字体颜色(weather)
	//$(".weather_edit .txtcolor").live("change",function(){
	$(document).on("change",".weather_edit .txtcolor",function(){
		curelement.attr("selcolor",$(this).attr("val"));
		getTQ(curelement,false);
	});
	
	//修改背景是否透明(weather)
	//$(".weather_edit .transparent").live("change",function(){
	$(document).on("change",".weather_edit .transparent",function(){
		curelement.attr("transparent",$(this).attr("val"));
		getTQ(curelement,false);
/*		if($(this).attr("val") == "1"){
			curelement.attr("transparent","1");
			curelement.css("background-color","transparent");
		}else{
			curelement.attr("transparent","0");
			curelement.css("background-color",curelement.attr("bgcolor"));
		}*/
	});
	
	//修改背景颜色(weather)
	//$(".weather_edit .bgcolor").live("change",function(){
	$(document).on("change",".weather_edit .bgcolor",function(){
		curelement.attr("selbgcolor",$(this).attr("val"));
		getTQ(curelement,false);
	});

	//编辑修改天气样式(weather)
	//$("#selsize").live("change",function(){
	$(document).on("change","#selsize",function(){
		curelement.attr("selsize",$(this).attr("val"));
		getTQ(curelement,false);
	});
	
	//刷新天气编辑区(weather)
	function refreshTqEditInfo(obj){
		if(!obj){
			obj = curelement;
		}

		//样式类型
		if(obj.attr("selstyle")){
			$(".weather_edit .selstyle[selstyle='"+obj.attr("selstyle")+"']").addClass("active").siblings(".active").removeClass("active");
		}

		//国家、区域、城市
		var cntyName = obj.attr("cnty");
		var provinceName = obj.attr("province");
		var cityName = obj.attr("selcity");
		
		if(!cntyName || cntyName === ''){
			$(".weather_edit .cnty").attr("val","").html($.i18n.prop("progForm.pleaseSelectCnty"));
			$(".weather_edit .province-item,.weather_edit .city-item").hide();
		}else{
			set_cnty(cntyName);
			if(provinceName && provinceName.length > 0){
				if(cityName && cityName.length > 0){
					set_province(provinceName,cityName);
				}else{
					set_province(provinceName,null);
				}
			}else{
				$(".weather_edit .city-item").hide();
			}
		}

		//天气颜色
		if(obj.attr("seltqcolor")){
			$(".weather_edit .tqcolor").attr("val",obj.attr("seltqcolor")).css("background-color",obj.attr("seltqcolor"));
		}
		//字体颜色 txtcolor
		if(obj.attr("selcolor")){
			$(".weather_edit .txtcolor").attr("val",obj.attr("selcolor")).css("background-color",obj.attr("selcolor"));
		}
		//背景透明
		if(obj.attr("transparent")){
			var transparenthtml = $(".weather_edit .transparent").parent().find(".dropdown-menu-sel span[val='"+obj.attr("transparent")+"']").html();
			$(".weather_edit .transparent").attr("val",obj.attr("transparent")).html(transparenthtml);
		}
		//背景颜色 selbgcolor
		if(obj.attr("selbgcolor")){
			$(".weather_edit .bgcolor").attr("val",obj.attr("selbgcolor")).css("background-color",obj.attr("selbgcolor"));
		}
/*		if(obj.attr("fontsize")){
			var fontsizelabel = $(".weather_edit .fontsize");
			var fontsizehtml = fontsizelabel.parent().find(".dropdown-menu-sel span[val='"+obj.attr("fontsize")+"']").html();
			fontsizelabel.attr("val",obj.attr("fontsize")).html(fontsizehtml);
		}*/

	}
	
	
	//删除背景图片(back)
	$(".delBackImgBtn").on("click",function(){
		delBackImg(this);
	});
	
	//移除背景图(back)
	function delBackImg(o){
		var obj = null;
		if(!o){
			obj = $(".delBackImgBtn");
		}else{
			obj = $(o);
		}
		//灰字不允许触发功能
		if(!obj.hasClass("color-gray")){
			obj.addClass("color-gray");
			backgroundImgSetting();
			//更新背景编辑区
			updateBackWrap();
			//随时缩略图
			sceneThumbnail();	
		}
	}
	
	//点击背景颜色图标之后为背景添加颜色
	//$(".backg_edit").find(".color_wrap .bgcolor_item").live("click",function(){
	$(".backg_edit").on("click",".color_wrap .bgcolor_item",function(){
		var color = $(this).css("background-color");
		curScene.css("background",color).attr("bgcolor",color);
		$(this).addClass("active").siblings().removeClass("active");
		//给模板加背景颜色的属性
		var index = parseInt(curScene.attr("id").replace(/topfd/,""));		
		$("#tpl_item_"+index).attr("backcolor",color);
		//删除背景图
		$(".delBackImgBtn").click();
		//随时缩略图
		sceneThumbnail();
	});	
	
	//点击元素动作之后，为元素添加动作
	//$(".anim_edit").find(".anim_wrap .anim_item").live("click",function(){
	$(".anim_edit").on("click",".anim_wrap .anim_item",function(){
		console.log("anim_edit 点击添加动作");
		if(curelement != null){
			//console.log(curelement.html());
			//curelement.css("background-color","red");
			//添加动作
			var animClass = $(this).attr("animClass");
			//历史动作
			var rClass = curelement.attr("curanimclass");
			//如果是无效果，清除动作样式
			if(animClass  == "none"){
				curelement.removeClass(rClass).removeClass("animated").removeAttr("curanimclass").removeAttr("animduration");
				$(this).addClass("active").siblings().removeClass("active");
				//计算场景时长
			    sceneLong(curScene);
				return;
			}
			
			//如果不是无效果，则继续往下跑，设置动作样式
			
			//如果之前已经有动作样式，不需要重新设置CLASS animated
			if(!curelement.hasClass("animated")){
				curelement.addClass("animated");
			}
			//设置动作样式
			//curelement.css("animate-duration","2s")
			curelement.removeClass(rClass).addClass(animClass).attr("curanimclass",animClass).attr("animduration",$(".anim-duration").val());
			//设置点中的元素是激活状态(被选中状态)
			$(this).addClass("active").siblings().removeClass("active");
			//看完效果清除样式，避免样式影响
		    setTimeout(function(){
				curelement.removeClass(animClass).removeClass("animated");
		    }, 1000);
		    //计算场景时长
		    sceneLong(curScene);
			//随时缩略图
			//sceneThumbnail();
		}
	});	
	
	//设置元素动作的持续时间
	//$(".anim_edit").find(".anim-duration").live("change",function(){
	$(".anim_edit").on("change",".anim-duration",function(){
		console.log("anim_edit 设置元素动作的持续时间");
		if(curelement != null){
			var rClass = curelement.attr("curanimclass");
			//如果是有动作的，设置持续时间后，自动更改动作持续时间（标记式）
			if(rClass != null && rClass != undefined){
				curelement.attr("animduration",$(this).val());
			    //计算场景时长
			    sceneLong(curScene);
			}
		}
	});	
	
	//点击场景动作之后，为场景添加动作
	//$(".sceneanim_edit").find(".sceneanim_wrap .sceneanim_item").live("click",function(){
	$(".sceneanim_edit").on("click",".sceneanim_wrap .sceneanim_item",function(){
		console.log("sceneanim_edit 点击添加动作");
		if(curScene != null){
			//console.log(curelement.html());
			//curelement.css("background-color","red");

			//添加动作
			var sceneanimClass = $(this).attr("sceneanimClass");
			//历史动作
			var rClass = curScene.attr("cursceneanimclass");
			//如果是无效果，清除动作样式
			if(sceneanimClass  == "none"){
				curScene.removeClass(rClass).removeClass("animated").removeAttr("cursceneanimclass").removeAttr("sceneanimduration");
				$(this).addClass("active").siblings().removeClass("active");
				//计算场景时长
			    sceneLong(curScene);
				return;
			}
			
			//如果不是无效果，则继续往下跑，设置动作样式
			
			//如果之前已经有动作样式，不需要重新设置CLASS animated
			if(!curScene.hasClass("animated")){
				curScene.addClass("animated");
			}
			//设置动作样式
			//curelement.css("animate-duration","2s")
			curScene.removeClass(rClass).addClass(sceneanimClass).attr("cursceneanimclass",sceneanimClass).attr("sceneanimduration",$(".sceneanim-duration").val());
			//设置点中的元素是激活状态（被选中状态）
			$(this).addClass("active").siblings().removeClass("active");
			//看完效果清除样式，避免样式影响
		    setTimeout(function(){
		    	curScene.removeClass(sceneanimClass).removeClass("animated");
		    }, 1000);
		    //计算场景时长
		    sceneLong(curScene);
			//随时缩略图
			//sceneThumbnail();
		}
	});	
	
	//设置场景动作的持续时间
	//$(".sceneanim_edit").find(".sceneanim-duration").live("change",function(){
	$(".sceneanim_edit").on("change",".sceneanim-duration",function(){
		console.log("sceneanim_edit 设置场景动作的持续时间");
		if(curScene != null){
			var rClass = curScene.attr("cursceneanimclass");
			//如果是有动作的，设置持续时间后，自动更改动作持续时间（标记式）
			if(rClass != null && rClass != undefined){
				curScene.attr("sceneanimduration",$(this).val());
			    //计算场景时长
			    sceneLong(curScene);
			}
		}
	});		
	
	//拖动标志清空(公用)
	var backg_tpl_item_dragstart_flag = false;
	var img_item_dragstart_flag = false;
	function clearDragstartFlag(){
		img_item_dragstart_flag = false;
		backg_tpl_item_dragstart_flag = false;
	}
	
	// 开始拖动 编辑区拖动项(公用)
	$(".edit_drag_item").on("dragstart",function(){
		console.log("开始拖动");
		$srcImgDiv = $(this);
		img_item_dragstart_flag = true;
		console.log("$srcImgDiv.offset().top:"+$srcImgDiv.offset().top);
	}); 

	// 拖动到.drop-left,.drop-right上方时触发的事件(公用)
	$(".edit_drag_item").on("dragover", function(event) {
		//必须通过event.preventDefault()来设置允许拖放
		event.preventDefault();
	}); 
	
	// 结束拖动 编辑区拖动项 放开鼠标的事件(公用)
	$(".edit_drag_item").on("drop", function(event) {
		console.log("结束拖动");
		console.log("$(this).offset().top:"+$(this).offset().top+" img_item_dragstart_flag:"+img_item_dragstart_flag);
		event.preventDefault();
		if($srcImgDiv[0] != $(this)[0] && img_item_dragstart_flag) {
			if($(this).offset().top > $srcImgDiv.offset().top){
				$(this).after($srcImgDiv);
			}else{
				$(this).before($srcImgDiv);
			}
			
			//执行回调方法
			var dragtype = $srcImgDiv.attr("dragtype");
			var callbackfunc = editorAreaDragCallbackMethod[dragtype];
			if(callbackfunc){
				callbackfunc($srcImgDiv,$(this));
			}	
		}
		clearDragstartFlag();
	}); 
	
	// 开始拖动缩略图
	$(".backg_tpl_item").on("dragstart",function(){
		console.log("开始拖动");
		$srcImgDiv = $(this);
		backg_tpl_item_dragstart_flag = true;
		console.log("$srcImgDiv.offset().top:"+$srcImgDiv.offset().top);
	}); 

	// 拖动到.drop-left,.drop-right上方时触发的事件
	$(".backg_tpl_item").on("dragover", function(event) {
		// 必须通过event.preventDefault()来设置允许拖放
		event.preventDefault();
	}); 
	
	// 结束拖动缩略图 放开鼠标的事件
	$(".backg_tpl_item").on("drop", function(event) {
		//console.log("结束拖动");
		//console.log("$(this).offset().top:"+$(this).offset().top+" backg_tpl_item_dragstart_flag:"+backg_tpl_item_dragstart_flag);
		event.preventDefault();
		if($srcImgDiv[0] != $(this)[0] && backg_tpl_item_dragstart_flag) {
			
			//判断是否允许拖拽
			var reobj = dragSceneCheck($srcImgDiv,$(this));
			if(!reobj.result){
				top.$.jBox.tip(reobj.msg);
				return;
			}
			
			//执行拖拽操作
			if(reobj.result){
				//移动场景
				if(reobj.insertType === "after"){
					$("#"+$(this).attr("to")).after($("#"+$srcImgDiv.attr("to")));
					$(this).after($srcImgDiv);
				}else if(reobj.insertType === "before"){
					$("#"+$(this).attr("to")).before($("#"+$srcImgDiv.attr("to")));
					$(this).before($srcImgDiv);
				}
				
				//重新排场景序号
				computingSceneSequence();
				
				//随时缩略图
				sceneThumbnail();	
			}			
		}
		clearDragstartFlag();
	}); 
	
	//判断是否允许拖拽场景缩略图
	function dragSceneCheck(dragO,stopO){
		var reobj = {};
		var flag = true;
		var tpls = $(".backg_tpl").clone();
		var dragObj = tpls.find("#"+dragO.attr("id"));
		var stopObj = tpls.find("#"+stopO.attr("id"));
		
		//模拟执行判断及操作
		if(stopO.offset().top > dragO.offset().top){
			reobj.insertType = "after";
			//判断是否允许拖拽
			if(dragObj.hasClass("tpl_parent")){
				if(parseFloat(dragObj.find(".tpl_item_index").text()) < 1.1 && !(dragObj.next().hasClass("tpl_parent"))){
					//如果是子场景，不允许调到最上方
					reobj.msg = $.i18n.prop("progForm.firstSceneMustbeMainScene");
					flag = false;
				}
			}
			if(flag){
				stopObj.after(dragObj);
			}
		}else{
			reobj.insertType = "before";
			//判断是否允许拖拽
			if(!dragObj.hasClass("tpl_parent")){
				if(parseFloat(stopObj.find(".tpl_item_index").text()) < 1.1){
					//如果是子场景，不允许调到最上方
					reobj.msg = $.i18n.prop("progForm.firstSceneMustbeMainScene");
					flag = false;
				}
			}
			if(flag){
				stopObj.before(dragObj);
			}
		}
		
		if(flag){
			//模拟重排序号
			var i = 0;
			var n = 0;
			var sum = 0;
			tpls.find(".backg_tpl_item").each(function(){
				if($(this).hasClass("tpl_parent")){
					i++;
					n=0;
					$(this).find(".tpl_item_index").html(i).attr("master_index",i);
					$("#"+$(this).attr("to")).attr("tindex",i);
				}else{
					n++;
					$(this).find(".tpl_item_index").html(i+"."+n).attr("master_index",i);
					$("#"+$(this).attr("to")).attr("tindex",i+"."+n);
				}
				sum++;
			});
			
			//判断模拟执行后子场景数量是否合法
			var masterIndexs = [];
			tpls.find(".backg_tpl_item.tpl_parent .tpl_item_index").each(function(){
				masterIndexs.push($(this).attr("master_index"));
			});
/*
 			//子场景限制10个
 			if(masterIndexs.length > 0){
				for(var j=0;flag && j<masterIndexs.length;j++){
					if(tpls.find(".backg_tpl_item.tpl_children .tpl_item_index[master_index='"+masterIndexs[j]+"']").length > 10){
						reobj.msg = $.i18n.prop("progForm.mainSceneMaxHaveScene");
						flag = false;
					}
				}
			}*/
		}

		
		tpls = null;
		reobj.result = flag;
		return reobj;
	}
	
	//判断跳转到该场景是否合法
	function skipToSceneLegal(skipsceneScene,curElementScene){
		//if(!curElementScene){
			//curElementScene = curScene;
		//}
		var flag = true;
		//判断场景是否存在
		if(flag && skipsceneScene.length < 1){
			flag = false;
		}
		//判断场景是否同一层
		if(flag){
			var sceneIndex = $(".backg_tpl_item[to='"+skipsceneScene.attr("id")+"'] .tpl_item_index").html();
			var sceneTier = sceneIndex.split(".")[0];
			var curElementSceneIndex = $(".backg_tpl_item[to='"+curElementScene.attr("id")+"'] .tpl_item_index").html();
			var curElementSceneTier = curElementSceneIndex.split(".")[0];
			if(!sceneTier || !curElementSceneTier || sceneTier != curElementSceneTier){
				flag = false;
			}
		}
		return flag;
	}
	
	//(重构了编辑器)根据跳转场景的索引,更新跳转的目标场景如果不存在，则取消跳转功能
	function updateSkipScene(){
		console.log("进入更新目标场景  $(\".element[skipsceneindex]\").length:"+$(".element[skipsceneindex]").length);
		$(".element[skipsceneindex]").each(function(){
			var skipsceneindex = $(this).attr("skipsceneindex");
			var skipsceneScene = $(".content-center-topfd[tindex='"+skipsceneindex+"']");
			var curElementScene = $(this).parents(".content-center-topfd");
			if(!skipToSceneLegal(skipsceneScene,curElementScene)){
				console.log("不合法删除跳转");
				$(this).removeAttr("skipscene").removeAttr("skipsceneindex");
			}else{
				console.log("更新目标场景");
				$(this).attr("skipscene",skipsceneScene.attr("id"));
			}
		});
	}
	
	//更新跳转场景的索引,如果目标场景不存在，则取消跳转功能
	function updateSkipSceneIndex(){
		console.log("进入更新索引  $(\".element[skipscene]\").length:"+$(".element[skipscene]").length);
		$(".element[skipscene]").each(function(){
			var skipscene = $(this).attr("skipscene");
			var skipsceneScene = $("#"+skipscene);
			var curElementScene = $(this).parents(".content-center-topfd");
			if(!skipToSceneLegal(skipsceneScene,curElementScene)){
				console.log("不合法删除索引记录");
				$(this).removeAttr("skipscene").removeAttr("skipsceneindex");
			}else{
				console.log("更新索引记录");
				$(this).attr("skipsceneindex",skipsceneScene.attr("tindex"));
			}
			//if(curelement.attr("skipscene")){
				//refreshskipshow();		
			//}	
		});
	}
	
	//重新排场景序号
	function computingSceneSequence(key){
		var i = 0;
		var n = 0;
		var sum = 0;
		$(".backg_tpl_item").each(function(){
			if($(this).hasClass("tpl_parent")){
				i++;
				n=0;
				$(this).find(".tpl_item_index").html(i).attr("master_index",i);
				$("#"+$(this).attr("to")).attr("tindex",i);
			}else{
				n++;
				$(this).find(".tpl_item_index").html(i+"."+n).attr("master_index",i);
				$("#"+$(this).attr("to")).attr("tindex",i+"."+n);
			}
			sum++;
		});
		//更新场景总数
		$(".scenariosNum-text").html(sum);
		if(key === "reeditor"){
			//更新跳转场景的索引,如果目标场景不存在，则取消跳转功能
			updateSkipScene();
		}else{
			//更新跳转场景的索引,如果目标场景不存在，则取消跳转功能
			updateSkipSceneIndex();
		}
	}
	
	//初始化缩放的fn(缩放改变font-size)
	function resizeinitfontfn(obj,wratio,hratio){
		console.log("进入resizeinitfontfn");
		if(!wratio){
			wratio = 0.05;
		}
		if(!hratio){
			hratio = 0.1;
		}
		console.log("obj.resizable");
		obj.resizable({
			containment: ".content-center",
			resize:function(event, ui){
				var v = 0;
				var w = ui.size.width*wratio;
				var h = ui.size.height*hratio;
				if(w<h){
					v = w;
				}else{
					v = h;
				}
				ui.element.css("font-size",v+"px");
				//随时缩略图
				sceneThumbnail("NOT_SAVE_HIS");
				updateShowSize();
			},
			handles: "n, e, s, w, ne, se, sw, nw",
			start:function(event, ui){
				if(curelement == null || !isNolock()){
					obj.droppable( 'enable' ); 
				}
			},
		    stop:function(event, ui) {
			    //随时缩略图(因为想更新缩略图的时候存上一步、下一步的缓存，所以拖拽元素结束的时候更新缩略图)
			    sceneThumbnail();
		    }
		});
		console.log("resizeinitfontfn初始化结束");
	}
	
	//初始化缩放的fn
	function resizeinitfn(obj,eventListener){
		console.log("resizeinitfn");
		$(obj).resizable({
			containment: ".content-center",
			handles: "n, e, s, w, ne, se, sw, nw", 
			resize:function(event, ui){
				
			
				//随时缩略图		        
		        if(curelement != null && isNolock()){						
					//将当前移动的元素位置信息显示出来				
					displayMaterialInfo(curelement.attr("id"),parseInt(curelement.css("left")),parseInt(curelement.css("top")),parseInt(curelement.css("width")),parseInt(curelement.css("height")));										
				}else{
					return false;
				}
	            updateShowSize();
			},
			start:function(event, ui){
				if(curelement == null || !isNolock()){
					$(obj).droppable( 'enable' ); 
				}
			},					   
		    stop: function(event, ui) {
		    	if(eventListener){
		    		var stopFunc = eventListener.stop;
		    		if(stopFunc){
		    			stopFunc(event, ui);
		    		}
		    	}
		    	
		    	//如果结束拉伸缩放时,控件元素的内容超出控件元素,则把控件元素的宽高为元素内容的宽高
		    	minwh(curelement);
			   
			    if(curelement != null && isNolock()){						
					//将当前移动的元素位置信息显示出来				
					displayMaterialInfo(curelement.attr("id"),parseInt(curelement.css("left")),parseInt(curelement.css("top")),parseInt(curelement.css("width")),parseInt(curelement.css("height")));										
				}else{
					return false;
				}
			    
		    }
		});
	}
	
	//控制控件元素拉伸缩放框大小不小于元素内部的最小值元素(".minwh")的宽高
	function minwh(obj){
		if(!obj){
			obj = curelement;
		}
		//判断是否有最小值标准元素
		var minwh = obj.find(".minwh");
		if(minwh){
			var curw = obj.width();
			var curh = obj.height();
			var minw = minwh.width();
			var minh = minwh.height();
			if(curw < minw){
				obj.width(minw);
			}
			if(curh < minh){
				obj.height(minh);
			}
		}
	} 
	
	//初始化拖拽的fn
	function draginitfn(obj){		
		$(obj).draggable({
			containment: "parent",
			scroll: false, 
			cursor: "move",
			cancel: "input",					
			snap: ".element",
			snapMode: 'outer',
			snapTolerance:1,
			drag: function(event, ui) {		
				if(curelement != null && isNolock()){	
					
					//将当前移动的元素位置信息显示出来				
					displayMaterialInfo(curelement.attr("id"),parseInt(curelement.css("left")),parseInt(curelement.css("top")),parseInt(curelement.css("width")),parseInt(curelement.css("height")));
					//随时缩略图
			        //sceneThumbnail("NOT_SAVE_HIS");
					
				}else{
					
					return false;
				}
		    },					   
		    stop: function(event, ui) {	
		    	if(curelement!=null){
					var cl = parseInt($(curelement).css("left"));//当前元素左			
					var ct = parseInt($(curelement).css("top"));//当前元素上				
					var cw = parseInt($(curelement).css("width"));//当前元素宽			
					var ch = parseInt($(curelement).css("height"));//当前元素高
					if (isSorption() &&!$(curelement).attr("lock")){					
						
							$("input[name = checkdom]:checkbox").each(function(){								
								if ($(this).attr("eId")!=curelement.attr("id")){							
									var l = 	parseInt($("#"+$(this).attr("eId")).css("left"));//左	
									var r = 	parseInt($("#"+$(this).attr("eId")).css("left"))+parseInt($("#"+$(this).attr("eId")).css("width"));//右
									var t = 	parseInt($("#"+$(this).attr("eId")).css("top"));//上
									var b = 	parseInt($("#"+$(this).attr("eId")).css("top"))+parseInt($("#"+$(this).attr("eId")).css("height"));	//下
									if ((Math.abs(r-cl)<=15)&&((t<=ct&&ct<=b)||(t<=ct+ch&&ct+ch<=b)||(ct<=t && t<=ct+ch)||(ct<=b && b<=ct+ch))){
										
										//当前元素的左边吸附目标右边
										if (r+cw>parseInt(curScene.css("width"))){										
											layer.msg(curelement.attr("id")+localObj.b00175+$(this).attr("eId")+localObj.b00176);
										}else{
											$(curelement).css("left",r);
										}
																			
									}else if ((Math.abs(l-(cl+cw))<=15)&&((t<=ct&&ct<=b)||(t<=ct+ch&&ct+ch<=b)||(ct<=t && t<=ct+ch)||(ct<=b && b<=ct+ch))){
										//当前元素的右边吸附目标左边
										if (l-cw<0){
											layer.msg(curelement.attr("id")+localObj.b00175+$(this).attr("eId")+localObj.b00176);
										}else{
											$(curelement).css("left",l-cw);	
										}
										
									}else if ((Math.abs(b-ct)<=15)&&((l<=cl&&cl<=r)||(l<=cl+cw&&cl+cw<=r)||	(cl<=l && l<=cl+cw)||(cl<=r && r<=cl+cw))){
										//当前元素的上边吸附目标的下边
										if (b+ch>parseInt(curScene.css("height"))){
											layer.msg(curelement.attr("id")+localObj.b00175+$(this).attr("eId")+localObj.b00176);
										}else{
											$(curelement).css("top",b);	
										}
										
										
									}else if ((Math.abs(t-(ct+ch ))<=15)&&((l<=cl&&cl<=r)||(l<=cl+cw&&cl+cw<=r)||	(cl<=l && l<=cl+cw)||(cl<=r && r<=cl+cw))){
										//当前元素的下边吸附目标的上边
										if (t-ch<0){
											layer.msg(curelement.attr("id")+localObj.b00175+$(this).attr("eId")+localObj.b00176);
										}else{
											$(curelement).css("top",t-ch);
										}
										
									}
								}									
							})	
						
			
					}					
				    //随时缩略图(因为想更新缩略图的时候存上一步、下一步的缓存，所以拖拽元素结束的时候更新缩略图)
					displayMaterialInfo(curelement.attr("id"),parseInt(curelement.css("left")),parseInt(curelement.css("top")),parseInt(curelement.css("width")),parseInt(curelement.css("height")));
		    	}	
			   // sceneThumbnail();
		    }
		});
	}	
	

	
/*	function bold() {
		curelement.css("font-weight","bold");
		document.execCommand("Bold");      
	}
	function itallic() {
		curelement.css("font-style","italic");	
	
	}
	function setline() {
		curelement.css("text-decoration","underline");	
		curelement.find("textarea").css("text-decoration","underline");
	}*/
	

/*	function addmusic(){
		if(curScene.find(".music").length > 0 ){
			console.log("yicunzai");
			curScene.find(".music").click();
		}else{
			console.log("不存在");
			total++;
			var add = $("<div id='music_"+total+"' class='music element active' title='' curimglist='' from='music_edit' style='left:0px;top:0px;z-index:"+total+";position:absolute;width:200px; height:200px;background-color:#fff'><img src='' style='width:100%;height:100%'></div>");
			draginitfn($(add));
			resizeinitfn($(add));
			curScene.append(add);
			$(add).mousedown();
		}	
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下) 	   
		sceneThumbnail();
	}*/

	function addppt(){
		total++;
		var add = $("<div id='ppt_"+total+"' class='ppt element active' title='' curimglist='' from='ppt_edit' style='left:0px;top:0px;z-index:"+total+";position:absolute;width:200px; height:200px;background-color:#fff'><img src='' style='width:100%;height:100%'></div>");
		draginitfn($(add));
		resizeinitfn($(add));
		curScene.append(add);
		$(add).mousedown();
		/* redo();*/
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下) 	   
		sceneThumbnail();
	}
	function addword(){
		total++;
		var curScene = $("#topfd1");
		var add = $("<div id='word_"+total+"' class='word element active' title='' curimglist='' from='word_edit' style='left:0px;top:0px;z-index:"+total+";position:absolute;width:200px; height:200px;background-color:#fff'><img src='' style='width:100%;height:100%'></div>");
	//	draginitfn($(add));
		resizeinitfn($(add));
		curScene.append(add);
		$(add).mousedown();
		/* redo();*/
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下) 	   
		sceneThumbnail();
	}
	function addexcel(){
		total++;
		var add = $("<div id='excel_"+total+"' class='excel element active' title='' curimglist='' from='excel_edit' style='left:0px;top:0px;z-index:"+total+";position:absolute;width:200px; height:200px;background-color:#fff'><img src='' style='width:100%;height:100%'></div>");
		draginitfn($(add));
		resizeinitfn($(add));
		curScene.append(add);
		$(add).mousedown();
		/* redo();*/
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下) 	   
		sceneThumbnail();
	}
	
	function testlayer(){
		console.log("Hi，我是tips', '吸附元素选择器，如#id")
		//layer.alert('Hi，我是tips', '吸附元素选择器，如#id');
		//layer.msg('这是最常用的吧');
		layer.tips('上', '.number-input', {
				  tips: [2, '#0FA6D8'] //还可配置颜色
				});
	}
	
	
	function btnload(){
		
		var data ={"elementcount":9,"datalist":[{"id":"fonts_1","class":"ui-state-active element font ui-draggable ui-draggable-handle ui-resizable","title":"","from":"text_edit","style":"width: 162px; min-height: 24px; position: absolute; top: 85px; left: 251px; z-index: 1; color: rgb(0, 0, 0); text-align: left; background-color: rgb(255, 255, 255); font-size: 1.33333em; cursor: default; height: 85px; right: auto; bottom: auto;","fontsize":"24","bgcolor":"#fff","transparent":"0","txtcolor":"#000","txtanimtype":"none","text":"<div id=\"textarea_fonts_1\" class=\"ql-editor\" style=\"width:100%;height:100%;overflow:hidden;\" txtedid=\"txtedid1\" tabindex=\"1\" contenteditable=\"false\"><div>fdsafdsafdsafdsafdsafdsafdsafdsafdsafdsafdsafdsafsad</div></div>"},{"id":"video_2","class":"element video ui-draggable ui-draggable-handle ui-resizable","title":"","curimglist":"[{\"type\":\"video\",\"src\":\"img1.png\",\"name\":\"测试.mp4\",\"source\":\"mosou.mp4\",\"long\":\"101\",\"attrid\":\"47a93e3ebc4a61c0a83fd\"}]","from":"video_edit","style":"left: 89px; top: 85px; z-index: 2; position: absolute; width: 162px; height: 85px; background-color: rgb(255, 255, 255); right: auto; bottom: auto;","imgsrc":"img1.png"},{"id":"image_3","class":"element image ui-draggable ui-draggable-handle ui-resizable","title":"","curimglist":"[{\"type\":\"img\",\"src\":\"img1.png\",\"name\":\"测试.jpg\",\"long\":\"5\",\"attrid\":\"47a9148ebe8528c0a83fd\"}]","from":"img_edit","style":"top: 0px; left: 89px; display: block; width: 162px; height: 85px; position: absolute; z-index: 3; background-color: rgb(255, 255, 255); right: auto; bottom: auto;","delay":"5","imgsrc":"img1.png"},{"id":"image_4","class":"element image ui-draggable ui-draggable-handle ui-resizable","title":"","curimglist":"[{\"type\":\"img\",\"src\":\"img1.png\",\"name\":\"测试.jpg\",\"long\":\"5\",\"attrid\":\"47a9148ebe8528c0a83fd\"}]","from":"img_edit","style":"top: 170px; left: 89px; display: block; width: 162px; height: 85px; position: absolute; z-index: 4; background-color: rgb(255, 255, 255); right: auto; bottom: auto;","delay":"5","imgsrc":"img1.png"},{"id":"image_5","class":"element image ui-draggable ui-draggable-handle ui-resizable","title":"","curimglist":"[{\"type\":\"img\",\"src\":\"img1.png\",\"name\":\"测试.jpg\",\"long\":\"5\",\"attrid\":\"47a9148ebe8528c0a83fd\"}]","from":"img_edit","style":"top: 0px; left: 251px; display: block; width: 162px; height: 85px; position: absolute; z-index: 5; background-color: rgb(255, 255, 255); right: auto; bottom: auto;","delay":"5","imgsrc":"img1.png"},{"id":"image_6","class":"element image ui-draggable ui-draggable-handle ui-resizable","title":"","curimglist":"[{\"type\":\"img\",\"src\":\"img1.png\",\"name\":\"测试.jpg\",\"long\":\"5\",\"attrid\":\"47a9148ebe8528c0a83fd\"}]","from":"img_edit","style":"top: 0px; left: 413px; display: block; width: 162px; height: 85px; position: absolute; z-index: 6; background-color: rgb(255, 255, 255); right: auto; bottom: auto;","delay":"5","imgsrc":"img1.png"},{"id":"image_7","class":"element image ui-draggable ui-draggable-handle ui-resizable","title":"","curimglist":"[{\"type\":\"img\",\"src\":\"img1.png\",\"name\":\"测试.jpg\",\"long\":\"5\",\"attrid\":\"47a9148ebe8528c0a83fd\"}]","from":"img_edit","style":"top: 170px; left: 251px; display: block; width: 162px; height: 85px; position: absolute; z-index: 7; background-color: rgb(255, 255, 255); right: auto; bottom: auto;","delay":"5","imgsrc":"img1.png"},{"id":"image_8","class":"element image ui-draggable ui-draggable-handle ui-resizable","title":"","curimglist":"[{\"type\":\"img\",\"src\":\"img1.png\",\"name\":\"测试.jpg\",\"long\":\"5\",\"attrid\":\"47a9148ebe8528c0a83fd\"}]","from":"img_edit","style":"top: 85px; left: 413px; display: block; width: 162px; height: 85px; position: absolute; z-index: 8; background-color: rgb(255, 255, 255); right: auto; bottom: auto;","delay":"5","imgsrc":"img1.png"},{"id":"image_9","class":"element image ui-draggable ui-draggable-handle ui-resizable","title":"","curimglist":"[{\"type\":\"img\",\"src\":\"img1.png\",\"name\":\"测试.jpg\",\"long\":\"5\",\"attrid\":\"47a9148ebe8528c0a83fd\"}]","from":"img_edit","style":"top: 170px; left: 413px; display: block; width: 162px; height: 85px; position: absolute; z-index: 9; background-color: rgb(255, 255, 255); right: auto; bottom: auto;","delay":"5","imgsrc":"img1.png"}]};
		loadsence(JSON.stringify(data));
	} 
	
	
	//图片元素(img)
	function loadimg(obj) {
		console.log("loadimg:"+obj.id);
		var add = $("<div id='"+obj.id+"' class='"+obj.class+"' title='"+obj.title+"' curimglist='"+obj.curimglist+"' from='"+obj.from+"' style='"+obj.style+"' ><img src='"+obj.imgsrc+"' style='width:100%;height:100%'></div>");
		draginitfn($(add));
		resizeinitfn($(add));
		curScene.append(add);
		addscene.append("<div><input type='checkbox' id="+obj.id+" name='checkdom'/>"+obj.id+"<br></div>");
		$(add).mousedown();
		updateImgWrap();
		/*total++;
		//var curScene = $("#topfd1");
		var add = $("<div id='image_"+total+"' class='element active image' title='' curimglist='' from='img_edit' style='top:0px;left:0px;display:block;width:"+initImgWidth+"px;height:"+initImgHeight+"px;position: absolute;z-index:"+total+";background-color:#fff;' ><img src='img1.png' style='width:100%;height:100%'></div>");
		draginitfn($(add));
		resizeinitfn($(add));
      
		curScene.append(add);
		addscene.append("<div><input type='checkbox' id=image_"+total+" name='checkdom'/>image_"+total+"<br></div>");
        $(add).mousedown();
       
		//更新图片编辑区
		updateImgWrap();
		//更新元素位置在当前可视范围内
		var top = $(".content-main-edit").scrollTop();
		add.css("top",top+"px");
		//随时缩略图(本来不需要重画缩略图，为了记录历史画一下)
	//	sceneThumbnail();
		//openmateriallibrary();*/
	}
	//加载视频
	function loadvideo(obj){
		var add = $("<div id='"+obj.id+"' class='"+obj.class+"' title='"+obj.title+"' curimglist='"+obj.curimglist+"' from='"+obj.from+"' style='"+obj.style+"' ><img src='"+obj.imgsrc+"' style='width:100%;height:100%'></div>");	
		draginitfn($(add));
		resizeinitfn($(add));
		curScene.append(add);
		addscene.append("<div><input type='checkbox' id="+obj.id+" name='checkdom'/>"+obj.id+"<br></div>");
		$(add).mousedown();
		
		//更新视频编辑区
		updateVideoWrap();
	}
	//加载文字
	function loadtxt(obj){
		console.log("loadtxt:"+obj.text);
		//var standardscalefsize=18;
		var add = $("<div id='"+obj.id+"' fontsize='"+obj.fontsize+"' bgcolor='"+obj.bgcolor+"' transparent='"+obj.transparent+"' txtcolor='"+obj.txtcolor+"' class='"+obj.class+"' title='"+obj.title+"' from='"+obj.from+"' style='"+obj.style+"' txtanimtype='"+obj.txtanimtype+"' />");
		$(add).append(obj.text);//双击此处进行编辑
		//初始化退拽 缩放
		draginitfn($(add));
		resizeinitfn($(add));
		
   	    curScene.append(add);
		addscene.append("<div><input type='checkbox' id="+obj.id+" name='checkdom'/>"+obj.id+"<br></div>");
   	    //文本框，第一次onchange不记录历史
   	    var saveFlag = "NOT_SAVE_HIS";
   	    
   	    //初始化编辑器
   	    initTxtEditor();
   	    //var editor = getQuill('#textarea_fonts_'+total);
   	    $(".backg_tpl_item.active").click();
   	    //curScene.click();
   	    $(add).mousedown();
   	    $(add).css("height","85px");	
	}
	
	//加载场景
	function loadsence(senceStr){	
			console.log(senceStr);
		//var objlist = $.parseJSON( objliststr );
			var senceObj =	JSON.parse(senceStr);	
			console.log("elementcount:"+senceObj.elementcount);
			
			total = senceObj.elementcount;
			for(var i=0;i<senceObj.datalist.length;i++){
				//var objlist = $.parseJSON( objliststr[i] );
			// arrvalue=objlist[i].css("left");//数组的索引是从0开始的
			console.log("loadsence:"+ JSON.stringify(senceObj.datalist[i]) );//把取出的值打印在控制台上
			switch(senceObj.datalist[i].from){
				case "img_edit":
				//添加图片
				loadimg(senceObj.datalist[i]);
				break;
				case "video_edit":
				loadvideo(senceObj.datalist[i]);
				break;
				case "text_edit":
				loadtxt(senceObj.datalist[i]);
				break;
			}
		}/**/
	}
	
	function savescene(){
		//console.log("savescene:");
		var htmlx = "";		
		var sceneObj = {};
		sceneObj.elementcount = total;
		var elementlist =new Array();
		$("[id^='topfd1']").find(".element").each(function(){
			$(this).remove("active");
			var obj = {};
					obj.id = $(this).attr("id");
					obj.class = $(this).attr("class");
					/*obj.left = parseInt($(this).css("left"));
					obj.top = parseInt($(this).css("top"));
					obj.width = parseInt($(this).css("width"));
					obj.height = parseInt($(this).css("height"));	*/
					obj.title = $(this).attr("title");
					obj.curimglist = $(this).attr("curimglist");
					obj.from = $(this).attr("from");
					obj.style = $(this).attr("style");
					obj.delay = $(this).attr("delay");									
			switch($(this).attr("from")){
				case "img_edit":
				obj.imgsrc = $(this).find("img").attr("src");
				break;
				case "video_edit":
				obj.imgsrc = $(this).find("img").attr("src");
				break;
				case "text_edit":
				obj.fontsize = $(this).attr("fontsize");
				obj.bgcolor = $(this).attr("bgcolor");
				obj.transparent = $(this).attr("transparent");
				obj.txtcolor = $(this).attr("txtcolor");
				obj.txtanimtype = $(this).attr("txtanimtype");
				obj.text = $(this).find(".ql-editor").prop("outerHTML");
				break;
			}
			elementlist.push(obj);
			
			//htmlx += $(this).attr("from");
			htmlx += $(this).prop("outerHTML");
		});
		sceneObj.datalist = elementlist;
		console.log("objlist:"+JSON.stringify(sceneObj));
		/*var arrvalue;//用于存放取出的数组的值
		for(var i=0;i<objlist.length;i++){
			// arrvalue=objlist[i].css("left");//数组的索引是从0开始的
			console.log("objlist:"+JSON.stringify(objlist[i]));//把取出的值打印在控制台上
		}*/
		
		//console.log("savescene:"+htmlx);
	}

	
	
	//头部导航栏的特点击添加元素的事件	
	$("#for_port_edit").on("click",addport);
	$("#for_text_edit").on("click",addtxt);
	$("#for_port_edit").on("click",addport);
	
	//视频
	//$("#for_video_edit").on("click",addvideo);
	
	//$("#for_video_edit").click(function(){
	//	  alert();
	//});
	
	
	//图片
	//$("#for_img_edit").on("click",addimg);
	
	
	
	
	
	$("#for_dom_find").on("click",eachdom);
	
	$("#for_align_left").on("click",alignleft);
	$("#for_align_right").on("click",alignright);
	$("#for_align_top").on("click",aligntop);
	$("#for_align_bottom").on("click",alignbottom);
	
	$("#for_align_level").on("click",alignlevel);
	$("#for_align_vertical").on("click",alignvertical);
	
	
	$("#for_align_width").on("click",alignwidth);
	$("#for_align_height").on("click",alignheight);
		
	$("#for_test_layer").on("click",testlayer);
	
	$("#for_save_scene").on("click",savescene);
	$("#for_load_scene").on("click",btnload);
	
	$("#for_dom_check").on("click",DomCheckbox);
	$("#for_dom_orcheck").on("click",orDomCheckbox);
	
	$("#for_dom_nocheck").on("click",cancelDomCheckbox);
	
	/*$("#for_music_edit").on("click",addmusic);*/
	$("#for_office_edit").on("click",addoffice);
	$("#for_ppt_edit").on("click",addppt);
	$("#for_word_edit").on("click",addword);
	$("#for_excel_edit").on("click",addexcel);
	
	$("#for_date_edit").on("click",adddate);
	$("#for_countdown_edit").on("click",addcountdown);
	
	$("#for_exchange_edit").on("click",addexchange);
	$("#for_stock_edit").on("click",addstock);
	$("#for_map_edit").on("click",addmap);
	$("#for_mixed_edit").on("click",addmixed);
	$("#for_streamMedia_edit").on("click",addstreamMedia);
	$("#for_materialApk_edit").on("click",addmaterialApk);
	$("#for_numberofruns_edit").on("click",addnumberofruns);
	

	
	//元素改变坐标输入参数
	$(".number-label").bind("keyup",function(){
		//这里通过对e的处理得到你的待传参数值
		 
		 console.log("元素改变坐标输入参数:"+$(this).val());
		 //获得当前元素名称
		 var myname=$(".zhegequyumingshi").html();
		 //当前元素是否设置过行数 没有使用默认5行
		 var count=$("#"+myname).attr("ycCount");
		 
		 console.log("当前单击区域id:"+myname);
		 var item = parseInt($(this).val());
			//输入不合法
			if(isNaN(item)||item < 1){
				$(this).val("");
				return;
			}
			var flay=$(this).attr("id");
			if(flay=="ycCount"){}else{
				item=Math.round(item*$("#sf").val());
			}
			switch(flay){
				case "lleft":
				curelement.css("left",item);
				break;
				case "ltop":
				curelement.css("top",item);
				break;
				case "lwidth":
				curelement.css("width",item);
				break;
				case "lheight":
				curelement.css("height",item);
				break;
				case "ycCount":
				$("#"+myname).attr("ycCount",item);
				break;
			}
			
		 
		
     })
		
	
	
	//场景中每个元素的点击事件
	//$(".element").live("mousedown",function(event){		
	/**$(document).on("mousedown",".element",function(e){
		console.log("场景中每个元素的点击事件")
	   if (event.button == 0) {  // 鼠标左键		  
	      if (event.ctrlKey) { //  ctrl
	    	$(this).addClass("active");			
			$("input[eId="+$(this).attr("id")+"]").prop("checked",true);
			$(".op-label").hide();
			$(".scene_edit").show();
			
			pm_right_showHide("#pm_right_pub");
			
			
			displayMaterialInfo("节目名",0,0,parseInt(curScene.css("width")),parseInt(curScene.css("height")),true);
	      } else {
	    	  curelement = $(this);
	    	  $(this).addClass("active").siblings().removeClass("active");
	    	  
	    	  
	    	 
	    	     
			  //文本控件点击后没跑切换当前对象，暂时这里单独做，之后整理再合并
			  if($(this).attr("from") == "text_edit"){
	    	  //curelement = $(this);
	    	  $(".op-label").hide();
	    	  $("."+$(this).attr("from")).show();
			 // cancelDomCheckbox();
			  $("input[eid="+$(this).attr("id")+"]").prop("checked",true);
	    	  updateTextWrap($(this));
	    	  
	    	  pm_right_showHide("#pm_right_pro");
				
	    	 
	          }
			  //刷新锁定显示
			  refreshlock();
		  }
	      
	   }else if(3 == e.which){
			if (isNolock()){
				showcontextmenu(e,this);
			}else{
				unlockmenu(e,this);
			}
		    	
		} 
	});/**/

     //单击元素
	$(document).on("mousedown",".element",function(e){		
	//$(".element").live("mousedown",function(e){
		//从click事件改成响应mousedown事件后，只能在编辑板没出来前对响应处理，编辑板出来后不再作处理
		console.log("从click事件改成响应mousedown事件后，只能在编辑板没出来前对响应处理，编辑板出来后不再作处理");
		//if(!$("#for_"+$(this).attr("from")).hasClass("active") )
		if(!$("#for_"+$(this).attr("from")).hasClass("active") || $(this).attr("from") != "text_edit")
		{
			{  // 鼠标左键		djj为了天气异步跨域请求中代码触发点击有效，所以注释掉判断
		    	
		      if (event.ctrlKey) { //  ctrl
		    	  
		    	  
		    	  if ($("input[eId="+$(this).attr("id")+"]").prop("checked")==false){
		  			  $("#"+$(this).attr("id")).addClass("active");
		  			  $("input[eId="+$(this).attr("id")+"]").prop("checked",true);
		  		  }else{
		  			  $("#"+$(this).attr("id")).removeClass("active");
		  			 $("input[eId="+$(this).attr("id")+"]").prop("checked",false);
		  	 	  }	
		    	  
		    	  
		    	  //$(this).addClass("active");			
		    	  console.log("ctrlKey:"+$(this).attr("id"));
		    	  // $("#cb1").attr("checked","checked")
		    	  widget.push($(this));				  
				  //$("input[eId="+$(this).attr("id")+"]").prop("checked",true);
				  //$(".op-label").hide();
				  //$(".scene_edit").show();
				  //$("#shade").remove();
				  
				  pm_right_showHide("#pm_right_pub");
				  
				  displayMaterialInfo("节目名",0,0,parseInt(curScene.css("width")),parseInt(curScene.css("height")),true);
		      } else {
		    	  curelement = $(this);
				  cancelDomCheckbox();
				  $("input[eId="+$(this).attr("id")+"]").prop("checked",true);
		    	  console.log("66666666666666666");
		    	  widget.length = 0;
		    	  widget.push($(this));	 
		    	  
		    	  pm_right_showHide("#pm_right_pro");
				  
		    	  
		    	  $(this).addClass("active").siblings().removeClass("active");
				
		    	  draginitfn($(this));
		    	  //绑定编辑框
                  //resizeinitfn($(this));
				
				  $("#for_"+$(this).attr("from")).addClass("active").siblings().removeClass("active");
				  displayMaterialInfo($(this).attr("id"),parseInt($(this).css("left")),parseInt($(this).css("top")),parseInt($(this).css("width")),parseInt($(this).css("height")))
				
				   //有跳转功能的控件，刷新跳转数据
				   $("#Sorption").prop("checked",isSorption());
				  
				   
				   console.log("isElementHide():"+isElementHide());
				   //是否隐藏控件
				   $("#elementHide").prop("checked",isElementHide());
				   
				 
				   
				   console.log("isRelationCall():"+isRelationCall());
				   //是否关联叫号控件
				   $("#relationCall").prop("checked",isRelationCall());
				   
				  
			       //刷新锁定状态
				   refreshlock();
				    //console.log("curelement.attr('id'):"+curelement.attr("id"));
				    console.log("$(this).attr('id'):"+$(this).attr("id"));
				    
				    
				    //互动节目显示互动列表
				    
			    	if($("#itemType").val()==2&&$("#screenTypeHtml").val()==0){
			    	    	 
					    	    		
			   	    			//清空原有数据
				                var item = $('#dg').datagrid('getRows');
				                if (item) {
				                       for (var i = item.length - 1; i >= 0; i--) {
				                           var index = $('#dg').datagrid('getRowIndex', item[i]);
				                           $('#dg').datagrid('deleteRow', index);
				                       }
				                }
						                
					   	    	var currentDiv=$(this); 
					   	    			
					   	    	var  mtouchs=currentDiv.attr("mtouchs");
					    	    
					    	    if(mtouchs==null||mtouchs==undefined){}else{
					    	    	
					    	        var objs = eval( "(" + mtouchs + ")" );//转换后的JSON对象 
						    	    for(var i=0;i<objs.length;i++){
						    	    	    	if(objs[i]==null){}else{
						    	    		    	$('#dg').datagrid('appendRow',{
						    	    		        	tTargetId:objs[i].tTargetId,
						    	    		            tTypeText:objs[i].tTypeText,
						    	    		            tTouchReturnTime:objs[i].tTouchReturnTime,
						    	    		            tTouchKey:objs[i].tTouchKey
						    	    		        });
						    	    	    	}
						    	     }
					    	    	
					    	    }
					    	    	     
					    	
					   		  
			     }
			    	   
				 if(curelement == null || curelement.attr("id") !== $(this).attr("id"))
				  //	if(curelement == null )
				 {
					
					curelement = $(this);
					//cancelEditor($(".element"));
					//$(".element").find(".ql-editor").attr("contenteditable",false).parent().css("cursor","default");
					$curimglist = [];			
					$(".op-label").hide();
					$("."+$(this).attr("from")).show();
					var type = $(this).attr("from");
					//displayMaterialInfo
					switch(type){
					case "backg_edit":
						//更新背景编辑区
						updateBackWrap();
						break;
					case "text_edit":
						$(".element").draggable("enable");
						//获取当前对象的css属性
						console.log("文本单击还没能编辑");
						console.log($(this).attr("txtanimtype"));
						if(!$(this).find("elements").attr("disabled")){
							console.log("没有disable 可编辑");					
						}else{
							
						}
						updateTextWrap($(this));
						break;
					case "img_edit":
						//更新图片编辑区
						console.log("更新图片编辑区");
						//updateImgWrap();
						
						break;
					case "video_edit":
						//更新视频编辑区
						updateVideoWrap();
						break;
					case "office_edit":
						//更新文档数据到编辑区
						updateOfficeWrap();
						break;
					case "weather_edit":	
						//刷新天气控件
						refreshTqEditInfo($(this));
						break;
					case "map_edit":	
						//刷新地图控件
						refreshMapDataEditInfo($(this));
						break;
					case "exchange_edit":	
						//刷新汇率控件
						refreshExchangeEditInfo($(this));
						break;
					case "stock_edit":	
						//刷新股票控件
						refreshStockDataEditInfo($(this));
						break;
					case "numberofruns_edit":	
						//刷新汽车班次控件
						refreshNumberofrunsDataEditInfo($(this));
						break;
					case "date_edit":
						//刷新日期控件
						refreshDate($(this));
					case "countdown_edit":
						//刷新倒计时
						refreshCountdown($(this));
						break;
					case "webpage_edit":
						//更新网页编辑区
						updateWebpageWrap($(this));
						break;
					case "streamMedia_edit":
						//更新流媒体编辑区
						updatestreamMediaWrap($(this));
						break;
					case "mixed_edit":
						//更新混播编辑区
						updateMixedWrap($(this));
						break;
					case "materialApk_edit":
						//更新素材APK编辑区
						updateMaterialApkWrap($(this));
						break;
					case "port_edit":
						updatePortWrap($(this));
						break;
					case "rss_edit":
						break;
					}
					
					
					
					//有跳转功能的控件，刷新跳转数据
					//$("#Sorption").prop("checked",isSorption());
			    	//刷新锁定状态
					//refreshlock();
				}	
			  }
		   }
			//如果按下的是右键，则执行函数
		    if(3 == e.which){
			//if(3 == e.which && isNolock()){
				if (isNolock()){
					showcontextmenu(e,this);
				}else{
					unlockmenu(e,this);
				}
		    	
		    } 
		  return false;
		}
	});
	

	
	//动态组件菜单(更多控件)
	function showdynamicwidgetmenu(e){
		$(".dynamicwidgetmenu").remove();
		//基础菜单
		var menu = $("<div class='dynamicwidgetmenu'>" +
					"<div class='dynamicwidgetmenu-btn dynamicwidgetmenu-streamMedia' onclick='$(\"#for_streamMedia_edit\").click();'>"+$.i18n.prop("progForm.streamMedia")+"</div>" +
					"<div class='dynamicwidgetmenu-btn dynamicwidgetmenu-exchange' onclick='$(\"#for_exchange_edit\").click();'>"+$.i18n.prop("progForm.exchange")+"</div>" +
					"<div class='dynamicwidgetmenu-btn dynamicwidgetmenu-stock' onclick='$(\"#for_stock_edit\").click();'>"+$.i18n.prop("progForm.stock")+"</div>" +
					"<div class='dynamicwidgetmenu-btn dynamicwidgetmenu-map' onclick='$(\"#for_map_edit\").click();'>"+$.i18n.prop("progForm.position")+"</div>" +
					"<div class='dynamicwidgetmenu-btn dynamicwidgetmenu-materialApk' onclick='$(\"#for_materialApk_edit\").click();'>"+$.i18n.prop("progForm.materialApk")+"</div>" +
					"<div class='dynamicwidgetmenu-btn dynamicwidgetmenu-port' onclick='$(\"#for_port_edit\").click();'>"+$.i18n.prop("progForm.port")+"</div>" +
					/*"<div class='dynamicwidgetmenu-btn dynamicwidgetmenu-numberofruns' onclick='$(\"#for_numberofruns_edit\").click();'>"+$.i18n.prop("progForm.numberofruns")+"</div>" +*//*一般不开放，视威专用控件*/
					"</div>");
		menu.css({"position":"absolute","left":e.pageX,"top":e.pageY});
		$("body").append(menu);
		//调整菜单高度
		var divheight = parseInt(menu.height());
		var divtop = parseInt(menu.css("top"));
		if((divheight+divtop)>parseInt($(window).height())){
			menu.css("top",divtop-divheight);
		}
		//对document绑定一个删除Div方法
		e.stopPropagation(); 
		$(document).one("click", function(){
			$(".dynamicwidgetmenu").remove();
		});
	}

	
	//点击右边编辑区的添加跳转(公用)
	$(".skip-edit-div-add-item").on("click",function(){
		var list = $(this).siblings(".skip-edit-div-add-liet");
		$(".skip-edit-div-add-item").css({"color":"white","background":"#65A7F3 url(/apm-web/static/images/program/edit/lower-triangle2.png) no-repeat 78px"})
		list.show(100);
		$(document).one("click", function(){
			$(".skip-edit-div-add-item").css({"color":"#65A7F3","background":"white url(/apm-web/static/images/program/edit/lower-triangle1.png) no-repeat 78px"})
			list.hide(100);
		});
	});
	
	//点击选择跳转场景(公用)
	$("#applyToModal[applytotype='skipscene'] .backg_tpl_item_apply_to").on("click",function(){
		$(this).addClass("active").siblings().removeClass("active");
	});
	
	//跳转场景确认按钮点击(公用)
	$("#applyToModal[applytotype='skipscene'] .applied-to-confirm").on("click",function(){
		var modal = $("#applyToModal");
		var sceneid = modal.find(".backg_tpl_item_apply_to.active").attr("to");
		//确认跳转场景
		skipsceneconfirm(sceneid);
		modal.find(".scene-thumbnail").html("");
		modal.modal("hide");
	});
	
	//显示选择跳转场景框(公用)
	$(".skipscene-applyto").on("click",function(){
		skiphyperscenebox();
/*		//初始化选中场景框-跳转场景状态
		var modal = $("#applyToModal");
		modal.attr("applytotype","skipscene").find(".modal-header .modal-title").html("选择跳转场景");
		//初始化场景数据
		var apply_to = $($(".backg_tpl").html());
		var curSceneid = curScene.attr("id");
		apply_to.each(function(){
			//暂不考虑当前场景跳转情况
			//if($(this).attr("to") != curSceneid){
				$(this).addClass("backg_tpl_item_apply_to").removeClass("backg_tpl_item").removeClass("active").find(".tpl_item_index").prepend("<div class='apply-to-check'></div>");
			//}
		});
		$("#applyToModal .scene-thumbnail").html("").append(apply_to);
		modal.modal('show');*/
	});
	
	//解锁菜单(公用)
	function unlockmenu(e,o){
		$(".contextmenu").remove();
		//基础菜单
		var menu = $("<div class='contextmenu'>" +
					"<div class='contextmenu-btn menu-lock'>"+localObj.b00177+"</div>"+
					"<div class='contextmenu-btn menu-edit'>"+localObj.a00017+"</div>"+
					"</div>");
		//控件个性化菜单项
		var type = $(o).attr("from");		
		menu.css({"position":"absolute","left":e.pageX,"top":e.pageY});
		$("body").append(menu);
		//调整菜单高度
		var divheight = parseInt(menu.height());
		var divtop = parseInt(menu.css("top"));
		if((divheight+divtop)>parseInt($(window).height())){
			menu.css("top",divtop-divheight);
		}
		//对document绑定一个删除Div方法
		$(document).one("click", function(){
			$(".contextmenu").remove();
		});
	}
	
		//自定义右键菜单(公用)
	function showcontextmenu(e,o){
		$(".contextmenu").remove();
		/*var Sorption = "";
		if (isSorption()){
			Sorption = "✓吸附";
			
		}else{
			//Sorption = "✕吸附";
			Sorption = "吸附";
		}*/
		
		//基础菜单
		var menu = $("<div class='contextmenu'>" +
					"<div class='contextmenu-btn contextmenu-bespread menu-bespread'>"+localObj.b00160+"</div>" +
					"<div class='contextmenu-btn menu-lock'>"+localObj.a00250+"</div>"+
					"<div class='contextmenu-btn menu-edit'>"+localObj.a00017+"</div>"+
					"<div class='contextmenu-btn menu-editbj'>"+localObj.d00014+"</div>"+
					//"<div class='contextmenu-btn menu-Sorption'>"+Sorption+"</div>"+
					"<div class='separator'></div>"+
					"<div class='contextmenu-btn contextmenu-popup menu-popup' >"+localObj.b00161+"</div>" +
					"<div class='contextmenu-btn contextmenu-popdown menu-popdown' >"+localObj.b00162+"</div>" +
					"<div class='contextmenu-btn contextmenu-upper menu-upper' >"+localObj.a00275+"</div>" +
					"<div class='contextmenu-btn contextmenu-downner menu-downner'>"+localObj.a00276+"</div>" +
					"<div class='separator'></div>"+
					"<div class='contextmenu-btn contextmenu-del menu-del'>"+localObj.a00025+"</div>" +					
					"</div>");
		//控件个性化菜单项
		/*var type = $(o).attr("from");
		//支持超链接/场景跳转功能的类型跳转
		if(skip.indexOf(type+",")>-1){
			var skiphyperlink = $(o).attr("skiphyperlink");
			var skipscene = $(o).attr("skipscene");
			var delskipclass = null;
			if(!skiphyperlink && !skipscene){
				delskipclass = "gray";
			}else{
				delskipclass = "black";
			}
			menu.prepend("<div class='contextmenu-btn contextmenu-skiphyperlink'>"+"contextmenu-skiphyperlink"+"</div>" +
					"<div class='contextmenu-btn contextmenu-skipscene skipscene-applyto'>"+"skipscene-applyto"+"</div>" +
					"<div class='contextmenu-btn contextmenu-delskip "+delskipclass+"'>"+"测试菜单9"+"</div>" +
					
					"<div class='separator'></div>");
		}*/
		
		menu.css({"position":"absolute","left":e.pageX,"top":e.pageY});
		$("body").append(menu);
		//调整菜单高度
		var divheight = parseInt(menu.height());
		var divtop = parseInt(menu.css("top"));
		if((divheight+divtop)>parseInt($(window).height())){
			menu.css("top",divtop-divheight);
		}
		//对document绑定一个删除Div方法
		$(document).one("click", function(){
			$(".contextmenu").remove();
		});
	}
	
	/*$(document).on("mouseover",".sorption",function(e){
		var childmenu = $("<div class='childmenu'></div>");;
		$("input[name = checkdom]:checkbox").each(function(){			
			if ($(this).attr("id")!=curelement.attr("id")){
				childmenu.append("<div divid="+$(this).attr("id")+" name='checkdom'/>"+$(this).attr("id")+"</div>");				
				console.log("吸附控件id:"+$(this).attr("id"));
			}									
		})	
	    childmenu.css({"position":"absolute","left":e.pageX+100,"top":e.pageY});
		$("body").append(childmenu);
	});*/
	
	//输入跳转链接窗口(公用)
	$(".contextmenu-skiphyperlink").on("click",function(){
		skiphyperlinkbox();
	});
	
	//确认跳转链接设置(公用)
	$(".skiphyperlinkconfirm").on("click",function(){
		var skiphyperilinInputDiv = $(".skiphyperlink-input-div");
		if(curelement != null && skiphyperilinInputDiv.find(".hint-blue").length == 1){
			var input = $(".skiphyperlink-input").val();
			if(input.indexOf("http://") < 0){
				input = "http://"+input;
			}
			curelement.removeAttr("skipscene").attr("skiphyperlink",input);
			top.$.jBox.tip($.i18n.prop("progForm.gotoLinkSetSucess"));
			$("#contextmenu-mask").remove();
			$(".skiphyperlink").remove();
		}else if(skiphyperilinInputDiv.find(".hint-red").length < 1){
			skiphyperilinInputDiv.find(".hint-red,.hint-blue").remove();
			if($(".skiphyperlink .http-detection").hasClass("color-gray")){
				skiphyperilinInputDiv.append("<div class='skiphyperlink-hint hint-red'>"+$.i18n.prop("progForm.pleaseCheckWebPage")+"</div>");
			}else{
				httpdetectionAutoAffirm = true;
				$(".skiphyperlink .http-detection").click();
			}
		}
	});

	//检测按钮是否可用(跳转链接、webpage)
	$(".skiphyperlink-input,.webpagebox-input").on("input propertychange",function(){
		$(".skiphyperlink-input-div,.webpagebox-input-div").find(".hint-red,.hint-blue").remove();
		if($(this).val().length>0){
			$(".http-detection").removeClass("color-gray");
		}else{
			$(".http-detection").addClass("color-gray");
		}
	});
	
	//检测跳转链接是否能访问(跳转链接、webpage)
	//自动确认
	var httpdetectionAutoAffirm = false;
	//正在处理
	var httpdetectionFlag = false;
	$(".http-detection").on("click",function(){
		if(!httpdetectionFlag && !$(this).hasClass("color-gray")){
			httpdetectionFlag = true;
			var fortype = $(this).attr("for");
			var inputDiv = $("."+fortype+"-input-div");
			var input = $("."+fortype+"-input").val();
			if(input.length > 0 ){
				if(input.indexOf("http://") < 0){
					input = "http://"+input;
				}
				inputDiv.find(".hint-red,.hint-blue").remove();
				inputDiv.append("<div class='"+fortype+"-hint hint-red'>"+$.i18n.prop("resWebPage.detectingPleaseWait")+"</div>");
				$.ajax({
					url: pUrl + "/program/ping",
					type: 'post',
					dataType: 'text',
					data:{"url":input},
					success:function(data){
						inputDiv.find(".hint-red,.hint-blue").remove();
						if(data == "pass"){
							inputDiv.append("<div class='"+fortype+"-hint hint-blue'>"+$.i18n.prop("resWebPage.detectPass")+"</div>");
							if(httpdetectionAutoAffirm){
								setTimeout(function(){
									$(".httpdetectionAutoAffirm").click();
								},300);
							}
						}else{
							inputDiv.append("<div class='"+fortype+"-hint hint-red'>"+$.i18n.prop("resWebPage.invalidURLPleaseCheck")+"</div>");
						}
						httpdetectionFlag = false;
						httpdetectionAutoAffirm = false;
					},
					error:function(){
						httpdetectionAutoAffirm = false;
						httpdetectionFlag = false;
					}
				});
			}else{
				httpdetectionAutoAffirm = false;
				httpdetectionFlag = false;
			}
		}
	});
	
	//修改跳转内容(公用)
	$(".keip-update").on("click",function(){
		var sceneid = curelement.attr("skipscene");
		if(!sceneid||sceneid==""){
			var skiphyperlink = curelement.attr("skiphyperlink");
			if(!skiphyperlink||skiphyperlink==""){
				//没有跳转

			}else{
				//跳转链接
				skiphyperlinkbox();
			}
		}else{
			//跳转场景
			//$(this).siblings(".menu-staticselectpreview").click();
			skiphyperscenebox();
		}
	});
	
	//删除跳转链接/场景(公用)
	$(".contextmenu-delskip,.keip-del").on("click",function(){
		if(curelement != null){
			if(curelement.attr("skiphyperlink")||curelement.attr("skipscene")){
				curelement.removeAttr("skiphyperlink").removeAttr("skipscene");

				top.$.jBox.tip($.i18n.prop("usrList.deleteSuccess"));
			}else{
				top.$.jBox.tip($.i18n.prop("progForm.noSetLinks"), 'warning');
			}
			$(".skiphyperlink").remove();
			$("#contextmenu-mask").remove();
		}else{
			top.$.jBox.tip($.i18n.prop("progForm.noSelectedElement"), 'warning');
		}
	});

	//下拉选择音乐
	$(".for_program_music_edit").on("click",function(e){
		$(".programmusiccontextmenu").remove();
		//基础菜单
		var menu = $("<div class='contextmenu programmusiccontextmenu'>" +
					'<div class="contextmenu-btn" data-toggle="modal" data-target="#musicModal">'+$.i18n.prop("progForm.selectMusic")+'</div>' +
					'<div class="contextmenu-btn" onclick="$(\'.for_program_music_edit\').removeAttr(\'msrc\').removeAttr(\'mname\').removeAttr(\'mlong\').removeAttr(\'msource\').removeAttr(\'attrid\').find(\'.music_text\').html($.i18n.prop(\'terminalMonitor.nothing\'));">'+$.i18n.prop("progForm.noBackgroundMusic")+'</div>' +
					"</div>");		
		menu.css({"position":"absolute","left":e.pageX,"top":e.pageY});
		$("body").append(menu);
		//对document绑定一个删除Div方法
		$(document).one("click", function(){
			$(".programmusiccontextmenu").remove();
		});
	});
	
	//双击元素
	//$(".element").live("dblclick",function(){
	$(document).on("dblclick",".element",function(){	
	console.log("双击元素");
		//如果锁定了不响应双击
		if(!isNolock()){
			return ;
		}
		if($(this).attr("from") == "text_edit" ){
			$(this).draggable("disable");
			var wEdT = $(this).find(".ql-editor");
			//wEdT.focus();
			textEditorTool.textEditor("contenteditable","true");
			wEdT.parent().css("cursor","text");
			//wEdT.attr("contenteditable",true).parent().css("cursor","text");
			textEditorTool.textEditor("initSelection");
			var palceholder = wEdT.find(".palceholder");
			if(palceholder.length){
				palceholder.after("<div><br></div>");
				palceholder.remove();
			}
			setTimeout(function(){			
				wEdT.focus();
			},200);
		}
	});
	
	//这里重点关注
	//$(".element").find(".elements").live("blur",function(){
	$(".element").on("blur",".elements",function(){
		console.log("blur");	
		$(this).parent().removeClass("active");
	/*	$(this).attr("disabled","disabled");
		$(this).attr("readonly","readonly");*/
		$(this).parent().draggable("enable");
	});
	
	//元素可拉大拉小	
	//djj注释
/*	$(".text-align").find(".glyphicon-align").live("click",function(){
		var oldval = curelement.css("text-align");
		var obj = $(this);*/
	/*	
		$.undone("register",
	        function () { */
	    		//redo 	
				//djj注释
/*				if(obj.hasClass("active")){
					obj.removeClass("active");
					left();
				}else{					
					obj.addClass("active").siblings(".glyphicon-align").removeClass("active");				
					switch(obj.attr("type")){
					case "left":
						left();
						break;
					case "center":
						center();
						break;
					case "right":
						right();
						break;
					case "justify":
						justify();
						break;
					}
				}*/
	        /*},
	        function () { 
	        	//undo 
	        	curelement.css("text-align",oldval);
				curelement.find("textarea").css("text-align",oldval);
				$(".text-align").find(".glyphicon-align[type="+oldval+"]").addClass("active").siblings(".glyphicon-align").removeClass("active");		
	        }
	    );*/
		
		
		
		/* redo();*/
	//djj注释
	//});
	//djj注释
//	$(".text-align").find(".glyphicon-bold").live("click",function(){
//		var obj = $(this);
	/*	$.undone("register",
		        function(){ */
		    		//redo 
//					if($(obj).hasClass("active")){
//						$(obj).removeClass("active");
//						curelement.css("font-weight","normal");
//					}else{
//					$(obj).addClass("active");
//						bold();
//					}
		        /*},
		        function(){ 
		        	//undo 
		        	curelement.css("font-weight","normal");
		        	$(".text-align").find(".glyphicon-bold").removeClass("active");		
			        
		        }
		    );*/
		
		
//	});
/*	$(".text-align").find(".glyphicon-italic").live("click",function(){
		if($(this).hasClass("active")){
			$(this).removeClass("active");
			curelement.css("font-style","normal");
		}else{
			$(this).addClass("active");
			itallic();
		}
		
	});
	$(".text-align").find(".glyphicon-underline").live("click",function(){
		if($(this).hasClass("active")){
			$(this).removeClass("active");
			curelement.css("text-decoration","none");			
			curelement.find("textarea").css("text-decoration","none");
		}else{
			$(this).addClass("active");
			setline();
		}
		
	});*/

	
	//查询节目素材
	function scanningResources(){
		//场景内容过滤
		materialIds = "";
		materialCollection = {};
		functionalitySet = {};
		$("[id^='topfd']").each(function(){
			console.log("场景ID："+$(this).attr("id"));
			contentFiltering($(this).prop("outerHTML"));
		});
		$("#materialIds").val(materialIds);
		$("#materialCollection").val(JSON.stringify(materialCollection));
		$("#functionalitySet").val(JSON.stringify(functionalitySet));
	}
	
	//查询节目素材
	function contentFiltering(html){
		console.log("查询节目素材");
		var scene = $(html);
		var images = null;
		var sceneid = scene.attr("id");
		var funcs = {};
		
		scene.find(".element").each(function(){
			var from = $(this).attr("from");
			switch(from){
			case "text_edit":
				funcs.text="1";
				//functionalitySet.text.push(sceneid);
				if($(this).attr("txtanimtype")!="none"){
					funcs.textmarquee="1";
				}
				break;
			case "img_edit":
				funcs.img="1";
				//functionalitySet.img.push(sceneid);
				var curimglist = $(this).attr("curimglist");
				if(curimglist && curimglist.length > 1){
					var imgobjs = JSON.parse(curimglist);
					for(var i=0;i<imgobjs.length;i++){
						obj = {};
						obj.src = imgobjs[i].src;
						obj.id = imgobjs[i].attrid;
						obj.type = "img";
						materialCollection[obj.id] = obj;
						materialIds += obj.id+",";
						
						if(images == null){
							images = obj.id;
						}else{
							images += ","+obj.id;
						}
					}
				}
				break;
			case "mixed_edit":
				funcs.mixed="1";
				var curimglist = $(this).attr("curimglist");
				if(curimglist && curimglist.length > 1){
					//var imgobjs=eval(curimglist);
					var imgobjs = JSON.parse(curimglist);
					for(var i=0;i<imgobjs.length;i++){
						var type = imgobjs[i].type;
						var obj = null;
						if(type === "video"){
							obj = {};
							obj.type = type;
							obj.src = imgobjs[i].source;
							obj.id = imgobjs[i].attrid;
						}else if(type === "img"){
							obj = {};
							obj.src = imgobjs[i].src;
							obj.id = imgobjs[i].attrid;
							obj.type = type;
						}
						if(obj){
							materialCollection[obj.id] = obj;
							materialIds += obj.id+",";
						}
					}
				}
				break;
			case "video_edit":
				funcs.video="1";
				//functionalitySet.video.push(sceneid);
				var curimglist = $(this).attr("curimglist");
				if(curimglist && curimglist.length > 1){
					//var imgobjs=eval(curimglist);
					var imgobjs = JSON.parse(curimglist);
					for(var i=0;i<imgobjs.length;i++){
						var obj = {};
						obj.src = imgobjs[i].source;
						obj.id = imgobjs[i].attrid;
						obj.type = "video";
						materialCollection[obj.id] = obj;
						materialIds += obj.id+",";
					}
				}
				break;
/*			case "music_edit":
				funcs.music="1";
				functionalitySet.music = "1";
				var curimglist = $(this).attr("curimglist");
				if(curimglist != null && curimglist != undefined){
					//var imgobjs=eval(curimglist);
					var imgobjs = JSON.parse(curimglist);
					for(var i=0;i<imgobjs.length;i++){
						var obj = {};
						obj.src = imgobjs[i].source;
						obj.id = imgobjs[i].attrid;
						obj.type = "music";
						materialCollection[obj.id] = obj;
					}
				}
				break;*/
			case "office_edit":
				//functionalitySet.office = "1";
				var curimglist = $(this).attr("curimglist");
				var officetype = $(this).attr("officetype");
				if(curimglist && curimglist.length > 1){
					//var imgobjs=eval(curimglist);
					var imgobjs = JSON.parse(curimglist);
					for(var i=0;i<imgobjs.length;i++){
						var obj = {};
						if(officetype == "ppt" || officetype == "pdf" ){
							obj.src = imgobjs[i].imglist;
						}else{
							funcs.office="1";
							obj.src = imgobjs[i].htmlurl;
						}
						obj.id = imgobjs[i].attrid;
						obj.type = officetype;
						materialCollection[obj.id] = obj;
						materialIds += obj.id+",";
					}
				}
				break;
			case "ppt_edit":
				funcs.ppt="1";
				//functionalitySet.ppt = "1";
				var curimglist = $(this).attr("curimglist");
				if(curimglist && curimglist.length > 1){
					//var imgobjs=eval(curimglist);
					var imgobjs = JSON.parse(curimglist);
					for(var i=0;i<imgobjs.length;i++){
						var obj = {};
						obj.src = imgobjs[i].imglist;
						obj.id = imgobjs[i].attrid;
						obj.type = "ppt";
						materialCollection[obj.id] = obj;
						materialIds += obj.id+",";
					}
				}
				break;
			case "pdf_edit":
				funcs.pdf="1";
				//functionalitySet.ppt = "1";
				var curimglist = $(this).attr("curimglist");
				if(curimglist && curimglist.length > 1){
					//var imgobjs=eval(curimglist);
					var imgobjs = JSON.parse(curimglist);
					for(var i=0;i<imgobjs.length;i++){
						var obj = {};
						obj.src = imgobjs[i].imglist;
						obj.id = imgobjs[i].attrid;
						obj.type = "pdf";
						materialCollection[obj.id] = obj;
						materialIds += obj.id+",";
					}
				}
				break;
			case "word_edit":
				funcs.word="1";
				//functionalitySet.word = "1";
				var curimglist = $(this).attr("curimglist");
				if(curimglist && curimglist.length > 1){
					//var imgobjs=eval(curimglist);
					var imgobjs = JSON.parse(curimglist);
					for(var i=0;i<imgobjs.length;i++){
						var obj = {};
						obj.src = imgobjs[i].wordurl;
						obj.id = imgobjs[i].attrid;
						obj.type = "word";
						materialCollection[obj.id] = obj;
						materialIds += obj.id+",";
					}
				}
				break;
			case "excel_edit":
				funcs.excel="1";
				//functionalitySet.excel = "1";
				var curimglist = $(this).attr("curimglist");
				if(curimglist && curimglist.length > 1){
					//var imgobjs=eval(curimglist);
					var imgobjs = JSON.parse(curimglist);
					for(var i=0;i<imgobjs.length;i++){
						var obj = {};
						obj.src = imgobjs[i].excelurl;
						obj.id = imgobjs[i].attrid;
						obj.type = "excel";
						materialCollection[obj.id] = obj;
						materialIds += obj.id+",";
					}
				}
				break;
			case "weather_edit":
				funcs.weather="1";
				//functionalitySet.weather = "1";
				break;
			case "date_edit":
				funcs.date="1";
				//functionalitySet.date = "1";
				break;
			case "countdown_edit":
				funcs.countdown="1";
				//functionalitySet.countdown = "1";
				break;
			case "webpage_edit":
				funcs.webpage="1";
				//functionalitySet.webpage = "1";
				break;	
			case "map_edit":
				funcs.map="1";
				break;
			case "stock_edit":
				funcs.stock="1";
				break;
			case "exchange_edit":
				funcs.exchange="1";
				break;
			case "streamMedia_edit":
				funcs.streamMedia="1";
				break;
			case "numberofruns_edit":
				funcs.numberofruns="1";
				var o = $(this);
				var obj = {};
				obj.imgid = o.attr("imgid");
				obj.imgsrc = o.attr("imgsrc");
				//如果有自定义图片
				if(obj.imgid && obj.imgid.length > 0){
					funcs.img="1";
					apkimg = {};
					apkimg.src = obj.imgsrc;
					apkimg.id = obj.imgid;
					apkimg.type = "img";
					materialCollection[apkimg.id] = apkimg;
					materialIds += apkimg.id+",";
					if(images == null){
						images = obj.imgid;
					}else{
						images += ","+obj.imgid;
					}
				}
				break;
			case "materialApk_edit":
				funcs.materialApk="1";
				var o = $(this);
				var obj = {};
				obj.backtime = o.attr("backtime");
 				obj.id = o.attr("attrid");
				obj.packagename = o.attr("packagename");
				obj.path = o.attr("path");
				obj.imgid = o.attr("imgid");
				obj.imgsrc = o.attr("imgsrc");
				//如果有自定义图片
				if(obj.imgid && obj.imgid.length > 0){
					funcs.img="1";
					apkimg = {};
					apkimg.src = obj.imgsrc;
					apkimg.id = obj.imgid;
					apkimg.type = "img";
					materialCollection[apkimg.id] = apkimg;
					materialIds += apkimg.id+",";
					if(images == null){
						images = obj.imgid;
					}else{
						images += ","+obj.imgid;
					}
				}
				materialCollection[obj.id] = obj;
				materialIds += obj.id+",";
				break;
			}
		});
			//jq颜色选择器
	 $('.addColor').colpick({
		layout:'rgbhex',
		color:'#fff',
		onSubmit:function(hsb,hex,rgb,el) {
		/*	$(el).css('background-color', '#'+hex);	
		*/
			curScene.css('background-color', '#'+hex).attr("bgcolor",curScene.css('background-color'));	
			$(".backg_tpl_item.active").attr('backcolor', curScene.css('background-color'));
			$(".bgcolor_item").removeClass("active");
			$(".bgcolor_item").each(function(){
				if($(this).css('background-color') == curScene.css('background-color')){
					$(this).addClass("active");
				}
			})
			/*var add = $('<span style="background-color:#'+hex+'" class="bgcolor_item"></span>');		
			$('.color_wrap').append(add);*/
		
			$(el).colpickHide();
			//随时缩略图
			sceneThumbnail();
		}
	}).css('background-color', '#337ab7'); 
		//场景音乐
	    var musics = scene.find(".scene_music");
	    if(musics.length > 0 ){
	    	funcs.music="1";
		    musics.each(function(){
				var obj = {};
				obj.src = $(this).attr("msource");
				obj.id = $(this).attr("attrid");
				obj.type = "music";
				materialCollection[obj.id] = obj;
				materialIds += obj.id+",";
		    });
	    }

		//场景背景
	    var backattrid = scene.attr("backattrid");
	    if(backattrid&&backattrid.length>0){
	    	var obj = {};
	    	obj.src = scene.css("background-image").replace(/url\([\"\']?/g,"").replace(/[\"\']?\)/g,"");
	    	obj.id = backattrid;
	    	obj.type = "back";
	    	materialCollection[obj.id] = obj;
	    	materialIds += obj.id+",";
	    }
	    
		functionalitySet[sceneid] = funcs;
		console.log("扫描功能");
		console.log(functionalitySet);
		console.log("扫描素材");
		console.log(materialCollection);
		
		if(images != null){
			materialJH.images = images;
		}
		//alert("准备计算materialJH长度 materialJH.length："+materialJH.length);
		if(materialJH != {}){
			//alert("materialJH准备写到页面");
			$("#materialJH").val(JSON.stringify(materialJH));
			//alert("materialJH写完");
		}
	}


	//ppt素材列表
	//$("#pptModal").find(".pptmodal-m-i").live("click",function(){
	$("#pptModal").on("click",".pptmodal-m-i",function(){
		if($(this).hasClass("active")){
			$(this).removeClass("active");
		}else{
			$(this).addClass("active");
		}
	});
	//word素材列表
	//$("#wordModal").find(".wordmodal-m-i").live("click",function(){
	$("#wordModal").on("click",".wordmodal-m-i",function(){
		if($(this).hasClass("active")){
			$(this).removeClass("active");
		}else{
			$(this).addClass("active");
		}
	});	
	//excel素材列表excelmodal-m-i
	//$("#excelModal").find(".excelmodal-m-i").live("click",function(){
	$("#excelModal").on("click",".excelmodal-m-i",function(){
		if($(this).hasClass("active")){
			$(this).removeClass("active");
		}else{
			$(this).addClass("active");
		}
	});
	
	/**music素材的确定按钮-音乐是作为场景控件（改用公用的了，下面已废弃） **/
/*	$("#musicModal").find(".up-modal-m-i").live("click",function(){
		if($(this).hasClass("active")){
			$(this).removeClass("active");
		}else{
			$(this).addClass("active");
		}
	});*/
	
	/**music素材的确定按钮-音乐是作为节目控件 **/
/*	$("#musicModal").find(".musicmodal-m-i").live("click",function(){
		if($(this).hasClass("active")){
			$(this).removeClass("active");
		}else{
			$(this).addClass("active").siblings().removeClass("active");
		}
	});*/
	
	/**music素材的确定按钮-音乐是作为节目控件**/
/*	$("#musicModal").find(".confirm").live("click",function(){	

		$("#musicModal").find(".musicmodal-m-i.active").each(function(){
			var src = $(this).find("img").attr("src");
			var name = $(this).find("img").attr("alt");
			var long = $(this).find("img").attr("long");
			var source = $(this).find("img").attr("source");
			var attrid = $(this).find("img").attr("attrid");

			$(".for_program_music_edit").attr("msrc",src).attr("mname",name).attr("mlong",long).attr("msource",source).attr("attrid",attrid).find(".music_text").html(name);
		});	
		
		//清除素材选中
		$("#musicModal").find(".musicmodal-m-i").removeClass("active");
		$("#musicModal").modal("hide");
	});*/
	
	//场景音乐设置(music)
	function sceneMusicSet(scene,src,name,long,source,attrid){
		var scene_music = scene.find(".scene_music[attrid='"+attrid+"']");
		if(scene_music.length>0){
			scene_music.attr("msrc",src).attr("mname",name).attr("mlong",long).attr("msource",source);
		}else{
			scene.append("<div class='hide scene_music' msrc='"+src+"' mname='"+name+"' mlong='"+long+"' msource='"+source+"' attrid='"+attrid+"'></div>");
		}
	}
	
	//删除场景选中音乐(music)
	function sceneMusicDel(attrid,scene){
		//如果没传场景，认为是当前场景
		if(!scene){
			scene = curScene;
		}
		//如果没传attrid，认为是清空场景音乐
		if(!attrid){
			scene.find(".scene_music").remove();
		}else{
			scene.find(".scene_music[attrid='"+attrid+"']").remove();
		}
		//更新当前背景编辑区，场景音乐数据
		updateMusicWrap();
	}
	
	//场景音乐编辑区数据根据场景内容还原,不传场景对象，当作是当前场景处理(music)
	function updateMusicWrap(isHide,scene){
		if(!isHide){
			isHide = false;
		}
		if(!scene){
			scene = curScene;
		}
		var music_wrap = $(".music_wrap");
		//清空场景控件音乐内容
		music_wrap.html("");
		var index = 0;
		scene.find(".scene_music").each(function(){
			index++;
			var src = $(this).attr("msrc");
			var name = $(this).attr("mname");
			var long = $(this).attr("mlong");
			var source = $(this).attr("msource");
			var attrid = $(this).attr("attrid");
			music_wrap.append("<div class='music_item' msrc='"+src+"' mname='"+name+"' mlong='"+long+"' msource='"+source+"' attrid='"+attrid+"'>"+
				"<div class='music_item_front'>"+
					"<span class='music_index'>"+index+"</span>"+
				"</div>"+
				"<div class='music_item_back'>"+
	 				"<div class='music-ico'></div>"+
 					"<div class='music_item_name ellipsis' title=''>"+name+"</div>"+	
 					"<div class='pull-right btnu music-del' attrid='"+attrid+"'>"+$.i18n.prop("userForm.delete")+"</div>"+
 					"<div class='pull-right btnu music-applyto'>"+$.i18n.prop("progForm.applyTo")+"</div>"+
				"</div>"+
 			"</div>");
		});
		//如果没有音乐，把清空按钮变灰，隐藏场景控件编辑区-音乐编辑块
		if(index<1){
			if(isHide){
				$(".backg_music .tip-add").hide();
				$(".emptymusic").addClass("color-gray").parent().hide();
			}else{
				$(".backg_music .tip-add").show();
				$(".emptymusic").addClass("color-gray").parent().show();
			}
		}else{
			$(".backg_music .tip-add").hide();
			$(".emptymusic").removeClass("color-gray").parent().show();
		}
	}
	
	/**根据attrid删除当前场景的音乐(music)*/
	$(".music-del").on("click",function(){
		sceneMusicDel($(this).attr("attrid"));
	});
	
	/**清空当前场景的音乐(music)*/
	$(".emptymusic").on("click",function(){
		if(!$(this).hasClass("color-gray")){
			sceneMusicDel();
		}
	});
	
	/**music素材的确定按钮-音乐是作为基于场景的音乐控件(music)**/
	//$("#musicModal").find(".confirm").live("click",function(){
	$("#musicModal").on("click",".confirm",function(){
		//判断是否有选中素材
		if($("#musicModal .up-modal-m-i.active").length == 0){
			top.$.jBox.tip($.i18n.prop("progForm.pleaseThroughClickToSelectMaterial"));
			return;
		}
		
		var appliedToAllFlag = false;
		if($(this).hasClass("applied-to-all")){
			appliedToAllFlag = true;
		}
		//场景音乐数据更新	
		$("#musicModal").find(".up-modal-m-i.active").each(function(){
			var src = $(this).find("img").attr("src");
			var name = $(this).find("img").attr("alt");
			var long = $(this).find("img").attr("long");
			var source = $(this).find("img").attr("source");
			var attrid = $(this).find("img").attr("attrid");
			if(appliedToAllFlag){
				$(".content-center-topfd").each(function(){
					sceneMusicSet($(this),src,name,long,source,attrid);
				});
			}else{
				sceneMusicSet(curScene,src,name,long,source,attrid);
			}
		});	
		//更新编辑区数据
		updateMusicWrap();
		
		//清除素材选中
		$("#musicModal").find(".up-modal-m-i").removeClass("active");
		$("#musicModal").modal("hide");
	});
	
	//music素材的确定按钮-音乐是作为场景控件时的确认选择音乐素材事件(独立场景控件)
/*	$("#musicModal").find(".confirm").live("click",function(){	
		if(prev){
			if(prev.attr("id") != curelement.attr("id")){
				console.log("切换了元素  先清空curImgList 以及 img_wrap");
				$curImgList.length = 0;
				if(curelement.attr("curimglist") != ""){
					console.log("1111111111111111");
					$curImgList = JSON.parse(curelement.attr("curimglist"));
					console.log("1111111111111111");
				}
			}else{			
			}
		}else{
			
		}
		
		$("#musicModal").find(".musicmodal-m-i").each(function(){
			console.log("22222222222222222222");
			if($(this).hasClass("active")){
				console.log("333333333333333333");
				var src = $(this).find("img").attr("src");
				var name = $(this).find("img").attr("alt");
				var long = $(this).find("img").attr("long");
				var source = $(this).find("img").attr("source");
				var attrid = $(this).find("img").attr("attrid");
				console.log("确定之前的$curImgList");
				console.log($curImgList.length);
				if(!$curImgList.length){
					console.log(curelement);
					curelement.find("img").attr("src",src);					
				}
				$curImgList.push({"src":src,"name":name,"long":long,"source":source,"attrid":attrid});
				$(".music_edit").find(".music_wrap")
				.append('<div class="music_item"><img src='+src+' alt='+name+' long='+long+' source='+source+' attrid='+attrid+'><span class="music_item_index">'+$curImgList.length+'</span><span class="long music_item_time">'+formatSeconds(long)+'</span><span class="music_item_name ellipsis">'+name+'</span><span class="glyphicon glyphicon-trash"></span></div>');
			}
		});	
		
		if(!$curImgList.length){
			console.log("没有选中任何元素");
			curelement.find("img").attr("src","");
			curelement.attr("curimglist","");
		}else{
			curelement.attr("curimglist",JSON.stringify($curImgList));
		}
		
		$("#musicModal").find(".musicmodal-m-i").removeClass("active");
		$("#musicModal").modal("hide");
		prev = curelement;
		
		//随时缩略图
		sceneThumbnail();
	});	*/
	

	//word素材的确定按钮
/*	$("#wordModal").find(".confirm").live("click",function(){
		console.log("ppt未添加之前的$curImgList");
		console.log($curImgList);
		if(prev){
			if(prev.attr("id") != curelement.attr("id")){
				console.log("切换了元素  先清空curImgList 以及 ppt_wrap");
				$curImgList.length = 0;
				if(curelement.attr("curimglist") != ""){
					$curImgList = JSON.parse(curelement.attr("curimglist"));
				}
				 $(".img_edit").find(".img_wrap").html(""); 
			}else{
				console.log("当前元素   ppt添加的操作");
			}
		}else{
			console.log("不存在prev 就是页面中第一个img");
		}
	
		var curdiv = curelement;
		console.log("1111");
		console.log(curdiv);
		$("#wordModal").find(".wordmodal-m-i").each(function(){
			if($(this).hasClass("active")){
				var obj = $(this);				
				$.ajax({
					url:pUrl + "/fileInfosa/download",
					async:false,
					data:{"id": $(this).find("img").attr("attrid")},
					success:function(data){
						console.log(data);
						console.log($(obj));
						var src = $(obj).find("img").attr("src");
						var name = $(obj).find("img").attr("alt");
						var note = $(obj).find("img").attr("note");
						var wordurl = $(obj).find("img").attr("wordurl");
						var htmlurl = $(obj).find("img").attr("htmlurl");
						var attrid = $(obj).find("img").attr("attrid");
						console.log("word确定之前的$curImgList");
						console.log($curImgList.length);
						if(!$curImgList.length){
							console.log(curelement);
							curelement.find("img").attr("src",src);					
						}			
						$curImgList.push({"src":src,"name":name,"note":note,"wordurl":wordurl,"htmlurl":data,"attrid":attrid});
						console.log($curImgList);
						
						var wrap = null;
						if(curelement.attr("officetype")){
							wrap = $(".office_edit").find(".office_wrap");
						}else{
							wrap = $(".word_edit").find(".word_wrap");
						}
						wrap.append('<div class="word_item"><img src='+src+' alt='+name+' note='+note+' wordurl='+wordurl+' htmlurl='+data+' attrid='+attrid+'><span class="word_item_index">'+$curImgList.length+'</span><span class="word_item_note">'+note+'</span><span class="word_item_name ellipsis">'+name+'</span><span class="glyphicon glyphicon-trash"></span></div>');	
					}
				});
			}
		});	
		if(!$curImgList.length){
			console.log("没有选中任何元素");
			curelement.find("img").attr("src","");
			curelement.attr("curimglist","");
		}else{
			curelement.attr("curimglist",JSON.stringify($curImgList));
		}
		
		$("#wordModal").find(".wordmodal-m-i").removeClass("active");
		$("#wordModal").modal("hide");
		prev = curelement;
		//随时缩略图
		sceneThumbnail();
	});*/
	
	//excel素材的确定按钮
/*	$("#excelModal").find(".confirm").live("click",function(){
		if(prev){
			if(prev.attr("id") != curelement.attr("id")){
				$curImgList.length = 0;
				if(curelement.attr("curimglist") != ""){
					$curImgList = JSON.parse(curelement.attr("curimglist"));
				}
			}else{
			}
		}else{
		}
		
		$("#excelModal").find(".excelmodal-m-i").each(function(){
			if($(this).hasClass("active")){
				var obj = $(this);
				$.ajax({
					url:pUrl + "/fileInfosa/download",
					async:false,
					data:{"id": $(obj).find("img").attr("attrid")},
					success:function(data){
						console.log("hahah");
						var src = $(obj).find("img").attr("src");
						var name = $(obj).find("img").attr("alt");
						var note = $(obj).find("img").attr("note");
						var excelurl = $(obj).find("img").attr("excelurl");
						var htmlurl = $(obj).find("img").attr("htmlurl");
						var attrid = $(obj).find("img").attr("attrid");
						if(!$curImgList.length){
							console.log(curelement);
							console.log(data);
							curelement.find("img").attr("src",src);
						}
						$curImgList.push({"src":src,"name":name,"note":note,"excelurl":excelurl,"htmlurl":data,"attrid":attrid});
						console.log($curImgList);
						var wrap = null;
						if(curelement.attr("officetype")){
							wrap = $(".office_edit").find(".office_wrap");
						}else{
							wrap = $(".excel_edit").find(".excel_wrap");
						}
						wrap.append('<div class="excel_item"><img src='+src+' alt='+name+' note='+note+' excelurl='+excelurl+' htmlurl='+data+' attrid='+attrid+'><span class="excel_item_index">'+$curImgList.length+'</span><span class="excel_item_note">'+note+'</span><span class="excel_item_name ellipsis">'+name+'</span><span class="glyphicon glyphicon-trash"></span></div>');
					}
				})
			}
		});
		if(!$curImgList.length){
			console.log("没有选中任何元素");
			curelement.find("img").attr("src","");
			curelement.attr("curimglist","");
		}else{
			curelement.attr("curimglist",JSON.stringify($curImgList));
		}
		
		$("#excelModal").find(".excelmodal-m-i").removeClass("active");
		$("#excelModal").modal("hide");
		prev = curelement;
		//随时缩略图
		sceneThumbnail();
	});*/
	

	$(".video_edit .glyphicon-trash").on("click",function(){
		console.log($curImgList);
		$(this).parent().remove();
		$curImgList = [];
		curelement.attr("curimglist","");
		if($(".video_edit").find(".video_item").length){
			$(".video_edit").find(".video_item").each(function(){
				$(this).find(".video_item_index").text($(this).index()+1);
				var src = $(this).find("img").attr("src");
				var name = $(this).find("img").attr("alt");
				var source = $(this).find("img").attr("source");
				var long = $(this).find("img").attr("long");
				$curImgList.push({"src":src,"name":name,"source":source,"long":long});
				if($curImgList.length == 1 ){
					curelement.find("img").attr("src",src);
				}
			});
			curelement.attr("curimglist",JSON.stringify($curImgList));
		}else{
			curelement.find("img").attr("src","");
		}
		sceneLong(curScene);
		//随时缩略图
		sceneThumbnail();
	});
	
/*	$(".music_edit .glyphicon-trash").live("click",function(){			
		$(this).parent().remove();
		$curImgList = [];
		curelement.attr("curimglist","");
		if($(".music_edit").find(".music_item").length){
			$(".music_edit").find(".music_item").each(function(){
				$(this).find(".music_item_index").text($(this).index()+1);
				var src = $(this).find("img").attr("src");
				var name = $(this).find("img").attr("alt");
				var long = $(this).find("img").attr("long");
				var source = $(this).find("img").attr("source");
				$curImgList.push({"src":src,"name":name,"long":long,"source":source});
				if($curImgList.length == 1 ){
					curelement.find("img").attr("src",src);
				}
			});
			curelement.attr("curimglist",JSON.stringify($curImgList));
		}else{
			curelement.find("img").attr("src","");
		}
		//随时缩略图
		sceneThumbnail();
	});*/
	
	$(".ppt_edit .glyphicon-trash").on("click",function(){
		console.log($curImgList);			
		$(this).parent().remove();
		$curImgList = [];
		curelement.attr("curimglist","");
		if($(".ppt_edit").find(".ppt_item").length){
			$(".ppt_edit").find(".ppt_item").each(function(){
				$(this).find(".ppt_item_index").text($(this).index()+1);
				var src = $(this).find("img").attr("src");
				var name = $(this).find("img").attr("alt");
				var imglist = $(this).find("img").attr("imglist");
				var note = $(this).find("img").attr("note");
				$curImgList.push({"src":src,"name":name,"imglist":imglist.replace(/\\/g,"/"),"note":note});
				if($curImgList.length == 1 ){
					curelement.find("img").attr("src",src);
				}
			});
			curelement.attr("curimglist",JSON.stringify($curImgList));
		}else{
			curelement.find("img").attr("src","");
		}
		//随时缩略图
		sceneThumbnail();
	});
	
	$(".word_edit .glyphicon-trash").on("click",function(){
		console.log($curImgList);
		$(this).parent().remove();
		$curImgList = [];
		curelement.attr("curimglist","");
		if($(".word_edit").find(".word_item").length){
			$(".word_edit").find(".word_item").each(function(){
				$(this).find(".word_item_index").text($(this).index()+1);
				var src = $(this).find("img").attr("src");
				var name = $(this).find("img").attr("alt");
				var note = $(this).find("img").attr("note");
				var wordurl = $(this).find("img").attr("wordurl");
				var htmlurl = $(this).find("img").attr("htmlurl");
				$curImgList.push({"src":src,"name":name,"note":note,"wordurl":wordurl,"htmlurl":htmlurl});
				if($curImgList.length == 1 ){
					curelement.find("img").attr("src",src);
				}
			});
			curelement.attr("curimglist",JSON.stringify($curImgList));
		}else{
			curelement.find("img").attr("src","");
		}
		//随时缩略图
		sceneThumbnail();
	});
	
	
	$(".excel_edit .glyphicon-trash").on("click",function(){					
		$(this).parent().remove();
		$curImgList = [];
		curelement.attr("curimglist","");
		if($(".excel_edit").find(".excel_item").length){
			$(".excel_edit").find(".excel_item").each(function(){
				$(this).find(".excel_item_index").text($(this).index()+1);
				var src = $(this).find("img").attr("src");
				var name = $(this).find("img").attr("alt");
				var note = $(this).find("img").attr("note");
				var excelurl = $(this).find("img").attr("excelurl");
				var htmlurl = $(this).find("img").attr("htmlurl");
				$curImgList.push({"src":src,"name":name,"note":note,"excelurl":excelurl,"htmlurl":htmlurl});
				if($curImgList.length == 1 ){
					curelement.find("img").attr("src",src);
				}
			});
			curelement.attr("curimglist",JSON.stringify($curImgList));
		}else{
			curelement.find("img").attr("src","");
		}
		//随时缩略图
		sceneThumbnail();
	});
	
	$(".office_edit .speed_wrap .btn").on("click",function(){
		$(this).addClass("active").siblings().removeClass("active");
		curelement.attr("delay",$(this).attr("delay"));
		
	});
	$(".word_edit .speed_wrap .btn").on("click",function(){
		$(this).addClass("active").siblings().removeClass("active");
		curelement.attr("delay",$(this).attr("delay"));
		
	});
	$(".excel_edit .speed_wrap .btn").on("click",function(){
		$(this).addClass("active").siblings().removeClass("active");
		curelement.attr("delay",$(this).attr("delay"));
	});
	//点击信号源类型
	$(".port_edit .port_type_detail .radio_icon").on("click",function(){
		if(!$(this).hasClass("selected")){
			$(this).parents(".port_row").find(".radio_icon").removeClass("selected");
			$(this).addClass("selected");
        }   
		curelement.attr("porttype",$(this).attr("type"));
	});
	//点击backg_tpl_item切换场景
	$(".backg_tpl_item").on("click",function(){
		/*if(curelement.attr("from") == "text_edit"){		*/
			cancelEditor($(".element"));
			//$(".element").find(".ql-editor").attr("contenteditable",false).parent().css("cursor","default");
			//$(".element").find(".wangEditor-btn-container").hide();
			//$(".element").draggable("enable");这句话运行会出错
			/*curelement.find(".frameOverlay").show();*/
		/*}*/
				
		if(!$(this).hasClass("active")){
			$(this).addClass("active").siblings().removeClass("active");
			curScene = $(".content-main-edit").find(".content-center-topfd").eq($(this).index());
		 	curScene.addClass("content-center").show().siblings().removeClass("content-center").hide();
		}
		//背景图标处于选中状态
		$("#for_backg_edit").addClass("active").siblings().removeClass("active");
		//背景编辑显示
		$(".backg_edit").show().siblings().hide();
		//更新背景编辑区
		updateBackWrap();
		//backgroundImgSetting($(this).attr("backsrc"),$(this).attr("backname"),$(this).attr("backattrid"),"NOT_SAVE_HIS");
		//更新编辑区背景编辑区音乐数据
		updateMusicWrap(true);
/*		if($(this).attr("backsrc") != ""){
			console.log("有 src");
			var url = "url(http://"+pHost+$(this).attr("backsrc")+")";
			var name = $(this).attr("backname");
			//给编辑区加背景
			curScene.css("background-image",url);
			//更换选中元素的状态图
			$(".backg_edit").find(".backg_img_item img").attr("src",$(this).attr("backsrc")).css("width","280px").css("height","150px");;
			$(".backg_edit").find(".backg_img_item .backg_img_item_name").text(name);	
		}else{
			console.log("没 src");
			//给编辑区加背景
			curScene.css("background-image","");
			//更换选中元素的状态图
			$(".backg_edit").find(".backg_img_item img").attr("src","").removeAttr("style");
			$(".backg_edit").find(".backg_img_item .backg_img_item_name").text("");	
		}*/
		
		
/*		if($(this).attr("backcolor") != ""){
			var color = $(this).attr("backcolor");
			//给编辑区加背景
			curScene.css("background-color",color);
			$(".bgcolor_item").each(function(){
				if($(this).css("background-color") == color){
					$(this).addClass("active").siblings().removeClass("active");
				}else{
					$(this).removeClass("active");
				}
			});
		}else{
			curScene.css("background-color","#fff");
			$(".bgcolor_item").removeClass("active");
		}*/
		/*
		 //可能是以前一个场景只有一个日期所以切换场景会执行以下代码
		 if(curScene.find(".date").length > 0){
			var timeType = curScene.find(".date").attr("timeType");	
			console.log(timeType);
			//切换时钟
			window.baidu_time(getTimeString(new Date(), timeType).getTime(),curelement);	
		}
		*/
		
		/*$("#visRuler").click();*/
		
		$(".element").removeClass("active");
		curelement = null;
	});
	
	/**场景添加****/
	//点击添加同级场景
	$(".scene-add-sibling").on("click",function(){
		if($(".backg_tpl_item.active").hasClass("tpl_parent")){
			sceneAdd("tpl_parent");
		}else{
			sceneAdd("tpl_children");
		}
	});
	
	//点击添加子集场景
	$(".scene-add-children").on("click",function(){
		if(!$(this).hasClass("color-gray")){
			sceneAdd("tpl_children");
		}
	});
	
	//点击添加-出现添加场景按钮
	$(".scene-add-menu").on("click",function(){
		if(!$(this).hasClass("active")){
			$(this).addClass("active");
			var obj = $(this).prev(".scene-add-menu-div");
			if($(".backg_tpl_item.active").hasClass("tpl_parent")){
				//样式修改
				obj.find(".scene-add-children").removeClass("color-gray");
			}else{
				//样式修改
				obj.find(".scene-add-children").addClass("color-gray");
			}
			//显示按钮
			obj.show(100);
			//点击屏幕隐藏添加场景按钮
			$(document).one("click", function(){
				$(".scene-add-menu-div").hide(100).siblings(".scene-add-menu").removeClass("active");
			});
		}
	});
	
	//根据当前场景计算新场景index，传入参数为新场景的类型
	function sceneindexcompute(type){
		var index = null;
		if("tpl_parent" == type){
			index = $(".backg_tpl_item.tpl_parent").length +1;
		}else{
			var actpl = $(".backg_tpl_item.active");
			if(actpl.hasClass("tpl_parent")){
				index = actpl.find(".tpl_item_index").html()+".1";
			}else{
				var indexarr = actpl.find(".tpl_item_index").html().split(".");
				index = indexarr[0]+"."+(parseInt(indexarr[1])+1);
			}
		}
		return index;
	}
	
	//获取父场景ID数组(2个参数，第一个是缩略图id,第二哥是场景ID),传入参数为子场景的backg_tpl_item元素dom对象，如果无，则认为当前选中的场景为上个场景
	function getparenttplid(o){
		var pids = new Array();
		if(!o){
			obj = $(".backg_tpl_item.active");
		}else{
			obj = $(o).prev();
		}
		if(obj.hasClass("tpl_parent")){
			pids[0] = obj.attr("id");
			pids[1] = obj.attr("to");
		}else{
			pids[0] = obj.attr("parentid");
			pids[1] = obj.attr("parentto");
		}
		return pids;
	}
	
	//添加场景
	function sceneAdd(type){
		//判断数量是否达到限制数量，是则不允许添加
/*		if(type === "tpl_parent" && $(".backg_tpl_item.tpl_parent").length >= 20){
			top.$.jBox.tip("主场景最多20个！");
			return;
		}*/
		
		//限制场景数量的限制
/*		if(type === "tpl_parent"){
			if($(".backg_tpl_item.tpl_parent").length >= 20){
				top.$.jBox.tip($.i18n.prop("progForm.mainSceneNumberLimit"));
				return;
			}
		}else{
			var master_index = $(".backg_tpl_item.active").find(".tpl_item_index").attr("master_index");
			if($(".backg_tpl_item.tpl_children .tpl_item_index[master_index='"+master_index+"']").length >= 10){
				top.$.jBox.tip($.i18n.prop("progForm.mainSceneMaxHaveScene"));
				return;
			}
		}*/
		
		//背景图标处于选中状态
		$("#for_backg_edit").addClass("active").siblings().removeClass("active");
		//背景编辑显示
		$(".backg_edit").show().siblings().hide();

		curSceneCount++;
		//计算场景index
		var index = sceneindexcompute(type);
		
		var parentinfo = "";
		if(type == "tpl_children"){
			//获取父id数组
			var pids = getparenttplid();
			parentinfo = ' parentid="'+pids[0]+'" parentto="'+pids[1]+'" ';
		}

		//竖屏
		if(isVertical){
			type+=" vertical ";
		}
		
		var newbackg_tpl_item = $('<div class="backg_tpl_item '+type+'" draggable="true" long="10" id="tpl_item_'+curSceneCount+'" to="topfd'+curSceneCount+'" '+parentinfo+' backsrc="" backname="" backcolor=""><div class="tpl_item_thumbnail pull-right"><div class="tpl_item_thumbnail_copy"></div></div><div class="tpl_index pull-right"><span class="tpl_item_index">'+index+'</span> <span class="tpl_time_line"></span><span class="tpl_time_edit" onclick="sceneTimebox(this);"><span class="tpl_time_edit_img"></span><span class="time"></span></span> <a href="javascript:void(0)" class="glyphicon glyphicon-trash scene-del hide"></a></div></div>');
		//不放最后了，注释掉,改为放在当前场景之后
		//$(".backg_tpl").append(newbackg_tpl_item);
		var programWidth=$("#programWidth").val(); 
		var	programHeight=$("#programHeight").val(); 
		
		//默认的场景时间为long=10
		var newScene = $('<div id="topfd'+curSceneCount+'" long="10" programWidth="'+programWidth+'" programHeight="'+programHeight+'" class=" content-center-topfd " language="'+programLanguage+'" '+parentinfo+' style="position: relative;background-color: rgb(255, 255, 255); background-size: 100% 100%; background-repeat: no-repeat;"></div>');

		newScene.width($("#width").val());		
		newScene.height($("#height").val());
		//先隐藏
		newScene.hide();
		//不放最后了，注释掉,改为放在当前场景之后
		//$(".content-main-edit").append(newScene);
		if(type == "tpl_parent"){
			$(".backg_tpl").append(newbackg_tpl_item);
			$(".content-main-edit").append(newScene);
		}else{
			$(".backg_tpl_item.active").after(newbackg_tpl_item);
			curScene.after(newScene);
		}
		
		//节目标准字体计算
		//var fscale = 1;
		//if(programWidth > programHeight){
		//	fscale = programHeight/standardHeight;
		//}else{
		//	fscale = programWidth/standardWidth;
		//}
		//standardfsize = standardFontSize*fscale;
		//standardscalefsize = standardfsize*scale;
		 
		newScene.attr("standardfsize",standardfsize).css("font-size",standardscalefsize+"px");

		//重新排场景序号
		computingSceneSequence();
		/**直接去到新建场景**/
		newbackg_tpl_item.click();
/*		curScene = $("#topfd"+curSceneCount);
		curScene.addClass("content-center").show().siblings().removeClass("content-center").hide();
		$("#tpl_item_"+curSceneCount).addClass("active").siblings().removeClass("active");		
		//初始化背景编辑
		backgroundImgSetting();
		curScene.css("background-color","#fff");
		//更换选中元素的状态图
		$(".backg_edit").find(".backg_img_item img").attr("src","");
		$(".backg_edit").find(".backg_img_item .backg_img_item_name").text("");	
		$(".backg_edit").find(".bgcolor_item").removeClass("active");
		//清空模板的背景属性
		var index = parseInt(curScene.attr("id").replace(/topfd/,""));
		$("#tpl_item_"+index).attr("backsrc","");		
		$("#tpl_item_"+index).attr("backname","");

		$(".element").removeClass("active");*/
		//计算时长
		sceneLong(curScene);
	}
	
	function copyinit(add,obj){
		//初始化元素样式
		 $(add).attr("delay",$(obj).attr("delay"));	
		 $(add).attr("curimglist",$(obj).attr("curimglist"));				
	      //初始化元素内容	          
	      $(add).append($(obj).find("img").clone());
	}


	/**通用场景删除**/
	$(".scene-del-menu").on("click",function(){
		$(".backg_tpl_item.active .scene-del").click();
	});
	
	//$(".backg_tpl_item").find(".scene-del").live("click",function(){
	$(".backg_tpl_item").on("click",".scene-del",function(){
		var hasprev = $(this).parents(".backg_tpl_item").prev().hasClass("backg_tpl_item");
		var hasnext = $(this).parents(".backg_tpl_item").next().hasClass("backg_tpl_item");
		
		//删除的是第一个场景，并且下一个是子场景，不允许删除
		if(!hasprev && hasnext && $(this).parents(".backg_tpl_item").next().hasClass("tpl_children")){
			top.$.jBox.tip($.i18n.prop("progForm.subSceneCannotBeFirstScene"));
			return ;
		}
		
		if(!hasprev && !hasnext){
			console.log("删除的是第一个也是最后一个");				
			//$(".backg_tpl_op").find(".scene-add").click();
			sceneAdd("tpl_parent");
			$(".backg_tpl_item").find(".tpl_item_index").text("1");
			
		/* 	$(".backg_tpl_item").eq(0).click(); */
		}else if(!hasnext){
			console.log("删除的是最后一个");
			$(this).parents(".backg_tpl_item").prev().click();
		}else{
			console.log("删除的是中间的");		
			var index = $(this).parents(".backg_tpl_item").find(".tpl_item_index").text();
			$(this).parents(".backg_tpl_item").next().click();
			$(this).parents(".backg_tpl_item").nextAll().each(function(){
				$(this).find(".tpl_item_index").text(index);
				index++;
			});
		}		
		$(this).parents(".backg_tpl_item").remove();
		$("#"+$(this).parents(".backg_tpl_item").attr("to")).remove();	
		//重新排场景序号
		computingSceneSequence();
		//随时缩略图
		sceneThumbnail();
		
		return false;
		
		/* $("#"+$(this).attr("to")).remove();		
		$(this).parents(".backg_tpl_item").remove(); */
		
	});
	

	
	
	
	
  //	点击画布
	$(document).click(function(e){			
		if($(e.target).hasClass("content-center") || $(e.target).hasClass("zxxScaleBox")){
			//cancelEditor($(".element"));
			//$(".op-label").hide();
			//$(".scene_edit").show();
			//$(".element").draggable("enable");
			//$(".element").removeClass("active");
			cancelDomCheckbox();
			//curelement = null;
			//元素显示去掉，显示画布元素
			//$("#shade").remove();
			displayMaterialInfo("",0,0,parseInt(curScene.css("width")),parseInt(curScene.css("height")),true);
			//console.log("元素显示去掉，显示画布元素");
			pm_right_showHide("#pm_right_pub");
			return false;
		}
		e.stopPropagation();
	});
	
	//刷新保存按钮状态(公用)
	function refreshsavebtn(){
		var permitOverrides = false;
		//如果有更改未保存的，允许点击保存按钮
		if(!isSaved){
			//判断该节目是否允许覆盖保存(新建的、和有发布记录ID的允许保存)
			permitOverrides = isAllowOverwrite();
		}
		
		//更新保存按钮是否有效
		if(permitOverrides){
			$(".menu-save").removeClass("gray");
		}else{
			$(".menu-save").addClass("gray");
		}
	}
	
	//保存(工具)
	$(".menu-save").click(function(){
		if(curScene != null&&!$(this).hasClass("gray")){
			saveProgramBox('coversave');
		}
	});
	
	//另存为(工具)
	$(".menu-saveas").click(function(){
		if(curScene != null&&!$(this).hasClass("gray")){
			saveProgramBox('newsave');
		}
	});
	
	
	//重做(工具)
	$(".menu-reset").on("click",function(){
		console.log("点击了menu-reset");
		if(curScene != null&&!$(this).hasClass("gray")){
			//根据历史信息进行重做
			redoHis();
/*			curScene.empty();
			$(".delBackImgBtn").click();	
			//清空模板的背景属性
			var index = parseInt(curScene.attr("id").replace(/topfd/,""));		
			$("#tpl_item_"+index).attr("backcolor","");
			$("#tpl_item_"+index).click();*/
		}
	});
	
	//撤销(工具)
	$(".menu-drawback").on("click",function(){
		console.log("点击了menu-drawback");
		if(curScene != null&&!$(this).hasClass("gray")){
			//根据历史信息进行撤销
			backoutHis();
		}
	});
	
	//刷新锁定状态(公用)
	function refreshlock(){
		if(curelement != null && curelement.attr("lock")){
			$(".menu-lock").addClass("active");
			$("#shade").remove();
			$("<div id='shade'></div>").css({
				position:'absolute', 
				top:0, 
				backgroundColor:"#666666", 
				opacity:0.7, 
				zIndex:30000 
			}).height($("#pm_right_set").height()).width($("#pm_right_set").width()+10).appendTo("#pm_right_pro"); 
			console.log("锁定div的宽:"+$("#pm_right_set").width())
			//控件特别处理
			if(curelement.hasClass("font")){
				//文本控件锁定后不能编辑
				cancelEditor();
				//curelement.find(".ql-editor").attr("contenteditable",false).parent().css("cursor","default");
			}
		}else{
			$(".menu-lock").removeClass("active");
			$("#shade").remove();
		}
	}
	
	//判断是否锁定  true:没锁定 false:锁定(公用)
	function isNolock(){
		if(curelement != null && curelement.attr("lock")){
			return false;
		}else{
			return true;
		}
	}
	
	function isSorption(){
		if(curelement != null && curelement.attr("Sorption")){
			return false;
		}else{
			return true;
		}
	}
	
	//控件隐藏
	function isElementHide(){
		if(curelement != null && curelement.attr("elementHide")){
			return true;
		}else{
			return false;
		}
	}
	
	//控件关联叫号
	function isRelationCall(){
		if(curelement != null && curelement.attr("relationCall")){
			return true;
		}else{
			return false;
		}
	}
	
	
	//吸附与取消吸附
	$(document).on("input change","#pm_right_pro input:checkbox",function () {
		//console.log("Sorption:"+$(this).attr("eId"));
		
		if($(this).attr("onChange")==1){
			console.log("Sorption:"+curelement.attr("Sorption"));
			if(curelement != null){
				if ($(this).prop("checked")==true){
					curelement.removeAttr("Sorption");				
				}else{
					curelement.attr("Sorption",false);
				}	
			}else{
				$("#Sorption").prop("checked",false);
			}
			
		}else if($(this).attr("onChange")==2){
			
			console.log("elementHide:"+curelement.attr("elementHide"));
			if(curelement != null){
				if ($(this).prop("checked")==true){
						
					curelement.attr("elementHide",true);
					
				}else{
					curelement.removeAttr("elementHide");
				}	
			}else{
				$("#elementHide").prop("elementHide",false);
			}
			
		}else if($(this).attr("onChange")==3){
			
			console.log("relationCall:"+curelement.attr("relationCall"));
			if(curelement != null){
				if ($(this).prop("checked")==true){
						
					curelement.attr("relationCall",true);
					
				}else{
					curelement.removeAttr("relationCall");
				}	
			}else{
				$("#relationCall").prop("relationCall",false);
			}
			
		}
		
				
	})
	
	

	
	//隐藏控件与取消隐藏控件
	$(document).on("input change","#pm_right_pro  .menu-initElementShow  input:checkbox",function () {
		console.log("initElementShow:"+$(this).attr("eId"));
		
		
				
	})
	
	
	//锁定/解锁按钮触发(公用)	
	$(document).on("click",".menu-lock",function(){
		if(curelement != null){
			var curelementlock = curelement.attr("lock");
			//更改控件锁定状态
			if(curelementlock){
				curelement.removeAttr("lock");
			}else{
				curelement.attr("lock",true);
			}
			//刷新锁定显示
			refreshlock();
			//随时缩略图
	        sceneThumbnail();
		}else{
			$(this).removeClass("active");
		}
	});
		
	//删除(公用)	
	$(document).on("click",".menu-del",function(){
		if(curelement != null && isNolock()){
			//对不同的元素进行不同的操作	
			var last = false;
			if($(".element").length == 1){
				//删除的是最后一个
				var last = true;
			}
			console.log("menu-del:"+curelement.attr("id"));
			//$("#"+curelement.attr("id")).remove();
			
			$("input[eId="+curelement.attr("id")+"]").parent().remove();
		//	$("input[id='image']").parent().remove();
			curelement.remove();
			/*if(last){
				preelement = null;
				curelement = null;
				curScene.click();
			}else{
				if(preelement != null){
					curelement = preelement;
					console.log("preelement");
					console.log(preelement);
					curelement.click();
				}
			}*/
			sceneLong(curScene);
			$(".backg_tpl_item.active").click();
			//curScene.click();	
			//随时缩略图
	        sceneThumbnail();
		}
	});
	
	
	
	//右键修改元素
	$(document).on("click",".menu-edit",function(){
		
		if(curelement != null){
			
			//随时缩略图
	        //sceneThumbnail();
			if(curelement.attr("id")!=''&&curelement.attr("id")!='topfd1'){
				   
				   window.returnValue="";
				   
				   var divid=curelement.attr("id");
			   
				   var curScene = $("#topfd1");
			       
				   var sf=$("#sf").val();
				   
				   var mfile=$("#mfile").val();
			      
				   var key=divid.substring(0,5);

                   //获取坐标
				   var ewidth=Math.round(curelement.css("width")/sf);
                   var eheight=Math.round(curelement.css("height")/sf);
			       var ex=Math.round(curelement.css("left")/sf);
			       var ey=Math.round(curelement.css("top")/sf);
			       
			       //图片
			       if(key=="image")
				   {    
					     var yxSucaiListJson=curelement.attr("jsonData");
                    
                         if(yxSucaiListJson!=null){
        				       yxSucaiListJson=yxSucaiListJson.replace(/"/g,"'"); 
        		         }
                         
                         setLayerBigDataParameter(yxSucaiListJson); 
                         
					     layer.open({
						     
								type: 2,
								area: ['900px', 525+'px'],
							    offset: '40px',
						        title:false,
						        fix: false, //不固定
						        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
						        content: "tosceneimg.vs?sucai.type=4&gssi.sucaigroupid=0&sf="+sf+"&width="+ ewidth+"&height="+ eheight+"&mfile="+mfile+"&xy_x="+ ex+"&xy_y="+ey,
						        scrollbar: false,
						        end: function(){ 
						        	 setLayerBigDataParameter(""); 
									 if(window.returnValue==undefined||window.returnValue==""){
									     window.returnValue=""; 			            
									 }else{
										  
										    //解析json 
										    var rv=window.returnValue;
										    rv=rv.replace(/&quot;/g,"\"");
								            //转换成touch对象组
										    var objs = eval( "(" + rv + ")" );//转换后的JSON对象;								
											
											//divv.src="files/"+mfile+"/"+objs.mMediaList[0].path;
											
											curelement.find("img").attr("src", "files/"+mfile+"/"+objs.mMediaList[0].path);
											
											//divv.style.width=Math.round(t2*sf)+"px";
					 						//divv.style.height=Math.round(t3*sf)+"px";
					 						//divv.style.left=Math.round(xy_x*sf)+"px";
					 						//divv.style.top=Math.round(xy_y*sf)+"px";
					 						 
										
											//获取素材播放时长
	                                        var ptime=objs.mPlayTimes;
	                                        
	                                        curelement.attr("ptime",ptime);
	
											//数据源
	                                        curelement.attr("jsonData",rv);
	
	                                        getItemStime();
											
	
									 }           
								}
							});
					//相册 
			        }if(key=="telle"){    
					     var yxSucaiListJson=curelement.attr("jsonData");
                   
                        if(yxSucaiListJson!=null){
       				       yxSucaiListJson=yxSucaiListJson.replace(/"/g,"'"); 
       		            }
                        
                        var tellerKey=curelement.attr("tellerKey");
                        
                        setLayerBigDataParameter(yxSucaiListJson); 
                        
					     layer.open({
						     
								type: 2,
								area: ['900px', 525+'px'],
							    offset: '40px',
						        title:false,
						        fix: false, //不固定
						        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
						        content: "tosceneteller.vs?sucai.type=4&gssi.sucaigroupid=0&sf="+sf+"&width="+ ewidth+"&height="+ eheight+"&mfile="+mfile+"&xy_x="+ ex+"&xy_y="+ey+"&tellerKey="+tellerKey,
						        scrollbar: false,
						        end: function(){ 
						        	 setLayerBigDataParameter(""); 
									 if(window.returnValue==undefined||window.returnValue==""){
									     window.returnValue=""; 			            
									 }else{
										  
										    //解析json 
										    var rv=window.returnValue;
										    rv=rv.replace(/&quot;/g,"\"");
								            //转换成touch对象组
										    var objs = eval( "(" + rv + ")" );//转换后的JSON对象;								
											
											//divv.src="files/"+mfile+"/"+objs.mMediaList[0].path;
											
											curelement.find("img").attr("src", "files/"+mfile+"/"+objs.mMediaList[0].path);
											
											//divv.style.width=Math.round(t2*sf)+"px";
					 						//divv.style.height=Math.round(t3*sf)+"px";
					 						//divv.style.left=Math.round(xy_x*sf)+"px";
					 						//divv.style.top=Math.round(xy_y*sf)+"px";
					 						 
										
											//获取素材播放时长
	                                        var ptime=objs.mPlayTimes;
	                                        
	                                        curelement.attr("ptime",ptime);
	                                        
	                                        curelement.attr("tellerKey",objs.tellerKey);
	
											//数据源
	                                        curelement.attr("jsonData",rv);
	
	                                        getItemStime();
											
	
									 }           
								}
							});
					 
			        } else if(key=="imggr"){
			        	var yxSucaiListJson=curelement.attr("jsonData");
	                     
                        if(yxSucaiListJson!=null){
                        	
        				       yxSucaiListJson=yxSucaiListJson.replace(/"/g,"'");
        				       
        		        }
                        setLayerBigDataParameter(yxSucaiListJson); 
                        
					     layer.open({
						     
								type: 2,
								area: ['900px', 525+'px'],
							    offset: '40px',
						        title:false,
						        fix: false, //不固定
						        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
						        content: "tosceneimgGroup.vs?editType=2&sucai.type=4&gssi.sucaigroupid=0&sf="+sf+"&width="+ ewidth+"&height="+ eheight+"&mfile="+mfile+"&xy_x="+ ex+"&xy_y="+ey,
						        scrollbar: false,
						        end: function(){ 
					    	         setLayerBigDataParameter(""); 
									 if(window.returnValue==undefined||window.returnValue==""){
									     window.returnValue=""; 			            
									 }else{
										  
										    //解析json 
										    var rv=window.returnValue;
										    
										    rv=rv.replace(/&quot;/g,"\"");
								            //转换成touch对象组
										    var objs = eval( "(" + rv + ")" );//转换后的JSON对象;								
											
										
											//divv.style.width=Math.round(t2*sf)+"px";
					 						//divv.style.height=Math.round(t3*sf)+"px";
					 						//divv.style.left=Math.round(xy_x*sf)+"px";
					 						//divv.style.top=Math.round(xy_y*sf)+"px";
					 						 
	
											//数据源
										    curelement.attr("jsonData",rv);	
											
									 }
								              
								}
							});
			        	
			        	
			        //翻书
			        } else if(key=="imgfl"){
			        	var yxSucaiListJson=curelement.attr("jsonData");
	                     
                        if(yxSucaiListJson!=null){
                        	
        				       yxSucaiListJson=yxSucaiListJson.replace(/"/g,"'");
        				       
        		        }
                        setLayerBigDataParameter(yxSucaiListJson); 
                        
					     layer.open({
						     
								type: 2,
								area: ['900px', 525+'px'],
							    offset: '40px',
						        title:false,
						        fix: false, //不固定
						        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
						        content: "tosceneimgFlip.vs?editType=2&sucai.type=4&gssi.sucaigroupid=0&sf="+sf+"&width="+ ewidth+"&height="+ eheight+"&mfile="+mfile+"&xy_x="+ ex+"&xy_y="+ey,
						        scrollbar: false,
						        end: function(){ 
					    	         setLayerBigDataParameter(""); 
									 if(window.returnValue==undefined||window.returnValue==""){
									     window.returnValue=""; 			            
									 }else{
										  
										    //解析json 
										    var rv=window.returnValue;
										    
										    rv=rv.replace(/&quot;/g,"\"");
								            //转换成touch对象组
										    var objs = eval( "(" + rv + ")" );//转换后的JSON对象;								
											
										
											//divv.style.width=Math.round(t2*sf)+"px";
					 						//divv.style.height=Math.round(t3*sf)+"px";
					 						//divv.style.left=Math.round(xy_x*sf)+"px";
					 						//divv.style.top=Math.round(xy_y*sf)+"px";
					 						 
	
											//数据源
										    curelement.attr("jsonData",rv);	
											
									 }
								              
								}
							});
			        	
			        	
			        //视频 /轮播待播放 /ktv插件
			        }else if(key=="video"||key=="caroD"||key=="catal"){
			        
			        	    var yxSucaiListJson=curelement.attr("jsonData");
	        			    if(yxSucaiListJson!=null){
	        				     yxSucaiListJson=yxSucaiListJson.replace(/"/g,"'"); 
	        				    
	        				     //转换成touch对象组
						         var yxSucaiList = eval( "(" + yxSucaiListJson + ")" );//转换后的JSON对象;
						         var tbType=yxSucaiList.mMediaList[0].tbType;
						         if(tbType==3||tbType==4||tbType==5){
							    
							    	 layer.open({
								    	 
							 			type: 2,
							 			area: ['950px', 530+'px'],
							 	        offset: '40px',
							 	        title:false,
							 	        fix: false, //不固定
							 	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
							 	        content: "tomedia.vs?yxSucaiListJson="+yxSucaiListJson,
							 	        scrollbar: false,
							 	        end: function(){
							    		 
							 	            if(window.returnValue==undefined||window.returnValue==""){
							 				     window.returnValue=""; 			            
							 				}else{
	
							 					//解析json 
											    var rv=window.returnValue;
											 
												//数据源
											    curelement.attr("jsonData",rv);
								 		    }
							    		}	
							            
								   });    
			        	
			                   }else{
			                	   var caroArray=curelement.attr("id").split("D");
						           var count=caroArray[1];
						           var caroY="caroY"+count;
			                	   var url;
			                	   if(key=="caroD")
			                	   {
			                		   url="toscenevideo.vs?sucai.type=3&gssi.sucaigroupid=0&sf="+sf+"&width="+ewidth+"&height="+ eheight+"&mfile="+mfile+"&xy_x="+ ex+"&xy_y="+ ey+"&yMb="+caroY;
			                	   }else if(key=="video")
			                	   {
			                		   url="toscenevideo.vs?sucai.type=3&gssi.sucaigroupid=0&sf="+sf+"&width="+ewidth+"&height="+ eheight+"&mfile="+mfile+"&xy_x="+ ex+"&xy_y="+ ey;
			                	   }else if(ket=="catal")
			                	   {
			                		   url="toscenevideo.vs?sucai.type=3&gssi.sucaigroupid=0&sf="+sf+"&width="+ewidth+"&height="+ eheight+"&mfile="+mfile+"&xy_x="+ ex+"&xy_y="+ ey;
			                	   }
			                	    setLayerBigDataParameter(yxSucaiListJson); 
									layer.open({
										type: 2,
										area: ['950px', 520+'px'],
								        offset: '40px',
								        title:false,
								        fix: false, //不固定
								        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
								        content:url,
								        scrollbar: false,
								        end: function(){ 
								        	 setLayerBigDataParameter(""); 
											 if(window.returnValue==undefined||window.returnValue==""){
											     window.returnValue=""; 			            
											 }else{
												    //解析json 
												    var rv=window.returnValue;
												    
												    rv=rv.replace(/&quot;/g,"\"");
										            //转换成touch对象组
												    var objs = eval( "(" + rv + ")" );//转换后的JSON对象;								
													
													//获取素材播放时长
				                                    var ptime=objs.mPlayTimes;
				                                    
				                                    curelement.attr("ptime",ptime);

													//数据源
				                                    curelement.attr("jsonData",rv);
				                                  
				                                    
				                                    getItemStime();
													
											 }
										              
										}
									});

							    }
			       
			        }	 
			
	        	//ppt(6) word(7) excel(8) pdf(9)
				}else if(key=="myppt"||key=="mydoc"||key=="myxls"||key=="mypdf"){
					//$(this).removeClass("active");
					var yxSucaiListJson=curelement.attr("jsonData");
		    	    if(yxSucaiListJson!=null){

						 setLayerBigDataParameter(yxSucaiListJson);  
				    }
                       
                    var stype=0;
                    var url="";
                    if(key=="myppt"){
                    	stype=6;
                    	url="tosceneppt.vs";
                    }else if(key=="mydoc"){
                    	stype=7;
                    	url="tosceneword.vs";
                    }else if(key=="myxls"){
                    	stype=8;
                    	url="tosceneexcel.vs";
                    }else if(key=="mypdf"){
                    	stype=6;
                    	url="toscenepdf.vs";
                    } 
	             
                    layer.open({
							type: 2,
							area: ['900px', '520px'],
					        offset: '40px',
					        title:false,
					        fix: false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: url+"?sucai.type="+stype+"&gssi.sucaigroupid=0&sf="+sf+"&width="+ewidth+"&height="+ eheight +"&mfile="+mfile+"&xy_x="+ ex+"&xy_y="+ ey,
					        scrollbar: false,
					        end: function(){ 
                    	         setLayerBigDataParameter("");  
								 if(window.returnValue==undefined||window.returnValue==""){
								       window.returnValue=""; 			            
								 }else{
                                        //解析json 
									    var rv=window.returnValue;
									    rv=rv.replace(/&quot;/g,"\"");
							            //转换成touch对象组
									    var objs = eval( "(" + rv + ")" );//转换后的JSON对象;								
										
										curelement.find("img").attr("src", "files/"+mfile+"/"+objs.mMediaList[0].path);
										//divv.style.width=Math.round(t2*sf)+"px";
				 						//divv.style.height=Math.round(t3*sf)+"px";
				 						//divv.style.left=Math.round(xy_x*sf)+"px";
				 						//divv.style.top=Math.round(xy_y*sf)+"px";
				 						
										//获取素材播放时长
                                        var ptime=objs.mPlayTimes;
                                        curelement.attr("ptime",ptime);

										//数据源
                                        curelement.attr("jsonData",rv);

                                        getItemStime();
								 }
							              
							}
						});
                //时间    
				}else if(key=="mytim"){
					
					  var tType=curelement.attr('tType');
                      var tsType= curelement.attr('tsType');
					  //字体大小
			          var fs=curelement.attr('fs');
			          //字条颜色
			          var fcolor=curelement.attr('fcolor');
                      var ttDa=curelement.attr('ttDa');
                      var ttHo=curelement.attr('ttHo');
                      var ttMi=curelement.attr('ttMi');
                      var ttSs=curelement.attr('ttSs');
                      var ttTimePoint=curelement.attr('ttTimePoint');
                      
                      var advancedType=curelement.attr("advancedType");
                      
                      var unitShow=curelement.attr("unitShow");
                      
			           
			    	   layer.open({
							type: 2,
							area: ['800px', '500px'],
						    offset: '40px',
					        title:false,
					        fix: false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: "toadtime.vs?width="+ ewidth+"&height="+ eheight+"&xy_x="+ ex+"&xy_y="+ ey
					                 +"&tType="+tType+"&tsType="+tsType+"&fs="+fs+"&fcolor="+fcolor+"&ttDa="+ttDa+"&ttHo="+ttHo+"&ttMi="+ttMi+"&ttSs="+ttSs+"&ttTimePoint="+ttTimePoint+"&advancedType="+advancedType+"&unitShow="+unitShow+"&sf="+sf,
					        scrollbar: false,
					        end: function(){ 
						         
								 if(window.returnValue==undefined||window.returnValue==""){
								     window.returnValue=""; 			            
								 }else{
									var rv=window.returnValue;

									rv=rv.replace(/&quot;/g,"\"");
									
									var obj= eval( "(" + rv + ")" );//转换后的JSON对象
									
									//curelement.removeClass("active");
									
									curelement.css({
			                    	      "color":"#"+obj.fcolor,
			                    	      "fontSize":Math.round(obj.fs*sf)+"px",
			                    	      "lineHeight":Math.round(obj.fs*sf)*1.3+"px"
			                    	    
			                    	});
									  
									  
                                   curelement.attr("tType",obj.tType);

                                   curelement.attr("tsType",obj.tsType);

                                   curelement.attr("fs",obj.fs);

                                   curelement.attr("fcolor",obj.fcolor);

                                   curelement.attr("ttDa",obj.ttDa);

                                   curelement.attr("ttHo",obj.ttHo);

                                   curelement.attr("ttMi",obj.ttMi);

                                   curelement.attr("ttSs",obj.ttSs);

                                   curelement.attr("ttTimePoint",obj.ttTimePoint);

                                   curelement.attr("advancedType",obj.advancedType);

                                   curelement.attr("unitShow",obj.unitShow);


             					    //数据源
                                   curelement.attr("jsonData",rv);
              					
              					   var mytimContent=getTimeShowStyle(obj.tType,obj.tsType,obj.ttDa,obj.ttHo,obj.ttMi,obj.ttSs,obj.unitShow); 
                              		
              					   curelement.find(".time_content").text(mytimContent);
              					   
              					   curelement.attr("mytimContent",mytimContent);
              					   //绑定编辑框
       		                       //resizeinitfn(curelement);
	
								 }
							              
							}
						});
					
				}else if(key=="htmls"){
					
					  var gun=curelement.attr('gun');
			           var time=curelement.attr('time');
			           var sortableListSpans =curelement.attr("sortableListSpans"); 
			           sortableListSpans=escape(sortableListSpans);
					   layer.open({
							type: 2,
					        area: ['800px', '500px'],
					        offset: '10px',
					        title:false,
					        fix: false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: "toadhtml.vs?width="+ ewidth+"&height="+ eheight+"&xy_x="+ ex+"&xy_y="+ ey
					        +"&time="+time+"&gun="+gun+"&sortableListSpans="+sortableListSpans,
					        scrollbar: false,
					        end: function(){ 
						         
								 if(window.returnValue==undefined||window.returnValue==""){
								     window.returnValue=""; 			            
								 }else{
									 var rv=window.returnValue;
									 var tres=rv.split('*');

									 curelement.attr("title",tres[4]+"*"+tres[5]+"*"+tres[6]);	
									 curelement.attr("time",tres[4]);
									 curelement.attr("gun",tres[5]);
									 curelement.attr("sortableListSpans",tres[6]); 

									
										
								 }
							              
							}
						});
				}else if(key=="mytqs"){
					
					   var fresh=curelement.attr("fresh");
	                   var dx=curelement.attr("dx");
	                   var wfcolor=curelement.attr("wfcolor");
	                   var sortableListSpans=curelement.attr("sortableListSpans");
					   layer.open({
							type: 2,
							area: ['800px', '500px'],
					        offset: '40px',
					        title:false,
					        fix: false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: "toadtq.vs?width="+ ewidth+"&height="+ eheight+"&sf="+sf+"&xy_x="+ex+"&xy_y="+ ey
                            +"&fresh="+fresh+"&dx="+dx+"&wfcolor="+wfcolor+"&sortableListSpans="+sortableListSpans,
					        scrollbar: false,
					        end: function(){ 
						         
								 if(window.returnValue==undefined||window.returnValue==""){
								     window.returnValue=""; 			            
								 }else{
									 var rv=window.returnValue;
									 var tres=rv.split('*');
									 var w=tres[2];
								     var h=tres[3];
									 var xy_x=tres[0];
							         var xy_y=tres[1];
									 curelement.attr("title",tres[4]+"*"+tres[5]+"*"+tres[6]+"*"+tres[7]+"*"+tres[8]);
									 //divv.style.width=Math.round(w*sf)+"px";
									 //divv.style.height=Math.round(h*sf)+"px";
									 //divv.style.left=Math.round(xy_x*sf)+"px";
									 //divv.style.top=Math.round(xy_y*sf)+"px";
									 curelement.attr("fresh",tres[4]);
									 curelement.attr("dx",tres[5]);
									 curelement.attr("wfcolor",tres[6]);
									 curelement.attr("sortableListSpans",tres[7]);
									 
									 curelement.css({
			                    	      "color":"#"+tres[6]
			                         });

								  }          
							}
						});
				//文本 		   
				}else if (key=="fonts"){

                       
					     var fonttype=curelement.attr("fonttype");     //字体类型
		                 var txtfontsize=curelement.attr("txtfontsize");  //字体大小
		                 var lineH=curelement.attr("lineH");        //字距
		                 var gdtype=curelement.attr("gdtype");       //滚动方式
		                 var gdspeed=curelement.attr("gdspeed");      //滚动速度 
		                 var backcolor=curelement.attr("backcolor");   //背景颜色
		                 var txtfontcolor=curelement.attr("fontcolor");   //字体颜色 
                      
		                 var fbold=curelement.attr("fbold");      //加粗
						 var fitallic=curelement.attr("fitallic");   //斜体
						 var fsetline=curelement.attr("fsetline");   //下划线
						 var fsetstrike=curelement.attr("fsetstrike");  //中线
						 

						 var textDataSource=curelement.attr("textDataSource");  //中线
						 
		                 var advancedType=curelement.attr("advancedType");  //设置字体大小模式  0普通  1高级
		                 
		                 var relationKey=curelement.attr("relationKey");
	                     
	                     backcolor=backcolor.substring(1,backcolor.length);
	                     txtfontcolor=txtfontcolor.substring(1,txtfontcolor.length);

		                
		                  var divHtml=curelement.find(".doc_content").html();
		                 
		                  //description = description.replace(/(\n)/g, "");  
		                  //description = description.replace(/(\t)/g, "");  
		                  //description = description.replace(/(\r)/g, "");  
		                  
		                  
		                  //divHtml=divHtml.replace(/<br>/g,"6682");
		                  //divHtml = divHtml.replace(/<\/?[^>]*>/g, "");  
		                  //divHtml = divHtml.replace(/\s*/g, "");  
		                   
		                 
		                  //divHtml=encodeURI(divHtml); 
		                  //divHtml=encodeURI(divHtml);
                          //alert(divHtml)
                          setLayerBigDataParameter(divHtml); 
                          
 						 
 						  // 转换成json的方式传值到文本页面
                          var dataParameterMap=new Object();
                          
                          dataParameterMap.highFontColor=curelement.attr("highFontColor");
                          
                          dataParameterMap.fontColorCb=curelement.attr("fontColorCb");
                          
                          dataParameterMap.highBgColor=curelement.attr("highBgColor");
                          
                          dataParameterMap.bgColorCb=curelement.attr("bgColorCb");

                          setLayerBigDataParameterMap(JSON.stringify(dataParameterMap));
					      
                          layer.open({
							type: 2,
							area: ['980px', 525+'px'],
					        offset: '40px',
					        title:false,
					        fix: false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: 'toscenedoc.vs?sucai.type=10&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile+"&width="+ ewidth+
			                "&height="+ eheight+"&xy_x="+
			                ex+"&xy_y="+ ey+"&fonttypeStr="+fonttype+"&txtfontsize="+txtfontsize+"&lineH="+lineH+"&gdtype="+gdtype+"&gdspeed="+gdspeed+
		                    "&fbackcolor="+backcolor+"&txtfontcolor="+txtfontcolor+"&fsetstrike="+fsetstrike+"&fbold="+fbold+"&fitallic="+
		                    fitallic+"&fsetline="+fsetline+"&textDataSource="+textDataSource+"&advancedType="+advancedType+"&relationKey="+relationKey,
					        scrollbar: false,
					        end: function(){ 
						         
								 if(window.returnValue==undefined||window.returnValue==""){
								     window.returnValue=""; 			            
								 }else{
									var rv=window.returnValue;
									var tres=rv.split('@');
									var w=tres[2];
								   	var h=tres[3];
								  	var xy_x=tres[0];
						            var xy_y=tres[1];
						            
						            curelement.attr("title",tres[7]+"-"+tres[8]);
						            

						            //divv.style.fontFamily=tres[4];
									
									//divv.style.fontSize=Math.round(tres[5]*sf)+"px";
									//divv.style.lineHeight=Math.round(Math.round(tres[5]*tres[6])*sf)+"px";
									
						             var showBgColor="";
						             
						             if(tres[22]==1){
						            	 
						            	 showBgColor=tres[21];
						            	 
						             }else{
						            	 
						            	 showBgColor=tres[10];
						            	 
						            	 if(showBgColor==0){
						            		 showBgColor="transparent"
						            	 }
						            	 
						             }
						             
						            
						            
									 curelement.css({
			                    	      "fontSize":Math.round(tres[5]*sf)+"px","fontFamily":tres[4],
			                              "lineHeight":Math.round(Math.round(tres[5]*tres[6])*sf)+"px",
			                              "backgroundColor":showBgColor
			                         });
									  

									  
									curelement.attr("fontSize",tres[5]);
									curelement.attr("lineHeight",parseInt(tres[5]*tres[6]));
				                    
						            
					                //divv.style.width=Math.round(w*sf)+"px";
									//divv.style.height=Math.round(h*sf)+"px";
									//divv.style.left=Math.round(xy_x*sf)+"px";
									//divv.style.top=Math.round(xy_y*sf)+"px";


									curelement.attr("fonttype",tres[4]);     //字体类型
									curelement.attr("txtfontsize",tres[5]);  //字体大小
									curelement.attr("lineH",tres[6]);        //字距
									curelement.attr("gdtype",tres[7]);       //滚动方式
									curelement.attr("gdspeed",tres[8]);      //滚动速度

									
									curelement.attr("backcolor",tres[10]);   //背景颜色
									curelement.attr("fontcolor",tres[11]);   //字体颜色 
									curelement.attr("fbold",tres[12]);      //加粗
									curelement.attr("fitallic",tres[13]);   //斜体
									curelement.attr("fsetline",tres[14]);   //下划线
									curelement.attr("fsetstrike",tres[15]);  //中线

									curelement.attr("textDataSource",tres[16]);  //数据来源

									curelement.attr("advancedType",tres[17]);  
										
									curelement.attr("doc_content",tres[9]);
									
									curelement.find(".doc_content").html(tres[9]);
									
									  
									curelement.attr("relationKey",tres[18]);  //二次开发设置key
									
									
									curelement.attr("highFontColor",tres[19]);  //高级字体颜色
									curelement.attr("fontColorCb",tres[20]);  //高级字体颜色checkbox

									curelement.attr("highBgColor",tres[21]);  //高级背景颜色
									curelement.attr("bgColorCb",tres[22]);  //高级背景颜色checkbox
								

									setLayerBigDataParameter("");
									
									setLayerBigDataParameterMap("");
									
									return;
								  }          
							}
						});

				   }
				   //摄像	   
				   else if(key=="mycam"){
					   layer.open({
							type: 2,
							area: ['600px', '400px'],
							offset: '20px',
					        title:false,
					        fix: false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: "tocamerat.vs?width="+ ewidth+"&height="+ eheight+"&xy_x="+ ex+"&xy_y="+ey+"&ctitle="+curelement.attr("title"),
					        scrollbar: false,
					        end: function(){ 
						         
								 if(window.returnValue==undefined||window.returnValue==""){
								     window.returnValue=""; 			            
								 }else{
									var rv=window.returnValue;
									var tres=rv.split('*');
								   
									var w=tres[2];
									var h=tres[3];
									var xy_x=tres[0];
							        var xy_y=tres[1];
							        
							        curelement.attr("title",tres[4]+"*"+tres[5]+"*"+tres[6]+"*"+tres[7]);
									//divv.title=tres[4]+"*"+tres[5]+"*"+tres[6]+"*"+tres[7];
											
								 }          
							}
						});

				   } //公交车站	    	   
                   else if(key=="mybus"){
					   layer.open({
							type: 2,
							area: ['600px', '400px'],
					        offset: '80px',
					        title:false,
					        fix: false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: "toitembus.vs?width="+ ewidth+"&height="+ eheight+"&xy_x="+ex+"&xy_y="+ ey+"&ctitle="+curelement.attr("title"),
					        scrollbar: false,
					        end: function(){ 
						         
								 if(window.returnValue==undefined||window.returnValue==""){
								     window.returnValue=""; 			            
								 }else{
									 var rv=window.returnValue;
								     var tres=rv.split('|');
					                 if(tres[0]=="mybus"){
					                	 var tress=tres[1].split('*');
					                	 var xy_x=tress[0];
			        		             var xy_y=tress[1];
			                        	 var w=tress[2];
			        				   	 var h=tress[3];
			        				   	 curelement.attr("title",tres[4]+"*"+tres[5]+"*"+tres[6]+"*"+tres[7]);
										 //divv.title=tress[4]+"*"+tress[5]+"*"+tress[6]+"*"+tress[7];
										 //divv.style.width=Math.round(w*sf)+"px";
				 						 //divv.style.height=Math.round(h*sf)+"px";
				 						 //divv.style.left=Math.round(xy_x*sf)+"px";
				 						 //divv.style.top=Math.round(xy_y*sf)+"px";
			        				} 	 
								 }
							              
							}
						});

				   }else if(key=="qmany"){
                       
					   
					   layer.open({
							type: 2,
							area: ['600px', '400px'],
					        offset: '80px',
					        title:false,
					        fix: false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: "toqueue.vs?width="+ewidth+"&height="+ eheight+"&xy_x="+ex+"&xy_y="+ ey+"&ctitle="+divv.title+"&qtype=1",
					        scrollbar: false,
					        end: function(){ 
						         
								 if(window.returnValue==undefined||window.returnValue==""){
								     window.returnValue=""; 			            
								 }else{
									 var rv=window.returnValue;
								     var tres=rv.split('|');
					                 if(tres[0]=="qmany"){
					                	 var tress=tres[1].split('*');
					                	 var xy_x=tress[0];
			        		             var xy_y=tress[1];
			                        	 var w=tress[2];
			        				   	 var h=tress[3];
										 divv.title=tress[4]+"*"+tress[5]+"*"+tress[6]+"*"+tress[7]+"*"+tress[8]+"*"+tress[9];
										 //divv.style.width=Math.round(w*sf)+"px";
				 						 //divv.style.height=Math.round(h*sf)+"px";
				 						 //divv.style.left=Math.round(xy_x*sf)+"px";
				 						 //divv.style.top=Math.round(xy_y*sf)+"px";
			        				} 	 
								 }
							              
							}
						});

				   }else if(key=="charg"){

					   var jsonStr=curelement.attr("jsonStr");
					   if(jsonStr!=null){
						   jsonStr=jsonStr.replace(/"/g,"'"); 
					   }   
						 
					   layer.open({
							type: 2,
							area: ['600px', '400px'],
					        offset: '80px',
					        title:false,
					        fix: false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: "toProgramDll.vs?jsonStr="+jsonStr,
					        scrollbar: false,
					        end: function(){ 
						         
								 if(window.returnValue==undefined||window.returnValue==""){
								     window.returnValue=""; 			            
								 }else{
									 var rv=window.returnValue;
								     var tres=rv.split('|');
					                 if(tres[0]=="charg"){
					                	 var tress=tres[1].split('*');
                                         var programDll=new Object();
				      					 programDll.rows=tress[5];
				      					 programDll.columns=tress[6];
				      					 programDll.type=101;

				      					 var jsonStr=JSON.stringify(programDll);
				      				  	 jsonStr=jsonStr.replace(/"/g,"'");
				      				  	 curelement.attr("jsonStr",jsonStr); 

			        				} 	 
								 }
							              
							}
						});

				   }else if(key == "sourc"){

					        var jsonStr=curelement.attr("jsonStr");
					   
                            setLayerBigDataParameter(jsonStr); 
						 	 //获取缩放
						 	 var sf=document.getElementById("sf").value;
						 	 window.returnValue=""; 
						 	 layer.open({
						 			type: 2,
						 			area: ['980px', 520+'px'],
							        offset: '40px',
						 	        title:false,
						 	        fix:false, //不固定
						 	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
						 	        content: 'todatasource.vs?&mfile='+mfile+"&width="+ ewidth+
					                "&height="+ eheight+"&xy_x="+ ex+"&xy_y="+ ey,
						 	        scrollbar: false,
						 	        end: function(){ 

						 		   		
						 				 if(window.returnValue==undefined||window.returnValue==""){
						 				     window.returnValue=""; 			            
						 				 }else{
						 	 				 
						 					 var rv=window.returnValue;
											
						 					 var objs = eval( "(" + rv + ")" );//转换后的JSON对象
						 					 
						 					 
						 					   //设置表格颜色
		        		    				 var  tableBorderColor=objs.borderColor;
		        		    				  
		        		    				 if(tableBorderColor=="-65536"){
		        		    			    	  
		        		    					 tableBorderColor="#ED1C24";
		        		    			    	  
		        		  				     }else if(tableBorderColor=="-16776961"){
		        		  			        	
		        		  				    	tableBorderColor="#3F48CC";
		        		  			        	
		        		  			         }else  if(tableBorderColor=="-256"){
		        		  				    
		        		  			        	tableBorderColor="#FFC90E";
		        		  				    	
		        		  				     }else if(tableBorderColor=="-16711936"){
		        		  			        	 
		        		  				    	tableBorderColor="#22B14C";
		        		  			            
		        		  			         }else  if(tableBorderColor=="-2"){
		        		  				    	
		        		  			        	tableBorderColor="#FFFFFF";
		        		  				     }else  if(tableBorderColor=="-7829368"){
		        		  				    	
		        		  				    	tableBorderColor="#7F7F7F";
		        		  				    	
		        		  				     }else  if(tableBorderColor=="-16777216"){
		        		  				    	tableBorderColor="#000000";
		        		  				     }
		        		    				 
						 					 
						 					 var createTable="";
						 					 //var createTable="<table  style='width:100%;height:100%;table-layout:fixed;text-align: center;border-collapse:collapse;background-color:"+objs.title[0].bgColor+";' >";
		        		    				 if(objs.showType==1&&objs.titleState==1){
		        		    					 objs.rows=objs.rows+1;
		        		    				 }else if(objs.showType==2&&objs.titleState==1){
		        		    				 	 objs.cols=objs.cols+1;
		        		    				 }
						 					 for(var i=0;i<objs.rows;i++){
		        		    					 createTable+="<tr>";
    		                    		    	 for(var j=0;j<objs.cols;j++){
    		                    		    		 
    		                    		    		 if(objs.showType==2){
    		                    		    			 if(j==0){
    		                    		    				
    	    		                    		    			 createTable+="<td style='border:"+objs.borderState+"px solid "+tableBorderColor+";'>"+objs.title[i].value+"</td>";	
    	    		                    		    		
    		                    		    			 }else{
    		                    		    				
    	    		                    		    			 createTable+="<td style='border:"+objs.borderState+"px solid "+tableBorderColor+";'>value</td>";	
    	    		                    		    		
    		                    		    				 
    		                    		    			 }
    		                    		    		 }else  if(objs.showType==1){
    		                    		    			 if(i==0){
    		                    		    				  
    		                    		    				 createTable+="<td style='border:"+objs.borderState+"px solid "+tableBorderColor+";'>"+objs.title[j].value+"</td>";	
    	    		                    		    		
    		                    		    			 }else{
    		                    		    				
    	    		                    		    		 createTable+="<td style='border:"+objs.borderState+"px solid "+tableBorderColor+";'>value</td>";	
    	    		                    		    		
    		                    		    			 }
    		                    		    		 }else{
    		                    		    			 
	    		                    		    			 createTable+="<td style='border:"+objs.borderState+"px solid "+tableBorderColor+";'>value</td>";	
	    		                    		    		
    		                    		    		 }
    		                    		    		
    		                    		    		 
    		                    		    	 }
    		                    		    	 createTable+="</tr>"; 
    		                    		     }
		        		    				 
						 					 //设置背景色
		        		    				 var  tableBgColor=objs.title[0].bgColor;
		        		    				  
		        		    				 if(tableBgColor=="-65536"){
		        		    			    	  
		        		    					 tableBgColor="#ED1C24";
		        		    			    	  
		        		  				     }else if(tableBgColor=="-16776961"){
		        		  			        	
		        		  				    	tableBgColor="#3F48CC";
		        		  			        	
		        		  			         }else  if(tableBgColor=="-256"){
		        		  				    
		        		  			        	tableBgColor="#FFC90E";
		        		  				    	
		        		  				     }else if(tableBgColor=="-16711936"){
		        		  			        	 
		        		  				    	tableBgColor="#22B14C";
		        		  			            
		        		  			         }else  if(tableBgColor=="-2"){
		        		  				    	
		        		  			        	tableBgColor="#FFFFFF";
		        		  				     }else  if(tableBgColor=="-7829368"){
		        		  				    	
		        		  				    	tableBgColor="#7F7F7F";
		        		  				    	
		        		  				     }else  if(tableBgColor=="-16777216"){
		        		  				    	tableBgColor="#000000";
		        		  				     }else  if(tableBgColor=="0"){
		        		  				    	tableBgColor="transparent";
		        		  				     }
						 					 
		        		    				 
		        		    				 var  tableFontColor=objs.title[0].fontColor;
		        		    				  
		        		    				 if(tableFontColor=="-65536"){
		        		    			    	  
		        		    					 tableFontColor="#ED1C24";
		        		    			    	  
		        		  				     }else if(tableFontColor=="-16776961"){
		        		  			        	
		        		  				    	tableFontColor="#3F48CC";
		        		  			        	
		        		  			         }else  if(tableFontColor=="-256"){
		        		  				    
		        		  			        	tableFontColor="#FFC90E";
		        		  				    	
		        		  				     }else if(tableFontColor=="-16711936"){
		        		  			        	 
		        		  				    	tableFontColor="#22B14C";
		        		  			            
		        		  			         }else  if(tableFontColor=="-2"){
		        		  				    	
		        		  			        	tableFontColor="#FFFFFF";
		        		  				     }else  if(tableFontColor=="-7829368"){
		        		  				    	
		        		  				    	tableFontColor="#7F7F7F";
		        		  				    	
		        		  				     }else  if(tableFontColor=="-16777216"){
		        		  				    	tableFontColor="#000000";
		        		  				     }else  if(tableFontColor=="0"){
		        		  				    	//tableFontColor="none";
		        		  				     }
		        		    				 
						 					 //createTable+="</table>";
		        		    				 
		        		    				 //curelement.find(".source_content").html("");
		        		    				 curelement.find(".source_content").html(createTable);
		        		    				 
		        		    				 var selfFontSize=12;
		        		                       if(objs.title[0].fontSize==-1){
		        		                    	   selfFontSize=12;
		        		                       }else{
		        		                    	   selfFontSize=objs.title[0].fontSize;  
		        		                       }     
		        		                    	      
		        		    				 curelement.css({
		        		    					  "fontSize":Math.round(selfFontSize*sf)+"px",
	        		                              "color":tableFontColor,
	        		                              "background-color":tableBgColor
	        		                         });
		        		    				 
		        		    				 
						 					
					      					 curelement.attr("jsonStr",rv); 
							 				
						 				 }
						 			}
						 		});
					   //插件 	 		
					   }else if(key=="dllIt"){

							   //已选
							   var jsonData=curelement.attr("jsonData");
							   if(jsonData!=null){
								   jsonData=jsonData.replace(/"/g,"'"); 
								   var objs = eval( "(" + jsonData + ")" );//转换后的JSON对象

				                   var mDllItemUserList=objs.mDllItemList; 
				                   jsonData=JSON.stringify(mDllItemUserList);
				                   
				                   jsonData=jsonData.replace(/"/g,"'");
							   }   

							  
							   //全部
							 	var dllItemUser=getDllItemBindUserNew();
		        		    	var jsonStr=JSON.stringify(dllItemUser);
		        				  
		        				jsonStr=jsonStr.replace(/"/g,"'");


		        				$.ajax({
		 	                           url:'ajaxSaveSession.vs',
						                data:{
		        					        jsonStr : jsonStr,
		        					        jsonData : jsonData
							            },
										 type:'post',  
									     cache:false,  
									     dataType:'json',  
									     success:function(data) {
										
										 }
								 });
		        				
		        		    	layer.open({
		        		    		type: 2,
		        		    		area: ['980px', 530+'px'],
		        		    		offset: '40px',
		        		    		title:false,
		        		    		fix:false, //不固定
		        		    		shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		        		    		content: 'toAdDllItem.vs',
		        		    		scrollbar: false,
		        		    		end: function(){ 
		        		    			 if(window.returnValue==undefined||window.returnValue==""){
		        		    				window.returnValue=""; 			            
		        		    			 }else{
		        		    				 var rv=window.returnValue;
		        		    				 curelement.attr("jsonData",rv);
		        		    				 
		        		    			}
		        		    		}
		        		    	});                             
					  }else if(key=="myigs"){
						  
						    var touchIds="";
						    $("input[name = checkdom]:checkbox").each(function(){
						   
						    	if(touchIds.length==0){
									  touchIds=$(this).attr("eId");
								}else{
									  touchIds=touchIds+"*"+$(this).attr("eId");
								} 
						     });
						    
						    
						      //创建对象
		 				   	  var recycler=new Object();
		 				   	  recycler.id=curelement.attr("id");
		 				   	  recycler.name=curelement.attr("id");

		 				   	  var interactGroupShowNumber=curelement.attr("interactGroupShowNumber");
		 				   	  if(interactGroupShowNumber==undefined){
		 				   		recycler.interactGroupNumber=3;
		 	 				  }else{
		 	 					recycler.interactGroupNumber=interactGroupShowNumber;
		 	 	 			  }
		 				      
		 				      var jsonStr=JSON.stringify(recycler);
		 				   	  jsonStr=jsonStr.replace(/"/g,"'");
		 				   	   
		  
		 				      var url="";

		 				     

		 				      var treeData=curelement.attr("treeData");

			 				  if(treeData==null){
			 					  treeData="";
			 				  }else{
			 					  treeData=treeData.replace(/"/g,"'");
			 					  //treeData=treeData.replace(/\g,"");
			 				  }
		 				 
		 				      //alert(treeData)
		 				      setLayerBigDataParameter(treeData); 
		 				      url="toInteractGroupTouch.vs?currentdiv="+jsonStr+"&touchIds="+touchIds;
		 				      
		 				     layer.open({
									type: 2,
									area: ['900px', openh+'px'],
							        offset: '10px',
							        title:false,
							        fix: false, //不固定
							        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
							        content: url,
							        scrollbar: false,
							        end: function(){ 
	        		    			 if(window.returnValue==undefined||window.returnValue==""){
	        		    				window.returnValue=""; 			            
	        		    			 }else{
	        		    				 var rv=window.returnValue;
	        		    				 var rvs=rv.split("$");
					                     if(rvs.length==2){

					                    	  var recyclerReturn= eval( "(" + rvs[0] + ")" );
					                    	  
					                    	  curelement.attr("interactGroupShowNumber",recyclerReturn.interactGroupNumber); 
					                    	  curelement.attr("recycler",rvs[0]);
					                    	  curelement.attr("treeData",rvs[1]);
					                      }
					                      
	        		    				 
	        		    			}
	        		    		}
	        		    	 });
						    
			 }//文本 		   
			 else if (key=="mynew"){

               
				 
               var rsssrc=curelement.attr("rssSource");  //设置字体大小模式  0普通  1高级
               
               setLayerBigDataParameter(rsssrc); 
               
			   layer.open({
					  type: 2,
					  area: ['800px', 550+'px'],
			          offset: '20px',
			          title:false,
			          fix:false, //不固定
			          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
			          content: "toadrss.vs?sf="+sf,
			          scrollbar: false,
			          end: function(){ 
				         
				         setLayerBigDataParameter(""); 
				   
						 if(window.returnValue==undefined||window.returnValue==""){
							 
						     window.returnValue=""; 			            
						 
						 }else{
							
							var rv=window.returnValue;
							
							var tres=rv.split('|');
							
							rv=tres[0];
							
							var timee=tres[1];
				            
							curelement.attr("timee",timee);
							
							curelement.attr("rsssrc",rv); 

                            var rsssrcs=rv.split("&");
							
							var rssSource=new Object();

						    rssSource.rurl= rsssrcs[0].split("=")[1];
						    
						    rssSource.dx=rsssrcs[2].split("=")[1];
						    
						    rssSource.ys=rsssrcs[1].split("=")[1];
						    
						    rssSource.speed=rsssrcs[4].split("=")[1];
						    
						    rssSource.refreshTime=timee;
						    
						    rssSource.gdfs=rsssrcs[5].split("=")[1];
						    
						    curelement.attr("rssSource",JSON.stringify(rssSource));
							
							
							return;
						  }          
					}
				});

		   }else if(key=="eleva"){

			      var url="";

			      var treeData=curelement.attr("city");

				  if(treeData==null){
					  treeData="";
				  }else{
					  
				  }
			     
			      url="toadeleva.vs?selfCity="+treeData;
			      
			      layer.open({
			    	  
						type: 2,
						area: ['600px', '400px'],
				        offset: '40px',
				        title:false,
				        fix:false, //不固定
				        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
				        content: url,
				        scrollbar: false,
				        end: function(){ 
		    			 if(window.returnValue==undefined||window.returnValue==""){
		    				window.returnValue=""; 			            
		    			 }else{
		    				  var rv=window.returnValue;
		    				  var tres=rv.split('|');
		    				  curelement.attr("city",tres[1]);
		    				  return;
		    			 }
		    		  }
		    	 });
			    
              }else if(key=="envir"){

			      var url="";

			      var type=curelement.attr("type");

				  if(type==105){
					  
				      url="toEnvironment105Dll.vs?happyVal="+curelement.attr("happyVal")+"&uncomVal="+curelement.attr("uncomVal");
				      
				      layer.open({
				    	  
							type: 2,
							area: ['600px', '400px'],
					        offset: '40px',
					        title:false,
					        fix:false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: url,
					        scrollbar: false,
					        end: function(){ 
			    			 if(window.returnValue==undefined||window.returnValue==""){
			    				window.returnValue=""; 			            
			    			 }else{
			    				  
			    				  var rv=window.returnValue;
			    				  
			    				  var tres=rv.split('|');
			    				  
			    				  var envirs=tres[1].split("*");
			    				  
			    				  if(envirs.length==3){
			    					  
			    					  curelement.attr("happyVal",envirs[1]);
			    					  
			    					  curelement.attr("uncomVal",envirs[2]);
			    					  
			    				  }
			    				  
			    				  return;
			    			 }
			    		  }
			    	 });
					  
				  }
			     
			
			    
              }else if(key=="mycal"){
  
            	      var parmeter=curelement.attr("parmeter");
            	  
				      url="tocall.vs?mfile="+mfile+"&parmeter="+parmeter;
				      
				      layer.open({
				    	  
							type: 2,
							area: ['600px', '400px'],
					        offset: '40px',
					        title:false,
					        fix:false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: url,
					        scrollbar: false,
					        end: function(){ 
				    	    
			    			 if(window.returnValue==undefined||window.returnValue==""){
			    				    window.returnValue=""; 			            
			    			 }else{
			    				    var rv=window.returnValue;
						    	    
									var tres=rv.split('|');
									
									curelement.attr("parmeter",tres[2]);
									
									return;
			    			 }
			    		  }
			    	 });
					
              }					  				  
		             
	      }
	   }		
	});
	
	
	
	//元素动作出设置画面
	$(".menu-anim").on("click",function(){
		console.log("点击了 menu-anim");
		if(curelement != null){
			//元素动作编辑显示
			$(".anim_edit").show().siblings().hide();
			//显示当前元素的动作持续时间
			var animduration = curelement.attr("animduration");
			if(animduration != null && animduration != undefined){
				$(".anim-duration").val(animduration);
			}else{
				//如果之前没有持续时间，设置为1s
				$(".anim-duration").val("1");
			}
			//显示当前元素的动作类型
			var rClass = curelement.attr("curanimclass");
			if(rClass == null || rClass == undefined){
				rClass = "none";
			}
			$(".anim_wrap").children().each(function(){
				div = $(this);
		    	if(div.attr("animClass") == rClass){
		    		div.addClass("active").siblings().removeClass("active");
		    		return false;
		    	}
			});
		}
		//随时缩略图
        //sceneThumbnail();
	});
	
	//场景动作出设置画面
	$(".menu-sceneanim").on("click",function(){
		console.log("点击了menu-sceneanim");
		if(curScene != null){
			//点击场景动作，当前节点失去焦点
			if(curelement != null && curelement != undefined){
				$(".backg_tpl_item.active").click();
				//curScene.click();
			}
			//场景动作编辑显示
			$(".sceneanim_edit").show().siblings().hide();
			var sceneanimduration = curScene.attr("sceneanimduration");
			//console.log("当前元素animduration为:"+animduration);
			if(sceneanimduration != null && sceneanimduration != undefined){
				$(".sceneanim-duration").val(sceneanimduration);
			}else{
				//如果之前没有持续时间，设置为1s
				$(".sceneanim-duration").val("1");
			}
			
			//显示当前场景的动作类型
			var rClass = curScene.attr("cursceneanimclass");
			if(rClass == null || rClass == undefined){
				rClass = "none";
			}
			$(".sceneanim_wrap").children().each(function(){
				div = $(this);
		    	if(div.attr("sceneanimClass") == rClass){
		    		div.addClass("active").siblings().removeClass("active");
		    		return false;
		    	}
			});
		}
		//随时缩略图
        //sceneThumbnail();
	});	
	//设置/修改区域背景
	$(document).on("click",".menu-editbj",function(){			
		var sf=$("#sf").val();
	    var mfile=$("#mfile").val();
	    
	    //素材名
		var bgname =curelement.attr("bgname");

		  //素材fileName名
		var bgnameUrl=curelement.attr("bgnameUrl");

		  //0表示为无场景
		if(bgname==undefined||bgname=="0"){
			 bgname="null";
			 bgnameUrl="null";
		} 
		  
		  
	    window.returnValue=""; 
	    
	    layer.open({
	    	
			  type: 2,
	          area: ['900px', 525+'px'],
	          offset: '40px',
	          title:false,
	          fix:false, //不固定
	          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	          content: 'toscenebj.vs?sucai.type=1&gssi.sucaigroupid=0&sf='+sf+"&bgname="+bgname+"&bgnameUrl="+bgnameUrl,
	          scrollbar: false,
	          end: function(){ 
	    	      
	                var rv=window.returnValue;

	                if(rv==""){
	                	
	                	return;
	                	
	                }else if(rv=="unbj"){
	                	curelement.css({"backgroundImage":"url(files/"+rv+")"});
	                  //curScene.attr("title",rv.split("/")[1]);
	                	curelement.attr("title","");
	                	curelement.attr("bgname","0");
	                	curelement.attr("bgnameUrl","");
	                  
	      
	                }else{
		
				      var rvs=rv.split("$");
				      var bgtopfd="url(files/"+rvs[0]+")";
				      curelement.attr("title",rv.split("/")[1]);
				
				      curelement.css({
					           "backgroundImage":bgtopfd,
					           "backgroundSize":"cover",
					           "filter":"progid:DXImageTransform.Microsoft.AlphaImageLoader ( sizingMethod='scale' , src='"+bgtopfd+"')",
				               "backgroundSize":"100% 100%" 
					
				       });
				       
				      curelement.attr("bgtopfd",bgtopfd);
				      curelement.attr("bgname",rvs[1]);
				      curelement.attr("bgnameUrl",rvs[0].split("/")[1]);
			          //document.getElementById("bgname").innerHTML=rvs[1];
                    }
			  }    
		   });
	});
	//铺满
		$(document).on("click",".menu-bespread",function(){			
		if(curelement != null && isNolock()){
			
			sceneWidth = parseInt($("#topfd1").css("width"));
			
			sceneHeight = parseInt($("#topfd1").css("height"));
			
			curelement.css("top","0px").css("left","0px").width(sceneWidth).height(sceneHeight);
			
			console.log("sceneWidth:"+sceneWidth+"-----height:"+sceneHeight);
			
			if(curelement.is(".weather")){
				var wratio = null;
				var hratio = null;
				if(!weather_wratio){
					wratio = 0.05;
				}else{
					wratio = weather_wratio;
				}
				if(!weather_hratio){
					hratio = 0.1;
				}else{
					hratio = weather_hratio;
				}
				var v = 0;
				var w = sceneWidth*wratio;
				var h = sceneHeight*hratio;
				if(w<h){
					v = w;
				}else{
					v = h;
				}
				curelement.css("font-size",v+"px");
			}else if(curelement.is(".map")){
				redrawMap();
			}
			//随时缩略图
			//sceneThumbnail("NOT_SAVE_HIS");
		}
	});
	
	//置顶	
	$(document).on("click",".menu-popup",function() {
		if(curelement != null && isNolock()){
			console.log("置顶");
	        var c = curelement.siblings();
	        console.log(c);
	        d = c.last();
	        console.log(d);
	        d.after(curelement);
	        console.log(c.length);
	        curelement.css("zIndex", c.length + 1);
	        c.each(function(a, b) {
	            $(b).css("zIndex", a + 1);
	            console.log( $(b).css("zIndex"));
	        });
	      //随时缩略图
	        //sceneThumbnail();
		}
    });
	
	//置底
	$(document).on("click",".menu-popdown",function() {
		if(curelement != null && isNolock()){
	        var c = curelement.siblings();
	        d = c.first();
	        d.before(curelement);
	        curelement.css("zIndex", 1);
	        c.each(function(a, b) {
	            $(b).css("zIndex", a + 2);
	        });
	        //随时缩略图
	        sceneThumbnail();
		}
    });
	//上一层
	$(document).on("click",".menu-upper",function() {
		if(curelement != null && isNolock()){
	        var c = curelement.next();
	        if (! (c.length <= 0)) {
	            var d = curelement.css("zIndex");
	            curelement.css("zIndex", c.css("zIndex"));
	            c.css("zIndex", d);
	            c.after(curelement);
	        }
	      //随时缩略图
	        sceneThumbnail();
		}
    });
	//下一层
	$(document).on("click",".menu-downner",function() {
		if(curelement != null && isNolock()){
	        var c = curelement.prev();
	        if (! (c.length <= 0)) {
	            var d = curelement.css("zIndex");
	            curelement.css("zIndex", c.css("zIndex"));
	            c.css("zIndex", d);
	            c.before(curelement);
	        }
	        //随时缩略图
	        sceneThumbnail();
		}
    });
	

	//左对齐
	$(".menu-left").on("click",function(){
		if(curelement != null && isNolock()){
			console.log(widget);
			if(widget.length == 1){
				console.log('widget.length == 1');
				curelement.css("left","0px");
			}else if(widget.length > 1){			
				var left = widget[0].css("left");
				for(v in widget){
					widget[v].css("left",left);
				}		
			}
			//随时缩略图
			sceneThumbnail();
		}
	});
	$(".menu-right").on("click",function(){
		if(curelement != null && isNolock()){
			console.log(widget);
			if(widget.length == 1){
				curelement.css("left",(curelement.parent().width() - curelement.width())+"px");
			}else if(widget.length > 1){				
				var pleft1 = parseInt(widget[0].css("left").replace(/px/,"")) + widget[0].width();
				console.log(parseInt(widget[0].css("left").replace(/px/,"")));
				console.log(widget[0].width());
				for(v in widget){			
					if(v > 0){
						var pleft2 = parseInt(widget[v].css("left").replace(/px/,"")) + widget[v].width();
						var left =  pleft1 - pleft2;
						widget[v].css("left",(pleft2+left-widget[v].width())+"px");
					}
				}
			}
			//随时缩略图
			sceneThumbnail();
		}
	});
	$(".menu-top").on("click",function(){
		if(curelement != null && isNolock()){
			console.log(widget);
			if(widget.length == 1){
				console.log('widget.length == 1');
				curelement.css("top","0px");
			}else if(widget.length > 1){			
				var top = widget[0].css("top");
				for(v in widget){
					widget[v].css("top",top);
				}		
			}
			//随时缩略图
			sceneThumbnail();
		}
	});
	$(".menu-bottom").on("click",function(){
		if(curelement != null && isNolock()){
			if(widget.length == 1){
				curelement.css("top",(curelement.parent().height() - curelement.height())+"px");
			}else if(widget.length > 1){				
				var ptop1 = parseInt(widget[0].css("top").replace(/px/,"")) + widget[0].height();			
				for(v in widget){			
					if(v > 0){
						var ptop2 = parseInt(widget[v].css("top").replace(/px/,"")) + widget[v].height();
						var top =  ptop1 - ptop2;
						widget[v].css("top",(ptop2+top-widget[v].height())+"px");
					}				
				}		
			}
			//随时缩略图
			sceneThumbnail();
		}
	});
	
	$(".menu-middle").on("click",function(){	
		if(curelement != null && isNolock()){
			if(widget.length == 1){
				curelement.css("left",(curelement.parent().width()/2 - curelement.width()/2)+"px");
			}else if(widget.length > 1){				
				var pleft1 = parseInt(widget[0].css("left").replace(/px/,"")) + widget[0].width()/2;			
				for(v in widget){			
					if(v > 0){
						var pleft2 = parseInt(widget[v].css("left").replace(/px/,"")) + widget[v].width()/2;
						var left =  pleft1 - pleft2;
						widget[v].css("left",(pleft2+left-widget[v].width()/2)+"px");
					}				
				}		
			}
			//随时缩略图
			sceneThumbnail();
		}
	});
	$(".menu-center").on("click",function(){	
		if(curelement != null && isNolock()){
			if(widget.length == 1){
				curelement.css("top",(curelement.parent().height()/2 - curelement.height()/2)+"px");
			}else if(widget.length > 1){				
				var ptop1 = parseInt(widget[0].css("top").replace(/px/,"")) + widget[0].height()/2;			
				for(v in widget){			
					if(v > 0){
						var ptop2 = parseInt(widget[v].css("top").replace(/px/,"")) + widget[v].height()/2;
						var top =  ptop1 - ptop2;
						widget[v].css("top",(ptop2+top-widget[v].height()/2)+"px");
					}				
				}		
			}
			//随时缩略图
			sceneThumbnail();
		}
	});
	function sortTop(a,b){
		 return a.css("top") - b.css("top");
	}
	$(".menu-topavg").on("click",function(){
		if(curelement != null && isNolock()){
			 if(widget.length >=3){	
				widget.sort(sortTop);
				console.log(widget);
				var toptotal = 0;
				for(var i = 0;i<widget.length-1;i++){
					toptotal= toptotal + (parseInt(widget[i+1].css("top").replace(/px/,""))- (parseInt(widget[i].css("top").replace(/px/,""))+widget[i].height()));
				}	
				console.log('toptotal');
				console.log(toptotal);
				var topavg = parseInt(toptotal/(widget.length-1));		
				console.log('topavg');
				console.log(topavg);
				for(v in widget){			
					if(v > 0 && v < (widget.length-1)){
						console.log("v");
						console.log(v);
						console.log("3333333333333333333");
						var top = topavg + parseInt(widget[v-1].css("top").replace(/px/,""))+widget[v-1].height();
						widget[v].css("top",top+"px");
					}				
				}		
			}
			//随时缩略图
			sceneThumbnail();
		}
	});
	$(".menu-leftavg").on("click",function(){		
		if(curelement != null && isNolock()){
			 if(widget.length >=3){	
				widget.sort(sortTop);
				console.log(widget);
				var lefttotal = 0;
				for(var i = 0;i<widget.length-1;i++){
					lefttotal= lefttotal + (parseInt(widget[i+1].css("left").replace(/px/,""))- (parseInt(widget[i].css("left").replace(/px/,""))+widget[i].width()));
				}			
				var leftavg = parseInt(lefttotal/(widget.length-1));	
				for(v in widget){			
					if(v > 0 && v < (widget.length-1)){				
						var left = leftavg + parseInt(widget[v-1].css("left").replace(/px/,""))+widget[v-1].width();
						widget[v].css("left",left+"px");
					}				
				}		
			}
			//随时缩略图
			sceneThumbnail();
		}
	});
	
	//判断历史信息里是否有下一步信息
	function hasNextHis(){
		var len = historical.length - (curKey+1);
		if(len > 0){
			return true;
		}else{
			return false;
		}
	}
	
	//判断历史信息里是否有上一步信息
	function hasPrevHis(){
		if(curKey > 0){
			return true;
		}else{
			return false;
		}
	}
	
	//根据历史信息进行撤销,并返回是否还有上一步
	function backoutHis(){
		var flag = true;
		//判断是否有上个历史信息
		console.log("判断是否有上个历史信息");
		if(hasPrevHis()){
			//清空定时器
			if(timerTasks&&timerTasks.length>0){
				for(var x in timerTasks){
					clearInterval(timerTasks[x]);
				}
			}
			console.log("判断通过有上个历史信息");
			curKey--;
			curHis = historical[curKey];
			var htmlxArr = [];
			$(curHis).children().each(function(){
				htmlxArr.push($(this).prop("outerHTML"));
				//console.log("curKey:"+curKey);
				//console.log("htmlxArr:"+$(this).prop("outerHTML"));
			});
			//获取重构前当前场景index
			var rebackg_tpl_item_index = $(".backg_tpl .backg_tpl_item.active:first .tpl_item_index").html();
			//重构编辑器
			reeditor(htmlxArr,"notBackOne");
			//还原选中重构前选的场景
			$(".backg_tpl .backg_tpl_item .tpl_item_index").each(function(){
				if($(this).html() === rebackg_tpl_item_index){
					$(this).click();
					return false;
				}
			});
		}else{
			flag = false;
			curKey = -1;
			curHis = "";
			//如果没上一个历史信息，删除所有元素
			$(".element").remove();
			//缩略图
			sceneThumbnail("NOT_SAVE_HIS");
			//计算场景时长
		    sceneLong(curScene);
		}
		showBackoutRedo();
		return flag;
	}
	
	//根据历史信息进行重做,并返回是否还有下一步
	function redoHis(){
		var flag = true;
		if(hasNextHis()){
			//清空定时器
			if(timerTasks&&timerTasks.length>0){
				for(var x in timerTasks){
					clearInterval(timerTasks[x]);
				}
			}
			curKey++;
			curHis = historical[curKey];
			var htmlxArr = [];
			$(curHis).children().each(function(){
				htmlxArr.push($(this).prop("outerHTML"));
			});
			//获取重构前当前场景index
			var rebackg_tpl_item_index = $(".backg_tpl .backg_tpl_item.active:first .tpl_item_index").html();
			//重构编辑器
			reeditor(htmlxArr,"notBackOne");
			//还原选中重构前选的场景
			$(".backg_tpl .backg_tpl_item .tpl_item_index").each(function(){
				if($(this).html() === rebackg_tpl_item_index){
					$(this).click();
					return false;
				}
			});
			flag = hasNextHis();
		}else{
			//没有下一步了
			flag = false;
		}
		showBackoutRedo();
		return flag;
	}
	
	//保存历史信息(用于撤销、重做功能)
	function saveHis(){
		//获取场景内容
		var htmlx = "<div>";
		$("[id^='topfd']").each(function(){
			htmlx += $(this).prop("outerHTML");
		});
		htmlx += "</div>";
		console.log("准备判断是否允许保存历史信息");
		if(historical.length >= 0 && curHis != htmlx){
			console.log("判断通过允许保存历史信息  historical.length:"+historical.length);
			//判断当前KEY是不是历史信息里最后一个下标
			var len = historical.length - (curKey+1);
			//如果当前KEY是历史信息最后一个参数下标的话，则直接增加
			//如果当前KEY不是历史信息最后一个参数下标，则删除当前KEY之后的历史信息，再增加
			if(len != 0){
				historical.splice(curKey+1,len);
			}
			curHis = htmlx;
			curKey++;
			historical.push(curHis);
			showBackoutRedo();
		}
	}
	

	
	//控制撤销和重做按钮是否显示
	function showBackoutRedo(){
		if(hasNextHis()){
			//有下一步，显示重做按钮
			$("#redo").removeClass("gray");
		}else{
			//没有下一步，隐藏重做按钮（或变灰）
			$("#redo").addClass("gray");
		}
		if(curKey != -1){
			//有上一步，显示撤销按钮
			$("#undo").removeClass("gray");
		}else{
			//没有上一步，隐藏撤销按钮（或变灰）
			$("#undo").addClass("gray");
		}
	}
	
	//用于计算框框的宽度
	var tWidth = $("#width").val();
	var tHeight = $("#height").val();

	//缩略图(公用)
	function sceneThumbnail(key){
		//进行缩略图，标志为未保存状态
		
		//isSaved = false;
		//刷新保存按钮状态
		//refreshsavebtn();
    	//配合终端视频要求现在视频最高层
    	//videotop();
    	
		//console.log(" sceneThumbnail - key:"+key);
		//var thumbnailWidth = parseInt($(".backg_tpl_item.active .tpl_item_thumbnail").css("width"));
		//var thumbnailHeight = parseInt($(".backg_tpl_item.active .tpl_item_thumbnail").css("height"));
		//dotW = thumbnailWidth/tWidth;
		//dotH = thumbnailHeight/tHeight;
		//构建缩略图		
		//var $sceneT = $("<div class='thumbnail'></div>");
		//$sceneT.attr("style",curScene.attr("style"));
		//$sceneT.css("width",tWidth).css("height",tHeight);
		
		//curScene.find(".element").each(function(){
		//	var element = $("<div></div>");
		//	element.attr("style",$(this).attr("style"));
		//	var child = null;
		//	switch($(this).attr("from")){
		//		case "text_edit":
		//			//child = $("<div></div>");
					//var html = $(this).find(".ql-editor").html();
		//			child = $(this).find(".ql-editor").clone();
					//child.append(html);
					//child.css("word-wrap","break-word");
		//			element.append(child).addClass("thumbnail_text_edit");
		//			break;
		//		case "weather_edit":
		//			child = $(this).find(".tqtable").clone();
		//			element.append(child).addClass("thumbnail_weather_edit");
		//			break;
		//		case "date_edit":
		//			element.append($(this).find(".op-beijingtime-box").clone());
		//			break;
		//		case "countdown_edit":
		//			element.append($(this).find(".countdown-box").clone());
		//			break;
		//		case "map_edit":
		//			element.append("<div class='mapdiv' style='height:100%;'><img src='/apm-web/static/images/program/map.png' style='width:100%;height:100%;'></div>");
		//			break;
		//		case "exchange_edit":
		//			element.append($(this).find(".exchangetable").clone());
		//			break;
		//		case "stock_edit":
		//			element.append($(this).find(".stocktable").clone());
		//			break;
		//		case "numberofruns_edit":
		//			element.append($(this).find(".numberofruns-content").clone());
		//			break;
		//		case "materialApk_edit":
		//			   element.append($(this).find("img").clone()).append($(this).find(".apk-show-name").clone()).addClass("thumbnail_"+$(this).attr("from"));
		//			break;
		//		case "office_edit":
		//			var addclassstr = null;
		//			var imglist = $(this).attr("curimglist");
		//			if(imglist && imglist.length > 0){
		//				addclassstr = "thumbnail_"+$(this).attr("officetype")+"_edit";
		//			}else{
		//				addclassstr = "thumbnail_office_edit";
		//			}
		//			child = $(this).find("img").clone();
		//			element.append(child).addClass(addclassstr);
		//			break;
		//		default:
		//		   child = $(this).find("img").clone();
		//		   element.append(child).addClass("thumbnail_"+$(this).attr("from"));
		//		   break;
		//	}
		//	$sceneT.append(element);
		//});
		//设置位置
		//console.log("设置位置:");
		//var obj = $(this);
		//displayMaterialInfo(obj.attr("id"),parseInt(obj.css("left")),parseInt(obj.css("top")),parseInt(obj.css("width")),parseInt(obj.css("height")));
		
		
		//$sceneT.css({"width":tWidth+"px","height":tHeight+"px","marginLeft":-tWidth/2,"marginTop":-tHeight/2+(thumbnailHeight/2),"transform":"scale("+dotW+","+dotH+")"});
		//$(".backg_tpl_item.active .tpl_item_thumbnail_copy").empty().append($sceneT);				
	}
	
	function testcheckbox(){
		console.log("testcheckbox");
		obj = document.getElementsByName("test");
		check_val = [];
		for(k in obj){
        if(obj[k].checked)
            check_val.push(obj[k].value);
		}
    alert(check_val);
	}
	/*
	$(function(){  
    $("input[type='button']").click(function() {
        $("input[name='test']:checked").each(function() { // 遍历选中的checkbox
            n = $(this).parents("tr").index();  // 获取checkbox所在行的顺序
            $("table#test_table").find("tr:eq("+n+")").remove();
        });
    });
});*/
	//全不选
	function cancelDomCheckbox(){
		$("input[name=checkdom]:checked").each(function(){
			console.log("cancelDomCheckbox:"+$(this).attr("eId"));
			$("input[eId="+$(this).attr("eId")+"]").prop("checked",false)	;
			
				$("#"+$(this).attr("eId")).removeClass("active");
		})
	}
	
	//全选
	function DomCheckbox(){
		 /*$("input[name = checkdom]:checkbox").prop("checked", true);	*/
		 $("input[name = checkdom]:checkbox").each(function(){
			console.log("DomCheckbox:"+$(this).attr("eId"));
			$("input[eId="+$(this).attr("eId")+"]").prop("checked",true);	
			
			$("#"+$(this).attr("eId")).addClass("active");		
			
		})	 
	}
	//反选
	function orDomCheckbox(){
		$("input[name = checkdom]:checkbox").each(function(){
			if ($("input[eId="+$(this).attr("eId")+"]").prop("checked")){
			$("input[eId="+$(this).attr("eId")+"]").prop("checked",false);	
			
			$("#"+$(this).attr("eId")).removeClass("active");	
			}else{
				$("input[eId="+$(this).attr("eId")+"]").prop("checked",true);	
			
			    $("#"+$(this).attr("eId")).addClass("active");
			}										
		})
	}
	
	//checkbox
	$(document).on("input change","#elementList input:checkbox",function () {
		console.log("change2:"+$(this).attr("eId"));
		console.log("elementList checked:"+$(this).prop("checked"));
		if ($(this).prop("checked")==true){
			$("#"+$(this).attr("eId")).addClass("active");
		}else{
			$("#"+$(this).attr("eId")).removeClass("active");
		}		
	})
	
	
	function alignwidth(){
		var flag = 0;
		$("input[name=radiowidth]:checked").each(function(){
		//	console.log("alignwidth:"+$(this).val());	
			flag = $(this).val();
		});
		
		var value = null;
		obj = document.getElementsByName("checkdom");
		for (k in obj){
			if (obj[k].checked){
				if (value==null){
					value = parseInt($("#"+$(obj[k]).attr("eId")).css("width"));
				}else{
					if (flag==0){
						//最小值
						if (parseInt($("#"+$(obj[k]).attr("eId")).css("width"))<value){
							value = parseInt($("#"+$(obj[k]).attr("eId")).css("width"))
						}
					}else{
						//最大值
						if (parseInt($("#"+$(obj[k]).attr("eId")).css("width"))>value){
							value = parseInt($("#"+$(obj[k]).attr("eId")).css("width"))
						}
					}										
				}
			}
		}
		for(k in obj){
        if(obj[k].checked)
				$("#"+$(obj[k]).attr("eId")).css("width",value);			
		}						
	}
	
	function alignheight(){
		var flag = 0;
		$("input[name=radioheight]:checked").each(function(){
			flag = $(this).val();				
		})
				var value = null;
		obj = document.getElementsByName("checkdom");
		for (k in obj){
			if (obj[k].checked){
				if (value==null){
					value = parseInt($("#"+$(obj[k]).attr("eId")).css("height"));
				}else{
					if (flag==0){
						//最小值
						if (parseInt($("#"+$(obj[k]).attr("eId")).css("height"))<value){
							value = parseInt($("#"+$(obj[k]).attr("eId")).css("height"))
						}
					}else{
						//最大值
						if (parseInt($("#"+$(obj[k]).attr("eId")).css("height"))>value){
							value = parseInt($("#"+$(obj[k]).attr("eId")).css("height"))
						}
					}										
				}
			}
		}
		for(k in obj){
        if(obj[k].checked)
				$("#"+$(obj[k]).attr("eId")).css("height",value);			
		}
	}

	function alignleft(){
		console.log("左对齐:");
		//左对齐
		obj = document.getElementsByName("checkdom");		
		var left = null;
		for (k in obj){
			if (obj[k].checked){
				if (left==null){
					
					    left = parseInt($("#"+$(obj[k]).attr("eId")).css("left"));
				
				}else{
					
					if (parseInt($("#"+$(obj[k]).attr("eId")).css("left"))<left){
						
						left = parseInt($("#"+$(obj[k]).attr("eId")).css("left"))
						
					}
					
				}
			}
		}
		for(k in obj){
        if(obj[k].checked)
			
				$("#"+$(obj[k]).attr("eId")).css("left",left);
			
		}
	}
	
	
	
	function alignright(){
		console.log("右对齐:");
		//右对齐
		obj = document.getElementsByName("checkdom");
		var left = null;
		for (k in obj){
			if (obj[k].checked){
				if (left==null){
					left = parseInt($("#"+$(obj[k]).attr("eId")).css("left"))+parseInt($("#"+$(obj[k]).attr("eId")).css("width"));
				}else{
					if (parseInt($("#"+$(obj[k]).attr("eId")).css("left"))+parseInt($("#"+$(obj[k]).attr("eId")).css("width"))>left){
						left = parseInt($("#"+$(obj[k]).attr("eId")).css("left"))+parseInt($("#"+$(obj[k]).attr("eId")).css("width"))
					}
				}
			}
		}
		
		for(k in obj){
        if(obj[k].checked)
			
				$("#"+$(obj[k]).attr("eId")).css("left",left-parseInt($("#"+$(obj[k]).attr("eId")).css("width")));
			
		}
	}
	
	function aligntop(){
		console.log("上对齐:");
		//左对齐
		obj = document.getElementsByName("checkdom");
		var flag = null;
			for (k in obj){
			if (obj[k].checked){
				
				
				
				if (flag==null){
					flag = parseInt($("#"+$(obj[k]).attr("eId")).css("top"));
				}else{
					if (parseInt($("#"+$(obj[k]).attr("eId")).css("top"))<flag){
						flag = parseInt($("#"+$(obj[k]).attr("eId")).css("top"))
					}
				}
			}
		}
		
		for(k in obj){
        if(obj[k].checked)
			$("#"+$(obj[k]).attr("eId")).css("top",flag);
			
		}
	}
	
	function alignbottom(){
		console.log("下对齐:");
		//下对齐
		obj = document.getElementsByName("checkdom");
		var flag = null;
			var flag = null;
			
		for (k in obj){
			if (obj[k].checked){
				if (flag==null){
					flag = parseInt($("#"+$(obj[k]).attr("eId")).css("top"))+parseInt($("#"+$(obj[k]).attr("eId")).css("height"));
				}else{
					if (parseInt($("#"+$(obj[k]).attr("eId")).css("top"))+parseInt($("#"+$(obj[k]).attr("eId")).css("height"))>flag){
						flag = parseInt($("#"+$(obj[k]).attr("eId")).css("top"))+parseInt($("#"+$(obj[k]).attr("eId")).css("height"))
					}
				}
			}
		}
		
		for(k in obj){
        if(obj[k].checked)
		$("#"+$(obj[k]).attr("eId")).css("top",flag-parseInt($("#"+$(obj[k]).attr("eId")).css("height")));
			
		}
	}
	
	//水平居中分布
	function alignlevel(){
		console.log("水平居中分布:");
		obj = document.getElementsByName("checkdom");
		
		var checkdoms=new Array();
			
		for (k in obj){
			if (obj[k].checked){
				
				checkdoms.push(obj[k]);
				
			}
		}
		
		if(checkdoms.length>2){
			
			//排序 从小到大
			checkdoms.sort(
				 function(a,b){
					return $("#"+$(a).attr("eId")).css("left").replace(/px/g,"")-$("#"+$(b).attr("eId")).css("left").replace(/px/g,"");
		         }
			);
			
			//最小
			var leftSmall=$("#"+$(checkdoms[0]).attr("eId")).css("left").replace(/px/g,"");
			//最大
			var leftBig=$("#"+$(checkdoms[checkdoms.length-1]).attr("eId")).css("left").replace(/px/g,"");
			//算出平均值
			var leftAvg=parseInt((leftBig-leftSmall)/(checkdoms.length-1));
			
			
			
			for(var i=0;i<checkdoms.length;i++){
				
				if(i!=0&&i<checkdoms.length-1){
					//console.log("left修改:"+(parseInt(leftSmall)+parseInt(leftAvg*i)));
					$("#"+$(checkdoms[i]).attr("eId")).css("left",(parseInt(leftSmall)+parseInt(leftAvg*i)));
					
				}
				
	            
	        }
			
		}
		
		
		
	}
	
	
	
	//垂直居中分布
	function alignvertical(){
		console.log("垂直居中分布:");
		obj = document.getElementsByName("checkdom");
		
		var checkdoms=new Array();
			
		for (k in obj){
			if (obj[k].checked){
				
				checkdoms.push(obj[k]);
				
			}
		}
		
		if(checkdoms.length>2){
			
			//排序 从小到大
			checkdoms.sort(
				 function(a,b){
					return $("#"+$(a).attr("eId")).css("top").replace(/px/g,"")-$("#"+$(b).attr("eId")).css("top").replace(/px/g,"");
		         }
			);
			
			//最小
			var topSmall=$("#"+$(checkdoms[0]).attr("eId")).css("top").replace(/px/g,"");
			//最大
			var topBig=$("#"+$(checkdoms[checkdoms.length-1]).attr("eId")).css("top").replace(/px/g,"");
			//算出平均值
			var topAvg=parseInt((topBig-topSmall)/(checkdoms.length-1));
			
			
			
			for(var i=0;i<checkdoms.length;i++){
				
				if(i!=0&&i<checkdoms.length-1){
					//console.log("left修改:"+(parseInt(leftSmall)+parseInt(leftAvg*i)));
					$("#"+$(checkdoms[i]).attr("eId")).css("top",(parseInt(topSmall)+parseInt(topAvg*i)));
					
				}
				
	            
	        }
			
		}
		
		
		
	}
	
	
	
	
	
	
	function eachdom(){
		var addscene = $(".scene_edit");
		var curScene = $("#topfd1");
		curScene.find(".element").each(function(){
			//获取节目页面上面的所有元素
			var element = $("<div></div>");
			element.attr("style",$(this).attr("style"));			
			var child = null;
			console.log("obj:"+$(this).attr("from"));
			switch($(this).attr("from")){
				case "text_edit":
					//child = $(this).find(".ql-editor").clone();
					//element.append(child).addClass("thumbnail_text_edit");
					//addscene.append("<input type='checkbox' value='"+$(this).attr("id")+"' name='test'/>"+$(this).attr("id"));
					console.log("object:",$(this).css("width"));
					console.log("id:",$(this).attr("id"));
					
					console.log("content:",$(this).find("div").html());
					break;
				case "weather_edit":
					child = $(this).find(".tqtable").clone();
					element.append(child).addClass("thumbnail_weather_edit");
					break;
				case "date_edit":
					element.append($(this).find(".op-beijingtime-box").clone());
					break;
				case "countdown_edit":
					element.append($(this).find(".countdown-box").clone());
					break;
				case "map_edit":
					element.append("<div class='mapdiv' style='height:100%;'><img src='/apm-web/static/images/program/map.png' style='width:100%;height:100%;'></div>");
					break;
				case "exchange_edit":
					element.append($(this).find(".exchangetable").clone());
					break;
				case "stock_edit":
					element.append($(this).find(".stocktable").clone());
					break;
				case "numberofruns_edit":
					element.append($(this).find(".numberofruns-content").clone());
					break;
				case "materialApk_edit":
					   element.append($(this).find("img").clone()).append($(this).find(".apk-show-name").clone()).addClass("thumbnail_"+$(this).attr("from"));
					break;
				case "office_edit":
					var addclassstr = null;
					var imglist = $(this).attr("curimglist");
					if(imglist && imglist.length > 0){
						addclassstr = "thumbnail_"+$(this).attr("officetype")+"_edit";
					}else{
						addclassstr = "thumbnail_office_edit";
					}
					child = $(this).find("img").clone();
					element.append(child).addClass(addclassstr);
					break;
				default:
				   child = $(this).find("img").clone();
				   element.append(child).addClass("thumbnail_"+$(this).attr("from"));
				   break;
			}
			
		});
	}
	
	//创建缩略图画布
	function resceneThumbnail(curSceneCount,index,rescene,type){
		//创建缩略图画布
		//var st = $("<div class='backg_tpl_item' long='3600' id='tpl_item_"+curSceneCount+"' to='topfd"+curSceneCount+"' backsrc='' backname='' backcolor=''><div class='pull-left'><span class='tpl_item_index'>"+index+"</span><span class='time'></span><a href='javascript:void(0)' class='glyphicon glyphicon-trash scene-del'></a></div><div class='tpl_item_thumbnail pull-right'><div class='tpl_item_thumbnail_copy'></div></div></div>");		
		var st = $("<div class='backg_tpl_item "+type+" active' draggable='true' long='10' id='tpl_item_"+curSceneCount+"' to='topfd"+curSceneCount+"' backcolor=''>"+
				"<div class='tpl_item_thumbnail pull-right'>"+
					"<div class='tpl_item_thumbnail_copy'></div>"+
			  		"<a href='javascript:void(0)' class='glyphicon glyphicon-trash scene-del hide'></a>"+
					 	"<span class='tpl_time_line'></span>"+
						"<span class='tpl_time_edit' onclick='sceneTimebox(this);'>"+
  							"<span class='tpl_time_edit_img'></span>"+
  							"<span class='time'>00:00:10</span>"+
						"</span>"+
			  	"</div>"+
			  	"<div class='tpl_index pull-right'>"+
				  	"<span class='tpl_item_index'>"+index+"</span>"+
			  	"</div>"+
			 "</div>");
		return st;
	}
	
	
	
	
	
	//重构场景
	function resence(htmlx){
		//去除记录当前元素
		console.log("重构场景");
		$(".element").removeClass("active");
		curelement = null;

		//根据HTML内容生成JQ对象（场景节点）
		var backg_tpl_itemRe = $(htmlx);	
		if(!backg_tpl_itemRe.hasClass("content-center-topfd")){
			backg_tpl_itemRe = backg_tpl_itemRe.find(".content-center-topfd");
		}
		//背景图标处于选中状态
		//$("#for_backg_edit").addClass("active").siblings().removeClass("active");
		//背景编辑显示
		$(".backg_edit").show().siblings().hide();
		curSceneCount++;
		//var index = $(".backg_tpl_item").length +1;
		var index = "";//用公用方法算，这里就不单独算了
		var type = null;
		//根据场景是否有父ID属性，判断是场景都是父场景还是子场景（有父ID的是子场景）
		if(!backg_tpl_itemRe.attr("parentid")){
			type = "tpl_parent";
		}else{
			type = "tpl_children";
		}
		if(isVertical){
			type += " vertical";
		}
		var newbackg_tpl_item = resceneThumbnail(curSceneCount,index,null,type);//resceneThumbnail(curSceneCount,index,backg_tpl_itemRe);

		$(".backg_tpl").append(newbackg_tpl_item);
		//不同于添加的部分
		
		//复制场景动作的设置
		//场景动作持续时间
		var sceneanimduration = backg_tpl_itemRe.attr("sceneanimduration");
		if(sceneanimduration == null || sceneanimduration == undefined){
			sceneanimduration = "";
		}else{
			sceneanimduration = " sceneanimduration='"+sceneanimduration+"'";
		}
		//场景动作样式（动作类型）
		var cursceneanimclass = backg_tpl_itemRe.attr("cursceneanimclass");
		if(cursceneanimclass == null || cursceneanimclass == undefined){
			cursceneanimclass = "";
		}else{
			cursceneanimclass = " cursceneanimclass='"+cursceneanimclass+"'";
		}		
		
		var newScene = $('<div id="topfd'+curSceneCount+'" ' + sceneanimduration + cursceneanimclass + ' long=0 class=" content-center-topfd " language="'+programLanguage+'" style="position:relative;width:'+sceneWidth+'px;height:'+sceneHeight+'px;background-color:rgb(255,255,255);background-size:100% 100%;background-repeat:no-repeat;"></div>');
		
		$(".content-main-edit").append(newScene);
		
		//场景初始化
		if(backg_tpl_itemRe.attr("parentid")){
			newScene.attr("parentid",backg_tpl_itemRe.attr("parentid")).attr("parentto",backg_tpl_itemRe.attr("parentto"));	
		}
		newScene.attr("standardfsize",standardfsize).css("font-size",standardscalefsize+"px").attr("programwidth",backg_tpl_itemRe.attr("programwidth")).attr("programheight",backg_tpl_itemRe.attr("programheight"));
		
		//设置场景锁定时间
		var locklong = parseInt(backg_tpl_itemRe.attr("locklong"));
		if(isNaN(locklong) && locklong < 1){
			locklong = 0;
		}else{
			newbackg_tpl_item.attr("locklong",locklong);
			newScene.attr("locklong",locklong);
		}
		
		//设置背景颜色
		backgroundColorSetting(backg_tpl_itemRe.attr("bgcolor"),newScene);
		//设置背景图片
		backgroundImgSetting(backg_tpl_itemRe.attr("backsrc"),backg_tpl_itemRe.attr("backname"),backg_tpl_itemRe.attr("backattrid"),newScene);
		
		//场景音乐
		var scene_music = backg_tpl_itemRe.find(".scene_music");
		if(scene_music.length > 0){
			newScene.append(scene_music);
		}
		//场景元素	
		backg_tpl_itemRe.find(".element").each(function(){			
			total++;
			var from = $(this).attr("from");
			//复制元素动作的设置
			//元素动作持续时间
			var animduration = $(this).attr("animduration");
			if(animduration == null || animduration == undefined){
				animduration = "";
			}else{
				animduration = " animduration='"+animduration+"'";
			}
			//元素动作样式（动作类型）
			var curanimclass = $(this).attr("curanimclass");
			if(curanimclass == null || curanimclass == undefined){
				curanimclass = "";
			}else{
				curanimclass = " curanimclass='"+curanimclass+"'";
			}
			
			//是否设置宽高
			var showwidth = $(this).attr("showwidth");
			if(showwidth){
				showwidth = " showwidth='"+showwidth+"' ";
			}else{
				showwidth = "";
			}
			var showheight = $(this).attr("showheight");
			if(showheight){
				showheight = " showheight='"+showheight+"' ";
			}else{
				showheight = "";
			}
			//类型为txt ,addtxt
			if(from == "text_edit"){
				var txtanimtypeduration = $(this).attr("txtanimtypeduration");
				if(txtanimtypeduration){
					txtanimtypeduration = " txtanimtypeduration='"+txtanimtypeduration+"' ";
				}else{
					txtanimtypeduration = "";
				}
				//var add = $("<div id='fonts_"+total+"' "+curanimclass+animduration+" class='ui-state-active element font active' title='' from='text_edit' style='width:320px;min-height:38px;position: absolute;top:0px;left:0px;z-index:"+total+";color:#000;text-align:left;background-color:#fff' txtanimtype='none' />");	          
	   			var add = $("<div id='fonts_"+total+"' "+curanimclass+animduration+" "+showwidth+showheight+" fontsize='"+$(this).attr("fontsize")+"' bgcolor='"+$(this).attr("bgcolor")+"' transparent='"+$(this).attr("transparent")+"' txtcolor='"+$(this).attr("txtcolor")+"' class='ui-state-active element font active' title='' from='text_edit' txtanimtype='"+$(this).attr("txtanimtype")+"' "+txtanimtypeduration+" rangestart='"+$(this).attr("rangestart")+"' rangeend='"+$(this).attr("rangeend")+"' />");
	   			add.attr("style",$(this).attr("style")).attr("z-index",total);
			}else if(from == "img_edit"){
			
				var add = $("<div id='image_"+total+"' "+curanimclass+animduration+" "+showwidth+showheight+" class='element active image' title='' curimglist='' from='img_edit' style='top:0px;left:0px;display:block;width:200px;height:200px;position: absolute;z-index:"+total+";background-color:#fff;' ></div>");
				copyinit(add,$(this));   
			}else if(from == "webpage_edit"){
				var add = $("<div id='webpage_"+total+"' "+curanimclass+animduration+" "+showwidth+showheight+" class='element active webpage' title='' curimglist='"+$(this).attr("curimglist")+"' from='webpage_edit' source='"+$(this).attr("source")+"' name='"+$(this).attr("name")+"' attrid='"+$(this).attr("attrid")+"'><img src='' style='width:100%;height:100%'></div>");
				add.attr("style",$(this).attr("style")).attr("z-index",total);
			}else if(from == "port_edit"){
				var add = $(this).clone();
				add.find(".ui-resizable-handle").remove();
				add.attr("id","port_"+total);
			}else if(from == "video_edit"){
				var add = $("<div id='video_"+total+"' "+curanimclass+animduration+" "+showwidth+showheight+" class='video element active' title='' curimglist='' from='video_edit' style='left:0px;top:0px;z-index:"+total+";position:absolute;width:200px; height:200px;background-color:#fff' ></div>");				
				$(add).attr("curimglist",$(this).attr("curimglist"));				          
				$(add).append($(this).find("img").clone());   
			}else if(from == "music_edit"){
				//无这种元素
				var add = $("<div id='music_"+total+"' "+curanimclass+animduration+" class='music element active' title='' curimglist='' from='music_edit' style='left:0px;top:0px;z-index:"+total+";position:absolute;width:200px; height:200px;background-color:#fff'></div>");		
				$(add).attr("curimglist",$(this).attr("curimglist"));				    
				$(add).append($(this).find("img").clone());   
			}else if(from == "office_edit"){
				var add = $("<div id='office_"+total+"' "+curanimclass+animduration+" "+showwidth+showheight+" officetype='ppt' class='office element active' title='' curimglist='' from='office_edit' style='left:0px;top:0px;z-index:"+total+";position:absolute;width:200px; height:200px;background-color:#fff'></div>");
				$(add).attr("officetype",$(this).attr("officetype"));
				copyinit(add,$(this));
			}else if(from == "weather_edit"){
				var add = $(this).clone();//$("<div id='weather_"+total+"' "+curanimclass+animduration+" class='weather element active' title='' curimglist='' from='weather_edit' style='left:0px;top:0px;z-index:"+total+";position:absolute;width:200px; height:200px;background-color:#fff'></div>");
				add.find(".ui-resizable-handle").remove();
				add.attr("id","weather_"+total);
			}else if(from == "map_edit"){
				var add = $(this).clone();
				add.find(".ui-resizable-handle").remove();
				add.attr("id","map_"+total);
			}else if(from == "exchange_edit"){
				var add = $(this).clone();
				add.find(".ui-resizable-handle").remove();
				add.attr("id","map_"+total);
			}else if(from == "stock_edit"){
				var add = $(this).clone();
				add.find(".ui-resizable-handle").remove();
				add.attr("id","stock_"+total);
			}else if(from == "numberofruns_edit"){
				var add = $(this).clone();
				add.find(".ui-resizable-handle").remove();
				add.attr("id","numberofruns_"+total);
			}else if(from == "date_edit"){
				var add = $("<div id='date_"+total+"' "+curanimclass+animduration+" "+showwidth+showheight+" class='date element active' title='' timezone=8 dateStyle='1' fontsize='2' txtcolor='#000' from='date_edit' style='font-size:26px;left:0px;top:0px;z-index:"+total+";position:absolute;width:232px; height:37px;'></div>");
				//初始化元素样式					
				add.attr("timezone",$(this).attr("timezone"));
				add.attr("datestyle",$(this).attr("datestyle"));
				add.css("font-size",$(this).css("font-size"));
				add.attr("fontsize",$(this).attr("fontsize"));
				add.attr("txtcolor",$(this).attr("txtcolor"));
				add.css("color",$(this).css("color"));
				add.css("font-weight",$(this).css("font-weight"));
				add.css("font-style",$(this).css("font-style"));
				var interval = $(this).attr("interval");
				if(interval){
					clearInterval(interval);  
				}
	            $(add).append($(this).find(".op-beijingtime-box").clone());   
			}else if(from == "countdown_edit"){
				var add = $("<div id='countdown_"+total+"' "+curanimclass+animduration+" "+showwidth+showheight+" class='countdown element active' title='' from='countdown_edit' style='text-align:center;font-size:13px;left:0px;top:0px;z-index:"+total+";position:absolute;width:401px; height:100px;'></div>");
				//初始化元素样式					
				add.attr("countdowndate",$(this).attr("countdowndate"));
				add.attr("fontsize",$(this).attr("fontsize"));
				add.css("font-size",$(this).css("font-size"));
				add.attr("txtcolor",$(this).attr("txtcolor"));
				add.css("color",$(this).css("color"));
				add.attr("bgcolor",$(this).attr("bgcolor"));
				if($(this).attr("transparent") == '1'){
					add.css("background-color","transparent");
					add.attr("transparent","1");
				}else{
					add.attr("transparent","0");
					add.css("background-color",$(this).attr("bgcolor"));
				}
				//var interval = timerTasks['#'+$(this).attr("id")];
				//if(interval){
				//	clearInterval(interval);  
				//}
				
				//只有撤销、重做、再次编辑需要重构，撤销和重做已经清掉timerTasks，再次编辑没有timerTasks，所以单个倒计时元素不需要再次清理定时器
				//var interval = $(this).attr("interval");
				//if(interval){
				//	clearInterval(interval);  
				//}
	            //初始化元素内容	          
	            $(add).append($(this).find(".countdown-box").clone());   
			}else if(from == "webpage_edit"){
				var add = $("<div id='webpage_"+total+"' "+curanimclass+animduration+" "+showwidth+showheight+" class='element active webpage' title='' from='webpage_edit' style='top:0px;left:0px;display:block;width:200px;height:200px;position: absolute;z-index:"+total+";' ></div>");
				copyinit(add,$(this));   
			}else if(from == "materialApk_edit"){
				var add = $(this).clone();
				add.find(".ui-resizable-handle").remove();
				add.attr("id","materialApk_"+total);
			}else if(from == "streamMedia_edit"){
				var add = $(this).clone();
				add.find(".ui-resizable-handle").remove();
				add.attr("id","streamMedia_"+total);
			}else if(from == "mixed_edit"){
				var add = $("<div id='mixed_"+total+"' "+curanimclass+animduration+" "+showwidth+showheight+" class='element active mixed' title='' from='mixed_edit' style='top:0px;left:0px;display:block;width:200px;height:200px;position: absolute;z-index:"+total+";' ></div>");
				copyinit(add,$(this));   
			}
					
			 //初始化基本样式
			 $(add).css("width",$(this).css("width"));		
			 $(add).css("height",$(this).css("height"));
			 $(add).css("left",$(this).css("left"));		
			 $(add).css("top",$(this).css("top"));
			 $(add).css("z-index",$(this).css("z-index"));
			 //跳转场景
			 var skipscene = $(this).attr("skipscene");
			 var skipsceneindex = $(this).attr("skipsceneindex");
			 if(skipscene){
				 $(add).attr("skipscene",skipscene).attr("skipsceneindex",skipsceneindex);
			 }
			 //跳转链接
			 var skiphyperlink = $(this).attr("skiphyperlink");
			 if(skiphyperlink){
				 $(add).attr("skiphyperlink",skiphyperlink);
			 }
			 
			 if(from == "weather_edit"){
				 //初始化元素拖拽和放大缩小(放大缩小影响font-size)	  
				 draginitfn($(add));
				 resizeinitfontfn($(add));
			 }else{
				 //初始化元素拖拽和放大缩小	  
				 draginitfn($(add));
				 resizeinitfn($(add));
			 }
			 
			 //往场景中添加元素
			 newScene.append(add);
			 if(from == "countdown_edit"){
				 //注释掉节目制作过程中不动
				 //var newInterval = setInterval(function(){setcountdown("#countdown_"+total)},1000);
				 //$(add).attr("interval",newInterval);
				 //timerTasks["#countdown_"+total] = newInterval;
			 }else if(from == "date_edit"){
				 //window.baidu_time(new Date().getTime(),$("#date_"+total));
				 var timezone = parseInt($(this).attr("val"));
				 if(!timezone){
					 timezone = 8;
				 }
				 window.baidu_time(getTimeString(new Date(), timezone).getTime(),$("#date_"+total));
			 }else if(from == "text_edit"){
				 //$(add).append("<div id='textarea_fonts_"+total+"' class='' style='width:100%;height:100%'></div>");
				 //$("#textarea_fonts_"+total).html($(this).find(".ql-editor").html());
				 var ql = $(this).find(".ql-editor").clone();
				 ql.attr("id","textarea_fonts_"+total);
				 $(add).append(ql);
				 initTxtEditor();
			 }else if(from == "map_edit"){
				 mapInfo(add,false,true);
			 }else if(from == "exchange_edit"){
				 getExchange(add,false,true);
			 }else if(from == "exchange_edit"){
				 getStock(add,false,true);
			 }
		});
		//自动触发场景切换
		newbackg_tpl_item.removeClass("active");
		newbackg_tpl_item.click();	
		//缩略图
		sceneThumbnail("NOT_SAVE_HIS");
		//计算场景时长
	    sceneLong(curScene);
	}
	
	//重构编辑器
	function reeditor(htmlxArr,key){
		//var htmlxArr = [];
		if(!htmlxArr){
			htmlxArr = [];
			//获取场景内容
			$("[id^='topfd']").each(function(){
				htmlxArr.push($(this).prop("outerHTML"));
			});
		}

		//删除所有场景和缩略图
		$("[id^='topfd']").remove();
		$(".backg_tpl").html("");
		//重构场景
		for(var i=0;i<htmlxArr.length;i++){
			//console.log(htmlxArr[i]);
			resence(htmlxArr[i]);
		}
		//设置第一个场景为当前场景,理论上肯定有场景,所以不作判断
		//if($(".backg_tpl_item").length>0){
			//alert($(".backg_tpl_item")[0]);
		if(key != "notBackOne"){
			$(".backg_tpl_item")[0].click();	
		}
		//}
		
		//更新序号和场景数	
		computingSceneSequence("reeditor");
	}
	
	//预览时生成跳转链接代码
	function skiphs(skiphyperlink,skipscene){
		var skiptext = null; 
		if(skiphyperlink){
			skiptext = " onclick='location.href=\""+skiphyperlink+";\" ' ";
		}else if(skipscene){
			skiptext = " onclick='skipscene(\""+skipscene+"\"); ' ";
		}else{
			skiptext = "";
		}
		return skiptext;
	}
	
	//过滤出预览的场景内容
	function scenePreview(obj){
		 console.log("预览");
		 var topdiv = obj;
		 var sceneid = topdiv.attr('id');
		 var stylecontent="";
		 var seecontent="";
		 var content="";
		 
		 //场景动作
		 var sceneanimdelaystyle = "";
		 var sceneanimduration = 0;
		 var sceneanimClass = topdiv.attr("cursceneanimclass");
		 if(sceneanimClass == undefined || sceneanimClass == null){
			 sceneanimClass = "";
		 }else{
			 sceneanimClass += " animated ";
			 var sad = topdiv.attr("sceneanimduration");
			 if(sad != null && sad != undefined){
				 sceneanimduration = parseInt(sad);
				 stylecontent += "#"+sceneid+"{animation-duration:"+sceneanimduration+"s;-webkit-animation-duration:"+sceneanimduration+"s;} ";
			 }
	    	 //如果有场景动作，元素动作就延迟发生
	    	 if(sceneanimduration > 0){
	    		 sceneanimdelaystyle = "animation-delay:"+sceneanimduration+"s;-webkit-animation-delay:"+sceneanimduration+"s;";
	    	 }
		 }
	     
		 seecontent+="<div id='"+sceneid+"' class='content-center-topfd "+sceneanimClass+"' style='border:1px solid #000;overflow: hidden; position: absolute;left:0px;top:0px;background-image:"+topdiv.css('background-image')+";background-color:"+topdiv.css('background-color')+"; background-size: 100% 100%; background-repeat: no-repeat;width:"+topdiv.css('width')+";height:"+topdiv.css('height')+"'>";
		 var div;
	     var left;
	     var top;
	     var width;
	     var height;
	     var key;
	     //office预览
	     var offices = topdiv.find(".office");
	     offices.each(function(){
	    	 $(this).addClass($(this).attr("officetype"));
	     });
	     
	     //图片预览
	     var imgs=topdiv.find(".image");
	     var doimg=false;
	     var tttt;
	     var tadf;
	     var curimglist;
	     var delay;
	     imgs.each(function(){
	    	  div=$(this);
		      left=div.css("left");
		      top=div.css("top");
		      width=div.css("width");
		      height=div.css("height");
		      var zIndex = div.css("z-index");
			
			  curimglist = div.attr("curimglist");
			  delay = div.attr("delay");
			  if(curimglist != ""){
				  var curimglistObj = JSON.parse(curimglist);
				  console.log(curimglistObj);	
				  var title = [];
				  if(delay != undefined){
					  title.push(delay);
				  }else{
					  title.push("3");
				  }
				  for(v  in curimglistObj){
					  title.push(curimglistObj[v].src);
				  }
				  console.log(title);
				  //元素动作
			      var animClass = div.attr("curanimclass");
			      if(animClass == undefined || animClass == null || animClass == '' || animClass == 'undefined'){
			    	  animClass = "";
			      }else{
			    	  animClass += " animated ";
			    	  var animduration = div.attr("animduration");
			    	  stylecontent += ".imgx"+sceneid+zIndex+"{animation-duration:"+animduration+"s;-webkit-animation-duration:"+animduration+"s;"+sceneanimdelaystyle+"} ";
			      }
				  if(curimglistObj.length == 1){
					  console.log("静态图");
					  seecontent+="<img class='newimage "+animClass+" imgx"+sceneid+zIndex+"' "+skiphs(topdiv.attr("skiphyperlink"),topdiv.attr("skipscene"))+" style='z-index:"+zIndex+";position: absolute;left:"+left+";top:"+top+";width:"+width+";height:"+height+"' src='"+curimglistObj[0].src+"'/>"; 
				  }else{
					  console.log("动态轮播图");
					  if(!doimg){						 
						 doimg=true;
						 //根据切换时间参数来设置轮播时间
						/* var duration = delay*1000;*/
						 seecontent+="<script>" +
						 		"var cur=0;" +
						 		"var dorun=false;" +
						 		"var imgs;" +
						 		"var iframes;" +
						 		"var iframe;" +
						 		"var img;" +
						 		"var spis;" +
						 		"setInterval(\"startShow()\",1000);" +
						 		"function startShow() { " +
						 			"if(cur>36000){" +
						 				"cur=0;" +
						 			"}" +
						 			"cur++;" +
						 			"if(!dorun){" +
						 				"dorun=true;" +
						 				"imgs=$(\".newimage\");" +
						 				"iframes=document.getElementsByTagName(\"iframe\");" +
						 			"}" +
						 		   "imgs.each(function(){" +
						 		   		"img=$(this);" +
							 		   	"if(img.attr(\'title\') != undefined){" +
							 		   		"if(img.attr(\'title\').length>0){" +
							 		   			"spis=img.attr(\'title\').split(\',\');" +
							 		   			"if(cur%spis[0]==0){" +
							 		   				"var idc =img.attr(\'id\');idc++;img.attr(\'id\',idc);" +
							 		   				"if(img.attr(\'id\') >= spis.length){" +
							 		   					"img.attr(\'id\',1);" +
							 		   				"}" +
							 		   				"img.attr(\'src\',spis[img.attr(\'id\')]);" +
							 		   			"}" +
							 		   		"}" +
							 		   	"}" +
						 		   "});" +
						 		   "for(var i = 0;i<iframes.length;i++){" +
						 		   		"iframe=iframes[i];" +
						 		   		"if(iframe.title.length>0){" +
					 		   				"if(cur%iframe.title==0){" +
						 		   				"iframe.src=iframe.src;" +
						 		   			"}" +
						 		   		"}" +
						 		   "}" +
						 	"}" +
						 "<\/script>";
					   }
					   seecontent+="<img id='1' class='newimage "+animClass+" imgx"+sceneid+zIndex+"' "+skiphs(topdiv.attr("skiphyperlink"),topdiv.attr("skipscene"))+" style='z-index:"+zIndex+";position: absolute;left:"+left+";top:"+top+";width:"+width+";height:"+height+"' title='"+title.join(",")+"' src='"+curimglistObj[0].src+"'/>"; 
					}
			  }
	     });	
	     
	     
	     //文本预览
	     var txts=topdiv.find(".font");
	     txts.each(function(){
		  div=$(this);
	      left=div.css("left");
	      top=div.css("top");
	      width=div.css("width");
	      height=div.css("height");
	      var zIndex = div.css("z-index");
	      var color = div.css("color");
	      var textalign = div.css("text-align");
	      var fontsize = div.css("font-size");
	      var fontweight = div.css("font-weight");
	      var textdecoration = div.css("text-decoration");
	      var fontstyle = div.css("font-style");
	      var backgroundcolor = div.css("back-groundcolor");
	      var txtanimtype = div.attr("txtanimtype");
	      var content = div.find("textarea").val();	
		  //元素动作
	      var animClass = div.attr("curanimclass");
	      if(animClass == undefined || animClass == null){
	    	  animClass = "";
	      }else{
	    	  animClass += " animated ";
	    	  var animduration = div.attr("animduration");
	    	  stylecontent += "#fonts"+sceneid+zIndex+"{animation-duration:"+animduration+"s;-webkit-animation-duration:"+animduration+"s;"+sceneanimdelaystyle+"} ";
	      }
	    /*  if(txtanimtype == "none"){*/
	    	  seecontent += "<div id='fonts"+sceneid+zIndex+"' class='"+animClass+"' "+skiphs(topdiv.attr("skiphyperlink"),topdiv.attr("skipscene"))+" style='overflow:hidden;width: "+width+"; height:"+height+"; position: absolute; top: "+top+"; left: "+left+"; z-index:"+zIndex+";color: "+color+"; text-align: "+textalign+"; font-size: "+fontsize+"; font-weight: "+fontweight+"; text-decoration: "+textdecoration+"; font-style: "+fontstyle+"; background-color: "+backgroundcolor+";' txtanimtype='"+txtanimtype+"'>";
			  seecontent += content;		 
			  seecontent += "</div>";
	    /*  }else{	    	  
	    	  seecontent += "<marquee scrollAmount=2  direction="+txtanimtype+" style='width: "+width+"; height:"+height+"; position: absolute; top: "+top+"; left: "+left+"; z-index:"+zIndex+";color: "+color+"; text-align: "+textalign+"; font-size: "+fontsize+"; font-weight: "+fontweight+"; text-decoration: "+textdecoration+"; font-style: "+fontstyle+"; background-color: "+backgroundcolor+";' txtanimtype='"+txtanimtype+"'>";
			  seecontent += content;		
			  seecontent += "</marquee>";
	      }*/
		  if(txtanimtype != "none"){
			  seecontent +='<script>$("#fonts'+sceneid+zIndex+'").marquee({direction: "'+txtanimtype+'",}); </script>';
		  }
		
	   });  
	    //视频预览 
	    var videos=topdiv.find(".video");
	    videos.each(function(){
	    	if($(this).attr("curimglist") != ""){
	    		div=$(this);
		    	left=div.css("left");
	      	    top=div.css("top");
	      	    width=div.css("width");
	      	    height=div.css("height");
				
	      	    var zIndex = div.css("z-index");
	      	    //元素动作
				var animClass = div.attr("curanimclass");
				if(animClass == undefined || animClass == null){
				  animClass = "";
				}else{
				  animClass += " animated ";
		    	  var animduration = div.attr("animduration");
		    	  stylecontent += "#player"+sceneid+$(this).index()+"{animation-duration:"+animduration+"s;-webkit-animation-duration:"+animduration+"s;"+sceneanimdelaystyle+"} ";
				}
	      	    
	      	    var curimglist = JSON.parse(div.attr("curimglist"));
	      	    var playlistArr = [];
	      	    for(v in curimglist){
	      	    	console.log();
	      	    	playlistArr.push(curimglist[v].source);	      	  
	      	    }	      	    
	      	    console.log(playlistArr);
	      	    var playlistStr = playlistArr.join(',');
	      	    console.log(playlistStr);
				seecontent+="<a href='"+$curImgList[0].source+"' playlistStr='"+playlistStr+"' class='player "+animClass+"' id='player"+sceneid+$(this).index()+"' style='position: absolute;z-index:"+zIndex+";left:"+left+";top:"+top+";width:"+width+";height:"+height+"'></a>";
	  	    
	    	}
	    	
		
	    })
		 //音频预览    
	      var musics=topdiv.find(".music");
	      musics.each(function(){
	    	if($(this).attr("curimglist") != ""){
	    		div=$(this);
		    	left=div.css("left");
	      	    top=div.css("top");
	      	    width=div.css("width");
	      	    height=div.css("height");
	      	    
	      	    var curimglist = JSON.parse(div.attr("curimglist"));
	      	    var playlistArr = [];
	      	    for(v in curimglist){
	      	    	console.log("");
	      	    	playlistArr.push(curimglist[v].source);	
	      	    	var index = parseInt(v)+1;
					//元素动作
					var animClass = div.attr("curanimclass");
					if(animClass == undefined || animClass == null){
					  animClass = "";
					}else{
					  animClass += " animated ";
			    	  var animduration = div.attr("animduration");
			    	  stylecontent += "#amazingaudioplayer-"+sceneid+index+"{animation-duration:"+animduration+"s;-webkit-animation-duration:"+animduration+"s;"+sceneanimdelaystyle+"} ";
					}
	      	    	seecontent+='<div id="amazingaudioplayer-'+sceneid+index+'" style="display:block;position:absolute;width:300px;height:auto;margin:0px auto 0px;visibility:hidden" class="amazingaudioplayer '+animClass+'">'+
				       ' <ul class="amazingaudioplayer-audios" style="display:none;">'+
				           ' <li data-artist="CNBLUE" data-title="'+curimglist[v].name+'" data-album="'+curimglist[v].name+'" data-info="" data-image="" data-duration="238">'+
				             '<div class="amazingaudioplayer-source" data-src="'+curimglist[v].source+'" data-type="audio/mpeg" /> '+
				         '</li>'+
				       '</ul>'+
				   ' </div>';
	      	    	
	      	     }
	    	}
		
	    });
	      
	    //ppt预览    
	      var ppts=topdiv.find(".ppt");
	      ppts.each(function(){
	    	if($(this).attr("curimglist") != ""){
	    		div=$(this);
		    	left=div.css("left");
	      	    top=div.css("top");
	      	    width=div.css("width");
	      	    height=div.css("height");
	      	    var zIndex =div.css("z-index");
	      	    var curimglist = div.attr("curimglist");	      	    
	      	    var curimglistObj = JSON.parse(curimglist);
	      	    var delay = div.attr("delay");
	      	    var title = [];
			    if(delay != undefined){
				  title.push(delay);
			    }else{
				  title.push("3");
			    }
				//元素动作
				var animClass = div.attr("curanimclass");
				if(animClass == undefined || animClass == null){
				  animClass = "";
				}else{
				  animClass += " animated ";
		    	  var animduration = div.attr("animduration");
		    	  stylecontent += "#pptx"+sceneid+zIndex+"{animation-duration:"+animduration+"s;-webkit-animation-duration:"+animduration+"s;"+sceneanimdelaystyle+"} ";
				}
			    for(v in curimglistObj){
			    	 var imglist = curimglistObj[v].imglist.substr(1,curimglistObj[v].imglist.length-2);
					 title.push(imglist);
			    }
	      	    seecontent += "<img id='pptx"+sceneid+zIndex+"' "+skiphs(topdiv.attr("skiphyperlink"),topdiv.attr("skipscene"))+" class='newimage "+animClass+"' style='z-index:"+zIndex+";position: absolute;left:"+left+";top:"+top+";width:"+width+";height:"+height+"' title='"+title.join(",")+"' src='"+curimglistObj[0].src+"'/>"; 
		    }
	    });
	      
	    //天气预览    
	      var weathers=topdiv.find(".weather");
	      weathers.each(function(){	  
    		div=$(this);
	    	left=div.css("left");
      	    top=div.css("top");
      	    width=div.css("width");
      	    height=div.css("height");
      	    var zIndex =div.css("z-index");
			//元素动作
			var animClass = div.attr("curanimclass");
			if(animClass == undefined || animClass == null){
			  animClass = "";
			}else{
			  animClass += " animated ";
	    	  var animduration = div.attr("animduration");
	    	  stylecontent += "#weatherx"+sceneid+zIndex+"{animation-duration:"+animduration+"s;-webkit-animation-duration:"+animduration+"s;"+sceneanimdelaystyle+"} ";
			}
      	   seecontent+='<div id="weatherx'+sceneid+zIndex+'" class="'+animClass+'" scrolling="no" height="100%" frameborder="0" allowtransparency="true" style="left:'+left+';top:'+top+';z-index:'+zIndex+';position:absolute;width:'+width+'; height:'+height+';">'+div.find(".tqtable").prop("outerHTML")+'</div>';
         });
	    
	      	      
	      //日期预览    
	      var dates=topdiv.find(".date");
	      dates.each(function(){	  
    		div=$(this);
	    	left=div.css("left");
      	    top=div.css("top");
      	    width=div.css("width");
      	    height=div.css("height");
	      	var zIndex =div.css("z-index");	
	      	var fontSize =div.css("font-size");
	      	var fontSize55 = (parseInt(fontSize.replace(/px/,""))+42)+"px";
	      	var fontSize30 = (parseInt(fontSize.replace(/px/,""))+17)+"px";
	    	var fontSize20 = (parseInt(fontSize.replace(/px/,""))+7)+"px";
	    	var color = div.css("color");
	    	console.log(color);
	      	var bold =div.css("font-weight");    
	      	var italic = div.css("font-style"); 
	      	var underline = div.css("text-decoration");
	      	var timezone = div.attr("timezone");
			//元素动作
			var animClass = div.attr("curanimclass");
			if(animClass == undefined || animClass == null){
			  animClass = "";
			}else{
			  animClass += " animated ";
	    	  var animduration = div.attr("animduration");
	    	  stylecontent += "#date"+sceneid+zIndex+"{animation-duration:"+animduration+"s;-webkit-animation-duration:"+animduration+"s;"+sceneanimdelaystyle+"} ";
			}
	      	//seecontent+="<div id='date"+sceneid+zIndex+"' class='date element "+animClass+"' title='' timezone=8 datestyle=1 style='left:"+left+";top:"+top+";z-index:"+zIndex+";position:absolute;width:"+width+"; height:"+height+";font-size:"+fontSize+";color:"+color+";font-weight:"+bold+";font-style:"+italic+";text-decoration:"+underline+";'><div class='op-beijingtime-box c-clearfix'> <p class='op-beijingtime-time op-time' id=''></p><p class='op-beijingtime-datebox op-date' id=''> </p></div></div>";
			seecontent+="<div id='date"+sceneid+zIndex+"' class='date element "+animClass+"' title='' timezone=8 datestyle=1 style='left:"+left+";top:"+top+";z-index:"+zIndex+";position:absolute;width:"+width+"; height:"+height+";font-size:"+fontSize+";color:"+color+";font-weight:"+bold+";font-style:"+italic+";text-decoration:"+underline+";'>"+div.find(".op-beijingtime-box").html()  +"</div>";
	      	seecontent+='<script>getTime('+timezone+',$("#date'+sceneid+zIndex+'"));$("#date'+sceneid+zIndex+'").find(".op-beijingtime-box").css("color","'+color+'");	$("#date'+sceneid+zIndex+'").find(".op-beijingtime-time").css("font-size","'+fontSize55+'"); 	$("#date'+sceneid+zIndex+'").find(".op-beijingtime-small").css("font-size","'+fontSize30+'");	$("#date'+sceneid+zIndex+'").find(".op-beijingtime-week").css("font-size","'+fontSize20+'");</script>';
	      }); 
	      //word预览    
	      var words=topdiv.find(".word");
	      words.each(function(){	  
	    	if($(this).attr("curimglist") != ""){
	    		div=$(this);
		    	left=div.css("left");
	      	    top=div.css("top");
	      	    width=div.css("width");
	      	    height=div.css("height");
		      	var zIndex =div.css("z-index");	
		      	var curimglist = div.attr("curimglist");	      	    
	      	    var curimglistObj = JSON.parse(curimglist);
	      	    var delay = div.attr("delay")?div.attr("delay"):20;
				//元素动作
				var animClass = div.attr("curanimclass");
				if(animClass == undefined || animClass == null){
				  animClass = "";
				}else{
				  animClass += " animated ";
		    	  var animduration = div.attr("animduration");
		    	  stylecontent += "#word"+sceneid+zIndex+"{animation-duration:"+animduration+"s;-webkit-animation-duration:"+animduration+"s;"+sceneanimdelaystyle+"} ";
				}
		      	seecontent+="<div id='word"+sceneid+zIndex+"' class='word "+animClass+"' "+skiphs(topdiv.attr("skiphyperlink"),topdiv.attr("skipscene"))+" style='left:"+left+";top:"+top+";z-index:"+zIndex+";position:absolute;width:"+width+"; height:"+height+";'><div style='margin-right:-17px;'>";
		      	
			    for(v in curimglistObj){
			    	 var iframelist = curimglistObj[v].htmlurl;
			    	 seecontent+='<iframe id="word'+sceneid+zIndex+'-ifr'+v+'" src="'+iframelist+'" frameborder="0" width="100%" style=""></iframe>';
			    }
		      	seecontent+='</div></div>';
		      	
		      	seecontent+=' <script> $(function(){'+
		        	'var i = 0;'+
		        	'var ifr = document.getElementById("word'+sceneid+zIndex+'-ifr"+i);'+
		        	' ifr.onload = function(){'+
		        	'	var iDoc = ifr.contentDocument || ifr.document;'+
		        	' var height = calcPageHeight(iDoc);'+
		        	'ifr.style.height = height + "px";'+
		        	'testifr(i);'+
		        	' }; '+
			  
		        	' function testifr(i){'+
		        	'console.log(i);	i++;'+
		        	'  if(i < '+curimglistObj.length+'){'+
		        	'console.log("多个");console.log(i);var ifr = document.getElementById("word'+sceneid+zIndex+'-ifr"+i);'+
		        	'ifr.onload = function(){'+
		        	'var iDoc = ifr.contentDocument || ifr.document;'+
		        	'   var height = calcPageHeight(iDoc);'+
		        	'   ifr.style.height = height + "px"; 	'+	                	
		        	' testifr(i);'+
		        	' };'+
		        	'}else{'+
		        	'  console.log("index-------"+i);console.log("要初始化了");$("#word'+sceneid+zIndex+'").kxbdSuperMarquee({'+
		        	' isMarquee:true,'+
		        	' isEqual:false,'+
		        	' scrollDelay:'+delay+',	'+	
		        	' direction:"up"'+
		        	'  }); '+
		        	' }'+
		        	'   }'+
		        	' });</script> ';
	    	}
	      }); 
	      
	      //excel预览    
	      var excels=topdiv.find(".excel");
	      excels.each(function(){	  
	    	if($(this).attr("curimglist") != ""){
	    		div=$(this);
		    	left=div.css("left");
	      	    top=div.css("top");
	      	    width=div.css("width");
	      	    height=div.css("height");
		      	var zIndex =div.css("z-index");	
		      	var curimglist = div.attr("curimglist");	      	    
	      	    var curimglistObj = JSON.parse(curimglist);
	      	    var delay = div.attr("delay")?div.attr("delay"):20;
				//元素动作
				var animClass = div.attr("curanimclass");
				if(animClass == undefined || animClass == null){
				  animClass = "";
				}else{
				  animClass += " animated ";
		    	  var animduration = div.attr("animduration");
		    	  stylecontent += "#excel"+sceneid+zIndex+"{animation-duration:"+animduration+"s;-webkit-animation-duration:"+animduration+"s;"+sceneanimdelaystyle+"} ";
				}
		      	seecontent+="<div id='excel"+sceneid+zIndex+"' class='excel "+animClass+"' "+skiphs(topdiv.attr("skiphyperlink"),topdiv.attr("skipscene"))+" style='left:"+left+";top:"+top+";z-index:"+zIndex+";position:absolute;width:"+width+"; height:"+height+";'><div>";
		      	
			    for(v in curimglistObj){
			    	 var iframelist = curimglistObj[v].htmlurl;
			    	 seecontent+='<iframe id="excel'+sceneid+zIndex+'-ifr'+v+'" src="'+iframelist+'" frameborder="0" width="100%" style=""></iframe>';
			    }
		      	seecontent+='</div></div>';
		      	
		      	seecontent+=' <script> $(function(){'+
		        	'var i = 0;'+
		        	'var ifr = document.getElementById("excel'+sceneid+zIndex+'-ifr"+i);'+
		        	' ifr.onload = function(){'+
		        	'	var iDoc = ifr.contentDocument || ifr.document;'+
		        	' var height = calcPageHeight(iDoc);'+
		        	'ifr.style.height = height + "px";'+
		        	'testifr(i);'+
		        	' }; '+
			  
		        	' function testifr(i){'+
		        	'console.log(i);	i++;'+
		        	'  if(i < '+curimglistObj.length+'){'+
		        	'console.log("多个");console.log(i);var ifr = document.getElementById("excel'+sceneid+zIndex+'-ifr"+i);'+
		        	'ifr.onload = function(){'+
		        	'var iDoc = ifr.contentDocument || ifr.document;'+
		        	'   var height = calcPageHeight(iDoc);'+
		        	'   ifr.style.height = height + "px"; 	'+	                	
		        	' testifr(i);'+
		        	' };'+
		        	'}else{'+
		        	'  console.log("index-------"+i);console.log("要初始化了");$("#excel'+sceneid+zIndex+'").kxbdSuperMarquee({'+
		        	' isMarquee:true,'+
		        	' isEqual:false,'+
		        	' scrollDelay:'+delay+',	'+	
		        	' direction:"up"'+
		        	'  }); '+
		        	' }'+
		        	'   }'+
		        	' });</script> ';
	    	}
	      });
	      //如果设置CSS样式内容，增加头尾style标签信息
	      if(stylecontent.length>1){
	    	  stylecontent = "<style type='text/css'>"+stylecontent+"</style>";
	      }
	   return stylecontent+seecontent+"</div>";
	}
	//点击预览
/*	$(".menu-preview").live("click",function(){
		alert("333");
		createPreviewContent();
	    $("#previewForm").submit();
	});*/
	
	//点击产生预览内容
/*	$(".createPreviewContent").live("click",function(){
		alert("444");
		createPreviewContent();
	});*/
	
	//产生预览内容
/*	function createPreviewContent(){
		var sceneArr = "";
		var domx = "";
		var slong = 0;
		
		var html = scenePreview(curScene);
		var long = parseInt(curScene.attr("long"));
		//如果场景时间转换异常或者设置为0s，则自动改为10s
		if (isNaN(long) || long == 0){
			long = 10;
		}
		slong += long;
		sceneArr += long;
		//当前场景ID
		var curSceneId = curScene.attr("id");
		//判断是否有需要切换的场景
		var topfds = $("[id^='topfd']");
		if(topfds.length > 1){
			for(var i=topfds.length-1;i>=0;i--){
				var topfde = $(topfds[i]);
				if(topfde.attr("id") == curSceneId){
					break;
				}
				var qhtml = scenePreview(topfde);
				//如果场景时间转换异常或者设置为0s，则自动改为10s
				var qlong = parseInt(topfde.attr("long"));
				if (isNaN(qlong) || qlong == 0){
					qlong = 10;
				}
				slong += qlong;
				//domArr.unshift(qhtml);
				
				domx += "<div class='topfdg'>"+qhtml+"</div>";
				sceneArr += ","+qlong;
				//sceneArr.unshift(qlong);
			}
		}
		
		$("#sceneArr").val(sceneArr);
	    $("#dom").val(html);
	    $("#domx").val(domx);
	    //$("#domp").html(html);
	    //$("#dompx").html(domx);
	    //$("#previewForm").submit();

	};*/
	
	//保存节目(参数是提交保存后是否设置为节目保存标志为保存过)
	function savex(isSavedFlag){
		//返回顶部
		$(".content-main-edit").scrollTop(0);
		//保存节目前先切换到首场景,不然节目截不了图
		$(".backg_tpl .backg_tpl_item:first").click();
		var domx = "";
		var slong = 0;
		var longjson = {};
		//获取场景内容
		var topfds = $("[id^='topfd']");
		if(topfds.length > 0){
			for(var i=0;i<topfds.length;i++){
				var topfde = $(topfds[i]);
				//如果场景时间转换异常或者设置为0s，则自动改为10s
				var qlong = parseInt(topfde.attr("long"));
				if (isNaN(qlong) || qlong == 0){
					qlong = 10;
				}
				slong += qlong;
				eval("longjson."+topfde.attr("id")+"="+qlong);
				domx += topfde.prop("outerHTML");
			}
		}
		eval("longjson.slong="+slong);
		$("#playTime").val(slong);
		
	    $("#editHtml").val("<div>"+domx+"</div>");
	    //不能截图的控件隐藏掉,用图片代替
	    var mapdivs = $(".element.map").find(".mapdiv");
	    mapdivs.hide().before("<div class='mapdiv-t' style='height:100%;'><img src='/apm-web/static/images/program/map.png' style='width:100%;height:100%;'></div>");
	    
	    //缩小画面，准备截图（本来打算加个遮罩，不过发现肉眼看不到缩小的过程，所以暂时不加）
        var width = parseInt($(topfds[0]).css("width"));
        var height = parseInt($(topfds[0]).css("height"));
        var transform = $(topfds[0]).css("transform");
        var wscale = 200/width;
        var hscale = 200/height;
		var left = -((width-200)/2);
		var top = -((height-200)/2);
        $(topfds[0]).css("transform","scale("+wscale+","+hscale+")").css("left",left+"px").css("top",top+"px");
        
        //截图
        html5screenshot(topfds[0],function(dataUrl){
            //去掉数据头部的格式声明（格式声明后面的数据base64解码后以二进制写入文件即可）
            $("#litimg").val(dataUrl.substring(22, dataUrl.length));
            //设置提交成功是否修改保存标志
            if(isSavedFlag){
            	submitSavedFlag = true;
            }else{
            	submitSavedFlag = false;
            }
            //提交表单
            $("#saveProgram").submit(); 
        });
		 //截图结束，还原画布
		 var tp = $(topfds[0]).css("transform",transform).get(0);
		 tp.style.top="";
		 tp.style.left="";
		 //还原隐藏的内容
		 mapdivs.show().siblings(".mapdiv-t").remove();

	}
	
	function dataURLtoBlob(dataurl) {
	    var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
	        bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
	    while(n--){
	        u8arr[n] = bstr.charCodeAt(n);
	    }
	    return new Blob([u8arr], {type:mime});
	}
	
/*	function saveas(){
		var sceneArr = "";
		var domx = "";
		var slong = 0;
		var html = scenePreview(curScene);
		var long = parseInt(curScene.attr("long"));
		//如果场景时间转换异常或者设置为0s，则自动改为10s
		if (isNaN(long) || long == 0){
			long = 10;
		}
		slong += long;
		sceneArr += long;
		//当前场景ID
		var curSceneId = curScene.attr("id");
		//判断是否有需要切换的场景
		var topfds = $("[id^='topfd']");
		if(topfds.length > 1){
			for(var i=topfds.length-1;i>=0;i--){
				var topfde = $(topfds[i]);
				if(topfde.attr("id") == curSceneId){
					break;
				}
				var qhtml = scenePreview(topfde);
				//如果场景时间转换异常或者设置为0s，则自动改为10s
				var qlong = parseInt(topfde.attr("long"));
				if (isNaN(qlong) || qlong == 0){
					qlong = 10;
				}
				slong += qlong;
				domx += "<div class='topfdg'>"+qhtml+"</div>";
				sceneArr += ","+qlong;
				//sceneArr.unshift(qlong);
			}
		}
		$("#ssceneArr").val(sceneArr);

	    $("#sdom").val(html);
	    $("#sdomx").val(domx);
	    $("#saveAsProgram").submit();
	}*/
	
	//组装元素的函数
	function epush(jsonobj,typeobj){
		for(v in jsonobj){			
			typeobj.push(jsonobj[v].attrid);
		}
	}
	function uni(arrobj){		
		arrobj.filter(function(v,i) { return arrobj.indexOf(v) == i; });
	}
	
	//保存节目
	var savexFlag = false;
	$("#menu-savex").on("click",function(){
		if(!savexFlag){
			savexFlag = true;
			if($("#newProgram-name").length > 0){
				$("#newProgram-name").blur();
			}
			if($(".hint-red").length == 0){
		        loading($.i18n.prop("progForm.savingPleaseWait"));
				$("#isModel").val("0");
				$("#labels").val(null);
				//扫描资源和功能
				scanningResources();
				sceneLong();
				computingSceneSequence();
				savex(true);
				
			}
			savexFlag = false;
		}
	});
	
	//保存模板
	var savexModelFlag = false;
	$("#menu-savex-model").on("click",function(){
		if(!savexModelFlag){
			savexModelFlag = true;
			if($("#newProgram-name").length > 0){
				$("#newProgram-name").blur();
			}
			if($(".hint-red").length == 0){
				$("#isModel").val("1");
				var labels = "";
				$(".newProgramDiv .selLabel[val!='-']").each(function(){
					labels += $(this).attr("val")+",";
				});
				if(labels.length > 0){
					$("#labels").val(labels);
				}else{
					$("#labels").val(null);
				}
				//扫描资源和功能
				scanningResources();
				sceneLong();
				computingSceneSequence();
				savex();
				
			}
			savexModelFlag = false;
		}
	});
	
	
	/**
	 * 场景分辨率转化(再次编辑功能使用)(公用)
	 * topfd 场景JQ对象
	 * targetWidth 目标场景宽度
	 * targetHeight 目标场景高度
	 */
	function sceneResolutionConversion(obj,targetWidth,targetHeight){
		if(obj){
			//console.log("topfd:");
			//console.log(obj.prop("outerHTML"));
			//console.log("目标场景宽度:"+targetWidth);
			//console.log("目标场景高度:"+targetHeight);
			var objWidth = parseFloat(obj.css("width"));
			var objHeight = parseFloat(obj.css("height"));
			//console.log("当前场景宽度:"+objWidth);
			//console.log("当前场景高度:"+objHeight);
			var wScale = targetWidth/objWidth;
			var hScale = targetHeight/objHeight;
			//console.log("转换比例wScale:"+wScale);
			//console.log("转换比例hScale:"+hScale);
			//修改场景宽高
			obj.css("width",targetWidth+"px").css("height",targetHeight+"px");
			obj.attr("standardfsize",standardfsize).css("font-size",standardscalefsize+"px");
			obj.find(".element").each(function(){
				var from = $(this).attr("from");
				var top = parseFloat($(this).css("top"))*hScale;
				var left = parseFloat($(this).css("left"))*wScale;
				var elementwidth = parseFloat($(this).css("width"))*wScale;
				var elementheight = parseFloat($(this).css("height"))*hScale;
				//console.log("top:"+top);
				//console.log("left:"+left);
				//console.log("elementwidth:"+elementwidth);
				//console.log("elementheight:"+elementheight);
				if(left + elementwidth > targetWidth){
					elementwidth = targetWidth - left;
				}else if(top + elementheight > targetHeight){
					elementheight = targetHeight - top;
				}
				$(this).css("top",top+"px").css("left",left+"px").css("width",elementwidth+"px").css("height",elementheight+"px");
			
				//字号使用em的不用单独调整大小
				if(from != "date_edit" && from != "text_edit" && from != "countdown_edit"){
					var fontSize = $(this).css("font-size");
					if(fontSize){
						$(this).css("font-size",parseFloat(fontSize)*wScale);
					}
				}
			});
		}
		return obj;
	}

	
});

/**获取倒计时*/
function getRTime(endtime,deadline){
	if(!endtime){
		 endtime = new Date(deadline).getTime();//截止时间 格式 '2013-05-1 10:00'
	}
    var NowTime = new Date();
    var t = endtime - NowTime.getTime();
    
    if(t > 0){
        var d=Math.floor(t/1000/60/60/24);
        var h=Math.floor(t/1000/60/60%24);
        var m=Math.floor(t/1000/60%60);
        var s=Math.floor(t/1000%60);
        
        
/*        var str = "";
        if(d > 0){
        	str += d + $.i18n.prop("progForm.day")+" ";
        }else if(h > 0){
        	str += h + $.i18n.prop("progForm.hour");
        }else if(m > 0){
        	str += m + $.i18n.prop("progForm.minute");
        }else if(s > 0){
        	str += s + $.i18n.prop("progForm.second");
        }*/
        
        
        return d + $.i18n.prop("progForm.day")+ h + $.i18n.prop("progForm.hour") + m + $.i18n.prop("progForm.minute") + s + $.i18n.prop("progForm.second");
    }else{
    	return "0"+$.i18n.prop("progForm.day")+"0"+$.i18n.prop("progForm.hour")+"0"+$.i18n.prop("progForm.minute")+"0"+$.i18n.prop("progForm.second")+"";
    }
}


/**
 * 日期转字符串
 */
function dateStr(date,type){
	if(!date){
		date = new Date();
	}
	if(!type){
		type = "all";
	}
    var year = date.getFullYear();
    var month = (date.getMonth() + 1).toString();
    var day = date.getDate().toString();
    var hours = date.getHours().toString();
    var minutes = date.getMinutes().toString();
    var seconds = date.getSeconds().toString();
    if(month.length == 1) {
        month = "0" + month;
    }
    if (day.length == 1) {
        day = "0" + day;
    }
    if(type == "all"){
        if (hours.length == 1) {
        	hours = "0" + hours;
        }
        if (minutes.length == 1) {
        	minutes = "0" + minutes;
        }
        if (seconds.length == 1) {
        	seconds = "0" + seconds;
        }
        return year + "-" + month + "-" + day +" "+hours+":"+minutes+":"+seconds;
    }else if(type == "ymd"){
    	return year + month  + day ;
    }else{
    	return year + "-" + month + "-" + day;
    }
}

//获取月
function getDateMonth(date,isZeroize){
	if(!date){
		date = new Date();
	}
	var month = (date.getMonth() + 1).toString();
    if(isZeroize && month.length == 1) {
        month = "0" + month;
    }
    return month;
}


/**
 * 根据时区获取相应的时间
 * @author hutia
 * @param {Date} date 日期时间对象
 * @param {number} timezone 时区
 * @return {string} 返回时间字符串
 */
function getTimeString(date, timezone){
    var tz = date.getTimezoneOffset();
    var dt = new Date();
    dt.setTime(date.getTime() + tz*60000 + timezone*3600000);
   /* var month = dt.getMonth() + 1;
    return  dt.getFullYear() + "-" +  format(month) + "-" + format(dt.getDate()) + " " + format(dt.getHours()) + ':' + format(dt.getMinutes()) + ':' + format(dt.getSeconds());
    function format(n) {
        if (n < 10) return '0' + n;
        return ''+n;
    }*/
    return dt;
}

//获取选定后的时间
function getTime(obj){
	console.log($(obj).val());
	console.log(getTimeString(new Date(), $(obj).val()));	
	curelement.attr("timeType",$(obj).val()); 
	window.baidu_time(getTimeString(new Date(), $(obj).val()).getTime(),curelement);	
}

//创建遮罩层(公用)
function mask(){
	//遮罩
	console.log("创建遮罩层");
	var mask = $("<div></div>");
	mask.attr("id","contextmenu-mask").css("z-index","100000").css("background-color","#000000").css("opacity","0.5").css("-moz-opacity","0.5").css("filter","alpha(opacity=50)").css({position:"fixed",top:"0px",left:"0px",width:"100%",height:"100%"});
	return mask;
}

//跳转场景窗口(公用)
function skiphyperscenebox(){
	//初始化选中场景框-跳转场景状态
	var modal = $("#applyToModal");
	modal.attr("applytotype","skipscene").find(".modal-header .modal-title").html($.i18n.prop("progForm.selectJumpScene"));
	//初始化场景数据
	var apply_to = $(".backg_tpl .backg_tpl_item").clone();
	var curSceneid = curScene.attr("id");
	var curSceneIndex = $(".backg_tpl_item[to='"+curSceneid+"'] .tpl_item_index").html();
	var curSceneTier = curSceneIndex.split(".")[0];
	apply_to.each(function(){
		var sceneIndex = $(this).find(".tpl_item_index").html();
		console.log("sceneIndex:"+sceneIndex);
		var thisTier = sceneIndex.split(".")[0];
		//暂不考虑当前场景跳转情况
		//if($(this).attr("to") != curSceneid){
		//层级相同的场景才允许跳转
		if(curSceneTier === thisTier){
			$(this).show().addClass("backg_tpl_item_apply_to").removeClass("backg_tpl_item").removeClass("active").find(".tpl_item_index").prepend("<div class='apply-to-check'></div>");
		}else{
			$(this).hide();
		}
	});
	$("#applyToModal .scene-thumbnail").html("").append(apply_to);
	modal.modal('show');
}

//跳转链接输入框(公用)
function skiphyperlinkbox(){
	var skiphyperlinkinput = $("<div class='skiphyperlink'>" +
			"<div class='skiphyperlink-title'><div>"+$.i18n.prop("progForm.addLink")+"</div><div class='close-skip-div' onclick='$(\"#contextmenu-mask\").remove();$(\".skiphyperlink\").remove();'><img class='close-skip' onclick='' src='/apm-web/static/images/terminal/close.png' style='position: absolute; right: 20px; display: block; top: 13px; width: 15px; height: 15px;'></div></div>" +
			"<div class='skiphyperlink-input-div'>" +
				"<div class='skiphyperlink-input-head'>http://</div>"+
				"<input type='text' class='skiphyperlink-input'maxlength='500' />" +
				"<div class='btnx color-gray http-detection' for='skiphyperlink'>"+$.i18n.prop("resWebPage.detect")+"</div>"+
			"</div>" +
			"<div class='skiphyperlink-verify'>"+
				"<div class='btnu skiphyperlinkconfirm httpdetectionAutoAffirm' style='position: absolute;left:160px;top:15px;'>"+$.i18n.prop("userForm.confirm")+"</div>" +
				"<div class='btnu' style='position: absolute;left: 270px;top:15px;' onclick='$(\"#contextmenu-mask\").remove();$(\".skiphyperlink\").remove();'>"+$.i18n.prop("userList.cancel")+"</div>" +
			"</div>"+
			"</div>");
	//遮罩
	$("body").append(mask());
	$("body").append(skiphyperlinkinput);
}

//创建流媒体资源
function streamMediabox(){
	$(".material-modal").removeClass("cur-modal");
	$(".material-modal:visible").addClass("cur-modal").modal('hide');
	var streamMediabox = $("<div class='streamMediabox'>" +
			"<div class='streamMediabox-title'><div>"+$.i18n.prop("progForm.addLink")+"</div><div class='close-streamMediabox-div' onclick='$(\"#contextmenu-mask\").remove();$(\".streamMediabox\").remove();$(\".material-modal.cur-modal\").removeClass(\"cur-modal\").modal(\"show\");'><img class='close-skip' onclick='' src='/apm-web/static/images/terminal/close.png' style='position: absolute; right: 20px; display: block; top: 13px; width: 15px; height: 15px;'></div></div>" +
			"<div class='streamMediabox-input-div'>" +
				"<div class='streamMediabox-input-head streamMediabox-input-head-add'>"+$.i18n.prop("resWebPage.internetSite")+"</div>"+
				"<input type='text' class='streamMediabox-input'maxlength='500' />" +
				"<div class='btnx color-gray hide http-detection' for='streamMediabox'>"+$.i18n.prop("resWebPage.detect")+"</div>"+
			"</div>" +
			"<div class='streamMediabox-input-name-div streamMediabox-name'>" +
			"<div class='streamMediabox-input-head streamMediabox-input-head-add'>"+$.i18n.prop("resWebPage.pageName")+"</div>"+
			"<input type='text' class='streamMediabox-input-name' maxlength='500' />" +
			"</div>" +
			"<div class='streamMediabox-verify'>"+
				"<div class='btnu streamMediaboxconfirm httpdetectionAutoAffirm' style='position: absolute;left:160px;top:15px;'>"+$.i18n.prop("userForm.confirm")+"</div>" +
				"<div class='btnu' style='position: absolute;left: 270px;top:15px;' onclick='$(\"#contextmenu-mask\").remove();$(\".streamMediabox\").remove();$(\".material-modal.cur-modal\").removeClass(\"cur-modal\").modal(\"show\");'>"+$.i18n.prop("userList.cancel")+"</div>" +
			"</div>"+
			"</div>");
	//遮罩
	$("body").append(mask());
	$("body").append(streamMediabox);
}

//创建网页资源
function webpagebox(){
	$(".material-modal").removeClass("cur-modal");
	$(".material-modal:visible").addClass("cur-modal").modal('hide');
	var webpagebox = $("<div class='webpagebox'>" +
			"<div class='webpagebox-title'><div>"+$.i18n.prop("progForm.addLink")+"</div><div class='close-webpagebox-div' onclick='$(\"#contextmenu-mask\").remove();$(\".webpagebox\").remove();$(\".material-modal.cur-modal\").removeClass(\"cur-modal\").modal(\"show\");'><img class='close-skip' onclick='' src='/apm-web/static/images/terminal/close.png' style='position: absolute; right: 20px; display: block; top: 13px; width: 15px; height: 15px;'></div></div>" +
			"<div class='webpagebox-input-div'>" +
				"<div class='webpagebox-input-head webpagebox-input-head-add'>"+$.i18n.prop("resWebPage.internetSite")+"</div>"+
				"<input type='text' class='webpagebox-input'maxlength='500' />" +
				"<div class='btnx color-gray http-detection' for='webpagebox'>"+$.i18n.prop("resWebPage.detect")+"</div>"+
			"</div>" +
			"<div class='webpagebox-input-name-div webpagebox-name'>" +
			"<div class='webpagebox-input-head webpagebox-input-head-add'>"+$.i18n.prop("resWebPage.pageName")+"</div>"+
			"<input type='text' class='webpagebox-input-name' maxlength='500' />" +
			"</div>" +
			"<div class='webpagebox-verify'>"+
				"<div class='btnu webpageboxconfirm httpdetectionAutoAffirm' style='position: absolute;left:160px;top:15px;'>"+$.i18n.prop("userForm.confirm")+"</div>" +
				"<div class='btnu' style='position: absolute;left: 270px;top:15px;' onclick='$(\"#contextmenu-mask\").remove();$(\".webpagebox\").remove();$(\".material-modal.cur-modal\").removeClass(\"cur-modal\").modal(\"show\");'>"+$.i18n.prop("userList.cancel")+"</div>" +
			"</div>"+
			"</div>");
	//遮罩
	$("body").append(mask());
	$("body").append(webpagebox);
}

//显示设置(公用)
function displaysetupbox(){
	console.log("显示设置公用");
	var pshowWidth = programShowWidth;
	if(pshowWidth == 0){
		pshowWidth = "";
	}
	var pshowHeight = programShowHeight;
	if(pshowHeight == 0){
		pshowHeight = "";
	}
	var showwidth = parseInt(curelement.attr("showwidth"));
	if(isNaN(showwidth)){
		showwidth = "";
	}
	var showheight = parseInt(curelement.attr("showheight"));
	if(isNaN(showheight)){
		showheight = "";
	}
	var disabledattr = "";
	if(!isEditProgramShow){
		disabledattr = " disabled='true' ";
	}
	//console.log("-------displaysetupbox-------");
	//console.log("pshowWidth:"+pshowWidth+" programShowWidth:"+programShowWidth);
	//console.log("pshowHeight:"+pshowHeight+" programShowHeight:"+programShowHeight);
	//console.log("showwidth:"+showwidth);
	//console.log("showheight:"+showheight);

	var displaysetupbox = $("<div class='displaysetupbox'>" +
			"<div class='displaysetupbox-title'><div>"+$.i18n.prop("progForm.displaysetup")+"</div><div class='close-displaysetupbox-div' onclick='$(\"#contextmenu-mask\").remove();$(\".displaysetupbox\").remove();'><img class='close-skip' onclick='' src='/apm-web/static/images/terminal/close.png' style='position: absolute; right: 20px; display: block; top: 13px; width: 15px; height: 15px;'></div></div>" +
			"<div class='displaysetupbox-line-title'>" +
				"<span class=''>"+$.i18n.prop("progForm.displayRatio")+"</span>:" +
				"<span class='displaysetupbox-wh-info'>"+$("#program-wh-info").html()+"</span>" +
			"</div>"+
			"<div>"+
				"<div class='displaysetupbox-input-div'>" +
					"<span class='displaysetupbox-input-head displaysetupbox-input-head-add'>"+$.i18n.prop("officeModel.width")+"</span>"+
					"<input type='number' min='10' max='99999' step='1' id='program-width' "+disabledattr+" class='displaysetupbox-input' value='"+pshowWidth+"' />" +
					"<span class='displaysetupbox-input-head-end'>"+$.i18n.prop("officeModel.pixels")+"</span>"+
				"</div>"+
				"<div class='displaysetupbox-input-div-right'>" +
					"<span class='displaysetupbox-input-head displaysetupbox-input-head-add'>"+$.i18n.prop("officeModel.height")+"</span>"+
					"<input type='number' min='10' max='99999' step='1' id='program-height' "+disabledattr+" class='displaysetupbox-input' value='"+pshowHeight+"' />" +
					"<span class='displaysetupbox-input-head-end'>"+$.i18n.prop("officeModel.pixels")+"</span>"+
				"</div>"+
			"</div>"+
			"<div class='displaysetupbox-line-title'>" +
				"<span class=''>"+$.i18n.prop("progForm.elementDisplaySize")+"</span>" +
			"</div>"+
			"<div style='position:relative;margin-top:40px;'>"+
				"<div class='displaysetupbox-input-div'>" +
					"<span class='displaysetupbox-input-head displaysetupbox-input-head-add'>"+$.i18n.prop("officeModel.width")+"</span>"+
					"<input type='number' min='10' max='99999' step='1' id='program-show-width' class='displaysetupbox-input' value='"+showwidth+"' />" +
					"<span class='displaysetupbox-input-head-end'>"+$.i18n.prop("officeModel.pixels")+"</span>"+
				"</div>"+
				"<div class='displaysetupbox-input-div-right'>" +
					"<span class='displaysetupbox-input-head displaysetupbox-input-head-add'>"+$.i18n.prop("officeModel.height")+"</span>"+
					"<input type='number' min='10' max='99999' step='1' id='program-show-height' class='displaysetupbox-input' value='"+showheight+"' />" +
					"<span class='displaysetupbox-input-head-end'>"+$.i18n.prop("officeModel.pixels")+"</span>"+
				"</div>"+
			"</div>"+
			"<div class='displaysetupbox-verify'>"+
				"<div class='btnu displaysetupboxconfirm' onclick='savedisplaysetup();' style='position: absolute;left:160px;top:15px;'>"+$.i18n.prop("userForm.confirm")+"</div>" +
				"<div class='btnu' style='position: absolute;left: 270px;top:15px;' onclick='$(\"#contextmenu-mask\").remove();$(\".displaysetupbox\").remove();'>"+$.i18n.prop("userList.cancel")+"</div>" +
			"</div>"+
			"</div>");
	//遮罩
	$("body").append(mask());
	$("body").append(displaysetupbox);
}

//保存显示设置(公用)
function savedisplaysetup(){
	//基础合法检验
	$(".displaysetupbox-hint").remove();
	var ew = parseInt($("#program-show-width").val());
	var eh = parseInt($("#program-show-height").val());
	var pw = parseInt($("#program-width").val());
	var ph = parseInt($("#program-height").val());
	
	if(isNaN(pw)||isNaN(ph)||isNaN(ew)||isNaN(eh)){
		$(".displaysetupbox-verify").before("<div class='displaysetupbox-hint'>" +
		"<span class=''>"+$.i18n.prop("progForm.pleaseSetSize")+"</span>" +
		"</div>");
		return;
	}
	if(ew > pw){
		ew = pw;
	}
	if(eh > ph){
		eh = ph;
	}
	//设置显示尺寸
	if(isEditProgramShow){
		//设置显示宽高
		programShowWidth = pw;
		programShowHeight = ph;
	}

	/**检验合法**/
	var sw = ew*scale;
	var sh = eh*scale;
	//判断是否差异少于1个像素或大于等于画布大小,是则设置为
	if((sw - sceneWidth) > -1){
		sw = sceneWidth;
		ew = programShowWidth;
	}
	if((sh - sceneHeight) > -1){
		sh = sceneHeight;
		eh = programShowHeight;
	}
	//console.log("-------判断是否差异少于1个像素或大于等于画布大小,是则设置为-------");
	//console.log("sw:"+sw+" sceneWidth:"+sceneWidth+" (sw - sceneWidth):"+(sw - sceneWidth));
	//console.log("sh:"+sh+" sceneHeight:"+sceneHeight+" (sh - sceneHeight):"+(sh - sceneHeight));
	
	//如果起始位加大小超过画布，则减少开始位
	var top = curelement.position().top;
	var left = curelement.position().left;
	//console.log("-------savedisplaysetup-------");
	//console.log("top:"+top);
	//console.log("left:"+left);
	var wdiff = (left+sw)-sceneWidth;
	var hdiff = (top+sh)-sceneHeight;
	//console.log("wdiff:"+wdiff);
	//console.log("hdiff:"+hdiff);
	if(wdiff > 0){
		console.log("set left:"+(left - wdiff));
		curelement.css("left",(left - wdiff));
	}
	if(hdiff > 0){
		console.log("set top:"+(top - hdiff));
		curelement.css("top",(top - hdiff));
	}

	//设置元素
	curelement.width(sw).attr("showwidth",ew);
	curelement.height(sh).attr("showheight",eh);
	
	//设置显示
	updateShowSize(true);
	//触发刷新缩略图
	$("#sceneThumbnail").click();
	//关闭窗口
	$("#contextmenu-mask").remove();
	$(".displaysetupbox").remove();
}

//编辑区显示元素换算尺寸(公用)
function updateShowSize(notAutoUpdate){
	var showSizeFlag = false;
	//设置显示尺寸
	if(programShowWidth > 0 && curelement){
		var ew = parseInt(curelement.attr("showwidth"));
		var eh = parseInt(curelement.attr("showheight"));
		//有显示值才进行更新，否则只隐藏
		if(!isNaN(ew) && !isNaN(eh)){
			//var w = curelement.width();
			//var h = curelement.height();
			var ews = curelement.width()/scale;
			var ehs = curelement.height()/scale;
			//console.log("------updateShowSize------");
			//console.log("ew:"+ew+"  ews:"+ews);
			//console.log("eh:"+eh+"  ehs:"+ehs);
			//console.log("ew*scale:"+ew*scale+"  w:"+curelement.width());
			//console.log("eh*scale:"+eh*scale+"  h:"+curelement.height());
			
			if(!notAutoUpdate && (Math.abs(ew - ews) > 1 || Math.abs(eh - ehs) > 1)){
				//console.log("Math.abs(ew - ews):"+Math.abs(ew - ews));
				//console.log("Math.abs(eh - ehs):"+Math.abs(eh - ehs));
				ew = Math.ceil(ews);
				eh = Math.ceil(ehs);
				if(ew > programWidth){
					ew = programWidth;
				}
				if(eh > programHeight){
					eh = programHeight;
				}
				curelement.attr("showwidth",ew).attr("showheight",eh);
			}

			$(".op-label:visible .show-set .displayValue").show().find(".dpwidth").html(ew).siblings(".dpheight").html(eh);
			showSizeFlag = true;
		}
		
		//如果没设置显示尺寸，则隐藏显示尺寸
		if(!showSizeFlag){
			$(".op-label:visible .show-set .displayValue").hide();
		}
	}

}


//场景时间(公用)
function sceneLong(o){
	console.log("场景时间(公用)");
	var objs = null;
	if(o && o.hasClass(".content-center-topfd")){
		objs = $(o);
	}else{
		objs = $(".content-center-topfd");
	}

	//遍历场景（1个或多个）
	objs.each(function(){
		var obj = $(this);
		var curELong = 0;	
		var sceneduration = 0;
		//获取锁定时长
		var locklong = parseInt(obj.attr("locklong"));
		if(isNaN(locklong)){
			locklong = 0;
		}
		//判断是否锁定场景时长
		if(locklong > 0){
			curELong = locklong;
		}else{
			//计算场景时间
			if(obj.find(".element").length == 0){
				//没有元素了，还原默认时长
				curELong = 10;
			}else{
				//计算场景动作时间
				var sceneanimduration = obj.attr("sceneanimduration");
				if(sceneanimduration != null && sceneanimduration != undefined){
					sceneduration = parseInt(sceneanimduration);
					if(sceneduration < 0){
						sceneduration = 0;
					}
				}
				//多个元素，当前元素时长与场景中各个元素的时长相比较
				var longArr = [];
				//目前先只针对img
				obj.find(".element").each(function(){	
					var thisELong = 0;
					//计算元素播放时长（目前只计算图片和视频的时长）
					if($(this).attr("curimglist") != "" && $(this).attr("curimglist") != undefined){		
						var curimglistObj = JSON.parse($(this).attr("curimglist"));
						switch($(this).attr("from")){
							case "office_edit":
								var delaystr = $(this).attr("delay");
								var delay = null;
								if(delaystr){
									delay = parseInt(delaystr);
								}
								if(!delay){
									delay = 5;
								}
								for(v in curimglistObj){
									if(curimglistObj[v].imglist){
										thisELong += (curimglistObj[v].imglist.split(",").length)*delay;
									}else{
										thisELong = delay;
									}
								}
								break;
							case "img_edit":
								thisELong = curimglistObj.length*$(this).attr("delay");
								break;
							case "video_edit":
								for(v in curimglistObj){
									thisELong += parseInt(curimglistObj[v].long);
								}
								break;
							case "mixed_edit":
								for(v in curimglistObj){
									thisELong += parseInt(curimglistObj[v].long);
								}
								break;
						}
					}	
						
					//计算时长（元素动作、场景动作、其他）
					var animduration = $(this).attr("animduration");
					if(animduration != null && animduration != undefined){
						var duration = parseInt(animduration) + sceneduration;
						if(thisELong<duration){
							thisELong = duration;
						}
					}else{
						if(thisELong<sceneduration){
							thisELong = sceneduration;
						}
					}
					longArr.push(thisELong);
				});
				console.log("最终的时间是");
				longArr.sort(sortNumber);
				curELong = longArr[longArr.length-1];
					
				//如果计算出小于10秒，则默设置为10秒,如果计算超过1天，则按23:59:59算
				if(curELong < 10){
					curELong = 10;
				}else if(curELong > 86399){
					curELong = 86399;
				}			
			}
		}

		//设置时间
		console.log(curELong);
		obj.attr("long",curELong);
		var backg_tpl_item = $(".backg_tpl_item[to='"+obj.attr("id")+"']");
		backg_tpl_item.attr("long",curELong);
		backg_tpl_item.find(".tpl_time_line").css("width",backg_tpl_item.find(".tpl_item_thumbnail_copy").width()+"px");
		backg_tpl_item.find(".time").html(formatSeconds(curELong));
	});
}

//设置场景时间窗口
function sceneTimebox(o){
	var obj = $(o);
	var item = obj.parents(".backg_tpl_item");
	var sceneIndex = item.find(".tpl_item_index").html();
	var to = obj.attr("to");
	var times = item.find(".tpl_time_edit .time").html().split(":");
	
	//是否显示 自动时长按钮(解除锁定场景时间)
	var autoKey = "";
	var locklong = parseInt(item.attr("locklong"));
	if(isNaN(locklong)||locklong<1){
		autoKey = "<div class='btnu' style='position:absolute;left:330px;top:15px;cursor:no-drop;background-color:#eee;color:#a7a7a7;border-color:rgb(167,167,167);'>"+$.i18n.prop("progForm.auto")+"</div>";
	}else{
		autoKey = "<div class='btnu' style='position:absolute;left:330px;top:15px;' onclick='autoSceneTime();'>"+$.i18n.prop("progForm.auto")+"</div>";
	}

	var scenetimebox = $("<div class='scenetimebox' to='"+to+"'>" +
			"<div class='scenetimebox-title'><div>"+$.i18n.prop("progForm.editSceneTime")+"</div><div class='close-scenetimebox-div' onclick='$(\"#contextmenu-mask\").remove();$(\".scenetimebox\").remove();'><img class='close-skip' onclick='' src='/apm-web/static/images/terminal/close.png' style='position: absolute; right: 20px; display: block; top: 13px; width: 15px; height: 15px;'></div></div>" +
			"<div class='scenetimebox-input-div'>" +
				"<div class='scenetimebox-input-head scenetimebox-input-head-add'>"+$.i18n.prop("progForm.scene")+sceneIndex+"</div>"+
				"<span class='scenetimebox-time-box'>"+
					"<input type='text' class='scenetimebox-input hour' maxlength='2' value='"+times[0]+"' /> " +
					"<span class='scenetimebox-interval'>:</span>"+
					"<input type='text' class='scenetimebox-input minute' maxlength='2' value='"+times[1]+"' /> " +
					"<span class='scenetimebox-interval'>:</span>"+
					"<input type='text' class='scenetimebox-input second' maxlength='2' value='"+times[2]+"' />" +
				"</span>"+
			"</div>" +
			"<div class='scenetimebox-verify'>"+
				"<div class='btnu' style='position:absolute;left:110px;top:15px;' onclick='setSceneTime(this);'>"+$.i18n.prop("userForm.confirm")+"</div>" +
				"<div class='btnu' style='position:absolute;left:220px;top:15px;' onclick='$(\"#contextmenu-mask\").remove();$(\".scenetimebox\").remove();'>"+$.i18n.prop("userList.cancel")+"</div>" +
				autoKey+
			"</div>"+
			"</div>");
	//遮罩
	$("body").append(mask());
	$("body").append(scenetimebox);
}

//设置场景时间/锁定场景时间
function setSceneTime(o){
	var obj = $(o).parents(".scenetimebox");
	var setHour = parseInt(obj.find(".scenetimebox-input.hour").val());
	var setMinute = parseInt(obj.find(".scenetimebox-input.minute").val());
	var setSecond = parseInt(obj.find(".scenetimebox-input.second").val());
	var locklong = 0;
	//检验时间
	obj.find(".scenetimebox-hint").remove();
	if(isNaN(setHour)){
		//设置不合法
		obj.find(".scenetimebox-input-div").append("<div class='scenetimebox-hint'>"+$.i18n.prop("progForm.setTheIllegal")+"</div>");
		obj.find(".scenetimebox-input.hour").focus();
		return;
	}else if(isNaN(setMinute)||setMinute>59){
		//设置不合法
		obj.find(".scenetimebox-input-div").append("<div class='scenetimebox-hint'>"+$.i18n.prop("progForm.setTheIllegal")+"</div>");
		obj.find(".scenetimebox-input.minute").focus();
		return;
	}else if(isNaN(setSecond)||setSecond>59){
		//设置不合法
		obj.find(".scenetimebox-input-div").append("<div class='scenetimebox-hint'>"+$.i18n.prop("progForm.setTheIllegal")+"</div>");
		obj.find(".scenetimebox-input.second").focus();
		return;
	}else{
		locklong = (setHour*60+setMinute)*60+setSecond;
		if(locklong < 1){
			//设置不合法
			obj.find(".scenetimebox-input-div").append("<div class='scenetimebox-hint'>"+$.i18n.prop("progForm.cannotZero")+"</div>");
			obj.find(".scenetimebox-input.second").focus();
			return;
		}
	}
	//修改锁定时间
	if(locklong > 0){
		if(locklong > 86399){
			locklong = 86399;
			top.$.jBox.tip($.i18n.prop("progForm.maxTime")+" 23:59:59");
		}
		
		//设置锁定时间
		curScene.attr("locklong",locklong);
		$(".backg_tpl_item.active").attr("locklong",locklong);
		//计算时长
		sceneLong(curScene);
		$("#contextmenu-mask").remove();
		$(".scenetimebox").remove();
		//随时缩略图
		$("#sceneThumbnail").click();
	}
}

//自动场景时间/解锁当前场景时间
function autoSceneTime(){
	//设置锁定时间
	curScene.removeAttr("locklong");
	$(".backg_tpl_item.active").removeAttr("locklong");
	//计算时长
	sceneLong(curScene);
	$("#contextmenu-mask").remove();
	$(".scenetimebox").remove();
	//随时缩略图
	$("#sceneThumbnail").click();
}


//获取选定后的样式(date)
function getDateStyle(obj){
	var dateStyle = $(obj).attr("val");
	if(dateStyle == "1"){
		curelement.find(".op-beijingtime-time").show();
		curelement.find(".op-beijingtime-week").show();
		curelement.find(".op-beijingtime-date").show();
	}else if(dateStyle == "2"){
		curelement.find(".op-beijingtime-time").show();
		curelement.find(".op-beijingtime-week").hide();
		curelement.find(".op-beijingtime-date").show();
	}else if(dateStyle == "3"){
		curelement.find(".op-beijingtime-time").hide();
		curelement.find(".op-beijingtime-week").show();
		curelement.find(".op-beijingtime-date").show();
	}
}

//设置倒计时截止时间
function setcountdowndate(){
    var lan = getLanguagem();
    console.log("language = "+lan);
	WdatePicker({lang:lan,el:'countdowndate',dateFmt:'yyyy-MM-dd HH:mm',isShowClear:false,onpicked:function(){
		$('.countdowndate').change();}
	});
}

/**
 * 更新图片分辨率(异步、公用)
 * @param src 图片路径
 * @param func 参数为自定义方法，参数1是是图片宽，参数2是图片高,参数3是传入的str
 * @param str func方法第3个参数（如果自定义方法没用到，可以不传该参数）
 */
function updateImgRatio(src,func,str){
	//更新图片分辨率
	var img = new Image();
	img.src = src;
	img.onload = function(){
		func(img.width,img.height,str);
	};
}

//把当前元素的curimglist 写到缓存$curImgList(公用)
function putCurImgList(obj){
	if(!obj){
		obj = curelement;
	}
	var curimglistText = obj.attr("curimglist");
	$curImgList.length = 0;
	if(curimglistText && curimglistText.length > 0){
		$curImgList = JSON.parse(curelement.attr("curimglist"));
	}
}

//处理缓存，保证缓存数据是当前元素数据($curImgList)(公用)
function updateCurImgList(){
	if(prev && prev.attr("id") == curelement.attr("id")){
		console.log("当前元素   图片添加的操作");
	}else{
		console.log("$curImgList记录的不是当前元素的数据");
		//把当前元素的curimglist 写到缓存$curImgList
		putCurImgList();
	}
	//如果不正常，设置为空数组
	if(!$curImgList){
		$curImgList = [];
	}
}

//倒数计秒
function setcountdown(id) { 
	var obj = $(id);
/*	if(obj.length < 1){
		clearInterval(timerTasks[id]);
	}*/
	var countdowndate = obj.attr('countdowndate');
	if(countdowndate){
		var time = new Date(countdowndate);
		obj.attr('countdowndate',dateStr(time));
		obj.find('.countdown-content').html(getRTime(time.getTime()));
	}
}

//验证RSS是否合格
function validRss(){
	var site = $("#rssSite").val();
	if(site.trim().length < 1){
		alert($.i18n.prop("progForm.pleaseFillAddress"));
		return ;
	}
	$.ajax({
		url: pUrl + '/program/rssValid',
		type: 'post',
		dataType: "text",
		data: {"site": site},
		success: function(data){
			console.log(data)
			if(data != "true"){
				alert($.i18n.prop("progFirm.illegalPath"));
			}
		},error: function(data){
			/* Act on the event */
			console.log("验证RSS是否合格 服务器出错!");
		}
	});
}



//获取城市名(英文节目状态下中文转拼音)
function getCityName(cityName){
	var restr = null;
	if(programLanguage.indexOf("zh") != 0){
		if(isChinese(cityName)){
			if(cityName === "中国"){
				restr = "chinese";
			}else{
				restr = ConvertPinyin(cityName);
			}
		}
	}
	if(restr){
		return restr;
	}else{
		return cityName;
	}
}

//获取天气状态
function getTqState(state){
	var restr = null;
	if(programLanguage.indexOf("zh") != 0){
		restr = tqicoChineseStateMap[state];
	}else{
		restr = tqicoEnStateMap[state];
	}
	if(restr){
		return restr;
	}else{
		return state;
	}
}

//天气设置国家
function set_cnty(cntyName){
	//var cntyName = cnty.attr("val");
	//刷新所选
	if(cntyName && cntyName.length > 0 && cntyName != $(".weather_edit .cnty").attr('val')){
		$(".weather_edit .cnty").attr("val",cntyName).html(getCityName(cntyName));
		$(".weather_edit .cnty-item").show();
	}
	
	var provinceUl = $(".weather_edit .province-ul");
	var isSelProvince = false;
	if((curelement && curelement.attr("cnty") != cntyName)){
		isSelProvince = true;
	}
	
	//刷新下拉列表
	if(provinceUl.find("ul").length < 1 || isSelProvince){
		$(".weather_edit .province-item").show();
		//清空区域
		provinceUl.html("");
		var provArray = cntyprovince[cntyName];
		for(var i=0;i<provArray.length;i++){
			var provName = provArray[i];
			provinceUl.append("<li class='dropdown-menu-sel ellipsis'><span class='opentree text-left' title='"+getCityName(provName)+"' val='"+provName+"'>"+getCityName(provName)+"</span></li>");
		}
	}
	
	//更新
	if(isSelProvince){
		if(provinceUl.find(".dropdown-menu-sel span").length == 1){
			provinceUl.find(".dropdown-menu-sel span").click();
		}else{
			$(".weather_edit .province").attr("val","").html($.i18n.prop("progForm.pleaseSelectProvince"));
			$(".weather_edit .city").attr("val","").html($.i18n.prop("progForm.pleaseSelctCity"));
			$(".weather_edit .city-item").hide();
		}
	}

}

//天气设置区域
function set_province(provinceName,city){
	//var provinceName = province.attr("val");
	//刷新所选
	if(city && city != '-'){
		$(".weather_edit .city").attr("val",city).html(getCityName(city));
		$(".weather_edit .city-item").show();
	}
	if(provinceName && provinceName.length > 0 && provinceName != $(".weather_edit .province").attr('val')){
		$(".weather_edit .province").attr("val",provinceName).html(getCityName(provinceName));
		$(".weather_edit .province-item").show();
	}
		
	var cityUl = $(".weather_edit .city-ul");
	var isSelCity = false;
	if((curelement && curelement.attr("province") != provinceName) || $(".weather_edit .cnty").attr("val") != curelement.attr("cnty")){
		isSelCity = true;
	}
	//刷新下拉列表
	if(cityUl.find("ul").length < 1 || isSelCity){
		$(".weather_edit .city-item").show();
		//清空城市
		cityUl.html("");
		var cnty_province = $("#weather-cnty-btn-label").attr("val")+"_"+provinceName;
		var cityArray = cntyprovincecity[cnty_province];
		//遍历城市
		for(var i=0;i<cityArray.length;i++){
			var cityName = cityArray[i];
			cityUl.append("<li class='dropdown-menu-sel ellipsis' ><span class='opentree text-left' title='"+getCityName(cityName)+"' val='"+cityName+"'>"+getCityName(cityName)+"</span></li>");
		}
	}
	
	//设置城市
	if(city === '-'){
		cityUl.find("li span:first").click();
	}else if(city){
		if(isSelCity){
			cityUl.find("li span[val='"+city+"']").click();
		}
	}else{
		$(".weather_edit .city").attr("val","").html($.i18n.prop("progForm.pleaseSelctCity"));
	}
}

var tqicoEnStateMap = new Object();
tqicoEnStateMap['Sunny/Clear']= "晴";
tqicoEnStateMap['Sunny,Clear']= "晴";
tqicoEnStateMap['Sunny，Clear']= "晴";

tqicoEnStateMap['Cloudy']= "多云";
tqicoEnStateMap['Few Clouds']= "少云";

tqicoEnStateMap['Partly Cloudy']= "晴间多云";
tqicoEnStateMap['Overcast']= "阴";
tqicoEnStateMap['Windy']= "有风";
tqicoEnStateMap['Calm']= "平静";
tqicoEnStateMap['Light Breeze']= "微风";

tqicoEnStateMap['Moderate/Gentle Breeze']= "和风";
tqicoEnStateMap['Moderate,Gentle Breeze']= "和风";
tqicoEnStateMap['Moderate，Gentle Breeze']= "和风";

tqicoEnStateMap['Fresh Breeze']= "清风";
tqicoEnStateMap['Strong Breeze']= "强风";

tqicoEnStateMap['High Wind, Near Gale']= "疾风";
tqicoEnStateMap['High Wind,Near Gale']= "疾风";

tqicoEnStateMap['Gale']= "大风";
tqicoEnStateMap['Strong Gale']= "烈风";
tqicoEnStateMap['Storm']= "风暴";
tqicoEnStateMap['Violent Storm']= "狂爆风";
tqicoEnStateMap['Hurricane']= "飓风";
tqicoEnStateMap['Tornado']= "龙卷风";
tqicoEnStateMap['Tropical Storm']= "热带风暴";
tqicoEnStateMap['Shower Rain']= "阵雨";
tqicoEnStateMap['Heavy Shower Rain']= "强阵雨";
tqicoEnStateMap['Thundershower']= "雷阵雨";
tqicoEnStateMap['Heavy Thunderstorm']= "强雷阵雨";
tqicoEnStateMap['Hail']= "雷阵雨伴有冰雹";
tqicoEnStateMap['Light Rain']= "小雨";
tqicoEnStateMap['Moderate Rain']= "中雨";

tqicoEnStateMap['Heavy Rain']= "大雨";
tqicoEnStateMap['Extreme Rain']= "极端降雨";

tqicoEnStateMap['Drizzle Rain']= "细雨";

tqicoEnStateMap['Storm']= "暴雨";

tqicoEnStateMap['Heavy Storm']= "大暴雨";
tqicoEnStateMap['Severe Storm']= "特大暴雨";


tqicoEnStateMap['Freezing Rain']= "冻雨";
tqicoEnStateMap['Light Snow']= "小雪";
tqicoEnStateMap['Moderate Snow']= "中雪";
tqicoEnStateMap['Heavy Snow']= "大雪";
tqicoEnStateMap['Snowstorm']= "暴雪";
tqicoEnStateMap['Sleet']= "雨夹雪";
tqicoEnStateMap['Rain And Snow']= "雨雪天气";
tqicoEnStateMap['Shower Snow']= "阵雨夹雪";
tqicoEnStateMap['Snow Flurry']= "阵雪";
tqicoEnStateMap['Mist']= "薄雾";
tqicoEnStateMap['Foggy']= "雾";

tqicoEnStateMap['Haze']= "霾";
tqicoEnStateMap['Sand']= "扬沙";
tqicoEnStateMap['Dust']= "浮尘";

tqicoEnStateMap['Volcanic Ash']= "火山灰";
tqicoEnStateMap['Duststorm']= "沙尘暴";
tqicoEnStateMap['Sandstorm']= "强沙尘暴";
tqicoEnStateMap['Hot']= "热";
tqicoEnStateMap['Cold']= "冷";
tqicoEnStateMap['Unknown']= "未知";

var tqicoChineseStateMap = new Object();
tqicoChineseStateMap['晴']= "Sunny";
tqicoChineseStateMap['多云']= "Cloudy";
tqicoChineseStateMap['少云']= "Few Clouds";

tqicoChineseStateMap['晴间多云']= "Partly Cloudy";
tqicoChineseStateMap['阴']= "Overcast";
tqicoChineseStateMap['有风']= "Windy";
tqicoChineseStateMap['平静']= "Calm";
tqicoChineseStateMap['微风']= "Light Breeze";

tqicoChineseStateMap['和风']= "Moderate";
tqicoChineseStateMap['清风']= "Fresh Breeze";
tqicoChineseStateMap['强风']= "Strong Breeze";
tqicoChineseStateMap['劲风']= "Strong Breeze";
tqicoChineseStateMap['强风/劲风']= "Strong Breeze";
tqicoChineseStateMap['强风,劲风']= "Strong Breeze";
tqicoChineseStateMap['强风，劲风']= "Strong Breeze";

tqicoChineseStateMap['疾风']= "High Wind, Near Gale";
tqicoChineseStateMap['大风']= "Gale";
tqicoChineseStateMap['烈风']= "Strong Gale";
tqicoChineseStateMap['风暴']= "Storm";
tqicoChineseStateMap['狂爆风']= "Violent Storm";
tqicoChineseStateMap['飓风']= "Hurricane";
tqicoChineseStateMap['龙卷风']= "Tornado";
tqicoChineseStateMap['热带风暴']= "Tropical Storm";
tqicoChineseStateMap['阵雨']= "Shower Rain";
tqicoChineseStateMap['强阵雨']= "Heavy Shower Rain";
tqicoChineseStateMap['雷阵雨']= "Thundershower";
tqicoChineseStateMap['强雷阵雨']= "Heavy Thunderstorm";
tqicoChineseStateMap['雷阵雨伴有冰雹']= "Hail";
tqicoChineseStateMap['小雨']= "Light Rain";
tqicoChineseStateMap['中雨']= "Moderate Rain";


tqicoChineseStateMap['大雨']= "Heavy Rain";
tqicoChineseStateMap['极端降雨']= "Extreme Rain";

tqicoChineseStateMap['毛毛雨']= "Drizzle Rain";
tqicoChineseStateMap['细雨']= "Drizzle Rain";
tqicoChineseStateMap['毛毛雨/细雨']= "Drizzle Rain";
tqicoChineseStateMap['毛毛雨,细雨']= "Drizzle Rain";
tqicoChineseStateMap['毛毛雨，细雨']= "Drizzle Rain";

tqicoChineseStateMap['暴雨']= "Storm";


tqicoChineseStateMap['大暴雨']= "Heavy Storm";
tqicoChineseStateMap['特大暴雨']= "Severe Storm";


tqicoChineseStateMap['冻雨']= "Freezing Rain";
tqicoChineseStateMap['小雪']= "Light Snow";
tqicoChineseStateMap['中雪']= "Moderate Snow";
tqicoChineseStateMap['大雪']= "Heavy Snow";
tqicoChineseStateMap['暴雪']= "Snowstorm";
tqicoChineseStateMap['雨夹雪']= "Sleet";
tqicoChineseStateMap['雨雪天气']= "Rain And Snow";
tqicoChineseStateMap['阵雨夹雪']= "Shower Snow";
tqicoChineseStateMap['阵雪']= "Snow Flurry";
tqicoChineseStateMap['薄雾']= "Mist";
tqicoChineseStateMap['雾']= "Foggy";

tqicoChineseStateMap['霾']= "Haze";
tqicoChineseStateMap['扬沙']= "Sand";
tqicoChineseStateMap['浮尘']= "Dust";

tqicoChineseStateMap['火山灰']= "Volcanic Ash";
tqicoChineseStateMap['沙尘暴']= "Duststorm";
tqicoChineseStateMap['强沙尘暴']= "Sandstorm";
tqicoChineseStateMap['热']= "Hot";
tqicoChineseStateMap['冷']= "Cold";
tqicoChineseStateMap['未知']= "Unknown";


var tqicoMap = new Object();
tqicoMap['雷雨']= "&#xe61f;";
tqicoMap['雷阵雨伴有冰雹']= "&#xe61f;";
tqicoMap['Hail']= "&#xe61f;";

tqicoMap['阵雨']= "&#xe61c;";
tqicoMap['Shower Rain']= "&#xe60c;";
tqicoMap['Heavy Shower Rain']= "&#xe60c;";
tqicoMap['Thundershower']= "&#xe60c;";
tqicoMap['Heavy Thunderstorm']= "&#xe60c;";

tqicoMap['暴雨']= "&#xe61b;";
tqicoMap['暴雨到大暴雨']= "&#xe61b;";
tqicoMap['大暴雨']= "&#xe61b;";
tqicoMap['大暴雨到特大暴雨']= "&#xe61b;";
tqicoMap['大到暴雨']= "&#xe61b;";
tqicoMap['大雨']= "&#xe61b;";
tqicoMap['冻雨']= "&#xe61b;";
tqicoMap['特大暴雨']= "&#xe61b;";
tqicoMap['雨夹雪']= "&#xe61b;";
tqicoMap['中到大雨']= "&#xe61b;";
tqicoMap['中雨']= "&#xe61b;";
tqicoMap['Moderate Rain']= "&#xe61b;";
tqicoMap['Heavy Rain']= "&#xe61b;";
tqicoMap['Extreme Rain']= "&#xe61b;";
tqicoMap['Storm']= "&#xe61b;";
tqicoMap['Heavy Storm']= "&#xe61b;";
tqicoMap['Severe Storm']= "&#xe61b;";
tqicoMap['Freezing Rain']= "&#xe61b;";


tqicoMap['小到中雨']= "&#xe619;";
tqicoMap['小雨']= "&#xe619;";
tqicoMap['Light Rain']= "&#xe619;";
tqicoMap['Drizzle Rain']= "&#xe619;";


tqicoMap['阵雪']= "&#xe617;";
tqicoMap['Snow Flurry']= "&#xe617;";


tqicoMap['暴雪']= "&#xe616;";
tqicoMap['大到暴雪']= "&#xe616;";
tqicoMap['大雪']= "&#xe616;";
tqicoMap['中到大雪']= "&#xe616;";
tqicoMap['中雪']= "&#xe616;";
tqicoMap['Moderate Snow']= "&#xe616;";
tqicoMap['Heavy Snow']= "&#xe616;";
tqicoMap['Snowstorm']= "&#xe616;";
tqicoMap['Sleet']= "&#xe616;";
tqicoMap['Rain And Snow']= "&#xe616;";
tqicoMap['Shower Snow']= "&#xe616;";

tqicoMap['小到中雪']= "&#xe611;";
tqicoMap['小雪']= "&#xe611;";
tqicoMap['Light Snow']= "&#xe611;";

tqicoMap['冷']= "&#xe60c;";
tqicoMap['阴']= "&#xe60c;";
tqicoMap['Overcast']= "&#xe60c;";
tqicoMap['Windy']= "&#xe60c;";
tqicoMap['Calm']= "&#xe60c;";
tqicoMap['Light Breeze']= "&#xe60c;";
tqicoMap['Moderate,Gentle Breeze']= "&#xe60c;";
tqicoMap['Fresh Breeze']= "&#xe60c;";
tqicoMap['Strong Breeze']= "&#xe60c;";
tqicoMap['High Wind, Near Gale']= "&#xe60c;";
tqicoMap['Gale']= "&#xe60c;";
tqicoMap['Strong Gale']= "&#xe60c;";
tqicoMap['Cold']= "&#xe60c;";

tqicoMap['少云']= "&#xe60b;";
tqicoMap['多云']= "&#xe60b;";
tqicoMap['晴间多云']= "&#xe60b;";
tqicoMap['Cloudy']= "&#xe60b;";
tqicoMap['Few Clouds']= "&#xe60b;";
tqicoMap['Partly Cloudy']= "&#xe60b;";

tqicoMap['热']= "&#xe609;";
tqicoMap['晴']= "&#xe609;";
tqicoMap['Sunny,Clear']= "&#xe609;";
tqicoMap['Hot']= "&#xe609;";

tqicoMap['火山灰']= "&#xe623;";
tqicoMap['浮尘']= "&#xe623;";
tqicoMap['霾']= "&#xe623;";
tqicoMap['雾']= "&#xe623;";
tqicoMap['Foggy']= "&#xe623;";
tqicoMap['Mist']= "&#xe623;";
tqicoMap['Haze']= "&#xe623;";
tqicoMap['Dust']= "&#xe623;";
tqicoMap['Volcanic Ash']= "&#xe623;";


tqicoMap['强沙尘暴']= "&#xe624;";
tqicoMap['沙尘暴']= "&#xe624;";
tqicoMap['扬沙']= "&#xe624;";
tqicoMap['Sand']= "&#xe624;";
tqicoMap['Duststorm']= "&#xe624;";
tqicoMap['Sandstorm']= "&#xe624;";

tqicoMap['Storm']= "&#xe60c;";
tqicoMap['Violent Storm']= "&#xe60c;";
tqicoMap['Hurricane']= "&#xe60c;";
tqicoMap['Tornado']= "&#xe60c;";
tqicoMap['Tropical Storm']= "&#xe60c;";


/*保存框*/
/**保存模板确认窗口*/
var saveModelBoxFlag = false;
function saveModelBox(windowFlag){
	if(!saveModelBoxFlag){
		saveModelBoxFlag = true;
		$(".backg_tpl_item.active").click();
		//curScene.click();
		$("#sMask").remove();
		$("#sDiv").remove();
		
		$("body").append(createSMask());
		var obj = $("#program-wh-info");
		
		//如果存在节目ID，判断是否允许覆盖
		if(windowFlag == "coversave" && $("#modelid").val().length > 0){
			windowFlag = "coversave";
		}else{
			windowFlag = "newsave";
		}

		//根据标记，显示窗口
		$("#saveFlag").val(windowFlag);
		if(windowFlag == "newsave"){
			divheight = 213;
			//保存模板的确认框
			$("body").append(createSDiv(saveModelInfo(obj),$.i18n.prop("progForm.saveTemplete")));
			//新建模板-模板名监测
			$("#newProgram-name").on("blur",function(){
				checkProgramName($.i18n.prop("progForm.pleaseInputTemplateName"));
			});
		}else if(windowFlag == "coversave"){
			divheight = 180;
			//是否覆盖节目的确认框
			$("body").append(createSDiv(modelAllowOverwriteOn(obj),$.i18n.prop("progForm.saveTemplete")));
		}
		//绑定选中事件
		$(".newProgramDiv .dropdown-menu li").on("click",function(){
			var obj = $(this).find("span");
			$(this).parent().siblings(".selLabel").attr("val",obj.attr("val")).html(obj.html());
		});
		saveModelBoxFlag = false;
	}

}

/**是否覆盖模板*/
function modelAllowOverwriteOn(obj){
	var html = "<div class='coverDiv'>"+
	    			"<div class='coverContent'>"+
	    				"<div class='div-line'>"+
	    					"<div class='text'>"+$.i18n.prop("progForm.coverTheOriginalTemplate")+"</div>"+
	    				"</div>"+
	    			"</div>"+
	    			"<div class='coverHandle'>"+
	    				"<div class='btn-keys'>"+
	    					"<div class='btnz cover' onclick=\"$('#menu-savex-model').click();\">"+$.i18n.prop("progForm.cover")+"</div>"+
	    					"<div class='btnz saveAs' onclick=\"saveModelBox();\">"+$.i18n.prop("progForm.saveAs")+"</div>"+
	    					"<div class='btnz cancel' onclick=\"$('#view_close').click();\">"+$.i18n.prop("userList.cancel")+"</div>"+
	    				"</div>"+
	    			"</div>"+
	    		"</div>";
	return html;
}

/**保存模板确认窗口的内容*/
function saveModelInfo(obj){
	var whstr = null;
	var whval = null;
	var width = parseInt(obj.attr("programwidth"));
	var height = parseInt(obj.attr("programheight"));
	if(width == 1920&&height == 1080){
		whstr = "&nbsp;"+$.i18n.prop("officeModel.horizontal")+"&nbsp;16:9";
		whval = "4.1";
	}else if(width == 1080&&height == 1920){
		whstr = "&nbsp;"+$.i18n.prop("officeModel.vertical")+"&nbsp;9:16";
		whval = "4.2";
	}else{
		whstr = width+"&nbsp;*&nbsp;"+height;
		whval = "4.3";
	}
	var middlehtml = "";
	//var middleheight = 0;
	var divlineheight = 57;
	//获取标签
	$.ajax({
		url:pUrl + "/label/findLabelByModuleByType",
		async:false,
		dataType:"json",
		data:{"module":"1"},
		success:function(data){
			var hideClass = null;
			var defval = null;
			var deflabel = null; 
			for(var x in data){
				console.log("data.x="+x);
				if(x == "progModel.scale"){
					hideClass = "hide";
					defval = whval;
					deflabel = whstr; 
				}else{
					hideClass = "";
					defval = "-";
					deflabel = $.i18n.prop("officeModel.unlimited"); 
					divheight += divlineheight;
				}
				var da = data[x];
				middlehtml += 
				"<div class='div-line "+hideClass+"'>"+
	    			"<span class='newProgram-advertiser-title newProgram-title'>"+$.i18n.prop(x)+"</span>"+
	    			"<div class='btn-group'>"+
				      "<label for='advertiser-btn-"+$.i18n.prop(x)+"' type='button' class='btn btn-default btnr text-left selLabel' val='"+defval+"'>"+deflabel+"</label>"+
				      "<button type='button' id='advertiser-btn-"+$.i18n.prop(x)+"' class='btn dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='true'>"+
				        "<span class='glyphicon glyphicon-menu-down'></span>"+
				        "<span class='sr-only'>Toggle Dropdown</span>"+
				      "</button>"+
				      "<ul class='dropdown-menu'>"+
					  	"<li><span class='opentree text-left' val='-'>"+$.i18n.prop("officeModel.unlimited")+"</span></li>";
				for(var i=0,size=da.length;i<size;i++){
					middlehtml+="<li><span class='opentree text-left' val='"+da[i].id+"'>"+$.i18n.prop(da[i].languageKey)+"</span></li>";
					//middlehtml+="<li><span class='opentree text-left' val='"+da[i].id+"'>"+da[i].label+"</span></li>";
				}
				middlehtml+="</ul>"+"</div>"+"</div>";
			}
		},error:function(){
			//BUG
			middlehtml = "";
		}
	});
	
	var html = "<div class='newProgramDiv'>"+
	    	"<div class='newProgramContent'>"+
	    		"<div class='div-line'>"+
	    			"<span class='newProgram-name-title newProgram-title'>"+$.i18n.prop("progModel.modelName")+"</span>"+
	    			"<input type='text' placeholder='"+$.i18n.prop("progForm.pleaseInputTemplateName")+"' maxlength='32' id='newProgram-name' name='newProgram-name' />"+
	    		"</div>"+
	    		middlehtml+
	    		"<div class='div-line'>"+
	    			"<span class='newProgram-ratio-type-title newProgram-title'>"+$.i18n.prop("officeModel.programScale")+"</span>"+
	    			"<div class='btn-group'>"+
				      "<label type='button' id='ratioTypeDef' for='ratio-btn' class='hide' val='1'>"+$.i18n.prop("officeModel.customize")+"</label>"+
				      "<div class=''>"+
				        "<span class='' style='color:#a7a7a7;'>"+whstr+"</span>"+
				      "</div>"+
				    "</div>"+
	    		"</div>"+
	    		"<div class='div-line div-line-custom' style='display:none;'>"+
    				"<span class='newProgram-ratio-title'></span>"+
    				"<div class='btn-group radio-group'>"+
						"<span class='radio-div'><span class='radio-div-text'>"+$.i18n.prop("officeModel.width")+"&nbsp;</span><input type='text' class='radio-div-input' value='"+width+"' id='radio-width' name='radio-width'><span class='color-gray'>&nbsp;"+$.i18n.prop("officeModel.pixels")+"</span></span>"+
						"<span class='radio-div'><span class='radio-div-text'>"+$.i18n.prop("officeModel.height")+"&nbsp;</span><input type='text' class='radio-div-input' value='"+height+"' id='radio-height' name='radio-height'><span class='color-gray'>&nbsp;"+$.i18n.prop("officeModel.pixels")+"</span></span>"+
			    	"</div>"+
    			"</div>"+
	    	"</div>"+
	    	"<div class='newProgramHandle'>"+
	    		"<div class='btn-keys'>"+
	    			"<div class='btnz newProgramCreate' onclick=\"$('#modelid').val('');$('#program-wh-info').removeAttr('programid');$('#id').val('');$('#menu-savex-model').click();\">"+$.i18n.prop("userList.save")+"</div>"+
	    			"<div class='btnz newProgramCancel' onclick=\"$('#view_close').click();\">"+$.i18n.prop("userList.cancel")+"</div>"+
	    		"</div>"+
	    	"</div>"+
	    "</div>";
	return html;
}

////////

/**新建节目确认窗口*/
var saveProgramBoxFlag = false;
function saveProgramBox(windowFlag){
	console.log("保存节目");
	if(!saveProgramBoxFlag){
		saveProgramBoxFlag = true;
		$(".backg_tpl_item.active").click();
		//curScene.click();
		$("#sMask").remove();
		$("#sDiv").remove();
		
		//由于覆盖保存改为直接执行，所以注释掉公用遮罩
		$("body").append(createSMask());
		var obj = $("#program-wh-info");

		var publishProgramId = obj.attr("publishProgramId");
		//如果存在节目ID，判断是否允许覆盖
		if(windowFlag == "coversave"){
			if(publishProgramId && publishProgramId.length > 0){
				$.ajax({
					url:pUrl + "/program/allowOverwriteOn",
					async:false,
					data:{"publishProgramId":publishProgramId},
					success:function(data){
						windowFlag = "coversave";
					},error:function(){
						top.$.jBox.tip($.i18n.prop("progPublishSet.connectException"),'warning');
						windowFlag = "newsave";
					}
				});
			}else if("new" === eflag){
				windowFlag = "coversave";
			}else{
				windowFlag = "newsave";
			}
		}else{
			windowFlag = "newsave";
		}
		
		//根据标记，显示窗口
		$("#saveFlag").val(windowFlag);
		if(windowFlag == "newsave"){
			//divheight = 270;
            divheight = 213; //270-57//yym 20161022 hide advertiser
			//保存节目的确认框
			$("body").append(createSDiv(saveProgramModelInfo(obj)));
			//新建节目-节目名监测
			$("#newProgram-name").val($("#name").val());
			$("#newProgram-name").on("blur",function(){
				checkProgramName();
			});
		}else if(windowFlag == "coversave"){
			if(!isSaved){
				//保存节目(不弹框直接覆盖保存)
				$("#sMask").remove();
				$("#menu-savex").click();
			}else{
				$("#sMask").remove();
				top.$.jBox.tip($.i18n.prop("userList.operateSuccess"));
			}
			//是否覆盖节目的确认框
			//divheight = 180;
			//$("body").append(createSDiv(programAllowOverwriteOn(obj)));
		}
		saveProgramBoxFlag = false;
	}
}

//检测保存的新节目名是否合法
function checkProgramName(tip){
	if(!tip){
		tip = $.i18n.prop("chkPorg.pleaseInputProgName");
	}
	var obj = $('#newProgram-name');
	var newProgramName = $.trim(obj.val());
	obj.siblings(".hint-red").remove();
	if(newProgramName.length < 1){
		obj.parent().append("<span class='hint-red' style='margin-left:136px;'>"+tip+"</span>");
	}else{
		$('#name').val($('#newProgram-name').val());
	}
}

/**是否覆盖节目*/
function programAllowOverwriteOn(obj){
	var id = obj.attr("programid");

	var html = "<div class='coverDiv'>"+
	    			"<div class='coverContent'>"+
	    				"<div class='div-line'>"+
	    					"<div class='text'>"+$.i18n.prop("progForm.coverOrNot")+"</div>"+
	    				"</div>"+
	    			"</div>"+
	    			"<div class='coverHandle'>"+
	    				"<div class='btn-keys'>"+
	    					"<div class='btnz cover' onclick=\"$('#menu-savex').click();\">"+$.i18n.prop("progForm.cover")+"</div>"+
	    					"<div class='btnz saveAs' onclick=\"saveProgramBox();\">"+$.i18n.prop("progForm.saveAs")+"</div>"+
	    					"<div class='btnz cancel' onclick=\"$('#view_close').click();\">"+$.i18n.prop("userList.cancel")+"</div>"+
	    				"</div>"+
	    			"</div>"+
	    		"</div>";
	return html;
}

/**保存节目确认窗口的内容*/
function saveProgramModelInfo(obj){
	var whstr = null;
	var width = parseInt(obj.attr("programwidth"));
	var height = parseInt(obj.attr("programheight"));
	if(width == 1920&&height == 1080){
		whstr = "&nbsp;"+$.i18n.prop("officeModel.horizontal")+"&nbsp;16:9";
	}else if(width == 1080&&height == 1920){
		whstr = "&nbsp;"+$.i18n.prop("officeModel.vertical")+"&nbsp;9:16";
	}else{
		whstr = width+"&nbsp;*&nbsp;"+height;
	}
    var hideClass="hide";//yym 201022 hide advertiser
	var html = "<div class='newProgramDiv'>"+
	    	"<div class='newProgramContent'>"+
	    		"<div class='div-line'>"+
	    			"<span class='newProgram-name-title newProgram-title'>"+$.i18n.prop("chkProg.progName")+"</span>"+
	    			"<input type='text' placeholder='"+$.i18n.prop("officeModel.pleaseInputPorgramName")+"' maxlength='32' id='newProgram-name' name='newProgram-name' />"+
	    		"</div>"+
	    		"<div class='div-line "+hideClass+"'>"+
	    			"<span class='newProgram-advertiser-title newProgram-title'>"+$.i18n.prop("chkProg.advertiser")+"</span>"+
	    			"<div class='btn-group'>"+
				      "<label for='advertiser-btn' id='sel-advertiser' type='button' class='btn btn-default btnr text-left' val='"+$.i18n.prop("officeModel.noAdvertiser")+"'>"+$.i18n.prop("officeModel.noAdvertiser")+"</label>"+
				      "<button type='button' id='advertiser-btn' class='btn dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='true'>"+
				        "<span class='glyphicon glyphicon-menu-down'></span>"+
				        "<span class='sr-only'>Toggle Dropdown</span>"+
				      "</button>"+
				      "<ul class='dropdown-menu'>"+
				        "<li><span class='opentree text-left' val='0'>"+$.i18n.prop("officeModel.noAdvertiser")+"</span></li>"+
				      "</ul>"+
				    "</div>"+
	    		"</div>"+
	    		"<div class='div-line'>"+
	    			"<span class='newProgram-ratio-type-title newProgram-title'>"+$.i18n.prop("officeModel.programScale")+"</span>"+
	    			"<div class='btn-group'>"+
				      "<label type='button' id='ratioTypeDef' for='ratio-btn' class='hide' val='1'>"+$.i18n.prop("officeModel.customize")+"</label>"+
				      "<div class=''>"+
				        "<span class='' style='color:#a7a7a7;'>"+whstr+"</span>"+
				      "</div>"+
				    "</div>"+
	    		"</div>"+
	    		"<div class='div-line div-line-custom' style='display:none;'>"+
    				"<span class='newProgram-ratio-title'></span>"+
    				"<div class='btn-group radio-group'>"+
						"<span class='radio-div'><span class='radio-div-text'>"+$.i18n.prop("officeModel.width")+"&nbsp;</span><input type='text' class='radio-div-input' value='"+width+"' id='radio-width' name='radio-width'><span class='color-gray'>&nbsp;"+$.i18n.prop("officeModel.pixels")+"</span></span>"+
						"<span class='radio-div'><span class='radio-div-text'>"+$.i18n.prop("officeModel.height")+"&nbsp;</span><input type='text' class='radio-div-input' value='"+height+"' id='radio-height' name='radio-height'><span class='color-gray'>&nbsp;"+$.i18n.prop("officeModel.pixels")+"</span></span>"+
			    	"</div>"+
    			"</div>"+
	    	"</div>"+
	    	"<div class='newProgramHandle'>"+
	    		"<div class='btn-keys'>"+
	    			"<div class='btnz newProgramCreate' onclick=\"$('#publishProgramId').val('');$('#program-wh-info').removeAttr('publishProgramId');$('#program-wh-info').removeAttr('programid');$('#id').val('');$('#menu-savex').click();\">"+$.i18n.prop("userList.save")+"</div>"+
	    			"<div class='btnz newProgramCancel' onclick=\"$('#view_close').click();\">"+$.i18n.prop("userList.cancel")+"</div>"+
	    		"</div>"+
	    	"</div>"+
	    "</div>";
	return html;
}

//创建遮罩层
function createSMask(){
	console.log("创建遮罩层createSMask");
	var view_mask = $("<div></div>");
	view_mask.attr("id","sMask").css("z-index","29999").css("background-color","#000000").css("opacity","0.1").css("-moz-opacity","0.1").css("filter","alpha(opacity=10)").css({position:"fixed",top:"0px",left:"0px",width:"100%",height:"100%"});
	return view_mask;
}


/**
 * 判断场景是否已经有视频/流媒体素材的控件(控件只看流媒体、视频、混播),并弹出提示
 * @param ruleOutElement 排除判断的元素(根据ID,不输入默认为不排除判断元素)
 * @param scene 判断的场景(不输入默认为当前场景)
 * @returns {Boolean}
 */
function isHasVsAndTip(ruleOutElement,scene){
	var flag = true;
	var element = isHasVs(ruleOutElement,scene);
	if(element){
		flag = false;
		top.$.jBox.tip($.i18n.prop("progForm.dontSupportUsingMultiChannelVideo"));
		$("#for_backg_edit").click();
		element.mousedown();
	}
	return flag;
}

function isVerticalTip(){
	if(isVertical){
		top.$.jBox.tip($.i18n.prop("progForm.verticalScreendontSupportPort"));
		$("#for_backg_edit").click();
		element.mousedown();
		return true;
	}
	return false;
}

/**
 * 判断场景是否已经有视频/流媒体素材的控件(控件只看流媒体、视频、混播、信号源)
 * @param ruleOutElement 排除判断的元素(根据ID,不输入默认为不排除判断元素)
 * @param scene 判断的场景(不输入默认为当前场景)
 * @returns {Boolean}
 */
function isHasVs(ruleOutElement,scene){
	var ruleOut  = null;
	if(ruleOutElement){
		ruleOut = ruleOutElement.attr("id"); 
	}
	if(!scene){
		scene = curScene;
	}
	var element = null;
	scene.find(".element[from='mixed_edit'],.element[from='streamMedia_edit'],.element[from='streamMedia_edit'],.element[from='video_edit'],.element[from='port_edit']").each(function(){			
		var obj = $(this);
		if(ruleOut){
			if(obj.attr("id") === ruleOut){
				return true;
			} 
		}
		var from = obj.attr("from");
		if(from === "streamMedia_edit" || from === "video_edit" || from === "port_edit"){
			element = obj;
			return false;
		}else if(from === "mixed_edit"){
			var mlistText = obj.attr("curimglist");
			var mlist = null;
			if(mlistText && mlistText.length > 0){
				mlist = JSON.parse(mlistText);
				for(var i = 0;i<mlist.length;i++){
					var mtype = mlist[i].type;
					if(mtype === "streamMedia"||mtype === "video"){
						element = obj;
						break;
					}
				}
			}
			if(element){
				return false;
			}
		}
	});
	return element;
}

//创建窗体
var divwidth = 528;
var divheight = 270;
var marginLeft = -divwidth/2;
var marginTop = -127;
function createSDiv(html,title){
	if(!title){
		title = $.i18n.prop("progForm.saveProgram");
	}
	//外框
	var view_div = $("<div></div>");
	view_div.attr("id","sDiv").css("border-radius","4px 4px 4px 4px").css("background-color","white").css("margin-top",marginTop+"px").css("margin-left",marginLeft+"px").css("z-index","30000").css({position:"absolute",left:"50%",display:"block",top:"50%",width:divwidth+"px"});//.attr("align","center")

	//标题
	var view_title = $("<div></div>");
	view_title.css("border-radius","4px 4px 0px 0px").css("background-color","#65A7F3").css({position:"absolute",left:"0px",display:"block",top:"0px",width:divwidth+"px",height:"40px"}).html("<div style='color:white;margin:10px 20px;font-size:15px;'>"+title+"</div>");

	//关闭按钮
	var view_close = $("<img></img>");
	view_close.attr("src",ctxStatic+"/images/terminal/close.png").css({position:"absolute",right:"20px",display:"block",top:"13px",width:"15px",height:"15px"});			
	var view_close_label = $("<label id='view_close' onclick=\"submitToNext=false;$('#sMask').remove();$('#sDiv').remove();$('body').css('height','"+$(document.body).height()+"px');\" style='position:absolute;right:0px;display:block;top:0px;width:55px;height:40px;border-radius:0px 4px 0px 0px;'></label>");
	view_close_label.append(view_close);
	
	//内容
	var view_content = $("<div></div>");
	view_content.css("background-color","white").css("border-radius","0px 0px 4px 4px").css({position:"absolute",left:"0px",display:"block",top:"40px",width:divwidth+"px",height:divheight+"px"});
	view_content.append(html);
	
	view_div.append(view_title).append(view_close_label).append(view_content);
	
	//调整高度
	view_div.css('top',$(window).scrollTop()+200);
	
	return view_div;
}

//下一步:发布设置
function publishSet(){
	var publishProgramId = $("#publishProgramId").val();
	if(!isSaved){
		//表单提交后跳转到下一步
		submitToNext = true;
		if($(".menu-save").hasClass("gray")){
			$(".menu-saveas").click();
		}else{
			$(".menu-save").click();
		}
	}else{
		window.location.href = pUrl+'/publishProgram/publishSet?id='+publishProgramId;
	}
}

//判断该节目是否允许覆盖保存(新建的、和有发布记录ID的允许保存)
function isAllowOverwrite(){
	var flag = false;
	var publishProgramId = $("#publishProgramId").val();
	if("new" === eflag || (publishProgramId && publishProgramId.length > 10)){
		flag = true;
	}
	return flag;
}


function getFileDetail(fileId,fileName,file_id){
	console.log(fileId+" -- "+fileName+" -- "+file_id);
}

/**
 * 创建遮罩层(公用)PS:目前用于在特定状态下阻挡按钮触发变化
 * @param id
 * @param className
 * @param element
 * @param transparence 字符串，比如0要传 '0'
 * @param position {left:x,top:y,width:w,height:h}//相对偏移量
 * @param zindex 层级
 * @returns
 */
function pmask(id,className,element,transparence,position,zindex){
	//遮罩
/*	var mask = $("<div></div>");
	if(id){
		mask.attr("id",id);
	}
	if(className){
		mask.addClass(className);
	}
	if(!zindex){
		zindex = "100000";
	}
	if(!transparence){
		transparence = 0.5;
	}else{
		transparence = parseInt(transparence);
		if(isNaN(transparence)){
			transparence = 0.5;
		}
	}*/
	
	/*var top = element.position().top;
	var left = element.position().left;
	var width = element.width();
	var height = element.height();*/
	/*var top = 15;
	var left = 30;
	var width = 100;
	var height = 200;

	var mtop = parseInt(element.css("margin-top"));
	if(!isNaN(mtop)){
		top = top+mtop;
	}
	
	if(position){
		if(position.top){
			top = top+position.top;
		}
		if(position.left){
			left = left+position.left;
		}
		if(position.width){
			width = width+position.width;
		}
		if(position.height){
			height = height+position.height;
		}
	}
	
	mask.css("z-index",zindex).css("background-color","#000000").css("opacity",transparence).css("-moz-opacity",transparence).css("filter","alpha(opacity="+(transparence*100)+")").css({position:"absolute","top":top+"px","left":left+"px","width":width+"px","height":height+"px"});
	return mask;*/
}

//上传文件缩略图
function uploadThumb(msgobj){
    //上传文件成功,则上传缩略图
	//dataUrl.substring(22, dataUrl.length)
    if(msgobj.msg === "success" && msgobj.fid && msgobj.thumbsrc){
    	var thumbsrc = msgobj.thumbsrc;
    	var index = thumbsrc.indexOf("base64,")+7;
    	thumbsrc = thumbsrc.substring(index, thumbsrc.length);
        $.ajax({
            url:"/apm-web/a/fileInfosa/uploadThumb",
            type:'post',
            dataType:'text',
            data:{"fileId": msgobj.fid,"thumbsrc":thumbsrc},
            success: function(data){
                console.log("上传缩略图成功");
            },error: function(data){
            	console.log("上传缩略图 服务器出错!");
            }
        });
     }
}

function uploadreset(){
	$(".material-modal:visible .upload_reset_btn").click();
	$(".m-row .material-item-upload").remove();
}

//根据记录的选中素材,还原素材库页面中存在的素材的选中状态(公用)
function restoreMaterialActice(type){
	var typeObj = materialSelected[type];
	if(typeObj){
		for(var attrid in typeObj){
			var obj = $(".material-modal:visible img[attrid='"+attrid+"']");
			if(obj.length > 0){
				obj.parents(".material-item.up-modal-m-i").addClass("active");
			}
		}
	}
}



//打开素材库(公用)
function openmateriallibrary(){
	$(".addmaterial:visible").click();
}

//监听键盘
function keydown(e) {
	var currKey=0,e=e||event; 
	currKey=e.keyCode||e.which||e.charCode;//支持IE、FF 
	var ctrlKey= e.ctrlKey || e.metaKey;
	var shiftKey = e.shiftKey;
	if (currKey == 46 || currKey == 8) {
		var xcx = textEditorTool.textEditor("isContenteditable");
		if(xcx && xcx != "false"){
			return;
		}
		//在input中，退格键不进行自定义处理
		if(currKey == 8 && $(document.activeElement).is("input")){
			return;
		}
		if($(".modal.in").length == 0 && $("#contextmenu-mask").length == 0){
			//delete
			$(".menu-del").click(); 
		}
	}else if(currKey == 13){
		var obj = $(e.target);
		//搜索框按回车键，触发搜索按钮点击(公用) 
		//class为searchTextEnter,回车键触发，
		//当设置了searchfor，则触发searchfor元素(jq规则，例如是触发id为a的元素，searchfor为#a)的点击事件，
		//否则触发下一个元素.search-btn元素的点击事件
		if(obj.hasClass("searchTextEnter")){
			var searchfor = obj.attr("searchfor");
			if(searchfor){
				$(searchfor).click();
			}else{
				obj.next(".search-btn").click();
			}
			return false;
		}
	}else if (currKey == 37){
		if (ctrlKey){
			domchange("left",-1);
		}else if(shiftKey){
			domchange("width",-1);
		}		
	}
	else if (currKey == 38){
		if (ctrlKey){
			domchange("top",-1);
		}else if(shiftKey){
			domchange("height",-1);
		}	
	}else if (currKey == 39){
		if (ctrlKey){
			domchange("left",1);
		}else if(shiftKey){
			domchange("width",1);
		}
	}else if (currKey == 40){
		if (ctrlKey){
			domchange("top",1);
		}else if(shiftKey){
			domchange("height",1);
		}
	}/**/
	
} 


//显示隐藏右边菜单
function  pm_right_showHide(showE){
	
	$("#pm_right_pro").hide();
	$("#pm_right_pub").hide();
	
	$(showE).show();
}
//随机数
function creade_random(){
	
	var count=3000; 
	var originalArray=new Array;//原数组 
	//给原数组originalArray赋值 
	for (var i=0;i<count;i++){ 
	    originalArray[i]=i+1; 
	} 
	originalArray.sort(function(){ return 0.5 - Math.random(); }); 
	return originalArray[0];
	
}