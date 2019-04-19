<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" href="tip/tip-darkgray/tip-darkgray.css" type="text/css" />
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/common.css"/>
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>

<link rel="stylesheet" href="../css/index.css"/>
<link rel="stylesheet" href="../css/common.css"/>
<script type="text/javascript" src="../js/jq/jquery.js"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>

<!-- jQuery and the Poshy Tip plugin files -->
<script type="text/javascript" src="tip/jquery.poshytip.js"></script>

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="../zui-1.5.0-dist/dist/css/zui.min.css" />
<script>

   function init_content(){

	   var dishArrayStr = "<ww:property value='dish.content' />";

       dishArrayStr=dishArrayStr.replace(/&quot;/g,"'");
      
      //alert("dishArrayStr:"+dishArrayStr);

      var dishArray=eval( "(" + dishArrayStr + ")" );//转换后的JSON对象
     
      //alert("dishArray:"+dishArray.length)
      var dishShowContent="";
      for(var i=0;i<dishArray.length;i++){

    	  if(dishShowContent==""){
    		  dishShowContent="菜名:"+dishArray[i].dishName+"&nbsp;&nbsp;&nbsp;&nbsp;价格:"+dishArray[i].dishPrice;
          }else{
        	  dishShowContent=dishShowContent+"<br>菜名:"+dishArray[i].dishName+"&nbsp;&nbsp;&nbsp;&nbsp;价格:"+dishArray[i].dishPrice;
          }
    	  
      }
      $("#dishContent").html(dishShowContent);

   }

</script>

<style>
  .client-tab tr th{text-align: center;}
  .client-tab tr td{text-align: center;}
</style>
</head> 
<body onload="init_content()">
<br/>
   <form  name="form1" method="post" >
           	
			
			<div class="container clearfix" style="margin: 50px 10px;">
             <div class="main-wrap" style="width: 850px;">
		         <div class="result-wrap">
		            <div class="result-content">
		                    <ul class="nav nav-secondary" style="margin-top: -50px;">
							  <li class="active">数据详情</li>
							
							</ul>
			
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                         <tr>
		                            <!-- id -->
		                            <th width="200">标题：</th>
		                            <td>
		                             
		                               <ww:property value="dish.title" />
		                                 
		                            </td>
		                          </tr>
		                          
		                        
		                          
		                          <tr>
		                           
		                            <th width="200">内容详情:</th>
		                            <td>
		                               <span id="dishContent"></span>
		                            </td>
		                          </tr>
		                          
		                          
		                           <tr>
		                            
		                            <th width="200">修改时间：</th>
		                            <td>
		                             
		                               <ww:property value="dish.last_edit_time" />
		                                 
		                            </td>
		                          </tr>
		                          
		                          <tr>
		                            
		                            <th width="200">创建时间：</th>
		                            <td>
		                             
		                               <ww:property value="dish.create_time" />
		                                 
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
