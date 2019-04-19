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
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>

<style>
body,html{
width:100%;
height:95%;
margin:0px;
padding:0px;
border:0px;

font-family:Microsoft YaHei;
}
/*background-color:#134AFF;*/
/*overflow:hidden*/

a{color: #0885B8;text-decoration:none;}




</style>
<script type="text/javascript">
  



    /*修改素材名*/
    function editscg(uscgid,scgid,scgname){

           
           document.getElementById(scgid).innerHTML="<input type='text' style='width:100px;'    name='caveat' id='caveat'  value='"+scgname+"' />&nbsp;<a href='javascript:saveScg(&quot;"+uscgid+"&quot);'><ww:property value='#session.local.a00080'/></a>&nbsp;<a href='javascript:uneditscg(&quot;"+scgid+"&quot;,&quot;"+scgname+"&quot;)'><ww:property value='#session.local.a00670'/></a>";
            

    } 

    /*取消修改*/
    function uneditscg(scgid,scgname){
        
    	 document.getElementById(scgid).innerHTML=scgname;

    }

   /*确定保存素材分组名*/
   function saveScg(uscgid){
	    
	    var caveat=document.getElementById("caveat").value;
	    var re = /^[0-9]+.?[0-9]*$/;   //判断字符串是否为数字     //判断正整数 /^[1-9]+[0-9]*]*$/ 
	    if (!re.test(caveat))
	    {
	    	layer.msg("<ww:property value='#session.local.a00671'/>"); 
	        
	    }else{
	    	document.form1.action="upcaveats.vs";  
		    document.form1.submit();
		}
	    
   }
</script>
</head>
<body>
 <form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
		         <ww:property value='#session.local.a00065' /> :
		         <span class="function"><ww:property value='#session.local.a00668' /></span>
		         <span class="material_bg"><ww:property value='#session.local.a00667' /></span>
			</div>
			<div class="material_show">
				<ul>
				<li>
				    <a href="tocutlist.vs"  >
				      <ww:property value='#session.local.a00666' /><!-- 显示列表 -->
				    </a>
				</li>
				<li>
				    <a href="tocaveats.vs" style="background-color:#007CCD;">
				      <ww:property value='#session.local.a00667' /><!-- 参数设置 -->
				    </a>
				</li>
				
				</ul>
			</div>
		</div>
</div>

<div class="c_middle download_manager">
    

	 
	<div>
		<div class="c_right_header" >
			
			
		</div>
        <!--显示内容-->
        <div style="height: 400px;width: 1050px;margin-top: 50px;" >
            
			 <div style="padding-right:17px;margin: 0px;">
				 <table border="0" cellpadding="0" cellspacing="0" style="margin-top:0px;margin-bottom: 0px;">
					
						<tr class="cell_element">
						  <td style="width: 10%">
						      <ww:property value="#session.local.a00669"/>
						  </td>
						  <td style="width: 20%">
						     <div id="dscg0">
						         <ww:property value="caveat"  />
						     </div>
						   
						  </td>
						 <td style="width: 30%">
						     <a href="javascript:editscg('0','dscg0','<ww:property value='caveat'  />');"><ww:property value='#session.local.a00017' /></a>
						  </td>
						  
						</tr>
					
				</table>
		   </div>
		</div>
    
	</div>
</div>
</form>
</body>
</html>
