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

function addscreen(){
		var name = document.getElementById('name').value;
		var posx = document.getElementById("posx").value; 
		var posy = document.getElementById("posy").value; 
		var posx2 = document.getElementById("width").value; 
		var posy2 = document.getElementById("height").value; 
		var stime = document.getElementById("stime").value; 
		if (name.length < 1) {
		
			layer.msg("<ww:property value='#session.local.a00203' />");
			return;
		}
		if(stime<1)
		{ 
			layer.msg("<ww:property value='#session.local.a00204' />");
		  return;
		}
		if(posx<1||posy<1)
		{
			layer.msg("<ww:property value='#session.local.a00205' />");
		  return;
		}
		if(posx2<1||posx2<1)
		{
			layer.msg("<ww:property value='#session.local.a00205' />");
		  return ;
		}
	
   	   document.form1.target = "_self";
   	   document.form1.action = 'addscreen.vs'; 
   	   document.form1.submit();
             
    
       

	   
}



//去左右空格;
function trim(s){
    return s.replace(/(^\s*)|(\s*$)/g, "");
}

</script>

</head> 
<body>


<br/>
   <form  name="form1" method="post" >
       <div class="container clearfix" style="margin: 20px 20px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		              
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                         <tr>
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00133' />：</th>
		                            <td>
		                               <input class="common-text required" name="screen.name" id="name" style="line-height: 25px"  type="text"/>
		                            </td>
		                          </tr>
		                            <tr>
		                                <th><i class="require-red">*</i>POSX：</th>
		                                <td>
		                                     <input  class="common-text required"  name="screen.posx" id="posx" value="10" style="line-height: 25px"  type="text"/>
		                                </td>
		                            </tr>
		                           <tr>
		                                <th><i class="require-red">*</i>POSY：</th>
		                                <td>
		                                     <input  class="common-text required" name="screen.posy" id="posy"  value="10" style="line-height: 25px" type="text"/>
		                                </td>
		                            </tr>
		                            <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00032' />：</th>
		                                <td>
		                                   <input class="common-text required"   name="screen.width" id="width"  value="100" style="line-height: 25px"  type="text"/>
		                                 
		                                </td>
		                            </tr>
		                             <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00033' />：</th>
		                                <td>
		                                   <input class="common-text required"   name="screen.height" id="height"  value="100"  style="line-height: 25px"  type="text"/>
		                                 
		                                </td>
		                            </tr>
		                            
		                            <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00200' />：</th>
		                                <td>
		                                   <input class="common-text required"   name="screen.stime" id="stime"  value="10"  style="line-height: 25px" type="text"/>
		                                </td>
		                            </tr>
		                            
		                             <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00035' />：</th>
		                                <td>
		                                    <select id="type" name="screen.type" style="width:200px;">
										       <option value="png">png</option>
										       <option value="jpg">jpg</option>
										   </select>
		                                </td>
		                            </tr>
		                            
		                           
		                            <tr>
		                                <th></th>
		                                <td>
		                                    <button class="btn btn-primary" type="button"  onclick="addscreen()"><ww:property value='#session.local.a00080' /></button>
		                                     <!-- <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">-->
		                                </td>
		                            </tr>
		                        </tbody></table>
		              
		            </div>
		        </div>
		     </div>
    <!--/main-->
   </div>
       
       
       
       

      
    
   </form>
</body>
</html>
