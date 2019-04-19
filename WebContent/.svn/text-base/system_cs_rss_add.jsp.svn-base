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

function addrss(){
	    var name = document.getElementById('name').value;	
	    var freshtime = document.getElementById('freshtime').value;
	    var url = document.getElementById('url').value;
	    if (name.length < 1 || freshtime.length<1||url.length<1) {
	    	layer.msg("<ww:property value='#session.local.a00195' />!");
			return;
	    }
	    setTimeout(function(){
			  layer.confirm("<ww:property value='#session.local.a00634' />?", {
				  btn: ["<ww:property value='#session.local.a00232' />"] //按钮
				}, function(){
					 var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
					 window.parent.layer.close(index);
				});
		 }, 1000);
	
   	   document.form1.target = "_self";
   	   document.form1.action = 'addrss.vs'; 
   	   document.form1.submit();
             
    
       

	   
}



</script>

</head> 
<body>


   <form  name="form1" method="post" >
   
   
     <div class="panel panel-primary" style="margin: 3px 3px;border: 0px;">
           
         <div class="panel-heading">
                <ww:property value="#session.local.a00021"/>RSS <!-- 新增rss-->
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
			                               <input class="common-text required"  id="name" name="rss.name"   type="text"/>
			                            </td>
		                          </tr>
		                           <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00202' />：</th>
		                                <td>
		                                     <input  class="common-text required"  id="freshtime" name="rss.freshtime" value="600"  type="text"/>
		                                </td>
		                           </tr>
		                           <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00201' />：</th>
		                                <td>
		                                     <input  class="common-text required" style="width: 350px;" id="url" name="rss.url"  value="http://rss.sina.com.cn/news/marquee/ddt.xml"  type="text"/>
		                                </td>
		                           </tr>
                                   <tr style="height: 40px;">
		                                <th></th>
		                                <td>
		                                     <button class="btn btn-primary" type="button"  onclick="addrss()"><ww:property value='#session.local.a00080' /></button>
		                                     <!-- <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">-->
		                                </td>
		                            </tr>
		                        </tbody></table>
		              
		            </div>
		        </div>
		     </div>
  
   </div>
       
   </div>
       

      
    
   </form>
</body>
</html>
