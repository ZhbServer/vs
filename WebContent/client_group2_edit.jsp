<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<link rel="stylesheet"  href="../css/index.css"  type="text/css" />
<link rel="stylesheet"  href="../css/common.css"  type="text/css" />
<script type="text/javascript" src="../js/jq/jquery.js"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>
<script type="text/javascript">



 




function editcg2(){
	   
	   var cg1name =document.getElementById("cg2name").value;
	   
	   if (cg1name.length < 1) {
	    	layer.msg("<ww:property value='#session.local.a00100' />!");
			return;
	   }
	    
	   document.form1.target = "_self";
	   document.form1.action = 'editcg2.vs'; 
	   document.form1.submit();	   
}




</script>

</head> 
<body>
   <form  name="form1" method="post" >
         <input type="hidden" value="<ww:property value='cg2.id' />" name="cg2id" />
         <div class="container clearfix" style="margin: 50px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		              
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                         <tr>
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00239' />：</th>
		                            <td>
		                                   <input  class="common-text required" id="cg2name" name="cg2name"  value="<ww:property value='cg2.gname' />"  type="text"/>
		                            </td>
		                          </tr>
		                          <tr>
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00235' />：</th>
		                            <td>
		                                     <select name="cg1id">
		                                        <ww:iterator value="cg1s"> 
		                                           <option <ww:if test="id==cg2.pid">selected="selected"</ww:if>  value="<ww:property value='id' />"><ww:property value='gname' /></option>
		                                        </ww:iterator>											 
											 </select>
		                            </td>
		                          </tr>
		                          

		                            <tr>
		                                <th></th>
		                                <td>
		                                    <input class="btn btn-primary btn6 mr10" value="<ww:property value='#session.local.a00017' />" type="button"  onclick="editcg2()"/>
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
