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
<script type="text/javascript">

function addfbl(){
	   var fblname_var=document.getElementById('fblname').value;
	   var fblx_var=document.getElementById('fblx').value;
	   var fbly_var=document.getElementById('fbly').value;

       if(trim(fblname_var).length==0||trim(fblx_var).length==0||trim(fbly_var).length==0){

    	   layer.msg("<ww:property value='#session.local.a00182' />");
    	   return;
       }
       if(isNaN(fblx_var)||isNaN(fbly_var)){

    	   layer.msg("<ww:property value='#session.local.a00183' />");
    	   return;
       }
       if(fblx_var < 0 || fbly_var < 0){
    	   layer.msg("<ww:property value='#session.local.a00183' />");
		   return;
       }
   	   document.form1.target = "_self";
   	   document.form1.action = 'addfbl.vs'; 
   	   document.form1.submit();
             
    
       

	   
}



//去左右空格;
function trim(s){
    return s.replace(/(^\s*)|(\s*$)/g, "");
}

</script>

</head> 
<body>
   <form  name="form1" method="post" >
   
      <div class="panel panel-primary" style="margin: 3px 3px;border: 0px;">
           <div class="panel-heading">
                <ww:property value="#session.local.a00174"/> <!-- 新增分辨率-->
           </div>
   
          <div class="container clearfix" style="margin: 20px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		              
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                         <tr>
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00133' />：</th>
		                            <td>
		                               <input class="common-text required"  style="height: 20px;line-height: 20px;"  id="fblname" name="fbl.name"   type="text"/>
		                            </td>
		                          </tr>
		                            <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00032' />：</th>
		                                <td>
		                                     <input  class="common-text required" style="height: 20px;line-height: 20px;"  id="fblx" name="fbl.tx" value=""  type="text"/>
		                                </td>
		                            </tr>
		                           <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00033' />：</th>
		                                <td>
		                                     <input  class="common-text required" id="fbly"  style="height: 20px;line-height: 20px;" name="fbl.ty"  value=""  type="text"/>
		                                </td>
		                            </tr>

		                            <tr style="height: 40px;">
		                                <th></th>
		                                <td>
		                                    
		                                    <button class="btn btn-primary" onclick='addfbl()' type="button"><ww:property value='#session.local.a00080' /></button>
		                                     <!-- <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">-->
		                                </td>
		                            </tr>
		                        </tbody></table>
		              
		            </div>
		        </div>
		     </div>
  
       </div>
 
      
    <input type="hidden" value="<ww:property value='subType' />"   name="subType" />
    </div>
   </form>
</body>
</html>
