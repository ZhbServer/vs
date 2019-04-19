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
<script type="text/javascript" src="js/constant.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<script type="text/javascript">

window.onload=function (){
	
	document.getElementById("jsonStr").value="<%=request.getParameter("jsonStr")%>";
    var divHtml=window.parent.$("#layerBigDataParameter").val();
    document.getElementById("json").value=divHtml;
    
    
    
	document.onkeydown = function(e){ 
	    var ev = document.all ? window.event : e;
	    if(ev.keyCode==13) {
	    	save();
	     }
	}
}

function save(){
	var dname =document.getElementById("dname").value;
	if (dname.length < 1) {
	  	layer.msg("<ww:property value='#session.local.b00006' />!");
		return;
	}
	if(dname.length > 30){
	    layer.msg("<ww:property value='#session.local.b00007' />!");
		return;
    }
	//alert(document.getElementById("jsonStr").value);
	document.form1.target = "_self";
	document.form1.action = 'savesjjk.vs'; 
	document.form1.submit();
}

</script>

</head> 
<body>
   <form  name="form1" method="post" >
   		 <!--json数据-->
		 <input type="hidden" name="json"  id="json" value=""/>
		 <!--json数据源-->
		 <input type="hidden" name="jsonStr"  id="jsonStr" value=""/>
         <div class="container clearfix" style="margin: 50px 50px;">
             <div class="main-wrap">
                  <table class="insert-tab" width="100%">
                      <tbody>
                       <tr>
                           <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00133' />：</th>
                           <td>
                                  <input  class="common-text required" id="dname" name="dname" type="text"/>
                           </td>
                       </tr>
                       <tr>
                              <th></th>
                              <td>
                                  <button class="btn btn-primary" type="button"  onclick="save()"><ww:property value='#session.local.a00080' /></button>
                              </td>
                       </tr>
                      </tbody>
                  </table>
		     </div>
      	</div> 
   </form>
</body>
</html>
