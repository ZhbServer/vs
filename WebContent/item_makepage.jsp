<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="PRAGMA" content="NO-CACHE">
<title></title>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/icon.css"  />
<link href="css/ruler.css" rel="stylesheet" type="text/css" />

<style type="text/css"> 
	.skin1 { 
	
	    position:absolute;
	    font-size: 10pt;
	    width:70px; 
	    background-color:#cccccc;
	    visibility:hidden;
	    border: 1px solid #bbb;
	    background: #eee;
	    background: -webkit-linear-gradient(to bottom, #fff 0%, #e5e5e5 100px, #e5e5e5 100%);
	    background: linear-gradient(to bottom, #fff 0%, #e5e5e5 100px, #e5e5e5 100%);
	    border-radius: 3px;
	    box-shadow: 1px 1px 4px rgba(0,0,0,.2);   
	    -webkit-transform: translate(0, 15px) scale(.95);
	    transform: translate(0, 15px) scale(.95);
	    transition: transform 0.1s ease-out, opacity 0.1s ease-out;
	}

    .menuitems{
    
		padding-left:15px;
		padding-right:10px;
        background: none;
        line-height: normal;
        overflow: visible;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        display: block;
        width: 100%;
        color: #444;
        font-family: 'Roboto', sans-serif;
        font-size: 13px;
        text-align: left;
        cursor: pointer;
        border: 1px solid transparent;
        white-space: nowrap;
        padding: 2px 8px;
        border-radius: 3px;
    }

</style>


<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>


<script type="text/javascript">
   

  //初始化 
  function bginit(){
	  
     var topfddiv=document.getElementById("topfd");

     //设置操作区透明度
     topfddiv.style.opacity="0.8";
     
     //topfddiv.style.filter= 'progid:DXImageTransform.Microsoft.Alpha(opacity=80)';
   
     //var tx="<ww:property value='#session.scene.tx'/>";

     //var ty="<ww:property value='#session.scene.ty'/>";

     //var cjzoom="<ww:property value='cjzoom'/>";

     //tx=Math.round(tx*cjzoom);
     //ty=Math.round(ty*cjzoom);
     
     //if(tx!=0&&ty!=0){
     //	 $("#topfd").width(tx);
     //	 $("#topfd").height(ty);
     //}
     

     
   }

   </script>

</head>

<body onload="bginit()"    oncontextmenu='return false' style="margin: 0px;padding: 0px;background-image: url('images/bg.png');background-position:18px 18px;">
    
    <div class="grid" id="total" style="left: 19px;top: 19px;">
    
       <!-- 网页主体内容 开始 -->
      <div id='topfd'   onmousedown="showmenuie5(event)" title='<ww:property value="bfile"/>'  style='margin: 0px;padding: 0px;left:0px; top:0px;background-color:#CFDBE5;background-image: url("files/<ww:property value="#session.scene.filename"/>/<ww:property value="bfile"/>");
		width:<ww:property value="#session.scene.tx*cjzoom"/>px;height:<ww:property value="#session.scene.ty*cjzoom"/>px;POSITION: absolute;'>
      </div>
       <!-- 网页主体内容 结束 -->
    </div>
    
    <!-- 鼠标右键 -->
      <div class="hRule" style="width: <ww:property value="#session.scene.tx"/>px;"></div>
	  <div class="vRule" style="height: <ww:property value="#session.scene.ty"/>px;"></div>       
	  <div class="vline1" style="height:<ww:property value="#session.scene.ty"/>px;"></div>
	  <div class="vline2" style="height:<ww:property value="#session.scene.ty"/>px;"></div>
	  
	  <div id="ie5menu" onClick="jumptoie5();" class="skin1" style="z-index:1000">
	  <div class="menuitems" onMouseOver="overto(this)" id="me6"><ww:property value="#session.local.a00436" /></div>   <!-- 添加链接 -->
	  <div class="menuitems" onmouseover="overto(this)" id="me1"> <ww:property value="#session.local.a00274" /></div>  <!-- 全屏 -->
	  <div class="menuitems" onMouseOver="overto(this)" id="me2"><ww:property value="#session.local.a00017" /></div>   <!--修改  --> 
	  <div class="menuitems" onMouseOver="overto(this)" id="me3"><ww:property value="#session.local.a00025" /></div>   <!-- 删除 -->
	  <div class="menuitems" onMouseOver="overto(this)" id="me4"><ww:property value="#session.local.a00275" /></div>   <!-- 上一层 -->
	  <div class="menuitems" onMouseOver="overto(this)" id="me5"><ww:property value="#session.local.a00276" /></div>   <!-- 下一层 -->
   </div>
</body>
<script type="text/javascript">


    //拖拽大小限制
    function onStopResize(e){

	     var topfd = document.getElementById("topfd");
	     var w = topfd.offsetWidth;
	     var h = topfd.offsetHeight;
	
	
	     var d = e.data;
	     if (d.left < 0){d.left = 0;}
	     if (d.top < 0){d.top = 0;}
	  
		 if (d.left + $(d.target).outerWidth() > w){		
			$(d.target).outerWidth(w-d.left);		   
		 }
	     if (d.top + $(d.target).outerHeight() > h){		
		    $(d.target).outerHeight(h-d.top);
	     }
	  
     }

     //document.execCommand("2D-position", false, true);

     document.onkeydown = function () {
         
        
	    if (window.event && window.event.keyCode == 13) {
		    
	        window.event.returnValue = false;
	        
	    }
    
        if (window.event && window.event.keyCode == 8) {

    	    var divFont=document.getElementById(parent.font.id);

	    	if(divFont.id.substring(0,5)=="fonts"){
	
	    		var divFontHtml=Trim(divFont.innerHTML);
	            
	        	if(divFontHtml.length==0||divFont.innerHTML=="<br>"||divFont.innerHTML=="<BR>"){
	
	        		window.event.returnValue = false;
	        		
	            }
	
	        }

         }  
     }
     
	function Trim(str)
	{ 
		 return str.replace(/(^\s*)|(\s*$)/g, ""); 
	}
	


    //点击元素 把当前点击的元素赋给font
	function getdiv(ob)
	{
		parent.font=ob;
	}

	function overto(div)
	{ 
		
		document.getElementById("me1").style.color='#000000';
		document.getElementById("me2").style.color='#000000';
		document.getElementById("me3").style.color='#000000';
	    document.getElementById("me4").style.color='#000000';
		document.getElementById("me5").style.color='#000000';
		document.getElementById("me6").style.color='#000000';
		div.style.color="red";
	}


	//鼠标右键显示的菜单
    function showmenuie5(event) {

	    //右键显示菜单
		if (event.button==2)
		{

	        document.getElementById("me1").style.color='#000000';
		    document.getElementById("me2").style.color='#000000';
		    document.getElementById("me3").style.color='#000000';
			document.getElementById("me4").style.color='#000000';
			document.getElementById("me5").style.color='#000000';
			document.getElementById("me6").style.color='#000000';
			
			parent.divv = event.srcElement;
			
			var divid=parent.divv.id;
			
			var key=divid.substring(0,5);
			
			if(key=="himag"||key=="myapp"){
				
				//document.getElementById("me6").style.color='#000000';
				//document.getElementById("me6").style.display ="block"; 
				document.getElementById("me2").style.display = "none";
				document.getElementById("me6").style.display = "none";   
		    }else{
		    	document.getElementById("me2").style.color='#000000';
				document.getElementById("me2").style.display ="block"; 
				document.getElementById("me6").style.display = "none"; 
			}	
		    parent.menugo=true;
			var rightedge = document.body.clientWidth-event.clientX;
			var bottomedge = document.body.clientHeight-event.clientY;
		    if (rightedge < ie5menu.offsetWidth)
		      ie5menu.style.left = document.body.scrollLeft + event.clientX - ie5menu.offsetWidth;
		    else
		    ie5menu.style.left = document.body.scrollLeft + event.clientX;
		    if (bottomedge < ie5menu.offsetHeight)
		      ie5menu.style.top = document.body.scrollTop + event.clientY - ie5menu.offsetHeight;
		    else
		    ie5menu.style.top = document.body.scrollTop + event.clientY;
		    ie5menu.style.visibility = "visible";
		    return;
		}else{
            
            hidemenuie5();
	    }
		parent.getdocument(event.srcElement);
    }
   //隐藏菜单
	function hidemenuie5() {
		    if(parent.menugo)
		    {
		    	parent.menugo=false;
	            ie5menu.style.visibility = "hidden";
			}
	}

	//右键选中执行
	function jumptoie5() {
		parent.jumptoie5();
	  	
	}


	//easy渲染调用
	function easyUi_reload(){
		$.parser.parse();
	}


	//约束拖动
	function onDrag(e){
		
		var d = e.data;

		if (d.left < 0){d.left = 0;}

		if (d.top < 0){d.top = 0;}

		if (d.left + $(d.target).outerWidth() > $(d.parent).width()){
			
			d.left = $(d.parent).width() - $(d.target).outerWidth();
			
		}

		if (d.top + $(d.target).outerHeight() > $(d.parent).height()){
			
			d.top = $(d.parent).height() - $(d.target).outerHeight();

		}
	}

	//鼠标按键松开
	function showgrid(event) {
	   
		parent.divv = event.srcElement;
	
		//console.log("元素移动实际分辨率:"+$("#topfd").width()+"   "+$("#topfd").height());
		
		//绑定网格吸附
		parent.grid_element_move(parent.divv,$("#topfd").width(),$("#topfd").height());
	
	}

</script>

</html>
