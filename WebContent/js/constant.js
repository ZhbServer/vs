  $(function(){
    	$('.cell_show').bind("mousemove",function(){this.style.backgroundColor='#007CCD';this.style.color='#FFFFFF';});
    	$('.cell_show').bind("mouseout",function(){this.style.backgroundColor='#FFFFFF';this.style.color='#343F51';});
    	
   });  


  function tr_mousemove(selftr){
  	selftr.style.backgroundColor='#007CCD';selftr.style.color='#FFFFFF';
  }
  function tr_mouseout(selftr){
  	
  	selftr.style.backgroundColor='#FFFFFF';selftr.style.color='#343F51';
  }
/*查询 aurl:提交地址*/
function selsc(aurl){

  var selv=$('#sel option:selected').val();//选中的值
  if(selv==0){
	  layer.msg(b00028);
	  return;
  }
  document.getElementById("id").value=1;
  document.form1.target = "_self";
  document.form1.action = aurl; 
  document.form1.submit();
            
}

/*分组跳转 gpid:分组id ,aurl:跳转地址*/
function scgroupjump(gpid,aurl){
       document.getElementById("gpid").value=gpid; 
	   document.getElementById("id").value=1;
	   document.form1.target = "_self";
	   document.form1.action = aurl; 
	   document.form1.submit();

}

/*页面显示条数 pagetype:页面显示条数,aurl:跳转地址*/
function setpagetype(pagetype,aurl){
   document.getElementById("pagetype").value=pagetype;
   document.getElementById("id").value=1;
   document.form1.target = "_self";
   document.form1.action = aurl; 
   document.form1.submit();
}

/*页面显示条数 pagetype:页面显示条数,aurl:跳转地址*/
function sel_ser_client_index(aurl){
   
   document.getElementById("id").value=1;
   document.form1.target = "_self";
   document.form1.action = aurl; 
   document.form1.submit();
}

/*单击选中素材*/
function dj(obj,qid){ 
 	if(obj.value=='1'){
		obj.style.background = "url(image/ithemsbg.png) left top no-repeat";
		obj.value='2';
        var qxobj=document.getElementById("qx"+qid+"");
        qxobj.checked=false;
	}else{
		obj.style.background = "url(image/ithemsbg.png) left bottom no-repeat";
		obj.value='1';
		
		
		var qxobj=document.getElementById("qx"+qid);
        qxobj.checked=true;
  }     
}


/*素材分组弹出框*/
function openScGroup(type){
	 layer.open({
 		type: 2,
         area: ['1100px', '590px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'toscg.vs?type='+type,
         scrollbar: false,
         end: function(){ 
		   document.form1.target = "_self";
		   document.form1.action = "tosclist.vs"; 
		   document.form1.submit();       
 		}
 	});               

}


/*上传弹出框*/
function openUpload(url,type){
   layer.open({
		type: 2,
		title:false,
        area: ['800px', '430px'],
        offset: '20px',
        
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: url,
        scrollbar: false,
        end: function(){ 
    	   /*添加素材操作日志*/
    	   getpartnodiv("addlogsucai.vs?sucaiType="+type);
    	   /*刷新页面*/
    	   document.getElementById("id").value=1;
		   document.form1.target = "_self";
		   document.form1.action = "tosclist.vs"; 
		   document.form1.submit();       
		}
	});            
}
/*上传弹出框节目*/
function openupload_item(url,type,rurl){
	 
 
	   layer.open({
			type: 2,
			title:false,
	        area: ['700px', '480px'],
	        offset: '10px',
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: url,
	        scrollbar: false,
	        end: function(){ 
	    	   /*添加素材操作日志*/
	    	   getpartnodiv("addlogsucai.vs?sucaiType="+type);
	    	   /*刷新页面*/
	    	   document.getElementById("id").value=1;
			   document.form1.target = "_self";
			   document.form1.action = rurl; 
			   document.form1.submit();       
			}
		});            
}

/*弹出修改点位*/
function open_dog_set(){
	layer.open({
 		type: 2,
         area: ['600px', '300px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'system_cs_dog_index.jsp',
         scrollbar: false,
         end: function(){ 
		 
 		}
 	});            
}
/*返回 关闭窗口(不传值)*/
function close_win_nov(){


	     var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
		 window.parent.returnValue=""; 
         window.parent.layer.close(index);
	 
}


/*节目分组弹出框*/
function openItemGroup(){
	 layer.open({
 		type: 2,
         area: ['1100px', '590px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'toitemg.vs',
         scrollbar: false,
         end: function(){ 
		   document.form1.target = "_self";
		   document.form1.action = "toitemlist.vs"; 
		   document.form1.submit();       
 		}
 	});               

}

/*跳转素材列表/图文显示*/
function replace_sucai_list(url){
	
	var gpid=document.getElementById("gpid").value;
	
	window.location.href=url+"&gssi.sucaigroupid="+gpid;
}
/*制作节目*/
function openadditem(){
	alert("进入了constant.js");
	 window.returnValue="";
	 
	var count=3000; 
 	var originalArray=new Array;//原数组 
 	//给原数组originalArray赋值 
 	for (var i=0;i<count;i++){ 
 	originalArray[i]=i+1; 
 	} 
 	originalArray.sort(function(){ return 0.5 - Math.random(); }); 
  
 	
 	
	 layer.open({
			type: 2,
	        area: ['620px', '400px'],
	        offset: '20px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: 'itemtoadd.vs?itemType=1',
	        scrollbar: false,
	        end: function(){ 
	    	   
			   if(window.returnValue==undefined||window.returnValue==""){
				   window.returnValue=""; 
                  
			   }else{
				   var rv= window.returnValue;
				   var rv1=rv.split('@')[0];
				   var rv2=rv.split('@')[1];
				   var rv3=rv.split('@')[2];
				   alert(rv3);
				   var showurl="toscene.vs?item.name="+rv1+"&item.fblid="+rv2+"&item.lable"+rv3+"&token="+originalArray[0];
				   showurl=encodeURI(showurl); 
		           showurl=encodeURI(showurl);
				   //以下是调用上面的函数
			       var mb = myBrowser();
			       if ("Chrome" == mb) {
			    	  
				    	window.parent.location.href=showurl;
				   }else{
				    	window.open(showurl,"_parent");
				   }
			   }               
			}
		});
	
}
/*制作互动节目*/
function openaddinteractitem(){
	 window.returnValue="";
	 alert("进入制作互动节目");
	 var count=3000; 
	 	var originalArray=new Array;//原数组 
	 	//给原数组originalArray赋值 
	 	for (var i=0;i<count;i++){ 
	 	originalArray[i]=i+1; 
	 	} 
	 	originalArray.sort(function(){ return 0.5 - Math.random(); }); 
	 	
	 	
	 layer.open({
			type: 2,
	        area: ['620px', '400px'],
	        offset: '20px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: 'itemtoadd.vs?itemType=2',
	        scrollbar: false,
	        end: function(){ 
	    	 
			   if(window.returnValue==undefined||window.returnValue==""){
				   window.returnValue=""; 
                  
			   }else{
				   var rv= window.returnValue;
				   var rv1=rv.split('@')[0];
				   var rv2=rv.split('@')[1];
				   var showurl="tointeractscene.vs?interactitem.name="+rv1+"&interactitem.fblid="+rv2+"&token="+originalArray[0];
				   showurl=encodeURI(showurl); 
		           showurl=encodeURI(showurl);
				   //以下是调用上面的函数
			       var mb = myBrowser();
			      
			       if ("Chrome" == mb) {
				    	window.parent.location.href=showurl;
				   }else{
				    	window.open(showurl,"_parent");
				   }  
			   }               
			}
		});
	
}
/*弹出执行结果*/
function open_result_last(){
	 layer.open({
	 		type: 2,
	         area: ['1100px', '620px'],
	         offset: '5px',
	         title:false,
	         fix: false, //不固定
	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	         content: 'reusltlast.vs',
	         scrollbar: false,
	         end: function(){ 	  
			 }
	 	});   
	
}

/*吐司*/
function show_tips(sv,cname){	
	layer.tips(cname, '#'+sv);	
} 

function get_focus(){
	//获取焦点
    document.getElementById('itemname').focus();
}

/*查看终端信息*/
function open_client_info(cid){

	 

	 window.returnValue="";
	 layer.open({
			type: 2,
	        area: ['900px', '550px'],
	        offset: '20px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: 'getclientinfo.vs?cid='+cid,
	        scrollbar: false,
	        end: function(){ 
	    	 
			              
			}
		});
 }
/*查看场景列表*/
function selscenelist(iid){

	 

	 window.returnValue="";
	 layer.open({
			type: 2,
	        area: ['620px', '400px'],
	        offset: '20px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: 'tointeractitemsceneall.vs?iid='+iid,
	        scrollbar: false,
	        end: function(){ 
	    	 
			   if(window.returnValue==undefined||window.returnValue==""){
				   window.returnValue=""; 
                 
			   }else{
				  	
			   }               
			}
		});
 }

//移除option
function removeOption(){ 
   var sel=document.getElementById("dblistse");   
	   for(var i=sel.options.length-1;i>=0;i--){  
	     if(sel.options[i].selected){  
	        sel.options.remove(i);   
	     }  
	   }   
	}

	//向上
	function upOption(){
		var obj=document.getElementById("dblistse");
		for(var i=1; i < obj.options.length; i++){//最上面的一个不需要移动，所以直接从i=1开始  
           if(obj.options[i].selected){  
               if(!obj.options.item(i-1).selected){  
                   var selText = obj.options[i].text;  
                   var selValue = obj.options[i].value;  
                   obj.options[i].text = obj.options[i-1].text;  
                   obj.options[i].value = obj.options[i-1].value;  
                   obj.options[i].selected = false;  
                   obj.options[i-1].text = selText;  
                   obj.options[i-1].value = selValue;  
                   obj.options[i-1].selected=true;  
               }  
           }  
       }  
		
  } 
  //向下 
	function bottomOption()  
	{  
	    
		var obj=document.getElementById("dblistse"); 
		

		for(var i = obj.options.length -2 ; i >= 0; i--){//向下移动，最后一个不需要处理，所以直接从倒数第二个开始  
	            if(obj.options[i].selected){  
	                if(!obj.options[i+1].selected){  
	                    var selText = obj.options[i].text;  
	                    var selValue = obj.options[i].value;  
	                    obj.options[i].text = obj.options[i+1].text;  
	                    obj.options[i].value = obj.options[i+1].value;  
	                    obj.options[i].selected = false;  
	                    obj.options[i+1].text = selText;  
	                    obj.options[i+1].value = selValue;  
	                    obj.options[i+1].selected=true;  
	                }  
	            }  
	      }  
	}    
	
	/*加到列表事件*/
	 function addMuti(){
	    var str=document.getElementsByName("qx");
	    var objarray=str.length;
	    var chestr="";
	    for (i=0;i<objarray;i++)
	    {
	 	  var sel=document.getElementById("dblistse");   
	      if(str[i].checked == true)
	      {
	     	  var strs= new Array(); 
	          var svalues=str[i].value;
	          strs=svalues.split("_");
	          var op=new Option(strs[1],strs[0]);
	          if((sel.length+1)%2==0){

	          }else{
	        	  op.style.backgroundColor="#F9F9F9";
	          }
	          
	          sel.options.add(op);  
	      }
	    }
	           
	 }
	 
	 
	 /*检测浏览器型号*/
	 function myBrowser(){
	     var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
	     var isOpera = userAgent.indexOf("Opera") > -1;
	     if (isOpera) {
	        return "Opera";
	     }; //判断是否Opera浏览器
	     if (userAgent.indexOf("Firefox") > -1) {
	        return "FF";
	     } //判断是否Firefox浏览器
	     if (userAgent.indexOf("Chrome") > -1){
	        return "Chrome";
	     }
	     if (userAgent.indexOf("Safari") > -1) {
	        return "Safari";
	     } //判断是否Safari浏览器
	     if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera) {
	        return "IE";
	     }; //判断是否IE浏览器
	 }
	 
	 
	 /*已选节目*/
	  function yxitem(){
		   var itemsids=document.getElementById("itemsids").value;
		   layer.open({
				type: 2,
		        area: ['650px', '280px'],
		        offset: '50px',
		        title:false,
		        fix: false, //不固定
		        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		        content: "toclientyxitem.vs?itemsids="+itemsids,
		        scrollbar: false,
		        end: function(){ 
					   if(window.returnValue==undefined||window.returnValue==""){
						     window.returnValue=""; 			            
						 }else{
			                 document.getElementById("itemsids").value=window.returnValue;   
						 }	 
						         
					   }
		 });
	  }
	  
	  //打开节目列表
	  function open_items(itemIdsAndType){
		   layer.open({
				type: 2,
		        area: ['620px', '400px'],
		        offset: '20px',
		        title:false,
		        fix: false, //不固定
		        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		        content: 'tocpplayitem.vs?itemIdsAndType='+itemIdsAndType,
		        scrollbar: false,
		        end: function(){ 
		    	          
				}
			});
	}
	  
	
	//显示隐藏模块(鼠标悬浮预览)
	  
	function show(obj,id,residualValueLeft,residualValueTop) {
		
			 var objDiv = $("#"+id+""); 
			 
			 $(objDiv).css("display","block"); 
			 
			 $(objDiv).css("left",obj.offsetLeft+residualValueLeft); 
			 
			 $(objDiv).css("top",obj.offsetTop+residualValueTop); 
	 
	}
	//隐藏显示模块(鼠标悬浮预览)
	function hide(obj,id) { 
			 var objDiv = $("#"+id+""); 
			 $(objDiv).css("display", "none");  
	 }
	
	function onhref(hrefurl){

		 window.location.href=hrefurl;
	}
	
	
	
	/*查看终端信息*/
	function open_client_eye_info(cid){


		 window.returnValue="";
		 layer.open({
				type: 2,
		        area: ['900px', '550px'],
		        offset: '20px',
		        title:false,
		        fix: false, //不固定
		        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		        content: 'getclienteyeinfo.vs?cid='+cid,
		        scrollbar: false,
		        end: function(){ 
		    	 
				              
				}
			});
	 }
	
	
	
	var pointList = new Array(); 

	/*生成网格坐标*/
	function createGridCoordinate(){
		
	     var x=180;   
	     var y=100;
	     var xyH=10;
	     var xshow=0;
	     var yshow=0;
	     var count=0;

	     for (var j = 0; j < x; j++) {
	   		for (var j2 = 0; j2 < y; j2++) {
	   	   		  
					var point = new Object();
					point.x=j*xyH;
					point.y=j2*xyH;
					pointList[count]=point;
					
	                count++;
	                
			 }
		  }
		  
	}

	/**
	 * 
	 * @param p1  目标坐标
	 * @param p2  当前坐标
	 * @return
	 */

	 function difference(p1,p2){
		  
		   var jili = Math.sqrt(Math.abs((p1.x - p2.x)
					* (p1.x - p2.x) + (p1.y - p2.y)
					* (p1.y - p2.y)));
		   
		   return jili;
	 }


	/**
	 * 比较坐标
	 * cCurrentPoint 
	 */ 
	 function comparisonCoordinate(cCurrentPoint){
		
		  var pointList2 = new Array();
		  for (var i = 0; i < pointList.length; i++) {
			 
			   var point1=pointList[i];      		   
			   point1.xyDistance=difference(point1, cCurrentPoint);
			   pointList2[i]=point1;
			   
		  }
		  
		  //排序
	      for(var i=0;i<pointList2.length;i++){
	    	  
			    for(var j = i + 1;j<pointList2.length;j++){
			    	
			        if(pointList2[i].xyDistance>pointList2[j].xyDistance){
			            var tmp = pointList2[i];
			            pointList2[i] = pointList2[j];
			            pointList2[j] = tmp;
			        }
			        
			    }
			}
	        return  pointList2[0];
		    //alert(pointList2[0].x+"  "+pointList2[0].y); 
	 }	 
	 //网格吸附
	 function grid_element_move(divv2,topfdWidht,topfdHeight){

	          //获取网格吸附状态
		       $("#gridAdsorption").each(function(){
			   
					    if(this.checked){

					    	  get_focus();
                             
					          var divPoint=new Object();
					          divPoint.x=divv2.offsetLeft;
					          divPoint.y=divv2.offsetTop;
						      //var rdivPoint=comparisonCoordinate(divPoint);
						    
							  layer.open({
									type: 2,
									area: ['0px', '0px'],
									shade: false,
								    offset: '40px',
							        title:false,
							        maxmin:false,
							        fix: false, //不固定
							        shift: -1, //0-6的动画形式，-1不开启
							        content: "result_close.jsp",
							        time: 0, //2秒后自动关闭
							        scrollbar: false,
							        closeBtn:0,
							        end: function(){ 
								         
								         var rpx=divPoint.x;
								         
								         var rpxString=rpx+"";
								         var lastRpx=rpxString.charAt(rpxString.length-1);
								     	
								         
								         rpx=rpx-parseInt(lastRpx);
								         //console.log(rpx);
								         divPoint.x=parseInt(rpx);
								         
								         if(divv2.offsetWidth+divv2.offsetLeft>topfdWidht){
								        	 divPoint.x=topfdWidht-divv2.offsetWidth; 
								         }
								         
								         divv2.style.left=divPoint.x+"px";
								         var rpy=divPoint.y;
								         var rpyString=rpy+"";
								         var lastRpy=rpyString.charAt(rpyString.length-1);
								      
								         rpy=rpy-parseInt(lastRpy);
								         //console.log(rpy);
								         divPoint.y=parseInt(rpy);
								         
								         
								         if(divv2.offsetHeight+divv2.offsetTop>topfdHeight){
								        	 divPoint.y=topfdHeight-divv2.offsetHeight; 
								         }
								         
							             divv2.style.top=divPoint.y+"px";
							             
							             
							            // console.log("坐标:"+divPoint.x+"  "+divPoint.y);
									              
									}
							   });

						       
					    }
			   });  
		
	 }
	 
	//页面跳转
	 function a_win_local(url){
      
		 
		 layer.confirm(b00046+"?", {icon: 3, title:a00093,btn: [a00080, a00670]}, function(index){  
	             window.location.href=url;
		 });
	 }

	 //sleep
	 function sleep(n) { //n表示的毫秒数
	     var start = new Date().getTime();
	     while (true) if (new Date().getTime() - start > n) break;
	 }
	 
	 
	//上移
 	 function MoveUp(type) {
          var dg='';
         if(type==0){
        	 dg='dgPlay';
         }else if(type==1){
              dg='dg';
 		 }else if(type==2){
 			 dg='dgVideo';
 	     }else if(type==3){
              dg='dgHtml';
 		 }else if(type==4){
 			  dg='dgPlaySucai';
 			 
 		 }
         
   	     var rows = $("#"+dg).datagrid("getRows");
   	     
   	     if(rows.length<1)
 	     {
 	        return;
 	     }
 	     
 	     var row = $("#"+dg).datagrid('getSelected');
 	     //console.log("row:"+row)
 	     if(row==null){
 	    	 return;
 	     }
 	     var index = $("#"+dg).datagrid('getRowIndex', row);
 	     mysort(index, 'up',dg);  
 	 }
 	 //下移
 	 function MoveDown(type) {
 		 var dg='';
 		if(type==0){
       	 dg='dgPlay';
        }else if(type==1){
              dg='dg';
 		 }else if(type==2){
 			 dg='dgVideo';
 	     }else if(type==3){
              dg='dgHtml';
 		 }else if(type==4){
 			  dg='dgPlaySucai';
 			 
 		 }

 		 var rows = $("#"+dg).datagrid("getRows");
   	     if(rows.length<1)
 	     {
 	        return;
 	     }

 	     
 	     var row = $("#"+dg).datagrid('getSelected');
 	     if(row==null){
	    	 return;
	     }
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
 	 
 	 
 	//键盘弹起宽高XY输入框事件
 	function setElementSize(elementObj){

 		//elementObj.value=elementObj.value.replace(/\D/g,'');

 			
 		//获取缩放
 	    var sf=document.getElementById("sf").value;
 	     //获取坐标宽高
 	    var lleft=parseInt(document.getElementById("lleft").value);

 	    var ltop=parseInt(document.getElementById("ltop").value);

 	    var lwidth=parseInt(document.getElementById("lwidth").value);

 	    var lheight=parseInt(document.getElementById("lheight").value);


 	     //获取分辨率
 	     var itemfbl=document.getElementById("itemfbl").value;

 	     var w=parseInt(itemfbl.split("*")[0]);
 	     var h=parseInt(itemfbl.split("*")[1]); 
 	      
 	     //获取当前元素
 	    
 	     var selDiv=sel_div_touch();


 	     layer.open({
 			type: 2,
 			area: ['0px', '0px'],
 			shade: false,
 		    offset: '40px',
 	        title:false,
 	        maxmin:false,
 	        fix: false, //不固定
 	        shift: -1, //0-6的动画形式，-1不开启
 	        content: "result_close.jsp",
 	        time: 0, //2秒后自动关闭
 	        scrollbar: false,
 	        closeBtn:0,
 	        end: function(){ 
 		         

 			    
 	             //判断坐标
 	    	     
 	    	     if(lleft<0){
 	                 lleft=0;
 	                 document.getElementById("lleft").value=0;
 	        	 }
 	    	     if (lwidth + lleft > w) {
 	    	    	 lleft = w - lwidth;
 	    	    	 document.getElementById("lleft").value=lleft;
 						
 	    	     }

 	    	     if(ltop<0){
 	                 ltop=0;
 	                 document.getElementById("ltop").value=0;
 	        	 }
 	    	     if (lheight + ltop > h) {
 	    	    	 ltop = h - lheight;
 	    	    	 document.getElementById("ltop").value=ltop;
 						
 	    	     }

 	    	     if (lheight > h) {
 			    	  lheight = h;
 			    	  document.getElementById("lheight").value=lheight;
 			      }
 			      if (lwidth > w) {
 			    	  lwidth = w;
 			    	  document.getElementById("lwidth").value=lwidth;
 			      }

 			          
 	    	
 	             selDiv.style.width=Math.round(lwidth*sf)+"px";
 	             selDiv.style.height=Math.round(lheight*sf)+"px";
 	             selDiv.style.left=Math.round(lleft*sf)+"px";
 	             selDiv.style.top=Math.round(ltop*sf)+"px";

 	            
 			              
 			}
 	   });  

 		
 	}


 	
 	
 	 
 	 /*制作节目获取全部元素*/
 	function get_topfd_all(){

 		var topdiv=document.getElementById("ie_item_make").contentWindow.document.getElementById("topfd");
 	    var tDivList2=new Array();
 	    var tDiv;

 	   
 	    var imgs=topdiv.getElementsByTagName("img");
 	    for(var i = 0;i<imgs.length;i++)
 		{
 			  
 			  tDiv=imgs[i];
 			  tDivList2.push(tDiv);
 			 

 		}

 		
 	    var divs=topdiv.getElementsByTagName("div");

 		for(var i = 0;i<divs.length;i++)
 		{
 			  tDiv=divs[i];

 			  tDivList2.push(tDiv);
 			 
 	         
 		}

 		return tDivList2;
 		 
 	 } 

 	 //获取当前选中元素
 	 function sel_div_touch(){
 		//获取当前 选中元素id
 	     var  currentdivid=document.getElementById("currentdivid").value;
 	     if(currentdivid.length==0){
 	        layer.msg(a00732);
 	        return;
 	     }

 	     var tDivAll=get_topfd_all();

 	     var div;
 	     var tDivAll=get_topfd_all();
 	     var tDivs=""; 
 		 var tDiv;
 		 var tDivList=new Array();
 		 for(var i = 0;i<tDivAll.length;i++)
 		  {
 			  
 			  tDiv=tDivAll[i];

 			  //获取当前元素
 			  if(currentdivid==tDiv.id){
 	              div=tDivAll[i];
 			  }
 			  
 			  tDivList.push(tDiv.id);

 		  }
 		  return div;

 	 }
 	 
 	 
 	function MakeArray(size) {
		this.length = size;
		for ( var i = 1; i <= size; i++) {
			this[i] = "";
		}
		return this;
	}
 	
 	
 	
 	
 	
 	 

	/*制作节目取消所有元素边框*/
	 function unElementBorder(){
		
	    var tDivs=get_topfd_all();
	    for(var i = 0;i<tDivs.length;i++){ 	    	

	    	   //tDivs[i].style.border="0px";
	    	tDivs[i].style.backgroundImage='url()';
	    	tDivs[i].style.backgroundSize="";
	    	tDivs[i].style.filter="";
	    	tDivs[i].style.backgroundSize="";
	       	
	    	 
	    }  
	 }



	 /*获取时间样式
	  *
	  *timeType  时间类型   1时间   2正计时   3倒计时 
	  *showType  显示类型 
	  *
	  */
	 
	 function getTimeShowStyle(timeType,showType,js1,js2,js3,js4,unitShow){

		 var mytimContent=""; 
		  if(timeType=="1"){

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
	       		 Day[0] = a00309;  //星期日
	       		 Day[1] = a00303;  //星期一
	       		 Day[2] = a00304;  //星期二 
	       		 Day[3] = a00305;  //星期三
	       		 Day[4] = a00306;  //星期四
	       		 Day[5] = a00307;  //星期五
	       		 Day[6] = a00308;  //星期六
	       		
			  if(showType=="1"){
				  mytimContent=year+"-"+month+"-"+date;
			  }else if(showType=="2"){
				  mytimContent=year+a00297+month+a00298+date+a00299;
			  }else if(showType=="3"){
				  mytimContent=month+"-"+date+"-"+year;
			  }else if(showType=="4"){
				  mytimContent=hours+":"+minutes+":"+seconds;
			  }else if(showType=="5"){
				  mytimContent=hours+":"+minutes;
			  }else if(showType=="6"){
				  mytimContent=hours+a00494+minutes+a00495+seconds+a00106;
			  }else if(showType=="7"){
				  mytimContent=Day[day];
			  }else if(showType=="8"){
				  mytimContent=year+a00297+month+a00298+date+a00299+" "+Day[day]+" "+hours+":"+minutes+":"+seconds;
			  }else if(showType=="9"){
				  mytimContent=month+a00298+date+a00299+year+a00297+" "+Day[day]+" "+hours+":"+minutes+":"+seconds;
			  }else if(showType=="10"){
	        	  //mytimContent="yyyy.MM.dd";
	        	  mytimContent=year+"."+month+"."+date;
	          }else if(showType=="11"){
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
			 
		  }else if(timeType=="2"||timeType=="3"){
			    //天
	        	if(js1==1){
	        		if(unitShow==0){
	        			mytimContent+="XX"+a00300;	
	        		}else{
	        			
	        			mytimContent+="XX ";	
	        		}
	        		
	           }

	        	//小时
	        	if(js2==1){
	        		if(unitShow==0){
	        			mytimContent+="XX"+a00301;
	        		}else{
	        			mytimContent+="XX ";
	        		}
	        		
	           }

	        	//分钟
	        	if(js3==1){
	        		if(unitShow==0){
	        			mytimContent+="XX"+a00302;
	        		}else{
	        			mytimContent+="XX ";
	        		}
	           }

	        	//秒
	        	if(js4==1){
	        		if(unitShow==0){
	        			mytimContent+="XX"+a00106;
	        		}else{
	        			mytimContent+="XX ";
	        		}
	           }
		  }
		  return mytimContent;
	  }
	 
	 
	 
	 function AdaptiveSf(fblH,totalHeight,sf){
		    
			if(fblH*sf>totalHeight){
				if(sf==0.3){
					cjzoom=sf;
			    	document.getElementById("sf").value=sf;
					
				}else{
					sf=parseFloat(sf)-0.1;
					sf=sf.toFixed(1); 
					AdaptiveSf(fblH,totalHeight,sf);    
				}    
				
		    }else{
		    	cjzoom=sf;
		    	document.getElementById("sf").value=sf;
		    }
	  }
	 
	 
	 function AdaptiveSfNew(fblH,totalHeight,sf,fblw,totalWidth){
			//console.log(fblH*(sf*0.01)+"    "+totalHeight);
			if((fblH*(sf*0.01)>totalHeight)||(fblw*(sf*0.01)>totalWidth)){
				//if(sf==20){
				//	cjzoom=sf*0.01;
			    //	document.getElementById("sf").value=sf*0.01;
					
				//}else{
				//	sf=sf-1;
					//sf=sf.toFixed(1); 
				//	AdaptiveSfNew(fblH,totalHeight,sf,fblw,totalWidth);    
				//}
				
				sf=sf-1;
				AdaptiveSfNew(fblH,totalHeight,sf,fblw,totalWidth);    
				
				
		    }else{
		    	cjzoom=sf*0.01;
		    	document.getElementById("sf").value=sf*0.01;
		    }
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
	    
	    
	 
	 
	 
 	 //layer弹出框大数据传输
	    
	 function setLayerBigDataParameter(v){
		 
		  $("#layerBigDataParameter").val(v);
	
	 }   
	 
	 //layer弹出框大数据传输
	    
	 function setLayerBigDataParameterMap(v){
		 
		  $("#layerBigDataParameterMap").val(v);
	
	 }   
	 
	 
	 
	//页面跳转
	 function page_jump_href(url){
	 	window.location.href=url;
	 }
 	 
	//验证是否包含特殊字符%& 
	function containSpecial( s ) { 
		    var containSpecial = RegExp(/[(\%)(\&)(\+)]+/); 

		    return ( containSpecial.test(s) );

	}
	
	//验证是否包含中文  true 不包含中文
	function isChn(str){
	    var reg = new RegExp("[\\u4E00-\\u9FFF]+","g");
		if(reg.test(str)){ 
			return false;
		}else{
			return true;
		}         
		       
		       
	   
	}
	
	function pagerFilter(data){
		if (typeof data.length == 'number' && typeof data.splice == 'function'){	// is array
			data = {
				total: data.length,
				rows: data
			}
		}
		var dg = $(this);
		var opts = dg.datagrid('options');
		var pager = dg.datagrid('getPager');
		pager.pagination({
			 pageList:[10,20,30,data.total],
	         beforePageText: js001,//[第]页数文本框前显示的汉字    
	         afterPageText: js002+' '+js003+'{pages}'+js002,  //页    共 {pages} 页
	         displayMsg: js004+'{from} - {to}'+js005+'   '+js003+' {total}'+js005,//当前显示 {from} - {to} 条记录   共 {total} 条记录
	         //showPageList:false,
	         showRefresh:false,
			 onSelectPage:function(pageNum, pageSize){
				opts.pageNumber = pageNum;
				opts.pageSize = pageSize;
				pager.pagination('refresh',{
					pageNumber:pageNum,
					pageSize:pageSize
				});
				dg.datagrid('loadData',data);
				onMousePreView();
			}
		});
		if (!data.originalRows){
			data.originalRows = (data.rows);
		}
		var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
		var end = start + parseInt(opts.pageSize);
		data.rows = (data.originalRows.slice(start, end));
		return data;
	}
	
	
	
	  /*
     * 获取数据源转换 
     * type 素材类型               1背景,2音频,3视频,4图片,5Flash,6PPT,7Word,8Excel,9PDF,10文本  ,0用户   11终端
     * intoType 数据类型    1为解析sucaiListJson(字符串) 2为解析 data(对象集合) 
     * sucaiListJson     字符串json格式
     * data              对象集合       
     */  
 	function getData(type ,infoType,sucaiListJson,data){

	     var rows = [];
         if(infoType==1){
       		if(sucaiListJson!=""){
       	    	
       			sucaiListJson=sucaiListJson.replace(/&quot;/g,"\"");
                   //转换成touch对象组
       		    var objs = eval( "(" + sucaiListJson + ")" );//转换后的JSON对象
       		
       		    for(var i=0;i<objs.length;i++){
       		
       		    	if(type==4||type==1){
	       				rows.push({
	       	                tScName:objs[i].name,
	       					ck:objs[i].id,
	       					tScFileName:objs[i].filename
	       					
	       				});
       		    	}else if(type==3||type==2){
       		    		
       		    	     rows.push({
	    	   	                tScName:objs[i].name,
	    	   					ck:objs[i].id,
	    	   					tScFileName:objs[i].filename,
					        	tScStime:objs[i].stime
       		    	      });
       		    	}else if(type==10){
       		    		
	       		    	 rows.push({
	 	   	                tScName:objs[i].name,
	 	   					ck:objs[i].id,
	 	   					tScFileName:objs[i].filename,
	 	   				    tScTxtContent:objs[i].txt_content
			    	      });
	       		    	 
       		    	}else if(type==0){
       		    		
       		    		rows.push({
	 	   	                uName:objs[i].name,
	 	   					ck:objs[i].id,
	 	   					uAccount:objs[i].account
	 	   				});
       		    	}else if(type==11){
    		    		
    		    		   rows.push({
    		    		     tClientName:objs[i].name,
	 	   					 ck:objs[i].id,
	 	   				     tClientMark:objs[i].mark
	 	   				    
	 	   				});
    		         }    
       		     }
       		 }	
           }else if(infoType==2){

        	  
           	       for(i=0;i<data.length;i++)
				   {
	           	    	if(type==4||type==1){
				    	    rows.push({
		   	   	                tScName:data[i].name,
		   	   					ck:data[i].id,
		   	   					tScFileName:data[i].filename
	   	   					
	   	   				    });
	           	    	 }else if(type==3||type==2){
	           	    		 rows.push({
		           	    		  tScName:data[i].name,
			   	   				  ck:data[i].id,
			   	   				  tScFileName:data[i].filename,
		           	    		  tScStime:data[i].stime
	           	    		 });
	           	    	 }else if(type==10){
	           	    		 rows.push({
		           	    		  tScName:data[i].name,
			   	   				  ck:data[i].id,
			   	   				  tScFileName:data[i].filename,
			   	   			      tScTxtContent:data[i].txt_content
	           	    		 });
	           	    		 
	           	    	 }else if(type==0){
	        		    		
	        		    		rows.push({
	 	 	   	                uName:data[i].name,
	 	 	   					ck:data[i].id,
	 	 	   					uAccount:data[i].account
	 	 	   				});
	        		     }else if(type==11){
	        		    		
	        		    		rows.push({
	        		    		tClientName:data[i].name,
	 	 	   					ck:data[i].id,
	 	 	   				    tClientMark:data[i].mark
	 	 	   				    
	 	 	   				});
	        		     }    
				    }
        	  

           }
   		
	   return rows;
	}
 	
 	
 	//根据id获取容器里面的element
 	function toIdGetElement(eId){
 	   var tDivAll=get_topfd_all();
  	   var tDivs=""; 
  	   var tDiv;
  	   var chirdren;	 
  	   for(var i = 0;i<tDivAll.length;i++)
  	   {
  			  
  			  tDiv=tDivAll[i];

  			  //获取当前元素
  			  if(eId==tDiv.id){
  				  chirdren=tDiv;
  			  }
  			  
  			  

  		}
 		return chirdren;
 		
 	}
 	
 	//获取容器对象
 	function get_container_object(){
 		var topfd=document.getElementById("ie_item_make").contentWindow.document.getElementById("topfd");
 		return topfd;
 	}
 	
 	
 	
 	
 	/*制作新节目*/
 	function openAddNewItem(){
 		window.returnValue="";
 		var count=3000; 
 	 	var originalArray=new Array;//原数组 
 	 	//给原数组originalArray赋值 
 	 	for (var i=0;i<count;i++){ 
 	 	originalArray[i]=i+1; 
 	 	} 
 	 	originalArray.sort(function(){ return 0.5 - Math.random(); }); 
 	  
 	 	layer.open({
 				type: 2,
 		        area: ['620px', '400px'],
 		        offset: '20px',
 		        title:false,
 		        fix: false, //不固定
 		        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
 		        content: 'itemtoadd.vs?itemType=1',
 		        scrollbar: false,
 		        end: function(){ 
 		    	   
 				   if(window.returnValue==undefined||window.returnValue==""){
 					   
 					   window.returnValue=""; 
 	                  
 				   }else{
 					   
 					   var rv= window.returnValue;
 					   var rv1=rv.split('@')[0];
 					   var rv2=rv.split('@')[1];
 					   var  rv3=rv.split('@')[2];
 					   var itemViceType=rv.split('@')[3];
 					   var screenType=rv.split('@')[4];
 					   var showurl="toNewScene.vs?item.name="+rv1+"&item.fblid="+rv2+"&item.lable="+rv3+"&token="+originalArray[0]+"&itemViceType="+itemViceType+"&screenType="+screenType;
 					   showurl=encodeURI(showurl); 
 			           showurl=encodeURI(showurl);
 					   //以下是调用上面的函数
 				       var mb = myBrowser();
 				       if ("Chrome" == mb) {
 				    	  
 					    	window.parent.location.href=showurl;
 					    	
 					   }else{
 						   
 					    	window.open(showurl,"_parent");
 					    	
 					   }
 				   }               
 				}
 			});
 		
 	}
 	
 	
 	
 	
 	/*制作新互动节目*/
 	function openAddNewInteractItem(){
 		 window.returnValue="";
 		 var count=3000; 
 		 	var originalArray=new Array;//原数组 
 		 	//给原数组originalArray赋值 
 		 	for (var i=0;i<count;i++){ 
 		 	originalArray[i]=i+1; 
 		 	} 
 		 	originalArray.sort(function(){ return 0.5 - Math.random(); }); 
 		 	
 		 	
 		 layer.open({
 				type: 2,
 		        area: ['620px', '400px'],
 		        offset: '20px',
 		        title:false,
 		        fix: false, //不固定
 		        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
 		        content: 'itemtoadd.vs',
 		        scrollbar: false,
 		        end: function(){ 
 		    	 
 				   if(window.returnValue==undefined||window.returnValue==""){
 					   window.returnValue=""; 
 	                  
 				   }else{
 					   var rv= window.returnValue;
 					   var rv1=rv.split('@')[0];
 					   var rv2=rv.split('@')[1];
 					   var  rv3=rv.split('@')[2];
 					   var itemViceType=rv.split('@')[3];
					   var screenType=rv.split('@')[4];
					   var showurl="toInteractNewScene.vs?interactitem.name="+rv1+"&interactitem.fblid="+rv2+"&interactitem.lable="+rv3+"&token="+originalArray[0]+"&itemViceType="+itemViceType+"&screenType="+screenType;
 					   showurl=encodeURI(showurl); 
 			           showurl=encodeURI(showurl);
 					   //以下是调用上面的函数
 				       var mb = myBrowser();
 				      
 				       if ("Chrome" == mb) {
 					    	window.parent.location.href=showurl;
 					   }else{
 					    	window.open(showurl,"_parent");
 					   }  
 				   }               
 				}
 			});
 		
 	}
 	
 	
 	
 	/***  
 	 * 获得本周起止时间  
 	 */  
 	  function getCurrentWeek() {  
 	     //起止日期数组    
 	     var startStop = new Array();  
 	     //获取当前时间    
 	     var currentDate =new Date();  
 	     //返回date是一周中的某一天    
 	     var week = currentDate.getDay();  
 	     //返回date是一个月中的某一天    
 	     var month = currentDate.getDate();  

 	     //一天的毫秒数    
 	     var millisecond = 1000 * 60 * 60 * 24;  
 	     //减去的天数    
 	     var minusDay = week != 0 ? week - 1 : 6;  
 	     //alert(minusDay);    
 	     //本周 周一    
 	     var monday = new Date(currentDate.getTime() - (minusDay * millisecond));  
 	     //本周 周日    
 	     var sunday = new Date(monday.getTime() + (6 * millisecond));  
 	     //添加本周时间    
 	     startStop.push(monday); //本周起始时间    
 	     //添加本周最后一天时间    
 	     startStop.push(sunday); //本周终止时间    
 	     //返回    
 	     return startStop;  
 	 };  

 	
 	//切换计划
 	function change_jh(jhtype){
 		if(jhtype==3){
 			
 			document.form1.action="reusltLastAccurate.vs";
 	    }else{

 	    	document.form1.action="jhlist.vs?jhtype="+jhtype;
 	    }
 		
 		document.form1.target = "_self";
 	    document.form1.submit();
 	 }
 	
 	
 	//设置消息位置,position值 1:上部  2：中部 3：底部
 	function setMessagePosition(position){
 	    var fontSize=$("#fontsize").val()/3;
 	    var divMessageHeight=fontSize+6;
 	    var displayAreaWidth=parseInt($("#display-area").css("width"))-6;
 	    
 	    $("#marquee").css("height",divMessageHeight).css("lineheight",divMessageHeight);
 	    if(position==1){//顶部
 	        $("#display-area").css("padding-top","0px");
 	       $("#marquee").css("width",(displayAreaWidth)+"px").css("margin-left","0px");
 	    }else if(position==0.5){//中部
 	        var divContentHeight=$("#display-area").innerHeight();
 	        //var divMessageHeight= $("#marquee").outerHeight(true); //单行消息的高度
 	        var paddingTop=(divContentHeight-divMessageHeight)/2;
 	        $("#display-area").css("padding-top",paddingTop+"px");
 	       $("#marquee").css("width",(displayAreaWidth)+"px").css("margin-left","0px");
 	    }else if(position==0){//底部
 	        var divContentHeight=$("#display-area").innerHeight();
 	        //var divMessageHeight= $("#marquee").outerHeight(true); //单行消息的高度
 	        var paddingTop=(divContentHeight-divMessageHeight);
 	        $("#display-area").css("padding-top",paddingTop+"px");
 	        $("#marquee").css("width",(displayAreaWidth)+"px").css("margin-left","0px");
 	    }else if(position==-1){//左边
 	        var divContentHeight=$("#display-area").innerHeight();
 	        //var divMessageHeight= $("#marquee").outerHeight(true); //单行消息的高度
 	        var paddingTop=(divContentHeight-divMessageHeight);
 	       $("#display-area").css("padding-top","0px");
 	       $("#display-area").css("padding-left","0px");
 	       $("#marquee").css("height",divContentHeight+"px").css("lineheight",divContentHeight+"px").css("width","20px").css("margin-left","0px");
 	    }else if(position==-2){//右边
 	    	
 	        var divContentHeight=$("#display-area").innerHeight();
 	        //var divMessageHeight= $("#marquee").outerHeight(true); //单行消息的高度
 	        var paddingTop=(divContentHeight-divMessageHeight);
 	       $("#display-area").css("padding-top","0px");
 	       $("#display-area").css("padding-left","0px");
 	     
 	       var displayArea=parseInt($("#display-area").css("width"));
 	       $("#marquee").css("height",divContentHeight+"px").css("lineheight",divContentHeight+"px").css("width","20px").css("margin-left",(displayArea-24)+"px");
 	    }else{
 	        console.log("set message-position error!!!");
 	    }
 	}
 	
 	
 	//日志查看 发布日志
 	function open_logsend(){
 		document.form1.target = "_self";
 		document.form1.action = "countlogsendlist.vs?id=1";
 		document.form1.submit();
 	}
 	
 	//日志查看 操作日志
 	function open_log(){
 		document.form1.target = "_self";
 		document.form1.action = "countloglist.vs?id=1";
 		document.form1.submit();
 	}
 	
 	
	//日志查看 终端日志
 	function open_logclient(){
 		document.form1.target = "_self";
 		document.form1.action = "countlogclientlist.vs?id=1";
 		document.form1.submit();
 	}
 	
 	
 	//下载队列列表
 	function download_list(){
 		window.location.href="reusltDownloadList.vs";
 	}
 	
 	
 	//日志查看 登陆退出记录
 	function open_log_user_login(){
 		document.form1.target = "_self";
 		document.form1.action = "countlogloginlist.vs?id=1";
 		document.form1.submit();
 	}
 	
 	
 	//预览节目
 	function open_see_item_win_show(filename){
 		layer.open({
 	 		 type: 2,
 	         area: ['1010px', '505px'],
 	         offset: '20px',
 	         title:false,
 	         fix: false, //不固定
 	         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
 	         content: 'seeItemWinShow.vs?filename='+filename,
 	         scrollbar: false,
 	         end: function(){ 	  
 			      
 	 		 }
 	 	});   
 		
 	}
 	 
 	//添加天气
 	function  fastAddParameterTq(){

     	//弹出
     	layer.open({
      		type: 2,
              area: ['500px', '300px'],
              offset: '10px',
              title:false,
              fix: false, //不固定
              shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
              content: 'system_cs_tq_add.jsp',
              scrollbar: false,
              end: function(data){

                     

     				 $.ajax({
     						type:'post',
     						url:'ajaxtqall.vs',
     						dataType:'json',
     						async:true,
     						cache:true,
     						success:function(data){

     					           document.getElementById("tcity").options.length=0;
     							   var obj=document.getElementById('tcity'); 
     		
     					    	   //清空   
     					    	   
     						       for(i=0;i<data.length;i++)
     							   {
     			                         
     						    	   obj.options.add(new Option(data[i].city,data[i].city)); //这个兼容IE与firefox 
     						    	 
     							
     							    }
     					      
     						}
     					});

     			
             
     		     
     	       
     		      
     		   
      		 }
      	});          
     	
     }
 	
 	
 	
    //跳转弹出副屏节目
    function open_sub_screen(itemType){

        //var showurl="toNewScene.vs?item.name="+rv1+"&item.fblid="+rv2+"&token="+originalArray[0]+"&itemViceType="+itemViceType+"&screenType="+screenType;
	    layer.open({
		      
			  type: 2,
	          area: ['1000px', 600+'px'],
	          offset: '20px',
	          title:false,
	          fix:false, //不固定
	          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	          content: "toNewSubScene.vs?item.name=1&screenType="+$("#screenType").val()+"&filename="+$("#mfile").val()+"&itemType="+itemType+"&itemViceType=1",
	          scrollbar: false,
	          end: function(){ 
		        
			  }
		});
		
    }
    
    //页面跳转
    function  index_jump(jumpUrl){
    	window.location.href=jumpUrl;
    }
 	
 	
