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
<script type="text/javascript" src="js/constant.js"></script>
<script src="js/jscolor.js"></script> 


<script   src="zui-1.5.0-dist/dist/lib/sortable/zui.sortable.js"></script>

<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/datagrid-dnd.js"></script>

<script src="js/fresh.js" type="text/javascript" language="javascript"></script>

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
	
	input[type="radio"] {
    line-height: normal;
    margin: 0px 0px 0px;
    margin-top: 0px;
    margin-right: 0px;
    margin-bottom: 0px;
    margin-left: 0px;
   }
</style>



<script>

      

      //初始化
      function onload_data(){

    	    //素材列表
    	    var  initSucaiListJson="<ww:property value='initSucaiListJson' />";
    	    
    	    if(initSucaiListJson!=""){
    	    	
    	    	
    	    	initSucaiListJson=initSucaiListJson.replace(/&quot;/g,"\"").replace(/"{/g,"{").replace(/}"/g,"}");
    	    	
                //转换成touch对象组
    		    var objs = eval( "(" + initSucaiListJson + ")" );//转换后的JSON对象
    		  
    		    var  obj; 
    		   
    		    for(var i=0;i<objs.length;i++){
    		         
    		    	//创建tr
    				$('#dg').datagrid('appendRow',{
    					
		    				tdsName:objs[i].name,
				        	ck:objs[i].id,
				        	tdsContent:JSON.stringify(objs[i].content)
				        	
    				});

        		}

    	    } 


    	  	 //显示内容
             var divHtml=window.parent.$("#layerBigDataParameter").val();
             $("#yxlist").html(divHtml); 
    	   
             if(divHtml!=""){
            	 
            	//转换成touch对象组
     		    var objs = eval( "(" + divHtml + ")" );//转换后的JSON对象
     		    
     			//获取边框大小
     			$("#borderState").val(objs.borderState); 
     			//获取边框颜色
     			$("#borderColor").val(objs.borderColor); 


     			//切换时间
     			$("#refresh").val(objs.refresh); 
     			//滚动方式
     			$("#scrollType").val(objs.scrollType); 

     			
     		   	  
     		    var objsTitle=objs.title;
     			 
     		    if(objsTitle.length>1){
     		    	
    				//tableFontColor  字体颜色
    				$("#tableFontColor").val(objsTitle[0].fontColor);
    				
    				//tableFontSize   字体大小   
    				$("#tableFontSize").val(objsTitle[0].fontSize);
    				
    				//tableBgColor   背景颜色
    				$("#tableBgColor").val(objsTitle[0].bgColor);
    				
     		    } 
     		    
             }
            
            //初始化鼠标悬浮事件
    	    //onMousePreView();
    	   
    	   
    	      
            
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


     
   //获取播放列表数据
   function adPlayData(){

	   var rows=$("#dgPlay").datagrid("getRows");


	   if(rows.length==0){
		     var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	 		 window.parent.returnValue="unbj"; 
	         window.parent.layer.close(index);
	   }

	   
	   //构造集合对象
  	   var programComplexMediaManager=new Object();

	   var mMediaList= new Array();
       //图片播放总时长
	   var mPlayTimes=0;

	   //判断素材类型
	   for(var i=0;i<rows.length;i++)
 	   {

		   //programComplexMediaManager.officeFileName=rows[i].tScFileName;

		   $("#selsource").val(rows[i].tdsContent);
		   layer.load();
		   document.form1.action="toscenedsaction.vs";
		   document.form1.submit();
		  
 	   }
	
 	   
   }

  
   //添加到播放列表
   function addPlayMuti(){
        //获取素材列表已选
 	  var selRows = $('#dg').datagrid('getChecked');
 	  $('#dg').datagrid('clearSelections');
 	  
 	  for(var i=0;i<selRows.length;i++){
 		  var font =document.getElementById("yxlist");
      	  font.focus();
      	  var txtContent=selRows[i].tdsContent;
          //转换成touch对象组
	      //var objs = json2str(txtContent);//转换后的JSON对象
      	  document.getElementById("yxlist").innerHTML=txtContent;
       }
   } 

   function json2str(o) { 
	   var arr = []; 
	   var fmt = function(s) { 
	   if (typeof s == 'object' && s != null) return json2str(s); 
	   return /^(string|number)$/.test(typeof s) ? "\"" + s + "\"" : s; 
	   } 
	   for (var i in o) arr.push("\"" + i + "\":" + fmt(o[i])); 
	   return "{" + arr.join(',') + "}"; 
   } 

 //清空播放列表数据
   function clearDgPlayList(){
 	 
       var sucais = $('#dgPlay').datagrid('getRows');
       if (sucais) {
            for (var i = sucais.length - 1; i >= 0; i--) {
                var index = $('#dgPlay').datagrid('getRowIndex', sucais[i]);
                $('#dgPlay').datagrid('deleteRow', index);
            }
       }

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
   	  
   	  
   	  
   	  //获取表格背景颜色
	  var tableBgColor=$("#tableBgColor").val();  
	  //获取表格字体颜色
	  var tableFontColor=$("#tableFontColor").val();  
	  //获取字体大小
	  var tableFontSize=$("#tableFontSize").val();  
	  
	  //获取边框大小
	  var borderState=$("#borderState").val(); 
	  
	  
	  //获取边框颜色
	  var borderColor=$("#borderColor").val(); 

	  //获取滚动方式
	  var scrollType=$("#scrollType").val();  
	  //获取切换时间
	  var refresh=$("#refresh").val();  
   	  
	  
	  if(borderState==0){
		  borderColor=0;
	  }
   	  

   	 //文本内容
   	 //alert(font.innerHTML)
   	 var fontContent=font.innerHTML; 
   	 
   	 
 	//转换成touch对象组
	 var objs = eval( "(" + fontContent + ")" );//转换后的JSON对象
	 objs.borderState=borderState;
	 objs.borderColor=borderColor;
	 objs.refresh=refresh;
	 objs.scrollType=scrollType;
	 var objsTitle=objs.title;
	 
	 for(var i=0;i<objsTitle.length;i++){
		 
		 objsTitle[i].bgColor=tableBgColor;
		 objsTitle[i].fontColor=tableFontColor;
		 objsTitle[i].fontSize=tableFontSize;
		 
		 
	 }
	 objs.title=objsTitle
	
	    
	 objs.mLeft=xy_x;
	 objs.mTop=xy_y;
	 objs.mWidth=width;
	 objs.mHeight=height;
   	 
   	 var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
   	 
   	 window.parent.returnValue=""; 
      
   	 //X@Y@宽@高@文本内容
     window.parent.returnValue=JSON.stringify(objs); 
     window.parent.layer.close(index);
        
        
    	 //document.form1.action="adimageto.vs";
    	 //document.form1.submit();

     
     
}


   
    	 
</script>
</head>
<body onload="onload_data()">
    


    <form method="post" name="form1" action="">
       <div class="panel panel-primary" style="margin: 3px 3px;">
           <div class="panel-heading">
                <ww:property value="#session.local.a00997"/> <!-- 数据源 -->
           </div>
          <div class="container clearfix" style="margin: 10px 10px;">
          <div class="main-wrap" style="width:850px;">
		      <div class="result-wrap">
		          <div class="result-content">
		            <table class="insert-tab" width="100%" style="text-align: center;">
			           
			          
			           
			           <tr style="height: 280px;">
			            <td  colspan="3"  >
			            
			                   <div id="targetDivContent" style="display: none;">
			                   </div>
			                   
			                   <div id="targetDivContentImg" style="padding-top: 10px;">
			                        
			                        <!--数据接口列表 -->
						            <div style="float: left;margin: 0px 0px 10px 0px;padding: 0px 0px;" >
						                 <table id="dg" class="easyui-datagrid"  title="<ww:property value='#session.local.a00666'/>" style="width:350px;height:390px;margin: 0px;padding: 0px;"
											data-options="
											
											    rownumbers:true,
												singleSelect: true,
												toolbar: '#tb0',
												method: 'get',
												nowrap:true	,
											    selectOnCheck:true,
												checkOnSelect:true
												
												
											">
							                <thead>
								                    <tr>
								                        <th data-options="field:'ck',checkbox:true"></th>
														<th data-options="field:'tdsName',width:280"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
														<th data-options="field:'tdsContent',hidden:true"></th>
									        	    </tr>
							                 </thead>
					                      </table>	           
							      
							      
							              <div id="tb0" style="height:auto;line-height: 0px;">
												
												<div>
													<input id="ser" class="easyui-searchbox" data-options="prompt:'<ww:property value='#session.local.a00133'  />',searcher:doSearch" style="width:100px"></input>
	
													<script>
													    //搜索
														function doSearch(value){
															
															  $.ajax({
													 				type:'post',
													 				url:'ajaxtodatasource.vs',
													 				data:"sel=1&ser="+value,
													 				dataType:'json',
													 				async:true,
													 				cache:true,
													 				success:function(data){

																       //清空列表
												    	    	       clearDgList();
												    	    	       //隐藏鼠标悬浮
													    	    	   $("#preview").hide();  
													 			       for(i=0;i<data.length;i++)
													 				   {
													 			    	    var objs = eval( "(" + data[i].content + ")" );//转换后的JSON对象
													 			    	    //创建tr
													 	    				$('#dg').datagrid('appendRow',{
													 			    				tdsName:data[i].name,
													 					        	ck:data[i].id,
													 					        	tdsContent:objs
													 	    				});
													 				
													 				    }
													 			        //onMousePreView();
													 				}
															  });
															
														}

														var editIndex = undefined;
														
														function onClickCell(index, field){
															
															
																$('#dg').datagrid('selectRow', index)
																		.datagrid('editCell', {index:index,field:field});
																editIndex = index;
															
															
														}

														
														
													</script>
													
													
													
												</div>
										  </div>
	
								   
						           </div>
						           
						
	
			                 </div>
			                 
			                 <div class="part2_2 part2_2_3" style="float: left;margin-right: 0px; margin-top: 80px;width: 50px;">
											<a title="<ww:property value='#session.local.a00270' />" href="javascript:addPlayMuti();"  style="width: 40px;height:30px;">
											  <img src="image/item/sc_right.png" alt="" height="30px" width="40px" />
											</a><!--添加到已选列表  -->
							</div>
			             
			                
			                <div id="log" title="<ww:property value="#session.local.b00013"  />"  class="easyui-panel"  style="float:left;margin: 0px 0px; padding: 0px 0px;height: 390px;width: 420px;" >
						      <div style="width:400px;height: 140px;font-size: 18px;border: 1px solid #d5d5d5;overflow: auto;margin: 5px auto;margin-top: 10px;" contentEditable='true'   id="yxlist">
			                  </div>
			                  <ul class="ps_2" style="margin-bottom: 0px;">
			                     
			                   
			                  
			                     <li>
			                           <ww:property  value="#session.local.a00325"/>:
			                           <!-- 字体颜色: -->
							           <select   id="tableFontColor" style="width: 80px;">
							                   <option value="-16777216"><ww:property value='#session.local.a00337' /></option><!-- 黑色 -->
											   <option value="-65536"><ww:property value='#session.local.a00338' /></option>   <!-- 红色 -->
											   <option value="-16776961"><ww:property value='#session.local.a00339' /></option><!-- 蓝色 -->
											   <option value="-256"><ww:property value='#session.local.a00342' /></option>     <!-- 黄色 -->
											   <option value="-16711936"><ww:property value='#session.local.a00341' /></option><!-- 绿色 -->
											   <option value="-2"><ww:property value='#session.local.a00340' /></option>       <!-- 白色 -->  
											   <option value="-7829368"><ww:property value='#session.local.a00343' /></option> <!-- 灰色 -->
							           </select>
			                     
			                     </li>
			                     
			                     <li>
			                     
			                    <ww:property  value="#session.local.a00324"/>:
			                    <!-- 字体大小: -->
	                            <select  id="tableFontSize" style="width: 80px;">
						                  <option value="-1"> <ww:property  value="#session.local.b00226"/>  </option> <!-- 自适应 -->
						                  <option value="12"> 12  </option>
						                  <option value="13"> 13  </option>
						                  <option value="14"> 14  </option>
						                  <option value="15"> 15  </option>
						                  <option value="16"> 16  </option>
						                  <option value="17"> 17  </option>
						                  <option value="18"> 18  </option>
						                  <option value="19"> 19  </option>
						                  <option value="20"> 20  </option>
						                  <option value="21"> 21  </option>
						                  <option value="22"> 22  </option>
						                  <option value="23"> 23  </option>
						                  <option value="24"> 24  </option>
						                  <option value="25"> 25  </option>
						                  <option value="26"> 26  </option>
						                  <option value="27"> 27  </option>
						                  <option value="28"> 28  </option>
						                  <option value="29"> 29  </option>
						                  <option value="30"> 30  </option>
						                  <option value="31"> 31  </option>
						                  <option value="32"> 32  </option>
						                  <option value="33"> 33  </option>
						                  <option value="34"> 34  </option>
						                  <option value="35"> 35  </option>
						                  <option value="36"> 36  </option>
						                  <option value="37"> 37  </option>
						                  <option value="38"> 38  </option>
						                  <option value="39"> 39  </option>
						                  <option value="40"> 40  </option>
						                  <option value="45"> 45  </option>
					                      <option value="50"> 50  </option>
					                      <option value="55"> 55  </option>
					                      <option value="60"> 60  </option>
						                  <option value="65"> 65  </option>
						                  <option value="70"> 70  </option>
						                  <option value="75"> 75  </option>
						                  <option value="80"> 80  </option>
						                  <option value="85"> 85  </option>
						                  <option value="90"> 90  </option>
						                  <option value="95"> 95  </option>
						                  <option value="100"> 100  </option>
	                     
	                           </select>
			                     
			                     </li>
			                     
			                    <li>
		                                                                       
		                            <ww:property  value="#session.local.b00225"/>:
		                            <!--   表格背景: -->
							        <select id="tableBgColor" style="width: 80px;"> 
						                <option  value="0"> <ww:property value="#session.local.a00366"/>   </option>    <!-- 透明 --> 
						                <option value="-16777216"><ww:property value='#session.local.a00337' /></option><!-- 黑色 -->
									    <option value="-65536"><ww:property value='#session.local.a00338' /></option>   <!-- 红色 -->
									    <option value="-16776961"><ww:property value='#session.local.a00339' /></option><!-- 蓝色 -->
									    <option value="-256"><ww:property value='#session.local.a00342' /></option>     <!-- 黄色 -->
									    <option value="-16711936"><ww:property value='#session.local.a00341' /></option><!-- 绿色 -->
									    <option value="-2"><ww:property value='#session.local.a00340' /></option>       <!-- 白色 -->  
									    <option value="-7829368"><ww:property value='#session.local.a00343' /></option> <!-- 灰色 -->
							        </select>
			                     </li>
			                     
			                     <li>
			                     
			                    <ww:property  value="#session.local.b00228"/>:
			                    <!-- 边框大小: -->
	                            <select  id="borderState" style="width: 80px;">
						             <option value="0"> 0  </option> 
						             <option value="1"> 1  </option>
						             <option value="2"> 2  </option>
						             <option value="3"> 3  </option>
						             <option value="4"> 4  </option>
						             <option value="5"> 5  </option>
						             <option value="6"> 6  </option>
						             <option value="7"> 7  </option>
						             <option value="8"> 8  </option>
						             <option value="9"> 9  </option>
						             <option value="10"> 10  </option>
						             <option value="11"> 11  </option>
						             <option value="12"> 12  </option>
						             <option value="13"> 13  </option>
						             <option value="14"> 14  </option>
						             <option value="15"> 15  </option>
						              <option value="16"> 16  </option>
						               <option value="17"> 17  </option>
						                <option value="18"> 18  </option>
						                  <option value="19"> 19  </option>
						                  <option value="20"> 20  </option>
						                  <option value="21"> 21  </option>
						                  <option value="22"> 22  </option>
						                  <option value="23"> 23  </option>
						                  <option value="24"> 24  </option>
						                  <option value="25"> 25  </option>
						                  <option value="26"> 26  </option>
						                  <option value="27"> 27  </option>
						                  <option value="28"> 28  </option>
						                  <option value="29"> 29  </option>
						                  <option value="30"> 30  </option>
						                  <option value="31"> 31  </option>
						                  <option value="32"> 32  </option>
						                  <option value="33"> 33  </option>
						                  <option value="34"> 34  </option>
						                  <option value="35"> 35  </option>
						                  <option value="36"> 36  </option>
						                  <option value="37"> 37  </option>
						                  <option value="38"> 38  </option>
						                  <option value="39"> 39  </option>
						                  <option value="40"> 40  </option>
						                  <option value="45"> 45  </option>
					                      <option value="50"> 50  </option>
					                      <option value="55"> 55  </option>
					                      <option value="60"> 60  </option>
						                  <option value="65"> 65  </option>
						                  <option value="70"> 70  </option>
						                  <option value="75"> 75  </option>
						                  <option value="80"> 80  </option>
						                  <option value="85"> 85  </option>
						                  <option value="90"> 90  </option>
						                  <option value="95"> 95  </option>
						                  <option value="100"> 100  </option>
	                     
	                           </select>
			                     
			                     </li>
			                     
			                     
			                     
			                       <li>
			                           <ww:property  value="#session.local.b00227"/>:
			                           <!-- 字体颜色: -->
							           <select   id="borderColor" style="width: 80px;">
							                   <option value="-16777216"><ww:property value='#session.local.a00337' /></option><!-- 黑色 -->
											   <option value="-65536"><ww:property value='#session.local.a00338' /></option>   <!-- 红色 -->
											   <option value="-16776961"><ww:property value='#session.local.a00339' /></option><!-- 蓝色 -->
											   <option value="-256"><ww:property value='#session.local.a00342' /></option>     <!-- 黄色 -->
											   <option value="-16711936"><ww:property value='#session.local.a00341' /></option><!-- 绿色 -->
											   <option value="-2"><ww:property value='#session.local.a00340' /></option>       <!-- 白色 -->  
											   <option value="-7829368"><ww:property value='#session.local.a00343' /></option> <!-- 灰色 -->
							           </select>
			                     
			                     </li>
			                     
			                     
			                     
			                      <li>
			                           <ww:property  value="#session.local.b00378"/>:
			                           <!-- 滚动样式: -->
							           <select   id="scrollType" style="width: 80px;">
							                   <option value="1"><ww:property value='#session.local.b00379' /></option><!-- 翻页 -->
											   <option value="2"><ww:property value='#session.local.b00380' /></option>   <!-- 像上滚动 -->
											  
							           </select>
			                     
			                     </li>
			                     
			                     
			                     
			                   <li>
			                     
			                    <ww:property  value="#session.local.a00264"/>:
			                    <!-- 切换时间: -->
	                            <select  id="refresh" style="width: 80px;">
						                  <option value="1"> 1  </option>
						                  <option value="2"> 2  </option>
						                  <option value="3"> 3  </option>
						                  <option value="4"> 4  </option>
						                  <option value="5"> 5  </option>
						                  <option value="6"> 6  </option>
						                  <option value="7"> 7  </option>
						                  <option value="8"> 8  </option>
						                  <option value="9"> 9  </option>
						                  <option value="10"> 10  </option>
						                  <option value="11"> 11  </option>
						                  <option value="12"> 12  </option>
						                  <option value="13"> 13  </option>
						                  <option value="14"> 14  </option>
						                  <option value="15"> 15  </option>
						                  <option value="16"> 16  </option>
						                  <option value="17"> 17  </option>
						                  <option value="18"> 18  </option>
						                  <option value="19"> 19  </option>
						                  <option value="20"> 20  </option>
						                  <option value="21"> 21  </option>
						                  <option value="22"> 22  </option>
						                  <option value="23"> 23  </option>
						                  <option value="24"> 24  </option>
						                  <option value="25"> 25  </option>
						                  <option value="26"> 26  </option>
						                  <option value="27"> 27  </option>
						                  <option value="28"> 28  </option>
						                  <option value="29"> 29  </option>
						                  <option value="30"> 30  </option>
						                  <option value="31"> 31  </option>
						                  <option value="32"> 32  </option>
						                  <option value="33"> 33  </option>
						                  <option value="34"> 34  </option>
						                  <option value="35"> 35  </option>
						                  <option value="36"> 36  </option>
						                  <option value="37"> 37  </option>
						                  <option value="38"> 38  </option>
						                  <option value="39"> 39  </option>
						                  <option value="40"> 40  </option>
						                  <option value="45"> 45  </option>
					                      <option value="50"> 50  </option>
					                      <option value="55"> 55  </option>
					                      <option value="60"> 60  </option>
						                  <option value="65"> 65  </option>
						                  <option value="70"> 70  </option>
						                  <option value="75"> 75  </option>
						                  <option value="80"> 80  </option>
						                  <option value="85"> 85  </option>
						                  <option value="90"> 90  </option>
						                  <option value="95"> 95  </option>
						                  <option value="100"> 100  </option>
	                     
	                           </select>
			                     
			                     </li>
			                     
			                  
			                  </ul>
			                        
						    </div>
			                 
			                 
			            </td>
			           </tr>
			            <tr>
						    <td colspan="3" style="height: 45px;padding-left: 340px;"    >
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

												function onClickCell(index, field){
													$('#dg').datagrid('selectRow', index);
											        editIndex = index;
													
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
        
        <!-- 选中数据源 -->
        <input type="hidden" name="selsource"  id="selsource" value=""/>
		            
		<!--缩放-->
        <input type="hidden" id="sf" value="<ww:property value="sf"/>" name="sf" />           
             
        <!-- 预览显示 -->           
        <div   id="preview"  style="position: absolute;display:none;">
           <img  id="show_img" src=""  height="100px"  width="150px" />   
        </div>
                                    
</form>
<script>
//$('#sortableList').sortable();
</script>
</body>
</html>
