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

function addrss(){



	var olddian = document.getElementById('olddian').value;
	var newdian = document.getElementById('newdian').value;
	var shouquan = document.getElementById('shouquan').value;
	
	if(olddian.toString().length==5){
		
      
    }else{
    	layer.msg("<ww:property value='#session.local.a00210' />!");
    	 return;
	}
	if(newdian.toString().length==5){
		
    }else{
    	layer.msg("<ww:property value='#session.local.a00210' />!");
      return
    }
    
	document.form1.target = "_self";
   	document.form1.action = 'editdw.vs'; 
   	document.form1.submit();
             
    
       

	   
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
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00207' />：</th>
		                            <td>
		                               <input class="common-text required"  id="olddian" name="olddian"  type="text"/>
		                            </td>
		                          </tr>
		                            <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00208' />：</th>
		                                <td>
		                                     <input  class="common-text required" id="newdian" name="newdian" value=""  type="text"/>
		                                </td>
		                            </tr>
		                           <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00209' />：</th>
		                                <td>
		                                     <input  class="common-text required" id="shouquan" name="shouquan"  value=""  type="text"/>
		                                </td>
		                            </tr>

		                            <tr>
		                                <th></th>
		                                <td>
		                                    <input class="btn btn-primary btn6 mr10" value="<ww:property value='#session.local.a00080' />" type="button"  onclick="addrss()"/>
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
