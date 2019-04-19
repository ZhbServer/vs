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
    	    	
    	    	initSucaiListJson=initSucaiListJson.replace(/&quot;/g,"\"");
                //转换成touch对象组
    		    var objs = eval( "(" + initSucaiListJson + ")" );//转换后的JSON对象
    		  
    		    var  obj; 

    		    for(var i=0;i<objs.length;i++){
    		    	//创建tr
    				$('#dg').datagrid('appendRow',{
        				
		    				tScName:objs[i].name,
				        	ck:objs[i].id,
				        	tScFileName:objs[i].filename,
				        	tScStime:objs[i].stime
				        	
    				});

        		}

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
		    				tScVol:objs[i].mVol,
				        	ck:objs[i].id,
				        	tScFileName:objs[i].path


    				});

        		}

        	}   
    	    
            //初始化鼠标悬浮事件
    	    //onMousePreView();
    	   
    	   
    	      
            
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
		 			       
                           //清空列表
		    	    	   clearDgList(); 
		 			       for(i=0;i<data.length;i++)
		 				   {

		 			    	    //创建tr
		 	    				$('#dg').datagrid('appendRow',{
		 	    					
		 			    				tScName:data[i].name,
		 					        	ck:data[i].id,
		 					        	tScFileName:data[i].filename,
		 					        	tScStime:data[i].stime
		 	    				});

		 	    				//onMousePreView();  
		 				
		 				    }
		 			      
		 				}
		 			});
      			}
      		});            
      }

      //添加到播放列表
      function addPlayMuti(){
           //获取素材列表已选
    	  var selRows = $('#dg').datagrid('getChecked');
    	  $('#dgPlay').datagrid('clearSelections');
    	  clearDgPlayList();
    	  for(var i=0;i<selRows.length;i++){
    		  
    		  //创建tr
	          $('#dgPlay').datagrid('appendRow',{
	        	   tScName:selRows[i].tScName,
	        	   tScTime:selRows[i].tScStime,
	        	   tScFileName:selRows[i].tScFileName
               });
	           //onMousePreView(); 
          }
    	   
    	
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
      
	    
   //获取播放列表数据
   function adPlayData(){

	   
	   var rows=$("#dgPlay").datagrid("getRows");

	   if(rows.length==0){
		    layer.msg("<ww:property value='#session.local.a00282' />");
		    return 
	   }
	   


	   var voice=new Object();
	   for(var i=0;i<rows.length;i++)
 	   {

		   voice.filename=rows[i].tScFileName;
		   voice.name=rows[i].tScName;
		  
 	   }
	  
	   var json = JSON.stringify(voice);
   	   
	   var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	   window.parent.returnValue=json; 
	   window.parent.layer.close(index);

 	   
   }


	
	    
			 
</script>
</head>
<body onload="onload_data()">
    
   
    
    
   

    <form method="post" name="form1" action="">
       <div class="panel panel-primary" style="margin: 3px 3px;">
           <div class="panel-heading">
                <ww:property value="#session.local.a00059"/> <!-- 音频 -->
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
			                        
			                       
			                        
			                        
			                        <!-- 音频列表 -->
						            <div style="float: left;margin: 0px 0px 10px 0px; padding: 0px 0px;" >
						                 <table id="dg" class="easyui-datagrid"  title="<ww:property value='#session.local.b00017'/>" style="width:350px;height:390px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: true,
												toolbar: '#tb0',
												method: 'get',
												nowrap:true	,
												selectOnCheck:true,
												checkOnSelect:true,
												multiple: true
											">
							                <thead>
								                    <tr>
								                        <th data-options="field:'ck',checkbox:true"></th>
														<th data-options="field:'tScName',width:280"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
														<th data-options="field:'tScFileName',hidden:true"></th>
														<th data-options="field:'tScStime',hidden:true"></th>
									        	    </tr>
							                 </thead>
					                      </table>	           
							      
							      
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
													
													<a style="height: 20px;" title="<ww:property value='#session.local.a00063' />" href="javascript:open_item_sucai_onload('upaudio.jsp')" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick=""></a>
	
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
													    	    	   clearDgList();
													    	    	   //隐藏鼠标悬浮
													    	    	   $("#preview").hide(); 
													 			       for(i=0;i<data.length;i++)
													 				   {

													 			    	    //创建tr
													 	    				$('#dg').datagrid('appendRow',{
													 	    					
													 			    				tScName:data[i].name,
													 					        	ck:data[i].id,
													 					        	tScFileName:data[i].filename
													 	    				});

													 	    				 
													 				
													 				    }
													 			        //onMousePreView();
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
												    	    	       clearDgList(); 
													 			       for(i=0;i<data.length;i++)
													 				   {

													 			    	    //创建tr
													 	    				$('#dg').datagrid('appendRow',{
													 	    					
													 			    				tScName:data[i].name,
													 					        	ck:data[i].id,
													 					        	tScFileName:data[i].filename
													 	    				});

													 	    				 
													 				
													 				    }
													 			        //onMousePreView();
													 				}
															  });
															
														}
														
													</script>
													
													
													
												</div>
										  </div>
	
								   
						           </div>
						           
								    <div class="part2_2 part2_2_3" style="float: left;margin-right: 0px; margin-top: 80px;width: 50px;">
											<a title="<ww:property value='#session.local.a00270' />" href="javascript:addPlayMuti();"  style="width: 40px;height:30px;">
											  <img src="image/item/sc_right.png" alt="" height="30px" width="40px" />
											</a><!--添加到已选列表  -->
											
											<a title="<ww:property value='#session.local.a00025' />" href="javascript:removeit(0);" style="width: 40px;height:30px;">
											  <img src="image/item/sc_del.png" alt="" height="30px" width="40px" />
											</a><!--删除-->
								    </div>
								    
								    
								    
                                    <!-- 音频播放列表 -->
						            <div style="float: left;margin: 0px 0px; padding: 0px 0px;" >
						                 <table id="dgPlay" class="easyui-datagrid"  title="<ww:property value="#session.local.b00013"  />" style="width:400px;height:390px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: true,
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
														<th data-options="field:'tScName',width:330,sortable:true"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
														<th data-options="field:'tScFileName',hidden:true"></th>
														<th data-options="field:'tScTime',hidden:true"></th>
														
									        	    </tr>
							                 </thead>
							          </table>	           								   
						           </div>
			                 </div>
			                 
			            </td>
			           </tr>
			           
			          
			           
			            <tr>
						    <td colspan="3" style="height: 45px;padding-left: 340px;"    >
				                 <button class="btn btn-primary" onclick='adPlayData()' type="button"><ww:property value='#session.local.a00080' /></button>
				                 
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


												 function unitformatter(value, rowData, rowIndex) {
										        	    if (value == "100") {
										        	        return "100%";
										        	    }
										        	    for (var i = 0; i < vols.length; i++) {
										        	        if (vols[i].value == value) {
										        	            return vols[i].text;
										        	        }
										        	    }
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
             
    
                                    
</form>

<script>
//$('#sortableList').sortable();
</script>
</body>
</html>
