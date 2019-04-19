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

<script src="js/fresh.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript" src="js/My97DatePicker/<ww:property value='#session.local.a00000' />_WdatePicker.js"></script>

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
            	$('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(3,1,initSucaiListJson,null));
    	    } 
    	    	
    	    //播放列表
    	    var  yxSucaiListJson="<ww:property value='yxSucaiListJson' />";
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
			        	tScFileName:objs[i].path

				     });

        		}

        	}   
    	    
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


      //添加到播放列表
      function addPlayMuti(){
           //获取素材列表已选
    	  var selRows = $('#dg').datagrid('getChecked');
    	  $('#dg').datagrid('clearSelections');
    	  
    	  for(var i=0;i<selRows.length;i++){

    		  //创建tr
	          $('#dgPlay').datagrid('appendRow',{
	        	   tScName:selRows[i].tScName,
	        	   ck:selRows[i].ck
               });
          }
    	   
    	
      } 


	    
   //获取播放列表数据
   function adPlayData(){

	   
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
		   
		   //类型 0视频 1图片
		   var tScVideoImgType=rows[i].tScVideoImgType;
		   
		   var scBasis = new Object();
		   scBasis.tbType=tScVideoImgType;  //类型
		   scBasis.type=tScVideoImgType;    //类型

		    
		  
		   
		   scBasis.path=rows[i].tScFileName;    //播放地址
		   scBasis.inAnim=rows[i].tScTx;   //特效
		   scBasis.sname=rows[i].tScName;//显示名称
		   scBasis.mVol=rows[i].tScVol;//视频音量

           
	
			   
		   scBasis.timeoutMillis=rows[i].tScTime;  //切换时长
		   mPlayTimes=mPlayTimes+parseInt(rows[i].tScTime);//播放时长
		  
		  


		   mMediaList[i]=scBasis;
 	   }
 	   
	   programComplexMediaManager.mPlayTimes=mPlayTimes;//播放总时长
	   
	   programComplexMediaManager.mMediaList=mMediaList;//素材播放列表
	        
	   var json = JSON.stringify(programComplexMediaManager);
   	   
       document.getElementById("jsonData").value=json;
   
   	   document.form1.action="advideoto.vs";
 	   document.form1.submit();
 	   
   }


    //分组onchange获取数据
   function groupOnchangeGetData(){

	     var value = $("#ser").val();
         var myOptValue="";
       	 myOptValue = $("#scGroupCombobox").combobox("getValue") ;
		 var tScStimeValue=5;
	     
	      
	     //ajax请求获取数据

	     $.ajax({
			type:'post',
			url:'ajaxtoaddjhvideo.vs',
			data:"id=1&checkAjaxState=1&sel=0&ser="+value+"&igr.itemgroupid="+myOptValue,
			dataType:'json',
			async:true,
			cache:true,
			success:function(data){
		       
               //清空列表
	    	   //clearDgList();
	    	   $('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(3,2,null,data));
		      
			}
		});	
   }


 //保存
   function gosubmit()  {  


	   var rows=$("#dgPlay").datagrid("getRows");

	   if(rows.length==0){
		     layer.msg("<ww:property value='#session.local.a00415'/>");  
             return;
	   }
	   
 
   	

   	       
         var filenames="";
         var itemnames="";
	   	 var temp;
	   	  for(var i=0;i<rows.length;i++)
	   	  {
	   		  temp= rows[i].ck;
	   		  temp2=rows[i].tScName;
	   		  if(i==0)
	   		  {
	   			
	   		     filenames=temp;
	   		     itemnames=temp2;
	   		  }
	   		  else
	   		  {
	   		    filenames+=","+temp;
	   		    itemnames+=","+temp2;
	   		  }
	   	 }
   		document.getElementById("filenames").value=filenames;
   		document.getElementById("itemnames").value=itemnames;
   	  	return true;
    }  
    function savaSubmit(){

    	     if(gosubmit()){

    	    	  var jhitemId = $("#jhitemId").val(); 
                  var filenames = $("#filenames").val(); 
                  var itemnames = $("#itemnames").val(); 
                  $.ajax({
    				type:'post',
    				url:'adjhdpitem.vs',
    				data:"jhid="+jhid+"&filenames="+filenames+"&itemnames="+itemnames+"&jhitemId="+jhitemId,
    				dataType:'json',
    				async:true,
    				cache:true,
    				success:function(data){
                	    var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
    					window.parent.returnValue=""; 
    			        window.parent.layer.close(index);
                    }
    	  		});

        	 }
    	     
        	
         
    }


</script>
</head>
<body onload="onload_data()">
   
    <form method="post" name="form1" action="">
       <div class="panel panel-primary" style="margin: 3px 3px;">
           <div class="panel-heading">
                <ww:property value="#session.local.a00387"/> <!-- 添加节目 -->
           </div>
          <div class="container clearfix" style="margin: 10px 10px;">
		
          <div class="main-wrap" style="width:900px;height:380px;">
		      <div class="result-wrap">
		          <div class="result-content">
		            <table class="insert-tab" width="100%" style="text-align: center;">
			           
			          
			           
			           <tr>
			            <td  colspan="3"  >
			                   <div id="targetDivContent" style="display: none;">
			                        
			                      
			                   </div>
			                   
			                   <div id="targetDivContentImg" style="padding-top: 10px;">
			                        
			                       
			                        
			                        
			                        <!-- 节目列表 -->
						            <div style="float: left;margin: 0px 0px 10px 0px; padding: 0px 0px;" >
						                 <table id="dg" class="easyui-datagrid"  title="<ww:property value='#session.local.a00246'/>" style="width:400px;height:360px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,  
												singleSelect: false,
												toolbar: '#tb0',
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
														<th data-options="field:'tScName',width:330"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
									        	    </tr>
							                 </thead>
					                      </table>	           
							      
							              <div id="tb0" style="height:auto;line-height: 0px;">
												
												<div>
												       
													<div id="divScGroupComboboxVideo" style="float: left;padding-top: 2px;margin-right: 2px;">
													    <ww:property value='#session.local.b00014'  />:<!-- 分组 --> 
														<select  id="scGroupCombobox"  class="easyui-combobox" panelHeight="auto" style="width:100px;height: 20px;">
															<option <ww:if test="igr.itemgroupid==0">selected="selected" </ww:if>  value="0"><ww:property value='#session.local.a00815'  /></option> <!-- 全部 -->
															<option <ww:if test="igr.itemgroupid==-1">selected="selected" </ww:if>  value="-1"><ww:property value='#session.local.b00015'  /></option><!-- 共享 -->
															<ww:iterator value="listsfgp">
															       <option  <ww:if test="igr.itemgroupid==id">selected="selected" </ww:if>  value="<ww:property value='id'  />"><ww:property value="name"  /></option>
															</ww:iterator>
														</select>
													</div>
													
													<input id="ser" class="easyui-searchbox" data-options="prompt:'<ww:property value='#session.local.a00255'  />',searcher:doSearch" style="width:100px"></input>
	
													<script>

													    //分组combobox事件
													    $("#scGroupCombobox").combobox({
													    	onChange : function(){
													    	      //获取数据
											    	    	      groupOnchangeGetData();									    	   
													    	}
														}); 

													    function onClickRow(index){
															if (editIndex != index){
																if (endEditing()){
																	$('#dg').datagrid('selectRow', index)
																			.datagrid('beginEdit', index);
																	editIndex = index;
																} else {
																	$('#dg').datagrid('selectRow', editIndex);
																}
															}
														}

													    //搜索
														function doSearch(value,name){

													    	 var value = $("#ser").val();
													         var myOptValue = $("#scGroupCombobox").combobox("getValue") ;
															
															  $.ajax({
													 				type:'post',
													 				url:'ajaxtoaddjhvideo.vs',
													 				data:"id=1&checkAjaxState=1&sel=1&ser="+value+"&igr.itemgroupid="+myOptValue,
													 				dataType:'json',
													 				async:true,
													 				cache:true,
													 				success:function(data){

																       //清空列表
												    	    	       //clearDgList(); 
													 					$('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(3,2,null,data));
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
								    
								    
								    
                                    <!-- 图片/音频播放列表 -->
						            <div style="float: left;margin: 0px 0px; padding: 0px 0px;" >
						                 <table id="dgPlay" class="easyui-datagrid"  title="<ww:property value="#session.local.a00246"  />" style="width:400px;height:360px;margin: 0px;padding: 0px;"
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
														<th data-options="field:'tScName',width:360,sortable:true"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
									        	    </tr>
							                 </thead>
							                 
							              
									  
					                  </table>	           
							          
						           </div>
			                 </div>
			            </td>
			           </tr>
			           
			         </table>
                  </div>
		  </div>
		</div>
        </div>
        <div style="width:850px;height:40px;margin:10px auto;text-align: center;">
			<button class="btn btn-primary" style="margin-left:20px;" onclick='savaSubmit()' type="button"><ww:property value='#session.local.a00080' /></button>
            <button class="btn btn-primary" style="margin-left:20px;" onclick='close_win_nov()' type="button"><ww:property value='#session.local.a00014' /></button>
		</div>
       </div> 	        
	
                                         <script type="text/javascript">

									        
                                          var vols = [
                                                     { "value": "100", "text": "100%" },
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
        <input type="hidden" name="igr.itemgroupid"  id="gpid" value="<ww:property value='igr.itemgroupid'/>"/>
        <!--节目文件名 --> 
        <input type="hidden" value="<ww:property value='mfile'/>" name="mfile" id="mfile" />
       	<!--计划id-->
		<input type="hidden" name="jhid"  id="jhid" value="<ww:property value='jhid'/>" />
        <!--计划类型-->
		<input type="hidden" name="jhtype"  id="jhtype" value="<ww:property value='jhtype'/>" />
             
        <!--已选列表-->
        <input type="hidden"  name="filenames" id="filenames" /> 
        <input type="hidden"  name="itemnames" id="itemnames" /> 
        <input type="hidden"  name="jhitemId" id="jhitemId"   value="<ww:property value='jhitemId'/>"/>
        
</form>
</body>
</html>
