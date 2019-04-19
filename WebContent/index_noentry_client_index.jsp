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


<link rel="stylesheet" href="../css/index.css"/>
<script type="text/javascript" src="../js/jq/jquery.js"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>
<script type="text/javascript" src="../js/two_menu.js"></script>
<script type="text/javascript" src="../js/fresh.js"></script>
<script type="text/javascript" src="../js/constant.js"></script>
<script type="text/javascript" src="../js/<ww:property value='#session.local.a00000' />/common.js"></script>

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="../zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />

<script type="text/javascript">

var openIntro;
//初始化显示
function initshow(){
	
	openIntro = <%=request.getParameter("openIntro")%>;

	var code="<ww:property value='info'/>";

    if(code=="100001"){
        //验证失败(账号或者密码不对)
        layer.msg("<ww:property value='#session.local.a00507' />[<ww:property value='#session.local.a00506' />]"); 
	}else if(code=="100002"){
       //使用点位数超出总点位数
	    layer.msg("<ww:property value='#session.local.a00508' />[<ww:property value='#session.local.a00506' />]");
	}else if(code=="100003"){
	   //录入成功	
		layer.msg("<ww:property value='#session.local.a00509' />[<ww:property value='#session.local.a00506' />]");

		if(openIntro == '2'){
			intro = introJs();  
			intro.setOptions({
			prevLabel:"<ww:property value='#session.local.a00861' />", 
	        nextLabel:"<ww:property value='#session.local.a00862' />",
	        skipLabel:"<ww:property value='#session.local.a00863' />",
	        doneLabel:"<ww:property value='#session.local.a00863' />",
			showStepNumbers: false,
			showBullets: false,
			exitOnOverlayClick: false,
			overlayOpacity: 0.6,  
			steps: [
				{
					element: '#step4',
					intro: "<ww:property value='#session.local.b00180' />"
				}
			  ]  
			});  
	
			intro.goToStep(2).start();
			
			intro.oncomplete(function() {  
				intro.exit();  
		    });
	
			intro.onexit(function() {
				layer.msg("<ww:property value='#session.local.a00864' />");
			});
		}
	}


    

	if(openIntro == '1'){
		openIntro = null;
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
				element: document.getElementsByClassName('qx')[0],  
				intro: "<span style='color:blue;'><ww:property value='#session.local.a00865' /></span> <ww:property value='#session.local.a00885' />"
			},
			{
				element: document.getElementsByName('cName')[0],
				intro: "<ww:property value='#session.local.a00886' />"
			},
			{
				element: '#step2',  
				intro: "<ww:property value='#session.local.a00874' /><span style='color:blue;'> <ww:property value='#session.local.a00407' /></span><ww:property value='#session.local.a00887' />",
				position: "left"
			}
		  ]  
		});  

		intro.start().oncomplete(function() {  
			intro.exit();  
	    });

		intro.onexit(function() {
			layer.msg("<ww:property value='#session.local.a00864' />");
		});
	}
}



//录入终端
function noterminal(){
	 var ids=document.getElementsByName('qx');
     var clientname="";
     var clientnumber="";
     var zzbd=/[@#\$%\-_\^&\*]+/g;
	 for(var i=0;i<ids.length;i++) 
	 { 
	    if(ids[i].checked==true) 
	    { 
	    	clientname=document.getElementById('client_'+ids[i].value).value;
	    	clientnumber=document.getElementById('client_number_'+ids[i].value).value;
	    	if(zzbd.test(clientname))
	 	    {
	 		   layer.msg("<ww:property value='#session.local.d00023' />"); 
	 		   return;
	 	    }
	    	ids[i].value=ids[i].value+"_"+clientname+"_"+clientnumber;
	    } 
	 } 

     var isSel=false; 
	  for(var i=0;i<ids.length;i++) 
	   { 
	    if(ids[i].checked==true) 
	    { 
	      isSel=true; 
	      break; 
	    } 
	   } 
	   if(isSel==false) 
	   { 
	    layer.msg("<ww:property value='#session.local.a00409' />"); 
	    return ; 
	   }
	   
	   if(<%=request.getParameter("openIntro")%>=='1'){
		   openIntro=2;
	   }
	 
	   
	   document.form1.action="enterclient.vs?openIntro="+openIntro;
	   document.form1.submit();
}
//清理未录入终端
function clear_enter_client(){
	var ids=document.getElementsByName('qx'); 
    var isSel=false; 
	  for(var i=0;i<ids.length;i++) 
	   { 
	    if(ids[i].checked==true) 
	    { 
	       isSel=true; 
	       break; 
	    } 
	   } 
	   if(isSel==false) 
	   { 
	    layer.msg("<ww:property value='#session.local.a00409' />"); 
	    return ; 
	   }
	   document.form1.action="clearLrTerminal.vs";
	   document.form1.submit(); 	
}
function show_tips_time(sv,cname){
	
	layer.tips(cname, '#'+sv,{time: 8000});
	
} 
//发送广播
function send_lan(){
	var ip=document.getElementById("ip").value;
	
	ip=ip.replace(/(^\s*)|(\s*$)/g, "");
    if(ip.length==0){
       layer.msg("<ww:property value='#session.local.a00573' />"); 
       return;
    } 
	
	document.form1.action="sendbroadcast.vs";
	document.form1.submit(); 
	
}
//刷新
function a_load(){
   window.location.href="tonoclient.vs";
	
}


/*删除节目*/
function del_no_enter_client(url){

	 var val = "";
	 var ids=document.getElementsByName('qx'); 
     var isSel=false; 
     for(var i=0;i<ids.length;i++) 
     { 
        if(ids[i].checked==true) 
        { 
    	  val += ids[i].value+",";
      	  isSel=true; 
        } 
     } 
     if(isSel==false) 
     { 
    	 layer.msg("<ww:property value='#session.local.a00018' />"); 
         return; 
     }

     layer.confirm("<ww:property value='#session.local.a00092' />?", {icon: 3, title:"<ww:property value='#session.local.a00093' />",btn: ["<ww:property value='#session.local.a00080' />", "<ww:property value='#session.local.a00014' />"]}, function(index,layero){
		   document.form1.action=url;
		   document.form1.submit();
	 });
	   

     
}


</script>
</head>
<body onload="initshow()">
 <form  name="form1" method="post" >
	<div class="title bottom">
			<div class="t_container">
				<div class="loc">
		        
				     &nbsp;&nbsp;<ww:property value='#session.local.a00405' /> :
		             <span class="material_bg"><ww:property value='#session.local.a00404' /></span>
					        
				</div>
			</div>
	</div>

	<div class="c_middle download_manager">
	    
	
		
		<div>
		      <div class="c_right_header" style="height:48px;margin-left: 30px;" >
			
				<div>
				      
				      <div class="col-xs-1">
					      <ww:property  value="#session.local.a00570"/>: 
					  </div>
					  
					  <div class="col-xs-2" style="margin-left:-30px;">
					     <input name="ip" id="ip"  onmouseover="show_tips_time('ip_button','<ww:property value='#session.local.a00574' />')"   type="text" style="width: 200px;" class="form-control input-sm"  value="<ww:property value='ip' />"/> 
					  </div>
					   
					  <div class="col-xs-3" style="margin-left:0px;" >
					     	<button  onclick="send_lan()" id="ip_button" class="btn btn-sm btn-primary" type="button" ><ww:property value='#session.local.a00569' /></button>
					  </div> 
					  
					  <div class="btn-group" style="float: right;margin-right: 50px;">
						  <button onclick="a_load()"       type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00422' /></button>
						  <button id="step2" onclick="noterminal()"   type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00407' /></button>
						   <button onclick="del_no_enter_client('delEnterClient.vs')"  type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button><!-- 删除 -->
						   
				      </div>				  
				 </div>
				 
				
			</div>
	        <!--显示内容-->
	        <div style="height: 400px;width:1080px;margin-top: -10px;" >
	             <!-- 固定标题 -->
	             <div style="padding-right:17px;margin-left: 30px;">
	                 <table style="margin: 0px;" border="0" cellpadding="0" cellspacing="0">
						<tr class="cell_element cell_first">
						<td style="width:10%" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
					    <td style="width:10%" align="center"><ww:property value='#session.local.a00034' /></td>
						<td style="width:30%" align="center"><ww:property value='#session.local.a00038' /></td>
						<td style="width:30%" align="center"><ww:property value='#session.local.d00024' /></td>
						<td style="width:20%" align="center"><ww:property value='#session.local.a00040' /></td>
						</tr>
					 </table>	
	             </div>
	             <div id="step1" style="height: 400px;overflow: auto;margin-top:-5px;margin-left: 30px;">
	                <table style="margin: 0px;" border="0" cellpadding="0" cellspacing="0">
					
						<ww:iterator value="noclients">
							<tr class="cell_element cell_show">
							  <td style="width:10%" align="center">
							  	 <input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
							  </td>
							  <td style="width:10%" align="center">
							     <ww:property value="id" />
							  </td>
							  <td style="width:30%" align="center">
							     <input type="text" name="cName" class="client_<ww:property value='id' />" id="client_<ww:property value='id' />" 
							     
							          value="<ww:if test='name==null'><ww:property value='#session.local.a00410' /></ww:if><ww:else><ww:property value='name' /></ww:else>"
									/>
							  </td>
							  <td style="width:30%" align="center">
							      <input type="text" name="cColumn" class="client_number_<ww:property value='id' />" id="client_number_<ww:property value='id' />" 
							     
							          value='' />
									
							  </td>
							  <td style="width:20%" align="center">
							     <ww:property value="mark" />
							  </td>
							</tr>
						</ww:iterator>				
					</table>
				</div>
			</div>
	        <!--分页-->
			<div class="nav" style="width: 1000px;margin-left:20px;">
				<ul class="pg">
	                <!-- 上一页-->
					<li><a href="javascript:pageto(<ww:property value='qian' />,'tonoclient.vs');" class="pg_f"></a></li>
		            <!--页码显示上-->
					<ww:iterator id="q"  value="ps.qs">
		                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'tonoclient.vs');" ><ww:property value="#q"  /></a> </li>
		            </ww:iterator>
		            
		            <!--当前页码-->
		            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'tonoclient.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
		            
		             <!--页码显示下-->
		            <ww:iterator id="h"  value="ps.hs">
		                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'tonoclient.vs')"><ww:property value="#h"  /></a></li>
		            </ww:iterator>
		            
	                <!--下一页-->
		            <li><a href="javascript:pageto(<ww:property value='hou' />,'tonoclient.vs');" class="pg_e"></a></li>
				</ul>
			    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('tonoclient.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
			    
				<div class="pg_count">
				     
				     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
				     <a href="javascript:setpagetype(10,'tonoclient.vs');" <ww:if test='pagetype==10'>style="background-color:#FFA534;"</ww:if> >10</a>
				     <a href="javascript:setpagetype(20,'tonoclient.vs');" <ww:if test='pagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
				     <a href="javascript:setpagetype(30,'tonoclient.vs');" <ww:if test='pagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
				     <a href="javascript:setpagetype(<ww:property value='total'/>,'tonoclient.vs');" <ww:if test='pagetype==total'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
				     
				</div>
				
				<!--隐藏域 -->
	            
	            <!--当前页码-->
				<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
	            <!--总页码-->
	            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
	            <!--每页显示页数-->
	            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='pagetype'/>" />
	        
			</div>
		</div>
	</div>
</form>
</body>
</html>
