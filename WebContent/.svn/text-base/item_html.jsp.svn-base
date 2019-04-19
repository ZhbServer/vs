<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<title></title>
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/common.css"/>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/icon.css"  />




<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/fresh.js" language="javascript"></script>

<!-- ZUI 标准版压缩后的 JavaScript 文件 -->
<script  src="zui-1.5.0-dist/dist/js/zui.min.js"></script>

<script   src="zui-1.5.0-dist/dist/lib/sortable/zui.sortable.js"></script>


<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/datagrid-dnd.js"></script>
<script type="text/javascript" src="js/constant.js"></script>

<style>
	/* 为可拖动的条目应用可移动光标类型 */
	#sortableList > .list-group-item {cursor: move}
	
	/* 为正在被拖动的条目应用半透明外观 */
	#sortableList > .list-group-item.dragging {
	  visibility: visible;
	  opacity: .3;
	}
	A{text-transform:none; text-decoration:none;}
	input {line-height: 20px;}  
</style>


<base target="_self" />

<script>
function gosubmit()
{
	var htm = document.getElementById("htm").value;
	var xy_x = document.getElementById("xy_x").value;
	var xy_y = document.getElementById("xy_y").value;   
    var width = document.getElementById("width").value;
	var height = document.getElementById("height").value;
	if(htm.length<8)
	{
            layer.msg("<ww:property value='#session.local.a00315' />");
            return false;
            
    }
	if(xy_x<0){
		
			layer.msg("<ww:property value='#session.local.a00283' />");
			return false;
			
	}
	if(xy_y<0){
		
			layer.msg("<ww:property value='#session.local.a00284' />");
			return false;
			
	}
	if(width<=0){
		
		    layer.msg("<ww:property value='#session.local.a00285' />");
		    return false;
		    
	}
	if(height<=0)
	{
		    layer.msg("<ww:property value='#session.local.a00286' />");
		    return false;
	}
  	
   return true;
}


//添加网页到网页播放列表
function add_htmllist(){
     				    
    	 //获取网页地址
		   var aHtmlUrl=$("#hurl").val();
		   if(aHtmlUrl.length==0){
			  alert("<ww:property value='#session.local.a00722' />"); //网页地址不能为空
           return;
		   }
									 		     
		   //获取切换时间
		   var aHtmlAtime=$("#htime").val();
		   if(aHtmlAtime.length==0){
			   alert("<ww:property value='#session.local.a00287' />");
			   return;
		   }
		   
		   $('#dgHtml').datagrid('appendRow',{
			   tHtmlUrl:aHtmlUrl,
			   tHtmlQtime:aHtmlAtime,
			   mShowNavigation:$('input[name="mShowNavigation"]:checked').val(),
			   mShowPCWeb:$('input[name="mShowPCWeb"]:checked').val(),
			   clientSuffix:$('input[name="clientSuffix"]:checked').val() //终端追加    
        });
        return;
      
 }
//修改编辑切换时长
function edit_qtime(sstime){
    var sstimev=document.getElementById(sstime);
    layer.prompt({
    	  title: '<ww:property value='#session.local.a00017' /><ww:property value='#session.local.a00720' />',
    	  value: sstimev.innerHTML.split('--')[1] //初始时的值，默认空字符
    	 }, function(value,index){
    		 if(!isNaN(value)){
    			 sstimev.innerHTML=sstimev.innerHTML.split('--')[0]+"--"+value+"--"+sstimev.innerHTML.split('--')[2]+"--"+sstimev.innerHTML.split('--')[3];
           		 layer.close(index); 
    		 }else{
    			 layer.msg("<ww:property value='#session.local.a00671' />");
    			 
    		 }           	
        }
     );
}
//删除项
function del_qtime(_element){
    var ssdiv=document.getElementById(_element);
    var _parentElement = ssdiv.parentNode;
    if(_parentElement){
        _parentElement.removeChild(ssdiv);
    }
}


//保存
function adhtmlto(){
	endEditingHtml();
	
	var rows = $("#dgHtml").datagrid("getRows");

   if(rows.length<1)
   {
      layer.msg("<ww:property value='#session.local.a00725'/>");
	    return;
   }

   //var sortList=document.getElementById("sortableList");
   //var sortLists=sortList.getElementsByTagName("span");
   //var spans="";
   //var count=0;
   //for(var i=0;i<sortLists.length;i++){
   //    if(spans.length==0){
   //	  spans=sortLists[i].innerHTML;
   //     }else{
   //        spans=spans+"@"+sortLists[i].innerHTML;     
   //     }
   //     count++;
   //}

     var spans="";
     for(var i=0;i<rows.length;i++)
	 {
    	 if(i==0){
    	   	
    		 spans= rows[i].tHtmlUrl+"--"+rows[i].tHtmlQtime+"--"+rows[i].mShowNavigation+"--"+rows[i].mShowPCWeb+"--"+rows[i].clientSuffix;

         }else{

        	 spans=spans+"@"+rows[i].tHtmlUrl+"--"+rows[i].tHtmlQtime+"--"+rows[i].mShowNavigation+"--"+rows[i].mShowPCWeb+"--"+rows[i].clientSuffix;
        	 
         }	     	
	 }
   

      var xy_x = document.getElementById("xy_x").value;
	  var xy_y = document.getElementById("xy_y").value;   
      var width = document.getElementById("width").value;
	  var height = document.getElementById("height").value;
	 
	  if(xy_x<0){
		  
			layer.msg("<ww:property value='#session.local.a00283' />");
			
	        return;
	   }
	  if(xy_y<0){
		  
			layer.msg("<ww:property value='#session.local.a00284' />");
	        return;
	  }
	  if(width<=0){
		  
			layer.msg("<ww:property value='#session.local.a00285' />");
	        return;
	  }
	  if(height<=0)
	  {
		  layer.msg("<ww:property value='#session.local.a00286' />");
          return;
	  } 
		
	
	  var time = document.getElementById("time").value; //刷新时间

	  var gun =  document.getElementById("gun").value;  //滚动
      
	  //var html_show=0;
	  //var chkObjs = document.getElementsByName("html_show");
	  //for(var i=0;i<chkObjs.length;i++){
	  //    if(chkObjs[i].checked){
	  //  	html_show=chkObjs[i].value;
	  //      break;
             
      //   }
      //}//制作显示


	 var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	
	 window.parent.returnValue=""; 
	 //x*y*w*h*刷新时间*滚动*网页地址--切换时间@网页地址--切换时间--显示导航栏控件--显示桌面样式网页
     window.parent.returnValue=xy_x+"*"+xy_y+"*"+width+"*"+height+"*"+time+"*"+gun+"*"+spans; 
     window.parent.layer.close(index);
   
}

function onload_html_table(){

	var sortableListSpans="<ww:property value='sortableListSpans'  />";
	
	if(sortableListSpans!=""){

        var  sortableListSpanss=sortableListSpans.split("@");
        
        for(var i=0;i<sortableListSpanss.length;i++){
        	var htmlvs=sortableListSpanss[i].split("--");
        	
        	$('#dgHtml').datagrid('appendRow',{

    			tHtmlUrl:htmlvs[0],
    			tHtmlQtime:htmlvs[1],
    			mShowNavigation:htmlvs[2],
    			mShowPCWeb:htmlvs[3],
        	  	clientSuffix:htmlvs[4]  
            });
        } 
		
	}	
	
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

</script> 
</head>
<body onload="onload_html_table()">
<form action="adhtmlto.vs"  method="post" name="form1" onsubmit="return gosubmit();">
  <div class="panel panel-primary" style="margin: 3px 3px;">
           <div class="panel-heading">
                <ww:property value="#session.local.b00026"/> <!-- 网页 -->
           </div>
           
	 <div class="container clearfix" style="margin: 10px 10px;">
          <div class="main-wrap">
		      <div class="result-wrap">
		            <div class="result-content">
		            
		            
					<table class="insert-tab" width="820px">
					    
					
					     <tr>
					            <td width="35%">
					            
					            <div class="easyui-panel" title="<ww:property value='#session.local.a00723'  />"  style="height: 280px;width:290px;margin-top:-5px;padding-top: 10px; ">
					            
					                 &nbsp;&nbsp;<ww:property value='#session.local.a00313' />:<!-- 网页地址 -->
					                    <input style="width: 200px;" type="text" id="hurl"  name="hurl" <ww:if test="htm==''">value="http://"</ww:if><ww:else>value="<ww:property value='htm'/>"</ww:else>   />
					                 <br />
					               
						             &nbsp;&nbsp;<ww:property value='#session.local.a00756'/>:
                                     <input name="mShowNavigation" value="1" type="radio"/><ww:property value='#session.local.a00232'/><!-- 是 --> &nbsp;&nbsp;
                                     <input name="mShowNavigation" checked="checked"  value="0" type="radio"/><ww:property value='#session.local.a00233'/><!-- 否 --><br />
                                     <!-- 显示导航栏控件 -->
                                     &nbsp;&nbsp;<ww:property value='#session.local.a00757'/>:
                                     <input name="mShowPCWeb"  checked="checked" value="1" type="radio"/><ww:property value='#session.local.b00044'/><!-- PC版 --> &nbsp;&nbsp;
                                     <input name="mShowPCWeb"   value="0" type="radio"/><ww:property value='#session.local.b00045'/><!-- 移动版 --><br />
                                     <!-- 网页样式 -->
                                     &nbsp;&nbsp;<ww:property value="#session.local.a00720"  />:<!--切换时间(分)-->                   
		                             <input id="htime" <ww:if test="htime==5">value="5"</ww:if><ww:else>value="<ww:property value='htime' />"</ww:else>   type="text" style="width: 80px;line-height: 20px;"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"  />
					      			
					      			<br/>	
					     			 <!-- 是否追加终端后缀 -->
                                     &nbsp;&nbsp;<ww:property value='#session.local.c00065'/>:<!--追加终端后缀-->                   
		                             <input name="clientSuffix" value="1" type="radio"/><ww:property value='#session.local.a00232'/><!-- 是 --> &nbsp;&nbsp;
                                     <input name="clientSuffix" checked="checked"  value="0" type="radio"/><ww:property value='#session.local.a00233'/><!-- 否 -->
                                     
						             
						         </div>    
                                                   
					            </td>
					            <td  style="width:65%;">
					            
					            
					            
								    <div class="part2_2 part2_2_3" style="float: left;margin-left: 0px; margin-top: 50px;width: 50px;">
								    
								            <button  onclick="add_htmllist()" class="btn btn-primary"   title="<ww:property value='#session.local.a00270' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-right " ></i>
								            
								            </button>
											
											<!--添加到已选列表  -->
											
											<button style="margin-top: 15px;" onclick="MoveUp(3)" class="btn btn-primary"   title="<ww:property value='#session.local.a00268' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-up " ></i>
								            
								            </button>
								        	
								        	<!--上移 -->
										    <button style="margin-top: 15px;" onclick="MoveDown(3)" class="btn btn-primary"   title="<ww:property value='#session.local.a00269' />"   type="button">
								            
								               <i class="icon icon-chevron-sign-down " ></i>
								            
								            </button>
								            
								            <!--下移 -->
								            <button style="margin-top: 15px;" onclick="removeit(3)" class="btn btn-primary"   title="<ww:property value='#session.local.a00025' />"   type="button">
								            
								               <i class="icon  icon-remove-sign " ></i>
								           
								            </button>
								            
											<!--删除-->
								    
								    </div>
								     
					            
					                  <div id="sortableList" style="height: 300px;padding-top: 11px;">
					  
										 <!--
										 <ww:iterator value="#request.sortableList" status="status">
										    <div id='ssdiv<ww:property value='#status.index'/>' class='list-group-item'>
										         <span id='sstime<ww:property value='#status.index'/>'><ww:property value="htmlUrl"/>--<ww:property value="htmlQtime"/>--<ww:property value="mShowNavigation"/>--<ww:property value="mShowPCWeb"/></span>
						                         <div class='btn-group' style='margin-top: 5px;margin-left: 20px;'>
								                     <button type='button' onclick="edit_qtime('sstime<ww:property value='#status.index'/>')" title='<ww:property value='#session.local.a00024'/>' class='btn'><i class='icon icon-edit'></i></button>
								                     <button type='button' onclick="del_qtime('ssdiv<ww:property value='#status.index'/>')"   title='<ww:property value='#session.local.a00025'/>' class='btn'><i class='icon icon-trash'></i></button>
						                         </div>     
						                    </div>
										 </ww:iterator>
									     -->
									     
									      <table id="dgHtml" class="easyui-datagrid"  title="<ww:property value="#session.local.a00267"  />" style="width:400px;height:275px;margin: 0px;padding: 0px;"
											data-options="
												singleSelect: true,
												toolbar: '#tbHtml',
												method: 'get',
												onClickCell: onClickCellHtml,
												nowrap:true	
											">
							                <thead>
								                    <tr>
														<th data-options="field:'tHtmlUrl',width:130"><ww:property value='#session.local.a00189'/></th>
														<th data-options="field:'tHtmlQtime',width:75,editor:'numberbox'"><ww:property value='#session.local.a00720'/></th>																																									 													
														<th data-options="field:'mShowNavigation',width:55,formatter:unitformatteronoff,
														     editor: 
                                                               { type: 'combobox', 
                                                                 options: 
                                                                        {  
                                                                           data:onoffs,
                                                                           valueField:'value',
					                                                       textField:'text',
					                                                       method:'get',
					                                                       required:true
                                                                        } 
                                                               }														
														"><ww:property value='#session.local.a00756'/></th><!-- 显示导航栏控件 -->
												        <th data-options="field:'mShowPCWeb',width:55,
												             formatter:unitformatterHtmlType,
														     editor: 
                                                               { type: 'combobox', 
                                                                 options: 
                                                                        {  
                                                                        
                                                                           data:htmlType,
                                                                           valueField:'value',
					                                                       textField:'text',
					                                                       method:'get',
					                                                       required:true
					                                                      
                                                                        } 
                                                               } 
												        "><ww:property value='#session.local.a00757'/></th><!-- 显示桌面样式网页 -->
												        
												        <th data-options="field:'clientSuffix',width:80,formatter:unitformatterclient,
														     editor: 
                                                               { type: 'combobox', 
                                                                 options: 
                                                                        {  
                                                                           data:Suffix,
                                                                           valueField:'value',
					                                                       textField:'text',
					                                                       method:'get',
					                                                       required:true
                                                                        } 
                                                               }														
														"><ww:property value='#session.local.c00065'/></th><!-- 是否追加终端 -->
									        	    </tr>
							                 </thead>
					                  </table>	               
							          <div id="tbHtml" style="height:auto;line-height: 0px;">
											<a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton"  onclick="setPlayAll(3)">
											<ww:property value='#session.local.a00753'/></a><!-- 设置所有间隔时间(分) -->
											
									  </div>
									   
									    <script type="text/javascript">

									    	var Suffix = [
							                           { "value": "0", "text": "<ww:property value='#session.local.a00233' />" },
							                           { "value": "1", "text": "<ww:property value='#session.local.a00232' />" }
										              ];  
								    	

								             var onoffs = [
								                           { "value": "0", "text": "<ww:property value='#session.local.a00233' />" },
								                           { "value": "1", "text": "<ww:property value='#session.local.a00232' />" }
											              ];  


								             var htmlType = [ 
								                              { "value": "0", "text": "<ww:property value='#session.local.b00045' />" },
									                          { "value": "1", "text": "<ww:property value='#session.local.b00044' />" }
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

								             function unitformatterclient(value, rowData, rowIndex) {
									        	  
									        	    for (var i = 0; i < Suffix.length; i++) {
									        	        if (Suffix[i].value == value) {
										        	       
										        	         return Suffix[i].text;
										        	         
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
								             
								              function unitformatterHtmlType(value, rowData, rowIndex) {
									        	  
									        	    for (var i = 0; i < htmlType.length; i++) {
									        	        if (htmlType[i].value == value) {
									        	            return htmlType[i].text;
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

								                function endEditingHtml(){
									                //alert(editIndex)
								                	if (editIndex == undefined){return true;}
									                
								        			if ($('#dgHtml').datagrid('validateRow', editIndex)){
									        			
								        				$('#dgHtml').datagrid('endEdit', editIndex);
								        				editIndex = undefined;
								        				return true;
								        				
								        				
								        			} else {
								        				return false;
								        			}
								        		}

                                               function onClickCellHtml(index, field){
                                            	  
													if (endEditingHtml()){
														$('#dgHtml').datagrid('selectRow', index)
																.datagrid('editCell', {index:index,field:field});
														editIndex = index;
													}
													
												}

							                    function removeit(type){
													if (editIndex == undefined){return;}

													var dg='';
													 if(type==1){
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



							                  //上移
							               	 function MoveUp(type) {
							                     var dg='';
							               		 if(type==1){
							                            dg='dg';
							               		 }else if(type==2){
							               			 dg='dgVideo';
							               	     }else if(type==3){
							                            dg='dgHtml';
							               		 }
							                 	 var rows = $("#"+dg).datagrid("getRows");
							                 	 if(rows.length<1)
							               	     {
							               	        return;
							               	     }
							               	     var row = $("#"+dg).datagrid('getSelected');
							               	     var index = $("#"+dg).datagrid('getRowIndex', row);
							               	     mysort(index, 'up',dg);  
							               	 }
							               	 //下移
							               	 function MoveDown(type) {
							               		 var dg='';
							               		 if(type==1){
							                            dg='dg';
							               		 }else if(type==2){
							               			 dg='dgVideo';
							               	     }else if(type==3){
							                            dg='dgHtml';
							               		 }

							               		 var rows = $("#"+dg).datagrid("getRows");
							                 	 if(rows.length<1)
							               	     {
							               	        return;
							               	     }

							               	     
							               	     var row = $("#"+dg).datagrid('getSelected');
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



							             

							            		//修改网页切换时间秒
							            		
							                 function setPlayQTimeHtmlSubmit(){
							                    
							                	 
							            		 if($('#qieHtmlAll').val().length==0){
							                         return;
							                     }

							            		 var rows=$("#dgHtml").datagrid("getRows");
							            		 
							            		 for(var i=0;i<rows.length;i++)
							            		 {
							            			   $('#dgHtml').datagrid('updateRow',{
							            		        index: i,
							            		        row: {
							            		            'tHtmlQtime':$('#qieHtmlAll').val() 
							            		        }
							            		      });

							            		 }
							            		 
							            	     $('#win-qtime-html').window('close', true); 
							                }	
										      
						                 </script>
									      
									 </div>
									    
									   
									     
								    <!-- 弹出框  网页切换时间(分)-->
								    <div id="win-qtime-html" class="easyui-window"  closed="true" title="<ww:property value='#session.local.a00753' />)" style="width:260px;height:120px;"  data-options="left:'430px',top:'180px',collapsible:false,
										minimizable:false,
										maximizable:false" >
										<div style="padding:20px 20px 10px 30px;">
											<p><input class="easyui-numberbox"  id="qieHtmlAll" type="text" style="float: left;width: 120px;" /><a style="float: right;" href="javascript:setPlayQTimeHtmlSubmit();" class="easyui-linkbutton"><ww:property value="#session.local.a00080"/></a></p>
										</div>  
								    </div>
    
    
					           </td>
					     </tr>
							 
							   <tr>
					            <td colspan="2">
					                <ww:property value='#session.local.a00202' />(<ww:property value='#session.local.a00106' />):
					                <input style="width:50px"   type="text" id="time"  name="time"   value="<ww:property value='time' />" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
					                <span>(<ww:property value='#session.local.a00316' />)</span> 
					            </td><!-- 刷新时间 -->
					            
					          </tr>
							
							   <tr style="display: none;">
					            <td colspan="2">
					                <ww:property value='#session.local.a00314' />:
					                <select id="gun" name="gun">
										<option  <ww:if test='gun==0'>selected="selected"</ww:if> value="0"><ww:property value='#session.local.a00233' /></option>
										<option  <ww:if test='gun==1'>selected="selected"</ww:if> value="1">1</option>
										<option  <ww:if test='gun==2'>selected="selected"</ww:if> value="2">2</option>
										<option  <ww:if test='gun==3'>selected="selected"</ww:if> value="3">3</option>
									</select>
					                
					            
					            </td><!-- 是否滚动 -->
					           
					          </tr>
					          <tr  style="display: none;">
					            <td>
					                X:
								   <input id="xy_x" name="xy_x" type="text" <ww:if test="xy_x==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_x' />"</ww:else>  style="width: 40px;height: 18px;" value="0"   onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
								    Y:
							       <input id="xy_y" name="xy_y" type="text" <ww:if test="xy_y==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_y' />"</ww:else> style="width: 40px;height: 20px;" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
							       <ww:property value='#session.local.a00032' />:
						           <input name="width" id="width" type="text" style="width:40px;height: 20px;" <ww:if test="width==0">value="400"</ww:if><ww:else>value="<ww:property value='width' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
						           <ww:property value='#session.local.a00033' />:
						           <input name="height" id="height" type="text" style="width:40px;height: 20px;"  <ww:if test="height==0">value="300"</ww:if><ww:else>value="<ww:property value='height' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
					            </td>
					           
					          </tr>
					          
					        
							
							   <tr>
					            <td style="padding-left: 280px;" colspan="2">
					              
					              
					              <button class="btn btn-primary" onclick='adhtmlto()' type="button"><ww:property value='#session.local.a00080' /></button>
				                 
				                  <button class="btn btn-primary" onclick='close_win_nov()' type="button"><ww:property value='#session.local.a00014' /></button>
				                 
				                 
					            </td>
					           
							   </tr>
					        </table>

            </div>
		  </div>
		</div>
    </div>	  
    
 </div>          
<input style="width:50px;"   type="hidden" id="gao"  name="gao"  value="300" />
<input type="hidden" id="sortableListSpans"  name="sortableListSpans"/>
</form>
<script>
//$('#sortableList').sortable();
</script>
</body>
</html>
