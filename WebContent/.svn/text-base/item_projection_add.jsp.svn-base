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



function save() {

    //获取参数信息
    var title=$("#title").val();

    if(title==""){
    	layer.msg("<ww:property value='#session.local.a00545'/>");
    	return;
    }
    //开机协议
    var pOn=$("#pOn").val();
    if(pOn==""){
    	layer.msg("<ww:property value='#session.local.b00279'/><ww:property value='#session.local.a00691'/>");
    	return;
    }
   
    pOn=pOn.replace(/\s+/g,"");
    $("#pOn").val(pOn);
   
    if(pOn.length%2==0){

    }else{

    	layer.alert("<ww:property value='#session.local.b00285'/>1");
    	return;
        
    }
   

    //开机确认协议
    var pOnConfirm=$("#pOnConfirm").val();
    
    if(pOnConfirm==""){
    	
    }else{

    	    pOnConfirm=pOnConfirm.replace(/\s+/g,"");
    	    $("#pOnConfirm").val(pOnConfirm);
    	    if(pOnConfirm.length%2==0){

    	    }else{

    	    	layer.alert("<ww:property value='#session.local.b00285'/>2");
    	    	return;
    	        
    	    } 
    	   

    }


    //关机协议
    var pOff=$("#pOff").val();
    if(pOff==""){
    	layer.msg("<ww:property value='#session.local.b00281'/><ww:property value='#session.local.a00691'/>");
    	return;
    }


    pOff=pOff.replace(/\s+/g,"");
    $("#pOff").val(pOff);
    if(pOff.length%2==0){

    }else{

    	layer.alert("<ww:property value='#session.local.b00285'/>3");
    	return;
        
    }
    



    //关机确认协议
    var pOffConfirm=$("#pOffConfirm").val();
    
    if(pOffConfirm==""){
    	
    }else{

    	    pOffConfirm=pOffConfirm.replace(/\s+/g,"");
    	    $("#pOffConfirm").val(pOffConfirm); 
    	    if(pOffConfirm.length%2==0){

    	    }else{

    	    	layer.alert("<ww:property value='#session.local.b00285'/>4");
    	    	return;    	        
    	    }
    }
    
    document.form1.action="adprojection.vs";
	document.form1.submit();
}

function closeDig(){
	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
    window.parent.layer.close(index);
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
			                            <th width="350"><i class="require-red">*</i><ww:property value='#session.local.a00536' />:</th>
			                            <td>
			                                 <input  name="pt.title" id="title"  type="text"  value="<ww:property value='editPt.title'/>"  />
			                            </td>
		                          </tr>
		                          
		                          <tr>
			                             <!-- 开机协议 -->
			                            <th width="150"><i class="require-red">*</i><ww:property value='#session.local.b00279' />:</th>
			                            <td>
			                                 <input  name="pt.pOn" id="pOn"  type="text"  value="<ww:property value='editPt.pOn'/>" />
			                            </td>
		                          </tr>
		                          
		                          <tr>
			                             <!-- 开机确认协议 -->
			                            <th width="150"><ww:property value='#session.local.b00280' />:</th>
			                            <td>
			                                 <input  name="pt.pOnConfirm" id="pOnConfirm"  type="text"   value="<ww:property value='editPt.pOnConfirm'/>"  />
			                            </td>
		                          </tr>
		                          
		                           <tr>
			                             <!-- 关机协议 -->
			                            <th width="150"><i class="require-red">*</i><ww:property value='#session.local.b00281' />:</th>
			                            <td>
			                               <input  name="pt.pOff" id="pOff"  type="text"  value="<ww:property value='editPt.pOff'/>" />
			                            </td>
		                           </tr>
		                          
		                          
		                          <tr>
			                             <!-- 关机确认协议 -->
			                            <th width="150"><ww:property value='#session.local.b00282' />:</th>
			                            <td>
			                               <input  name="pt.pOffConfirm" id="pOffConfirm"  type="text"   value="<ww:property value='editPt.pOffConfirm'/>"  />
			                            </td>
		                          </tr>
		                        
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
       
      <input  type="hidden"  name="pt.id"    value="<ww:property value='editPt.id'/>"/>
    
   </form>
   
   
   
        
        
   
        
</body>
</html>
