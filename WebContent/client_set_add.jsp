<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<link rel="stylesheet" href="../css/index.css"/>
<link rel="stylesheet" href="../css/common.css"/>
<script type="text/javascript" src="../js/jq/jquery.js"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>
<script type="text/javascript">
var ip="255.255.255.255";
function isIP(ip)  
{  
    var reSpaceCheck = /^(\d+)\.(\d+)\.(\d+)\.(\d+)$/;  
    if (reSpaceCheck.test(ip))  
    {  
        ip.match(reSpaceCheck);  
        if (RegExp.$1<=255&&RegExp.$1>=0  
          &&RegExp.$2<=255&&RegExp.$2>=0  
          &&RegExp.$3<=255&&RegExp.$3>=0  
          &&RegExp.$4<=255&&RegExp.$4>=0)  
        {  
            return true;   
        }else  
        {  
            return false;  
        }  
    }else  
    {  
        return false;  
    }  
}  
function addclient(){
			
	    var nameVar = document.getElementById("cname").value;	
	    var ipVar = document.getElementById("cip").value;
	    var markVar = document.getElementById("cmark").value;

		if(nameVar.length < 1){
			 layer.msg("<ww:property value='#session.local.b00006' />!");
             return;
		}

		//else if (!(/^[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5]+{1,30}$/.test(nameVar))){
	    //	 layer.msg("<ww:property value='#session.local.b00007' />!");
        //     return;
		//}
		if(ipVar.length < 1){
			 layer.msg("<ww:property value='#session.local.b00008' />!");
             return;
		//}else if (!(/^\d+\.\d+\.\d+\.\d+$/.test(ipVar))) {
	    //	layer.msg("<ww:property value='#session.local.b00009' />!");
		//	return;
	    }
	    if(!isIP(ipVar)){
	    	 layer.msg("<ww:property value='#session.local.b00009' />!");
             return;
		}
		if(markVar.length < 1){
			 layer.msg("<ww:property value='#session.local.b00010' />!");
           return;
		}

		if(markVar.length != 17){
			 layer.msg("<ww:property value='#session.local.a00524' />!");
          return;
		}

		//else if (!(/^[A-Z][0-9]-[A-Z][0-9]-[A-Z][0-9]-[A-Z][0-9]-[A-Z][0-9]-[A-Z][0-9]{17}$/.test(markVar))) {
	    //	layer.msg("<ww:property value='#session.local.b00011' />!");
		//	return;
	    //}

	   document.form1.target = "_self";
   	   document.form1.action = 'adclient.vs'; 
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
		                            <th width="120"><i class="require-red"></i><ww:property value='#session.local.a00095' />：</th>
		                            <td>
		                               <input class="common-text required" id="cgname" name="cgname" value="<ww:property value='cgname'/>" disabled="disabled" type="text"/><span style="color: red;"></span>
		                               <input value="<ww:property value='cgid' />"  id="cgid" type="hidden"  name="cgid"/>
		                            </td>
		                         </tr>
		                          <tr>
		                            <th width="120"><i class="require-red"></i><ww:property value='#session.local.a00395' />：</th>
		                            <td>
		                            	<input value="<ww:property value='gtype' />"  id="gtype" type="hidden"  name="gtype"/>
		                            	<ww:if test="gtype==0">
		                            		<input class="common-text required" value="<ww:property value='#session.local.a00815' />"  disabled="disabled"   type="text"/><span style="color: red;"></span>
		                            	</ww:if>
		                            	<ww:if test="gtype==1">
		                            		<input class="common-text required" value="<ww:property value='#session.local.b00003' />" disabled="disabled" type="text"/><span style="color: red;"></span>
		                            	</ww:if>
		                            	<ww:if test="gtype==2">
		                            		<input class="common-text required" value="<ww:property value='#session.local.b00004' />" disabled="disabled" type="text"/><span style="color: red;"></span>
		                            	</ww:if>
		                            	<ww:if test="gtype==3">
		                            		<input class="common-text required" value="<ww:property value='#session.local.b00005' />" disabled="disabled" type="text"/><span style="color: red;"></span>
		                            	</ww:if>
		                            </td>
		                         </tr>
		                         <tr>
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00133' />：</th>
		                            <td>
		                               <input class="common-text required" id="cname" name="cname" value="" type="text"/><span style="color: red;"></span>
		                            </td>
		                         </tr>
		                         <tr>
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00041' />：</th>
		                            <td>
		                               <input class="common-text required" id="cip" name="cip" value="" type="text"/><span style="color: red;"></span>
		                            </td>
		                         </tr>
		                         <tr>
	                                <th><i class="require-red">*</i><ww:property value='#session.local.a00040' />：</th>
	                                <td>
	                                   <input  class="common-text required"  id="cmark" name="cmark" value="" type="text"/><span style="color: red;"></span>
	                                </td>
		                         </tr>
		                            <tr>
		                                <th></th>
		                                <td>
		                                    <input class="btn btn-primary btn6 mr10" value="<ww:property value='#session.local.a00080' />" type="button"  onclick="addclient()"/>
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
