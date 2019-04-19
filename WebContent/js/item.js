  
    //当前缩放比
    var cjzoom;
    //元素计数编号
    var total = 0;
    //当前点击元素
    var font=null;
    //获取编辑框
    var curTopfd1 = $("#topfd1");
    
    var divv;
    
    //转16进制
   function zero_fill_hex(num, digits) {
 	   
 	  var s = num.toString(16);
 	  while (s.length < digits)
 	  s = "0" + s;
 	  return s;
 	  
    }
    
   //智能播放
   function smartPlayOnclickNew(){

  	  if($('input[name="smartPlay"]').prop("checked"))
        {
            //alert("选中");
  		  $("#stime").val(-1);
  		  //$("#stime").attr("disabled",true);   // 禁用文本框（设置disabled属性为true）	 
        }else{
      	    //get_item_time();
        	//$("#stime").attr("disabled",false);   // 禁用文本框（设置disabled属性为true）
        	getItemStime();

        }
  	
    }
    
    
    
    //获取所有控件节目绑定的用户
    function getDllItemBindUserNew(){
 	   
    	var allDllItemUserList=new Array();
    	$("input[name = checkdom]:checkbox").each(function(){
    		console.log("控件插件:"+$(this).attr("eId"));
    		
    		if($(this).attr("eId").substring(0,5)=="dllIt"){
    			var dllItObj=$("#"+$(this).attr("eId"));
    			 var jsonData=dllItObj.attr("jsonData");
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
    	});
    	 return allDllItemUserList;	
 	 

 	  
    }

     
    //获取节目时长
    function getItemStime(){
    	
    	 if($('input[name="smartPlay"]').prop("checked"))
    	 {	       
    			  $("#stime").val(-1);
    			  	 
    	 }else{

    		
    		 
    		 var obj;
    		 var objtime;
    		 var stime=0;
    		 var key;
    		 
    		 
    		 $("input[name = checkdom]:checkbox").each(function(){
    	    		
    	    		key=  $(this).attr("eId").substring(0,5);
    	    		if(key=="video"||key=="image"||key=="myppt"||key=="mydoc"||key=="myxls"||key=="mypdf"){
    	    			 var elementObj=$("#"+$(this).attr("eId"));
    	    			 objtime=elementObj.attr("ptime");
        		    	 if(parseInt(stime)<=parseInt(objtime)){
        					  stime=objtime;
        				 }        		    	
    	    		}
    	      });
    		 
    		 
    		  //查看是否有音频
    		  var yxmusics=$("#video10000");
    				
    		  if(yxmusics.attr("id")!=undefined){
    				 
    			     objtime=yxmusics.attr("ptime");
    		    	 if(parseInt(stime)<=parseInt(objtime)){
    					  stime=objtime;
    				 }
    		    	 
    		   }
    		
    		   if(stime==0||stime<=30){
    			 
    	          stime=30;
    	       
    		   }  
    		   $("#stime").val(stime);
         }
    	
    }
    
    function check_save_item(){
    	
    	
    	//检测副屏是否添加
    	if($("#itemViceType").val()==1&&$("#screenTypeHtml").val()==0){
    		
	    	     $.ajax({
	    	  		type:'post',
	    	  		url:'ajaxcheckscenesub.vs',
	    	  		data:"fileName="+$("#mfile").val(),
	    	  		dataType:'json',
	    	  		async:false,
	    	  		success:function(data){
	    	  	       if(data == "1"){
	    	  	    	    save_item(1);
	    	  		   }else{
	    	  			   layer.alert(b00356);
	  	  	    	       return; 
	    	  		   }
	    	  		}
	    	  	});
    	     
    		
    	}else{
    		
    		 save_item(1);
    		
    	}
    	
    	
    }
    
    
    //检测节目是否冲突
    function check_item_key(){
    	
 		var selfItemKey=$("#itemKey").val().replace(/^\s+|\s+$/g,"");
		
 		var flag=false;
 		
		if(selfItemKey!=""){
		   	$.ajax({
                url:'aJaxGetItemKey.vs',
                data:{
			        filename : $("#mfile").val(),
			        selfItemKey:selfItemKey
			        
	            },
	             async:false,
				 type:'post',  
			     cache:false,  
			     success:function(data) {
				    
	            	var unItemKey=data.data.itemKey;
	            
	            	if(unItemKey.length==0){
	            		
	            		flag= true;
	            		
	            	}else{
	            		
	            		flag= false;
	            	}
	            	  
				 }
		   });
			
		}else{
			
			flag= true;
			
		}
		
		return flag;

    }
    
    
    //保存  预览/节目   0预览 1保存
    function save_item(handleType){
    	
    	var itemType= $("#itemType").val();
    	
    	//验证key是否冲突
  
    	if(conditionalOnOff==1){
    		
            if(!check_item_key()){
            	layer.alert("key值已存在请重命名");
            	return;
            }
    		
    	}
    
    	//原始宽高
	    var norMaltx=$("#tx").val();
	    var norMalty=$("#ty").val();

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
        
        //互动组
        var jsonRecyclers=new Array();

        var  fileArray=new Array();

        //网页组
        var jsonHtmls=new Array();

        //Rss
        var jsonRsss=new Array();
        
        //翻书
        var jsonImgsFlip=new Array();
        
        //当前缩放比
	    var sf=$("#sf").val();
	    
	    //当前场景对象
	    var curScene = $("#topfd1");
	    
	    
	    
	    //获取原始比
	    //var index=curScene.attr("title").indexOf("_");

	 	// 背景文件
	    var bfile=curScene.attr("bgnameUrl");;
	    //if(index!=-1){
		//    	bfile=curScene.attr("title").split("_")[1];
		//}else{
		        
		//}
		//预览拼接字符串(网页)
		var seecontent="";
		//安卓拼接字符串(暂不用)
		var content="";	  
        //所有元素的坐标 元素名 拼接
		var fcontent="";
		//x86拼接字符串(暂不用)
		var gcontent="";

		//curScene.css("width")
		//curScene.css("height")
		 //背景
		//获取背景色
		var bgColor=$("#topfd1").attr("bgColor");

	    var bgshow="style='background: url("+bfile+") no-repeat;width:"+norMaltx+"px;height:"+norMalty+";background-color:"+bgColor+";margin:0px;'";
	      //seecontent+="<div id='topfd' style='overflow: hidden; POSITION: absolute;background-image:url("+bfile+");left:0px;top:0px;width:"+topdiv.offsetWidth/sf+";height:"+topdiv.offsetHeight/sf+"'></div>";
 
	    if(handleType==1)
	    {
		     
		     if(curScene.attr("bgnameUrl")==undefined){
		    	 
		     }else{
		    	 if(curScene.attr("bgnameUrl").length>0)
			     {
			         fcontent="10|0|"+curScene.css("width")+"|"+curScene.css("height")+"|"+curScene.attr("title")+"|"+bfile;
			         console.log(fcontent);
			     }
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
		 var txt="";
		 var gncj="";
		 var lcsh="";
		 var showZindex=0;
		 
		 //var checkdoms=new Array();
		 
		 //$("input[name = checkdom]:checkbox").each(function(){
		 //	 checkdoms.push($(this));	
		 //});
	
		 //if($(obj[k]).attr("eId")!=undefined){
		 //		checkdoms.push(obj[k]);	
		 //}
		 
	
		//排序 从小到大
		//	checkdoms.sort(
		//		 function(a,b){
		//			return $("#"+$(a).attr("eId")).css("z-index")-$("#"+$(b).attr("eId")).css("z-index");
		 //        }
		//	);
			
		
		 
		 //遍历元素
		 $("input[name = checkdom]:checkbox").each(function(){
		 //for(var i=0;i<checkdoms.length;i++){
             div=$("#"+$(this).attr("eId"));
			 
			 key=div.attr("id").substring(0,5);
			 console.log("key值为"+key);
			 left=Math.round($("#"+$(this).attr("eId")).position().left/sf);
		     top=Math.round($("#"+$(this).attr("eId")).position().top/sf);
			 width=Math.round($("#"+$(this).attr("eId")).css("width").replace(/px/g,"")/sf);
		     height=Math.round($("#"+$(this).attr("eId")).css("height").replace(/px/g,"")/sf);
			 //div=$("#"+$(checkdoms[i]).attr("eId"));
			 
			 //console.log(div.attr("id")+" -  "+div.css("z-index"));
			 //alert(div.attr("id")+" -  "+div.css("z-index"));
			 //key=div.attr("id").substring(0,5);
			 //left=Math.round($("#"+$(checkdoms[i]).attr("eId")).position().left/sf);
		     //top=Math.round($("#"+$(checkdoms[i]).attr("eId")).position().top/sf);
			 //width=Math.round($("#"+$(checkdoms[i]).attr("eId")).css("width").replace(/px/g,"")/sf);
		     //height=Math.round($("#"+$(checkdoms[i]).attr("eId")).css("height").replace(/px/g,"")/sf);
		     showZindex= div.css("z-index");
		     
			 if(norMaltx-width<differenceValue){
		              width=norMaltx;
			 }

		     if(norMalty-height<differenceValue){
	                  height=norMalty;
			 }
		     
		     
		    
		     //开始
			 if(key=="image"||key=="myppt"||key=="mydoc"||key=="myxls"||key=="mypdf"||key=="himag"||key=="telle")
			 {
				 //获取对象
		   		var imgJsonDatas=div.attr("jsonData");
		   		var objs = eval( "(" + imgJsonDatas + ")" );//转换后的JSON对象
 
		   		var th=1;
		   		  
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
				else if(key=="image"||key=="himag"||key=="telle")
				{
				  th=4;
				  if(key=="himage"){
					  
					  showZindex=10000;
				  }
				}
			    if(fcontent.length==0)
				{	
				    fcontent=th+""+left+"|"+top+"|"+width+"|"+height+"|"+div.attr("title");
				}else{
				    fcontent+="/"+th+""+left+"|"+top+"|"+width+"|"+height+"|"+div.attr("title");
				}
			    
			    seecontent+="<script>var cur=0;var dorun=false;var imgs;var iframes;var iframe;var img;var spis;setInterval(\"startShow()\",1000);function startShow() { if(cur>36000){cur=0;}cur++;if(!dorun){dorun=true;imgs=document.getElementsByTagName(\"img\");iframes=document.getElementsByTagName(\"iframe\");}for(var i = 0;i<imgs.length;i++){img=imgs[i];if(img.title.length>0){spis=img.title.split(\'|\');if(cur%spis[0]==0){img.id++;if(img.id>=spis.length){img.id=1;}img.src=spis[img.id];}}}for(var i = 0;i<iframes.length;i++){iframe=iframes[i];if(iframe.title.length>0){if(cur%iframe.title==0){iframe.src=iframe.src;}}}}<\/script>";
			    
			    var imgTitle="5";
			    for (var m=0 ;m<objs.mMediaList.length;m++){
			    				    	
			    	var imgsrc= objs.mMediaList[m].path;			    	 
			    				    	
			    	imgTitle=imgTitle+"|"+imgsrc;
			    				    				    				    	  
			    }
			    
			    objs.elementHide=div.attr("elementHide");
			    
			   
			    if(div.attr("elementHide")=='true'){
			    	
			    	
			    }else{
			    	
			    	seecontent+="<img  title='"+imgTitle+"'  id='1' style='z-index:10;POSITION:absolute;left:"+left+"px;top:"+top+"px;width:"+width+"px;height:"+height+"px' src='"+objs.mMediaList[0].path+"'/>";	
			    
			    }	
	             
			   
	            if(handleType==1)
				{
			    	
	        	         objs.relationCall=div.attr("relationCall");
	        	         objs.mId=div.attr("id");
					     objs.mLeft=left;
					     objs.mTop=top;
					     objs.mWidth=width;
					     objs.mHeight=height;
					     objs.showZindex=showZindex;
					     if(key=="telle"){
					    	 
					    	 objs.tellerKey=div.attr("tellerKey");
					     }
					     
					     //tellerKey
					     
					     jsonImgs[jsonImgs.length]=objs;
					     
					     for (var j=0 ;j<objs.mMediaList.length;j++){
					    	 
					    	 fileArray[fileArray.length]=objs.mMediaList[j].path;
					    	 
					     }
				 }
				
			  }else if(key=="video"||key=="caroD"||key=="catal"){
				    //获取音频视频文件名
			        
			        var videoJsonDatas=div.attr("jsonData");
			        var objs = eval( "(" + videoJsonDatas + ")" );//转换后的JSON对象

			      
					var vid=false;
					var ads;
					var elem=div.attr("elementHide");
					if(elem!=null&&elem!=undefined){
						objs.elementHide=elem;
					}
					if(key=="video"){
						vt=objs.mMediaList[0].path;
						if(vt.indexOf(":")==-1&&vt.indexOf("#")==-1)
						{
								vid=true;
								var ind=vt.lastIndexOf(".");
								ads=vt.substring(0,ind);
							    vt=ads+'_.flv';
				        }
						   seecontent+="<param name='FlashVars'  value='vcastr_file="+vt+"&BufferTime=3&IsAutoPlay=1'>";
						   seecontent+="<embed wmode='transparent'  style='POSITION:absolute; z-index:-1;left:"+left+"px;top:"+top+"px;width:"+width+"px;height:"+height+"px;'  src='../flvplayer.swf' allowfullscreen='true' flashvars='vcastr_file="+vt+"&IsAutoPlay=1' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='"+width+"' height='"+height+"'></embed>";
						  
						   //预览效果
					       var mediaType=objs.mMediaList[0].type;
					       if(mediaType==3||mediaType==4||mediaType==5){

					    	   var mediaTxt="";
					    	   if(mediaType==3){
					    		   mediaTxt=localObj.a00716;
						       }else if(mediaType==4){
						    	   mediaTxt=localObj.a00345;
							   }else if(mediaType==5){
								   mediaTxt=localObj.a00346;
							   }
					    	   if(div.attr("elementHide")=='true'){
					    	   }else{	   
					    	   seecontent+="<div style='background-color: #000000;color:#FFFFFF;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px'>"+mediaTxt+"</div>";
					    	   }

						   }else {

							   if(div.attr("elementHide")=='true'){
					    	   }else{	
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
								    seecontent+="</object>";
					    	   }
						   }    
					}
		           if(handleType==1)
			       {
		        	  
		        	   
		        	 
	        	     //objs.relationCall=div.attr("relationCall");
			    	// objs.mId=div.attr("id");;
				     objs.mLeft=left;
				     objs.mTop=top;
				     objs.mWidth=width;
				     objs.mHeight=height;
				     objs.showZindex=showZindex;
				     objs.mId=div.attr("id");
				     var ycCount=$("#"+div.attr("id")).attr("ycCount");
				     if(ycCount==undefined)
				     {
				    	 ycCount=5;
				     }	
				     objs.ycCount=ycCount;
				     if(key=='caroD'){
				    	 objs.elementHide=true;
				     }
				     objs.bgtopfd=$("#"+div.attr("id")).attr("bgtopfd");
					 objs.bgname=$("#"+div.attr("id")).attr("bgname");
					 objs.bgnameUrl=$("#"+div.attr("id")).attr("bgnameUrl");
				     jsonVideos[jsonVideos.length]=objs;  
				     
				     for (var j=0 ;j<objs.mMediaList.length;j++){
				    	 
				    	 fileArray[fileArray.length]=objs.mMediaList[j].path;
				    	 
				     }
				     
			       }
				  
			  }else if(key=="fonts"){
		    	 
				     var rsd=div.attr("title").split('-');  
				     var type=rsd[0];   //滚动方式     0 向上滚动   1向左滚动    2静态文本   3向下滚动
				     var speed=rsd[1];  //滚动速度
				     var ziti="-1";     //字体类型
				     var divFontFamily=div.css("fontFamily");
				     
				     if(divFontFamily==localObj.a00377)
				     {
				    	 ziti="0";
				    	 
				     }else if(divFontFamily==localObj.a00378){
					     
				    	 ziti="1";
				    	 
					 }else if(divFontFamily==localObj.a00379){
						 
				         ziti="2";
				         
				     }else if(divFontFamily==localObj.a00380){
				    	 
						 ziti="3";
						 
					 }else if(divFontFamily==localObj.a00381){
						 
					     ziti="4";
					     
					 }else if(divFontFamily==localObj.a00382){
					       
						 ziti="5";
						 
					 }else if(divFontFamily==localObj.a00383){
						 
					     ziti="6";
					     
					 }else if(divFontFamily==localObj.b00135){
						 
					     ziti="7";
					     
					 }else if(divFontFamily==localObj.b00136){
						 
					     ziti="8";
					     
					 }else if(divFontFamily==localObj.b00137){
						 
					     ziti="9";
					     
					 }else if(divFontFamily==localObj.d00020)
					 {
						 ziti="10";
						 
					 }else if(divFontFamily==localObj.d00021)
					 {
						 ziti="11";
						 
					 }else if(divFontFamily==localObj.d00022)
					 {
						 ziti="12";
						 
					 }else{
						 
					     ziti="0";
				     }
				  
			         //基本属性
			            
			         var ftype=0;    //字体类型
			         var fcolor=div.attr("fontcolor");   //字体颜色
			         var bcolor=div.attr("backcolor");   //背景颜色
			         var fjc=div.attr("fbold");    //加粗
			         var fdx=div.attr("fsetline");    //下划线
			         var fxx=div.attr("fitallic");    //斜线
			         var fzx=div.attr("fsetstrike");    //中线   
			         var txtcontent="";   //文本内容
			         var highFontColor=div.attr("highFontColor");
			         var fontColorCb=div.attr("fontColorCb");
			         
			         var highBgColor=div.attr("highBgColor");
			         var bgColorCb=div.attr("bgColorCb");
			         
		 
                      
					 var backcolor=div.attr("backcolor");   //背景颜色
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
				     
				     var showBgColor="";
		             
		             if(bgColorCb==1){
		            	 
		            	 showBgColor=highBgColor;
		            	 
		             }else{
		            	 
		            	 showBgColor=backcolor;
		            	 
		            	 if(showBgColor==0){
		            		 showBgColor="transparent";
		            	 }
		            	 
		             }
							       
					 var txtfontcolor=div.attr("fontcolor");   //字体颜色 
					
					 
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
					 
					 //fcolor=txtfontcolor;
					 
			         txtcontent=div.html();
					 
			         //过滤内容特殊字符 
				     txtcontent=txtcontent.replace(/\~/g, "");
				     txtcontent=txtcontent.replace(/<A\s[^>]*>/g,"");
				     txtcontent=txtcontent.replace(/<\/A>/g,"");
				      
				     var  textDataSource=div.attr("textDataSource");
				     
				     var fs=div.attr("txtfontsize"); 
			            
	      	         var lh= div.attr("lineH")*fs; 

	      	         var elementHide=div.attr("elementHide");
			    	 
	      	         var relationCall=div.attr("relationCall");
			    	 
			    	 var relationKey=div.attr("relationKey");
	      	        
					  //静态文本  
				      if(type==2)
				      {
				    	      if(div.attr("elementHide")=='true'){}else{
			      	             seecontent+="<div style='background-color:"+showBgColor+";overflow:hidden;font-family:"+div.css("fontFamily")+";font-size:"+parseInt(fs)+"px;z-index:20;line-height:"+parseInt(lh)+"px;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px'>"+div.html()+"</div>";
				    	      }
						      if(handleType==1)
			                  {
				    	           var nbsp2="";
						           if(ziti==0){
						        	  nbsp2=div.html().replace(/&nbsp;/g,"&nbsp;&nbsp;");
							       }else{
					                  nbsp2=div.html();    
								   }
				                  
							       if(txt==""){
						               txt=div.attr("id")+"~"+left+"~"+top+"~"+width+"~"+height+"~"+type+"~"+bcolor+"~"+txtcontent+"~"+ziti+"~"+fcolor+"~"+speed+"~"+parseInt(fs)+"~"+parseInt(lh)+"~"+fjc+"~"+fdx+"~"+fxx+"~"+fzx+"~"+ftype+"~"+textDataSource+"~"+showZindex+"~"+elementHide+"~"+relationCall+"~"+relationKey+"~"+highFontColor+"~"+fontColorCb+"~"+highBgColor+"~"+bgColorCb;
						           }else{
						      	       txt=txt+"*"+div.attr("id")+"~"+left+"~"+top+"~"+width+"~"+height+"~"+type+"~"+bcolor+"~"+txtcontent+"~"+ziti+"~"+fcolor+"~"+speed+"~"+parseInt(fs)+"~"+parseInt(lh)+"~"+fjc+"~"+fdx+"~"+fxx+"~"+fzx+"~"+ftype+"~"+textDataSource+"~"+showZindex+"~"+elementHide+"~"+relationCall+"~"+relationKey+"~"+highFontColor+"~"+fontColorCb+"~"+highBgColor+"~"+bgColorCb;
						           }
				        
				               }
				       
				       }else{
					      
				    	   var seeTxtHtml=div.html();
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
							   
							   seeTxtHtml=seeTxtHtml.replace(/<br>/g,"");
							  
						   }else if(type==3){
				               t1="down";
						   }else if(type==4) {
				               t1="right";
				               jiajia="white-space:nowrap;";
						   }
						   if(div.attr("elementHide")=='true'){}else{
							  if(type==1){
								  seecontent+="<div style='background-color:"+showBgColor+";"+jiajia+"font-family:"+div.css("fontFamily")+";font-size:"+parseInt(fs)+"px;z-index:20;line-height:"+parseInt(lh)+"px;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;line-height:"+height+"px;text-align: center;'><marquee    direction='"+t1+"' scrollamount='"+speed+"'  style='"+jiajia+"font-family:"+div.css("fontFamily")+";font-size:"+parseInt(fs)+"px;z-index:9;line-height:"+parseInt(lh)+"px;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;'>"+seeTxtHtml+"</marquee></div>";
							  }else{
								  seecontent+="<div style='background-color:"+showBgColor+";"+jiajia+"font-family:"+div.css("fontFamily")+";font-size:"+parseInt(fs)+"px;z-index:20;line-height:"+parseInt(lh)+"px;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;'><marquee    direction='"+t1+"' scrollamount='"+speed+"'  style='"+jiajia+"font-family:"+div.css("fontFamily")+";font-size:"+parseInt(fs)+"px;z-index:9;line-height:"+parseInt(lh)+"px;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;'>"+seeTxtHtml+"</marquee></div>";  
							  }
					          
						   
						   }
					       if(handleType==1)
						   {
					    	 if(txt==""){
						          txt=div.attr("id")+"~"+left+"~"+top+"~"+width+"~"+height+"~"+type+"~"+bcolor+"~"+txtcontent+"~"+ziti+"~"+fcolor+"~"+speed+"~"+parseInt(fs)+"~"+parseInt(lh)+"~"+fjc+"~"+fdx+"~"+fxx+"~"+fzx+"~"+ftype+"~"+textDataSource+"~"+showZindex+"~"+elementHide+"~"+relationCall+"~"+relationKey+"~"+highFontColor+"~"+fontColorCb+"~"+highBgColor+"~"+bgColorCb;
						     }else{
						      	  txt=txt+"*"+div.attr("id")+"~"+left+"~"+top+"~"+width+"~"+height+"~"+type+"~"+bcolor+"~"+txtcontent+"~"+ziti+"~"+fcolor+"~"+speed+"~"+parseInt(fs)+"~"+parseInt(lh)+"~"+fjc+"~"+fdx+"~"+fxx+"~"+fzx+"~"+ftype+"~"+textDataSource+"~"+showZindex+"~"+elementHide+"~"+relationCall+"~"+relationKey+"~"+highFontColor+"~"+fontColorCb+"~"+highBgColor+"~"+bgColorCb;
						     }
						    
					       }
					      
				      } 
				 }else if(key=="myapp"){
					 
			         
			          var appts=div.attr("title").split("*");
			          
			          if(appts.length==3){
			        	  if(div.attr("elementHide")=='true'){}else{
			    	      seecontent+="<div  title='"+div.attr("title")+"' style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src="+appts[1]+", sizingMethod=scale) alpha(opacity=100);'></div>";
			        	  }
					      if(handleType==1)
						  {
						    var appstrs=$("#appstrs").val();
						    if(appstrs.length>0){
						    	$("#appstrs").val($("#appstrs").val()+"@"+left+"*"+top+"*"+width+"*"+height+"*"+appts[1]+"*"+appts[0]);
							}else{
								$("#appstrs").val(left+"*"+top+"*"+width+"*"+height+"*"+appts[1]+"*"+appts[0]);
						    }
				            //gncj=left+"*"+top+"*"+width+"*"+height;
						    
				          }

				     }

			 	  //功能插件
			      }else if(key=="mygnc"){
			    	   if(div.attr("elementHide")=='true'){}else{
			           seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: black;'></div>";
			    	   }
				       if(handleType==1)
					   {

						    //gcontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: black;'></div>";
			
					        gncj=left+"~"+top+"~"+width+"~"+height;
					    
			           }
			      //楼层显示     
			      }else if(key=="mylcs"){
				  
			    	    if(div.attr("elementHide")=='true'){}else{
			            seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: black;'></div>";
			    	    }
				        if(handleType==1)
					    {
						    gcontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: black;'></div>";
					        lcsh=left+"~"+top+"~"+200+"~"+200;			    
			            }
			       //二维码     
			      }else if(key=="codet"){
			    	    if(div.attr("elementHide")=='true'){}else{
			            seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #EBC84D;'></div>";
			    	    }
				        if(handleType==1)
					    {
						    //gcontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #EBC84D;'></div>";
				            var  codeurl=div.attr("codeurl");
				            var  codep=div.attr("codep");
						    $("#code2").val(left+"*"+top+"*"+width+"*"+height+"*"+codeurl+"*"+codep);
					
			            } 

				   //网络摄像     
		          }else if(key=="mycam"){
				 
		        	     if(div.attr("elementHide")=='true'){}else{
			             seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #B4EEB4;color:#000000;'>"+localObj.a00692+"</div>";
		        	     }
				         if(handleType==1)
					     {
					         //gcontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #B4EEB4;color:#000000;'><ww:property value='#session.local.a00692' /></div>";
			
			                 var ctitle=div.attr("title");
			                 var elementHide=div.attr("elementHide");
			                 var relationCall=div.attr("relationCall");
			                 //元素id*X*Y*宽*高*设备ID*用户名*密码*厂商
					         $("#netcamera").val(div.attr("id")+"*"+left+"*"+top+"*"+width+"*"+height+"*"+ctitle+"*"+showZindex+"*"+elementHide+"*"+relationCall);
					
			             } 

				   //排队叫号  大屏 集中数据显示      
		          }else if(key=="qmany"){
				 

			            seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'>"+localObj.a00700+"</div>";
			            if(handleType==1)
				        {
				            //gcontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'><ww:property value='#session.local.a00700' /></div>";
		                    var  ctitle=div.attr("title");
				            $("#queue_many").val(div.attr("id")+"*"+left+"*"+top+"*"+width+"*"+height+"*"+ctitle);
				
		                 }
		                 
			      //排队叫号  小屏数据显示
		          } else if(key=="qsing"){
				
			            seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'>"+localObj.a00701+"</div>";
			            if(handleType==1)
				        {
				             //gcontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'><ww:property value='#session.local.a00701' /></div>";

		                     var  p=div.attr("title");
		        
				             $("#queue_single").val(div.attr("id")+"*"+left+"*"+top+"*"+width+"*"+height+"*"+ctitle);
				
		                 } 
		          //公交站台
		          } else if(key=="mybus"){
				
			            seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'>"+localObj.a00774+"</div>";
				        if(handleType==1)
					    {
					       //gcontent+="<div style='z-index:9;LEFT:"+left+"px;POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'><ww:property value='#session.local.a00774' /></div>";
			
			               var ctitle=div.attr("title");
			     
					       $("#bus_data").val(div.attr("id")+"*"+left+"*"+top+"*"+width+"*"+height+"*"+ctitle);
					
			             } 

				  //插件      
		          }else if(key=="charg"){
		        	   if(div.attr("elementHide")=='true'){}else{
			               seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION:absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'>"+localObj.b00090+"</div>";
		        	   }
				       if(handleType==1)
					   {
			
			                 var jsonStr=div.attr("jsonStr");
							 if(jsonStr!=null){
								   jsonStr=jsonStr.replace(/"/g,"'"); 
								   var programDll = eval( "(" + jsonStr + ")" );//转换后的JSON对象
								   programDll.mId=div.attr("id");
								   programDll.mLeft=left;
								   programDll.mTop=top;
								   programDll.mWidth=width;
								   programDll.mHeight=height;
								   programDll.showZindex=showZindex;
								   jsonDlls[jsonDlls.length]=programDll;     
							 }   		
			           } 

				   //环境监测    
		          }else if(key=="envir"){
		      		   
			           seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION:absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'>"+localObj.b00159+"</div>";
				       if(handleType==1)
					   {
			
			                       
			                       var type=div.attr("type");
								   var programDll = new Object();//转换后的JSON对象
								   programDll.mId=div.attr("id");
								   programDll.mLeft=left;
								   programDll.mTop=top;
								   programDll.mWidth=width;
								   programDll.mHeight=height;
								   programDll.type=type;
								   programDll.showZindex=showZindex;
								   
								   if(type==105){
									   
									   programDll.happyVal=div.attr("happyVal");
									   
									   programDll.uncomVal=div.attr("uncomVal");
									   
								   }
								  
								   
								   jsonDlls[jsonDlls.length]=programDll;     
							  		
			           } 

				  //人脸识别faceR 搜索searc 轮询播放列表
		         }else if(key=="faceR"||key=="searc"||key=="caroY"){
		        	 
		        	   var name;
		        	   var tTargetId=div.attr("tTargetId");
		        	   //alert(tTargetId);
		      		   if(key=="faceR")
		      		   {
		      			 name=localObj.b00112;
		      		   }else if(key=="searc")
		      		   {
		      			 name=localObj.d00010;
		      		   }
		      		   else if(key=="caroY")
		      		   {

		      			 name=localObj.d00007;
		      		   }
			           seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION:absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'>"+name+"</div>";
				       if(handleType==1)
					   {
			                       var type=div.attr("type");
								   var programDll = new Object();//转换后的JSON对象
								   programDll.mId=div.attr("id");
								   programDll.mLeft=left;
								   programDll.mTop=top;
								   programDll.mWidth=width;
								   programDll.mHeight=height;
								   programDll.type=type;
								   if(tTargetId!=null){
									   programDll.tTargetId=tTargetId;
								   }
								   programDll.elementHide=div.attr("elementHide");
								   if(key=="caroY")
								   {
										var mtouchs=$("#"+div.attr("id")).attr("mtouchs");
										 if(mtouchs==null||mtouchs==undefined)
										 {
											 layer.msg(localObj.d00017);
											 retrun;
										 }
									   	 programDll.ycCount=$("#"+div.attr("id")).attr("ycCount");
								   }
								   if(key=="caroY")
								   {
										 programDll.elementHide=true;
										 programDll.bgtopfd=$("#"+div.attr("id")).attr("bgtopfd");
										 programDll.bgname=$("#"+div.attr("id")).attr("bgname");
										 programDll.bgnameUrl=$("#"+div.attr("id")).attr("bgnameUrl");
										  var ycCount=$("#"+div.attr("id")).attr("ycCount");
										   if(ycCount==undefined)
										   {
											   ycCount=5;
										   }	
										  programDll.ycCount=ycCount;
								   }
							
								   programDll.showZindex=showZindex;
								   jsonDlls[jsonDlls.length]=programDll;     
							  		
			           } 

				  
		         }else if(key=="eleva"){
			      		
			           seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION:absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'>"+localObj.b00277+"</div>";
				       if(handleType==1)
					   {
			
			                
								   var programDll = new Object();//转换后的JSON对象
								   programDll.mId=div.attr("id");
								   programDll.mLeft=left;
								   programDll.mTop=top;
								   programDll.mWidth=width;
								   programDll.mHeight=height;
								   programDll.type=103;
								   programDll.showZindex=showZindex;
								   programDll.city=div.attr("city");
								   jsonDlls[jsonDlls.length]=programDll;     
							  		
			           } 

				   //天气    
		         }else if(key=="mytqs"){
				

		        
		        	       var  wtitle=div.attr("title");
			              
		               
		                   //获取字体大小
		                   var selfFontSize=Math.round((div.css("fontSize").replace(/px/g,""))/sf);
		               
		                   var wtitles=wtitle.split("*");
		                   
		                   wtitle=wtitles[0]+"*"+selfFontSize+"*"+wtitles[2]+"*"+wtitles[3]+"*"+wtitles[4];
		                  
	                       //获取字体大小
			               var selfFontSize=Math.round((div.css("fontSize").replace(/px/g,""))/sf);
			               
			              
			           	var gif="";
		               	var content="";
		               	var day="";
		               
		               	$.ajax({
	                            url:'ajaxGetTq.vs',
				                data:{
	    					        city : wtitles[3].split("--")[0]
	    					        
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
								    	
								    //

								      
								 }
						});
		               	
		               	if(div.attr("elementHide")=='true'){}else{
			               seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;text-align: center;font-size:"+selfFontSize+"px;color:#"+wtitles[2]+";'>"
			              +"<img src='../../image/weather/"+gif+"' style='width:50%;height:50%;opacity:0.8;'><br/>"
			              +wtitles[3].split("--")[0]+"&nbsp;&nbsp;&nbsp;"+day+"<br/>"
	                  	  +""+content
	                  	  +"</div>";
		               	} 
			              
			              
					      if(handleType==1)
						  {
						    
					    	  var elementHide=div.attr("elementHide");
					          var relationCall=div.attr("relationCall");
				               var citykey=$("#citykey").val();
				               showZindex=parseInt(showZindex)+1;
				               //元素id*x*y*w*h*刷新时间*字体大小*字体颜色*城市--切换时间@城市--切换时间#2
				               if(citykey.length==0){
				            	   $("#citykey").val(div.attr("id")+"*"+left+"*"+top+"*"+width+"*"+height+"*"+wtitle+"*"+showZindex+"*"+elementHide+"*"+relationCall);
				               }else{
				            	   $("#citykey").val(citykey+"#"+div.attr("id")+"*"+left+"*"+top+"*"+width+"*"+height+"*"+wtitle+"*"+showZindex+"*"+elementHide+"*"+relationCall);
				               }
						      
				               showZindex=parseInt(showZindex)-1;
				           } 
		        
		        }else if(key=="sourc"){
		        	        
		        	        if(div.attr("elementHide")=='true'){}else{
						       seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'>"+localObj.a00996+"</div>";
		        	        }
						    if(handleType==1)
						    {
					            var jsonStr=div.attr("jsonStr");
					            
								if(jsonStr!=null){
									 //转换成touch对象组
									jsonStr=jsonStr.replace(/'/g,"\""); 
					    		    var programDsource = eval( "(" + jsonStr + ")" );//转换后的JSON对象
								   
								    //jsonStr=jsonStr.replace(/'/g,"\""); 
								    //var programDsource = new Object();//转换后的JSON对象
								    //programDsource.source=jsonStr;
								    programDsource.mId=div.attr("id");
								    programDsource.mLeft=left;
								    programDsource.mTop=top;
								    programDsource.mWidth=width;
								    programDsource.mHeight=height;
								    programDsource.showZindex=showZindex;
								    
								    if(programDsource.showType==2){
								    	var rows=programDsource.rows;
								    	var cols=programDsource.cols;
								    	
								    	programDsource.rows=cols;
								    	programDsource.cols=rows;
								    }
								    
								    jsonSource[jsonSource.length]=programDsource;     
								} 
							}
				//控件节目			
		        }else if(key=="dllIt"){
			               seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px;WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'>"+localObj.b00118+"</div>";
						   if(handleType==1)
						    {
					
					            var jsonData=div.attr("jsonData");
								if(jsonData!=null){
								    var programDsource;
								    
								    jsonData=jsonData.replace(/'/g,"\"");
					
								    var objs = eval( "(" + jsonData + ")" );//转换后的JSON对象
							   		  		 		 
								    var programDsource = new Object();//转换后的JSON对象

								    programDsource.mDllItemUserList=objs.mDllItemList;
								    programDsource.mId=div.attr("id");
								    programDsource.mLeft=left;
								    programDsource.mTop=top;
								    programDsource.mWidth=width;
								    programDsource.mHeight=height;
								    programDsource.showZindex=showZindex;
								    jsonDllItem[jsonDllItem.length]=programDsource;     
								} 
							}
				 //网页			
		         }else if(key=="htmls"){
			

			           //seecontent+="<div style='z-index:"+showZindex+";LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #3CB371;color:#000000;'>"+localObj.a00189+"</div>";
			           
		        	   
		        	   var  htitle=div.attr("title");
		        	   
		        	   htitle=htitle.replace(/amp;/g,"");
			           
		        	   //预览第一个网址
		        	   
		        	   var htmlSrc=htitle.split("*")[2].split("@")[0].split("--")[0];
			           
		        	   if(div.attr("elementHide")=='true'){}else{
			              seecontent+="<iframe  allowtransparency='true' src='"+htmlSrc+"' style='POSITION: absolute;left:"+left+"px;top:"+top+"px;width:"+width+"px;height:"+height+"px; border:0px;z-index:"+showZindex+";' marginwidth='0'  marginheight='0' frameborder='0' scrolling='no'></iframe>"; 
		        	   } 
			           if(handleType==1)
					   {		   
				            
				            var htmlv=$("#html").val();
				            
				            var elementHide=div.attr("elementHide");
				            var relationCall=div.attr("relationCall");

				            
				            
				            // 元素id*x*y*w*h*刷新时间*滚动*网页地址--切换时间@网页地址--切换时间*层次(level)
				           
				            jsonHtmls[jsonHtmls.length]=div.attr("id")+"*"+left+"*"+top+"*"+width+"*"+height+"*"+htitle+"*"+showZindex+"*"+elementHide+"*"+relationCall;
				            
							//if(htmlv.length==0){
				         	//   $("#html").val(div.attr("id")+"*"+left+"*"+top+"*"+width+"*"+height+"*"+htitle+"*"+showZindex);
				            //}else{
				         	//   $("#html").val(htmlv+"#"+div.attr("id")+"*"+left+"*"+top+"*"+width+"*"+height+"*"+htitle+"*"+showZindex);
				            //}
							
			           } 
		        //时钟显示
		        }else if(key=="mytim"){
				 
				     //var mytimPros=div.title.split('@');

				     var jsonData=div.attr("jsonData");

				    
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
				        	 Day[0] = localObj.a00309;  //星期日
				        	 Day[1] = localObj.a00303;  //星期一
				        	 Day[2] = localObj.a00304;  //星期二 
				        	 Day[3] = localObj.a00305;  //星期三
				        	 Day[4] = localObj.a00306;  //星期四
				        	 Day[5] = localObj.a00307;  //星期五
				        	 Day[6] = localObj.a00308;  //星期六
			         		
			                  //显示类型
			                  var mytimShowType=obj.tsType;
			                  if(mytimShowType==1){
			                	  //mytimContent="yyyy-MM-dd";
			                	  mytimContent=year+"-"+month+"-"+date;
			                  }else if(mytimShowType==2){
			                	  //mytimContent="yyyy年MM月dd日";
			                	  mytimContent=year+localObj.a00297+month+localObj.a00298+date+localObj.a00299;
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
			                	  mytimContent=hours+localObj.a00494+minutes+localObj.a00495+seconds+localObj.a00106;
			                  }else if(mytimShowType==7){
			                	  mytimContent=Day[day];
			                  }else if(mytimShowType==8){
			                	  //mytimContent="yyyy年MM月dd日  EEEE HH:mm:ss";
			                	  mytimContent=year+localObj.a00297+month+localObj.a00298+date+localObj.a00299+"  "+Day[day]+" "+hours+":"+minutes+":"+seconds;
			                  }else if(mytimShowType==9){
			                	  //mytimContent="MM月dd日yyyy年 EEEE HH:mm:ss";
			                	  mytimContent=month+localObj.a00298+date+localObj.a00299+year+localObj.a00297+"  "+Day[day]+" "+hours+":"+minutes+":"+seconds;
			                  }else if(mytimShowType==10){
			    	        	  //mytimContent="yyyy.MM.dd";
			    	        	  mytimContent=year+"."+month+"."+date;
			    	          }else if(mytimShowType==11){
			    	        	    //mytimContent="";
			    	        	    var enDay = new MakeArray(7);
			    	        	    enDay[0] = "Sunday";
			    	        	    enDay[1] = "Monday";
			    	        	    enDay[2] = "Tuesday";
			    	        	    enDay[3] = "Wednesday";
			    	        	    enDay[4] = "Thursday";
			    	        	    enDay[5] = "Friday";
			    	        	    enDay[6] = "Saturday";
			    	        	    mytimContent=enDay[day];
			    	          }

			                  
			             }else if(mytimType==3){

			            	//获取单位显示 类型 
			            	var unitShow=obj.unitShow;
			            	
			             	//天
			             	if(obj.ttDa==1){
			             		
			             		if(unitShow==0){
			             			mytimContent+="XX"+localObj.a00300;
			                    }else{
			                    	mytimContent+="XX ";
			                    }
			                }

			             	//小时
			             	if(obj.ttHo==1){
			             		if(unitShow==0){
			             			mytimContent+="XX"+localObj.a00301;
			                    }else{
			                    	mytimContent+="XX ";
			                    }
			                }

			             	//分钟
			             	if(obj.ttMi==1){
			             		if(unitShow==0){
			             			mytimContent+="XX"+localObj.a00302;
			                    }else{
			                    	mytimContent+="XX ";
			                    }
			                }

			             	//秒
			             	if(obj.ttSs==1){
			             		if(unitShow==0){
			             			mytimContent+="XX"+localObj.a00106;
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
		             
		             if(div.attr("elementHide")=='true'){}else{
		                seecontent+="<div style='z-index:500;LEFT:"+left+"px;POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;color:#"+mytimFontColor+";font-size:"+mytimFontSize+"'>"+mytimContent+"</div>";
		             }
			          if(handleType==1)
				      {	    	
			           
		                obj.mId=div.attr("id");
					    obj.mLeft=left;
					    obj.mTop=top;
					    obj.mWidth=width;
					    obj.mHeight=height;
					    obj.showZindex=showZindex;
					    obj.elementHide=div.attr("elementHide");
					    obj.relationCall=div.attr("relationCall");
					 
					    jsonTimes[jsonTimes.length]=obj;      

		             } 

			  //截屏显示    
		      }else if(key=="seejp"){
		    	
				    var jpsrc=div.attr("jpsrc"); 
				    seecontent+="<iframe title='"+div.attr("title")+"'  allowtransparency='true' src='"+jpsrc+"' style='POSITION: absolute;z-index:3;left:"+left+"px;top:"+top+"px;width:"+width+"px;height:"+height+"px; border:0px;' marginwidth='0'  marginheight='0' frameborder='0' scrolling='no'></iframe>";
				  	if(handleType==1)
					{
						 $("#jptxt").val(div.attr("id")+"_"+left+"_"+top+"_"+width+"_"+height+"_"+div.attr("title")+"_"+jpsrc);
					}
					 
		       //Rss数据源	
		      }else if(key=="mynew"){
		          
		    	        var rsssrc=div.attr("rsssrc"); 
		    	        var rsssrcs=rsssrc.split("&");
		    	        var src1="";
						if(rsssrcs.length==6){
						       var gd=Math.round(rsssrcs[5].split("=")[1]/sf);
						       var dx=Math.round(rsssrcs[2].split("=")[1]/sf);
						       src1=rsssrcs[0]+"&"+rsssrcs[1]+"&"+"dx="+dx+"&"+rsssrcs[3]+"&"+rsssrcs[4]+"&gd="+gd;
					  	}
					  
			            seecontent+="<iframe title='"+div.attr("timee")+"'  allowtransparency='true' src='"+src1+"' style='POSITION: absolute;z-index:3;left:"+left+"px;top:"+top+"px;width:"+width+"px;height:"+height+"px; border:0px;' marginwidth='0'  marginheight='0' frameborder='0' scrolling='no'></iframe>";
			       	    if(handleType==1)
			   		    {
			       	    	
			             //判断滚动类型          
			              var rtype=1;
			              if (rsssrcs[0].indexOf("getrss2") == -1) {
			           	      rtype = 1;
						  } else {
					    	  rtype = 2;
						  }   
			             
			              //元素id_^x_^y_^w_h_^请求数据url_^字体颜色_^字体大小_^滚动速度_^刷新时间
			              $("#rsskey").val(div.attr("id")+"_^"+left+"_^"+top+"_^"+width+"_^"+height+"_^"+rsssrcs[0].split("=")[1]+"_^"+rsssrcs[1].split("=")[1]+"_^"+dx+"_^"+rsssrcs[4].split("=")[1]+"_^"+div.attr("timee")+"_^"+rtype);	  
			   		   
			   		    }

		          }else if(key=="imggr"){
		          
		        	  seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color:#000000;color:#FFFFFF;font-size:36px;'>"+localObj.b00127+"</div>";
				      if(handleType==1)
					  {
				    	    var jsonData=div.attr("jsonData");
				    	    
				    	    jsonData=jsonData.replace(/'/g,"\"");
							
						    var objs = eval( "(" + jsonData + ")" );//转换后的JSON对象
					   		  
						    objs.mId=div.attr("id");
						    objs.mLeft=left;
						    objs.mTop=top;
						    objs.mWidth=width;
						    objs.mHeight=height;
						    objs.showZindex=showZindex;
						    jsonImgsGroup[jsonImgsGroup.length]=objs;     

						    
				    	   
						   
			          }
		       }else if(key=="imgfl"){
		    	      if(div.attr("elementHide")=='true'){}else{
		        	     seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color:#000000;color:#FFFFFF;font-size:36px;'>"+localObj.b00320+"</div>";
		    	      }
				      if(handleType==1)
					  {
				    	    var jsonData=div.attr("jsonData");
				    	    
				    	    jsonData=jsonData.replace(/'/g,"\"");
							
						    var objs = eval( "(" + jsonData + ")" );//转换后的JSON对象
					   		  
						    objs.elementHide=div.attr("elementHide");
						    objs.relationCall=div.attr("relationCall");
						    objs.mId=div.attr("id");
						    objs.mLeft=left;
						    objs.mTop=top;
						    objs.mWidth=width;
						    objs.mHeight=height;
						    objs.showZindex=showZindex;
						    jsonImgsFlip[jsonImgsFlip.length]=objs;     

						    
				    	   
						   
			          }
		       }else if(key=="myigs"){
			    	  seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION: absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color:#8DB6CD;font-family:微软雅黑;color:#000000;font-size=36px;'>"+div.attr("id")+"</div>";
				      if(handleType==1)
					  {
					    
		                  //获取值
			              var recyclerJson=div.attr("recycler");
			              //alert(recyclerJson)
			              var objs=new Object();
			              if(recyclerJson==undefined){
		                     
				          }else{

				        	  objs = eval( "(" + recyclerJson + ")" );//转换后的JSON对象

					      }
		                  objs.mId=div.attr("id"); 
			              objs.mLeft=left;
			              objs.mTop=top;
			              objs.mHeight=height;
			              objs.mWidth=width;
			              objs.showZindex=showZindex;
			              //objs.interactGroupNumber=div.getAttribute("interactGroupShowNumber");
			              jsonRecyclers[jsonRecyclers.length]=objs; 
			          } 

			  }else if(key=="ports"){
				   if(div.attr("elementHide")=='true'){}else{	
		             seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION:absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'>"+localObj.b00347+"</div>";
				   }
			       if(handleType==1)
				   {
		
		                
							   var programDll = new Object();//转换后的JSON对象
							   programDll.mId=div.attr("id");
							   programDll.mLeft=left;
							   programDll.mTop=top;
							   programDll.mWidth=width;
							   programDll.mHeight=height;
							   programDll.type=106;
							   programDll.showZindex=showZindex;
							   jsonDlls[jsonDlls.length]=programDll;     
						  		
		           } 

			   //资源接口
	         }else if(key=="mycal"){
		      		
		           seecontent+="<div style='z-index:9;LEFT:"+left+"px; POSITION:absolute; TOP:"+top+"px; WIDTH:"+width+"px; HEIGHT:"+height+"px;background-color: #000000;color:#FFFFFF;'>"+div.attr("id")+"</div>";
			       if(handleType==1)
				   {
		
		                
							   var programDll = new Object();//转换后的JSON对象
							   programDll.mId=div.attr("id");
							   programDll.mLeft=left;
							   programDll.mTop=top;
							   programDll.mWidth=width;
							   programDll.mHeight=height;
							   programDll.type=107;
							   programDll.showZindex=showZindex;
							   programDll.callUrl=div.attr("callUrl");
							   programDll.parmeter=div.attr("parmeter");
							   jsonDlls[jsonDlls.length]=programDll;     
						  		
		           } 

			   
	         }  
			  //结束
	          
			 
		 });
		 //}
		 
		 //查看是否有音频
		var yxmusics=$("#video10000");
			
		if(yxmusics.attr("id")!=undefined){
			    
			    var videoJsonDatas=yxmusics.attr("jsonData");
		        
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
		    		   mediaTxt=localObj.a00716;
			       }else if(mediaType==4){
			    	   mediaTxt=localObj.a00345;
				   }else if(mediaType==5){
					   mediaTxt=localObj.a00346;
				   }
		    	   seecontent+="<div style='background-color: #000000;color:#FFFFFF;LEFT:"+0+"px; POSITION: absolute; TOP:"+0+"px; WIDTH:"+1+"px; HEIGHT:"+1+"px'></div>";

			   }else {

				   //判断浏览器
	               var mb = myBrowser();
			      
				   if ("Chrome" == mb) {
					 seecontent+="<object z-index='5' style='POSITION:absolute; z-index:-1;width:"+1+"px;height:"+1+"px;left:"+0+"px;top:"+0+"px;' id='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0' width='"+1+"' height='"+1+"'>";
				   }else{
					 seecontent+="<object z-index='5' style='POSITION:absolute; z-index:-1;width:"+1+"px;height:"+1+"px;' id='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0' width='"+1+"' height='"+1+"'>";
				   }  

				    seecontent+="<param name='movie'  value='../flvplayer.swf'>"; 
				    seecontent+="<param name='quality'  value='high'>";
				    seecontent+="<param name='allowFullScreen'  value='true'>";
				    seecontent+="<param name='FlashVars'  value='vcastr_file="+vt+"&BufferTime=3&IsAutoPlay=1'>";
				    seecontent+="<embed wmode='transparent'  style='POSITION:absolute; z-index:-1;left:"+0+"px;top:"+0+"px;width:"+1+"px;height:"+1+"px;'  src='../flvplayer.swf' allowfullscreen='true' flashvars='vcastr_file="+vt+"&IsAutoPlay=1' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='"+1+"' height='"+1+"'></embed>";
				    seecontent+="</object>";

			   }     
	           if(handleType==1)
		       {
		    	 objs.mId=yxmusics.attr("id");;
			     objs.mLeft=0;
			     objs.mTop=0;
			     objs.mWidth=1;
			     objs.mHeight=1;
			     jsonVideos[jsonVideos.length]=objs;                   
		       }
		}
			
			
		 
		 seecontent+="</body>";
		 seecontent="<SCRIPT  src='jqfont.js' type=text\/javascript><\/SCRIPT><SCRIPT  src='jqfont2.js' type=text\/javascript><\/SCRIPT><SCRIPT  type=text\/javascript> $(function () { $('marquee').marquee(''); });<\/SCRIPT><meta http-equiv='content-type' content='text/html;charset=utf-8'><html style='background: #fff;'><body "+bgshow+">"+seecontent+"</html>";
		 $("#seecontent").val(seecontent);
		
			
		 if(handleType==0){
			 
	            document.form1.target="_blank"; 
	            
	            //if(itemType==1){
	            document.form1.action="seescene.vs";	
	            //}else if(itemType==2){
                //    document.form1.action="selinteractscene.vs?savetype=3";
                    
	            //}
	              
	            
	            
	            document.form1.submit();
	            
	      }else if(handleType==1){
			   
	    	    $("#fcontent").val(fcontent);
				
				$("#text").val(txt);		
			
				$("#gncj").val(gncj);
				$("#lcsh").val(lcsh);
				$("#bginfo").val(bfile);

				//图片json
				$("#jsonImgs").val(JSON.stringify(jsonImgs));

	            //音频,视频,图片混合json
				$("#jsonVideos").val(JSON.stringify(jsonVideos));

				//插件集合
				$("#jsonDlls").val(JSON.stringify(jsonDlls));
				console.log("jsonDlls"+JSON.stringify(jsonDlls));
				
				//数据接口
				$("#jsonSource").val(JSON.stringify(jsonSource));

	            //控件节目 
				$("#jsonDllItem").val(JSON.stringify(jsonDllItem));

				//图片组
				$("#jsonImgsGroup").val(JSON.stringify(jsonImgsGroup));
				
				//翻书
				$("#jsonImgsFlip").val(JSON.stringify(jsonImgsFlip));
				

				//时间
	            $("#timeTxt").val(JSON.stringify(jsonTimes));
	            
	            
	            //网页
	            $("#html").val(JSON.stringify(jsonHtmls));
	            
	            
	            
	            if(itemType==2){
	            	//互动组
					$("#jsonRecyclers").val(JSON.stringify(jsonRecyclers));
	            }
	           
	            $("input[name = smartPlay]:checkbox").each(function(){
	    		
	    			if ($(this).prop("checked")==true){
	    				
                         $("#stime").val(-1);
			            // break;
                       
	    			}
	    			
	    			
	    		});	 
	    		
	           
	            //节目对象 
	            var sceneObj=new Object();
	            
	            //层级值
	            sceneObj.currenttotal=total; 
	            
	            //背景色
	            sceneObj.bgColor=curScene.attr("bgColor");
	            
	            //分辨率
	            sceneObj.tx=$("#tx").val();
	            
	            sceneObj.ty=$("#ty").val();
	            
	            //缩放比
	            sceneObj.sf=$("#sf").val();
	            
	            //背景
	            if(curScene.attr("bgname")==undefined||curScene.attr("bgname")=="0"){
	            	sceneObj.bgname="0";
	 	            sceneObj.bgtopfd="0";
	 	            sceneObj.bgnameUrl="0";
	 	            sceneObj.title="";
	            }else{
	            	sceneObj.bgname=curScene.attr("bgname");
	 	            sceneObj.bgtopfd=curScene.attr("bgtopfd");
	 	            sceneObj.bgnameUrl=curScene.attr("bgnameUrl");
	 	            sceneObj.title=curScene.attr("title");
	            }
	            
	           
	            
 
	            //元素集合
			    var allElementArry=new Array();
			      
				$("input[name = checkdom]:checkbox").each(function(){
		    		
					var elmentObj=$("#"+$(this).attr("eId"));
					
					var sceneElement=new Object();
					
					sceneElement.id=elmentObj.attr("id");
					sceneElement.left=Math.round($("#"+$(this).attr("eId")).position().left/sf);
					sceneElement.top=Math.round($("#"+$(this).attr("eId")).position().top/sf);
					sceneElement.width=Math.round($("#"+$(this).attr("eId")).css("width").replace(/px/g,"")/sf);
					sceneElement.height=Math.round($("#"+$(this).attr("eId")).css("height").replace(/px/g,"")/sf);
				     
					sceneElement.style=elmentObj.attr("style");
				    
					var elementType=elmentObj.attr("elementType");
					
					sceneElement.elementType=elementType;
					
					
					switch (elementType) {
					
					       case "image" :
					       case "mydoc" :
					       case "myxls" :
					       case "mypdf" :
					       case "myppt" :
					       case "teller" :
								  
								 //src 
								 sceneElement.src=elmentObj.find("img").attr("src");
							     //播放时长
								 sceneElement.ptime=elmentObj.attr("ptime");
				                 //数据源
								 sceneElement.jsonData=elmentObj.attr("jsonData");
								
								 sceneElement.tellerKey=elmentObj.attr("tellerKey");
								 
						        break;
						        
						   case "video":
							   
							   	sceneElement.ptime=elmentObj.attr("ptime");
				                 //数据源
								 sceneElement.jsonData=elmentObj.attr("jsonData");
								// console.log(elmentObj.attr("jsonData"));
								 
								 sceneElement.elementVideoType=elmentObj.attr("elementVideoType");
								 
								 break;
			/*			   case "cqybj":
							   
				                 //数据源
								 sceneElement.jsonData=elmentObj.attr("jsonData");
								// console.log(elmentObj.attr("jsonData"));
								 sceneElement.elementHide=elmentObj.attr("elementHide");
								 
								 sceneElement.ycCount=$("#"+elmentObj.attr("id")).attr("ycCount");
								 
								 sceneElement.bgtopfd=$("#"+elmentObj.attr("id")).attr("bgtopfd");
								 
								 sceneElement.bgname=$("#"+elmentObj.attr("id")).attr("bgname");
								 
								 sceneElement.bgnameUrl=$("#"+elmentObj.attr("id")).attr("bgnameUrl");
						   		  
						   		 break;*/
						   case "caroD":
						   case "catal":
							   
						    	 //播放时长
								 sceneElement.ptime=elmentObj.attr("ptime");
				                 //数据源
								 sceneElement.jsonData=elmentObj.attr("jsonData");
								// console.log(elmentObj.attr("jsonData"));
								 
								 sceneElement.elementVideoType=elmentObj.attr("elementVideoType");
								 var ycCount=$("#"+elmentObj.attr("id")).attr("ycCount");
								     if(ycCount==undefined)
								     {
								    	 ycCount=5;
								     }	
								 sceneElement.ycCount=ycCount;
								
								 sceneElement.bgtopfd=$("#"+elmentObj.attr("id")).attr("bgtopfd");
								
								 sceneElement.bgname=$("#"+elmentObj.attr("id")).attr("bgname");
								
								 sceneElement.bgnameUrl=$("#"+elmentObj.attr("id")).attr("bgnameUrl");
								 
								 //sceneElement.bj=$("#"+elmentObj.attr("id")).attr("bj");
								 
							     break;
								
						    case "fonts":
						    	
						    	 //字体大小
								 sceneElement.fontSize=elmentObj.attr("fontSize");
								 sceneElement.txtfontsize=elmentObj.attr("txtfontsize");
								 //行高
								 sceneElement.lineHeight=elmentObj.attr("lineHeight");
								 //字体类型
								 sceneElement.fonttype=elmentObj.attr("fonttype");
								  //字距
								 sceneElement.lineH=elmentObj.attr("lineH");
								 //滚动方式 
								 sceneElement.gdtype=elmentObj.attr("gdtype");
								 //滚动速度
								 sceneElement.gdspeed=elmentObj.attr("gdspeed");
								 //背景颜色  
								 sceneElement.backcolor=elmentObj.attr("backcolor");    
								 //字体颜色
								 sceneElement.fontcolor=elmentObj.attr("fontcolor");  
								 //加粗   
								 sceneElement.fbold=elmentObj.attr("fbold"); 
								 //斜体
								 sceneElement.fitallic=elmentObj.attr("fitallic");
								 //下划线
								 sceneElement.fsetline=elmentObj.attr("fsetline");
								 //中线
								 sceneElement.fsetstrike=elmentObj.attr("fsetstrike");
							 	 //数据来源  
								 sceneElement.textDataSource=elmentObj.attr("textDataSource");
								 //设置字体大小 0普通 1高级    
								 sceneElement.advancedType=elmentObj.attr("advancedType");
			                     //内容
								 sceneElement.doc_content=elmentObj.attr("doc_content");
								 
								 sceneElement.relationKey=elmentObj.attr("relationKey");
								 
								
								 sceneElement.highFontColor=elmentObj.attr("highFontColor");
								 
								 sceneElement.fontColorCb=elmentObj.attr("fontColorCb");
								 
								 sceneElement.highBgColor=elmentObj.attr("highBgColor");
								 
								 sceneElement.bgColorCb=elmentObj.attr("bgColorCb");
								
								 
								 
								 sceneElement.title=elmentObj.attr("title");
								break;
								
						    case "mytime":
						    	
						    	 //数据源
								 sceneElement.jsonData=elmentObj.attr("jsonData");
			                    
			                    
								 sceneElement.tType=elmentObj.attr("tType");
			                    

								 sceneElement.tsType=elmentObj.attr("tsType");
								

								 sceneElement.fs=elmentObj.attr("fs");
								

								 sceneElement.fcolor=elmentObj.attr("fcolor");
							

								 sceneElement.ttDa=elmentObj.attr("ttDa");
								

								 sceneElement.ttHo=elmentObj.attr("ttHo");
								 

								 sceneElement.ttMi=elmentObj.attr("ttMi");
								

								 sceneElement.ttSs=elmentObj.attr("ttSs");
								 

								 sceneElement.ttTimePoint=elmentObj.attr("ttTimePoint");
								
								 sceneElement.advancedType=elmentObj.attr("advancedType");
								
								 sceneElement.unitShow=elmentObj.attr("unitShow");

								 sceneElement.mytimContent=elmentObj.attr("mytimContent");
	                            
						    	break;
						    
						    case "mytqs":
						    	 
						    	  sceneElement.title=elmentObj.attr("title");
						    	  
						    	  sceneElement.fresh=elmentObj.attr("fresh");
						    	  
						    	  sceneElement.dx=elmentObj.attr("dx");
						    	  
						    	  sceneElement.wfcolor=elmentObj.attr("wfcolor");
						    	  
						    	  sceneElement.sortableListSpans=elmentObj.attr("sortableListSpans");
						    	  
						    	  sceneElement.lineHeight=elmentObj.css("lineHeight").replace(/px/g,"");
						    	  
						    	 
				              
						    	break;
						    	
						    case "htmls":
						    
						         
                                  sceneElement.title=elmentObj.attr("title");
						    	  
						    	  sceneElement.time=elmentObj.attr("time");
						    	  
						    	  sceneElement.gun=elmentObj.attr("gun");
						    	  
						    	  sceneElement.sortableListSpans=elmentObj.attr("sortableListSpans");
						    	  
						        break;
						        
						    case "searc":      
						    	sceneElement.id=elmentObj.attr("id");
                                
						    	sceneElement.title=elmentObj.attr("title");
                                
                                sceneElement.type=elmentObj.attr("type");
                                
                                sceneElement.happyVal=elmentObj.attr("happyVal");
                                
                                sceneElement.uncomVal=elmentObj.attr("uncomVal");
                                
                                sceneElement.tTargetId=elmentObj.attr("tTargetId");
                                
                                //sceneElement.elementHide=elmentObj.attr("elementHide");
                                
                                ///sceneElement.bj=$("#"+elmentObj.attr("id")).attr("bj");
						        break;     
						    case "mycam":
						    case "qmany":
						    case "qsing":
						    case "mybus":
						    case "envir":	    
						    	sceneElement.id=elmentObj.attr("id");
                            
						    	sceneElement.title=elmentObj.attr("title");
                                
                                sceneElement.type=elmentObj.attr("type");
                                
                                sceneElement.happyVal=elmentObj.attr("happyVal");
                                
                                sceneElement.uncomVal=elmentObj.attr("uncomVal");
                                
                                sceneElement.tTargetId=elmentObj.attr("tTargetId");
                                
						        break;
						        
						        
						    case "imggr":
							      
						    	sceneElement.ptime=elmentObj.attr("ptime");
						    	  
						    	sceneElement.jsonData=elmentObj.attr("jsonData");
						      
						        break;
						        
						    case "imgfl":
							      
						    	sceneElement.ptime=elmentObj.attr("ptime");
						    	  
						    	sceneElement.jsonData=elmentObj.attr("jsonData");
						      
						        break;
						        
						    case "charg":
						    	
						    	sceneElement.jsonStr=elmentObj.attr("jsonStr");
						    	
						    	break;
						    	
						    case "source":
						    	
						    	sceneElement.jsonStr=elmentObj.attr("jsonStr");
						    	
						    	sceneElement.fontSize=elmentObj.attr("fontSize");
						    	
						    	sceneElement.lineHeight=elmentObj.attr("lineHeight");
						    	
						    	break;	
						    	
						    case "dllItem":
						    	
						    	sceneElement.jsonData=elmentObj.attr("jsonData");
						    	
						    	sceneElement.fontSize=elmentObj.attr("fontSize");
						    	
						    	sceneElement.lineHeight=elmentObj.attr("lineHeight");
						    	
						    	break;
						    	
						    case "myigs":	
						    	
                                sceneElement.interactGroupShowNumber=elmentObj.attr("interactGroupShowNumber");
						    	
						    	sceneElement.recycler=elmentObj.attr("recycler");
						    	
						    	sceneElement.treeData=elmentObj.attr("treeData");
						    	
						    	break;
						    	
						    	
                            case "mynew":	
						    	
                                sceneElement.timee=elmentObj.attr("timee");
						    	
						    	sceneElement.rsssrc=elmentObj.attr("rsssrc");
						    	
						    	sceneElement.rssSource=elmentObj.attr("rssSource");
						    	
						    	break;  	
						      
                            case "eleva":	
                            	
                            	sceneElement.city=elmentObj.attr("city");
                            	
                            	break;
                            case "caroY":
                            	
                            	sceneElement.jsonData=elmentObj.attr("jsonData");                           	
                            	
                            	var ycCount=$("#"+elmentObj.attr("id")).attr("ycCount");
                            	if(ycCount==undefined)
                            	{
                            		ycCount=5;
                            	}	
                            	sceneElement.ycCount=ycCount;
                            	
                            	sceneElement.bgtopfd=$("#"+elmentObj.attr("id")).attr("bgtopfd");
 								
								sceneElement.bgname=$("#"+elmentObj.attr("id")).attr("bgname");
								
								sceneElement.bgnameUrl=$("#"+elmentObj.attr("id")).attr("bgnameUrl");
                            	
                            	//sceneElement.bj=$("#"+elmentObj.attr("id")).attr("bj");
                            	
                            	break;
                           
                            	
                            case "mycall":
						    	
						    	sceneElement.callUrl=elmentObj.attr("callUrl");
						    	sceneElement.parmeter=elmentObj.attr("parmeter");
						    	
						    	break;
						        
						    default:
						        // ...
				    }
					
					
					sceneElement.elementHide=elmentObj.attr("elementHide"); //控件隐藏
					
					sceneElement.relationCall=elmentObj.attr("relationCall"); //关联叫号元素
		         	   
		         	
		         	    
					
					var mtouchs=elmentObj.attr("mtouchs");
			   		if(mtouchs==undefined||mtouchs==null){
			   				
			   		}else{
			   			 
			   			sceneElement.mtouchs=mtouchs;
			   	    	
			   		}
			   		 
					
					//allElementArry[allElementArry.length]= elmentObj.prop("outerHTML");
					
					allElementArry[allElementArry.length]=sceneElement;
					//alert(JSON.stringify(allElementArry));
					
					sceneElement.lock=elmentObj.attr("lock");
					//console.log("存入集合:"+elmentObj.prop("outerHTML"));
		    		
		    	});
				
				
				//查看是否有音频
				var yxmusics=$("#video10000");
				
				if(yxmusics.attr("id")!=undefined){
					var sceneElementAudio=new Object();
					
					sceneElementAudio.id=yxmusics.attr("id");
					sceneElementAudio.left=0;
					sceneElementAudio.top=0;
					sceneElementAudio.width=1;
					sceneElementAudio.height=1;
				     
					
				    
					var elementType=yxmusics.attr("elementType");
					
					sceneElementAudio.elementType=elementType;
					
					
					 //播放时长
					sceneElementAudio.ptime=yxmusics.attr("ptime");
	                 //数据源
					sceneElementAudio.jsonData=yxmusics.attr("jsonData");
					 
					sceneElementAudio.elementVideoType=yxmusics.attr("elementVideoType");
					 
					 
					allElementArry[allElementArry.length]=sceneElementAudio;
				}
				
				
				
				
				sceneObj.allElementArry=allElementArry;
				
				
				 if($('input[name="smartPlay"]').prop("checked"))
			     {
			            //alert("选中");
					    sceneObj.checkStime=-1;	 
					    
			     }else{
			      	  
			        	sceneObj.checkStime=$("#stime").val();	 

			     }
				
				console.log("sceneObj:"+JSON.stringify(sceneObj));
				$("#mcontent").val(JSON.stringify(sceneObj));
				
				
				Array.prototype.unique3 = function(){
					 var res = [];
					 var json = {};
					 for(var i = 0; i < this.length; i++){
					  if(!json[this[i]]){
					   res.push(this[i]);
					   json[this[i]] = 1;
					  }
					 }
					 return res;
				};
				
				//alert(JSON.stringify(fileArray.unique3()));
				if(fileArray.length==0){
					$("#fcontent").val("");
				}else{
					$("#fcontent").val(JSON.stringify(fileArray.unique3()));
					
				}
				
	            document.form1.target="_self"; 

	          
	            if(itemType==1){
	            	
	            	
	            	
	            	if($("#screenTypeHtml").val()==1){
	            		
	            		document.form1.action="savesubscene.vs?itemType=1";
	            		
	            	}else{
	            			
	            		document.form1.action="savescene.vs";
	            		
	            	}
	            	
	                
	              
	            }else if(itemType==2){
	            	
	            	

	            	if($("#screenTypeHtml").val()==1){
	            		
	            		document.form1.action="savesubscene.vs?itemType=2";
	            		
	            	}else{
	            		
	            		getAllTouchsNew();
		            	document.form1.action="saveinteractscene.vs?savetype=1";
	            	}
	            	
	            
	            	
	            
	            }
	            document.form1.submit();

	       }


    	
    }
    
    
    
    
 /**************************************触摸互动******************************************/
    
    
    //新增触摸互动  editType 1新增  2修改
    function touch_edit(editType){

   	 
    	//获取当前 选中元素id
    	var currentDiv;
    	var tDivList=new Array();
    	var touchIds="";
    	$("input[name = checkdom]:checkbox").each(function(){			
    		if ($("input[eId="+$(this).attr("eId")+"]").prop("checked")){
    			currentDiv=$("#"+$(this).attr("eId"));  
    		}
    		
    		if(touchIds.length==0){
      			  touchIds=$(this).attr("eId");
      		}else{
      			  touchIds=touchIds+"*"+$(this).attr("eId");
      		}
    		 
    		
    	});	

        if(currentDiv==undefined||currentDiv.attr("id")=="topfd1"){
           
           layer.msg(localObj.a00732);
           return;
        }
   	 

   	    var url="";
   	    var sf=$("#sf").val();
   	    if(editType==1){
	   		  if(flag == true){
	   			  //intro.exit();
	   			  url="toadtouch.vs?currentdivid="+currentDiv.attr("id")+"&touchIds="+touchIds+"&openIntro=1&sf="+sf;
	   		  }else{
	   			  url="toadtouch.vs?currentdivid="+currentDiv.attr("id")+"&touchIds="+touchIds+"&sf="+sf;
	   		  }
   	    }else if(editType==2){
   	    	
   	    	
   		    //获取选中行  
   		    //if (editIndex == undefined){return;}
   		    var row = $('#dg').datagrid('getSelected');
   		    if (row){
   		     
   			  //获取当前元素已经绑定的 touch字符串  
   			  var mtouchs=currentDiv.attr("mtouchs");

   			  //转换成touch对象组
   		      var objs = eval( "(" + mtouchs + ")" );//转换后的JSON对象
   		      var  obj; 
   		      for(var i=0;i<objs.length;i++){
   		    	  if(objs[i]==null){}else{
   					  if(objs[i].tTouchKey==row.tTouchKey){
   	                       obj=objs[i];
   					  }
   		    	  }
   			  }
   			  
   			  var jsonStr=JSON.stringify(obj);
   			  
   			  jsonStr=jsonStr.replace(/"/g,"'");
   			  
   		      url="toadtouch.vs?currentdivid="+currentDiv.attr("id")+"&touchIds="+touchIds+"&touchJson="+jsonStr+"&sf="+sf;
   		      
   		    }else{
   		       
   		       layer.msg(localObj.b00173);
   			   return;
   		    }
   		  		  
             
         }
   	     window.returnValue=""; 
   	     layer.open({
   	 			type: 2,
   	 	        area: ['900px', 550+'px'],
   	 	        offset: '20px',
   	 	        title:false,
   	 	        fix: false, //不固定
   	 	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
   	 	        content: url,
   	 	        scrollbar: false,
   	 	        end: function(){
   	 	               
   	 				 if(window.returnValue==undefined||window.returnValue==""){
   	 				     window.returnValue=""; 			            
   	 				}else{

   	 			
   	 					//if(flag == true){
   	 					//	intro.goToStep(7).start();
   	 					//}
    						 					
   	 					var json=window.returnValue;

   	 					//新增touch对象
   	 					var obj = eval( "(" + window.returnValue + ")" );//转换后的JSON对象
   	 					
   	                    //获取当前元素已经绑定的 touch字符串  
   	 					var mtouchs=currentDiv.attr("mtouchs");

   	 					//融合追加
                        var mtouchsArray=new Array();
                        if(mtouchs==null){
   	 						mtouchsArray[0]=obj;
   		 			    }else{
   			 			    //转换成touch对象组
   		 			    	var objs = eval( "(" + mtouchs + ")" );//转换后的JSON对象 
   		 			    	for(var i=0;i<objs.length;i++){
   		 			    		if(objs[i]==null){}else{
   				 			    	if(obj.tTouchKey==objs[i].tTouchKey){
   				 			    		mtouchsArray[i]=obj;
   					 			    }else{
   					 			    	mtouchsArray[i]=objs[i];
   						 			}
   		 			    		}
   		 						
   			 				}
   			 				if(editType==1){
   			 					mtouchsArray[objs.length]=obj;
   				 			}
   		 			    	
   			 			}

                        //页面显示
                        var mtouchsJson=JSON.stringify(mtouchsArray);
                           
                        //清空原有数据
                        var item = $('#dg').datagrid('getRows');
                        if (item) {
                               for (var i = item.length - 1; i >= 0; i--) {
                                   var index = $('#dg').datagrid('getRowIndex', item[i]);
                                   $('#dg').datagrid('deleteRow', index);
                               }
                        }

                           							
                        for(var i=0;i<mtouchsArray.length;i++){
                           		
                           	var	tTargetIdv=mtouchsArray[i].tTargetId;
                               
                               $('#dg').datagrid('appendRow',{
                           		   tTargetId:tTargetIdv,
                                   tTypeText:mtouchsArray[i].tTypeText,
                                   tTouchKey:mtouchsArray[i].tTouchKey,
                                   tTouchReturnTime:mtouchsArray[i].tTouchReturnTime
                               });

                        }
                          
                        //重新绑定
                        currentDiv.attr("mtouchs",JSON.stringify(mtouchsArray));
   	 					   
   	 				}	
   	 	            
   	 	        }
   	 	  }); 
         
    }
    
    
    
    function accptClickValue(){


	    //获取当前 选中元素id
	     var currentDiv;
	    	
	     $("input[name = checkdom]:checkbox").each(function(){
	    	 
	    		if ($("input[eId="+$(this).attr("eId")+"]").prop("checked")){
	    			currentDiv=$("#"+$(this).attr("eId"));  
	    		}
	    		
	      });	
    	
          $('#dg').datagrid('acceptChanges');
		 
		  var rows=$("#dg").datagrid("getRows");
	     
		  for(var i=0;i<rows.length;i++)
	 	  {
              if(i==editIndex){
              	    //var div=sel_div_touch();
				
					var tTouchReturnTime =rows[i].tTouchReturnTime;

					 //获取当前元素已经绑定的 touch字符串  
					var mtouchs=currentDiv.attr("mtouchs");

					//融合追加
                   var mtouchsArray=new Array();
                  
					//转换成touch对象组
			    	var objs = eval( "(" + mtouchs + ")" );//转换后的JSON对象 
			    	for(var j=0;j<objs.length;j++){
			    		if(objs[j]==null){}else{
	 			    		if(rows[i].tTouchKey==objs[j].tTouchKey){
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
		 	       
	 			
	 	   }

  }
    
    
    //获取全部 元素的 touch 事件  合并
    function getAllTouchsNew(){
	   
	   	
	     var mtouchsArray=new Array();
	     var count =0;
	   	 $("input[name = checkdom]:checkbox").each(function(){			
	    		
	    		var	currentDiv=$("#"+$(this).attr("eId")); 
	    		
	    		var mtouchs=currentDiv.attr("mtouchs");
		   		 if(mtouchs==undefined||mtouchs==null){
		   				
		   		 }else{
		   	    	 var objs = eval( "(" + mtouchs + ")" );//转换后的JSON对象 
		   	    	 for(var j=0;j<objs.length;j++){
		   				mtouchsArray[count]=objs[j];
		   				count++;
		   			 }
		   		    	
		   		 }
	      });	
	   	  var jsonc=JSON.stringify(mtouchsArray);
	   	  $("#jsonTouchs").val(jsonc);
   	 
   	 
    }
    
    
    
    //快捷帮助
    function itemFastHelp(){
	    var intro = introJs();  
	   
	    intro.setOptions({
 	       prevLabel:localObj.a00861, 
           nextLabel:localObj.a00862,
           skipLabel:localObj.a00020,
           doneLabel:localObj.a00020,
           showStepNumbers: false,
           showBullets: false,
           exitOnOverlayClick: false,
           overlayOpacity: 0.6,
		   steps: [  
				{  
					element: 'all',  
					intro: localObj.a00093+":<br/>"+localObj.b00191
						   +"<br/><br/>"+localObj.b00192
						   +"<br/><br/>"+localObj.b00193,
				    position: "right"
				}
			]  
	   }).start();  

	   intro.oncomplete(function() {
		   intro.exit();
		  
       });
	
	   intro.onexit(function() {
		  
	    });

    }


    
   
    
   
    
  
    