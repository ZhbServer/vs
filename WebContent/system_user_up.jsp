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
<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<script type="text/javascript">

function init_self(){

	var openIntro = <%=request.getParameter("openIntro")%>;

	if(openIntro == '1'){
		var intro = introJs();  
		intro.setOptions({
		prevLabel:"<ww:property value='#session.local.a00861' />", 
        nextLabel:"<ww:property value='#session.local.a00862' />",
        skipLabel:"<ww:property value='#session.local.a00863' />",
        doneLabel:"<ww:property value='#session.local.a00863' />",
		showStepNumbers: false,
		showBullets: false,
		exitOnOverlayClick: false,
		overlayOpacity: 0.4,  
		steps: [
			{  
				element: '#phone',  
				intro: "<ww:property value='#session.local.a00978' /><span style='color:blue'> <ww:property value='#session.local.a00214' /></span>"
			},  	
			{  
				element: '#step1',  
				intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00017' /></span>,<ww:property value='#session.local.a00979' />",
				position: "right"
			}
		  ]  
		});  

		intro.start().oncomplete(function() {  
			intro.exit();  
	    });

		intro.onexit(function() {
			layer.msg("<ww:property value='#session.local.a00864' />");
			window.parent.returnValue="close"; 
		});
	}
}

function upuser(){
	
	    var name = document.getElementById('name').value;	
	    var password = document.getElementById('password').value;

	    if (password.length < 1) {
	    	layer.msg("<ww:property value='#session.local.a00228' />");
			return;
	    }


	    if (name.length < 1) {
	    	layer.msg("<ww:property value='#session.local.a00227' />");
			return;
	    }
	    
	    
	    if(containSpecial(name)){
	    	layer.msg("<ww:property value='#session.local.a00212' /><ww:property value='#session.local.b00094' />:% & +"); 
           return;
		}
	    
	
		var powerid = document.getElementById('powerid').value;	
	    
	    if(powerid==0) {
	    	layer.msg("<ww:property value='#session.local.a00229' />");
			return;
	    }

	    //if(isChn(password)){

		//}else{
		//	layer.msg("<ww:property value='#session.local.a00047' /><ww:property value='#session.local.b00095' />"); 
        //    return;
	    //}
	    //if(containSpecial(password)){
	    //	layer.msg("<ww:property value='#session.local.a00047' /><ww:property value='#session.local.b00094' />:% & +"); 
        //    return;
		//}


	    //if("<ww:property value='#session.version_onoff.pwdPloy'  />"==1){

	    //	 var account="<ww:property value='showuser.account'  />";
	    	 
	    //	 if(account==password){
	    		 	
	 	//            layer.alert("<ww:property value='#session.local.b00240' />");
	 	//            return;
	 	
	 	//     }

	    //	  var newpwdFlag=checkPwd(password);

	 	//      if(!newpwdFlag){

		// 	      return;

		// 	  }
	 	      

	   // }    

		
   	   document.form1.target = "_self";
   	   document.form1.action = 'upuser.vs'; 
   	   document.form1.submit();   	    
}



</script>

</head> 
<body onload="init_self()">

 <div class="panel panel-primary" style="margin: 3px 3px;border: 0px;">
 
  <div class="panel-heading">
        <ww:property value="#session.local.a00234"/> <!--修改用户-->
  </div>
  
   <form  name="form1" method="post" >
       <div class="container clearfix" style="margin: 10px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		            
		                    <input type="hidden" value="<ww:property value='showuser.id' />" name="user.id" />
		                    <input type="hidden" value="<ww:property value='showuser.fatherid' />" name="user.fatherid" />
		                    <input type="hidden" value="<ww:property value='showuser.account' />" name="user.account" />
		                    
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                         <tr>
		                            <th width="200px"><i class="require-red"></i><ww:property value='#session.local.a00223' />：</th>
		                            <td>
		                               <input class="common-text required"  value="<ww:property value='funame' />"  disabled="disabled"  type="text"/>
		                               <input value="<ww:property value='fuid' />"  type="hidden"  name="fuid"/>
		                            </td>
		                         </tr>
		                         <tr>
		                            <th width="300"><i class="require-red">*</i><ww:property value='#session.local.a00211' />：</th>
		                            <td>
		                               <input class="common-text required"    id="account" name="user.account" value="<ww:property value='showuser.account' />"  disabled="disabled"  type="text"/><span style="color: red;" id="acshow"></span>
		                            </td>
		                         </tr>
		                         
		                          <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00047' />：</th>
		                                <td>
		                                     <input disabled="disabled"  class="common-text required"  id="password" name="user.password"   value="<ww:property value='showuser.password' />"    />
		                                </td>
		                          </tr>
		                          
		                          <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00212' />：</th>
		                                <td>
		                                     <input  class="common-text required" id="name" name="user.name"   value="<ww:property value='showuser.name' />"  type="text"/>
		                                </td>
		                           </tr>
		                            
		                           <tr>
		                                <th><i class="require-red"></i><ww:property value='#session.local.a00214' />：</th>
		                                <td>
		                                     <input  class="common-text required" id="phone" name="user.phone"  value="<ww:property value='showuser.phone' />"  type="text"/>
		                                </td>
		                            </tr>
		                            
		                            <tr>
		                                <th><i class="require-red"></i><ww:property value='#session.local.a00213' />：</th>
		                                <td>
		                                     <input  class="common-text required" id="email" name="user.email"  value="<ww:property value='showuser.email' />"  type="text"/>
		                                </td>
		                            </tr>
		                           <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00215' />：</th>
		                                <td>
		                                    <select  style="width: 170px; border: 1px solid #495764;" id="powerid" class="user.powerid" name="user.powerid">
												<option value="0">----</option>
												<ww:iterator value="powers">
													  <ww:if test="id!=1">
														<option
														   <ww:if test="showuser.powerid==id">
														       selected="selected" 
														   </ww:if>
														   value="<ww:property value="id" />"><ww:property value="name" />
														</option>
													  </ww:if>	
												</ww:iterator>
											</select>
		                                </td>
		                            </tr>
		                            
		                            
		                           <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00167' />：</th>
		                                <td>
		                                     <select name="user.ocheck">
<!--											    <option <ww:if test="showuser.ocheck==0"> selected="selected" </ww:if>   value="0"><ww:property value='#session.local.a00219' /></option>-->
											        <option <ww:if test="showuser.ocheck==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.a00218' /></option>
											        <option <ww:if test="showuser.ocheck==2"> selected="selected" </ww:if>   value="2"><ww:property value='#session.local.a00220' /></option>
<!--											    <option <ww:if test="showuser.ocheck==3"> selected="selected" </ww:if>   value="3"><ww:property value='#session.local.a00221' /></option>-->
											 </select>
		                                </td>
		                            </tr>
		                            
		                            
		                            
		                               <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.b00298' />：</th>
		                                <td>
		                                     <select name="user.jhocheck">
<!--											    <option <ww:if test="showuser.ocheck==0"> selected="selected" </ww:if>   value="0"><ww:property value='#session.local.a00219' /></option>-->
											        <option <ww:if test="showuser.jhocheck==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.a00218' /></option>
											        <option <ww:if test="showuser.jhocheck==2"> selected="selected" </ww:if>   value="2"><ww:property value='#session.local.b00299' /></option>
<!--											    <option <ww:if test="showuser.ocheck==3"> selected="selected" </ww:if>   value="3"><ww:property value='#session.local.a00221' /></option>-->
											 </select>
		                                </td>
		                            </tr>
		                            
		                            
		                            
		                            <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00231' />：</th>
		                                <td>
		                                    <input type="radio" <ww:if test="showuser.ban==0">  checked="checked" </ww:if> name="user.ban" value="0"/><ww:property value='#session.local.a00233' />&nbsp;&nbsp;<input name="user.ban" <ww:if test="showuser.ban==1">  checked="checked" </ww:if> type="radio" value="1"/><ww:property value='#session.local.a00232' />
		                                </td>
		                            </tr>
		                            
		                            <tr style="height: 40px;">
		                                <th></th>
		                                <td>
		                                    <button id="step1" class="btn btn-primary" type="button"  onclick="upuser()"><ww:property value='#session.local.a00017' /></button>
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
  </div>
</body>
</html>
