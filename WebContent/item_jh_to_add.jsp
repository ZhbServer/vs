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
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/icon.css"  />
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>

 <script language="javascript">  
      document.onkeydown = function(e) {
          e = e || window.event;
          if(e.keyCode == 13) {
             // this.forms["form"].submit();
              addjh();
              return false;
          }
      };
</script>
        
<script type="text/javascript">

function addjh(){
	    var name = document.getElementById('name').value;	
	    if (name.length < 1){
	    	 layer.msg("<ww:property value='#session.local.a00260' />!");
             return;
		}
	    var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
		window.parent.returnValue=""; 
	    window.parent.returnValue=name; 
	    window.parent.layer.close(index);
	     
}



</script>

</head> 
<body>

   <form  name="form1" method="post" >
   
   <div class="panel-primary" style="margin: 3px 3px;border: 0px;">
           
         <div class="panel-heading">
                <ww:property value="#session.local.a00650"/> <!-- 系统信息-->
         </div>
         
       <div class="container clearfix" style="margin: 50px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		              
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                          <tr>
		                            <th width="180"><i class="require-red">*</i><ww:property value='#session.local.a00649' />：</th>
		                            <td>
		                               <input class="common-text required"  value=""   id="name"  type="text"/>
		                            </td>
		                          </tr>
		                          <tr style="height: 40px;">
	                                <th></th>
	                                <td>
	                                    <button class="btn btn-primary" style="width: 110px;height: 30px;" type="button"  onclick="addjh()"><ww:property value='#session.local.a00080' /></button>
	                                     <!-- <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">-->
	                                </td>
		                          </tr>
		                        </tbody>
		                     </table>
		              
		            </div>
		        </div>
		     </div>
  
   </div>  
   
   </div>
   </form>
</body>
</html>
