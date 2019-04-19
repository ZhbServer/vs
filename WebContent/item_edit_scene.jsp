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
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<style type="text/css">

	body,html{
		width:100%;
		height:98%;
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
<script type="text/javascript" src="js/ceng.js"></script>
<script type="text/javascript" src="jquery-ui-1.9.2.custom/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="jquery-ui-1.9.2.custom/js/jquery-ui-1.9.2.custom.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>


<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<script type="text/javascript" src="js/cookie.js"></script>

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
    var b00347="<ww:property value='#session.local.b00347' />";
    //帮助 导引
    var intro;
    
    //当前缩放比
    var cjzoom;
    //元素计数编号
    var total = 0;
    //当前点击元素
    var font=null;
    var divv;
    var divv2;


    //当前窗口行高
    var openh;

    
    $(function(){
	   //制作节目隐藏功能菜单显示 
	   //鼠标悬浮 其它按钮 显示 子项
	   $(".menu_others").hover(

	       function(){
				 
			     if($(this).find('.menu_dropdown').is(":hidden")){
				    $('.menu_dropdown').hide();
				    $(this).find('.menu_dropdown').show();
				    
				    $(this).find('.menu_dropdown').attr("style","display:block;left:221px;top:-15px;");
			      }else{
			    	
					$(this).find('.menu_dropdown').hide();
		          }
		    },function(){
		    	    $(this).find('.menu_dropdown').hide();
		    }     
	        	 
	    );
	    //鼠标离开 其它 按钮 子项 隐藏
	    $(document).click(function(){  
		     $(".menu_dropdown").hide();  
	    }); 

        var openIntro = <%=request.getParameter("openIntro")%>;
        
	    if(openIntro == '1'){
		    
		    $("#step2 a").attr("href","javascript:open_win_video_1();");
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
						element: '#step1',  
						intro: "<ww:property value='#session.local.a00910' />"
					},
					{
						element: '#step2',  
						intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00060' /></span><ww:property value='#session.local.a00911' />",
						position: "bottom"
					},
					{
						element: '#step3',  
						intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00061' /></span><ww:property value='#session.local.a00911' />",
						position: "bottom"
					},
					{
						element: '#ie_item_make',
						intro: "<ww:property value='#session.local.a00912' /><span style='color:blue'> <ww:property value='#session.local.a00913' /></span><ww:property value='#session.local.a00914' />",
						position: "left"
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
			layer.msg("<ww:property value='#session.local.a00864' />");
			openIntro = 2;
			$("#step2 a").attr("href","javascript:open_win_video();"); 
		   });
	   }
    });




    /*遍历获取节目时长*/
   function get_item_time(){

	 if($('input[name="smartPlay"]').prop("checked"))
	 {	       
			  $("#stime").val(-1);
			  	 
	 }else{

		 	
       
		 
		 var obj;
		 var objtime;
		 var stime=0;
		 var key;
	    
		 //获取视频/音频/图片/office
		 var divs=get_topfd_all();
		 for(var i = 0;i<divs.length;i++)
		 {
			 obj=divs[i];
			 key=obj.id.substring(0,5);
		     if(key=="video"||key=="image"||key=="myppt"||key=="mydoc"||key=="myxls"||key=="mypdf")
			 {
		    	 objtime=obj.getAttribute("ptime");
		    	 if(parseInt(stime)<=parseInt(objtime)){
					  stime=objtime;
				 }
			 }
		 }
		 if(stime==0||stime<=30){
			 
	       stime=30;
	       
		 }
		   
		 $("#stime").val(stime);
     }
     	 	
   } 


   //智能播放
  function smartPlayOnclick(){

	  if($('input[name="smartPlay"]').prop("checked"))
      {
          //alert("选中");
		  $("#stime").val(-1);	 
      }else{
    	  get_item_time();

      }
	
   }


   //获取所有控件节目绑定的用户
   function getDllItemBindUser(){
	   
	   var topfd=document.getElementById("ie_item_make").contentWindow.document.getElementById("topfd");
	   
	   var allDllItemUserList=new Array();

       var divsDllItem=topfd.getElementsByTagName("div");

	   for(var i=0;i<divsDllItem.length;i++){
		   
		   var div =divsDllItem[i];

		   var key=div.id.substring(0,5);
		   
		   if(key=="dllIt"){
			   var jsonData=div.getAttribute("jsonData");
				if(jsonData!=null){
				    var programDsource;
				    
				    jsonData=jsonData.replace(/'/g,"\"");

				    var objs = eval( "(" + jsonData + ")" );//转换后的JSON对象

                     var mDllItemUserList=objs.mDllItemList; 
                     
                     for(var j=0;j<mDllItemUserList.length;j++){
                     
                           var  mDllItemUser=mDllItemUserList[j];
                           allDllItemUserList[allDllItemUserList.length]=mDllItemUser;

                     }  
	            }
	
		   }
	
	   }
	   return allDllItemUserList;
   }

   //转16进制
   function zero_fill_hex(num, digits) {
	   
	  var s = num.toString(16);
	  while (s.length < digits)
	  s = "0" + s;
	  return s;
	  
   }



   /*启动获取浏览器高度自适应屏幕*/
   window.onload = function(){
	
       var ip_addr = document.location.hostname;

       var h = document.body.clientHeight;
       
       cjzoom=document.getElementById("sf").value;

       var w = document.body.clientWidth;
   
       openh=h-40;
       
       document.getElementById("content").style.height=(h-60)+"px";  
       //document.getElementById("c_left_id").style.height=(h-64)+"px";
       document.getElementById("c_right_id").style.height=(h-64)+"px";

       document.getElementById("blank_box_id").style.height=(h-134)+"px";
       //document.getElementById("right_empty_id").style.height=(h-480)+"px";
       document.getElementById("ie_item_make").style.height=(h-134)+"px";
       //document.getElementById("pm_left_content_id").style.height=(h-480)+"px";
  
       //判断修改
       var ms=document.getElementById("mcontent").value;
       $( "#sfv" ).val((cjzoom*100)+"%" );  
       if(ms==""){ 
	    	 //自适应
	         var blank_box_id_height=h-170;
	         var fblH="<ww:property value='#session.scene.ty'/>";
	         AdaptiveSf(fblH,blank_box_id_height,1);
	         document.getElementById("ie_item_make").src="toMakePage.vs?cjzoom="+cjzoom;
	    	 $( "#sfv" ).val((cjzoom*100)+"%" );  
       }else{
    	     //document.getElementById("ie_item_make").src="toMakePage.vs?cjzoom="+cjzoom;
    	     $( "#sfv" ).val((cjzoom*100)+"%" ); 		
    	     var totalObjeck=document.getElementById("ie_item_make").contentWindow.document.getElementById("total");
   	         totalObjeck.innerHTML=ms;
             var topdiv=document.getElementById("ie_item_make").contentWindow.document.getElementById("topfd");
             total=topdiv.getAttribute("currenttotal");

             var bgname=topdiv.getAttribute("bgname");
	         if(bgname!=null&&bgname!=0){
	        	 document.getElementById("bgname").innerHTML=bgname;
	         }
             var bgaudio=topdiv.getAttribute("bgaudio");
        
	         if(bgaudio!=null&&bgaudio!=0){
	        	 document.getElementById("bgaudio").innerHTML=bgaudio;
	         }

             //判断节目有效期
	         if("<ww:property value='sp.validityCheck'/>"=="1"){
	        	 document.getElementById("validityCheck").checked=true;
	        	 document.getElementById("validitySdate").value="<ww:property value='sp.sdate' />";
	     		 document.getElementById("validityEdate").value="<ww:property value='sp.edate' />";
	         } 


             var checkStime="<ww:property value='#request.item.stime' />";

	         if(checkStime=="-1"){
	        	 $("[name = smartPlay]:checkbox").attr("checked", true);
	         }else{
	
	             $("#stime").val(<ww:property value='#request.item.stime' />);
	         }
                   
       }

       //easy渲染
	   myFrame.window.easyUi_reload();


	   //生成网格点坐标
	   createGridCoordinate(); 
  
    };


   //鼠标右键
   function jumptoie5() {
	
		if(divv.id==""){
			 divv=sel_div_touch();
	
	    }
	    if (myFrame.window.event.srcElement.id == "me1") {

		   //全屏   
		   if(divv.id.length>5)
		   {
	          max(divv);
		   }
	     }
	     else if (myFrame.window.event.srcElement.id == "me3") {

			 //删除     
	        if(divv.id.length>5)
	        {
		      divv.parentNode.removeChild(divv);   
	        }
	     }
	     else if (myFrame.window.event.srcElement.id == "me4") {

			//上一层     
		    if(divv.id.length>5)
		    {
			   c_up(divv);
		    }
	     } else if (myFrame.window.event.srcElement.id == "me5") {

			//下一层     
		   if(divv.id.length>5)
		   {
			   c_bottom(divv);
		   }
	     }else if (myFrame.window.event.srcElement.id == "me2") {
		     
		   //修改  
		   edit_div(divv);
	     }

	     //隐藏菜单
         myFrame.window.hidemenuie5();
	 
    }
   
    /*点击元素*/
    function getdocument(chirdren){
	 
    
	    if(chirdren.id==""){
	    	    
	    	  var selElementId=chirdren.offsetParent.id;
	    	  chirdren=toIdGetElement(selElementId);
	    	
	    }
		 /*坐标宽高*/ 
		document.getElementById("lwidth").value=  Math.round((chirdren.offsetWidth)/document.getElementById("sf").value);
		document.getElementById("lheight").value= Math.round((chirdren.offsetHeight)/document.getElementById("sf").value);
		document.getElementById("lleft").value= Math.round(chirdren.offsetLeft/document.getElementById("sf").value);
		document.getElementById("ltop").value= Math.round(chirdren.offsetTop/document.getElementById("sf").value);

		/*元素名称*/   
	    document.getElementById("lname").innerHTML=chirdren.id;

        /*元素类型*/
        var ctype=chirdren.id.substring(0,5);

        if(ctype!="topfd"){
	    	//chirdren.style.backgroundImage='url(image/edit_item.png)';
	    	//chirdren.style.backgroundSize="cover";
	    	//chirdren.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader ( sizingMethod='scale' , src='image/edit_item.png')";
	        //chirdren.style.backgroundSize="100% 100%";
	    	
	
	    	//chirdren.setAttribute('class','editcss');
	        //	chirdren.style.border="1px solid red";
	    	//chirdren.style.backgroundColor="red";
	    	//添加 img
	        // var img = document.createElement("img");
	         //设置 img 属性，如 id
	        // img.setAttribute("id", "newImg");
	         //设置 img 图片地址
	        // img.src = "image/txt_icon.png";
	
	         //img.style.width="95%";
		     //img.style.height="80%";
	         //chirdren.appendChild(img);
         }
     
         document.getElementById("currentdivid").value=chirdren.id;

         var ctypeShow="";
         
         //页面根据元素类型显示相应的文字说明
	     if(ctype=="image"){

			  ctypeShow="<ww:property value='#session.local.a00061' />";
		    
	     }else if(ctype=="video"){
		     
		      ctypeShow="<ww:property value='#session.local.a00060' />";
		      
	     }else if(ctype=="myppt"){
		     
		      ctypeShow="PPT";
		      
	     }else if(ctype=="mydoc"){
		     
		      ctypeShow="Word";
		      
	     }else if(ctype=="myxls"){
		     
		      ctypeShow="Excel";
		      
	     }else if(ctype=="mypdf"){
		     
		      ctypeShow="PDF";
		      
	     }else if(ctype=="fonts"){
		     
		      ctypeShow="<ww:property value='#session.local.a00062' />";
		      
	     }else if(ctype=="mynew"){
		     
		      ctypeShow="Rss";
		      
		 }else if(ctype=="mytqs"){
			 
			ctypeShow="<ww:property value='#session.local.a00177' />";
			
		 }else if(ctype=="mytim"){
			
			ctypeShow="<ww:property value='#session.local.a00248' />";
			
		 }else if(ctype=="htmls"){
			 
			ctypeShow="<ww:property value='#session.local.a00189' />";
			
		 }else if(ctype=="mycam"){
			 
			ctypeShow="<ww:property value='#session.local.a00692' />";
			
		 }else if(ctype=="qsing"){
			 
			ctypeShow="<ww:property value='#session.local.a00701' />";
			
		 }else if(ctype=="qmany"){
			 
			ctypeShow="<ww:property value='#session.local.a00700' />";
			
		 }else if(ctype=="seejp"){
			 
			ctypeShow="<ww:property value='#session.local.a00178' />";
			
		 }else if(ctype=="mybus"){
			 
			ctypeShow="<ww:property value='#session.local.a00774' />";
			
		 }else if(ctype=="charg"){
			 
			ctypeShow="<ww:property value='#session.local.b00090' />";
			
		 }else if(ctype=="sourc"){
			 
			    ctypeShow="<ww:property value='#session.local.a00996' />";
			
		 }else if(ctype=="dllIt"){
			 
			    ctypeShow="<ww:property value='#session.local.b00118' />";
			
		 }else if(ctype=="imggr"){
			 
				ctypeShow="<ww:property value='#session.local.b00127' />";
				
		 }else{
			 
			ctypeShow="";
			
	     }
		 document.getElementById("ltype").innerHTML=ctypeShow;
	
    }


     /*全屏*/
    function max(chirdren) {
        
		var topfd=get_container_object();
		chirdren.style.left="0px";
		chirdren.style.top="0px";
		chirdren.style.width=topfd.offsetWidth+"px";
		chirdren.style.height=topfd.offsetHeight+"px";
    }


     /*放大缩小场景*/
    function change_scene_size(cssType){
  
	     //取消选中元素	 
	     unElementBorder(); 

	     //获取当前缩放比
	     var scjzoom=document.getElementById("sf").value;

	     var topfd=get_container_object();
	
	     var divsVideo=topfd.getElementsByTagName("div");
	     
	     for(var i=0;i<divsVideo.length;i++){
		   var div =divsVideo[i];
		   var key=div.id.substring(0,5);
		   if(key=="video"){
			   div.style.backgroundImage='url(image/video.jpg)';
	       	   div.style.backgroundSize="cover";
	       	   div.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader ( sizingMethod='scale' , src='image/video.jpg')";
	           div.style.backgroundSize="100% 100%";

		   }

	     }
	
	     //1放大 2缩小
		if(cssType==1){
			
			if(scjzoom==1){
	           return;
			}
			scjzoom=parseFloat(scjzoom)+0.1;
			
	    }else if(cssType==2){

	    	if(scjzoom==0.3){
	        	
	        	layer.msg("<ww:property value='#session.local.b00055' />");
	            return;
	 		}
	    	scjzoom=parseFloat(scjzoom)-0.1;    	
    	
        } 
        scjzoom=scjzoom.toFixed(1); 
   
	    $( "#sfv" ).val((scjzoom*100)+"%" ); 
	
        var curzoom=cjzoom;
        
	    cjzoom=scjzoom;
	
	    if(cjzoom>1){
		   //alert("<ww:property value='#session.local.item_alert_max' />");
		   cjzoom=1;
		   return;
		}
        document.getElementById("sf").value=cjzoom;
        var mfile=document.getElementById("mfile").value;
        var sffile="";
        var bfile=""; 
        var index=topfd.title.indexOf("_");
	    if(index!=-1){
	    	bfile=topfd.title.split("_")[1];
	    }else{
	        bfile=topfd.title;
	    }
   
	    if(cjzoom==1){
		    
		    sffile=bfile;
		    topfd.style.backgroundImage="url(files/"+mfile+"/"+sffile+")";
    	    topfd.title=sffile;  
    	     
        }else{
            //缩放背景
            if(bfile!=""&&bfile!=undefined){
	
	    	    topfd.title=bfile;   
	            var bgtopfd="url(files/"+mfile+"/"+bfile+")"; 
	    	    topfd.style.backgroundImage=bgtopfd;
	    	    topfd.style.backgroundSize="cover";
	    	    topfd.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader ( sizingMethod='scale' , src='"+bgtopfd+"')";
	    	    topfd.style.backgroundSize="100% 100%";

	        }
	   }
	
   
       document.getElementById("sf").value=cjzoom;
       
	   //img
       var imgs=topfd.getElementsByTagName("img");
	   for(var i=0;i<imgs.length;i++){
		   var img =imgs[i];
	
		   img.style.left=Math.round((img.offsetLeft)*cjzoom/curzoom)+"px";
		   img.style.top=Math.round((img.offsetTop)*cjzoom/curzoom)+"px";
		   img.style.width= Math.round((img.offsetWidth)*cjzoom/curzoom)+"px";
		   img.style.height= Math.round((img.offsetHeight)*cjzoom/curzoom)+"px";	  
		
	   }
   
	   //div
       var divs=topfd.getElementsByTagName("div");
	   for(var i=0;i<divs.length;i++){
		   
		       var div =divs[i];
		       div.style.left=Math.round(div.offsetLeft*cjzoom/curzoom)+"px";
		       div.style.top=Math.round(div.offsetTop*cjzoom/curzoom)+"px";
		       div.style.width= Math.round(div.offsetWidth*cjzoom/curzoom)+"px";
		       div.style.height= Math.round(div.offsetHeight*cjzoom/curzoom)+"px";	  
		  
		       var fs=div.style.fontSize;
		       var lastIndex =fs.lastIndexOf('px');      
			   if (lastIndex > -1) {     
			            fs = fs.substring(0, lastIndex);   
			           
			   }
	   	       var lh= div.style.lineHeight;  
	   	       lastIndex = lh.lastIndexOf('px');
			   if (lastIndex > -1) {     
			        lh = lh.substring(0, lastIndex);   
			       
			   }	
		       var key=div.id.substring(0,5);
		       if(key=="codet"){}else if(key=="fonts"){	
			       div.style.lineHeight=Math.round(lh*cjzoom/curzoom)+"px";
			       div.style.fontSize=Math.round(fs*cjzoom/curzoom)+"px";
		       }else if(key=="mytim"){
			       fs=div.getAttribute("fs");
			       div.style.lineHeight=parseInt(fs*cjzoom*1.3)+"px";
			 
			   var mytimeWidht=Math.round(div.offsetWidth/cjzoom);
			   if(fs==24){
				   if(mytimeWidht<190){
					   div.style.width= Math.round(190*cjzoom)+"px";
				   }   
			   }else if(fs==36){
				   
				   if(mytimeWidht<290){
					   div.style.width= Math.round(290*cjzoom)+"px";
				   } 
			   }else if(fs==48){
				   if(mytimeWidht<370){
					   div.style.width= Math.round(370*cjzoom)+"px";
				   } 
			   }else if(fs==60){
				   if(mytimeWidht<480){
					   div.style.width= Math.round(480*cjzoom)+"px";
				   } 
			   }else if(fs==72){
				   if(mytimeWidht<560){
					   div.style.width= Math.round(560*cjzoom)+"px";
				   } 
			   }
			   
	           div.style.fontSize=parseInt(fs*cjzoom)+"px";
	           
		   }else{
			  
			   div.style.lineHeight=Math.round(fs*cjzoom/curzoom)+"px";
			   div.style.fontSize=Math.round(fs*cjzoom/curzoom)+"px";
		   }
	  }

	
	  //缩放操作区大小
	  topfd.style.width= Math.round(topfd.offsetWidth*cjzoom/curzoom)+"px";
	  topfd.style.height= Math.round(topfd.offsetHeight*cjzoom/curzoom)+"px";

    }


/*************************素材弹出区*****************************/    

    //弹出背景
    function open_win_bj(){
        
      //获取输入框焦点  
	  get_focus();
	 
	  //获取缩放
	  var sf=document.getElementById("sf").value;
	  window.returnValue=""; 

	  var topdiv=get_container_object();

	  //素材名
	  var bgname =topdiv.getAttribute("bgname");

	  //素材fileName名
	  var bgnameUrl=topdiv.getAttribute("bgnameUrl");

	  //0表示为无场景
	  if(bgname=="0"){
		 bgname="null";
		 bgnameUrl="null";
	  } 
	  //弹窗
	  layer.open({
			type: 2,
	        area: ['900px', '525px'],
	        offset: '40px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: 'toscenebj.vs?sucai.type=1&gssi.sucaigroupid=0&sf='+sf+"&bgname="+bgname+"&bgnameUrl="+bgnameUrl,
	        scrollbar: false,
	        end: function(){ 
				 if(window.returnValue==undefined||window.returnValue==""){
				     window.returnValue=""; 			            
				 }else{
					 var rv=window.returnValue;

					 //获取协议信息
					 if(rv=="unbj"){
						 topdiv.style.backgroundImage="url(files/"+rv+")";
					     topdiv.title=rv.split("/")[1];
					     topdiv.setAttribute("bgname","0");
					     document.getElementById("bgname").innerHTML="";
					 }else{
						
						 var rvs=rv.split("$");
						 var bgtopfd="url(files/"+rvs[0]+")";
						 topdiv.title=rvs[0].split("/")[1];
						 topdiv.style.backgroundImage=bgtopfd;
						 topdiv.style.backgroundSize="cover";
						 topdiv.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader ( sizingMethod='scale' , src='"+bgtopfd+"')";
						 topdiv.style.backgroundSize="100% 100%";
                         topdiv.setAttribute("bgname",rvs[1]);
					     topdiv.setAttribute("bgnameUrl",rvs[0].split("/")[1]);
					     document.getElementById("bgname").innerHTML=rvs[1];
                     }
					
				  }            
			  }
		 });
      }

      /*(新手指引)弹出图片*/
      function open_win_img_1(){

	       intro.exit();
	       $("#step3 a").attr("onclick","open_win_img();");
	
	       get_focus();
		   var mfile=document.getElementById("mfile").value;
		   var topdiv=get_container_object();
	
	
	       //获取缩放
	       var sf=document.getElementById("sf").value;
	       window.returnValue=""; 
	       layer.open({
				type: 2,
		        area: ['900px', 525+'px'],
		        offset: '40px',
		        title:false,
		        fix:false, //不固定
		        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		        content: 'tosceneimg.vs?sucai.type=4&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile+"&openIntro=1",
		        scrollbar: false,
		        end: function(){ 
			        
					 if(window.returnValue==undefined||window.returnValue==""){
					     window.returnValue=""; 			            
					 }else{
	
						 	intro.goToStep(3).start();
						    
						    //解析json 
						    var rv=window.returnValue;
						    rv=rv.replace(/&quot;/g,"\"");
				            //转换成touch对象组
						    var objs = eval( "(" + rv + ")" );//转换后的JSON对象
	                        
	                        //获取素材播放时长
	                        var ptime=objs.mPlayTimes;
	                        //创建元素
	                        var add = document.createElement("img");
	                        add.id="image"+total;
	                        add.innerHTML="image"+total;
							add.src="files/"+mfile+"/"+objs.mMediaList[0].path;					
							add.style.width=Math.round((objs.mWidth)*sf)+"px";
							add.style.height=Math.round((objs.mHeight)*sf)+"px";
							add.style.left=Math.round((objs.mLeft)*sf)+"px";
							add.style.top=Math.round((objs.mTop)*sf)+"px";	
							add.style.position="absolute"; 
	                        add.style.opacity="0.8";
							add.style.filter= 'alpha(opacity=80)';
							add.style.zIndex=total;
							
							add.setAttribute("onmousedown",'showmenuie5(event)');
							add.setAttribute("onmouseup",'showgrid(event)');
							//播放时长
							add.setAttribute("ptime",ptime);
							//数据源
							add.setAttribute("jsonData",rv);
							//按比列显示
							//add.setAttribute("bls",rv2[1]);
	                        add.className="easyui-resizable easyui-draggable";
							add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
							
							total++;
							topdiv.appendChild(add);
	
							//easy渲染
							myFrame.window.easyUi_reload(); 
							//获取播放时长
						    get_item_time();
					 }
				              
				}
		   });
      }
      /*弹出图片*/
      function open_win_img(){
          
	      get_focus();
	      var mfile=document.getElementById("mfile").value;
	      var topdiv=get_container_object();
	      var sf=document.getElementById("sf").value;
          window.returnValue=""; 
	      layer.open({
		      
			  type: 2,
	          area: ['900px', 525+'px'],
	          offset: '40px',
	          title:false,
	          fix:false, //不固定
	          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	          content: 'tosceneimg.vs?sucai.type=4&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile,
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
                        var add = document.createElement("img");
                        add.id="image"+total;
                        add.innerHTML="image"+total;
						add.src="files/"+mfile+"/"+objs.mMediaList[0].path;					
						add.style.width=Math.round((objs.mWidth)*sf)+"px";
						add.style.height=Math.round((objs.mHeight)*sf)+"px";
						add.style.left=Math.round((objs.mLeft)*sf)+"px";
						add.style.top=Math.round((objs.mTop)*sf)+"px";	
						add.style.position="absolute"; 
                        add.style.opacity="0.8";
						add.style.filter= 'alpha(opacity=80)';
						add.style.zIndex=total;

						
						add.setAttribute("onmousedown",'showmenuie5(event)');
						add.setAttribute("onmouseup",'showgrid(event)');

						
						//播放时长
						add.setAttribute("ptime",ptime);
						//数据源
						add.setAttribute("jsonData",rv);
						//按比列显示
						//add.setAttribute("bls",rv2[1]);
                        add.className="easyui-resizable easyui-draggable";
						add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
						
						total++;
						topdiv.appendChild(add);

						//easy渲染
						myFrame.window.easyUi_reload(); 
						
					    get_item_time();
				 }           
			}
		});
     }



      /*弹出图片组*/
      function open_win_imgGroup(){
          
	      get_focus();
	      var mfile=document.getElementById("mfile").value;
	      var topdiv=get_container_object();
	      var sf=document.getElementById("sf").value;
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
			            //转换成touch对象组
					    var objs = eval( "(" + rv + ")" );//转换后的JSON对象
                        
                        //获取素材播放时长
                        var ptime=objs.mPlayTimes;
                        //创建元素
                        var add = document.createElement("div");
                        
                        add.id="imggr"+total;

                        add.innerHTML="<ww:property value='#session.local.b00127'  />"+total;
										
						add.style.width=Math.round((objs.mWidth)*sf)+"px";
						add.style.height=Math.round((objs.mHeight)*sf)+"px";
						add.style.left=Math.round((objs.mLeft)*sf)+"px";
						add.style.top=Math.round((objs.mTop)*sf)+"px";	
						add.style.position="absolute"; 
                        add.style.opacity="0.8";
						add.style.filter= 'alpha(opacity=80)';
						add.style.fontSize=Math.round(36*sf)+"px";
						add.style.fontFamily="微软雅黑";
						add.style.color="#FFFFFF";
						add.style.backgroundColor="#000000";
						add.style.zIndex=total;

						
						add.setAttribute("onmousedown",'showmenuie5(event)');
						add.setAttribute("onmouseup",'showgrid(event)');
						//播放时长
						add.setAttribute("ptime",0);
						//数据源
						
						add.setAttribute("jsonData",rv);
						//按比列显示
						//add.setAttribute("bls",rv2[1]);
                        add.className="easyui-resizable easyui-draggable";
						add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
						
						total++;
						topdiv.appendChild(add);

						//easy渲染
						myFrame.window.easyUi_reload(); 
						
					   
				 }           
			}
		});
     }

      

     /*(新手指引)弹出视频*/
    function open_win_video_1(){

		intro.exit();
		$("#step2 a").attr("href","javascript:open_win_video();");
		get_focus();
	    var mfile=document.getElementById("mfile").value;
		var sf=document.getElementById("sf").value;
		var topdiv=get_container_object();
		window.returnValue=""; 
		layer.open({
				type: 2,
				area: ['950px', 526+'px'],
		        offset: '40px',
		        title:false,
		        fix: false, //不固定
		        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		        content: 'toscenevideo.vs?sucai.type=3&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile+"&openIntro=1",
		        scrollbar: false,
		        end: function(){ 
			         
					 if(window.returnValue==undefined||window.returnValue==""){
					     window.returnValue=""; 			            
					 }else{

						 	intro.goToStep(2).start();
						 	$("#step3 a").attr("onclick","open_win_img_1();");
						 
						    //解析json 
						    var rv=window.returnValue;
						    rv=rv.replace(/&quot;/g,"\"");
				            //转换成touch对象组
						    var objs = eval( "(" + rv + ")" );//转换后的JSON对象
				            //获取素材播放时长
				            var ptime=objs.mPlayTimes;
				            document.getElementById("stime").value=ptime;

                            var add=document.createElement("div");
							add.id="video"+total;
						
							add.style.width=Math.round(objs.mWidth*sf)+"px";
							add.style.height=Math.round(objs.mHeight*sf)+"px";
							add.style.left=Math.round(objs.mLeft*sf)+"px";
							add.style.top=Math.round(objs.mTop*sf)+"px";
							add.style.position="absolute"; 
	                        add.style.opacity="0.8";
							add.style.filter= 'alpha(opacity=80)';
						
	                        add.style.zIndex=total;

	                        add.style.backgroundImage='url(image/video.jpg)';
	                    	add.style.backgroundSize="cover";
	                    	add.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader ( sizingMethod='scale' , src='image/video.jpg')";
	                        add.style.backgroundSize="100% 100%";
	                       
							add.setAttribute("onmousedown",'showmenuie5(event)');
							
							add.setAttribute("onmouseup",'showgrid(event)');
							//播放时长
							add.setAttribute("ptime",ptime);
							//数据源
							add.setAttribute("jsonData",rv);
							
                            add.className="easyui-resizable easyui-draggable";
                            add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
							add.innerHTML="video"+total;
  
							total++;
							topdiv.appendChild(add);
							//easy渲染
							myFrame.window.easyUi_reload();  
                            //获取元素播放时长
							get_item_time();
					 }
				              
				}
		});
    }

    /*弹出视频*/
    function open_win_video(){
	    get_focus();
	    var mfile=document.getElementById("mfile").value;
		var sf=document.getElementById("sf").value;
		var topdiv=get_container_object();
		window.returnValue=""; 
		layer.open({
				type: 2,
				area: ['950px', 526+'px'],
		        offset: '40px',
		        title:false,
		        fix: false, //不固定
		        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		        content: 'toscenevideo.vs?sucai.type=3&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile,
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
				            document.getElementById("stime").value=ptime;
						
                            var add=document.createElement("div");

                            add.id="video"+total;
						
							add.style.width=Math.round(objs.mWidth*sf)+"px";
							add.style.height=Math.round(objs.mHeight*sf)+"px";
							add.style.left=Math.round(objs.mLeft*sf)+"px";
							add.style.top=Math.round(objs.mTop*sf)+"px";
							add.style.position="absolute"; 
	                        add.style.opacity="0.8";
							add.style.filter= 'alpha(opacity=80)';
							add.style.zIndex=total;

	                    	add.style.backgroundImage='url(image/video.jpg)';
	                    	add.style.backgroundSize="cover";
	                    	add.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader ( sizingMethod='scale' , src='image/video.jpg')";
	                        add.style.backgroundSize="100% 100%";
	                    
							add.setAttribute("onmousedown",'showmenuie5(event)');
							add.setAttribute("onmouseup",'showgrid(event)');
							//播放时长
							add.setAttribute("ptime",ptime);
							//数据源
							add.setAttribute("jsonData",rv);
							
                            add.className="easyui-resizable easyui-draggable";
                            add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
							add.innerHTML="video"+total;
  
							total++;
							topdiv.appendChild(add);
							//easy渲染
							myFrame.window.easyUi_reload();  
                            //获取元素播放时长
							get_item_time();
					  }         
				   }
		     });
       }

       /*弹出音频*/
       function open_win_audio(){
	        get_focus(); 
	        var mfile=document.getElementById("mfile").value;
	        var yxSucaiListJson="";
	        var yxmusics=document.getElementById("ie_item_make").contentWindow.document.getElementById("video10000");
	  
		    if(yxmusics!=null){
				   yxSucaiListJson=yxmusics.getAttribute("jsonData");
				   if(yxSucaiListJson!=null){
						yxSucaiListJson=yxSucaiListJson.replace(/"/g,"'"); 
				   }
	        }
		    window.returnValue=""; 
		    layer.open({
			    
				type: 2,
				area: ['900px', 525+'px'],
 		        offset: '40px',
		        title:false,
		        fix: false, //不固定
		        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		        content: 'tosceneaudio.vs?sucai.type=2&gssi.sucaigroupid=0&mfile='+mfile+"&yxSucaiListJson="+yxSucaiListJson,
		        scrollbar: false,
		        end: function(){ 
					    
					    if(window.returnValue==undefined||window.returnValue==""){
						     window.returnValue=""; 			            
						}else  if(window.returnValue=="clear"){
						        
								if(yxmusics!=null){
									yxmusics.parentNode.removeChild(yxmusics); 
									document.getElementById("bgaudio").innerHTML="";
									var topdiv=document.getElementById("ie_item_make").contentWindow.document.getElementById("topfd"); 
									topdiv.setAttribute("bgaudio","0");
							    } 
							    
						 }else{
							    //解析json 
							    var rv=window.returnValue;
							    rv=rv.replace(/&quot;/g,"\"");
					            //转换成touch对象组
							    var objs = eval( "(" + rv + ")" );//转换后的JSON对象
					
							    //获取素材播放时长
					            var ptime=objs.mPlayTimes;
					               
								document.getElementById("stime").value=ptime;
						       
								if(yxmusics!=null){
									yxmusics.parentNode.removeChild(yxmusics);    
							    }
							    
								var topdiv=get_container_object();
					
					            var add=document.createElement("div");

					            add.id="video10000";
								add.style.width="1px";
								add.style.height="1px";
								add.style.posLeft=1;
								add.style.posTop=1;
								add.style.position="absolute"; 
					
					            add.onmousemove= function pos(){ 
									myFrame.window.pos(add);   
								};
								
								add.setAttribute("onmousemove",'pos(this)');
								//播放时长
								add.setAttribute("ptime",ptime);
								//数据源
								add.setAttribute("jsonData",rv);
								
								topdiv.appendChild(add);
					            //document.getElementById("bgaudio").innerHTML=rv2[1]; 
								//topdiv.setAttribute("bgaudio",rv2[1]);
								get_item_time();
						 }	 	   
		           }	
		    });
      }

      /*弹出office*/
      function open_win_office(myoffice){
          
	       get_focus();
	        
	       var mfile=document.getElementById("mfile").value;

	       var sf=document.getElementById("sf").value;
	       
	       var url="";
	       
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
	           offset: '30px',
	           title:false,
	           fix: false, //不固定
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
                        var topdiv=get_container_object();
                        //获取素材播放时长
                        var ptime=objs.mPlayTimes;
                        //创建元素
                        var add = document.createElement("img");

                        add.id=myoffice+total;
                        add.src="files/"+mfile+"/"+objs.mMediaList[0].path;
                        				
						add.style.width=Math.round(objs.mWidth*sf)+"px";
						add.style.height=Math.round(objs.mHeight*sf)+"px";
						add.style.left=Math.round(objs.mLeft*sf)+"px";
						add.style.top=Math.round(objs.mTop*sf)+"px";
						add.style.position="absolute"; 
                        add.style.opacity="0.8";
						add.style.filter= 'alpha(opacity=80)';
						add.style.zIndex=total;
						
						add.setAttribute("onmousedown",'showmenuie5(event)');
						add.setAttribute("onmouseup",'showgrid(event)');

						
						
						//播放时长
						add.setAttribute("ptime",ptime); 
						//数据源
						add.setAttribute("jsonData",rv);
						
						add.className="easyui-resizable easyui-draggable";
						add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");

						
 						 
                        total++;
 					    topdiv.appendChild(add);
 					    //easy渲染
						myFrame.window.easyUi_reload();  

						get_item_time(); 
				   }        
			   }
		  });
      }

      /*弹出时间*/
     function open_win_time(){
         
	      get_focus();
          layer.open({
			type: 2,
	        area: ['800px', '500px'],
	        offset: '20px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: "toadtime.vs",
	        scrollbar: false,
	        end: function(){ 
		         
			    if(window.returnValue==undefined||window.returnValue==""){
				    
			       window.returnValue="";
			        			            
			    }else{
				   
				      var rv=window.returnValue;
				      //时间类型/计时类型@显示类型@字体大小@字体颜色@天@时@分@秒@计时时间点@x@y@w@h
				      rv=rv.replace(/&quot;/g,"\"");
			          //转换成touch对象组
					  var obj= eval( "(" + rv + ")" );//转换后的JSON对象
                      var xy_x=0;
                      var xy_y=0;
                      var w=600;
                      var h=300;  
				      var sf=document.getElementById("sf").value;  
				      var topdiv=get_container_object();  
				      var add=document.createElement("div");
				      
                      add.id="mytime"+total;
                      
					  //add.title=res[0]+"@"+res[1]+"@"+res[2]+"@"+res[3]+"@"+res[4]+"@"+res[5]+"@"+res[6]+"@"+res[7]+"@"+res[8];

					  add.style.width=Math.round(w*sf)+"px";
					  add.style.height=Math.round(h*sf)+"px";
					  add.style.left=Math.round(xy_x*sf)+"px";
					  add.style.top=Math.round(xy_y*sf)+"px";

					  add.style.position="absolute"; 
					  add.style.opacity="0.8";
					  add.style.filter= 'alpha(opacity=80)';
					  add.style.fontFamily="微软雅黑";
					
					  add.style.color="#"+obj.fcolor;
					 
					  add.style.backgroundColor="#6BBFFF";
					  
					  add.style.fontSize=Math.round(obj.fs*sf)+"px";
					  add.style.lineHeight=Math.round(obj.fs*sf)*1.3+"px"; 
					  
					  add.style.zIndex=total;
					  
					  add.setAttribute("onmousedown",'showmenuie5(event)');
					  add.setAttribute("onmouseup",'showgrid(event)');

					  add.setAttribute("tType",obj.tType);

					  add.setAttribute("tsType",obj.tsType);

					  add.setAttribute("fs",obj.fs);

					  add.setAttribute("fcolor",obj.fcolor);

					  add.setAttribute("ttDa",obj.ttDa);

					  add.setAttribute("ttHo",obj.ttHo);

					  add.setAttribute("ttMi",obj.ttMi);

					  add.setAttribute("ttSs",obj.ttSs);

					  add.setAttribute("ttTimePoint",obj.ttTimePoint);

					  add.setAttribute("advancedType",obj.advancedType);

					  add.setAttribute("unitShow",obj.unitShow);

					 

					   //数据源
					  add.setAttribute("jsonData",rv);
					
					  var mytimContent=getTimeShowStyle(obj.tType,obj.tsType,obj.ttDa,obj.ttHo,obj.ttMi,obj.ttSs,obj.unitShow); 
			
					  add.innerHTML = mytimContent;

					  add.className="easyui-resizable easyui-draggable";
					  
					  add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");

					  total++;
					  topdiv.appendChild(add);
					  //easy渲染
					  myFrame.window.easyUi_reload();   
					
				    
			     }			              
			  }
		  });
     }
     /*弹出网页*/
     function open_win_html(){

	     get_focus();
	     window.returnValue=""; 
	     layer.open({
			type: 2,
	        area: ['850px', '500px'],
	        offset: '40px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: "toadhtml.vs",
	        scrollbar: false,
	        end: function(){ 
		         
					if(window.returnValue==undefined||window.returnValue==""){
					     window.returnValue=""; 			            
					}else{
						//x*y*w*h*刷新时间*滚动*网页地址--切换时间@网页地址--切换时间
						var rv=window.returnValue;
						
						var tres=rv.split('*');
						rv=tres[0];
						
					    var xy_x=tres[0];
			            var xy_y=tres[1];
						//var c1=tres[2].split('_');
						var w=tres[2];
						var h=tres[3];
						var times=tres[4];
						var sf=document.getElementById("sf").value;  
						var topdiv=get_container_object();
					    
					    var gun=tres[5];


					    var add=document.createElement("div");
						add.id="htmls"+total;
						add.title=tres[4]+"*"+tres[5]+"*"+tres[6];

						add.style.width=Math.round(w*sf)+"px";
						add.style.height=Math.round(h*sf)+"px";
						add.style.left=Math.round(xy_x*sf)+"px";
						add.style.top=Math.round(xy_y*sf)+"px";
						

						add.style.position="absolute"; 
	                    add.style.opacity="0.8";
						add.style.filter= 'alpha(opacity=80)';
					
	                    add.style.zIndex=total;

	                    add.style.fontSize=Math.round(36*sf)+"px";
						add.style.fontFamily="微软雅黑";
						add.style.color="#00000";
						add.style.backgroundColor="#3CB371";

						
						add.innerHTML="htmls"+total;
						add.setAttribute("onmousedown",'showmenuie5(event)');
						add.setAttribute("onmouseup",'showgrid(event)');
	                    add.setAttribute("time",tres[4]);
	                    add.setAttribute("gun",tres[5]);

	                   
	                    add.setAttribute("sortableListSpans",tres[6]); 
						
	                    add.className="easyui-resizable easyui-draggable";
	                    add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
	 					total++;
	 					topdiv.appendChild(add);
	 					  //easy渲染
	 					 myFrame.window.easyUi_reload();   
                       
					   }
			     }
		   });
      }
      /*弹出天气*/
      function open_win_tq(){
          
	      get_focus();
	      
	      var topdiv=get_container_object();
	
	      var sf=document.getElementById("sf").value;  
	      
	      window.returnValue=""; 
	      
	      layer.open({
			type: 2,
	        area: ['800px', '500px'],
	        offset: '20px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: "toadtq.vs?sf="+sf,
	        scrollbar: false,
	        end: function(){
	               
				 if(window.returnValue==undefined||window.returnValue==""){
				     window.returnValue=""; 			            
				}else{
					//x*y*w*h*刷新时间*字体大小*字体颜色*城市--切换时间@城市--切换时间*样式
					var rv=window.returnValue;
					var tres=rv.split('*');
					
					var w=tres[2];
					var h=tres[3];
				    var xy_x=tres[0];
		            var xy_y=tres[1];

				    var add=document.createElement("div");
					add.id="mytqs"+total;
					add.title=tres[4]+"*"+tres[5]+"*"+tres[6]+"*"+tres[7]+"*"+tres[8];

					add.style.width=Math.round(w*sf)+"px";
					add.style.height=Math.round(h*sf)+"px";
					add.style.left=Math.round(xy_x*sf)+"px";
					add.style.top=Math.round(xy_y*sf)+"px";
					
					add.style.position="absolute"; 
                    add.style.opacity="0.8";
					add.style.filter= 'alpha(opacity=80)';
				
                    add.style.zIndex=total;

                    add.style.fontSize=Math.round(36*sf)+"px";
					add.style.fontFamily="微软雅黑";
					add.style.color="#000000";
					add.style.backgroundColor="#8DB6CD";
					add.innerHTML="mytqs"+total;

					add.setAttribute("onmousedown",'showmenuie5(event)');
					add.setAttribute("onmouseup",'showgrid(event)');
                    add.setAttribute("fresh",tres[4]);
                    add.setAttribute("dx",tres[5]);
                    add.setAttribute("wfcolor",tres[6]);
                    add.setAttribute("sortableListSpans",tres[7]);
					  
                    add.className="easyui-resizable easyui-draggable";
                    add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
 					total++;
 					topdiv.appendChild(add);
 					//easy渲染
 					myFrame.window.easyUi_reload();      
				 }	
	          }
	     });
     }
      
     /*弹出截屏*/
     function open_win_screen(){
         
	     get_focus();
	     
	     var topdiv=get_container_object();
	     
	     var sf=document.getElementById("sf").value;
	       
	     window.returnValue=""; 

		 layer.open({

			 type: 2,
	         area: ['800px', '500px'],
	         offset: '20px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: "toadscreen.vs",
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
				    var add=document.createElement("div");
                    add.id="seejp"+total;
				    add.title=timee;
				 
				    add.style.width=Math.round(w*sf)+"px";
				    add.style.height=Math.round(h*sf)+"px";
				    add.style.left=Math.round(xy_x*sf)+"px";
				    add.style.top=Math.round(xy_y*sf)+"px";
				  
				    add.style.fontSize=Math.round(36*sf)+"px";
				    add.style.fontFamily="微软雅黑";
				    add.style.color="#000000";
				    add.style.backgroundColor="#607B8B";


				    add.innerHTML="seejp"+total;
				    add.style.position="absolute"; 
				    add.style.opacity="0.8";
				    add.style.filter= 'alpha(opacity=80)';
				    add.style.zIndex=total;
				 
				    add.setAttribute("onmousedown",'showmenuie5(event)');
				    add.setAttribute("onmouseup",'showgrid(event)');
               
				    add.setAttribute("timee",timee);
				    add.setAttribute("allowTransparency",'true');
				    add.setAttribute("scrolling",'no');
				    add.setAttribute("marginwidth",'0');
				    add.setAttribute("marginheight",'0');
				    add.setAttribute("frameborder",'0');
                    add.setAttribute("jpsrc",rv);
				    add.className="easyui-resizable easyui-draggable";
				    add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
				    total++;
				    topdiv.appendChild(add);
				    //easy渲染
				    myFrame.window.easyUi_reload();     
				 }	
	           }
	      });
     }
     
     /*弹出RSS*/
     function open_win_rss(){

		     get_focus();
		     var topdiv=get_container_object();
		     var divss=topdiv.getElementsByTagName("div");

		     for(var i = 0;i<divss.length;i++)
		     {
				    div=divss[i];
				    var key=div.id.substring(0,5); 
				    if(key=="mynew")
					{
				    	layer.msg("<ww:property value='#session.local.a00328' />");
						return
					}
	
		      }

	          var sf=document.getElementById("sf").value;  
	          window.returnValue=""; 
	          
	          layer.open({

					type: 2,
					area: ['800px', '550px'],
					offset: '20px',
					title:false,
					fix: false, //不固定
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
								
								var add=document.createElement("div");
				                add.id="mynew"+total;
								add.title=timee;
			                    add.style.width=Math.round(w*sf)+"px";
				 				add.style.height=Math.round(h*sf)+"px";
				 				add.style.left=Math.round(xy_x*sf)+"px";
				 				add.style.top=Math.round(xy_y*sf)+"px";
			
				 				add.style.fontSize=Math.round(36*sf)+"px";
				 				add.style.fontFamily="微软雅黑";
				 				add.style.color="#000000";
				 				add.style.backgroundColor="#9F79EE";
				 				  
								add.style.position="absolute"; 
								add.style.opacity="0.8";
								add.style.filter= 'alpha(opacity=80)';
								add.style.zIndex=total;
								add.innerHTML="mynew"+total;
								add.setAttribute("timee",timee);
								add.setAttribute("onmousedown",'showmenuie5(event)');
								add.setAttribute("onmouseup",'showgrid(event)');					
								add.setAttribute("rsssrc",rv);
				 				add.className="easyui-resizable easyui-draggable";
				 				add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
				 				total++;
				 				topdiv.appendChild(add);
				 				  //easy渲染
				 				myFrame.window.easyUi_reload(); 
							  }   
					      }
					 });
          }
     
          /*弹出文本*/
          function open_win_txt(){
              
	          get_focus();
	          window.returnValue=""; 
	          layer.open({
		          
					    type: 2,
				        area: ['600px', '400px'],
				        offset: '80px',
				        title:false,
				        fix: false, //不固定
				        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
				        content: "totxt.vs",
				        scrollbar: false,
				        end: function(){
				            if(window.returnValue==undefined||window.returnValue==""){
							     window.returnValue=""; 			            
							}else{
								 var rv=window.returnValue;
								 var tres=rv.split('|');
							   	 var w=tres[1];
							   	 var h=tres[2];
							     var xy_x=0;
					             var xy_y=0;
								 if(tres.length==5){
									xy_x=tres[3];
									xy_y=tres[4];
								 }
								 
								  var topdiv=get_container_object();
								  
								  var sf=document.getElementById("sf").value;  
					            
					              var add=document.createElement("div");
			                      add.id="fonts"+total;
								  add.title=tres[0];
								  add.style.width=Math.round(w*sf)+"px";
				 				  add.style.height=Math.round(h*sf)+"px";
				 				  add.style.left=Math.round(xy_x*sf)+"px";
				 				  add.style.top=Math.round(xy_y*sf)+"px";
								  add.style.position="absolute"; 
								  add.style.overflow="auto";
								  add.style.border="1px solid #000000";
								  add.style.fontFamily="<ww:property value='#session.local.a00374' />";
								  add.style.fontSize=parseInt(24*sf)+"px";
								  add.style.lineHeight=parseInt(24*sf)+"px";
								  add.style.zIndex=total;					 
			                      add.setAttribute("fontSize",24);
			                      add.setAttribute("lineHeight",24);
			                      add.setAttribute("onmousedown",'showmenuie5(event)');
			                      add.setAttribute("onmouseup",'showgrid(event)');
			  					
				 				  add.className="easyui-resizable easyui-draggable";
				 				  add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
				 				  total++;
				 				  topdiv.appendChild(add);
				 				  //easy渲染
				 				  myFrame.window.easyUi_reload();  				  
							 }
				         }
				   });
          }
          
         /*弹出汇率 */
         function open_win_hl(){

 	             get_focus();
   
                 window.returnValue=""; 

	             layer.open({
		             
							type: 2,
					        area: ['1200px', '500px'],
					        offset: '80px',
					        title:false,
					        fix: false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: "todatahl.vs?edittype=0",
					        scrollbar: false,
					        end: function(){
						      
						        if(window.returnValue==undefined||window.returnValue==""){
								     window.returnValue=""; 			            
								}else{
									//x|y|宽|高|显示行(多个用',')|显示列(多个用',')|字体颜色|字体大小|url|刷新时间
									var rv=window.returnValue;
									var tres=rv.split('|');
									
									
									//var c1=tres[2].split('_');
									var w=tres[2];
									var h=tres[3];
									//var tcd=(c1.split('_'))[1];
									//var topdiv = document.getElementById("topfd");
									var topdiv=document.getElementById("ie_item_make").contentWindow.document.getElementById("topfd");
								    var xy_x=tres[0];
					                var xy_y=tres[1];
									
									var html_show=tres[8];
								    
				                   var sf=document.getElementById("sf").value;  
				
									//var add = document
									//.createElement("<iframe  gun='"+c1.split('_')[0]+"' onMouseOver='setpdiv(this)'  onmousemove='pos(this)' title='"+times+"' class='"+c1+"' scrolling='no' id='htmls"+total+"'     style='filter:progid:DXImageTransform.Microsoft.Alpha(opacity=80);top:0px;left:0px;width:"+w*sf+"px;height:"+h*sf+"px;POSITION: absolute;z-index:"+total+";border:0px;left:"+xy_x*sf+"px;top:"+xy_y*sf+"px;' marginwidth='0'  marginheight='0' frameborder='0'  src='"+rv+"' />");
									  var add=document.createElement("iframe");
				                      add.id="myhls"+total;
									  //add.title=times;
									  add.src=html_show;
									  add.style.width=w*sf+"px";
									  add.style.height=h*sf+"px";
									  add.style.posLeft=xy_x*sf;
									  add.style.posTop=xy_y*sf;
									  add.style.position="absolute"; 
									  add.style.opacity="0.8";
									  add.style.filter= 'alpha(opacity=80)';
									  add.style.zIndex=total;
									  add.onmousemove= function pos(){ 
											myFrame.window.pos(add);   
									  };
									 
									  add.setAttribute("onmousemove",'pos(this)');
									  add.setAttribute("onmouseup",'showgrid(event)');
									  
									  add.setAttribute("scrolling",'no');
									  add.setAttribute("marginwidth",'0');
									  add.setAttribute("marginheight",'0');
									  add.setAttribute("frameborder",'0');
									  add.setAttribute("html_show",html_show);
									  add.setAttribute("ssrc",html_show);
									  add.setAttribute("hlFontColor",tres[6]);
									  add.setAttribute("hlFontSize",tres[7]);
									  add.setAttribute("hlRtime",tres[9]);
									  add.setAttribute("cskeystrs",tres[4]);
									  add.setAttribute("symbolstrs",tres[5]);
									  
									  add.title=tres[9];
				                      total++;
							          topdiv.appendChild(add);
				                    
								}
					        
					        }
					 });
            }
           /*弹出文档*/
           function open_win_doc(){
               
 	            get_focus();
 	            var mfile=document.getElementById("mfile").value;
 	            var topdiv=get_container_object();
 	            setLayerBigDataParameter("");
 	            //获取缩放
 	            var sf=document.getElementById("sf").value;
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
							
							var topdiv=document.getElementById("ie_item_make").contentWindow.document.getElementById("topfd");
							var add=document.createElement("div");
							  add.id="fonts"+total;
							  add.title=tres[7]+"-"+tres[8];
							  add.style.width=Math.round(w*sf)+"px";
			 				  add.style.height=Math.round(h*sf)+"px";
			 				  add.style.left=Math.round(xy_x*sf)+"px";
			 				  add.style.top=Math.round(xy_y*sf)+"px";
							  add.style.position="absolute"; 
							  add.style.overflow="auto";
							  //add.style.border="1px solid #000000";
							  add.style.backgroundColor="#EEA2AD";
							  add.style.fontFamily=tres[4];
							  add.style.fontSize=Math.round(tres[5]*sf)+"px";
							  
							  add.style.lineHeight=Math.round(Math.round(tres[5]*tres[6])*sf)+"px";
							  add.style.zIndex=total;
							  add.innerHTML=tres[9];
							  
		                      add.setAttribute("fontSize",tres[5]);
		                      add.setAttribute("lineHeight",parseInt(tres[5]*tres[6]));
		                      add.setAttribute("onmousedown",'showmenuie5(event)');
		                      add.setAttribute("onmouseup",'showgrid(event)');
		                      add.className="easyui-resizable easyui-draggable";
		                      add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
		
		
			 				  add.setAttribute("fonttype",tres[4]);     //字体类型
		                      add.setAttribute("txtfontsize",tres[5]);  //字体大小
		                      add.setAttribute("lineH",tres[6]);        //字距
		                      add.setAttribute("gdtype",tres[7]);       //滚动方式
		                      add.setAttribute("gdspeed",tres[8]);      //滚动速度 
		                     
		                      add.setAttribute("backcolor",tres[10]);   //背景颜色
		                      add.setAttribute("fontcolor",tres[11]);   //字体颜色 
		
		                      add.setAttribute("fbold",tres[12]);       //加粗
							  add.setAttribute("fitallic",tres[13]);    //斜体
							  add.setAttribute("fsetline",tres[14]);    //下划线
							  add.setAttribute("fsetstrike",tres[15]);  //中线
		
							  
							  add.setAttribute("textDataSource",tres[16]);  //数据来源
		
							  
							  add.setAttribute("advancedType",tres[17]);  //设置字体大小 0普通 1高级
		
							  //add.setArrribute("fontContent",tres[9]);  //文本内容
			 				  
		                     
		                      topdiv.appendChild(add);
		  					  total++;
		  					  //easy渲染
			 				  myFrame.window.easyUi_reload(); 
			 			  }
                    }
 		     });
        }

        /*弹出二维码*/
        function open_win_code(){
	
		    get_focus();
		    window.returnValue=""; 
		    layer.open({
				type: 2,
		        area: ['600px', '400px'],
		        offset: '80px',
		        title:false,
		        fix: false, //不固定
		        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		        content: "item_code.jsp",
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
						
						var topdiv=document.getElementById("ie_item_make").contentWindow.document.getElementById("topfd");
						var sf=document.getElementById("sf").value;  
			            //var add = document
						//	.createElement("<div  id='fonts"+total+"' title='"+tres[0]+"' onmousedown='getdiv(this)'   onmousemove='pos(this)'   style='overflow:auto;border:1px solid #000000;font-family:<ww:property value='#session.local.font_family_s' />;font-size:"+parseInt(24*sf)+"px;line-height:"+parseInt(24*sf)+"px;top:0px;left:0px;width:"+w*sf+"px;height:"+h*sf+"px;POSITION: absolute;z-index:"+total+";left:"+xy_x*sf+"px;top:"+xy_y*sf+"px;'/>");
	                    
			              var add=document.createElement("div");
	                      add.id="codet"+total;
						  add.title=tres[0];
						  add.style.width=w*sf+"px";
						  add.style.height=h*sf+"px";
						  add.style.posLeft=xy_x*sf;
						  add.style.posTop=xy_y*sf;
						  add.style.position="absolute"; 
						  add.style.zIndex=total;
						  add.style.opacity="0.8";
						  add.style.filter= 'alpha(opacity=80)';
						  add.style.fontFamily="微软雅黑";
						  add.style.color="#FFFFFF";
						  add.style.backgroundColor="#000000";							
						  add.innerHTML="<ww:property value='#session.local.a00662' />:"+tres[4];
						  add.onmousemove= function pos(){ 
								myFrame.window.pos(add);   
						  };
						  add.onmousedown=function getdiv(){
							   myFrame.window.getdiv(add);
						  };
						  add.setAttribute("onmousemove",'pos(this)');
	                      add.setAttribute("onmousedown",'getdiv(this)');
	                      add.setAttribute("onmouseup",'showgrid(event)');
	                      add.setAttribute("codeurl",tres[4]);
	                      add.setAttribute("codep",tres[5]);
					      topdiv.appendChild(add);
						  total++;   
					  }	
		          }
		    });
        }

        /*弹出摄像*/
       function open_win_netcamera(){
           
	      get_focus();
	      
	      window.returnValue=""; 

	      //获取缩放
 	      var sf=document.getElementById("sf").value;
 	 
	      layer.open({
		      
			   type: 2,
	           area: ['600px', '400px'],
	           offset: '20px',
	           title:false,
	           fix: false, //不固定
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
					
					 var topdiv=get_container_object();
					 var sf=document.getElementById("sf").value;  
		            
                     //X*Y*宽*高*设备ID*用户名*密码*厂商
		             var add=document.createElement("div");
                     add.id="mycam"+total;
					  
                     add.style.width=Math.round(w*sf)+"px";
	   				 add.style.height=Math.round(h*sf)+"px";
	   				 add.style.left=Math.round(xy_x*sf)+"px";
	   				 add.style.top=Math.round(xy_y*sf)+"px";
					 add.style.position="absolute"; 
					 add.style.zIndex=total;
					 add.style.opacity="0.8";
					 add.style.filter= 'alpha(opacity=80)';
					  
					 add.style.fontFamily="微软雅黑";
					 add.style.color="#000000";
					 add.style.backgroundColor="#B4EEB4";
					 add.style.fontSize=Math.round(36*sf)+"px";						


					 add.innerHTML="mycam"+total;
					 add.title=tres[4]+"*"+tres[5]+"*"+tres[6]+"*"+tres[7];
					 add.setAttribute("onmousedown",'showmenuie5(event)');
					 add.setAttribute("onmouseup",'showgrid(event)');
                      //add.setAttribute("onmousedown",'getdiv(this)');
					 add.className="easyui-resizable easyui-draggable";
	  				 add.setAttribute("data-options","onDrag:onDrag");
	  				 total++;
	  				 topdiv.appendChild(add);
	  				  //easy渲染
	  				 myFrame.window.easyUi_reload();  
				  }		            
	           }
	      });
      }

      /*弹出控件*/
      function open_win_dll(){
          
	      get_focus();
	      window.returnValue=""; 
	      var topdiv=get_container_object();
	      var sf=document.getElementById("sf").value;
	      var mfile=document.getElementById("mfile").value;  
	      layer.open({
			type: 2,
	        area: ['600px', '400px'],
	        offset: '80px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: "item_dll.jsp",
	        scrollbar: false,
	        end: function(){
	            if(window.returnValue==undefined||window.returnValue==""){
				     window.returnValue=""; 			            
				}else{

					var rv=window.returnValue;
					var tres=rv.split('|');
        
                    if(tres[0]=="qmany"){
                        //qmany|X*Y*宽*高*样式(1,2,3)*显示行数*字体大小*字体颜色*语音播放(0关 1开)*背景颜色(0表示透明)
                        var tress=tres[1].split('*');
                        if(tress.length==10){
                            
                        	  var xy_x=tress[0];
        		              var xy_y=tress[1];
                        	  var w=tress[2];
        				   	  var h=tress[3];
        					
        		              var add=document.createElement("div");
                              add.id="qmany"+total;
                              add.title=tress[4]+"*"+tress[5]+"*"+tress[6]+"*"+tress[7]+"*"+tress[8]+"*"+tress[9];
                              add.style.width=Math.round(w*sf)+"px";
	       	   				  add.style.height=Math.round(h*sf)+"px";
	       	   				  add.style.left=Math.round(xy_x*sf)+"px";
	       	   				  add.style.top=Math.round(xy_y*sf)+"px";
        					  add.style.position="absolute"; 
        					  add.style.zIndex=total;
        					  add.style.opacity="0.8";
        					  add.style.filter= 'alpha(opacity=80)';
        					  add.style.fontFamily="微软雅黑";
        					  add.style.color="#FFFFFF";
        					  add.style.backgroundColor="#000000";	
        					  add.style.fontSize="18px";								
        					  add.innerHTML="qmany"+total;
        					  add.style.zIndex=total;
        					  
        					  add.setAttribute("onmousedown",'showmenuie5(event)');
        					  add.setAttribute("onmouseup",'showgrid(event)');
                            
      					      add.className="easyui-resizable easyui-draggable";
      					      add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
      	  					  total++;
      	  					  topdiv.appendChild(add);
      	  					  //easy渲染
      	  					  myFrame.window.easyUi_reload(); 
        					 

                        }
    				}else if(tres[0]=="qsing"){
                        //qsing|X*Y*宽*高*样式(1,2,3)*显示行数*字体大小*字体颜色*语音播放(0关 1开)*背景颜色(0表示透明)
                        var tress=tres[1].split('*');
                        if(tress.length==10){

                      	      var xy_x=tress[0];
        		              var xy_y=tress[1];
                        	  var w=tress[2];
        				   	  var h=tress[3];        					
        		              var add=document.createElement("div");
                              add.id="qsing"+total;
                              add.title=tress[4]+"*"+tress[5]+"*"+tress[6]+"*"+tress[7]+"*"+tress[8]+"*"+tress[9];
                              add.style.width=Math.round(w*sf)+"px";
       	   				      add.style.height=Math.round(h*sf)+"px";
       	   				      add.style.left=Math.round(xy_x*sf)+"px";
       	   				      add.style.top=Math.round(xy_y*sf)+"px";
        					  add.style.position="absolute"; 
        					  add.style.zIndex=total;
        					  add.style.opacity="0.8";
        					  add.style.filter= 'alpha(opacity=80)';
        					  add.style.fontFamily="微软雅黑";
        					  add.style.color="#FFFFFF";
        					  add.style.backgroundColor="#000000";						
        					  add.innerHTML="qsing"+total;
        					  add.style.zIndex=total;
        					  add.style.fontSize="18px";	
        					  add.setAttribute("onmousedown",'showmenuie5(event)');
        					  add.setAttribute("onmouseup",'showgrid(event)');
                              //add.setAttribute("onmousedown",'getdiv(this)');
      					      add.className="easyui-resizable easyui-draggable";
      					      add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
      	  					  total++;
      	  					  topdiv.appendChild(add);
      	  					  //easy渲染
      	  					  myFrame.window.easyUi_reload(); 
        					 

                        }
    				  }else if(tres[0]=="mybus"){
    					//mybus|X*Y*宽*高*显示行数*字体大小*字体颜色*背景色 (0透明 )
    					var tress=tres[1].split('*');
                        if(tress.length==8){
                            
                        	      var xy_x=tress[0];
		       		              var xy_y=tress[1];
		                       	  var w=tress[2];
		       				   	  var h=tress[3];
		       				     
	        		              var add=document.createElement("div");
	                              add.id="mybus"+total;
	                              add.title=tress[4]+"*"+tress[5]+"*"+tress[6]+"*"+tress[7];
	                              add.style.width=Math.round(w*sf)+"px";
	       	   				      add.style.height=Math.round(h*sf)+"px";
	       	   				      add.style.left=Math.round(xy_x*sf)+"px";
	       	   				      add.style.top=Math.round(xy_y*sf)+"px";
	        					  add.style.position="absolute"; 
	        					  add.style.zIndex=total;
	        					  add.style.opacity="0.8";
	        					  add.style.filter= 'alpha(opacity=80)';
	        					  add.style.fontFamily="微软雅黑";
	        					  add.style.color="#FFFFFF";
	        					  add.style.backgroundColor="#000000";						
	        					  add.innerHTML="mybus"+total;
	        					  add.style.zIndex=total;
	        					  add.style.fontSize="18px";	
	        					  add.setAttribute("onmousedown",'showmenuie5(event)');
	        					  add.setAttribute("onmouseup",'showgrid(event)');
	       					      //add.setAttribute("onmousedown",'getdiv(this)');
		      					  add.className="easyui-resizable easyui-draggable";
		      					  add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
		      	  				  total++;
		      	  				  topdiv.appendChild(add);
	      	  					  //easy渲染
	      	  					  myFrame.window.easyUi_reload();
	      	  					

                        }    
    				}else if(tres[0]=="charg"){
        				//charg|X*Y*宽*高*type*行*列
    					var tress=tres[1].split('*');
    					if(tress.length==7){
    						  var xy_x=tress[0];
	       		              var xy_y=tress[1];
	                       	  var w=tress[2];
	       				   	  var h=tress[3];
	       				     
       		                  var add=document.createElement("div");
                              add.id="charg"+total;
                              add.style.width=Math.round(w*sf)+"px";
      	   				      add.style.height=Math.round(h*sf)+"px";
      	   				      add.style.left=Math.round(xy_x*sf)+"px";
      	   				      add.style.top=Math.round(xy_y*sf)+"px";
       					      add.style.position="absolute"; 
       					      add.style.zIndex=total;
       					      add.style.opacity="0.8";
       					      add.style.filter= 'alpha(opacity=80)';
       					      add.style.fontFamily="微软雅黑";
	       					  add.style.color="#FFFFFF";
	       					  add.style.backgroundColor="#000000";						
	       					  add.innerHTML="charg"+total;
	       					  add.style.zIndex=total;
	       					  add.style.fontSize="18px";	
	       					  add.setAttribute("onmousedown",'showmenuie5(event)');
	       					  add.setAttribute("onmouseup",'showgrid(event)');
      					      //add.setAttribute("onmousedown",'getdiv(this)');
	      					  add.className="easyui-resizable easyui-draggable";
	      					  add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");


	      					  var programDll=new Object();
	      					  programDll.rows=tress[5];
	      					  programDll.columns=tress[6];
	      					  programDll.type=101;

	      					  var jsonStr=JSON.stringify(programDll);
	      				  	  jsonStr=jsonStr.replace(/"/g,"'");
	      				      add.setAttribute("jsonStr",jsonStr); 
	      					  
	      	  				  total++;
	      	  				  topdiv.appendChild(add);
     	  					  //easy渲染
     	  					  myFrame.window.easyUi_reload();

        			    }

        		    }else if (tres[0] == "source"){
        		    	
        		    	
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
        		    				 var tres=rv.split('|');
        		    				 var w=tres[1];
        		    				 var h=tres[2];
        		    				 var xy_x=0;
        		    				 var xy_y=0;
        		    				 if(tres.length==5){
        		    					xy_x=tres[3];
        		    					xy_y=tres[4];
        		    				 }
        		    				
        		    			
        		    				 var add=document.createElement("div");
        		    				 add.id="source"+total;
        		    				 add.style.width=Math.round(w*sf)+"px";
        		    				 add.style.height=Math.round(h*sf)+"px";
        		    				 add.style.left=Math.round(xy_x*sf)+"px";
        		    				 add.style.top=Math.round(xy_y*sf)+"px";
        		    				 add.style.position="absolute"; 
        		    				 add.style.overflow="auto";
        		    				 add.style.border="1px solid #000000";
        		    				 add.style.opacity="0.8";
        		    				 add.style.filter= 'alpha(opacity=80)';
        		    				 add.style.fontFamily="微软雅黑";
        		    				 add.style.color="#FFFFFF";
        		    				 add.style.backgroundColor="#000000";	
        		    				 add.style.fontSize="18px";								
        		    				 add.innerHTML="source"+total;
        		    				 add.style.zIndex=total;					 
        		    				 add.setAttribute("fontSize",24);
        		    				 add.setAttribute("lineHeight",24);
        		    				 add.setAttribute("onmousedown",'showmenuie5(event)');
        		    				 add.setAttribute("onmouseup",'showgrid(event)');

        		    				 var jsonStr=tres[0];
        		    				 //jsonStr=jsonStr.replace(/'/g,"\"");
        		    				 add.setAttribute("jsonStr",jsonStr); 

        		    				 add.className="easyui-resizable easyui-draggable";
        		    				 add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
        		    				 total++;
        		    				 topdiv.appendChild(add);
        		    				 //easy渲染
        		    				 myFrame.window.easyUi_reload(); 
        		    			}
        		    		}
        		    	});
        		    }else if (tres[0] == "dllItem"){
        		    	
        		    	setLayerBigDataParameter("");
        		    	
        		    	window.returnValue="";

        		    	var dllItemUser=getDllItemBindUser();
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
        				//setCookie("jsonStr",jsonStr) 
        				//setCookie("jsonData","") 
        				
        		    	layer.open({
        		    		type: 2,
        		    		area: ['980px', 530+'px'],
        		    		offset: '30px',
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

        		    				 //解析json 
        							 var rv=window.returnValue;
        							 rv=rv.replace(/&quot;/g,"\"");
        					         //转换成touch对象组
        							 var objs = eval( "(" + rv + ")" );//转换后的JSON对象

        							
        		                     //创建元素
        		                     var add=document.createElement("div");
        		                     add.id="dllIt"+total;
       		                         add.innerHTML="dllIt"+total;

       								 add.style.width=Math.round((objs.mWidth)*sf)+"px";
       								 add.style.height=Math.round((objs.mHeight)*sf)+"px";
       								 add.style.left=Math.round((objs.mLeft)*sf)+"px";
       								 add.style.top=Math.round((objs.mTop)*sf)+"px";	    

        		    			     add.style.position="absolute"; 
        		    				 add.style.overflow="auto";
        		    				 
        		    				 add.style.opacity="0.8";
        		    				 add.style.filter= 'alpha(opacity=80)';
        		    				 add.style.fontFamily="微软雅黑";
        		    				 add.style.color="#FFFFFF";
        		    				 add.style.backgroundColor="#000000";	
        		    				 add.style.fontSize="18px"; 								
        		    				 add.innerHTML="<ww:property value='#session.local.b00118'  />"+total;
        		    				 add.style.zIndex=total;					 
        		    				 add.setAttribute("fontSize",24);
        		    				 add.setAttribute("lineHeight",24);
        		    				 add.setAttribute("onmousedown",'showmenuie5(event)');
        		    				 add.setAttribute("onmouseup",'showgrid(event)');

        		    				 //数据源
						             add.setAttribute("jsonData",rv);

        		    				 add.className="easyui-resizable easyui-draggable";
        		    				 add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
        		    				 total++;
        		    				 topdiv.appendChild(add);
        		    				 //easy渲染
        		    				 myFrame.window.easyUi_reload(); 

        		    				 //遍历节目绑定的用户
        		    				 getDllItemBindUser();
        		    			  }
        		    		    }
        		    	   });
        		       }else if (tres[0] == "envir"){

        		    	     //创建元素
		                     var add=document.createElement("div");
		                     add.id="envir"+total;
		                     add.style.width=Math.round((300)*sf)+"px";
							 add.style.height=Math.round((300)*sf)+"px";
							 add.style.left=Math.round((0)*sf)+"px";
							 add.style.top=Math.round((0)*sf)+"px";	    

		    			     add.style.position="absolute"; 
		    				 add.style.overflow="auto";
		    				 add.style.opacity="0.8";
		    				 add.style.filter= 'alpha(opacity=80)';
		    				 add.style.fontFamily="微软雅黑";
		    				 add.style.color="#FFFFFF";
		    				 add.style.backgroundColor="#000000";	
		    				 add.style.fontSize="18px"; 								
		    				 add.innerHTML="<ww:property value='#session.local.b00159'  />"+total;
		    				 add.style.zIndex=total;					 
		    				 add.setAttribute("fontSize",24);
		    				 add.setAttribute("lineHeight",24);
		    				 add.setAttribute("onmousedown",'showmenuie5(event)');
		    				 add.setAttribute("onmouseup",'showgrid(event)');

		    				 add.className="easyui-resizable easyui-draggable";
		    				 add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
		    				 total++;
		    				 topdiv.appendChild(add);
		    				 //easy渲染
		    				 myFrame.window.easyUi_reload(); 
  		        
        		       }    
				    }   
	            }
	       });
       }

      //弹出多媒体
      function open_win_media(){
           
	        get_focus();
	      
	        window.returnValue=""; 
	
	        layer.open({
		        
					type: 2,
					area: ['950px', 520+'px'],
			        offset: '40px',
			        title:false,
			        fix: false, //不固定
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
				         
						    var sf=document.getElementById("sf").value;  
					      
							var topdiv=get_container_object();
		                    var add=document.createElement("div");
							add.id="video"+total;
						
							add.style.width=Math.round(objs.mWidth*sf)+"px";
							add.style.height=Math.round(objs.mHeight*sf)+"px";
							add.style.left=Math.round(objs.mLeft*sf)+"px";
							add.style.top=Math.round(objs.mTop*sf)+"px";
							add.style.position="absolute"; 
		                    add.style.opacity="0.8";
							add.style.filter= 'alpha(opacity=80)';
							add.style.filter ="AlphaImageLoader(sizingMethod=scale,src='image/video.jpg')";
		                    add.style.zIndex=total;
							
							add.style.fontFamily="微软雅黑";
							add.style.fontSize=Math.round(36*sf)+"px";
							add.style.color="#FFFFFF";
							add.style.backgroundColor="#000000";
							
						
							add.setAttribute("onmousedown",'showmenuie5(event)');
							add.setAttribute("onmouseup",'showgrid(event)');
		
							
							//数据源
							add.setAttribute("jsonData",rv);
							
		                    add.className="easyui-resizable easyui-draggable";
		                    add.setAttribute("data-options","onDrag:onDrag,onStopResize:onStopResize");
							add.innerHTML="video"+total;
		
							total++;
							topdiv.appendChild(add);
							//easy渲染
							myFrame.window.easyUi_reload();
				    }		            
	            }
	       });
      }

      
      /*编辑*/
      function edit_div(divv2){
	
	      get_focus();
	      divv=divv2;
	      if(divv!=undefined){
		       if(divv.id!=''&&divv.id!='topfd'){
			 
			       window.returnValue="";
			       var sf=document.getElementById("sf").value;
			       var divid=divv.id;
			   
			       var mfile = document.getElementById("mfile").value;
			       var topdiv=get_container_object();
				   var key=divid.substring(0,5);

                   //获取坐标
				   var ewidth=Math.round(divv.offsetWidth/sf);
                   var eheight=Math.round(divv.offsetHeight/sf);
			       var ex=Math.round(divv.offsetLeft/sf);
			       var ey=Math.round(divv.offsetTop/sf);
			    					
				    //图片
				    get_focus();
				    if(key=="image")
				    {    
					     var yxSucaiListJson=divv.getAttribute("jsonData");
                     
                         if(yxSucaiListJson!=null){
         				       yxSucaiListJson=yxSucaiListJson.replace(/"/g,"'"); 
         		         }   
					     layer.open({
						     
								type: 2,
								area: ['900px', 525+'px'],
							    offset: '40px',
						        title:false,
						        fix: false, //不固定
						        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
						        content: "tosceneimg.vs?sucai.type=4&gssi.sucaigroupid=0&sf="+sf+"&width="+ ewidth+"&height="+ eheight+"&mfile="+mfile+"&xy_x="+ ex+"&xy_y="+ey+"&yxSucaiListJson="+yxSucaiListJson,
						        scrollbar: false,
						        end: function(){ 
							         
									 if(window.returnValue==undefined||window.returnValue==""){
									     window.returnValue=""; 			            
									 }else{
										  
										    //解析json 
										    var rv=window.returnValue;
										    rv=rv.replace(/&quot;/g,"\"");
								            //转换成touch对象组
										    var objs = eval( "(" + rv + ")" );//转换后的JSON对象;								
											
											divv.src="files/"+mfile+"/"+objs.mMediaList[0].path;
											//divv.style.width=Math.round(t2*sf)+"px";
					 						//divv.style.height=Math.round(t3*sf)+"px";
					 						//divv.style.left=Math.round(xy_x*sf)+"px";
					 						//divv.style.top=Math.round(xy_y*sf)+"px";
					 						 
										
											//获取素材播放时长
	                                        var ptime=objs.mPlayTimes;
											divv.setAttribute("ptime",ptime);
	
											//数据源
											divv.setAttribute("jsonData",rv);
	
											
											//divv.setAttribute("bls",rv2[1]);
											
											get_item_time();
	
											
											
									 }
								              
								}
							});

			        }else if(key=="imggr"){


			            var yxSucaiListJson=divv.getAttribute("jsonData");
	                     
                        if(yxSucaiListJson!=null){
        				       yxSucaiListJson=yxSucaiListJson.replace(/"/g,"'"); 
        		         }   
					     layer.open({
						     
								type: 2,
								area: ['900px', 525+'px'],
							    offset: '40px',
						        title:false,
						        fix: false, //不固定
						        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
						        content: "tosceneimgGroup.vs?editType=2&sucai.type=4&gssi.sucaigroupid=0&sf="+sf+"&width="+ ewidth+"&height="+ eheight+"&mfile="+mfile+"&xy_x="+ ex+"&xy_y="+ey+"&yxSucaiListJson="+yxSucaiListJson,
						        scrollbar: false,
						        end: function(){ 
							         
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
											divv.setAttribute("jsonData",rv);	
											
									 }
								              
								}
							});

					        
				    }
                    //视频
                    else if(key=="video"){
                
        			    var yxSucaiListJson=divv.getAttribute("jsonData");
        			    if(yxSucaiListJson!=null){
        				     yxSucaiListJson=yxSucaiListJson.replace(/"/g,"'"); 
        				
        				     //转换成touch对象组
					         var yxSucaiList = eval( "(" + yxSucaiListJson + ")" );//转换后的JSON对象;
					         var tbType=yxSucaiList.mMediaList[0].tbType;
					         if(tbType==3||tbType==4||tbType==5){
						    
					    	 layer.open({
						    	 
					 			type: 2,
					 			area: ['950px', 526+'px'],
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
										divv.setAttribute("jsonData",rv);
						 		    }
					    		}	
					            
						   });    
						}else{

							layer.open({
								type: 2,
								area: ['950px', 520+'px'],
						        offset: '40px',
						        title:false,
						        fix: false, //不固定
						        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
						        content: "toscenevideo.vs?sucai.type=3&gssi.sucaigroupid=0&sf="+sf+"&width="+ ewidth+"&height="+ eheight+"&mfile="+mfile+"&xy_x="+ ex+"&xy_y="+ ey+"&yxSucaiListJson="+yxSucaiListJson,
						        scrollbar: false,
						        end: function(){ 
							         
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
											divv.setAttribute("ptime",ptime);

											//数据源
											divv.setAttribute("jsonData",rv);
											get_item_time();
											
									 }
								              
								}
							});

					    }
					   
        		    }   
                	
                }
			    //ppt(6) word(7) excel(8) pdf(9)
			    else if(key=="myppt"||key=="mydoc"||key=="myxls"||key=="mypdf")
		        {       

			    	    var yxSucaiListJson=divv.getAttribute("jsonData");
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
						        offset: '30px',
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
											
											divv.src="files/"+mfile+"/"+objs.mMediaList[0].path;
											//divv.style.width=Math.round(t2*sf)+"px";
					 						//divv.style.height=Math.round(t3*sf)+"px";
					 						//divv.style.left=Math.round(xy_x*sf)+"px";
					 						//divv.style.top=Math.round(xy_y*sf)+"px";
					 						
											//获取素材播放时长
	                                        var ptime=objs.mPlayTimes;
											divv.setAttribute("ptime",ptime);

											//数据源
											divv.setAttribute("jsonData",rv);

										    get_item_time();
									 }
								              
								}
							});
		           }
		          
			       //时间
			       else if(key=="mytim"){

                       var tType=divv.getAttribute('tType');
                       var tsType= divv.getAttribute('tsType');
					   //字体大小
			           var fs=divv.getAttribute('fs');
			           //字条颜色
			           var fcolor=divv.getAttribute('fcolor');
                       var ttDa=divv.getAttribute('ttDa');
                       var ttHo=divv.getAttribute('ttHo');
                       var ttMi=divv.getAttribute('ttMi');
                       var ttSs=divv.getAttribute('ttSs');
                       var ttTimePoint=divv.getAttribute('ttTimePoint');
                       
                       var advancedType=divv.getAttribute("advancedType");
                       
                       var unitShow=divv.getAttribute("unitShow");
                       
			           
			    	   layer.open({
							type: 2,
							area: ['800px', '500px'],
						    offset: '20px',
					        title:false,
					        fix: false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: "toadtime.vs?width="+ ewidth+"&height="+ eheight+"&xy_x="+ ex+"&xy_y="+ ey
					                 +"&tType="+tType+"&tsType="+tsType+"&fs="+fs+"&fcolor="+fcolor+"&ttDa="+ttDa+"&ttHo="+ttHo+"&ttMi="+ttMi+"&ttSs="+ttSs+"&ttTimePoint="+ttTimePoint+"&advancedType="+advancedType+"&unitShow="+unitShow,
					        scrollbar: false,
					        end: function(){ 
						         
								 if(window.returnValue==undefined||window.returnValue==""){
								     window.returnValue=""; 			            
								 }else{
									var rv=window.returnValue;

									rv=rv.replace(/&quot;/g,"\"");
									
									var obj= eval( "(" + rv + ")" );//转换后的JSON对象
									
									divv.style.color="#"+obj.fcolor;
										  
                                    divv.style.fontSize=Math.round(obj.fs*sf)+"px";
                                    
                                    divv.style.lineHeight=Math.round(obj.fs*sf)*1.3+"px"; 

                                    divv.style.color="#"+obj.fcolor;

                                    divv.setAttribute("tType",obj.tType);

               					    divv.setAttribute("tsType",obj.tsType);

               					    divv.setAttribute("fs",obj.fs);

               					    divv.setAttribute("fcolor",obj.fcolor);

               					    divv.setAttribute("ttDa",obj.ttDa);

               					    divv.setAttribute("ttHo",obj.ttHo);

               					    divv.setAttribute("ttMi",obj.ttMi);

               					    divv.setAttribute("ttSs",obj.ttSs);

               					    divv.setAttribute("ttTimePoint",obj.ttTimePoint);

               					    divv.setAttribute("advancedType",obj.advancedType);

               					    divv.setAttribute("unitShow",obj.unitShow)


              					    //数据源
               					    divv.setAttribute("jsonData",rv);
               					
               					    var mytimContent=getTimeShowStyle(obj.tType,obj.tsType,obj.ttDa,obj.ttHo,obj.ttMi,obj.ttSs,obj.unitShow); 
                               		 
					 			    divv.innerHTML = mytimContent;

								          						        
							  		    
										
								 }
							              
							}
						});
				   }
				   //html
				   else if(key=="htmls"){
					   var gun=divv.getAttribute('gun');
			           var time=divv.getAttribute('time');
			           var sortableListSpans =divv.getAttribute("sortableListSpans"); 
                       //alert("before_sortableListSpans:"+sortableListSpans)
			           sortableListSpans=escape(sortableListSpans);
                       //alert("after_sortableListSpans:"+sortableListSpans)
			           
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
                                     
									 var w=tres[2];
								     var h=tres[3];
									 var xy_x=tres[0];
							         var xy_y=tres[1];

									 divv.title=tres[4]+"*"+tres[5]+"*"+tres[6];
                                   
									 //divv.style.width=Math.round(w*sf)+"px";
									 //divv.style.height=Math.round(h*sf)+"px";
									 //divv.style.left=Math.round(xy_x*sf)+"px";
									 //divv.style.top=Math.round(xy_y*sf)+"px";

										
									divv.setAttribute("time",tres[4]);
									divv.setAttribute("gun",tres[5]);
									//tres[6]=tres[6].replace(/amp;/g,"");
									//alert("save:"+tres[6])
									divv.setAttribute("sortableListSpans",tres[6]); 

									
										
								 }
							              
							}
						});
				   }
				   //天气
				   else if(key=="mytqs"){

					  
	                   var fresh=divv.getAttribute("fresh");
	                   var dx=divv.getAttribute("dx");
	                   var wfcolor=divv.getAttribute("wfcolor");
	                   var sortableListSpans=divv.getAttribute("sortableListSpans");
					   layer.open({
							type: 2,
							area: ['800px', '500px'],
					        offset: '20px',
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
									 divv.title=tres[4]+"*"+tres[5]+"*"+tres[6]+"*"+tres[7]+"*"+tres[8];
									 //divv.style.width=Math.round(w*sf)+"px";
									 //divv.style.height=Math.round(h*sf)+"px";
									 //divv.style.left=Math.round(xy_x*sf)+"px";
									 //divv.style.top=Math.round(xy_y*sf)+"px";
									 divv.setAttribute("fresh",tres[4]);
									 divv.setAttribute("dx",tres[5]);
									 divv.setAttribute("wfcolor",tres[6]);
									 divv.setAttribute("sortableListSpans",tres[7]);

								  }          
							}
						});
				   }
				   //截图
				   else if (key=="seejp"){

					   layer.open({
							type: 2,
					        area: ['500px', '300px'],
					        offset: '80px',
					        title:false,
					        fix: false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: "toadscreen.vs?width="+ ewidth+"&height="+ eheight+"&xy_x="+ ex+"&xy_y="+ ey,
					        scrollbar: false,
					        end: function(){ 
						         
								 if(window.returnValue==undefined||window.returnValue==""){
								     window.returnValue=""; 			            
								 }else{
									var rv=window.returnValue;
									var tres=rv.split('|');
									rv=tres[0];
									var xy_x=0;
						            var xy_y=0;
									if(tres.length==6){
										xy_x=tres[4];
										xy_y=tres[5];
									}
									var timee=tres[1];
									divv.title=timee;
									//divv.src=rv;
									divv.setAttribute("jpsrc",rv);
									//divv.style.width=Math.round(tres[2]*sf)+"px";
									//divv.style.height=Math.round(tres[3]*sf)+"px";
									//divv.style.left=Math.round(xy_x*sf)+"px";
									//divv.style.top=Math.round(xy_y*sf)+"px";
									
								  }          
							}
						});

				  }
				  //新闻
				   else if (key=="mynew"){

					   layer.open({
							type: 2,
					        area: ['800px', '550px'],
					        offset: '20px',
					        title:false,
					        fix: false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: "toadrss.vs?width="+ ewidth+"&height="+ eheight+"&xy_x="+ ex+"&xy_y="+ ey,
					        scrollbar: false,
					        end: function(){ 
						         
								 if(window.returnValue==undefined||window.returnValue==""){
								     window.returnValue=""; 			            
								 }else{
									var rv=window.returnValue;
									var tres=rv.split('|');
									var xy_x=0;
						            var xy_y=0;
									if(tres.length==6){
										xy_x=tres[4];
										xy_y=tres[5];
									}
									rv=tres[0];
									var timee=tres[1];
									divv.title=timee;
									divv.setAttribute("rsssrc",rv);
									//divv.style.width=Math.round(tres[2]*sf)+"px";
									//divv.style.height=Math.round(tres[3]*sf)+"px";
									//divv.style.left=Math.round(xy_x*sf)+"px";
									//divv.style.top=Math.round(xy_y*sf)+"px";
							        return 
								  }          
							}
						});

				  }
				  //文本
				   else if (key=="fonts"){

                        
					     var fonttype=divv.getAttribute("fonttype");     //字体类型
		                 var txtfontsize=divv.getAttribute("txtfontsize");  //字体大小
		                 var lineH=divv.getAttribute("lineH");        //字距
		                 var gdtype=divv.getAttribute("gdtype");       //滚动方式
		                 var gdspeed=divv.getAttribute("gdspeed");      //滚动速度 
		                 var backcolor=divv.getAttribute("backcolor");   //背景颜色
		                 var txtfontcolor=divv.getAttribute("fontcolor");   //字体颜色 
                        
		                 var fbold=divv.getAttribute("fbold");      //加粗
						 var fitallic=divv.getAttribute("fitallic");   //斜体
						 var fsetline=divv.getAttribute("fsetline");   //下划线
						 var fsetstrike=divv.getAttribute("fsetstrike");  //中线

						 var textDataSource=divv.getAttribute("textDataSource");  //中线
						 
		                 var advancedType=divv.getAttribute("advancedType");  //设置字体大小模式  0普通  1高级
	                     
	                     backcolor=backcolor.substring(1,backcolor.length);
	                     txtfontcolor=txtfontcolor.substring(1,txtfontcolor.length);

		                
		                  var divHtml=divv.innerHTML;
		                 
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
					   layer.open({
							type: 2,
							area: ['980px', 525+'px'],
					        offset: '10px',
					        title:false,
					        fix: false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: 'toscenedoc.vs?sucai.type=10&gssi.sucaigroupid=0&sf='+sf+"&mfile="+mfile+"&width="+ ewidth+
			                "&height="+ eheight+"&xy_x="+
			                ex+"&xy_y="+ ey+"&fonttypeStr="+fonttype+"&txtfontsize="+txtfontsize+"&lineH="+lineH+"&gdtype="+gdtype+"&gdspeed="+gdspeed+
		                    "&fbackcolor="+backcolor+"&txtfontcolor="+txtfontcolor+"&fsetstrike="+fsetstrike+"&fbold="+fbold+"&fitallic="+
		                    fitallic+"&fsetline="+fsetline+"&textDataSource="+textDataSource+"&advancedType="+advancedType,
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
						            divv.title=tres[7]+"-"+tres[8];

						            divv.style.fontFamily=tres[4];
									
									divv.style.fontSize=Math.round(tres[5]*sf)+"px";
									divv.style.lineHeight=Math.round(Math.round(tres[5]*tres[6])*sf)+"px";

									  
								    divv.setAttribute("fontSize",tres[5]);
				                    divv.setAttribute("lineHeight",parseInt(tres[5]*tres[6]));
				                    
						            
					                //divv.style.width=Math.round(w*sf)+"px";
									//divv.style.height=Math.round(h*sf)+"px";
									//divv.style.left=Math.round(xy_x*sf)+"px";
									//divv.style.top=Math.round(xy_y*sf)+"px";


									divv.setAttribute("fonttype",tres[4]);     //字体类型
									divv.setAttribute("txtfontsize",tres[5]);  //字体大小
									divv.setAttribute("lineH",tres[6]);        //字距
									divv.setAttribute("gdtype",tres[7]);       //滚动方式
									divv.setAttribute("gdspeed",tres[8]);      //滚动速度

									
									divv.setAttribute("backcolor",tres[10]);   //背景颜色
									divv.setAttribute("fontcolor",tres[11]);   //字体颜色 
									divv.setAttribute("fbold",tres[12]);      //加粗
									divv.setAttribute("fitallic",tres[13]);   //斜体
									divv.setAttribute("fsetline",tres[14]);   //下划线
									divv.setAttribute("fsetstrike",tres[15]);  //中线

									divv.setAttribute("textDataSource",tres[16]);  //数据来源

									divv.setAttribute("advancedType",tres[17]);  
										
									divv.innerHTML=tres[9];


									setLayerBigDataParameter(""); 
									return;
								  }          
							}
						});

				   }
				   //汇率
				   else if (key=="myhls"){
					   //获取时长
					  var hlFontColor=divv.getAttribute("hlFontColor");
					  var hlFontSize=divv.getAttribute("hlFontSize");
					  var hlRtime=divv.getAttribute("hlRtime");
					  var cskeystrs=divv.getAttribute("cskeystrs");
					  var symbolstrs=divv.getAttribute("symbolstrs");
					   layer.open({
							type: 2,
							area: ['1200px', '500px'],
					        offset: '80px',
					        title:false,
					        fix: false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: "todatahl.vs?edittype=1&width="+ Math.round(divv.style.posWidth/sf)+"&height="+ Math.round(divv.style.posHeight/sf)+"&sf="+sf+"&xy_x="+ Math.round(divv.style.posLeft/sf)
					                  +"&xy_y="+ Math.round(divv.style.posTop/sf)+"&hlFontColor="+hlFontColor+"&hlFontSize="+hlFontSize+"&hlRtime="+hlRtime+"&cskeystrs="+cskeystrs+"&symbolstrs="+symbolstrs,
					        scrollbar: false,
					        end: function(){ 
						         
								 if(window.returnValue==undefined||window.returnValue==""){
								     window.returnValue=""; 			            
								 }else{
									var rv=window.returnValue;
									var tres=rv.split('|');	
									var html_show=tres[8];
									divv.src=html_show;
									divv.title=tres[9];
									divv.style.width=tres[2]*sf+"px";
									divv.style.height=tres[3]*sf+"px";
									divv.style.posLeft=tres[0]*sf;
									divv.style.posTop=tres[1]*sf;

									divv.setAttribute("html_show",html_show);
									divv.setAttribute("ssrc",html_show);
									divv.setAttribute("hlFontColor",tres[6]);
									divv.setAttribute("hlFontSize",tres[7]);
									divv.setAttribute("hlRtime",tres[9]);
									divv.setAttribute("cskeystrs",tres[4]);
									divv.setAttribute("symbolstrs",tres[5]);
								  }          
							}
						});
				   }//二维码
				   else if(key=="codet"){
					   var codeurl=divv.getAttribute('codeurl');
			           var codep=divv.getAttribute('codep');
			           
					   layer.open({
							type: 2,
							area: ['600px', '400px'],
					        offset: '80px',
					        title:false,
					        fix: false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: "tocodet.vs?width="+ Math.round(divv.style.posWidth/sf)+"&height="+ Math.round(divv.style.posHeight/sf)+"&xy_x="+ Math.round(divv.style.posLeft/sf)+"&xy_y="+ Math.round(divv.style.posTop/sf)+"&codeurl="+codeurl+"&codep="+codep,
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
									
									 divv.style.width=w*sf+"px";
									 divv.style.height=h*sf+"px";
									 divv.style.posLeft=xy_x*sf;
									 divv.style.posTop=xy_y*sf;
									 divv.innerHTML="<ww:property value='#session.local.a00662' />:"+tres[4];
									 divv.setAttribute("codeurl",tres[4]);
				                     divv.setAttribute("codep",tres[5]);
										
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
					        content: "tocamerat.vs?width="+ ewidth+"&height="+ eheight+"&xy_x="+ ex+"&xy_y="+ey+"&ctitle="+divv.title,
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
									divv.title=tres[4]+"*"+tres[5]+"*"+tres[6]+"*"+tres[7];
									//divv.style.width=Math.round(w*sf)+"px";
			 					    //divv.style.height=Math.round(h*sf)+"px";
			 						//divv.style.left=Math.round(xy_x*sf)+"px";
			 						//divv.style.top=Math.round(xy_y*sf)+"px";
									
								
										
								 }
							              
							}
						});

				   }
				  	   
                  
				   //公交车站	    	   
                   else if(key=="mybus"){
					   layer.open({
							type: 2,
							area: ['600px', '400px'],
					        offset: '80px',
					        title:false,
					        fix: false, //不固定
					        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
					        content: "toitembus.vs?width="+ ewidth+"&height="+ eheight+"&xy_x="+ex+"&xy_y="+ ey+"&ctitle="+divv.title,
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
										 divv.title=tress[4]+"*"+tress[5]+"*"+tress[6]+"*"+tress[7];
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

					   var jsonStr=divv.getAttribute("jsonStr");
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
				      				     divv.setAttribute("jsonStr",jsonStr); 

			        				} 	 
								 }
							              
							}
						});

				   }else if(key == "sourc"){

					   var jsonStr=divv.getAttribute("jsonStr");
					   
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
											var tres=rv.split('|');
										   	var w=tres[1];
										   	var h=tres[2];
										   	var xy_x=0;
								            var xy_y=0;
											if(tres.length==5){
												xy_x=tres[3];
												xy_y=tres[4];
											}

					      					 var jsonStr=tres[0];
					      				  	 //jsonStr=jsonStr.replace(/\"/g,"'");
					      				     divv.setAttribute("jsonStr",jsonStr); 
							 				 return;
						 				 }
						 			}
						 		});
					   //插件 	 		
					   }else if(key=="dllIt"){

							   //已选
							   var jsonData=divv.getAttribute("jsonData");
							   if(jsonData!=null){
								   jsonData=jsonData.replace(/"/g,"'"); 
								   var objs = eval( "(" + jsonData + ")" );//转换后的JSON对象

				                   var mDllItemUserList=objs.mDllItemList; 
				                   jsonData=JSON.stringify(mDllItemUserList);
				                   
				                   jsonData=jsonData.replace(/"/g,"'");
							   }   

							  
							   //全部
							 	var dllItemUser=getDllItemBindUser();
		        		    	var jsonStr=JSON.stringify(dllItemUser);
		        				  
		        				jsonStr=jsonStr.replace(/"/g,"'");



		        				//setCookie("jsonStr","") 
		        				//setCookie("jsonData","") 
		        				
		        				//setCookie("jsonStr",jsonStr) 
		        				
		        				//setCookie("jsonData",jsonData) 
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
		        		    		offset: '30px',
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
		        		    				 divv.setAttribute("jsonData",rv);
		        		    				 
		        		    			}
		        		    		}
		        		    	});                             
						   }				  
		             }
	                
	         }

        }

		/*移除模块*/
		function div_remove(){
			if(divv!=undefined){
				 if(divv.id!=''&&divv.id!='topfd'){
					 divv.removeNode(true);
				 }
			}
			
		}
		
        //判断开始日期和结束日期

		function comptime(beginTime,endTime){
		
			 var beginTimes=beginTime.substring(0,10).split('-');
		     var endTimes=endTime.substring(0,10).split('-');
		     beginTime=beginTimes[1]+'-'+beginTimes[2]+'-'+beginTimes[0]+' '+beginTime.substring(10,19);
		     endTime=endTimes[1]+'-'+endTimes[2]+'-'+endTimes[0]+' '+endTime.substring(10,19);
		     var a =Date.parse(endTime)-Date.parse(beginTime);
		     
		     if(a<=0){
		         return false;
		     }else{
		         return true;
		     }
		}

        //保存   value 0 预览  1保存   ,  handle  'sel' 预览   
       function save(value,handle){

	      //原始宽高
	      var norMaltx="<ww:property value='#session.scene.tx'/>";
	      var norMalty="<ww:property value='#session.scene.ty'/>";

	      //误差值
	      var differenceValue=5;

	      //图片集合
          var jsonImgs=new Array(); 

          //视频,音频,图片集合
          var jsonVideos=new Array();
     
          //充电桩集合
          var jsonDlls=new Array();

          //数据源
          var jsonSource=new Array();


          //控件节目
          var jsonDllItem=new Array();

          //图片组
          var jsonImgsGroup=new Array();

          //时间控件组
          var jsonTimes=new Array();


          //当前缩放比
	      var sf=document.getElementById("sf").value;

	      //当前容器对象 
	      var topdiv=get_container_object();	

	 	  //获取原始比
	      var index=topdiv.title.indexOf("_");

	 	  // 背景文件
	      var bfile="";
		  if(index!=-1){
		    	bfile=topdiv.title.split("_")[1];
		  }else{
		        bfile=topdiv.title;
		  }
		  //预览拼接字符串(网页)
		  var seecontent="";
		  //安卓拼接字符串(暂不用)
		  var content="";	  
          //所有元素的坐标 元素名 拼接
		  var fcontent="";
		  //x86拼接字符串(暂不用)
		  var gcontent="";

		  //背景
	      var bgshow="style='background: url("+bfile+") no-repeat;width:"+topdiv.offsetWidth/sf+"px;height:"+topdiv.offsetHeight/sf+"'";
	      //seecontent+="<div id='topfd' style='overflow: hidden; POSITION: absolute;background-image:url("+bfile+");left:0px;top:0px;width:"+topdiv.offsetWidth/sf+";height:"+topdiv.offsetHeight/sf+"'></div>";
   
	      if(value==1)
	      {
		     content+="<div id='topfd' style='overflow:hidden; POSITION: absolute;background-image:url("+bfile+");left:0px;top:0px;width:"+topdiv.offsetWidth/sf+";height:"+topdiv.offsetHeight/sf+"'></div>";
		     gcontent+="<div id='topfd' style='overflow: hidden; POSITION: absolute;background-image:url("+bfile+");left:0px;top:0px;width:"+topdiv.offsetWidth/sf+";height:"+topdiv.offsetHeight/sf+"'></div>";

      
		     if(topdiv.title.length>0)
		     {
		         fcontent="10|0|"+topdiv.offsetWidth+"|"+topdiv.offsetHeight+"|"+topdiv.title+"|"+bfile;
		     }

             //添加节目有效期
             var validityCheck=document.getElementById("validityCheck");
             if(validityCheck.checked){
        	     var sdate = document.getElementById("validitySdate").value;
    		     var edate = document.getElementById("validityEdate").value;
    		
		         if(sdate.length!=19)
			   	 {
			   		     alert("<ww:property value='#session.local.a00542' />");
			   		     return;
			   	 } 
		   		 if(edate.length!=19)
		   		 {
		   		     alert("<ww:property value='#session.local.a00543' />");
		   		     return;
		   		 } 
		   		 if(!comptime(sdate,edate)){
		   			 alert("<ww:property value='#session.local.a00544' />");
		   			 return;
		         }
	   	         getpartnodiv("createcjtime.vs?sdate="+sdate+"&edate="+edate+"&mfile=<ww:property value='#session.scene.filename'/>","nodiv");
           }
		
	     }

	     //元素对象 
	     var div;

	     //坐标
		 var left;
		 var top;
		 var width;
		 var height;
		 
		 //元素标识
		 var key;
		  
		 
         //获取容器下所有div
	     var divs=topdiv.getElementsByTagName("div");
	     var txt="";
	     var gncj="";
	     var lcsh="";
	     
	     for(var i = 0;i<divs.length;i++)
	     {
		 
		    div=divs[i];
		    key=div.id.substring(0,5);
		    left=Math.round(div.offsetLeft/sf);
	        top=Math.round(div.offsetTop/sf);
		    width=Math.round(div.offsetWidth/sf);
	        height=Math.round(div.offsetHeight/sf);

		    if(norMaltx-width<differenceValue){
	              width=norMaltx;
			}

	        if(norMalty-height<differenceValue){
                  height=norMalty;
		    }
		  
            //文本
            if(key=="fonts")
	        {
    	 
		        var rsd=div.title.split('-');  
		        var type=rsd[0];   //滚动方式     0 向上滚动   1向左滚动    2静态文本   3向下滚动
		        var speed=rsd[1];  //滚动速度
		        var ziti="-1";     //字体类型
		
		        if(div.style.fontFamily=="<ww:property value='#session.local.a00377' />")
		        {
		            ziti="0";
		        }
			    else if(div.style.fontFamily=="<ww:property value='#session.local.a00378' />")
			    {
			       ziti="1";
			    }
		        else if(div.style.fontFamily=="<ww:property value='#session.local.a00379' />")
		        {
		           ziti="2";
		        }
				else if(div.style.fontFamily=="<ww:property value='#session.local.a00380' />")
				{
				   ziti="3";
				}
			    else if(div.style.fontFamily=="<ww:property value='#session.local.a00381' />")
			    {
			       ziti="4";
			    }
			    else if(div.style.fontFamily=="<ww:property value='#session.local.a00382' />")
			    {
			       ziti="5";
			    }
			    else if(div.style.fontFamily=="<ww:property value='#session.local.a00383' />")
			    {
			       ziti="6";
			    }
			    else if(div.style.fontFamily=="<ww:property value='#session.local.b00135' />")
			    {
			       ziti="7";
			    }
			    else if(div.style.fontFamily=="<ww:property value='#session.local.b00136' />")
			    {
			       ziti="8";
			    }
			    else if(div.style.fontFamily=="<ww:property value='#session.local.b00137' />")
			    {
			       ziti="9";
			    } 
			    else
		        {
			       ziti="0";
		        }
		  
	            //基本属性
	            
	            //对齐方式
			    var ps=div.getElementsByTagName("p"); 
			    //字体属性             
			    var fonts=div.getElementsByTagName("font");
			    //加粗        
			    var strongs=div.getElementsByTagName("strong");
			    //下划线    
			    var vs=div.getElementsByTagName("u");
			    //斜体             
			    var ems=div.getElementsByTagName("em");
			    //中线            
			    var strikes=div.getElementsByTagName("strike");    
	     
	            var ftype=0;    //字体类型
	            var fcolor="-16777216";   //字体颜色
	            var bcolor="0";   //背景颜色
	            var fjc=0;    //加粗
	            var fdx=0;    //下划线
	            var fxx=0;    //斜线
	            var fzx=0;    //中线   
	            var txtcontent="";   //文本内容
	            
	            if(strongs.length>0){
	    	       fjc=1;
	            }
		        if(vs.length>0){
		          fdx=1;
		        }
		        if(ems.length>0){
		          fxx=1;
		        }
		        if(strikes.length>0){
		          fzx=1;
		        }
		        if(ps.length>0){
			      
		           var tempp= ps[0].align;
		       
		           if(tempp=="center"){
		        	   ftype=1; 
		           }else if(tempp=="right"){
		               ftype=2;
		           }else {
		               ftype=0;
		           }
		        } 

		        if(fonts.length>0){
			         var tempfont=fonts[0];
			         var tempfcolor=tempfont.color;
			       
			         if(tempfcolor=="#ed1c24"){
			              fcolor="-65536";
			         }
			         if(tempfcolor=="#3f48cc"){
			              fcolor="-16776961";
			         }
			         if(tempfcolor=="#ffc90e"){
			              fcolor="-256";
			         }
			         if(tempfcolor=="#22b14c"){
			              fcolor="-16711936";
			         }
			         if(tempfcolor=="#ffffff"){
			              fcolor="-2"; 
			         }
			         if(tempfcolor=="#7f7f7f"){
			              fcolor="-7829368";
			         }
			         if(tempfcolor=="#000000"){
			             fcolor="-16777216";
			         }
			         var tempbcolor=tempfont.style.backgroundColor;
			
			         if (tempbcolor.charAt(0) == '#'){
			   	    
				     }else{
				      	    var ds = tempbcolor.split(/\D+/);
				    	    var decimal = Number(ds[1]) * 65536 + Number(ds[2]) * 256 + Number(ds[3]);
				    	    tempbcolor= "#" + zero_fill_hex(decimal, 6);
				
				     } 
			  	  
			         if(tempbcolor=="#ed1c24"){
				            bcolor="-65536";
				       }
				       if(tempbcolor=="#3f48cc"){
				            bcolor="-16776961";
				       }
				       if(tempbcolor=="#ffc90e"){
				            bcolor="-256";
				       }
				       if(tempbcolor=="#22b14c"){
				            bcolor="-16711936";
				       }
				       if(tempbcolor=="#ffffff"){
				            bcolor="-2"; 
				       }
				       if(tempbcolor=="#7f7f7f"){
				            bcolor="-7829368";
				       }
				       if(tempbcolor=="#000000"){
				            bcolor="-16777216";
				       }
			
				       for(var k=0;k<ps.length;k++)
				       {
					     
					       if(txtcontent==""){
					    	   txtcontent=ps[k].innerHTML;
						   }else{
							   txtcontent+="<BR><BR>"+ps[k].innerHTML;
						   }
					   }
				       
				       for(var k=0;k<fonts.length;k++)
				       {
					       if(txtcontent==""){
					    	   txtcontent=fonts[k].innerHTML;
						   }else{
							   txtcontent+="<BR><BR>"+fonts[k].innerHTML;
						   }
					   }
				      
			      }else{

			    	  //字体颜色
			           //背景颜色
			             var backcolor=div.getAttribute("backcolor");   //背景颜色
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
					       
				         var txtfontcolor=div.getAttribute("fontcolor");   //字体颜色 
				       
				         if(txtfontcolor=="#ED1C24"){
				              fcolor="-65536";
				         }
				         if(txtfontcolor=="#3F48CC"){
				              fcolor="-16776961";
				         }
				         if(txtfontcolor=="#FFC90E"){
				              fcolor="-256";
				         }
				         if(txtfontcolor=="#22B14C"){
				              fcolor="-16711936";
				         }
				         if(txtfontcolor=="#FFFFFF"){
				              fcolor="-2"; 
				         }
				         if(txtfontcolor=="#7F7F7F"){
				              fcolor="-7829368";
				         }
				         if(txtfontcolor=="#000000"){
				             fcolor="-16777216";
				         }         
			    	  txtcontent=div.innerHTML;
			      }
	         
	    	  txtcontent=div.innerHTML;
              //过滤内容特殊字符 
		      txtcontent=txtcontent.replace(/\~/g, "");
		      txtcontent=txtcontent.replace(/<A\s[^>]*>/g,"");
		      txtcontent=txtcontent.replace(/<\/A>/g,"");
		      
		      var  textDataSource=div.getAttribute("textDataSource");

			  //静态文本  
		      if(type==2)
		      {
			         var fs=div.style.fontSize; 
		             var lastIndex = fs.lastIndexOf('px');      
				     if (lastIndex > -1) {     
				            fs = fs.substring(0, lastIndex);   
				           
				      }
	      	          var lh= div.style.lineHeight;  
	      	          lastIndex = lh.lastIndexOf('px');      
		              if (lastIndex > -1) {     
		                  lh = lh.substring(0, lastIndex);   
		              }
		              seecontent+="<div style='overflow:hidden;font-family:"+div.style.fontFamily+";font-size:"+parseInt(fs/sf)+"px;z-index:20;line-height:"+parseInt(lh/sf)+"px;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px'>"+div.innerHTML+"</div>";

				      if(value==1)
	                  {
		    	           var nbsp2="";
				           if(ziti==0){
				        	  nbsp2=div.innerHTML.replace(/&nbsp;/g,"&nbsp;&nbsp;");
					       }else{
			                  nbsp2=div.innerHTML;    
						   }
		                   gcontent+="<div style='font-family:"+div.style.fontFamily+";font-size:"+parseInt(fs/sf)+"px;z-index:20;line-height:"+parseInt(lh/sf)+"px;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px'>"+div.innerHTML+"</div>";
	                       //content+="<div style='font-family:a"+ziti+";font-size:"+parseInt(fs/sf)+"px;z-index:9;line-height:"+parseInt(lh/sf)+"px;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px'>"+nbsp2+"</div>";
		         
					       if(txt==""){
				               txt=div.id+"~"+left+"~"+top+"~"+width+"~"+height+"~"+type+"~"+bcolor+"~"+txtcontent+"~"+ziti+"~"+fcolor+"~"+speed+"~"+parseInt(fs/sf)+"~"+parseInt(lh/sf)+"~"+fjc+"~"+fdx+"~"+fxx+"~"+fzx+"~"+ftype+"~"+textDataSource;
				           }else{
				      	       txt=txt+"*"+div.id+"~"+left+"~"+top+"~"+width+"~"+height+"~"+type+"~"+bcolor+"~"+txtcontent+"~"+ziti+"~"+fcolor+"~"+speed+"~"+parseInt(fs/sf)+"~"+parseInt(lh/sf)+"~"+fjc+"~"+fdx+"~"+fxx+"~"+fzx+"~"+ftype+"~"+textDataSource;
				           }
		        
		               }
		       
		      }else{
			      
			       var fs=div.style.fontSize; 
		           var lastIndex = fs.lastIndexOf('px');      
			       if (lastIndex > -1) {     
			            fs = fs.substring(0, lastIndex);   
			           
			       }
		           var lh= div.style.lineHeight;  
		           lastIndex = lh.lastIndexOf('px');      
				   if (lastIndex > -1) {     
				            lh = lh.substring(0, lastIndex);   
				           
				   }
		           var jiajia="";
		           var t1;
				   if(type==0)
				   {
				      t1="up";
				   }		 
				   else if(type==1)
				   {
					   t1="left";
					   jiajia="white-space:nowrap;";
					  
				   }else if(type==3){
		               t1="down";
				   }else if(type==4) {
		               t1="right";
		               jiajia="white-space:nowrap;";
				   }
			 
			       seecontent+="<div style='"+jiajia+"font-family:"+div.style.fontFamily+";font-size:"+parseInt(fs/sf)+"px;z-index:20;line-height:"+parseInt(lh/sf)+"px;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px'><marquee    direction='"+t1+"' scrollamount='"+speed+"'  style='"+jiajia+"font-family:"+div.style.fontFamily+";font-size:"+parseInt(fs/sf)+"px;z-index:9;line-height:"+parseInt(lh/sf)+"px;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px'>"+div.innerHTML+"</marquee></div>";
			       if(value==1)
				   {
				   
				     if(txt==""){
				          txt=div.id+"~"+left+"~"+top+"~"+width+"~"+height+"~"+type+"~"+bcolor+"~"+txtcontent+"~"+ziti+"~"+fcolor+"~"+speed+"~"+parseInt(fs/sf)+"~"+parseInt(lh/sf)+"~"+fjc+"~"+fdx+"~"+fxx+"~"+fzx+"~"+ftype+"~"+textDataSource;
				     }else{
				      	  txt=txt+"*"+div.id+"~"+left+"~"+top+"~"+width+"~"+height+"~"+type+"~"+bcolor+"~"+txtcontent+"~"+ziti+"~"+fcolor+"~"+speed+"~"+parseInt(fs/sf)+"~"+parseInt(lh/sf)+"~"+fjc+"~"+fdx+"~"+fxx+"~"+fzx+"~"+ftype+"~"+textDataSource;
				     }
				    
			       }
		      }
		 }else if(key=="video"){


		        //获取音频视频文件名
		        
		        var videoJsonDatas=div.getAttribute("jsonData");
		        var objs = eval( "(" + videoJsonDatas + ")" );//转换后的JSON对象

		      
				var vid=false;
				vt=objs.mMediaList[0].path;
				var ads;
				if(vt.indexOf(":")==-1&&vt.indexOf("#")==-1)
				{
						vid=true;
						var ind=vt.lastIndexOf(".");
						ads=vt.substring(0,ind);
					    vt=ads+'_.flv';
		        }
		   
		       //预览效果
		       var mediaType=objs.mMediaList[0].type;
		       
		       if(mediaType==3||mediaType==4||mediaType==5){

		    	   var mediaTxt="";
		    	   if(mediaType==3){
		    		   mediaTxt="<ww:property value='#session.local.a00716' />";
			       }else if(mediaType==4){
			    	   mediaTxt="<ww:property value='#session.local.a00345' />";
				   }else if(mediaType==5){
					   mediaTxt="<ww:property value='#session.local.a00346' />";
				   }
		    	   seecontent+="<div style='background-color: #000000;color:#FFFFFF;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px'>"+mediaTxt+"</div>";

			   }else {

				   //判断浏览器
	               var mb = myBrowser();
			      
				   if ("Chrome" == mb) {
					 seecontent+="<object z-index='5' style='POSITION:absolute; z-index:-1;width:"+width+"px;height:"+height+"px;left:"+left+"px;top:"+top+"px;' id='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0' width='"+width+"' height='"+height+"'>";
				   }else{
					 seecontent+="<object z-index='5' style='POSITION:absolute; z-index:-1;width:"+width+"px;height:"+height+"px;' id='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0' width='"+width+"' height='"+height+"'>";
				   }  

				    seecontent+="<param name='movie'  value='../flvplayer.swf'>"; 
				    seecontent+="<param name='quality'  value='high'>";
				    seecontent+="<param name='allowFullScreen'  value='true'>";
				    seecontent+="<param name='FlashVars'  value='vcastr_file="+vt+"&BufferTime=3&IsAutoPlay=1'>";
				    seecontent+="<embed wmode='transparent'  style='POSITION:absolute; z-index:-1;left:"+left+"px;top:"+top+"px;width:"+width+"px;height:"+height+"px;'  src='../flvplayer.swf' allowfullscreen='true' flashvars='vcastr_file="+vt+"&IsAutoPlay=1' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='"+width+"' height='"+height+"'></embed>";
				    seecontent+="</object>";

			   }     
	           if(value==1)
		       {
		    	 objs.mId=div.id;
			     objs.mLeft=left;
			     objs.mTop=top;
			     objs.mWidth=width;
			     objs.mHeight=height;
			     jsonVideos[jsonVideos.length]=objs;                   
		       }
		
	     //app跳转
	     }else if(key=="myapp"){
		 
         
	          var appts=div.title.split("*");
	          
	          if(appts.length==3){

	    	      seecontent+="<div  title='"+div.title+"' style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src="+appts[1]+", sizingMethod=scale) alpha(opacity=100);'></div>";
			      if(value==1)
				  {
				    var appstrs=document.getElementById("appstrs").value;
				    if(appstrs.length>0){
				    	document.getElementById("appstrs").value=document.getElementById("appstrs").value+"@"+left+"*"+top+"*"+width+"*"+height+"*"+appts[1]+"*"+appts[0];
					}else{
						document.getElementById("appstrs").value=left+"*"+top+"*"+width+"*"+height+"*"+appts[1]+"*"+appts[0];
				    }
		            //gncj=left+"*"+top+"*"+width+"*"+height;
				    
		          }

		     }

	 	  //功能插件
	      }else if(key=="mygnc"){
		
	           seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: black;'></div>";
		       if(value==1)
			   {

				    gcontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: black;'></div>";
	
			        gncj=left+"~"+top+"~"+width+"~"+height;
			    
	           }
	      //楼层显示     
	      }else if(key=="mylcs"){
		  

	            seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: black;'></div>";
		        if(value==1)
			    {
				    gcontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: black;'></div>";
			        lcsh=left+"~"+top+"~"+200+"~"+200;			    
	            }
	       //二维码     
	      }else if(key=="codet"){
		 
	            seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #EBC84D;'></div>";
		        if(value==1)
			    {
				    gcontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #EBC84D;'></div>";
		            var  codeurl=div.getAttribute("codeurl");
		            var  codep=div.getAttribute("codep");
				    document.getElementById("code2").value=left+"*"+top+"*"+width+"*"+height+"*"+codeurl+"*"+codep;
			
	            } 

		   //网络摄像     
          }else if(key=="mycam"){
		 
	             seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #B4EEB4;color:#000000;'><ww:property value='#session.local.a00692' /></div>";
		         if(value==1)
			     {
			         gcontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #B4EEB4;color:#000000;'><ww:property value='#session.local.a00692' /></div>";
	
	                 var ctitle=div.title;
	                 //元素id*X*Y*宽*高*设备ID*用户名*密码*厂商
			         document.getElementById("netcamera").value=div.id+"*"+left+"*"+top+"*"+width+"*"+height+"*"+ctitle;
			
	              } 

		   //排队叫号  大屏 集中数据显示      
          }else if(key=="qmany"){
		 

	            seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'><ww:property value='#session.local.a00700' /></div>";
	            if(value==1)
		        {
		            gcontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'><ww:property value='#session.local.a00700' /></div>";
                    var  ctitle=div.title;
		            document.getElementById("queue_many").value=div.id+"*"+left+"*"+top+"*"+width+"*"+height+"*"+ctitle;
		
                 }
                 
	      //排队叫号  小屏数据显示
          } else if(key=="qsing"){
		
	            seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'><ww:property value='#session.local.a00701' /></div>";
	            if(value==1)
		        {
		             gcontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'><ww:property value='#session.local.a00701' /></div>";

                     var  p=div.title;
        
		             document.getElementById("queue_single").value=div.id+"*"+left+"*"+top+"*"+width+"*"+height+"*"+ctitle;
		
                 } 
          //公交站台
          } else if(key=="mybus"){
		
	            seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'><ww:property value='#session.local.a00774' /></div>";
		        if(value==1)
			    {
			       gcontent+="<div style='z-index:9;LEFT:"+left+"px;POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'><ww:property value='#session.local.a00774' /></div>";
	
	               var ctitle=div.title;
	     
			       document.getElementById("bus_data").value=div.id+"*"+left+"*"+top+"*"+width+"*"+height+"*"+ctitle;
			
	             } 

		  //插件      
          }else if(key=="charg"){
		
	           seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION:absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'><ww:property value='#session.local.b00090' /></div>";
		       if(value==1)
			   {
	
	                 var jsonStr=div.getAttribute("jsonStr");
					 if(jsonStr!=null){
						   jsonStr=jsonStr.replace(/"/g,"'"); 
						   var programDll = eval( "(" + jsonStr + ")" );//转换后的JSON对象
						   programDll.mId=div.id;
						   programDll.mLeft=left;
						   programDll.mTop=top;
						   programDll.mWidth=width;
						   programDll.mHeight=height;
						   jsonDlls[jsonDlls.length]=programDll;     
					 }   		
	           } 

		   //环境监测    
          }else if(key=="envir"){
      		
	           seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION:absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'><ww:property value='#session.local.b00159' /></div>";
		       if(value==1)
			   {
	
	                
						   var programDll = new Object();//转换后的JSON对象
						   programDll.mId=div.id;
						   programDll.mLeft=left;
						   programDll.mTop=top;
						   programDll.mWidth=width;
						   programDll.mHeight=height;
						   programDll.type=102;
						   jsonDlls[jsonDlls.length]=programDll;     
					  		
	           } 

		   //天气    
         }else if(key=="mytqs"){
		

	              seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color:#8DB6CD;color:#000000;'><ww:property value='#session.local.a00177' /></div>";
			      if(value==1)
				  {
				    
		
		               var  wtitle=div.title;
		               var citykey=document.getElementById("citykey").value;
		               // 元素id*x*y*w*h*刷新时间*字体大小*字体颜色*城市--切换时间@城市--切换时间#2
		               if(citykey.length==0){
		            	   document.getElementById("citykey").value=div.id+"*"+left+"*"+top+"*"+width+"*"+height+"*"+wtitle;
		               }else{
		            	   document.getElementById("citykey").value=citykey+"#"+div.id+"*"+left+"*"+top+"*"+width+"*"+height+"*"+wtitle;
		               }
				      
				
		           } 
        
        }else if(key=="sourc"){
				    seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'><ww:property value='#session.local.a00996' /></div>";
				    if(value==1)
				    {
			            var jsonStr=div.getAttribute("jsonStr");
						if(jsonStr!=null){
						    var programDsource;
						    jsonStr=jsonStr.replace(/'/g,"\""); 
						    var programDsource = new Object();//转换后的JSON对象
						    programDsource.source=jsonStr;
						    programDsource.mId=div.id;
						    programDsource.mLeft=left;
						    programDsource.mTop=top;
						    programDsource.mWidth=width;
						    programDsource.mHeight=height;
						    jsonSource[jsonSource.length]=programDsource;     
						} 
					}
		//控件节目			
        }else if(key=="dllIt"){
	               seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'><ww:property value='#session.local.b00118' /></div>";
				   if(value==1)
				    {
			
			            var jsonData=div.getAttribute("jsonData");
						if(jsonData!=null){
						    var programDsource;
						    
						    jsonData=jsonData.replace(/'/g,"\"");
			
						    var objs = eval( "(" + jsonData + ")" );//转换后的JSON对象
					   		  		 		 
						    var programDsource = new Object();//转换后的JSON对象

						    programDsource.mDllItemUserList=objs.mDllItemList;
						    programDsource.mId=div.id;
						    programDsource.mLeft=left;
						    programDsource.mTop=top;
						    programDsource.mWidth=width;
						    programDsource.mHeight=height;
						    jsonDllItem[jsonDllItem.length]=programDsource;     
						} 
					}
		 //网页			
         }else if(key=="htmls"){
	

	           seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #3CB371;color:#000000;'><ww:property value='#session.local.a00189' /></div>";
		       if(value==1)
			   {		   
		            var  htitle=div.title;
		            var htmlv=document.getElementById("html").value;
		            // 元素id*x*y*w*h*刷新时间*滚动*网页地址--切换时间@网页地址--切换时间
		            htitle=htitle.replace(/amp;/g,"");
					if(htmlv.length==0){
		         	   document.getElementById("html").value=div.id+"*"+left+"*"+top+"*"+width+"*"+height+"*"+htitle;
		            }else{
		         	   document.getElementById("html").value=htmlv+"#"+div.id+"*"+left+"*"+top+"*"+width+"*"+height+"*"+htitle;
		            }
	           } 
        //时钟显示
        }else if(key=="mytim"){
		 
		     //var mytimPros=div.title.split('@');

		     var jsonData=div.getAttribute("jsonData");

		    
		     if(jsonData==null){
              
			 }else{
				 jsonData=jsonData.replace(/'/g,"\"");
					
				 var obj= eval( "(" + jsonData + ")" );//转换后的JSON对象
				    
			     
			     //时间类型 
	             var mytimType=obj.tType;
	            
	             var mytimContent=""; 
	             if(mytimType==1){
	                 
	            	 var now = new Date();

	         		 var year = now.getFullYear();
	         	
	         		 var month = now.getMonth() + 1;
	         		 month=month>9?month:"0"+month; //如果月份小于10,则在前面加0补充为两位数字
	         		 var date = now.getDate();
	         		 date=date>9?date:"0"+date;
	         		 var hours = now.getHours();
	         		 hours=hours>9?hours:"0"+hours;
	         		 var minutes = now.getMinutes();
	         		 minutes=minutes>9?minutes:"0"+minutes;
	         		 var seconds = now.getSeconds();
	         		 seconds=seconds>9?seconds:"0"+seconds;
	                 var day = now.getDay();
		         	 Day = new MakeArray(7);
		        	 Day[0] = "<ww:property value='#session.local.a00309' />";  //星期日
		        	 Day[1] = "<ww:property value='#session.local.a00303' />";  //星期一
		        	 Day[2] = "<ww:property value='#session.local.a00304' />";  //星期二 
		        	 Day[3] = "<ww:property value='#session.local.a00305' />";  //星期三
		        	 Day[4] = "<ww:property value='#session.local.a00306' />";  //星期四
		        	 Day[5] = "<ww:property value='#session.local.a00307' />";  //星期五
		        	 Day[6] = "<ww:property value='#session.local.a00308' />";  //星期六
	         		
	                  //显示类型
	                  var mytimShowType=obj.tsType;
	                  if(mytimShowType==1){
	                	  //mytimContent="yyyy-MM-dd";
	                	  mytimContent=year+"-"+month+"-"+date;
	                  }else if(mytimShowType==2){
	                	  //mytimContent="yyyy年MM月dd日";
	                	  mytimContent=year+"<ww:property value='#session.local.a00297' />"+month+"<ww:property value='#session.local.a00298' />"+date+"<ww:property value='#session.local.a00299' />";
	                  }else if(mytimShowType==3){
	                	  //mytimContent="MM-dd-yyyy";
	                	  mytimContent=month+"-"+date+"-"+year;
	                  }else if(mytimShowType==4){
	                	  //mytimContent="HH:mm:ss";
	                	  mytimContent=hours+":"+minutes+":"+seconds;
	                  }else if(mytimShowType==5){
	                	  //mytimContent="HH:mm";
	                	  mytimContent=hours+":"+minutes;
	                  }else if(mytimShowType==6){
	                	  //mytimContent="HH时mm分ss秒";
	                	  mytimContent=hours+"<ww:property value='#session.local.a00494' />"+minutes+"<ww:property value='#session.local.a00495' />"+seconds+"<ww:property value='#session.local.a00106' />";
	                  }else if(mytimShowType==7){
	                	  mytimContent=Day[day];
	                  }else if(mytimShowType==8){
	                	  //mytimContent="yyyy年MM月dd日  EEEE HH:mm:ss";
	                	  mytimContent=year+"<ww:property value='#session.local.a00297' />"+month+"<ww:property value='#session.local.a00298' />"+date+"<ww:property value='#session.local.a00299' />  "+Day[day]+" "+hours+":"+minutes+":"+seconds;
	                  }else if(mytimShowType==9){
	                	  //mytimContent="MM月dd日yyyy年 EEEE HH:mm:ss";
	                	  mytimContent=month+"<ww:property value='#session.local.a00298' />"+date+"<ww:property value='#session.local.a00299' />"+year+"<ww:property value='#session.local.a00297' />  "+Day[day]+" "+hours+":"+minutes+":"+seconds;
	                  }

	                  
	             }else if(mytimType==3){

	            	//获取单位显示 类型 
	            	
	            	var unitShow=obj.unitShow;
	            	
	             	//天
	             	if(obj.ttDa==1){
	             		
	             		if(unitShow==0){
	             			mytimContent+="XX<ww:property value='#session.local.a00300' />";
	                    }else{
	                    	mytimContent+="XX ";
	                    }
	                }

	             	//小时
	             	if(obj.ttHo==1){
	             		if(unitShow==0){
	             			mytimContent+="XX<ww:property value='#session.local.a00301' />";
	                    }else{
	                    	mytimContent+="XX ";
	                    }
	                }

	             	//分钟
	             	if(obj.ttMi==1){
	             		if(unitShow==0){
	             			mytimContent+="XX<ww:property value='#session.local.a00302' />";
	                    }else{
	                    	mytimContent+="XX ";
	                    }
	                }

	             	//秒
	             	if(obj.ttSs==1){
	             		if(unitShow==0){
	             			mytimContent+="XX<ww:property value='#session.local.a00106' />";
	                    }else{
	                    	mytimContent+="XX ";
	                    }
	                }


	             }
			 }

		    

             //字体大小
             var mytimFontSize=obj.fs;
             
             
             //字体颜色 
             var mytimFontColor=obj.fcolor;
             
             seecontent+="<div style='z-index:500;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;color:#"+mytimFontColor+";font-size:"+mytimFontSize+"'>"+mytimContent+"</div>";
		  
		  
	      
	          if(value==1)
		     {	    	
	           

                obj.mId=div.id;
			    obj.mLeft=left;
			    obj.mTop=top;
			    obj.mWidth=width;
			    obj.mHeight=height;
			    jsonTimes[jsonTimes.length]=obj;      

             } 

	  //截屏显示    
      }else if(key=="seejp"){
    	
		    var jpsrc=div.getAttribute("jpsrc"); 
		    seecontent+="<iframe title='"+div.title+"'  allowtransparency='true' src='"+jpsrc+"' style='POSITION: absolute;z-index:3;left:"+left+"px;top:"+top+"px;width:"+width+"px;height:"+height+"px; border:0px;' marginwidth='0'  marginheight='0' frameborder='0' scrolling='no'></iframe>";
		  	if(value==1)
			{
				 document.getElementById("jptxt").value=div.id+"_"+left+"_"+top+"_"+width+"_"+height+"_"+div.title+"_"+jpsrc;
			}
			 
       //Rss数据源	
      }else if(key=="mynew"){
          
    	        var rsssrc=div.getAttribute("rsssrc"); 
    	        var rsssrcs=rsssrc.split("&");
    	        var src1="";
				if(rsssrcs.length==6){
				       var gd=Math.round(rsssrcs[5].split("=")[1]/sf);
				       var dx=Math.round(rsssrcs[2].split("=")[1]/sf);
				       src1=rsssrcs[0]+"&"+rsssrcs[1]+"&"+"dx="+dx+"&"+rsssrcs[3]+"&"+rsssrcs[4]+"&gd="+gd;
			  	}
			  
	            seecontent+="<iframe title='"+div.title+"'  allowtransparency='true' src='"+src1+"' style='POSITION: absolute;z-index:3;left:"+left+"px;top:"+top+"px;width:"+width+"px;height:"+height+"px; border:0px;' marginwidth='0'  marginheight='0' frameborder='0' scrolling='no'></iframe>";
	       	    if(value==1)
	   		    {
	             //判断滚动类型          
	              var rtype=1;
	              if (rsssrcs[0].indexOf("getrss2") == -1) {
	           	      rtype = 1;
				  } else {
			    	  rtype = 2;
				  }   
	             
	              //元素id_^x_^y_^w_h_^请求数据url_^字体颜色_^字体大小_^滚动速度_^刷新时间
	              document.getElementById("rsskey").value=div.id+"_^"+left+"_^"+top+"_^"+width+"_^"+height+"_^"+rsssrcs[0].split("=")[1]+"_^"+rsssrcs[1].split("=")[1]+"_^"+dx+"_^"+rsssrcs[4].split("=")[1]+"_^"+div.title+"_^"+rtype;	  
	   		   }

          }else if(key=="imggr"){
          
        	  seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color:#000000;color:#FFFFFF;font-size:36px;'><ww:property value='#session.local.b00127' /></div>";
		      if(value==1)
			  {
		    	    var jsonData=div.getAttribute("jsonData");
		    	    
		    	    jsonData=jsonData.replace(/'/g,"\"");
					
				    var objs = eval( "(" + jsonData + ")" );//转换后的JSON对象
			   		  
		 		 
				    
				    objs.mId=div.id;
				    objs.mLeft=left;
				    objs.mTop=top;
				    objs.mWidth=width;
				    objs.mHeight=height;
				    jsonImgsGroup[jsonImgsGroup.length]=objs;     

				    
		    	   
				   
	          }
          }  

    }


	//获取图片  ,offcie 集合
	var imgs=topdiv.getElementsByTagName("img");
	for(var i = 0;i<imgs.length;i++)
	{
		  div=imgs[i];
		  //获取对象
		  var imgJsonDatas=div.getAttribute("jsonData");
		  var objs = eval( "(" + imgJsonDatas + ")" );//转换后的JSON对象
		  left=Math.round(div.offsetLeft/sf);
	      top=Math.round(div.offsetTop/sf);
	      
	      width=Math.round(div.offsetWidth/sf);
	      height=Math.round(div.offsetHeight/sf);		

	      if(norMaltx-width<differenceValue){
               width=norMaltx;
		  }

	      if(norMalty-height<differenceValue){
              height=norMalty;
		  }
		  
          

		  var th=1;
		  var key=div.id.substring(0,5);
		  if(key=="image"||key=="myppt"||key=="mydoc"||key=="myxls"||key=="mypdf")
		  {
		    if(key=="myppt")
			{
			   th=6;
			}
			else if(key=="mydoc")
			{
			   th=7;
			}
			else if(key=="myxls")
			{
			   th=8;
			}
			else if(key=="mypdf")
			{
			   th=9;
			}
			else if(key=="image")
			{
			  th=4;
			}
		    if(fcontent.length==0)
			{	
			    fcontent=th+""+left+"|"+top+"|"+width+"|"+height+"|"+div.title;
			}else{
			    fcontent+="/"+th+""+left+"|"+top+"|"+width+"|"+height+"|"+div.title;
			}
            seecontent+="<img id='1' style='z-index:10;POSITION:absolute;left:"+left+"px;top:"+top+"px;width:"+width+"px;height:"+height+"px' src='"+objs.mMediaList[0].path+"'/>"; 
		    if(value==1)
			{
				     objs.mId=div.id;
				     objs.mLeft=left;
				     objs.mTop=top;
				     objs.mWidth=width;
				     objs.mHeight=height;
				     jsonImgs[jsonImgs.length]=objs;
				   
			  }
			
		  }
	
	   }    
	     

	  seecontent+="</body>";
	  if(value==1)
	  {
		  gcontent+="</body>";
	      content+="</body>";
	  }
		
	
	  seecontent="<SCRIPT  src='jqfont.js' type=text\/javascript><\/SCRIPT><SCRIPT  src='jqfont2.js' type=text\/javascript><\/SCRIPT><SCRIPT  type=text\/javascript> $(function () { $('marquee').marquee(''); });<\/SCRIPT><meta http-equiv='content-type' content='text/html;charset=utf-8'><body "+bgshow+">"+seecontent;
	  if(value==1)
	  {
	      gcontent="<SCRIPT  src='jqfont.js' type=text\/javascript><\/SCRIPT><SCRIPT  src='jqfont2.js' type=text\/javascript><\/SCRIPT><SCRIPT  type=text\/javascript> $(function () { $('marquee').marquee(''); });<\/SCRIPT>"
		  +"<meta http-equiv='content-type' content='text/html;charset=utf-8'>"
		  +"<body style='background-color:transparent'>"+gcontent;
	      content="<SCRIPT  src='jqfont.js' type=text\/javascript><\/SCRIPT><SCRIPT  src='jqfont2.js' type=text\/javascript><\/SCRIPT><SCRIPT  type=text\/javascript> $(function () { $('marquee').marquee(''); });<\/SCRIPT><style type=\"text/css\">@font-face{font-family: a1;src: url(\"file:///android_asset/fonts/1.ttf\")}@font-face{font-family: a2;src: url(\"file:///android_asset/fonts/2.ttf\")}@font-face{font-family: a3;src: url(\"file:///android_asset/fonts/3.ttf\")}@font-face{font-family:a4;src: url(\"file:///android_asset/fonts/4.ttf\")}@font-face{font-family: a5;src: url(\"file:///android_asset/fonts/5.ttf\")}@font-face{font-family: a6;src: url(\"file:///android_asset/fonts/6.ttf\")}</style>"	  +"<meta http-equiv='content-type' content='text/html;charset=utf-8'><body scroll='no' style='background-color:transparent'>"+content;
	  }
		
      document.getElementById("seecontent").value=seecontent;
      
      if(value==1)
	  {
	        document.getElementById("content").value=content;
			document.getElementById("fcontent").value=fcontent;
			document.getElementById("gcontent").value=gcontent;
			document.getElementById("text").value=txt;		
			//document.getElementById("timeHtml").value=timeHtml+"</body>";
			//document.getElementById("timeTxt").value=timeTxt;
			document.getElementById("gncj").value=gncj;
			document.getElementById("lcsh").value=lcsh;
			document.getElementById("bginfo").value=bfile;

			//图片json
			document.getElementById("jsonImgs").value=JSON.stringify(jsonImgs);

            //音频,视频,图片混合json
			document.getElementById("jsonVideos").value=JSON.stringify(jsonVideos);

			//插件集合
			document.getElementById("jsonDlls").value=JSON.stringify(jsonDlls);
			
			//数据接口
			document.getElementById("jsonSource").value=JSON.stringify(jsonSource);

            //控件节目 
			document.getElementById("jsonDllItem").value=JSON.stringify(jsonDllItem);

			//图片组
			document.getElementById("jsonImgsGroup").value=JSON.stringify(jsonImgsGroup);

			//时间
            document.getElementById("timeTxt").value=JSON.stringify(jsonTimes);;

			
		 }
      
		//get_item_time();	
        if(value==0)
        {
            document.form1.target="_blank"; 
            document.form1.action="seescene.vs";  
            document.form1.submit();
        }
        else if(value==1)
        {
		    //if(document.getElementById("stime").value<1)
			//{
			// alert("<ww:property value='#session.local.a00384' />");
			// return;
			//}
		    //if(document.getElementById("stime").value>10000)
			//{
			//alert("<ww:property value='#session.local.a00386' />");
			//return;
			//}
			
			 var chkObjs = document.getElementsByName("smartPlay");
		     for(var i=0;i<chkObjs.length;i++){
			  
		         if(chkObjs[i].checked == true){
			         
		             document.getElementById("stime").value=-1;
		             
		             break;
		         }
		         
		     }
		     
			
			var topfd=document.getElementById("ie_item_make").contentWindow.document.getElementById("topfd");

			topfd.setAttribute("currenttotal",total); 

			
		    if(document.getElementById("ie_item_make").contentWindow.document.getElementById("total")==null){
				var tfbg=topfd.style.backgroundImage; 
				var ttitle=topfd.title;
				var twidth=topfd.style.posWidth;	
				var theight=topfd.style.posHeight;
				var tfinner="<div style='left:0px; top:0px;background-color:#CFDBE5;background-image:"+tfbg+";position:absolute;width:"+twidth+"px;height:"+theight+"px' contentEditable=true id=topfd title="+ttitle+">"+topfd.innerHTML+"</div>";
                
                document.getElementById("mcontent").value=tfinner;
		    }else{
		        document.getElementById("mcontent").value=document.getElementById("ie_item_make").contentWindow.document.getElementById("total").innerHTML;
			} 

            document.form1.target="_self"; 

            document.form1.action="savescene.vs";
              
            document.form1.submit();

   }

}

 
</script>
</head>
<body>
<script type="text/javascript"> 
    document.body.onselectstart=document.body.oncontextmenu=function(){ return false;} 
</script> 

<form  name="form1" method="post" >
<!--头部-->
<div class="footer">
   
</div>

<div  id="content" style="width:100%;">
	<div class="c_middle pm_middle">
 
		<!--左边菜单-->
		<div class="pm_right" style="float: left;border:5px solid #e5e5e5;">
		<div style="background-color:#EEEEEE;" id="c_right_id" >
			<div class="pr_container"   >
                <!--功能菜单-->
				<ul class="right_1" id="step1" style="padding-left: 0px;">
				    <li id="step2"><a href="javascript:open_win_video();"><img src="image/<ww:property value='#session.local.a00000' />/manager_video.png"/></a></li> <!-- 视频 -->
					<li id="step3"><a  onclick="open_win_img()"><img src="image/<ww:property value='#session.local.a00000' />/m_pic.png"/></a></li> <!-- 图片 -->
					<li><a href="javascript:open_win_doc();"><img src="image/<ww:property value='#session.local.a00000' />/pmenu_3.png"/></a></li><!-- 文档  -->
					<li><a href="javascript:open_win_bj();"><img src="image/<ww:property value='#session.local.a00000' />/m_bg.png"/></a></li><!-- 背景  -->

					<li><a href="javascript:open_win_time();"><img src="image/<ww:property value='#session.local.a00000' />/pmenu_0.png"/></a></li>       <!-- 时钟 -->
					<li><a href="javascript:open_win_tq();"><img src="image/<ww:property value='#session.local.a00000' />/pmenu_5.png"/></a></li>       <!-- 天气 -->
					<li><a href="javascript:open_win_html();"><img src="image/<ww:property value='#session.local.a00000' />/pmenu_2.png"/></a></li><!-- 网页 -->
					
					<li class="menu_others">
					
					
					     <a href="#"><img src="image/<ww:property value='#session.local.a00000' />/m_others.png"/></a>
					     
					     <!--隐藏功能菜单-->
						<div class="menu_dropdown" id="menu_dropdown_id" style="display:none;z-index: 1;padding-left:0px;width: 280px;">
							<ul style="margin-left: -20px;">
							    <li><a href="javascript:open_win_audio();"><img src="image/<ww:property value='#session.local.a00000' />/m_audio.png"/></a></li><!-- 音频  -->
							    <li><a href="javascript:open_win_media();"><img src="image/<ww:property value='#session.local.a00000' />/m_media.png"/></a></li><!-- 多媒体  -->
<!--							<li><a href="javascript:open_win_rss();"><img src="image/pmenu_6.png"/></a></li>     RSS -->
								<li><a href="javascript:open_win_office('myppt');"><img src="image/pmenu_8.png"/></a></li>    <!-- PPT -->
								<li><a href="javascript:open_win_office('mydoc');"><img src="image/pmenu_9.png"/></a></li>    <!-- Word -->
								<li><a href="javascript:open_win_office('myxls');"><img src="image/pmenu_10.png"/></a></li>   <!-- Excel -->
								<li><a href="javascript:open_win_office('mypdf');"><img src="image/pmenu_11.png"/></a></li>   <!-- PDF -->	
								 
<!--							<li><a href="javascript:open_win_screen();"><img src="image/<ww:property value='#session.local.a00000' />/pmenu_4.png"/></a></li>        截图 -->
								
								<li><a href="javascript:open_win_netcamera();"><img src="image/<ww:property value='#session.local.a00000' />/camera.png"/></a></li>   <!-- 摄像 -->
								
								<ww:if test="#session.version_onoff.cutt==1">
								   <li><a href="javascript:open_win_code();"><img src="image/<ww:property value='#session.local.a00000' />/code.png"/></a></li>       <!-- 二维码 -->
								</ww:if>
								
								
								<li><a href="javascript:open_win_dll();"><img src="image/pmenu_12.png"/></a></li>  <!--  插件 -->  
								
								<li><a href="javascript:open_win_imgGroup();"><img src="image/<ww:property value='#session.local.a00000' />/m_img_group.png"/></a></li>  <!--  图片组 -->      
								
							</ul>
						</div>  
					    
					
					
					</li>   <!-- 其他 -->
					
					
	<!--			<li><a href="javascript:edit_div();"><img src="image/<ww:property value='#session.local.a00000' />/m_edit.png"/></a></li> 编辑 -->
	<!--                <li><a href="javascript:open_win_flash();"><img src="image/pmenu_1.png"/></a></li>                                                  FLASH         -->
	                
	<!--			<li><a href="javascript:div_remove();"><img src="image/<ww:property value='#session.local.a00000' />/m_del.png"/></a></li>          删除-->
	                
	<!--			<li><a href="javascript:open_win_dll();"><img src="image/<ww:property value='#session.local.a00000' />/pmenu_7.png"/></a></li>        插件 --> 
    <!--            <li><a href="javascript:open_win_hl();"><img src="image/<ww:property value='#session.local.a00000' />/m_hl.png"/></a></li> 汇率 -->
					
					
				</ul>
                
                      
						
						
				<ul class="pm_left_content" id="pm_left_content_id" style="margin-top: 5px;padding-left: 0px;">
			
			
                 <li >
                     <a>
                        <ww:property value='#session.local.a00133' />:&nbsp;&nbsp;
                        
                         <span id="lname" >
                 
                         </span>
                         <input type="hidden"  id="currentdivid"/>
                     </a>
                 </li><!-- 名称 -->
			     <li ><a><ww:property value='#session.local.a00035' />:&nbsp;&nbsp;<span id="ltype" ></span></a></li><!-- 类型 -->    
			     
			     
			     <li>
			         <a>
			            x&nbsp;&nbsp;<input onkeyup="setElementSize(this)"   id="lleft" type="text" style="width: 40px;height: 18px;margin-left: 2px;line-height: 18px;line-height: 18px;" value="0"    onafterpaste="this.value=this.value.replace(/\D/g,'')" />px&nbsp;
			            y&nbsp;&nbsp;<input onkeyup="setElementSize(this)"  id="ltop" type="text" style="width: 40px;height: 18px;margin-left: 2px;line-height: 18px;line-height: 18px;" value="0"     onafterpaste="this.value=this.value.replace(/\D/g,'')"/>px
			         </a>
			     </li>
			     <li>
			          <a>
			             <!-- 宽 --><ww:property value='#session.local.a00032' />&nbsp;<input onkeyup="setElementSize(this)"  type="text" id="lwidth" style="width: 40px;height: 18px;line-height: 18px;line-height: 18px;" value="0"    onafterpaste="this.value=this.value.replace(/\D/g,'')" />px&nbsp;
			             <!-- 高 --><ww:property value='#session.local.a00033' />&nbsp;<input onkeyup="setElementSize(this)"  type="text" id="lheight" style="width: 40px;height: 18px;line-height: 18px;line-height: 18px;" value="0"   onafterpaste="this.value=this.value.replace(/\D/g,'')" />px&nbsp;
			          </a>
			     </li>
			     <li >
			          <a style="font-size: 13px;"><ww:property value="#session.local.a00775"/></a> 
					  <input type="checkbox"   value="1"  id="gridAdsorption"/>
					  <input style="line-height: 34px;display:none;" type="checkbox" id="validityCheck" name="validityCheck"  value="1" />
			     </li>
			      
			     
			     <li style="display: none;"><a><ww:property value="#session.local.a00448"/>:&nbsp;&nbsp;<span id="bgname"></span></a></li><!-- 背景图 -->
			     <li style="display: none;" ><a><ww:property value="#session.local.a00449"/>:&nbsp;&nbsp;</a></li><!--背景音乐 -->
			     <li style="display: none;" style="border-bottom:5px solid #e5e5e5;" ><a><span id="bgaudio"></span></a></li>
			     
			    
			    
			     <!--  
			     <li><a><ww:property value="#session.local.a00632" />:&nbsp;&nbsp;&nbsp;&nbsp;<input style="line-height: 34px;" type="checkbox" id="validityCheck" name="validityCheck" value="1" /></a></li>
			              节目有效期
			     <li>
			       <a><ww:property value="#session.local.a00540" />:</a>
			       
			        <input id="validitySdate" type="text" name="validitySdate"  style="height: 22px;width: 140px;"    onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
			     </li>开始时间
			     <li style="border-bottom:5px solid #e5e5e5;">
			       <a><ww:property value="#session.local.a00541"/>:</a>
			       
			       <input id="validityEdate" type="text" name="validityEdate"  style="height: 22px;width: 140px;"   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
			     </li>结束时间
			     -->
			
			</ul>  
	
			</div>
		  </div>
		  </div>
		  
		  <div class="pm_mid">
		   
		       <!--制作区-->
		        <div class="blank_box"  id="blank_box_id" style="background:#fff;">
		            <iframe id="ie_item_make" name="myFrame" width="100%"   frameborder=0  src="item_makepage.jsp"></iframe> 
		        </div>
		       <!--制作区下方菜单-->
		        <div class="pm_mid_footer">
		        		
		            <div>
		            
		            
                        <button style="margin-left: -50px;margin-top:-3px;" class="btn  btn-primary" onclick="change_scene_size(1)" type="button"><i class="icon icon-plus-sign"></i></button> 
                       
                        <div style="margin-left: -3px;margin-top:-10px;position: absolute;"> 
                           <input type="text" disabled="disabled"  value="" id="sfv" style="border:0; color:#f6931f; font-weight:bold;width: 40px;margin-top:-16px;text-align: center;" /> <!-- 百分比显示 -->
                        </div>
                        
                        <button style="margin-left:50px;margin-top:-3px;" class="btn  btn-primary" onclick="change_scene_size(2)" type="button"><i class="icon icon-minus-sign"></i></button> 
		         
		            </div>
		            				
		            <!-- 当前分辨率 -->
					<div style="float: left;margin-top: -25px;margin-left: 100px;">
					     <ww:property value='#session.local.a00251' /> : 
					     <input  id="itemfbl" type="text" value="<ww:property value='#request.twidth'/>*<ww:property value='#request.theight'/>" style="width:100px;color:#626262;" disabled="disabled"/>
					     <!-- <select><option>1024*768</option></select> -->
					</div>
					 <!-- 节目名 --> 
					<div style="float: left;margin-top: -25px;">
					     <ww:property value='#session.local.a00255' /> : <input id="itemname" type="text" name='itemname' value="<ww:property value='#request.item.name' />" style="width:100px;color:#626262;"/>
					</div>
					<!-- 节目时长 -->
					<div style="float: left;margin-top: -25px;">
					     <ww:property value='#session.local.a00252' /> : <input type="text" id="stime" name="stime"  <ww:if test='#request.item.stime==0'>value="30"</ww:if><ww:else>value="<ww:property value='#request.item.stime' />"</ww:else>  style="width:60px;color:#626262;"/><ww:property value='#session.local.a00106' />
					     &nbsp;&nbsp;&nbsp;<ww:property value='#session.local.b00082' />:
					</div>
					
                    <!-- 智能播放 -->
					<div style="float: left;margin-top: -30px;margin-left:-5px;">  
					     <input onclick="smartPlayOnclick()"  type="checkbox"  value="-1"  id="smartPlay"  name="smartPlay"/>
					</div>

					<!-- 预览 -->
				    <button id="step4" style="margin-top:-45px;" class="btn  btn-primary" onclick="save(0,'')" type="button"><ww:property value='#session.local.a00253' /></button> 
					<!-- 保存 -->
					<button id="step5"   style="margin-top:-45px;" class="btn  btn-primary" onclick="save(1,'')" type="button"><ww:property value='#session.local.a00254' /></button>
					<!-- 返回 -->				
					<button   style="margin-top:-45px;" class="btn  btn-primary" onclick="a_win_local('returnmain.vs?show_menu=1')" type="button"><ww:property value='#session.local.a00013' /></button>
		        
		        
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
	 
	 <input type="hidden" id="jsonImgsGroup" name="jsonImgsGroup"/>		<!-- 控件节目集合 -->
	 
   
   </form>
   <div class="footer" style="background-image:url('');"> 
   </div>
  </body>
</html>
