<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<title></title>
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/common.css"/>
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/fresh.js" language="javascript"></script>
<base target="_self" />
<style type="text/css">
A{text-transform:none; text-decoration:none;}   
</style>
<style>
*{margin:50;padding:0;}
body{font-size:14px;font-family:"Microsoft YaHei";}
ul,li{list-style:none;}

#tab{position:relative;}
#tab .tabList ul li{
	float:left;
	background:#fefefe;
	background:-moz-linear-gradient(top, #fefefe, #ededed);	
	background:-o-linear-gradient(left top,left bottom, from(#fefefe), to(#ededed));
	background:-webkit-gradient(linear,left top,left bottom, from(#fefefe), to(#ededed));
	border:1px solid #ccc;
	padding:5px 0;
	width:300px;
	text-align:center;
	margin-left:-1px;
	position:relative;
	cursor:pointer;
}
#tab .tabCon{
	position:absolute;
	left:-1px;
	top:32px;
	border:1px solid #ccc;
	border-top:none;
	width:600px;
	height:400px;
}
#tab .tabCon div{
	padding:10px;
	position:absolute;
	opacity:0;
	filter:alpha(opacity=0);
}
#tab .tabList li.cur{
	border-bottom:none;
	background:#F4F4F4;
}
#tab .tabCon div.cur{
	opacity:1;
	filter:alpha(opacity=100);
}
</style>
<script>
window.onload = function() {
    var oDiv = document.getElementById("tab");
    var oLi = oDiv.getElementsByTagName("div")[0].getElementsByTagName("li");
    var aCon = oDiv.getElementsByTagName("div")[1].getElementsByTagName("div");
    var timer = null;
    for (var i = 0; i < oLi.length; i++) {
        oLi[i].index = i;
        oLi[i].onclick = function() {
            show(this.index);
        };
    }

    function show(a) {
        index = a;
        var alpha = 0;
        for (var j = 0; j < oLi.length; j++) {
            oLi[j].className = "";
            oLi[j].style.backgroundColor="#FFFFFF";
            aCon[j].className = "";
            aCon[j].style.opacity = 0;
            aCon[j].style.filter = "alpha(opacity=0)";
		
        }
		oLi[index].className = "cur";
		oLi[index].style.backgroundColor="#F4F4F4";
        clearInterval(timer);
        timer = setInterval(function() {
            alpha += 2;
            alpha > 100 && (alpha = 100);
            aCon[index].style.opacity = alpha / 100;
            aCon[index].style.filter = "alpha(opacity=" + alpha + ")";
            alpha == 100 && clearInterval(timer);
        },
        5);
    
    }
};   


function gosubmit()
{
	
    return true;
}

//场景跳转
function addsurl(){

	var scenename=document.getElementById("scenename").value;
	if(scenename.length==0){
           layer.msg("<ww:property value='#session.local.a00442' />");
           return;
    }
	scenename=scenename.replace(new RegExp(/(@)/g),'');
    var myDate = new Date();
	var newurl="a"+myDate.getTime()+parseInt(Math.random() * 100);
	 //document.getElementById("interacturl").value=newurl;       
   	 //document.form1.action="adinteractto.vs";
   	 //document.form1.submit();
   	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
    window.parent.returnValue="scenestype#"+newurl+"@"+scenename; 
    window.parent.layer.close(index);       

}
function selurl(fnamen){
	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
    window.parent.returnValue="scenestype#"+fnamen; 
    window.parent.layer.close(index);	
}
//app跳转
function addapp(){
	//获取包名
	var packages=document.getElementById("packages").value;
	if(packages.length==0){
        layer.msg("<ww:property value='#session.local.a00631' />");
        return;
    }
	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
    window.parent.returnValue="apptype#"+packages; 
    window.parent.layer.close(index);   
}
</script>
</head>
<body>
<form action="adtxtto.vs" method="post" name="form1" onsubmit="return gosubmit();" >
<!-- 代码 begin -->
<div id="tab" style="margin-top: 20px;margin-left: 10px;">
  <div class="tabList">
	<ul>	   
		<ww:if test="stype==''||stype=='scenestype'">
		   <li  <ww:if test="stype==''||stype=='scenestype'"> class="cur"  </ww:if> ><ww:property value="#session.local.a00628" /></li><!--场景跳转 -->
		</ww:if>
		<ww:if test="stype==''||stype=='apptype'">   
		   <li <ww:if test="stype=='apptype'"> class="cur"  </ww:if> > <ww:property value="#session.local.a00629" /></li>                <!--App跳转 -->
		</ww:if>	
	</ul>
  </div>
  <div class="tabCon">
    <ww:if test="stype==''||stype=='scenestype'">
		<div <ww:if test="stype==''||stype=='scenestype'"> class="cur"  </ww:if>>
			<table class="insert-tab" width="100%">
	           <tr>
		            <td style="text-align:right;" width="120"><ww:property value="#session.local.a00438" />:</td><!-- 当前链接 -->
		            <td>
                       <span><ww:property value='selfname' /></span>
		            </td>
		            <td></td>
	          </tr>
			   <tr>
		            <td style="text-align: right;">
		               <ww:property value="#session.local.a00439" />:
		            </td> <!-- 新增链接 -->
		            <td>
		               <input type="text" style="width: 250px;" value="" id="scenename" />
		            </td>
		            <td>
		               <input  type="button"  onclick="addsurl()"  value="<ww:property value='#session.local.a00021' />" style=" width:80px ;color: #495764;font-family:Microsoft YaHei;"   class="button1" />
		            </td>
	          </tr>
	         <ww:iterator  value="scenes" status="status"> 
		         <tr>
		            <td style="text-align: right;">
		               <ww:if test="#status.index==0">
		                   <ww:property value="#session.local.a00440" />:<!-- 选择已有 -->
		                </ww:if>
		            </td> 
		            <td>
	                       <a target="_blank" href="files/<ww:property value='filename'/>/see.html"> 
	                        <ww:property value="name" />
	                       </a>
		            </td>
		            <td>  
		                <input  type="button"  onclick="selurl('<ww:property value='filename' />@<ww:property value='name' />')"  value="<ww:property value='#session.local.a00330' />" style=" width:80px ;color: #495764;font-family:Microsoft YaHei;"   class="button1" />
		            </td>
			      </tr>
	          </ww:iterator>
			
	        </table>
		</div>
	</ww:if>
	<ww:if test="stype==''||stype=='apptype'">
		<div <ww:if test="stype=='apptype'"> class="cur"  </ww:if> >
	       <table class="insert-tab" width="100%">
	           <tr>
	            <td style="text-align: right;" width="120"><ww:property value="#session.local.a00630" />:</td><!-- 包名 -->
	            <td>
	               <input  type="text" style="width: 250px;" value="<ww:property value='apppack' />" id="packages" />
	            </td>
	            <td>
	               <input  type="button"  onclick="addapp()"  value="<ww:property value='#session.local.a00080' />" style=" width:80px ;color: #495764;font-family:Microsoft YaHei;"   class="button1" />
	            </td>
	          </tr>   
		   </table>
		</div>
	</ww:if>
  </div>
</div>

</form>

</body>
</html>
