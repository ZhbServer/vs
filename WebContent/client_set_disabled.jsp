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
  
function disabled_onoff(){
	var options=$('input:radio:checked').val();  //获取选中的项
    var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	window.parent.returnValue=options; 
    window.parent.layer.close(index);
	  
}
 

</script>

</head> 
<body>
<br/>
   <form  name="form1" method="post" >
       <div class="container clearfix" style="margin: 50px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		              
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                        
		                          <tr>
		                            
		                            <td style="height: 35px;text-align: center;"  >
		                            
		                                 <input type="radio"  value="1"  name="cleintdisabled" checked="checked"  />
										                禁用  
										 <!-- 禁用 -->        
										 &nbsp;&nbsp;        
										 <input type="radio"  value="0"   name="cleintdisabled"  />
										   取消禁用 
		                            
		                            
		                            	
		                            </td>
		                         </tr>
		                        
		                         <tr>
		                            
		                                <td style="height: 40px;text-align: center;">
		                                    <button class="btn btn-primary" onclick="disabled_onoff()" type="button"><ww:property value='#session.local.a00080' /></button>
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
