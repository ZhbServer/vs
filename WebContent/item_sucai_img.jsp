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
   
   .insert-tab tr{line-height:0px;}

   .insert-tab td{text-align:left;padding-left:0px;}


</style>



<script>


      //初始化
      function onload_data(){

    	    var openIntro = <%=request.getParameter("openIntro")%>;
    	    if(openIntro == '1'){
	  			openIntro = null;
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
	      				element: '#step3',
	      				intro: "<span style='color:blue;'><ww:property value='#session.local.a00865' /></span> <ww:property value='#session.local.a00866' />",
	      				position: "right"
	      			},
	      			{
						element: '#step4',
						intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'><ww:property value='#session.local.a00867' /></span><ww:property value='#session.local.a00868' />"
	          		},
	          		{
						element: '#step5',
						intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00869' /></span><ww:property value='#session.local.a00870' />",
						position: "top"
	              	}
	  			  ]  
	  			});
	
	  			intro.start().oncomplete(function() {  
	    			intro.exit();  
	    	    });
	  			
	  			intro.onexit(function() {
	  				layer.msg("<ww:property value='#session.local.a00864' />");
	  			});
	  		}else if(openIntro == '2'){
	  			openIntro = null;
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
	      				element: '#step3',
	      				intro: "<span style='color:blue;'><ww:property value='#session.local.a00865' /></span> <ww:property value='#session.local.a00871' /><span style='color:blue;'>xyg.jpg</span>",
	      				position: "right"
	      			},
	      			{
						element: '#step4',
						intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00867' /></span><ww:property value='#session.local.a00872' />"
	          		},
	          		{
						element: '#step5',
						intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00869' /></span><ww:property value='#session.local.a00873' />",
						position: "top"
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

    	    //素材列表
    	    var  initSucaiListJson="<ww:property value='initSucaiListJson' />";
          
            if(initSucaiListJson!=""){
            	
            	$('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(4,1,initSucaiListJson,null));
            	 	    	
    	    } 


    	     //播放列表
    	    // var  yxSucaiListJson="<ww:property value='yxSucaiListJson' />";
    	    
    	    //显示内容
	        var  layerBigDataParameter=window.parent.$("#layerBigDataParameter").val();

    	    if(layerBigDataParameter!=""){
    	    	
    	    	  //转换成touch对象组
    		    var layerBigDataParameterObj = eval( "(" + layerBigDataParameter + ")" );//转换后的JSON对象

    		    if(layerBigDataParameterObj.blflag==1){

    		    	$("#blflag").attr("checked",true);
    		    	
        		}
    	       
    	        var yxSucaiListJson = JSON.stringify(layerBigDataParameterObj.mMediaList);     
    	      
        	    if(yxSucaiListJson!=""){
        	    	
        	    	yxSucaiListJson=yxSucaiListJson.replace(/&quot;/g,"\"");
        	    	//转换成touch对象组
        		    var objs = eval( "(" + yxSucaiListJson + ")" );//转换后的JSON对象
        		  
        		    var  obj; 

        		    for(var i=0;i<objs.length;i++){
        		    	//创建tr
        				$('#dgPlay').datagrid('appendRow',{
        					
    		    				tScName:objs[i].sname,
    		    				tScTime:objs[i].timeoutMillis,
    		    				tScTx:objs[i].inAnim,
    				        	ck:objs[i].id,
    				        	tScFileName:objs[i].path

        				});

            		}

            	}   
    	    }
    	   
	      
    	    
            //初始化鼠标悬浮事件
    	    onMousePreView();
    	   
    	   
    	      
            
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
      	        title:false,
      	        scrollbar: false,
      	        end: function(){ 
      	    	   /*添加素材操作日志*/
      	    	   getpartnodiv("addlogsucai.vs?sucaiType="+$("#sucaiType").val());
      	    	   
      	    	   /*刷新页面*/
      	    	   //clearDgList();
      	    	   
      	    	   $.ajax({
		 				type:'post',
		 				url:'ajaxToItemSeeSucaiAction.vs',
		 				data:"id=1&checkAjaxState=1"+"&gssi.sucaigroupid="+myOptValue+"&sucai.type="+$("#sucaiType").val(),
		 				dataType:'json',
		 				async:true,
		 				cache:true,
		 				success:function(data){

                            $('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(4,2,null,data));  
                            onMousePreView();
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
    		  
    		  //创建tr
	          $('#dgPlay').datagrid('appendRow',{
	        	   tScName:selRows[i].tScName,
	        	   tScTime:5,
	        	   tScTx:'6',
	        	   tScFileName:selRows[i].tScFileName
               });
	           onMousePreView(); 
	           
          }
    	   
    	
      } 


    

      
 

 	//修改图片全部切换时间
 	function setPlayTimeImgSubmit(){
         if($('#qieAll').val().length==0){
               return;
         }

 		 var rows=$("#dgPlay").datagrid("getRows");
 		 for(var i=0;i<rows.length;i++)
 		 {
 			   $('#dgPlay').datagrid('updateRow',{
 		        index: i,
 		        row: {
 		            'tScTime':$('#qieAll').val()
 		           
 		        }
 		      });

 		 }
 		 
 		
 	    
 	 
 	   $('#win-time').window('close', true); 
     }


	//修改图片全部特效
	function setPlayTxSubmit(){  
        
		 var rows=$("#dgPlay").datagrid("getRows");
		 for(var i=0;i<rows.length;i++)
		 {
			   $('#dgPlay').datagrid('updateRow',{
		        index: i,
		        row: {
		            'tScTx':$('#txAll').combobox('getValue')
		        }
		      });

		 }		 
	   $('#win-tx').window('close', true); 
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
		
	}

	//修改图片全部切换时间
	function setPlayTimeImgSubmit(){
       if($('#qieAll').val().length==0){
             return;
       }

		 var rows=$("#dgPlay").datagrid("getRows");
		 for(var i=0;i<rows.length;i++)
		 {
			   $('#dgPlay').datagrid('updateRow',{
		        index: i,
		        row: {
		            'tScTime':$('#qieAll').val()
		           
		        }
		      });

		 }
		 
		
	    
	 
	   $('#win-time').window('close', true); 
   }
	    
   //获取播放列表数据
   function adPlayData(){
	   endEditing();
	   
	   var rows=$("#dgPlay").datagrid("getRows");

	   if(rows.length==0){
		     layer.msg("<ww:property value='#session.local.a00282'/>");  
             return;
	   }
	   
	   //构造集合对象
  	   var programComplexMediaManager=new Object();
  	   programComplexMediaManager.mLeft=0;
  	   programComplexMediaManager.mTop=0;
  	   programComplexMediaManager.mWidth=300;
  	   programComplexMediaManager.mHeight=300;
	   var mMediaList= new Array();
       //图片播放总时长
	   var mPlayTimes=0;

      
	   for(var i=0;i<rows.length;i++)
 	   {
	 	 
	 	   if(rows.length==1&&rows[i].tScName=="img_bg.png"){

	 		    var scBasis = new Object();
			    scBasis.tbType=1;  //类型
			    scBasis.type=1;    //类型 
			    scBasis.timeoutMillis=rows[i].tScTime;  //切换时长
			    scBasis.path=rows[i].tScFileName;    //播放地址
			    scBasis.inAnim=rows[i].tScTx;   //特效
			    scBasis.sname=rows[i].tScName;//显示名称
			    mPlayTimes=mPlayTimes+parseInt(rows[i].tScTime);//播放时长
			    mMediaList[mMediaList.length]=scBasis;
			   

		   }else{

			   if(rows[i].tScName!="img_bg.png"){
				   
				   var scBasis = new Object();
				   scBasis.tbType=1;  //类型
				   scBasis.type=1;    //类型 
				   scBasis.timeoutMillis=rows[i].tScTime;  //切换时长
				   scBasis.path=rows[i].tScFileName;    //播放地址
				   scBasis.inAnim=rows[i].tScTx;   //特效
				   scBasis.sname=rows[i].tScName;//显示名称
				   mPlayTimes=mPlayTimes+parseInt(rows[i].tScTime);//播放时长
				   mMediaList[mMediaList.length]=scBasis;

			   }
			  

		   }
		   
		  
 	   }
	   programComplexMediaManager.mPlayTimes=mPlayTimes;//播放总时长
	   programComplexMediaManager.mMediaList=mMediaList;//素材播放列表
	        
	   var json = JSON.stringify(programComplexMediaManager);
   	   
       document.getElementById("jsonData").value=json;
   	   document.form1.action="adimageto.vs";
 	   document.form1.submit();
 	   
   }
    	 
</script>
</head>
<body onload="onload_data()">
    
  

    <form method="post" name="form1" action="">
       <div class="panel panel-primary" style="margin: 3px 3px;">
           <div class="panel-heading">
                <ww:property value="#session.local.a00061"/> <!-- 图片 -->
           </div>
          <div class="container clearfix" style="margin: 10px 10px;">
          <div class="main-wrap" style="width:850px;">
		      <div class="result-wrap">
		          <div class="result-content" >
		            <table class="insert-tab" width="100%" style="text-align: center;">
			           
			          
			           
			           <tr>
			            <td  colspan="3"  style="padding-left: 20px;">
			                   <div id="targetDivContent" style="display: none;">
			                        
			                      
			                   </div>
			                   
			                   <div id="targetDivContentImg" style="padding-top: 10px;">
			                        
			                       
			                        
			                        
			                        <!-- 图片列表 -->
						            <div id="step3" style="float: left;margin: 0px 0px 10px 0px; padding: 0px 0px;" >
						               <div style="height: 392px;width: 350px;">
						                 <table id="dg" class="easyui-datagrid"  title="<ww:property value='#session.local.b00017'/>" style="width:350px;height:392px;margin: 0px;padding: 0px;"
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
													<select  id="scGroupCombobox"  class="easyui-combobox" panelHeight="auto" style="width:100px;height: 20px;">
														<option <ww:if test="gssi.sucaigroupid==0">selected="selected" </ww:if>  value="0"><ww:property value='#session.local.a00815'  /></option> <!-- 全部 -->
														<option <ww:if test="gssi.sucaigroupid==-1">selected="selected" </ww:if>  value="-1"><ww:property value='#session.local.b00015'  /></option><!-- 共享 -->
														<ww:iterator value="listsfgp">
														       <option  <ww:if test="gssi.sucaigroupid==id">selected="selected" </ww:if>  value="<ww:property value='id'  />"><ww:property value="name"  /></option>
														</ww:iterator>
													</select>
													<input id="ser" class="easyui-searchbox" data-options="prompt:'<ww:property value='#session.local.a00071'  />',searcher:doSearch" style="width:100px"></input>
													
													<a id="step1" style="height: 20px;" title="<ww:property value='#session.local.a00063' />" href="javascript:open_item_sucai_onload('upimg.jsp')" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick=""></a>
	
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
													 			       
                                                                       //清空列表
													    	    	   //clearDgList();
													    	    	   //隐藏鼠标悬浮
													    	    	   $("#preview").hide(); 
													    	    	   $('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(4,2,null,data));
													 			       onMousePreView();
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
													 			       
																       //清空列表
												    	    	       //clearDgList(); 
													 			        $('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(4,2,null,data));
													 			        onMousePreView();
													 				}
															  });
															
														}
														
													</script>
												
												</div>
										  </div>
	
								   
						           </div>
						           
								      <div class="part2_2 part2_2_3" style="float: left;margin-right: 0px; margin-top: 80px;width: 50px;">
								      
								            <button id="step4" onclick="addPlayMuti()" class="btn btn-primary"   title="<ww:property value='#session.local.a00270' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-right " ></i>
								            
								            </button>
											<!--添加到已选列表  -->
											
											
											<button style="margin-top: 15px;" onclick="MoveUp(0)" class="btn btn-primary"   title="<ww:property value='#session.local.a00268' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-up " ></i>
								            
								            </button>
								        	<!--上移 -->
											
											
											<button style="margin-top: 15px;" onclick="MoveDown(0)" class="btn btn-primary"   title="<ww:property value='#session.local.a00269' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-down " ></i>
								            
								            </button>
								            <!--下移 -->
								            
								            <button style="margin-top: 15px;" onclick="removeit(0)" class="btn btn-primary"   title="<ww:property value='#session.local.a00025' />"   type="button">
								            
								               <i class="icon  icon-remove-sign " ></i>
								           
								            </button>
								            
											<!--删除-->
										</div>
								    
								    
								    
                                    <!-- 图片播放列表 -->
						            <div  style="float: left;margin: 0px 0px; padding: 0px 0px;" >
						                 <table  id="dgPlay" class="easyui-datagrid"  title="<ww:property value="#session.local.b00013"  />" style="width:400px;height:390px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: true,
												toolbar: '#tb',
												method: 'get',
												onClickCell: onClickCell,
												nowrap:true	,
												selectOnCheck:false,
												checkOnSelect:false,
												sortOrder: 'asc',
											    sortName: 'tScName',
											    remoteSort:false
											">
							                <thead>
								                    <tr>
								                        <th data-options="field:'ck',checkbox:true,hidden:true"></th>
														<th data-options="field:'tScName',width:180,sortable:true"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
														<th data-options="field:'tScFileName',hidden:true"></th>
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
														<th data-options="field:'tScTx',width:100,formatter:unitformatter,
														    
                                                             editor: 
                                                               { type: 'combobox', 
                                                                 options: 
                                                                        {  data:txs,
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
<!--											<ww:property value='#session.local.b00050'/></a> 保存更改 -->
											
											
											<input type="checkbox" style="margin: 0px 0px 0px 0px;" value="1"  name="blflag" id="blflag"/> 
											<ww:property value='#session.local.b00297'/>
											
																
									   </div>
								   
						           </div>
						           
						           
						           
						           <div id="log" title="参数"  style="float: left;margin: 0px 0px; padding: 0px 0px;height: 400px;width: 200px;display: none;" >
	                                      <div style="float: left;">&nbsp;&nbsp;X:
											   <span>
											       <input id="xy_x" name="xy_x" type="text" <ww:if test="xy_x==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_x' />"</ww:else>  style="width: 40px;height: 20px;" value="0"   onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
											   </span>
										   </div>
										
										   <div style="float: left;margin-left: 20px;">Y:
										      <span><input id="xy_y" name="xy_y" type="text" <ww:if test="xy_y==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_y' />"</ww:else> style="width: 40px;height: 20px;" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
										      </span>
										   </div>
										   
										   
										   <br />
										   <div style="float: left;">
										          &nbsp;&nbsp;<ww:property value='#session.local.a00032' />:
										          <span>
										            <input name="width" id="width" type="text" style="width:40px;height: 20px;" <ww:if test="width==0">value="300"</ww:if><ww:else>value="<ww:property value='width' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
										          </span>
										   </div><!-- 宽 -->
										
										   <div style="float: left;margin-left: 20px;">
										      <ww:property value='#session.local.a00033' />:
										          <span>
										              <input name="height" id="height" type="text" style="width:40px;height: 20px;"  <ww:if test="height==0">value="300"</ww:if><ww:else>value="<ww:property value='height' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
										          </span>
										   </div><!-- 高-->
	                               
	                               
	                               </div>
	
	
			                 </div>
			                 
			                 
			             
			                 
			                 
			                 
			                 
			            </td>
			           </tr>
			           
			          
			           
			            <tr>
						    <td colspan="3" style="height: 45px;padding-left: 350px;"    >
				                 <button id="step5" class="btn btn-primary" onclick='adPlayData()' type="button"><ww:property value='#session.local.a00080' /></button>
				                 
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

									        
								             //特效
								             var txs = [
											            { "value": "6", "text": "<ww:property value='#session.local.a00029' />" },
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

								             //开关
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

								               

								                function accept(){
								        			if (endEditing()){
								        				$('#dgPlay').datagrid('acceptChanges');
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
             
        <!-- 预览显示 -->           
        <div   id="preview"  style="position: absolute;display: none;">
           <img  id="show_img" src=""  height="100px"  width="150px" />   
        </div>
                                    
</form>

  <!-- 弹出框  播放时长(秒)-->
    <div id="win-time" class="easyui-window"  closed="true" title="<ww:property value='#session.local.a00747' />" style="width:260px;height:120px;"  data-options="left:'510px',top:'160px',collapsible:false,
		minimizable:false,
		maximizable:false" >
		<div style="padding:20px 20px 10px 30px;">
			<p><input class="easyui-numberbox"  data-options="required:true" missingMessage="<ww:property value='#session.local.a00671'/>"    id="qieAll" type="text"  style="float: left;width: 150px;" /><a style="float: right;" href="javascript:setPlayTimeImgSubmit();" class="easyui-linkbutton"><ww:property value="#session.local.a00080"/></a></p>
		</div>  
    </div>
    
    <!-- 弹出框 播放特效-->
    <div id="win-tx" class="easyui-window"  closed="true" title="<ww:property value='#session.local.a00748'/>" style="width:260px;height:120px;"  data-options="left:'510px',top:'160px',collapsible:false,
		minimizable:false,
		maximizable:false" >
		<div style="padding:20px 20px 10px 30px;">
			<p><input class="easyui-combobox"   data-options="editable:false"     id="txAll" type="text" style="float: left;width: 150px;"   /><a style="float: right;" href="javascript:setPlayTxSubmit();" class="easyui-linkbutton"><ww:property value="#session.local.a00080"/></a></p>
			
		</div>  
    </div>
    
    
<script>
//$('#sortableList').sortable();
</script>
</body>
</html>
