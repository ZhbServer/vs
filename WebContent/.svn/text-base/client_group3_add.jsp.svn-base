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


function addcg3(){
	   
	   var cg3name =document.getElementById("cg3name").value;
	   
	   if (cg3name.length < 1) {
	    	layer.msg("<ww:property value='#session.local.a00100' />!");
			return;
	   }
	    
	   document.form1.target = "_self";
	   document.form1.action = 'adcg3.vs'; 
	   document.form1.submit();	   
}

/*触发选择一级分组修改二级*/
function ajax_get_cg2info(cg1id){
	
	$.ajax({
		type:'post',
		url:'ajaxgetcg2name.vs',
		data:"cg1id="+cg1id,
		datatype:'json',
		async:true,
		success:function(data){		  
		 
		   
		    var con = "<select name='cg2id'>";
		    for(i=0;i<data.length;i++)
			{
			  con+="<option value='"+data[i].id+"'>"+data[i].gname+"</option>";			 
			}
		    con+="</select>";
		    document.getElementById("dcg2id").innerHTML = con;
		}
	});
}


</script>

</head> 
<body>
   <form  name="form1" method="post" >
   
   
         <div class="container clearfix" style="margin: 50px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		              
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                          <tr>
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00239' />：</th>
		                            <td>
		                                   <input  class="common-text required" id="cg3name" name="cg3name"    type="text"/>
		                            </td>
		                          </tr>
		                          
		                          <tr>
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00235' />：</th>
		                            <td>
		                                     <select onchange="ajax_get_cg2info(this.value)" name="cg1id">
		                                        <ww:iterator value="cg1s">
		                                           <option value="<ww:property value='id' />"><ww:property value='gname' /></option>
		                                        </ww:iterator>											 
											 </select>
		                            </td>
		                          </tr>
		                          
		                           <tr>
		                           <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00236' />：</th>
		                            <td>
		                                   <div id="dcg2id">
		                                      <select name="cg2id">
		                                        <ww:iterator value="cg2s">
		                                           <option value="<ww:property value='id' />"><ww:property value='gname' /></option>
		                                        </ww:iterator>											 
											 </select>
		                                   </div> 
		                                     
		                            </td>
		                          </tr>
		                          
		                          
		                          
		                          
		                          

		                            <tr>
		                                <th></th>
		                                <td>
		                                    <input class="btn btn-primary btn6 mr10" value="<ww:property value='#session.local.a00080' />" type="button"  onclick="addcg3()"/>
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
