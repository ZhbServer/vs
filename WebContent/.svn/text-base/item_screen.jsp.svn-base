<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<title></title>
<base target="_self" />
<style type="text/css">
A{text-transform:none; text-decoration:none;}   
</style>
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/common.css"/>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/icon.css"  />
<script type="text/javascript" src="js/constant.js"></script>

<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script src="js/fresh.js" type="text/javascript" language="javascript"></script>
<script>

function to() 
{


	 //获取radio选种
	 
	  var chkRadio = $('input:radio[name="screenRadio"]:checked').val();
	  var value="";
      if (chkRadio == null) {
                    alert("<ww:property value='#session.local.a00018' />");
                    return;
                } else {
                   
                    value=chkRadio;
                }


                
	 var xy_x = document.getElementById("xy_x").value;
	 var xy_y = document.getElementById("xy_y").value;   
     var width = document.getElementById("width").value;
	 var height = document.getElementById("height").value;
	 if(xy_x<0){
			layer.msg("<ww:property value='#session.local.a00283' />");
	        return;
	 }
	 if(xy_y<0){
			layer.msg("<ww:property value='#session.local.a00284' />");
	        return;
	 }
	 if(width<=0){
		layer.msg("<ww:property value='#session.local.a00285' />");
       return;
	 }
	 if(height<=0)
	 {
		  layer.msg("<ww:property value='#session.local.a00286' />");
         return;
	 }  
  	
  	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
  	window.parent.returnValue=value+"|"+width+"|"+height+"|"+xy_x+"|"+xy_y;  
    window.parent.layer.close(index); 
	return false;
}
  


function  fastAddParameterScreen(){

	//弹出
	layer.open({
 		type: 2,
         area: ['400px', '450px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'system_cs_screen_add.jsp',
         scrollbar: false,
         end: function(data){

                

				 $.ajax({
						type:'post',
						url:'ajaxscreenall.vs',
						dataType:'json',
						async:true,
						cache:true,
						success:function(data){


					          $("#screenTable tr:gt(0)").remove();
					           var screenTable=document.getElementById("screenTable");

					         
						       for(i=0;i<data.length;i++)
							   {

						    	   var tr = document.createElement("tr");
						    	   screenTable.appendChild(tr);

						    	   var td = document.createElement("td");
						    	   tr.appendChild(td);
						    	   td.innerHTML = data[i].name;

						    	   var td2 = document.createElement("td");
						    	   tr.appendChild(td2);
						    	   td2.innerHTML = "<input type='radio'  name='screenRadio'    value='http://<ww:property value='ip'/>:8512/vs/getscreen.vs?fname="+data[i].filename+"|"+data[i].stime+"' />";
						    	     
						    	   //obj.options.add(new Option(data[i].name,data[i].url)); //这个兼容IE与firefox 
						    
							    }
					      
						}
					});

			
        
		     
	       
		      
		   
 		 }
 	});          
	
}


</script>
</head>
<body>
<form name="form1" method="post"  action="toadscreen.vs">

<div  style="display: none;">
 <input id="xy_x" name="xy_x" type="text" <ww:if test="xy_x==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_x' />"</ww:else>  style="width: 40px;height: 18px;" value="0"   onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
									Y:<input id="xy_y" name="xy_y" type="text" <ww:if test="xy_y==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_y' />"</ww:else> style="width: 40px;height: 20px;" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
								    <ww:property value='#session.local.a00032' />:
									     <input name="width" id="width" type="text" style="width:40px;height: 20px;" <ww:if test="width==0">value="400"</ww:if><ww:else>value="<ww:property value='width' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
									<ww:property value='#session.local.a00033' />:
									     <input name="height" id="height" type="text" style="width:40px;height: 20px;"  <ww:if test="height==0">value="200"</ww:if><ww:else>value="<ww:property value='height' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />  
				      
  </div>				      
				      
 <div class="panel panel-primary" style="margin: 3px 3px;">
           <div class="panel-heading">
                <ww:property value="#session.local.b00027"/> <!-- 截图 -->
           </div>
           
           
			 <div class="container clearfix" style="margin: 10px 10px;">
			          <div class="main-wrap">
					      <div class="result-wrap">
					            <div class="result-content">
			     <table class="insert-tab" width="100%"  id="screenTable" style="text-align: center;">
			         
			         
				      <tr>
				        <td style="width: 300px;" ><ww:property value="#session.local.a00329" />
				               <ww:if test="#session.sysset==0">
															    
								</ww:if>
								<ww:else>
								   <i onclick="fastAddParameterScreen()" style="cursor: pointer;" title="<ww:property value='#session.local.a00021' />"  class="icon icon-plus-sign"></i>
								</ww:else>
				        
				        </td>
				        <td >
				             <button class="btn btn-primary" onclick='to()' type="button"><ww:property value='#session.local.a00080' /></button>
				                 
				           
				            
				        </td>
				      </tr>
					   <ww:iterator value="screens" >
					      <tr >
					        <td >
					          <ww:property value="name"/>
					        </td>
					        <td >
					            <input   type="radio"  name="screenRadio"      value="http://<ww:property value="ip"/>:8512/vs/getscreen.vs?fname=<ww:property value="filename"/>|<ww:property value="stime"/>"  />
			                    
					        </td> 
					        <!--  <td><a href="#" onclick="to(<ww:property value='id'/>)" ><img border="0" src="images/xz.gif" width="49" height="18" /></a></td>-->
					      </tr>
						 </ww:iterator>
				  </table>
			   </div>
					  </div>
					</div>
			    </div>	        
			<div id="nodiv" style="display:none"></div>
     </div>			
</form>

</body>
</html>
