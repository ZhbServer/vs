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
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
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
			    element: '#step1',
			    intro: "<span style='color:blue'><ww:property value='#session.local.a00964' /></span>,<ww:property value='#session.local.a00965' />",
			    position: "left"
			},  	
			{  
				element: '#account',  
				intro: "<ww:property value='#session.local.a00966' /><span style='color:blue'> <ww:property value='#session.local.a00211' /></span>"
			},  	
			{  
				element: '#password',  
				intro: "<ww:property value='#session.local.a00967' /><span style='color:blue'> <ww:property value='#session.local.a00047' /></span>"
			},  	
			{  
				element: '#name',  
				intro: "<ww:property value='#session.local.a00968' /><span style='color:blue'> <ww:property value='#session.local.a00212' /></span>"
			},  	
			{  
				element: '#powerid',  
				intro: "<ww:property value='#session.local.a00330' /><span style='color:blue'> <ww:property value='#session.local.a00215' /></span>"
			},  	
			{  
				element: '#step2',  
				intro: "<ww:property value='#session.local.a00330' /><span style='color:blue'> <ww:property value='#session.local.a00217' /></span>"
			},  	
			{  
				element: '#step3',  
				intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00869' /></span>,<ww:property value='#session.local.a00969' />",
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

function adduser(){
	    var name = document.getElementById('name').value;	
	    var account = document.getElementById('account').value;
	    var password = document.getElementById('password').value;
		var powerid = document.getElementById('powerid').value;	
	    if (account.length < 1){
	    	 layer.msg("<ww:property value='#session.local.a00225' />");
             return;
		}

	    if (password.length < 1) {
	    	layer.msg("<ww:property value='#session.local.a00228' />");
			return;
	    }
	    

	    if (name.length < 1) {
	    	layer.msg("<ww:property value='#session.local.a00212' /><ww:property value='#session.local.a00691' />");
			return;
	    }

	   
	    
	    if(containSpecial(name)){
	    	layer.msg("<ww:property value='#session.local.a00212' /><ww:property value='#session.local.b00094' />:% & +"); 
           return;
		}
	    if(containSpecial(account)){
	    	layer.msg("<ww:property value='#session.local.a00211' /><ww:property value='#session.local.b00094' />:% & +"); 
           return;
		}

	    if(isChn(password)){

		}else{
			layer.msg("<ww:property value='#session.local.a00047' /><ww:property value='#session.local.b00095' />"); 
            return;
	    }
	    if(containSpecial(password)){
	    	layer.msg("<ww:property value='#session.local.a00047' /><ww:property value='#session.local.b00094' />:% & +"); 
            return;
		}
		
		
	   
	    
	    if(powerid==0) {
	    	layer.msg("<ww:property value='#session.local.a00229' />");
			return;
	    }


	    if("<ww:property value='#session.version_onoff.pwdPloy'  />"==1){

	    	 if(account==password){
	    		 	
	 	            layer.alert("<ww:property value='#session.local.b00240' />");
	 	            return;
	 	
	 	      }

	    	  var newpwdFlag=checkPwd(password);

	 	      if(!newpwdFlag){

		 	      return;

		 	  }
	 	      

	    }    

	    $.ajax({
			type:'post',
			url:'ajaxcheckaccount.vs',
			data:"cAccount="+$("#account").val(),
			datatype:'json',
			async:true,
			success:function(data){
			   if(data=="1"){

				   document.form1.target = "_self";
			   	   document.form1.action = 'aduser.vs'; 
			   	   document.form1.submit();
			   	   
			   }else if(data=="0"){
				   layer.msg("<ww:property value='#session.local.a00230' />");
			   }
			}
		});
}




function check_account(){

	//alert("失去焦点");
	$.ajax({
		type:'post',
		url:'ajaxcheckaccount.vs',
		data:"cAccount="+$("#account").val(),
		datatype:'json',
		async:true,
		success:function(data){
		  
		   if(data=="1"){
			   document.getElementById("acshow").innerHTML="";
		   }else if(data=="0"){
			   document.getElementById("acshow").innerHTML="&nbsp;<ww:property value='#session.local.a00230' />";
		   }
		   
		}
	});
}





</script>

</head> 
<body onload="init_self()">
 <div class="panel panel-primary" style="margin: 3px 3px;border: 0px;">
 
  <div class="panel-heading">
        <ww:property value="#session.local.a00224"/> <!-- 新增用户-->
  </div>
   
   <form  name="form1" method="post" >
       <div class="container clearfix" style="margin: 10px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		              
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                         <tr>
		                            <th width="200px"><i class="require-red"></i><ww:property value='#session.local.a00223' />：</th>
		                            <td>
		                               <input class="common-text required"  value="<ww:property value='funame' />"  disabled="disabled"  type="text"/>
		                               <input value="<ww:property value='fuid' />"    type="hidden"  name="fuid"/>
		                            </td>
		                          </tr>
		                          
		                         <tr>
		                             <th width="300"><i id="step1" class="require-red">*</i><ww:property value='#session.local.a00211' />：</th>
		                             <td>
		                               <input class="common-text required"  onblur="check_account()"  id="account" name="user.account"   type="text"/><span style="color: red;" id="acshow"></span>
		                             </td>
		                         </tr>
		                            <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00047' />：</th>
		                                <td>
		                                     <input  class="common-text required"  id="password" name="user.password" value=""  type="password"/>
		                                </td>
		                            </tr>
		                            <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00212' />：</th>
		                                <td>
		                                     <input  class="common-text required" id="name" name="user.name"  value=""  type="text"/>
		                                </td>
		                            </tr>
		                            
		                            <tr>
		                                <th><i class="require-red"></i><ww:property value='#session.local.a00214' />：</th>
		                                <td>
		                                     <input  class="common-text required" id="phone" name="user.phone"  value=""  type="text"/>
		                                </td>
		                            </tr>
		                            
		                            <tr>
		                                <th><i class="require-red"></i><ww:property value='#session.local.a00213' />：</th>
		                                <td>
		                                     <input  class="common-text required" id="email" name="user.email"  value=""  type="text"/>
		                                </td>
		                            </tr>
		                           <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00215' />：</th>
		                                <td>
		                                    <select  style="width: 170px; border:1px solid #495764;" id="powerid" class="user.powerid" name="user.powerid">
												<option value="0">----</option>
												<ww:iterator value="powers">
												   <ww:if test="id!=1">
													    <option  value="<ww:property value="id" />"><ww:property value="name" /></option>
												   </ww:if>		
												</ww:iterator>
											</select>
		                                </td>
		                            </tr>
		                            <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.a00167' />：</th>
		                                <td>
		                                     <select id="step2" name="user.ocheck">
	<!--											<option value="0"><ww:property value='#session.local.a00219' /></option> -->
												    <option value="1"><ww:property value='#session.local.a00218' /></option>
												    <option value="2"><ww:property value='#session.local.a00220' /></option>
	<!--											<option value="3"><ww:property value='#session.local.a00221' /></option>-->
											 </select>
		                                </td>
		                            </tr>
		                            
		                             <tr>
		                                <th><i class="require-red">*</i><ww:property value='#session.local.b00298' />：</th>
		                                <td>
		                                     <select id="step2" name="user.jhocheck">
	<!--											<option value="0"><ww:property value='#session.local.a00219' /></option> -->
												    <option value="1"><ww:property value='#session.local.a00218' /></option>
												    <option value="2"><ww:property value='#session.local.b00299' /></option>
	<!--											<option value="3"><ww:property value='#session.local.a00221' /></option>-->
											 </select>
		                                </td>
		                            </tr>
		                            
		                            
		                            <tr style="height: 40px;">
		                                <th></th>
		                                <td>
		                                    <button id="step3" class="btn btn-primary" onclick='adduser()' type="button"><ww:property value='#session.local.a00080' /></button>
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
