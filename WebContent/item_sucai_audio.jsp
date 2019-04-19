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


    	    //素材列表
    	    var  initSucaiListJson="<ww:property value='initSucaiListJson' />";


    	    if(initSucaiListJson!=""){

    	    	$('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(2,1,initSucaiListJson,null));

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


      	    		      $('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(2,2,null,data));
                           
		 			      
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
	        	   tScTime:selRows[i].tScStime,
	        	   tScFileName:selRows[i].tScFileName,
	        	   tScVol:'100'
               });
	           //onMousePreView(); 
          }
    	   
    	
      } 

	    
   //获取播放列表数据
   function adPlayData(){

	   endEditing();
	   
	   var rows=$("#dgPlay").datagrid("getRows");

	   if(rows.length==0){
		     var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
			 window.parent.returnValue="clear"; 
		     window.parent.layer.close(index);
	   }
	   
	   //构造集合对象
  	   var programComplexMediaManager=new Object();
  	   programComplexMediaManager.mLeft=0;
  	   programComplexMediaManager.mTop=0;
  	   programComplexMediaManager.mWidth=1;
  	   programComplexMediaManager.mHeight=1;
	   var mMediaList= new Array();
       //图片播放总时长
	   var mPlayTimes=0;
	   for(var i=0;i<rows.length;i++)
 	   {
		   var scBasis = new Object();
		   scBasis.tbType=2;  //类型
		   scBasis.type=2;    //类型 
		   scBasis.timeoutMillis=rows[i].tScTime;  //切换时长
		   scBasis.path=rows[i].tScFileName;    //播放地址
		   scBasis.inAnim=0;   //特效
		   scBasis.sname=rows[i].tScName;//显示名称
		   scBasis.mVol=rows[i].tScVol;
		   mPlayTimes=mPlayTimes+rows[i].tScTime;//播放时长
		   mMediaList[i]=scBasis;
 	   }
	   programComplexMediaManager.mPlayTimes=mPlayTimes;//播放总时长
	   programComplexMediaManager.mMediaList=mMediaList;//素材播放列表
	        
	   var json = JSON.stringify(programComplexMediaManager);
   	   
       document.getElementById("jsonData").value=json;
   	   document.form1.action="adaudioto.vs";
 	   document.form1.submit();
 	   
   }


	 //设置所有播放时长(秒)
	 function setPlayAll(){
		
			$('#volAll').combobox({
				data:vols,
				valueField:'value',
				textField:'text',
				value:"100"  //默认选中value指定的选项
			});

			$('#win-vol').window('open');
		 
		
	}

     //修改音频全部音量
	 function setPlayVolSubmit(){  
	        
			 var rows=$("#dgPlay").datagrid("getRows");
			 for(var i=0;i<rows.length;i++)
			 {
				   $('#dgPlay').datagrid('updateRow',{
			        index: i,
			        row: {
			            'tScVol':$('#volAll').combobox('getValue')
			        }
			      });

			 }		 
		   $('#win-vol').window('close', true); 
	  }


     //取消音频
	 function unaudio(){
		 	
	     var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
		 window.parent.returnValue="clear"; 
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
			            <td  colspan="3"  style="padding-left: 20px;">
			                   <div id="targetDivContent" style="display: none;">
			                        
			                      
			                   </div>
			                   
			                   <div id="targetDivContentImg" style="padding-top: 10px;">
			                        
			                       
			                        
			                        
			                        <!-- 音频列表 -->
						            <div style="float: left;margin: 0px 0px 10px 0px; padding: 0px 0px;" >
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
															<th data-options="field:'tScStime',hidden:true"></th>
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
													 			       
                                                                  
													    	    	   //隐藏鼠标悬浮
													    	    	   $("#preview").hide(); 
													    	    	   $('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(2,2,null,data));
													 			      
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
													 			       
																        $('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(2,2,null,data));
																    
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
								    
								    
								    
                                    <!-- 音频播放列表 -->
						            <div style="float: left;margin: 0px 0px; padding: 0px 0px;" >
						                 <table id="dgPlay" class="easyui-datagrid"  title="<ww:property value="#session.local.b00013"  />" style="width:400px;height:390px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: true,
												method: 'get',
												toolbar: '#tb',
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
														<th data-options="field:'tScName',width:265,sortable:true"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
														<th data-options="field:'tScFileName',hidden:true"></th>
														<th data-options="field:'tScTime',hidden:true"></th>
														<th data-options="field:'tScVol',width:100,formatter:unitformatter,
														    
                                                             editor: 
                                                               { type: 'combobox', 
                                                                 options: 
                                                                        {  data:vols,
                                                                           valueField:'value',
					                                                       textField:'text',
					                                                       method:'get',
					                                                       required:true,
					                                                       editable:false
					                                                      
                                                                        } 
                                                               }
                                                        "><ww:property value='#session.local.a00461'/></th>
									        	    </tr>
							                 </thead>
							                 
							              
									  
					                  </table>	           
							          
							          
							          <div id="tb" style="height:auto;line-height: 0px;">
											
											<a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton"  onclick="setPlayAll()">
											<ww:property value='#session.local.b00018'/></a><!-- 设置所有音量大小 -->
											
										
											
																
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
 <!-- 弹出框 设置音量大小-->
    <div id="win-vol" class="easyui-window"  closed="true" title="<ww:property value='#session.local.b00018'/>)" style="width:260px;height:120px;"  data-options="left:'510px',top:'160px',collapsible:false,
		minimizable:false,
		maximizable:false" >
		<div style="padding:20px 20px 10px 30px;">
			<p><input class="easyui-combobox"  data-options="editable:false"  id="volAll" type="text" style="float: left;width: 150px;"   /><a style="float: right;" href="javascript:setPlayVolSubmit();" class="easyui-linkbutton"><ww:property value="#session.local.a00080"/></a></p>
			
		</div>  
    </div>
<script>
//$('#sortableList').sortable();
</script>
</body>
</html>
