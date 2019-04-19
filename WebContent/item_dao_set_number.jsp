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
    	    var  itemPlayNumberJson="<ww:property value='itemPlayNumberJson' />";


    	    if(itemPlayNumberJson!=""){
    	    	
    	    	itemPlayNumberJson=itemPlayNumberJson.replace(/&quot;/g,"\"");
                //转换成touch对象组
    		    var objs = eval( "(" + itemPlayNumberJson + ")" );//转换后的JSON对象
    		  
    		    var  obj; 

    		    for(var i=0;i<objs.length;i++){
    		    	//创建tr
    				$('#dg').datagrid('appendRow',{
    					
    					    tItemName:objs[i].name,
				        	ck:objs[i].id,
				        	tItemPlayNumber:objs[i].playNumber
    				});

        		}

    	    } 


      
    	    
          
    	   
    	   
    	      
            
       }


      
  
 

 	//修改图片全部切换时间
 	function setPlaySubmit(){
         if($('#playAll').val().length==0){
               return;
         }

 		 var rows=$("#dg").datagrid("getRows");
 		 for(var i=0;i<rows.length;i++)
 		 {
 			   $('#dg').datagrid('updateRow',{
 		        index: i,
 		        row: {
 		            'tItemPlayNumber':$('#playAll').val()
 		           
 		        }
 		      });

 		 }
 		 
 		
 	    
 	 
 	    $('#win-play').window('close', true); 
     }




	 //设置所有播放次数
	 function setPlayAll(type){
		if(type==1){
			 $('#win-play').window('open');
		}
		
		
	}


	    
   //获取播放列表数据
   function adPlayData(){

	   
	   var rows=$("#dg").datagrid("getRows");

	   if(rows.length==0){
		     layer.msg("<ww:property value='#session.local.a00282'/>");  
             return;
	   }
	   
	   //构造集合对象
  	  
	   var itemPlayList= new Array();

	   var playType = $("#playType").combobox("getValue") ;
	  
	   for(var i=0;i<rows.length;i++)
 	   {
	 	   
		   var itemPlay = new Object();
		   itemPlay.name=rows[i].tItemName;
		   itemPlay.id=rows[i].ck;
		   itemPlay.playNumber=rows[i].tItemPlayNumber;
		   itemPlay.playType=playType;
		   itemPlayList[i]=itemPlay;
   
 	   }
	   
	   var json = JSON.stringify(itemPlayList);


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
                <ww:property value="#session.local.a00658"/>
           </div>
          <div class="container clearfix" style="margin: 10px 10px;">
          <div class="main-wrap" style="width:620px;">
		      <div class="result-wrap">
		          <div class="result-content">
		            <table class="insert-tab" width="100%" style="text-align: center;">
			           
			          
			           
			           <tr style="height: 280px;">
			            <td  colspan="3"  >
			                   <div id="targetDivContent" style="display: none;">
			                        
			                      
			                   </div>
			                   
			                   <div  style="padding-top: 10px;">
			                        
			                        <!-- 节目列表 -->
						            <div  style="float: left;margin: 0px 0px 10px 0px; padding: 0px 0px;" >
						                 <table id="dg" class="easyui-datagrid"  title="<ww:property value='#session.local.a00246'/>" style="width:500px;height:390px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: true,
												toolbar: '#tb',
												method: 'get',
												onClickCell: onClickCell,
												nowrap:true	,
												selectOnCheck:false,
												checkOnSelect:false,
												remoteSort:false
											">
							                <thead>
								                    <tr>
								                        <th data-options="field:'ck',checkbox:true,hidden:true"></th>
														<th data-options="field:'tItemName',width:320"><ww:property value='#session.local.a00255'/></th>
														<th data-options="field:'tItemPlayNumber',width:140,editor:'numberbox'"><ww:property value='#session.local.a00585'/></th><!-- 播放次数 -->
									        	    </tr>
							                 </thead>
					                      </table>	           
							      
							      
							               <div id="tb" style="height:auto;line-height: 0px;">
											
												<a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="setPlayAll(1)">
												<ww:property value='#session.local.b00048'/></a><!-- 设置所有节目播放次数 -->
												
												<select  id="playType" name="playType" class="easyui-combobox" panelHeight="auto" style="width:100px;height: 20px;">
												
														<option selected="selected"   value="0"><ww:property value='#session.local.a00605'  /></option> <!-- 普通播放 -->
														<option value="1"><ww:property value='#session.local.b00276'  /><ww:property value='#session.local.a00740'  /></option><!-- 预警播放 -->
														
											    </select>
													
													
									       </div>
	
								   
						           </div>
						           
						           
						            <div  style="width: 50px;float: left;margin-left: 10px; margin-top: 80px;">
																
											<a title="<ww:property value='#session.local.a00268' />" href="javascript:MoveUp(1);"  style="width: 40px;height:30px;">
											  <img src="image/item/sc_up.png" alt="" height="30px" width="40px" />
											</a><!--上移 -->
											<br/><br/>
											<a title="<ww:property value='#session.local.a00269' />" href="javascript:MoveDown(1);" style="width: 40px;height:30px;">
											  <img src="image/item/sc_down.png" alt="" height="30px" width="40px" />
											</a><!--下移 -->
															
								    </div>
														   
														   
														   
	
			                 </div>
			               			                 
			                 
			            </td>
			           </tr>
			           
			          
			           
			            <tr>
						    <td colspan="3" style="height: 45px;padding-left: 250px;"    >
				                 <button  class="btn btn-primary" onclick='adPlayData()' type="button"><ww:property value='#session.local.a00080' /></button>
				                 
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
								        			if ($('#dg').datagrid('validateRow', editIndex)){
									        			
								        				$('#dg').datagrid('endEdit', editIndex);
								        				editIndex = undefined;
								        				return true;
								        			} else {
								        				return false;
								        			}
								        		}

								               
												function onClickCell(index, field){
													
													if (endEditing()){
														$('#dg').datagrid('selectRow', index)
																.datagrid('editCell', {index:index,field:field});
														editIndex = index;
													}
													
												}

						                 </script>
						       
			

                                    
</form>

  <!-- 弹出框  播放时长(秒)-->
    <div id="win-play" class="easyui-window"  closed="true" title="<ww:property value='#session.local.a00585' />" style="width:260px;height:120px;"  data-options="left:'200px',top:'160px',collapsible:false,
		minimizable:false,
		maximizable:false" >
		<div style="padding:20px 20px 10px 30px;">
			<p><input class="easyui-numberbox"  id="playAll" type="text"  style="float: left;width: 150px;" /><a style="float: right;" href="javascript:setPlaySubmit();" class="easyui-linkbutton"><ww:property value="#session.local.a00080"/></a></p>
		</div>  
    </div>
   
    
    
<script>
//$('#sortableList').sortable();
</script>
</body>
</html>
