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
	
	if(getCookie("fbmode") == 0 || getCookie("fbmode") == 1){
		 var chkObjs = document.getElementsByName("fbmode");
	     for(var i=0;i<chkObjs.length;i++){
	         if(chkObjs[i].value == getCookie("fbmode")){
	             chkObjs[i].checked = true;
	             break;
	         }
	     }
	     
	     
	    

	 	if(getCookie("sendDateCB")=='true'){
	 		document.getElementById("sendDateCheckBox").checked = true;
	 		document.getElementById("validitySdate").value = getCookie("validitySdate");
	 		document.getElementById("validityEdate").value = getCookie("validityEdate");
	 		sendDateCheckBoxChange();
	 		
		}else{
			document.getElementById("sendDateCheckBox").checked = false;
			document.getElementById("validitySdate").value = "";
			document.getElementById("validityEdate").value = "";
		}
		
	 	if(getCookie("rememberCB")=='true'){
	 		document.getElementById("rememberCheckBox").checked = true;
	 		
		}else{
			document.getElementById("rememberCheckBox").checked = false;
		}

		
	 	if(getCookie("sendDatePlayCB")=='true'){
	 		document.getElementById("sendDatePlayCheckBox").checked = true;
	 		sendDatePlayCheckBoxChange();
		}else{
			document.getElementById("sendDatePlayCheckBox").checked = false;
		}
	 	
	 	
	 	
	 	
	};
	
	var openIntro = <%=request.getParameter("openIntro")%>;
	
	if(openIntro == '1'){
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
				element: '#step1',  
				intro: "<ww:property value='#session.local.a00906' /><span style='color:blue;'> <ww:property value='#session.local.a00640' /></span>"
			},
			{  
				element: '#sendDateCheckBox',  
				intro: "<span style='color:blue'><ww:property value='#session.local.a00865' /></span> <ww:property value='#session.local.a00907' />"
			},
			{
				element: '#validitySdate',
				intro: "<ww:property value='#session.local.a00908' /><span style='color:blue'> <ww:property value='#session.local.a00540' /></span>"
			},
			{
				element: '#validityEdate',
				intro: "<ww:property value='#session.local.a00908' /><span style='color:blue'> <ww:property value='#session.local.a00541' /></span>"
			},
			{
				element: '#step3',
				intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00394' /></span><ww:property value='#session.local.a00887' />"
			}
		  ]  
		});  

		intro.start().oncomplete(function() {  
			intro.exit();  
	    });

		intro.onexit(function() {
			layer.msg("<ww:property value='#session.local.a00864' />");
			window.parent.returnValue="close";
		});
	}
}

//判断开始日期和结束日期
function comptime(beginTime,endTime){

	 var beginTimes=beginTime.substring(0,10).split('-');
     var endTimes=endTime.substring(0,10).split('-');
     beginTime=beginTimes[1]+'-'+beginTimes[2]+'-'+beginTimes[0]+' '+beginTime.substring(10,19);
     endTime=endTimes[1]+'-'+endTimes[2]+'-'+endTimes[0]+' '+endTime.substring(10,19);
     var a =Date.parse(endTime)-Date.parse(beginTime);
     
     if(a<=0){
         return false;
     }else{
         return true;
     }
}

function send_date_item(){

	 //获取发布模式
	 var fbmode=0;
	 var chkObjs = document.getElementsByName("fbmode");
	 var sendDateCB = document.getElementById("sendDateCheckBox");
	 var sendDatePlayCB=document.getElementById("sendDatePlayCheckBox");
	 var rememberCB = document.getElementById("rememberCheckBox");
     for(var i=0;i<chkObjs.length;i++){
         if(chkObjs[i].checked){
             fbmode= chkObjs[i].value;
             break;
         }
     }
	 var validitySdate=document.getElementById("validitySdate").value;
	 var validityEdate=document.getElementById("validityEdate").value;
     var outv="";
     if(sendDateCB.checked != true){
    	 validitySdate = "";
    	 validityEdate = "";
	 }

     //构造集合对象
	 var sendPlayBasis=new Object();
	   
	 if(validitySdate==""&&validityEdate==""){
		 sendPlayBasis.fbtype=0;
		 sendPlayBasis.fbmode=fbmode;
		 sendPlayBasis.validitySdate=validitySdate;
		 sendPlayBasis.validityEdate=validityEdate;
     }else{
		
 		if(validitySdate.length!=19)
	   	{
	   	   alert("<ww:property value='#session.local.a00542' />");
	   	   return;
	   	} 
	   	if(validityEdate.length!=19)
	   	{
	   		     layer.alert("<ww:property value='#session.local.a00543' />");
	   		     return;
	   	} 
	   	if(!comptime(validitySdate,validityEdate))
	    {
	   		layer.alert("<ww:property value='#session.local.a00544' />");
	   			 return;
	    }
	   	//outv=fbmode+"_"+validitySdate+"_"+validityEdate;
	   	 
		
	   	sendPlayBasis.fbmode=fbmode;
	    sendPlayBasis.fbtype=1;
	   	sendPlayBasis.validitySdate=validitySdate;
	   	sendPlayBasis.validityEdate=validityEdate;
 
	 }

	  //判断播放列表是否启用
	  
	 if($("#sendDatePlayCheckBox").is(':checked')){

		   var rows=$("#dg").datagrid("getRows");

		   if(rows.length==0){
			     layer.msg("<ww:property value='#session.local.a00415'/>");  
	             return;
		   }
		   
		   //构造集合对象
	  	  
		   var itemPlayList= new Array();
		   endEditing();
		   for(var i=0;i<rows.length;i++)
	 	   {
		 	 
			   var itemPlay = new Object();
			   itemPlay.name=rows[i].tItemName;
			   itemPlay.id=rows[i].ck;
			   itemPlay.playNumber=rows[i].tItemPlayNumber;
			   itemPlayList[i]=itemPlay;
			  
			   
	 	   }
		   
		   //var json = JSON.stringify(itemPlayList);
		   sendPlayBasis.itemPlayList=itemPlayList;

	 }else{

		 //获取初始化数据
		 var itemPlayNumberJson=itemPlayNumberJson=$("#initItemDataJson").val();
		 if(itemPlayNumberJson!=""){
		    	
		    	itemPlayNumberJson=itemPlayNumberJson.replace(/&quot;/g,"\"");
	            //转换成touch对象组
			    var objs = eval( "(" + itemPlayNumberJson + ")" );//转换后的JSON对象
			    sendPlayBasis.itemPlayList=objs;

		 }		    
		 
	    
	 }
	 

	 if(rememberCB.checked == true){
		
		 
		sendDateCB = document.getElementById("sendDateCheckBox");
		sendDatePlayCB=document.getElementById("sendDatePlayCheckBox");
		rememberCB = document.getElementById("rememberCheckBox");

		
		 setCookie("fbmode",fbmode);
         setCookie("sendDateCB",sendDateCB.checked);
		 setCookie("sendDatePlayCB",sendDatePlayCB.checked);
		 setCookie("rememberCB",rememberCB.checked);
		 setCookie("validitySdate",validitySdate);
		 setCookie("validityEdate",validityEdate);
	 }else{
		 setCookie("fbmode",null);
		 setCookie("sendDateCB",null);
		 setCookie("rememberCB",null);
		 setCookie("validitySdate",null);
		 setCookie("validityEdate",null);
		 setCookie("sendDatePlayCB",null);
	 }

	 
	 if("<ww:property value='#session.urid'/>"==1){
		 
	 }else{
		 
		 
		 if("<ww:property value='#session.itemsendAdd'/>"==0&&"<ww:property value='#session.itemsendReplace'/>"==0){
			    
		   		layer.alert("<ww:property value='#session.local.a00054'/>");
		   		return;
		  }
		 
	 }
		  
     
	 var json = JSON.stringify(sendPlayBasis);
	 
	 var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	 window.parent.returnValue=json; 
     window.parent.layer.close(index);
}

function  sendDateCheckBoxChange(){

	if($("#sendDateCheckBox").is(':checked')){

		$("#sendTimesTr").show(); 

    }else{
    	$("#sendTimesTr").hide(); 
    }
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
					                          
					                             <ww:if test="#session.itemsendAdd==1||#session.urid==1||#session.powerId==1">
						                              <span>
						                                 <input  style="margin-top: -1px;"  type="radio" name="fbmode"  checked="checked"  value="1"/><ww:property value="#session.local.a00636"/> <!-- 追加 -->
						                              </span>
					                              </ww:if>
					                              &nbsp;&nbsp;&nbsp;
					                              <ww:if test="#session.itemsendReplace==1||#session.urid==1||#session.powerId==1">
						                              <span> 
						                                 <input  style="margin-top: -1px;"  type="radio" name="fbmode"  value="0"/><ww:property value="#session.local.a00637"/>&nbsp;<!-- 替换 -->
						                              </span> 
					                              </ww:if> 
					                            </td>
					                          </tr>
					                           
					                          <tr>
					                                <th><i class="require-red"></i><ww:property value='#session.local.a00851' />：</th>
					                                <td>
					                                                                                                        
												        <input  style="margin-top: -2px;" type="checkbox" value="1"  id="rememberCheckBox"/>
												        &nbsp;&nbsp;<span><ww:property value='#session.local.a00766' /></span>
						                              
					                                </td>
					                            </tr>
					                           
					                             <tr>
					                                <th><i class="require-red"></i><ww:property value='#session.local.a00641' />：</th>
					                                <td>
					                               
												        <input  style="margin-top: -2px;" type="checkbox" onchange="sendDateCheckBoxChange()"  value="1"  id="sendDateCheckBox"/>
												        &nbsp;&nbsp;<span><ww:property value='#session.local.a00766' /></span>
						                              
					                                </td>
					                            </tr>
					                            
					                           
					                           <tr id="sendTimesTr" style="display: none;">
					                                <th><i class="require-red"></i><ww:property value='#session.local.a00292' />：</th>
					                                <td>
					                               
												       <ww:property value="#session.local.a00540" />:
												       <input id="validitySdate" type="text" name="validitySdate"  style="height: 22px;width: 180px;"    onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
												      
												       <br/>
						                               <ww:property value="#session.local.a00541"/>:
						                               <input id="validityEdate" type="text" name="validityEdate"  style="height: 22px;width: 180px;"   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
						                              
					                                </td>
					                            </tr>
					                            
					                            
					                            
					                             <tr>
					                                <th><i class="require-red"></i><ww:property value='#session.local.b00049' />：</th>
					                                <td>
					                               
												        <input  style="margin-top: -2px;" type="checkbox" onchange="sendDatePlayCheckBoxChange()"  value="1"  id="sendDatePlayCheckBox"/>
												        &nbsp;&nbsp;<span><ww:property value='#session.local.a00766' /></span>
						                              
					                                </td>
					                            </tr>
					                            
					                            
					                              <tr id="sendPlayTr" style="display: none;height: 300px;">
					                                <th></th>
					                                <td style="padding:5px 0px 0px 5px;">
					                                      
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
