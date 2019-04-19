<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<title></title>
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/common.css"/>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/fresh.js" language="javascript"></script>

<base target="_self" />
<style type="text/css">
A{text-transform:none; text-decoration:none;}   
</style>
<script>

//初始化
function iniData(){

  //获取mfile是否存在
 
  var fileExist=$("#fileExist").val();
  if(fileExist==1){
	  $("#myCallFile").html("<ww:property value='myCallFile' />");
  } 	  
	
}

function up_call_file(){

	var parmeter = $("#parmeter").val().replace(/^\s+|\s+$/g,"");

	if(parmeter.length==0){

		layer.msg("<ww:property value='#session.local.b00364' /><ww:property value='#session.local.a00691' />"); 
        return;
    }

	
	
	var filename=document.getElementById("callFile").value;

	var fileExist=$("#fileExist").val();
	
	if(filename==""&&fileExist==1){
		
		 var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引

		 window.parent.returnValue="mycall|"+fileExist+"|"+parmeter; 
		 
		 window.parent.layer.close(index);

    }else if(fileExist==0&&filename==""){
        
    	layer.msg("<ww:property value='#session.local.b00367' />"); 
    	return;

    }else{

    	var mime = filename.toLowerCase().substr(filename.lastIndexOf(".")); 
    	
    	if(mime==".xml") 
    	{
        	
    		 document.form1.action="upcallxml.vs";
    		 document.form1.submit();   
    		       
    	}else{

    		layer.msg("<ww:property value='#session.local.b00368' />"); 
    	}
    }

	
	

	   
	

	
}



</script>
</head>
<body onload="iniData()">
<form action="" method="post" name="form1"  enctype="multipart/form-data" >
    
    
      <div class="panel panel-primary" style="margin: 3px 3px;">
           <div class="panel-heading">
                <ww:property value="#session.local.b00360"/> <!-- 叫号控件-->
           </div>
          <div class="container clearfix" style="margin: 10px 10px;">
          
          
           
   <div class="container clearfix" style="margin: 0px 0px;">
      
        <div class="main-wrap" style="width:500px;">
		   <div class="result-wrap">
		        <div class="result-content">
    
		        <table class="insert-tab" width="95%">
		        
		            <!--组件名 -->
		           <tr>
		            <td style="text-align: right;"><ww:property value="#session.local.b00364" />:</td>
		            <td>
		               <input  id="parmeter"  name='parmeter' type="text"  value="<ww:property value='parmeter' />"/>
		            </td>
		          </tr>
		          
		           <tr>
		            <td style="text-align: right;" width="150"><ww:property value="#session.local.b00366" />:</td>
		            <td>
		               <span id="myCallFile"></span>
		               <input accept=".xml" type="hidden" name="fileExist" value="<ww:property value='fileExist' />"  id="fileExist"/>
		            </td>
		          </tr>
		          
		           <tr>
		            <td style="text-align: right;"><ww:property value="#session.local.b00365" />:</td>
		            <td>
		               <input  id="callFile"  name='callFile' type="file"/>
		            </td>
		          </tr>
		         
		          
		          
				
		          
		        <tr style="display: none;">
		            <td></td>
		            <td>
		                X:
					   <input id="xy_x" name="xy_x" type="text" <ww:if test="xy_x==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_x' />"</ww:else>  style="width: 40px;height: 18px;" value="0"   onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
					    Y:
				       <input id="xy_y" name="xy_y" type="text" <ww:if test="xy_y==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_y' />"</ww:else> style="width: 40px;height: 20px;" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
				       <ww:property value='#session.local.a00032' />:
			           <input name="width" id="width" type="text" style="width:40px;height: 20px;" <ww:if test="width==0">value="200"</ww:if><ww:else>value="<ww:property value='width' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
			           <ww:property value='#session.local.a00033' />:
			           <input name="height" id="height" type="text" style="width:40px;height: 20px;"  <ww:if test="height==0">value="200"</ww:if><ww:else>value="<ww:property value='height' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
		            </td>
			       
			      </tr>

				   <tr style="height: 40px;">
		            <td></td>
		            <td>
		               <button class="btn btn-primary" onclick='up_call_file()' type="button"><ww:property value='#session.local.a00080' /></button>
		            </td>
				   </tr>
				   
				   
				   <tr style="display: none;">
		            <td></td>
		            <td>
		               <span style="color:#FFA534;font-size: 12px; ">
			                <ww:property value='#session.local.a00093' />:<br/>
	
							<ww:property value='#session.local.a00716' />:    <ww:property value='#session.local.b00195' /><br/>
							<ww:property value='#session.local.a00345' />:    <ww:property value='#session.local.b00196' /><br/>
							<ww:property value='#session.local.a00346' />:    <ww:property value='#session.local.b00197' />
						</span>
		            </td>
				   </tr>
				   
				   
		        </table>
             </div>
		  </div>
		</div>
    </div>
    
    </div>
    </div>	   
    <input type="hidden" value="<ww:property value='mfile' />"  name='mfile' /> 
</form>

</body>
</html>
