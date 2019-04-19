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
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/icon.css"  />

<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/easyuiLocal.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/util.js"></script>
<script src="js/jscolor.js"></script> 


<script   src="zui-1.5.0-dist/dist/lib/sortable/zui.sortable.js"></script>

<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/datagrid-dnd.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/treegrid-dnd.js"></script>

<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />

<style type="">
    

</style>
<script type="text/javascript">



 //初始化数据集
  var currentdiv;
 
	  
    $(function(){

	  //ajax请求获取数据
	 ajaxGetSucaiData(0,"","scGroupComboboxImg",4,"dgImg");


	 $("input:radio[name='mType']").click(function(){
		 

		   if($(this).val()==0){

                 $("#upImgIcon").show();

                 
                 $('#mUrlName').attr("readonly","readonly")//将input元素设置为readonly 　　

                 $("#trUpType").hide();
                 $("#trUpTime").hide();
                 
                 
		   }else if($(this).val()==1){


			     $("#upImgIcon").hide();

			     $('#mUrlName').removeAttr("readonly");//去除input元素的readonly属性 　

			     $("#trUpType").show();
                 $("#trUpTime").show();　 
           }
     });


	 $("input:radio[name='upType']").click(function(){
		 

		   if($(this).val()==0){

			     $("#trUpTime").show();　 
               
               
		   }else if($(this).val()==-1){


                 $("#trUpTime").hide();　 
         }
    });
	   
	 
	  
	   

    });


	//ajax请求获取素材数据   urlType 方式  0普通 1搜索 , urlSelValue 搜索关键词, scGroupId分组ID名    ,scType类型 , scTableGridId grid显示id 
	function ajaxGetSucaiData(urlType,urlSelValue,scGroupId,scType,scTableGridId){

	    	  //分组id
		      var myOptValue = $("#"+scGroupId).combobox("getValue") ;

	          //拼接data
	          var aJaxUrlData="";
	          if(urlType==0){
	        	  aJaxUrlData="id=1&checkAjaxState=1"+"&gssi.sucaigroupid="+myOptValue+"&sucai.type="+scType;
	          }else if(urlType==1){
	              
	        	  aJaxUrlData="id=1&checkAjaxState=1&sel=1&ser="+urlSelValue+"&gssi.sucaigroupid="+myOptValue+"&sucai.type="+scType;
	          }
	    	 
	 	   
	 	     //ajax请求获取数据
	         $.ajax({
					type:'post',
					url:'ajaxToItemSeeSucaiAction.vs',
					data:aJaxUrlData,
					dataType:'json',
					async:true,
					cache:true,
					success:function(data){
				       
		                //清空列表
		 	    	   //clearDgList(scTableGridId);
		 	    	  //隐藏鼠标悬浮
			    	   $("#preview").hide(); 


			    	   $('#'+scTableGridId).datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(4,2,null,data));
			    	   
	 			       onMousePreView();
		    	    	   
			
					}
				});	

	    }

		//清空素材列表数据
	    function clearDgList(gridName){
	  	 
	        var sucais = $('#'+gridName).datagrid('getRows');
	        if (sucais) {
	             for (var i = sucais.length - 1; i >= 0; i--) {
	                 var index = $('#'+gridName).datagrid('getRowIndex', sucais[i]);
	                 $('#'+gridName).datagrid('deleteRow', index);
	                 
	             }
	        }

	    }



		 /*加到列表事件图片*/
		 function addTouchMuti(type){
			var selRows=new Array();
			if(type==1){

				   //获取素材列表已选
		    	  selRows = $('#dgImg').datagrid('getChecked');
		    	 
		    	  $('#dgImg').datagrid('clearSelections');

		    }else if(type==2){
		    	
		    	  selRows = $('#dgScVideo').datagrid('getChecked');
		    	  $('#dgScVideo').datagrid('clearSelections');
		    	
			}
		   

		    for(var i=0;i<selRows.length;i++){
		    {
		 	 
		          if(type==1){
		        	  clearDgList("dg");
		        	  //创建tr
			          $('#dg').datagrid('appendRow',{
			        	   tScName:selRows[i].tScName,
			        	  
			        	   tScFileName:selRows[i].tScFileName
		               });

			      }else if(type==2){

			    	//创建tr
			          $('#dgVideo').datagrid('appendRow',{
			        	   tScNameVideo:selRows[i].tScName,
			        	   tScFileNameVideo:selRows[i].tScFileName,
			        	   tScVol:'100'
		               });
			       
	              }
				  //$('#dg').datagrid('acceptChanges');
		          //$('#dg').datagrid('enableDnd');	          
		      }
		      onMousePreView();
		         
		    }
		 }


		  function removeDg(type){
				if (editIndex == undefined){return;}

				var dg='';
				 if(type==1){
		             dg='dg';
				 }else if(type==2){
					 dg='dgVideo';
			     }else if(type==3){
		             dg='dgHtml';
				 }else if(type==4){
                  dg='dgPlaySucai';
				 }

			     
				var rows=$("#"+dg).datagrid("getRows");
			
				
				$('#'+dg).datagrid('cancelEdit', editIndex)
						.datagrid('deleteRow', editIndex);
				editIndex = undefined;
			}


 




function save() {

    //获取参数信息
    var title=$("#title").val();

    if(title==""){
    	layer.msg("<ww:property value='#session.local.a00545'/>");
    	return;
    }

    var l=$("#l").val();
    var t=$("#t").val();
    var w=$("#w").val();
    var h=$("#h").val();

    if(l==""||t==""||w==""||h==""){
    	layer.msg("<ww:property value='#session.local.b00215'/><ww:property value='#session.local.a00691'/>");
    	return;
    }

    if(!checkValNumber(l)||!checkValNumber(t)||!checkValNumber(w)||!checkValNumber(h)){
   	     layer.msg("<ww:property value='#session.local.b00215'/><ww:property value='#session.local.a00671'/>");
    	 return;
    }
    

    var mUrlName=$("#mUrlName").val();

    if(mUrlName==""){
    	layer.msg("<ww:property value='#session.local.b00218'/><ww:property value='#session.local.a00691'/>");
    	return;
    }

    var mType=$("input:radio[name='mType']:checked").val();
    
    var upType=$("input:radio[name='upType']:checked").val();
 
    if(mType==1&&upType==0){

    	 $("#mUrl").val(mUrlName)
    	
    	 var mTimeout=$("#mTimeout").val();

    	 if(mTimeout==""){
    		    layer.msg("<ww:property value='#session.local.b00218'/><ww:property value='#session.local.a00202'/>");
    	    	return;
         }

         if(!checkValNumber(mTimeout)){
        	 layer.msg("<ww:property value='#session.local.a00202'/><ww:property value='#session.local.a00671'/>");
 	    	 return;
         }

         

    }else if(mType==1&&upType==-1){
        
    	 $("#mUrl").val(mUrlName);
    	 
    	 $("#mTimeout").val(-1);

    }

   
    

    document.form1.action="uptb.vs";
	document.form1.submit();
}

function closeDig(){
	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
    window.parent.layer.close(index);
}



//鼠标悬浮预览绑定
function onMousePreView(){
	 $(".datagrid-row").mouseover(function(){  
	              
	            var e = event || window.event;       
	  	        var url = $(this).children("td").eq(2).text();

	  	       
	  	       
	  	        if(url.indexOf(".jpg")!=-1||url.indexOf(".png")!=-1||url.indexOf(".gif")!=-1){
	  	        	
	 			       
	 			    
	  	        }else{
		  	      
		  	       if(url==""||url=="1"||url=="2"){
		  	    	   url="";
			  	   }else{

			  		 var ind=url.lastIndexOf(".");
	 				 var ads=url.substring(0,ind);
	 			     url=ads+'_.jpg';
				   }
		  	     
                   
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

</script>

</head> 
<body>

   <form  name="form1" method="post" >
       <div class="container clearfix" style="margin: 50px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		              
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                         
		                         <tr>
		                            <!-- 标题 -->
		                            <th width="150"><i class="require-red">*</i><ww:property value='#session.local.a00536' />:</th>
		                            <td>
		                               <input  name="title" id="title" id="title"  type="text"/>
		                            </td>
		                          </tr>
		                         <tr>
		                         
		                         <tr>
		                            <!-- 位置 -->
		                            <th><i class="require-red">*</i><ww:property value='#session.local.b00215' />:</th>
		                            <td>
		                                
		                                <!-- left -->
		                                left:
		                                <input type="text" id="l" name="l" style="width: 80px;"/>
		                                
		                                <!-- top -->
		                                top:
		                                <input type="text" id="t" name="t"  style="width: 80px;"/>
		                                
		                                <!-- width -->
		                                <ww:property value="#session.local.a00032"/>
		                                <input type="text" id="w" name="w" style="width: 80px;"/>
		                                
		                                <!-- height -->
		                                <ww:property value="#session.local.a00033"/>
		                                <input type="text" id="h" name="h"  style="width: 80px;"/>
		                                
		                                
		                            
		                            </td>
		                          </tr>
		                          
		                          
		                           <tr>
		                            <!-- 类型 -->
		                            <th><i class="require-red">*</i><ww:property value='#session.local.a00035' />:</th>
		                            <td>
		                                <!-- 图片 -->  
		                                <ww:property value="#session.local.a00061"/>
		                                <input name="mType" value="0" type="radio" checked="checked"/>
		                                <!-- 网址 -->  
		                                <ww:property value="#session.local.a00189"/>
		                                <input name="mType" value="1"  type="radio"/>
		                                 
		                            </td>
		                          </tr>
		                         <tr>
		                         
		                         
		                           <tr>
		                            <!-- 播放地址/图片 -->
		                            <th><i class="require-red">*</i><ww:property value='#session.local.b00218' />:</th>
		                            <td>
		                               <input type="text" name="mUrlName" id="mUrlName" readonly="readonly" />
		                               <input  type="hidden" name="mUrl" id="mUrl"/>
		                               <i id="upImgIcon" onclick="setPlayAll()" style="cursor: pointer;" title="<ww:property value='#session.local.a00021' />"  class="icon icon-plus-sign"></i>
		                               
		                               <script>

                                          //radio 点击事件

		                               
		                      		      //弹出添加素材
		                      		      function setPlayAll(){
		                      			
		                      		           $('#win-resourceEvent').window('open');

		                      		       }

		                    			  function setPathSubmit(type){

		                    				  if(type==1){
		                    					   //获取选择列表信息
		                    					   var rows=$("#dg").datagrid("getRows");

		                    					   var imgNameInput;
		                    					   var imgFileInput;
		                    					   if(rows.length==0){
		                    					         //layer.msg("<ww:property value='#session.local.a00282'/>");  
		                    				             //return;
		                    						   imgNameInput="";
		                    						   imgFileInput="";
		                    					   }else{
		                    						   imgNameInput=rows[0].tScName;
		                    						   imgFileInput=rows[0].tScFileName;

		                    					   }  

		                    			           $("#mUrlName").val(imgNameInput); 

		                    			           $("#mUrl").val(imgFileInput);
		                    					   
		                    					   $('#win-resourceEvent').window('close', true); 

		                    				  }else if(type==2){
		                    					   var rows=$("#dgVideo").datagrid("getRows");

		                    					   if(rows.length==0){
		                    						     //layer.msg("<ww:property value='#session.local.a00282'/>");  
		                    				             //return;
		                    						   clearDgList("dgPlaySucai");
		                    					   }else{

		                    						   for(var i=0;i<rows.length;i++){
		                    							      //创建tr
		                    						          $('#dgPlaySucai').datagrid('appendRow',{
		                    						        	   tScNameVideo:rows[i].tScNameVideo,
		                    						        	   tScFileNameVideo:rows[i].tScFileNameVideo,
		                    						        	   tScVol:'100'
		                    					               });
		                    						   }
		                    						  clearDgList("dgVideo");

		                    					   }  

		                    					  
		                    					  $('#win-resourcePlay').window('close', true); 
		                    				  }

		                                      

		                    			  }	
		                    		                      		       
		                               
		                               </script>
		                            </td>
		                          </tr>
		                         <tr>
		                         
		                         <tr id="trUpType" style="display: none;">
		                            <!-- 刷新方式 -->
		                            <th><i class="require-red">*</i><ww:property value='#session.local.b00213' />:</th>
		                            <td>
		                                 <!--时间 -->  
		                                <ww:property value="#session.local.a00248"/>
		                                <input name="upType"  value="0" type="radio" checked="checked"/>
		                                <!-- IO口-->  
		                                <ww:property value="#session.local.b00214"/>
		                                <input name="upType"  value="-1"  type="radio"/>
		                            </td>
		                          </tr>
		                         <tr>
		                         
		                         <tr id="trUpTime" style="display: none;">
		                            <!-- 刷新时间 -->
		                            <th><i class="require-red">*</i><ww:property value='#session.local.a00202' />:</th>
		                            <td>
		                               <input  id="mTimeout" name="mTimeout"   type="text"/>
		                            </td>
		                          </tr>
		                         <tr>
		                         
		                         
		                         
		                         
		                         <tr>
		                         
		                         <tr>
		                                <td colspan="3"  >
		                                    <button  style="margin-left: 380px;" class="btn btn-primary" type="button"  onclick="save()"><ww:property value='#session.local.a00080' /></button>
		                                    <button class="btn btn-primary" onclick="closeDig()" type="button"><ww:property value='#session.local.a00014' /></button>
		                                </td>
		                         </tr>
		                       </tbody>
		                   </table>
		              
		            </div>
		        </div>
		     </div>
  
   </div>
       
       
       
       
<input type="hidden" value="<ww:property value='clientids'/>" name="clientids"  id="clientids" />     <!-- 终端ids -->
<input type="hidden" value="<ww:property value='cgids'/>" name="cgids" id="cgids"/>                   <!-- 终端分组ids -->
      
    
   </form>
   
   
     <!-- 弹出框 事件 选择素材-->
  <div id="win-resourceEvent" class="easyui-window"  closed="true" title="<ww:property value='#session.local.a00330' />" style="width:850px;height:400px;"  data-options="left:'70px',top:'30px',collapsible:false,
			minimizable:false,
			maximizable:false" >
     
                <div id="targetDivContentImg" style="padding-top: 10px;padding-left: 20px;">
			                        <div id="targetDivContentImgLeft" class="am_right scrollbar-hover" style="height: 300px;width:350px;float: left;">
                                          <table id="dgImg" class="easyui-datagrid"  title="<ww:property value='#session.local.b00017'/>" style="width:350px;height:280px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: true,
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
			                              
			                              <div id="tb0" style="height:auto;line-height: 0px;">
												
												<div>
													<ww:property value='#session.local.b00014'  />:<!-- 分组 --> 
													<select  id="scGroupComboboxImg"  class="easyui-combobox" panelHeight="auto" style="width:100px;height: 20px;">
														<option <ww:if test="gssi.sucaigroupid==0">selected="selected" </ww:if>  value="0"><ww:property value='#session.local.a00815'  /></option> <!-- 全部 -->
														<option <ww:if test="gssi.sucaigroupid==-1">selected="selected" </ww:if>  value="-1"><ww:property value='#session.local.b00015'  /></option><!-- 共享 -->
														<ww:iterator value="listsfgpimg">
														       <option  <ww:if test="gssi.sucaigroupid==id">selected="selected" </ww:if>  value="<ww:property value='id'  />"><ww:property value="name"  /></option>
														</ww:iterator>
													</select>
													<input id="ser" class="easyui-searchbox" data-options="prompt:'<ww:property value='#session.local.a00071'  />',searcher:doSearchImg" style="width:100px;height: 20px;"></input>
													
<!--													<a style="height: 20px;" title="<ww:property value='#session.local.a00063' />" href="javascript:open_item_sucai_onload('upimg.jsp')" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick=""></a>-->
	
													<script>
													    //分组combobox事件
													    $("#scGroupComboboxImg").combobox({
													    	onChange : function(){
													    	    
													    		  //ajax请求获取数据
													              ajaxGetSucaiData(0,"","scGroupComboboxImg",4,"dgImg");												    	   
													    	}
														}); 

													    //搜索
														function doSearchImg(value,name){

															    ajaxGetSucaiData(1,value,"scGroupComboboxImg",4,"dgImg");
															 
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
												</div>
										   </div>
                                          
                                          
                                          

                                    </div>
			                       
								    <div class="part2_2 part2_2_3" style="float: left;margin-right: 0px; margin-top: 80px;width: 50px;">
										
											
											<a title="<ww:property value='#session.local.a00270' />" href="javascript:addTouchMuti(1);"  style="width: 40px;height:30px;">
											  <img src="image/item/sc_right.png" alt="" height="30px" width="40px" />
											</a>  <!-- 添加到已选列表 -->
											
											<a title="<ww:property value='#session.local.a00025' />" href="javascript:removeit(1);" style="width: 40px;height:30px;">
											     <img src="image/item/sc_del.png" alt="" height="30px" width="40px" />
											</a>  <!-- 删除 -->
											
											
								    </div>
								    
								    
								    
                                    <!-- 已选图片 -->
						            <div style="float: left;margin: 0px 0px; padding: 0px 0px;" >
						                 <table id="dg" class="easyui-datagrid"  title="<ww:property value="#session.local.a00267"  />" style="width:400px;height:300px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: true,
												method: 'get',
												onClickCell: onClickCell,
												nowrap:true	
											">
							                <thead>
								                    <tr>
								                        <th data-options="field:'ck',checkbox:true,hidden:true"></th>
														<th data-options="field:'tScName',width:350"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
														<th data-options="field:'tScFileName',hidden:true"></th>												
                                                    </tr>
							                 </thead>
					                  </table>	           
							         
								   
						           </div>
			                 </div>
			                 <div style="padding:20px 20px 10px 380px;">
		                           <p>		                           
		                                <button  class="btn btn-sm btn-primary " onclick='setPathSubmit(1)' type="button"><ww:property value='#session.local.a00080' /></button>
		                           </p>
			
		                     </div>  
			                 
        </div>
        
        
       <!-- 预览显示 -->           
	   <div   id="preview"  style="position: absolute;display: none;z-index: 9999;">
	           <img  id="show_img" src=""  height="100px"  width="150px" />   
       </div>
        
        
</body>
</html>
