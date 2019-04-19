<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="PRAGMA" content="NO-CACHE">
    
    

    <title><ww:property value='#session.local.public_title'/></title>
    <base target="_self"> 
    <link rel="stylesheet" type="text/css" href="webuploader/css/webuploader.css">
    <link rel="stylesheet" type="text/css" href="webuploader/css/style.css">
    <script type="text/javascript" src="js/jq/jquery.js"></script>
    <script type="text/javascript" src="js/layer/layer.js"></script>
    <script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
	<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
    
    <script type="text/javascript">
    var openIntro;
    var Intro;
    var Intro1;

		    //按钮(点击选择背景)
		    var upbutton="<ww:property value='#session.local.a00814'  />";
		
		    //显示 (您取消了更新!)
		    var a00781="<ww:property value='#session.local.a00781'  />";
		
		    //显示 (安装失败)
		    var a00782="<ww:property value='#session.local.a00782'  />";
		    
		    //显示(安装已成功，请刷新!)
		    var a00783="<ww:property value='#session.local.a00783'  />";
		
		    //显示(不支持您的浏览器)
		    var a00784="<ww:property value='#session.local.a00784'  />";
		
		    //显示(继续添加)
		    var a00785="<ww:property value='#session.local.a00785'  />";
		
		    //显示(删除)
		    var a00025="<ww:property value='#session.local.a00025'  />";
		
		    //显示(文件大小超出)
		    var a00786="<ww:property value='#session.local.a00786'  />";
		
		    //显示(上传暂停)
		    var a00787="<ww:property value='#session.local.a00787'  />";
		
		    //显示(上传失败，请重试)
		    var a00788="<ww:property value='#session.local.a00788'  />";
		    
		    //显示(选中)
		    var a00789="<ww:property value='#session.local.a00789'  />";
		
		    //显示(张图片)
		    var a00790="<ww:property value='#session.local.a00790'  />";
		
		    //显示(共)
		    var a00799="<ww:property value='#session.local.a00799'  />";
		
		    //显示(已成功上传)
		    var a00793="<ww:property value='#session.local.a00793'  />";
		
		    //显示(上传失败)
		    var a00794="<ww:property value='#session.local.a00794'  />";
		
		    //显示(重新上传)
		    var a00795="<ww:property value='#session.local.a00795'  />";
		
		    //显示(失败或)
		    var a00796="<ww:property value='#session.local.a00796'  />";
		
		    //显示(忽略)
		    var a00797="<ww:property value='#session.local.a00797'  />";
		
		    //显示(张)
		    var a00800="<ww:property value='#session.local.a00800'  />";
		    
		    //显示(已上传)
		    var a00804="<ww:property value='#session.local.a00804'  />";
		
		    //显示(失败)
		    var a00805="<ww:property value='#session.local.a00805'  />";
		    
		    //显示(暂停上传)
		    var a00806="<ww:property value='#session.local.a00806'  />";
		
		    //显示(继续上传)
		    var a00807="<ww:property value='#session.local.a00807'  />";
		    
		    //显示(开始上传)
		    var a00808="<ww:property value='#session.local.a00808'  />";
		         
		    //显示(上传成功)
		    var a00809="<ww:property value='#session.local.a00809'  />";

		    //显示(文件格式错误)
		    var b00099="<ww:property value='#session.local.b00099'  />";

		  //资源存储空间不足,请联系管理员
			   var a01034="<ww:property value='#session.local.a01034' />";

			   //用户id
			   var urid="<ww:property value='#session.urid' />";
			
		    //上传地址
		    var upserver="upbj.vs";
		    //上传格式
		    var upextensions="gif,jpg,jpeg,bmp,png";

		    //title
		    var uptitle="Images";

		    //mimeTypes  
		    var upmimeTypes="image/jpeg,image/png";

		    //显示(类型错误,请上传位深度为24位的图片)
		    var b00237="<ww:property value='#session.local.b00237'  />";

		    //同时上传个数
		    var threads=3;
		    
		    
	    function init_self(){

	    	openIntro = <%=request.getParameter("openIntro")%>;

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
				overlayOpacity: 0.4,  
				steps: [
				    {
					    element: '#filePicker2',
					    intro: "<ww:property value='#session.local.a00980' />",
					    position: "top"    
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

				intro1 = introJs();  
				intro1.setOptions({
				prevLabel:"<ww:property value='#session.local.a00861' />", 
		        nextLabel:"<ww:property value='#session.local.a00862' />",
		        skipLabel:"<ww:property value='#session.local.a00863' />",
		        doneLabel:"<ww:property value='#session.local.a00863' />",
				showStepNumbers: false,
				showBullets: false,
				exitOnOverlayClick: false,
				overlayOpacity: 0.2,  
				steps: [
					{
						element: '#filePicker2',
						intro: "<ww:property value='#session.local.a00981' />",
						position: "top"
					}, 	
					{  
						element: '#step2',  
						intro: "<span style='color:blue'><ww:property value='#session.local.a00874' /></span> <ww:property value='#session.local.a00808' />,<span style='color:blue'> <ww:property value='#session.local.a00982' /></span>,<ww:property value='#session.local.a00983' />",
						position: "left"
					}
				  ]  
				});

				intro1.oncomplete(function() {  
					intro1.exit();  
			    });
	
				intro1.onexit(function() {
					layer.msg("<ww:property value='#session.local.a00864' />");
				    window.parent.returnValue="close"; 
				});
			}
		}
	    
	</script>
  </head>
  
  <body  style="overflow: auto;" onload="init_self()">
	    <form>
	               <div id="uploader">
		                <div class="queueList">
		                    <div id="dndArea" class="placeholder">
		                        <div id="filePicker" ></div>
		                        <p></p>
		                    </div>
		                </div>
		                <div class="statusBar" style="display:none;">
		                    <div class="progress">
		                        <span class="text">0%</span>
		                        <span class="percentage"></span>
		                    </div><div class="info"></div>
		                    <div class="btns">
		                        <div id="filePicker2"></div><div id="step2" class="uploadBtn"><ww:property value='#session.local.a00808'  /></div><!-- 开始上传 -->
		                    </div>
		                </div>
	            </div>
	            
	            
				<script src="js/jq/jquery.min.js"></script>
				<script type="text/javascript" src="webuploader/js/webuploader.min.js"></script>
				<script type="text/javascript" src="webuploader/js/upload.js"></script> 
	
	</form>
  </body>
</html>
