
$(function(){	
	//判断修改
    var ms=$("#mcontent").val();
    //转换json对象
    var sceneObj=JSON.parse(ms);
    
    
    $("#topfd1").attr("bgtopfd",sceneObj.bgtopfd);
    $("#topfd1").attr("bgname",sceneObj.bgname);
    $("#topfd1").attr("bgnameUrl",sceneObj.bgnameUrl);
    //$("#topfd1").attr("title",sceneObj.title); 
   
    $("#topfd1").css({
    	
         "backgroundImage":sceneObj.bgtopfd,
         "backgroundSize":"cover",
         "filter":"progid:DXImageTransform.Microsoft.AlphaImageLoader ( sizingMethod='scale' , src='"+sceneObj.bgtopfd+"')",
         "backgroundSize":"100% 100%" 

    });
    
    var cjzoom=sceneObj.sf;
    
    var tx=sceneObj.tx;

    var ty=sceneObj.ty;
    
    AdaptiveSfNew(ty,500,100,tx,1000);
    cjzoom=$("#sf").val();
    $("#topfd1").width(tx*cjzoom);
	$("#topfd1").height(ty*cjzoom);
    
    var allElementArry=sceneObj.allElementArry;
    var curScene = $("#topfd1");
    
    //时间插件显示
    var __sto = setInterval;    
    window.setInterval = function(new_add,timeout,param){    
     
          var _cb = function(){    
	      	  var now = new Date();
	       	  var year = now.getFullYear();
	       	  var month = now.getMonth() + 1;
	       	  var date = now.getDate();
	       	  var hours = now.getHours();
	       	  var minutes = now.getMinutes();
	       	  var seconds = now.getSeconds();
	       	  var day = now.getDay();
	       	  Day = new MakeArray(7);
	       	  Day[0]="星期日";
	       	  Day[1]="星期一";
	       	  Day[2]="星期二";
	       	  Day[3]="星期三";
	       	  Day[4]="星期四";
	       	  Day[5]="星期五";
	       	  Day[6]="星期六";
	       	  var timeValue = "";
	       	  // param 参数显示格式
	       	  // 1 yyyy-MM-dd
	       	  // 2 yyyy年MM月dd日
	       	  // 3 MM-dd-yyyy
	       	  // 4 HH:mm:ss
	       	  // 5 HH:mm
	       	  // 6 HH时mm分ss秒
	       	  // 7  星期
	       	  // 8 yyyy年MM月dd日  EEEE HH:mm:ss
	       	  // 9 MM月dd日yyyy年 EEEE HH:mm:ss
	       	  switch(param){
	       	        case "1" :
	       	        	timeValue += year + "-";
	               	    timeValue += ((month < 10) ? "0" : "") + month + "-";
	               	    timeValue += ((date < 10) ? "0" : "")+ date;
	       	        	break;
	       	        case "2":
	       	            timeValue += year + "年";
	            	    timeValue += ((month < 10) ? "0" : "") + month + "月";
	            	    timeValue += ((date < 10) ? "0" : "")+ date + "日  ";
	       	        	break;
	       	        case "3":
	       	        	timeValue += ((month < 10) ? "0" : "") + month + "-";
	               	    timeValue += ((date < 10) ? "0" : "")+ date+ "-";
	               	    timeValue += year;
	       	        	break;
	       	        case "4":
	       	            timeValue += ((hours < 10) ? "0" : "") + hours;
	            	    timeValue += ((minutes < 10) ? ":0" : ":") + minutes;
	            	    timeValue += ((seconds < 10) ? ":0" : ":") + seconds;
	       	        	break;
	       	        case "5":
	       	            timeValue += ((hours < 10) ? "0" : "") + hours;
	            	    timeValue += ((minutes < 10) ? ":0" : ":") + minutes;
	            	    break;
	       	        case "6":
	       	            timeValue += ((hours < 10) ? "0" : "") + hours+"时";
	            	    timeValue += ((minutes < 10) ? ":0" : "") + minutes+"分";
	            	    timeValue += ((seconds < 10) ? ":0" : "") + seconds+"秒";
	            	    break;
	       	        case "7":
	       	            timeValue += (Day[day]) + "";
	            	    break;
	       	        case "8" :
	       	        	
	       	            timeValue += year + "年";
	            	    timeValue += ((month < 10) ? "0" : "") + month + "月";
	            	    timeValue += ((date < 10) ? "0" : "")+ date + "日  ";
	            	    timeValue += (Day[day]) + "  ";
	            	    timeValue += ((hours < 10) ? "0" : "") + hours;
	            	    timeValue += ((minutes < 10) ? ":0" : ":") + minutes;
	            	    timeValue += ((seconds < 10) ? ":0" : ":") + seconds;
	       	        	break;
	       	         case "9" :
	       	        	timeValue += ((month < 10) ? "0" : "") + month + "月";
	            	    timeValue += ((date < 10) ? "0" : "")+ date + "日 ";
	            	    timeValue += year + "年";
	            	    timeValue += (Day[day]) + "  ";
	            	    timeValue += ((hours < 10) ? "0" : "") + hours;
	            	    timeValue += ((minutes < 10) ? ":0" : ":") + minutes;
	            	    timeValue += ((seconds < 10) ? ":0" : ":") + seconds;
	       	        	break; 	
	       	        	
	       	  
	       	  }
	       	  new_add.find(".time_content").text(timeValue);
        };    
        __sto(_cb,timeout);    
    };
    
    //倒计时
    window.setIntervalCountdown = function(new_add,timeout,param,ttDa,ttHo,ttMi,ttSs,unitShow){   
    	
    	var _cb = function(){    
	      	   
    		  var date1=new Date(param);
			  var totalSecs=(date1-new Date())/1000;
			  var days=Math.floor(totalSecs/3600/24);
			  var hours=Math.floor((totalSecs-days*24*3600)/3600);
			  var mins=Math.floor((totalSecs-days*24*3600-hours*3600)/60);
			  var secs=Math.floor((totalSecs-days*24*3600-hours*3600-mins*60));
			  var timeValue="";
			  
			  if(unitShow==1){
				  
				  if(ttDa==1){
					  timeValue+=days+" ";
				  }
				  if(ttHo==1){
					  timeValue+=hours+" ";
				  }
				  if(ttMi==1){
					  timeValue+=mins+" ";
				  }
				  if(ttSs==1){
					  timeValue+=secs;
				  }
				  
			  } else {
				  
				  if(ttDa==1){
					  timeValue+=days+"天";
				  }
				  if(ttHo==1){
					  timeValue+=hours+"小时";
				  }
				  if(ttMi==1){
					  timeValue+=mins+"分钟";
				  }
				  if(ttSs==1){
					  timeValue+=secs+"秒";
				  }
				  
			  }
			 
			  new_add.find(".time_content").text(timeValue);
			  
       };    
       __sto(_cb,timeout);    
    	
    };
    
    //遍历元素
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
			    	
			    	 
			    	new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'  class='element active image elementBorder' title='' curimglist='' from='img_edit'  style='"+get_add.attr("style")+"'   ></div>");
					
			    	//播放时长
		            new_add.attr("ptime",get_add.attr("ptime"));
		           
		            //数据源
		            new_add.attr("jsonData",get_add.attr("jsonData"));
		            
			        break;
			      
		       case "video":
			    	
			    	var elementVideoType = get_add.attr("elementVideoType");
			    	
			    	if(elementVideoType=="video"){
			    		
			    		
			    		 //解析播放资源包
				    	   var jsonData=JSON.parse(get_add.attr("jsonData"));
				    	   
				    	   //创建json资源包
				    	   var pathSourceArray=new Array();
				    	   var path1;
				    	   for(var j=0;j<jsonData.mMediaList.length;j++){
				    		   
				    		    path1="files/"+jsonData.mMediaList[j].path;
				    	   }
			    		
			    		   //new_add = $("<div id='"+get_add.attr("id")+"'  elementType='"+elementType+"'  elementVideoType='video'    class='element active video elementBorder' title='' curimglist='' from='img_edit'  style='"+get_add.attr("style")+"'   ><img  src='image/video.jpg'  style='width:100%;height:100%'></div>");
			    		
			    		   new_add = $("<video id='"+get_add.attr("id")+"' autoplay='autoplay' object-fit='fill'  loop='loop' style='"+get_add.attr("style")+"'  ></video>");
			    		   
				    	   //media.play();
			    		   
			    		   //var vList = ['http://localhost:8513/07.mp4', 'http://localhost:8513/152038810959196.mp4']; // 初始化播放列表   
			    		   
		                   //var vLen = vList.length;   
		                   
		                   //var curr = 0;   
		                  
		                   /**new_add.addEventListener('ended', function(){  
		                       play();  
		                   });    
		                      
		                   function play() {    
		                	   new_add.src = vList[curr];    
		                	   new_add.load();     
		                	   new_add.play();    
		                       curr++;    
		                       if(curr >= vLen){    
		                           curr = 0; //重新循环播放  
		                       }    
		                       
		                   }    
			    		   **/
			    	
			    	}else if(elementVideoType=="videoMedia"){
			    		
			    		new_add = $("<div id='"+get_add.attr("id")+"'  elementType='"+elementType+"'  elementVideoType='videoMedia'  class='element active video elementBorder' title='' curimglist='' from='img_edit'  style='"+get_add.attr("style")+"'   >"+get_add.attr("id")+"</div>");
			    		
			    		new_add.css({
                   	      "fontSize":Math.round(36*cjzoom)+"px" 
                        });
			    	}
			    	
			    	new_add.attr("elementVideoType",get_add.attr("elementVideoType"));
					
			    	//播放时长
		            new_add.attr("ptime",get_add.attr("ptime"));
		           
		            //数据源
		            new_add.attr("jsonData",get_add.attr("jsonData"));
		            
					break;
					
					
		       case "fonts":
			    	
		    	   //获取滚动方式
		    	   var gdtype=get_add.attr("gdtype");   // 2 静态文本  0 向上滚动  1向左滚动  3向下滚动
		    	   
		    	   if(gdtype==2){
		    		   
		    		   new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'  class='element active fonts elementBorder'     style='"+get_add.attr("style")+"'   ><div class='doc_content'></div></div>");   
		    	   
		    	   }else{
		    		   
		    		   var direction;
		    		   
		    		   if(gdtype==0){
		    			   direction="up";
		    		   }else if(gdtype==1){
		    			   direction="left";
		    		   }else if(gdtype==3){
		    			   direction="down"; 
		    		   }
		    		   var scrollamount=get_add.attr("gdspeed");
		    		   new_add = $("<marquee   direction='"+direction+"' scrollamount='"+scrollamount+"'    id='"+get_add.attr("id")+"' elementType='"+elementType+"'  class='element active fonts elementBorder'     style='"+get_add.attr("style")+"'   ><div class='doc_content'></div></marquee>");
		    	   }
                   
					
                   new_add.css({
               	         "fontSize":Math.round(get_add.attr("txtfontsize")*cjzoom)+"px" ,"fontFamily":get_add.attr("fonttype"),
                         "lineHeight":Math.round(Math.round(get_add.attr("txtfontsize")*get_add.attr("lineH"))*cjzoom)+"px"
                   });
                   
                   new_add.find(".doc_content").html(get_add.attr("doc_content"));
                  
                   break;
                   
		       case "mytime":
               	
              	     new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'   class='element active mytime elementBorder' title='' curimglist='' from='mytime_edit'  style='"+get_add.attr("style")+"'   ><div class='time_content'><div></div>");
					
		             //数据源
		             new_add.attr("jsonData",get_add.attr("jsonData"));
		             
		             new_add.css({
		            	 
                  	      "color":"#"+get_add.attr("fcolor"),
                  	      "fontSize":Math.round(get_add.attr("fs")*cjzoom)+"px",
                  	      "lineHeight":Math.round(get_add.attr("fs")*cjzoom)*1.3+"px"
                  	     
                    });
              
		              new_add.attr("tType",get_add.attr("tType"));

		              new_add.attr("tsType",get_add.attr("tsType"));

		              new_add.attr("fs",get_add.attr("fs"));

		              new_add.attr("fcolor",get_add.attr("fcolor"));

		              new_add.attr("ttDa",get_add.attr("ttDa"));  //天

		              new_add.attr("ttHo",get_add.attr("ttHo"));  //小时

		              new_add.attr("ttMi",get_add.attr("ttMi"));  //分

		              new_add.attr("ttSs",get_add.attr("ttSs"));  //秒

		              new_add.attr("ttTimePoint",get_add.attr("ttTimePoint"));

		              new_add.attr("advancedType",get_add.attr("advancedType"));

		              new_add.attr("unitShow",get_add.attr("unitShow"));

		              new_add.attr("mytimContent",get_add.attr("mytimContent"));
		              
		              
		             //获取时间类型 
		             //1 当前时间   3 倒计时 
		             var tType=get_add.attr("tType");
		            
		             if(tType==1){
		            	 window.setInterval(new_add,1000,get_add.attr("tsType"));	 
		             }else if(tType==3){

			             var ttDa=get_add.attr("ttDa"); //天
			             var ttHo=get_add.attr("ttHo"); //小时
			             var ttMi=get_add.attr("ttMi"); //分
			             var ttSs=get_add.attr("ttSs");//秒
			             var unitShow=get_add.attr("unitShow");//是否显示单位
		            	 window.setIntervalCountdown(new_add,1000,get_add.attr("ttTimePoint"),ttDa,ttHo,ttMi,ttSs,unitShow);
		             }
		              
		              //显示时间
		              //new_add.find(".time_content").text(get_add.attr("mytimContent"));
				 
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
	               	
	               	new_add = $("<div id='"+get_add.attr("id")+"'  class='element active mytqs elementBorder' title='' curimglist='' from='mytqs_edit'  style='"+get_add.attr("style")+"'   >"+
	               			"<img src='image/weather/"+gif+"' style='width:50%;height:50%;opacity:0.8;'><br/>"+
	               			"" +sortableListSpans.split("--")[0]+"&nbsp;&nbsp;&nbsp;"+day+"<br/>"+
	               			""+content+"</div>");
	               
	               	var fontsize_width = parseInt(new_add.css("width"))/4.0;	
	           		
	               	new_add.css({
	               		
	               		 "fontSize":Math.round(fontsize_width*0.5)+"px",
	               	     "lineHeight":Math.round(fontsize_width*0.5)*1.8+"px"
	               		 
	                });                      	
	               	break;
	               	
	               	
	               	
		        case "htmls":
				    
			         
		        	  var  htitle=get_add.attr("title");
		        	   
		        	  htitle=htitle.replace(/amp;/g,"");
		        	   
		        	  var htmlSrc=htitle.split("*")[2].split("@")[0].split("--")[0];
			           
		        	  new_add=$("<iframe  allowtransparency='true' src='"+htmlSrc+"'  style='"+get_add.attr("style")+"'  marginwidth='0'  marginheight='0' frameborder='0' scrolling='no'></iframe>");
			        
			        break;
			        
		        default:
		        	 
		        	 new_add = $("<div id='"+get_add.attr("id")+"' elementType='"+elementType+"'   class='element active  elementBorder' title='' curimglist=''  from='"+elementType+"_edit'  style='background-color: #000000;color:#FFFFFF;POSITION: absolute;'   >"+暂无法显示+"</div>");
		        	
			        break;
			        
	   }
	   
	   new_add.css("left",Math.round(get_add.attr("left")*cjzoom));
		
	   new_add.css("top",Math.round(get_add.attr("top")*cjzoom));

	   new_add.css("width",Math.round(get_add.attr("width")*cjzoom));
	
	   new_add.css("height",Math.round(get_add.attr("height")*cjzoom));
	   
	   curScene.append(new_add);
	   
	   //特效
	   switch (elementType) {
	   
			   case "image" :
		       case "mydoc" :
		       case "myxls" :
		       case "mypdf" :
		       case "myppt" :
			    	 
		    	   //解析播放资源包
		    	   var jsonData=JSON.parse(get_add.attr("jsonData"));
		    	   
		    	   //创建json资源包
		    	   var pathSourceArray=new Array();
		    	   
		    	   for(var j=0;j<jsonData.mMediaList.length;j++){
		    		   
		    		    var pathSource = new Object();
		    		    pathSource.src="files/"+jsonData.mMediaList[j].path;
		    		    pathSource.hasHref=true;
		    		    pathSource.href="#";
		    		    pathSource.hrefTarget="_self";
		    		    pathSourceArray[j]=pathSource;
		    		
		    	   }
		    	   
		    	   //添加特效
		           $("#"+get_add.attr("id")).slider({
		        	   
			       		width:get_add.attr("width")*cjzoom,
			       		height:get_add.attr("height")*cjzoom,
			       		showSlider: false,
			       		showOrigin: false,
			       		durantion:5000,
			       		originPosition:'center',
			       		source: pathSourceArray
			       		
		       	   });
		           break;
		           
		       case "video":
		    	   
		    	   var media=document.getElementById(get_add.attr("id"));
		    	 
		    	   //解析播放资源包
		    	   var jsonData=JSON.parse(get_add.attr("jsonData"));
		    	   media.src="http://localhost:8513/"+jsonData.mMediaList[0].path;    
	    		   media.load();     
		    	   media.play();   
		    	   
		    	   /**var vList = ['http://localhost:8513/07.mp4', 'http://localhost:8513/152038810959196.mp4']; // 初始化播放列表   
	    		   
	    		   var vLen = vList.length;   
                   
                   var curr = 0;      
		    	   
                   media.addEventListener('ended', function(){  
                      play();  
                   });    
                  
                   function play() {   
                	   
                	   media.src = vList[curr];    
                	   media.load();     
                	   media.play();    
	                   curr++;    
	                   if(curr >= vLen){    
	                       curr = 0; //重新循环播放  
	                   }    
                   
                  }**/    
    		      break;     
		    	   
		    	   
       }
	   
	}
    
   
    	 
    function sleep(d){
  	  for(var t = Date.now();Date.now() - t <= d;);
   }	
  
  
	
});