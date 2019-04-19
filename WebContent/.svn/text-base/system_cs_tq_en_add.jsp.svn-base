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
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript">
function addtq(){	  
  
	var citykey =document.getElementById("citykey").value;
	if(citykey.length>0){
		setTimeout(function(){
			  layer.confirm("<ww:property value='#session.local.a00634' />？", {
				  btn: ["<ww:property value='#session.local.a00232' />"] //按钮
				}, function(){
					 var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
					 window.parent.layer.close(index);
				});
		 }, 1000);
		 document.form1.target = "_self";
	     document.form1.action = 'addentq.vs'; 
	     document.form1.submit();
	}else{
		 layer.msg("<ww:property value='#session.local.a00195' />!");
         return;
    }  
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
	                                <th width="100px"><i class="require-red">*</i>city：</th>
	                                <td>
	                                     <input  class="common-text required"  id="citykey" name="tq.citykey" value=""  type="text"/>
	                                </td>
	                            </tr>  
	                            
	                            <tr>
	                                <th></th>
	                                <td>
	                                     city可通过城市英文名称进行，例如city=tokyo
	                                </td>
	                            </tr>  
	                            
	                               
	                            <tr>
	                                <th height="60px"></th>
	                                <td>
	                                  
	                                     <button class="btn btn-primary" onclick='addtq()' type="button"><ww:property value='#session.local.a00080' /></button>
	                                     <!-- <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">-->
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
		            </div>
		        </div>
		     </div>
       </div>
   </form>
</body>
</html>
