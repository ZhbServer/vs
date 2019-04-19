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

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/icon.css"  />
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript">



function updatepwd() {
	var newpwd=document.getElementById("newpwd").value;
	var qrnewpwd=document.getElementById("qrnewpwd").value;
     
	 if(containSpecial(newpwd)){
	    layer.msg("<ww:property value='#session.local.a00047' /><ww:property value='#session.local.b00094' />:% & +"); 
        return;
	 }

	 if(containSpecial(qrnewpwd)){
		    layer.msg("<ww:property value='#session.local.a00047' /><ww:property value='#session.local.b00094' />:% & +"); 
	        return;
	 }

	 if(isChn(newpwd)){

		}else{
			layer.msg("<ww:property value='#session.local.a00047' /><ww:property value='#session.local.b00095' />"); 
         return;
	 }

	 if(isChn(qrnewpwd)){

		}else{
			layer.msg("<ww:property value='#session.local.a00047' /><ww:property value='#session.local.b00095' />:% & +"); 
         return;
	    }
	    

	
    if(newpwd.length>0&&qrnewpwd.length>0&&newpwd==qrnewpwd){
    	document.form.submit();	
    }else{
    	layer.msg("<ww:property value='#session.local.a00498' />");
        return 

    }   

}



</script>

</head> 
<body>
   <form  name="form" method="post" action="updatejdbcpwd.vs">
   
   
         <div class="container clearfix" style="margin: 50px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		              
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                         <tr>
		                            <th width="200"><i class="require-red">*</i><ww:property value='#session.local.a00496' />：</th>
		                            <td>
		                                   <input  class="common-text required" style="height: 20px;line-height: 20px;"   name="newpwd" id="newpwd"    type="password"/>
		                            </td>
		                          </tr>
		                          
		                          <tr>
		                            <th width="200"><i class="require-red">*</i><ww:property value='#session.local.a00497' />：</th>
		                            <td>
		                                   <input  class="common-text required" style="height: 20px;line-height: 20px;"    name="qrnewpwd" id="qrnewpwd"    type="password"/>
		                            </td>
		                          </tr>
		                          <tr>
		                                <th></th>
		                                <td>
		                                    
		                                    <button class="btn btn-primary" onclick='updatepwd()' type="button"><ww:property value='#session.local.a00080' /></button>
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
