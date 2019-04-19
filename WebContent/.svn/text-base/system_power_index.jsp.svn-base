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
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<script type="text/javascript">
var intro;

function init_self(){
	var openIntro = <%=request.getParameter("openIntro")%>;

	if(openIntro == '1'){
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
			    element: '#step0',
			    intro: "<ww:property value='#session.local.a00954' />"
			},  	
			{  
				element: '#step1',  
				intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00021' /></span><ww:property value='#session.local.a00887' />"
			}
		  ]  
		});  

		document.getElementById("step1").onclick = function (){
			intro.exit();
			open_power_add_1();
			document.getElementById("step1").onclick = function (){
				open_power_add();
			};
		};
		intro.start().oncomplete(function() {  
			intro.exit();  
			document.getElementById("step1").onclick = function (){
				open_power_add();
			};
	    });

		intro.onexit(function() {
			layer.msg("<ww:property value='#session.local.a00864' />");
			document.getElementById("step1").onclick = function (){
				open_power_add();
			};
		});
	}else if(openIntro=='2'){
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
				element: document.getElementsByClassName('icon-edit')[0],
				intro: "<ww:property value='#session.local.a00955' /><span style='color:blue'> <ww:property value='#session.local.a00017' /></span><ww:property value='#session.local.a00956' />"
			}
		  ]  
		});  

		document.getElementsByClassName('icon-edit')[0].onclick = function(){
			intro.exit();
			open_power_update_1(document.getElementsByClassName('qx')[0].value);
			document.getElementsByClassName('icon-edit')[0].onclick =function(){
				open_power_update(document.getElementsByClassName('qx')[0].value);
			};
		};

		intro.start().oncomplete(function() {  
			intro.exit();
			document.getElementsByClassName('icon-edit')[0].onclick = function(){
				open_power_update(document.getElementsByClassName('qx')[0].value);
			};
	    });

		intro.onexit(function() {
			layer.msg("<ww:property value='#session.local.a00864' />");
		});
	}else if(openIntro=='3'){
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
				element: document.getElementsByClassName('qx')[0],  
				intro: "<span style='color:blue'><ww:property value='#session.local.a00865' /></span><ww:property value='#session.local.a00957' />"
			},
			{
				element: '#step3',
				intro: "<ww:property value='#session.local.a00958' />,<span style='color:blue'> <ww:property value='#session.local.a00959' /></span>"
			},
			{
				element: '#step4',
				intro: "<ww:property value='#session.local.a00960' />"
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

/*(新手指引)弹出新增权限*/
function open_power_add_1(){
	layer.open({
 		type: 2,
         area: ['1100px', '600px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启 
         content: 'system_power_add.jsp?openIntro=1',
         scrollbar: false,
         end: function(){ 
		   document.form1.target = "_self";
		   if(window.returnValue == 'close'){
			   document.form1.action = "topowerlist.vs"; 
		   }else{
			   document.form1.action = "topowerlist.vs?openIntro=2"; 
		   }
		   document.form1.submit();     
 		}
 	});            
} 

/*弹出新增权限*/
function open_power_add(){
	layer.open({
 		type: 2,
         area: ['1100px', '600px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启 
         content: 'system_power_add.jsp',
         scrollbar: false,
         end: function(){ 
		   document.form1.target = "_self";
		   document.form1.action = "topowerlist.vs"; 
		   document.form1.submit();     
 		}
 	});            
} 

/*(新手指引)弹出修改权限*/
function open_power_update_1(pid){
	layer.open({
 		type: 2,
         area: ['1100px', '600px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'touppower.vs?pid='+pid+"&openIntro=1",
         scrollbar: false,
         end: function(){ 
		   document.form1.target = "_self";
		   if(window.returnValue == 'close'){
			   document.form1.action = "topowerlist.vs"; 
		   }else{
			   document.form1.action = "topowerlist.vs?openIntro=3"; 
		   }
		   document.form1.submit();     
 		}
 	});            
} 

/*弹出修改权限*/
function open_power_update(pid){
	layer.open({
 		type: 2,
         area: ['1100px', '600px'],
         offset: '10px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'touppower.vs?pid='+pid,
         scrollbar: false,
         end: function(){ 
		   document.form1.target = "_self";
		   document.form1.action = "topowerlist.vs"; 
		   document.form1.submit();     
 		}
 	});            
} 

</script>
</head>
<body onload="init_self()">
 <form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			        <ww:property value='#session.local.a00065' /> :
			        <span class="function"><ww:property value='#session.local.a00010' /></span>
			        <span class="material_bg"><ww:property value='#session.local.a00131' /></span>
			</div>
			
		</div>
</div>

<div class="c_middle download_manager">
    

	    <!--素材菜单-->
	<div>
	    <div class="c_right_header" style="height: 48px;">
		
			
		     <div class="row">
			      <div class="btn-group" style="float: right;margin-right: 80px;">
				       <button id="step1" onclick="open_power_add()"   type="button" class="btn btn-sm btn-success"><ww:property value='#session.local.a00021' /></button><!-- 新增 -->
				       <button id="step3" onclick="del_sel('delpower.vs')"        type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button>
				   </div>	
			 </div>
			 
			 
		</div>
       <!--显示内容-->
         <div style="height: 400px;width: 1050px;" >
           <!-- 固定标题 -->
           <div style="padding-right:17px;margin: 0px;">
             <table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
            <tr class="cell_element cell_first">
		    <td style="width:20%" align="center">&nbsp;<input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
			<td style="width:40%"><ww:property value='#session.local.a00133' /></td>
			<td style="width:40%">&nbsp;&nbsp;<ww:property value='#session.local.a00016' /></td>
			
			</tr>
			 </table>
			 </div>
           <div id="step2" style="height: 400px;overflow: auto;overflow-y:scroll;">
			<table border="0" cellpadding="0" cellspacing="0" style="margin-top:0px;margin-bottom: 0px;">
			<ww:iterator value="powers">
			    <ww:if test="id!=1">
					<tr class="cell_element cell_show">
					 
						  <td style="width:20%" align="center">
						    <input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
						  </td>
						  <td style="width:40%">
						     <ww:property value="name"  /> 
						  </td>
						  <td style="width:40%">
						       <!-- 修改 -->
						       <i title="<ww:property value='#session.local.a00017' />" style="padding: 4px 8px;cursor: pointer;float: left;"  class="icon icon-edit" onclick="open_power_update(<ww:property value='id' />)"  ></i>					    
						  </td>
						
				    </tr>
				</ww:if>
			</ww:iterator>
			
			</table>
			</div>
		</div>
        <!--分页-->
		<div class="nav" style="width: 1000px;margin-left:20px;">
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'topowerlist.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'topowerlist.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'topowerlist.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'topowerlist.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'topowerlist.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('topowerlist.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'topowerlist.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
			     <a href="javascript:setpagetype(20,'topowerlist.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'topowerlist.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'topowerlist.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			</div>
			
			<!--隐藏域 -->
            
            <!--当前页码-->
			<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
            <!--总页码-->
            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
            <!--每页显示页数-->
            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
        
		</div>
	</div>
</div>
</form>
</body>
</html>
