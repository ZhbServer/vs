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
<script type="text/javascript" src="js/My97DatePicker/<ww:property value='#session.local.a00000' />_WdatePicker.js"></script>
<script type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript" src="js/constant.js"></script>

<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/datagrid-dnd.js"></script>


<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />

 <script language="javascript">  
      document.onkeydown = function(e) {
          e = e || window.event;
          if(e.keyCode == 13) {
             // this.forms["form"].submit();
              //additem();
              return false;
          }
      };
</script>
        
<script type="text/javascript">

function inti_self(){

  
}


function send_date_item(){

	 

	 //获取性别
	 var sex1=0;
	 var sex2=0;
	 var sex=0;
	 if(document.getElementById("sex1").checked ==true){
		 sex1=1
		 sex=1;
	 }

	 if(document.getElementById("sex2").checked ==true){
	     sex2=2;
	     sex=2;
	 }

	 if(sex1==0&&sex2==0){
		layer.alert("<ww:property value='#session.local.b00146' />"); 
        return;
     }


     if(sex1==1&&sex2==2){
           sex=0;
     }
	 

	//获取年龄范围
	 var bage=$("#bage").val();
     var eage=$("#eage").val();

    
     //获取发布模式
	 var fbmode=0;
	 var chkObjs = document.getElementsByName("fbmode");
	 for(var i=0;i<chkObjs.length;i++){
         if(chkObjs[i].checked){
             fbmode= chkObjs[i].value;
             break;
         }
     }

     

     var protocolPlayAccurate=new Object();
     protocolPlayAccurate.sex=sex;
     protocolPlayAccurate.generation=bage+","+eage;
     protocolPlayAccurate.fbmode=fbmode;


     var json = JSON.stringify(protocolPlayAccurate);
	 
	 var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	 window.parent.returnValue=json; 
     window.parent.layer.close(index);

}



function  sendDatePlayCheckBoxChange(){

	if($("#sendDatePlayCheckBox").is(':checked')){

		$("#sendPlayTr").show();
		create_item_data(); 

    }else{
    	$("#sendPlayTr").hide(); 
    }
}

//设置所有播放次数
function setPlayAll(type){
	if(type==1){
		 $('#win-play').window('open');
	}
}


//生成数据
function create_item_data(){

        //获取素材信息
        var itemPlayNumberJson=$("#editItemDataJson").val();
        if(itemPlayNumberJson==""){
        	itemPlayNumberJson=$("#initItemDataJson").val();
        }
	     
	  
        
	    if(itemPlayNumberJson!=""){
	    	
	    	itemPlayNumberJson=itemPlayNumberJson.replace(/&quot;/g,"\"");
          //转换成touch对象组
		    var objs = eval( "(" + itemPlayNumberJson + ")" );//转换后的JSON对象
		  
		    var  obj; 
		    clearDgList();
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





</script>

</head> 
<body onload="inti_self()">

   <form  name="form1" id="form1" method="post" >
       
             <div class="panel panel-primary" style="margin: 3px 3px;">
		           <div class="panel-heading">
		                <ww:property value="#session.local.a00394"/>
		           </div>
			       <div class="container clearfix" style="margin: 10px 10px;">
			             <div class="main-wrap">
					         <div class="result-wrap">
					            <div class="result-content">
					              
					                    <table class="insert-tab" width="100%">
					                        <tbody>
					                        
					                        
					                         <tr style="height: 30px;">
					                            <th width="180"><i class="require-red">*</i><ww:property value='#session.local.a00640' />：</th>
					                            <td id="step1">
					                            
					                             
					                               <input  style="margin-top: -1px;"  type="radio" name="fbmode" checked="checked"  value="0"/><ww:property value="#session.local.a00637"/>&nbsp;<!-- 替换 -->
					                               &nbsp;&nbsp;&nbsp;
					                               <input  style="margin-top: -1px;"  type="radio" name="fbmode"    value="1"/><ww:property value="#session.local.a00636"/> <!-- 追加 -->
					                             
					                            </td>
					                          </tr>
					                          
					                          
					                         <tr style="height: 30px;">
					                            <th width="180"><i class="require-red">*</i><ww:property value='#session.local.b00142' />：</th><!-- 性别 -->
					                            <td>
					                               <input  style="margin-top: -1px;"  type="checkbox" id="sex1" name="sex1"  checked="checked"  value="1"/><ww:property value="#session.local.b00143"/> <!-- 男 -->
					                               &nbsp;&nbsp;&nbsp;
					                               <input  style="margin-top: -1px;"  type="checkbox" id="sex2" name="sex2"  value="2"/><ww:property value="#session.local.b00144"/>&nbsp;<!-- 女 -->
					                            </td>
					                          </tr>
					                           
					                            <tr>
					                                <th><i class="require-red">*</i><ww:property value='#session.local.b00141' />：</th><!-- 年龄 -->
					                                <td>
					                                                                                                        
												       <input id="bage" class="easyui-numberspinner" value="1" data-options="increment:1,min:1,max:200,required:true" style="width:80px;"></input>
												        ~
												       <input id="eage"  class="easyui-numberspinner" value="100" data-options="increment:1,min:1,max:200,required:true" style="width:80px;"></input>
						                              
					                                </td>
					                            </tr>
					                           
					                          
					                            
					                            
					                            
					                           
					                            
					                            
					                              <tr id="sendPlayTr" style="display: none;height: 300px;">
					                                <th></th>
					                                <td style="padding: 5px 0px 0px 5px;">
					                                      
					                                     <div style="float: left;">
					                                   
													         <table id="dg" class="easyui-datagrid"  title="<ww:property value='#session.local.a00246'/>" style="width:300px;height:300px;margin:0px;padding: 0px;"
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
																			<th data-options="field:'tItemName',width:200"><ww:property value='#session.local.a00255'/></th>
																			<th data-options="field:'tItemPlayNumber',width:60,editor:'numberbox'"><ww:property value='#session.local.a00585'/></th><!-- 播放次数 -->
														        	    </tr>
												                 </thead>
										                      </table>
									                      
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
										
										 
							      
											               <div id="tb" style="height:auto;line-height: 0px;">
															
																<a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="setPlayAll(1)">
																<ww:property value='#session.local.b00048'/></a><!-- 设置所有节目播放次数 -->
																	
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
						                              
					                                </td>
					                            </tr>
					                            
					                           
					                            
					                            <tr>
					                                <th></th>
					                                <td height="42px">
					                                     
					                                     <button class="btn btn-primary" onclick='send_date_item()' type="button" id="step3"><ww:property value='#session.local.a00421' /></button>
					                                     <!-- <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">-->
					                                </td>
					                            </tr>
					                        </tbody>
					                      </table>
					              
					            </div>
					        </div>
					     </div>
			         </div>
			      </div>    
			     
		   <!-- 初始化数据 -->
		   <input type="hidden" value="<ww:property value='itemPlayNumberJson' />"  id="initItemDataJson"/>
		   <!-- 修改后的数据 -->
		   <input type="hidden"   id="editItemDataJson"/>			     
   </form>
   
   
   <!-- 弹出框  播放时长(秒)-->
    <div id="win-play" class="easyui-window"  closed="true" title="<ww:property value='#session.local.a00585' />" style="width:260px;height:120px;"  data-options="left:'200px',top:'160px',collapsible:false,
		minimizable:false,
		maximizable:false" >
		<div style="padding:20px 20px 10px 30px;">
			<p><input class="easyui-numberbox"  id="playAll" type="text"  style="float: left;width: 150px;" /><a style="float: right;" href="javascript:setPlaySubmit();" class="easyui-linkbutton"><ww:property value="#session.local.a00080"/></a></p>
		</div>  
    </div>
    
    
</body>
</html>
