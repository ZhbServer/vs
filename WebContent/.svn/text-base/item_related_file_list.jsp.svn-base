<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<!-- ZUI Javascript 依赖 jQuery -->
<script src="zui-1.5.0-dist/dist/jq/jquery.js"></script>

<!-- ZUI 标准版压缩后的 JavaScript 文件 -->
<script src="zui-1.5.0-dist/dist/js/zui.min.js"></script>

<link href="zui-1.5.0-dist/dist/lib/datatable/zui.datatable.min.css" rel="stylesheet">

<script src="zui-1.5.0-dist/dist/lib/datatable/zui.datatable.min.js"></script>

<script type="text/javascript" src="js/layer/layer.js"></script>

<script type="text/javascript">
  


function initTable(){
	$('table.datatable').datatable({minColWidth:30});
	
}




function bigImg(fname){
	layer.open({
 	    type: 2,
 	    title: false,
 	    fix: false, //不固定
 	    area: ['678.5px', '526.5px'],
 	    offset: '10px',
 	    shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
 	    content: 'seeimgbi.vs?fname='+fname
 	});
}



/*预览视频*/
function yulanVideo(url){ 
     //window.open(url);

     layer.open({
    	    type: 2,
    	    title: false,
    	    offset: '20px',
    	    area: ['600px', '500px'],
    	    shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
    	    content: url
    	});
    	         
}

</script>
</head>
<body onload="initTable()">

<form  name="form1" method="post" >
     <div style=" margin: 10px 0px 0px 10px;">
       <ul class="nav nav-tabs">
         <ww:if test="itemType==1">
             <li ><a href="seeiteminfo.vs?itemId=<ww:property value='itemId'/>&itemType=1"><ww:property value="#session.local.b00185" /></a></li><!-- 节目属性 -->
         </ww:if>
         <ww:elseif test="itemType==2">
             <li ><a href="seeinteractiteminfo.vs?itemId=<ww:property value='itemId'/>&itemType=2"><ww:property value="#session.local.b00185" /></a></li><!-- 节目属性 -->
         </ww:elseif>
		  
		<li><a href="itemEditHistory.vs?itemId=<ww:property value='itemId'/>&itemType=<ww:property value='itemType'/>"><ww:property value="#session.local.b00186" /></a></li><!-- 修改历史 -->
<!--		  <li><a data-tab href="#tabContent3">下发终端</a></li>-->
		
		
		  <ww:if test="itemType==1">
             <li class="active"><a href="itemRelatedFileList.vs?itemId=<ww:property value='itemId'/>&itemType=1"><ww:property value="#session.local.b00206"/></a></li><!-- 相关文件 -->
         </ww:if>
         <ww:elseif test="itemType==2">
             <li class="active"><a href="itemRelatedFileList.vs?itemId=<ww:property value='itemId'/>&itemType=2"><ww:property value="#session.local.b00206"/></a></li><!-- 相关文件 -->
         </ww:elseif>
         
         
		
		
		
		</ul>
		
		<div class="tab-content">
		  <div class="tab-pane " id="tabContent1" >
		    <p>
				  
		         
		    </p>
		  </div>
		  <div class="tab-pane" id="tabContent2" style="height: 400px;overflow: auto;">
		    <p>
		     
		    
		    </p>
		  </div>
		  <div class="tab-pane active" id="tabContent3">
		    <p>
		       
		        <div style="margin-top: 5px;width: 800px;margin-left: 100px;">
						<!-- HTML 代码 -->
						<table class="table datatable" >
						  <thead>
						    <tr>
						      <!-- 以下两列左侧固定 -->
						      <th style="text-align: center;"><ww:property value="#session.local.a00071" /></th><!-- 素材名 -->
						      <th style="text-align: center;"><ww:property value="#session.local.a00067" /></th><!-- 文件名 -->
						    </tr>
						  </thead>
						  <tbody>
						     <ww:iterator value="sucaiList">
												<tr>
												  <td style="text-align: center;" >
												     <ww:property value="name" />
												  </td>
												  <td style="text-align: center;" >
												  
												     <ww:if test="type==4">
												     
												         <a href="javascript:bigImg('<ww:property value="filename" />');">
												     
												              <ww:property value="filename" />
												  
												         </a>
												     
												     </ww:if>
												     
												     <ww:elseif test="type==3">
												     
												          <a href="javascript:yulanVideo('seeFullVideo.vs?scid=<ww:property value='id' />');">
												              
												              <ww:property value="filename" />
												              
												          </a>
												     
												     </ww:elseif>
												  
												  
												  </td>
												
												</tr>
							 </ww:iterator>
						  </tbody>
						</table>

                 </div>
                 
		    
		    </p>
		  </div>
		</div>
     </div>

    
   </form>
</body>
</html>
