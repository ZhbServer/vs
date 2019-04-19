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
<link rel="stylesheet" href="css/common.css"/>

<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/icon.css"  />

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script src="js/jscolor.js"></script> 


<script   src="zui-1.5.0-dist/dist/lib/sortable/zui.sortable.js"></script>

<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/datagrid-dnd.js"></script>

<style>
	/* 为可拖动的条目应用可移动光标类型 */
	#sortableList > .list-group-item {cursor: move}
	
	/* 为正在被拖动的条目应用半透明外观 */
	#sortableList > .list-group-item.dragging {
	  visibility: visible;
	  opacity: .3;
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
				$('#dgImg').datagrid('appendRow',{
					
	    				tScName:objs[i].name,
			        	ck:objs[i].id,
			        	tScFileName:objs[i].filename
				});

  		    }

	    } 


	  
	   
	   
	      
      
 }

</script>

</head>
<body onload="onload_data()">



                                         <table id="dgImg" class="easyui-datagrid"  title="<ww:property value='#session.local.b00017'/>" style="width:350px;height:390px;margin: 0px;padding: 0px;"
											data-options="
												singleSelect: true,
												toolbar: '#tb0',
												method: 'get',
												nowrap:true	,
												selectOnCheck:false,
												checkOnSelect:false
											">
							                <thead>
								                    <tr>
								                        <th data-options="field:'ck',checkbox:true"></th>
														<th data-options="field:'tScName',width:300"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
														<th data-options="field:'tScFileName',hidden:true"></th>
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
													
													<a style="height: 20px;" title="<ww:property value='#session.local.a00063' />" href="javascript:open_item_sucai_onload('upimg.jsp')" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick=""></a>
	
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
													 				data:"id=1&checkAjaxState=1"+"&gssi.sucaigroupid="+myOptValue+"&sucai.type=4",
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
													 	    				$('#dgImg').datagrid('appendRow',{
													 	    					
													 			    				tScName:data[i].name,
													 					        	ck:data[i].id,
													 					        	tScFileName:data[i].filename
													 	    				});

													 	    				 
													 				
													 				    }
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
													 				data:"id=1&checkAjaxState=1&sel=1&ser="+value+"&gssi.sucaigroupid="+myOptValue+"&sucai.type=4",
													 				dataType:'json',
													 				async:true,
													 				cache:true,
													 				success:function(data){
													 			       

																       //清空列表
												    	    	       clearDgList(); 
													 			       for(i=0;i<data.length;i++)
													 				   {

													 			    	    //创建tr
													 	    				$('#dgImg').datagrid('appendRow',{
													 	    					
													 			    				tScName:data[i].name,
													 					        	ck:data[i].id,
													 					        	tScFileName:data[i].filename
													 	    				});

													 	    				 
													 				
													 				    }
													 			        onMousePreView();
													 				}
															  });
															
														}
														
													</script>
													
													
													
												</div>
										  </div>	           
         
  
        

    
			
</body>
</html>