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

function addtq(){
		//加载层-风格2
	   //layer.load(1);
	
	   var tcityv=document.getElementById("tcity").value;     //城市 id_key

	   if(tcityv==""){

		   layer.alert("<ww:property value='#session.local.a00195' />");
		   
		   return;

	   }

	   var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引

	   window.parent.returnValue="eleva|"+tcityv; 

	   window.parent.layer.close(index);
	    
	 

	  
}

</script>

</head> 
<body>
   <form  name="form1" method="post" >   
   
    <div class="panel panel-primary" style="margin: 3px 3px;border:0px;">
           
         <div class="panel-heading">
                <ww:property value="#session.local.b00277"/> 
         </div>
           
         <div class="container clearfix" style="margin: 50px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		                <table class="insert-tab" width="100%">
		                        <tbody>
		                         <tr style="line-height: 45px;padding-top: 5px;">
		                            <th width="120">
		                            
		                                <i class="require-red">*</i>
			                            <ww:property value='#session.local.a00177' /><ww:property value='#session.local.a00191' />：
		                            
		                            </th>
		                            <td>
		                                 <select id="tcity">
											   <option value=""></option>
											   <ww:iterator value="list">
														<option <ww:if test="selfCity==city"> selected="selected"  </ww:if> value="<ww:property  value="city"/>"><ww:property
															value="city" />
													    </option>
											   </ww:iterator>
									     </select>
									     <ww:if test="#session.sysset==0">
																				    
										 </ww:if>
										 <ww:else>
										       <i onclick="fastAddParameterTq()" style="cursor: pointer;" title="<ww:property value='#session.local.a00021' />"  class="icon icon-plus-sign"></i>
										 </ww:else>
		                                   
		                                   
		                            </td>
		                          </tr>
		                          
		                          

		                            <tr style="height: 46px;">
		                                <th></th>
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
      <input   type="hidden" id="weatherCity" name="tq.city" />
	  <input   type="hidden" id="weatherCityKey" name="tq.citykey" />
	  </div>
   </form>
</body>
</html>
