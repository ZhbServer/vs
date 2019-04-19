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

   
    function savaSubmit(){

             //计划id 
        	 var jhid = $("#jhid").val(); 

        	 //获取节点
        	 var sdate=$("#sdate").val();

        	 
        	 //周期  
             var day=$("#day").val(); 

             if(day==null){
            	 layer.alert("<ww:property value='#session.local.b00316' />");    
            	 return;
             }
             
             $.ajax({
				type:'post',
				url:'adjhdp.vs',
				data:"jhid="+jhid+"&sdate="+sdate+"&day="+day,
				dataType:'json',
				async:true,
				cache:true,
				success:function(data){

            		var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
					window.parent.returnValue=day; 
			        window.parent.layer.close(index);
			        
                }
	  		});
         
    }

	  
  
</script>
</head>

<body>

    <form method="post" name="form1" action="">
       <div class="panel panel-primary" style="margin: 3px 3px;">
           <div class="panel-heading">
                <ww:property value="#session.local.b00313"/> <!-- 添加节点 -->
           </div>
          <div class="container clearfix" style="margin: 10px 10px;">
		
          <div class="main-wrap" style="width:900px;height:380px;">
		      <div class="result-wrap">
		          <div class="result-content">
		            
		            <table class="insert-tab" width="100%">
						    
						     <tbody>
			                      <tr>
						                <th><i class="require-red">*</i><ww:property value="#session.local.a00493" />:</th>
		                                <td>
		                                   <!-- 周期 -->
										   <select name="day" id="day" style="width: 60px;" >
											     
											      <ww:iterator value="cycles">
											          <option value="<ww:property value='cycleValue' />"><ww:property value='cycleName' /></option>
											      </ww:iterator>
                                                   <!--<option value="8"><ww:property value="#session.local.a00483" /></option>-->
                                                   <!--<option value="1"><ww:property value="#session.local.a00475" /></option>-->
                                                   <!--<option value="2"><ww:property value="#session.local.a00476" /></option>-->
                                                   <!--<option value="3"><ww:property value="#session.local.a00478" /></option>-->
                                                   <!--<option value="4"><ww:property value="#session.local.a00479" /></option>-->
                                                   <!--<option value="5"><ww:property value="#session.local.a00480" /></option>-->
                                                   <!--<option value="6"><ww:property value="#session.local.a00481" /></option>-->
                                                   <!--<option value="7"><ww:property value="#session.local.a00482" /></option>-->
										   </select> 
										</td>
						            </tr>
						            
						            
						            <tr>
						                <th><i class="require-red">*</i><ww:property value="#session.local.b00312" />:</th>
		                                <td>
		                                   <!-- 节点 -->
										   <select name="sdate" id="sdate" style="width: 60px;" >
											   <option value="1">1</option>
											   <option value="2">2</option>
											   <option value="3">3</option>
											   <option value="4">4</option>
											   <option value="5">5</option>
											   <option value="6">6</option>
											   <option value="10">10</option>
											   <option value="12">12</option>
											   <option value="15">15</option>
											   <option value="20">20</option>
											   <option value="30">30</option>
											   <option value="60">60</option>
											   
										   </select> 
										</td>
						            </tr>
						            
						             <tr>
						                <th></th>
		                                <td>
		                                
		                                   <span style="color: red;">
											     <!--节点数按照 一个小时分钟数平分(如节点为5，一个小时分为5段 每段12分钟 ) -->
											     <ww:property value="#session.local.b00314"/>      
										   </span> 
										   
										</td>
						            </tr>
						            
						                            
						                        
		                            <tr style="height: 40px;">
		                                <th></th>
		                                <td>
		                                   <!-- <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">-->
		                                   <button class="btn btn-primary" style="margin-left:20px;" onclick='savaSubmit()' type="button"><ww:property value='#session.local.a00080' /></button>
                                           <button class="btn btn-primary" style="margin-left:20px;" onclick='close_win_nov()' type="button"><ww:property value='#session.local.a00014' /></button>
		                                </td>
		                            </tr>
						          </tbody>
						       </table>
						                    
						                     
		    
                  </div>
		  </div>
		</div>
        </div>
     
       </div> 	        
	
       	<!--计划id-->
		<input type="hidden" name="jhid"  id="jhid" value="<ww:property value='jhid'/>" />
        <!--计划类型-->
		<input type="hidden" name="jhtype"  id="jhtype" value="<ww:property value='jhtype'/>" />
             
       
</form>
</body>
</html>
