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
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript">

function add_stock_close(){
   var stock =document.getElementById("stock").value;	
      if (isNaN(stock)) { 
	   layer.msg("<ww:property value='#session.local.a00671' />!"); 
	   return;
   } 
   var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
   window.parent.returnValue=""; 
   window.parent.returnValue=stock; 
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
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00679' />：</th>
		                            <td>
		                               <input  class="common-text required" id="stock" name="stock"    type="text"/>
		                            </td>
		                          </tr>
		                          <tr style="height: 35px;">
		                                <th></th>
		                                <td>
		                                    <input class="btn btn-primary btn6 mr10" value="<ww:property value='#session.local.a00080' />" type="button"  onclick="add_stock_close()"/>
		                                     <!-- <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">-->
		                                </td>
		                          </tr>
		                        </tbody></table>
		              
		            </div>
		        </div>
		     </div>
  
      </div> 
   
       
   </form>
</body>
</html>
