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

    	 

    	    //用户列表
    	    var  initUserListJson="<ww:property value='initUserListJson' />";

          
            if(initUserListJson!=""&&initUserListJson!="[]"){
            	
            	$('#dg').datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(0,1,initUserListJson,null));
            	 	    	
    	    } 


    	    //已选用户列表
    	    var  yxUserListJson="<ww:property value='yxUserListJson' />";
    	    
    	    if(yxUserListJson!=""){
    	    	yxUserListJson=yxUserListJson.replace(/&quot;/g,"\"");
    	    	//转换成touch对象组
    		    var objs = eval( "(" + yxUserListJson + ")" );//转换后的JSON对象
    		   
    		    var  obj; 

    		    for(var i=0;i<objs.length;i++){
    		    	
    		    	//创建tr
    				$('#dgPlay').datagrid('appendRow',{
                        	 uName:objs[i].name,
	 	 	   				 ck:objs[i].id,
	 	 	   				 uAccount:objs[i].account
    				});

        		}

        	}   
    	 
    	   
    	   
    	      
            
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
    	  

    	  //获取已选
    	  var rows=$("#dgPlay").datagrid("getRows");

    	  
    	  for(var i=0;i<selRows.length;i++){
        	  var flag=true;
    		  for(var j=0;j<rows.length;j++){
    			  if(rows[j].uAccount==selRows[i].uAccount){
    				  flag=false;
        	      }else{
        	    	 
            	  }
    	 	  }

    		  if(flag){
    			  //创建tr
    	          $('#dgPlay').datagrid('appendRow',{

    	        	   uName:selRows[i].uName,
    	   			   ck:selRows[i].ck,
    	   			   uAccount:selRows[i].uAccount
    	   				 
                   });

        	  }
    		
               
    		
	            
          }
    	   
    	
      } 


    

      
 



	
	    
   //获取播放列表数据
   function adPlayData(){

	   
	   var rows=$("#dgPlay").datagrid("getRows");

	   if(rows.length==0){
		     layer.msg("<ww:property value='#session.local.b00121'/>");  
             return;
	   }
	   
	   //构造集合对象
  	   var programDllItem=new Object();
  	   programDllItem.mLeft=0;
  	   programDllItem.mTop=0;
  	   programDllItem.mWidth=300;
  	   programDllItem.mHeight=300;
	   var mDllItemList= new Array();
      
	   for(var i=0;i<rows.length;i++)
 	   {
		   var dllItem = new Object();
		   dllItem.account=rows[i].uAccount;
		   dllItem.id=rows[i].ck;
		   dllItem.name=rows[i].uName; 
		   
		   mDllItemList[i]=dllItem;
 	   }
	   
	   programDllItem.mDllItemList=mDllItemList;//用户列表
	        
	   var json = JSON.stringify(programDllItem);


	   var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引 
	   window.parent.returnValue="";
  	   window.parent.returnValue=json; 
       window.parent.layer.close(index);
   	   
       //document.getElementById("jsonData").value=json;
   	   //document.form1.action="adimageto.vs";
 	   //document.form1.submit();
 	   
   }

   //鼠标悬浮预览绑定
   function onMousePreView(){
 		 

   } 	 
</script>
</head>
<body onload="onload_data()">
    
  
    
    
   

    <form method="post" name="form1" action="">
       <div class="panel panel-primary" style="margin: 3px 3px;">
           <div class="panel-heading">
                <ww:property value="#session.local.b00118"/> <!-- 绑定节目 -->
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
			                        
			                       
			                        
			                        
			                        <!-- 用户列表 -->
						            <div  style="float: left;margin: 0px 0px 10px 0px; padding: 0px 0px;" >
						               <div style="height: 392px;width: 350px;">
						                 <table id="dg" class="easyui-datagrid"  title="<ww:property value='#session.local.b00120'/>" style="width:350px;height:392px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: false,
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
														<th data-options="field:'uName',width:180"><ww:property value='#session.local.a00212'/></th><!-- 昵称 -->
														<th data-options="field:'uAccount',width:100"><ww:property value='#session.local.a00211'/></th><!-- 登陆名 -->
									        	    </tr>
							                 </thead>
					                      </table>	           
							            </div>
							      
						
	
								   
						           </div>
						           
								      <div class="part2_2 part2_2_3" style="float: left;margin-right: 0px; margin-top: 80px;width: 50px;">
											<a id="step4" title="<ww:property value='#session.local.a00270' />" href="javascript:addPlayMuti();"  style="width: 40px;height:30px;">
											  <img src="image/item/sc_right.png" alt="" height="30px" width="40px" />
											</a><!--添加到已选列表  -->
											
											<a title="<ww:property value='#session.local.a00025' />" href="javascript:removeit(0);" style="width: 40px;height:30px;">
											  <img src="image/item/sc_del.png" alt="" height="30px" width="40px" />
											</a><!--删除-->
										</div>
								    
								    
								    
                                    <!-- 绑定用户-->
						            <div  style="float: left;margin: 0px 0px; padding: 0px 0px;" >
						                 <table  id="dgPlay" class="easyui-datagrid"  title="<ww:property value="#session.local.b00119"  />" style="width:400px;height:390px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: true,
												method: 'get',
												onClickCell: onClickCell,
												nowrap:true	,
												selectOnCheck:false,
												checkOnSelect:false,
												sortOrder: 'asc',
											    sortName: 'uName',
											    remoteSort:false
											">
							                <thead>
								                 
								                    <tr>
								                        <th data-options="field:'ck',checkbox:true,hidden:true"></th>
														<th data-options="field:'uName',width:180"><ww:property value='#session.local.a00212'/></th><!-- 昵称 -->
														<th data-options="field:'uAccount',width:150"><ww:property value='#session.local.a00211'/></th><!-- 登陆名 -->
									        	    </tr>
							               
							                 </thead>
							                 
							              
									  
					                  </table>	           
							          
							         
								   
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
             
     
                                    
</form>

 
    
    
<script>
//$('#sortableList').sortable();
</script>
</body>
</html>
