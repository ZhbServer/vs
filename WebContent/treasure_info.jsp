<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" href="tip/tip-darkgray/tip-darkgray.css" type="text/css" />

<link rel="stylesheet" href="css/common.css"/>
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>

<link rel="stylesheet" href="../css/index.css"/>
<link rel="stylesheet" href="../css/common.css"/>
<script type="text/javascript" src="../js/jq/jquery.js"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>

<!-- jQuery and the Poshy Tip plugin files -->
<script type="text/javascript" src="tip/jquery.poshytip.js"></script>

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="../zui-1.5.0-dist/dist/css/zui.min.css" />

<!-- ZUI Javascript 依赖 jQuery -->
<script src="zui-1.5.0-dist/dist/jq/jquery.js"></script>
<!-- ZUI 标准版压缩后的 JavaScript 文件 -->
<script src="zui-1.5.0-dist/dist/js/zui.min.js"></script>

<!-- ZUI Javascript 依赖 jQuery -->
<script src="../zui-1.5.0-dist/dist/jq/jquery.js"></script>
<!-- ZUI 标准版压缩后的 JavaScript 文件 -->
<script src="../zui-1.5.0-dist/dist/js/zui.min.js"></script>

<style>
  .client-tab tr th{text-align: center;}
  .client-tab tr td{text-align: center;}
</style>
<script type="text/javascript">
//初始化
function init_self(id){	

		if (id==1){
			document.getElementById("item").style.display="none";
			document.getElementById("client").style.display="none";
			document.getElementById("url").style.display="none";
			document.getElementById("code").style.display="";
			document.getElementById("styleImg").style.display="";
			document.getElementById("skipImg").style.display="none";			
		}
		if (id==2){
			document.getElementById("item").style.display="none";
			document.getElementById("client").style.display="none";
			document.getElementById("url").style.display="";
			document.getElementById("code").style.display="none";
			document.getElementById("styleImg").style.display="";
			document.getElementById("skipImg").style.display="none";			
		}
		if (id==3){
			document.getElementById("item").style.display="none";
			document.getElementById("client").style.display="none";
			document.getElementById("url").style.display="none";
			document.getElementById("code").style.display="none";
			document.getElementById("styleImg").style.display="";
			document.getElementById("skipImg").style.display="";			
		}
		if (id==4){
			document.getElementById("item").style.display="";
			document.getElementById("client").style.display="none";
			document.getElementById("url").style.display="none";
			document.getElementById("code").style.display="none";
			document.getElementById("styleImg").style.display="";
			document.getElementById("skipImg").style.display="none";			
		}
				
}
</script>
</head> 
<body onload="init_self(<ww:property value="treasureInsideType"/>)">

   <form  name="form1" method="post" >
      <div style=" margin: 10px 0px 0px 10px;">
        <ul class="nav nav-tabs">
         
		  <li class="active"><a href="seetreasureinfo.vs?id=<ww:property value='id'/>"><ww:property value="#session.local.c00045" /></a></li><!-- 节目属性 -->
		  
		  <li><a href="treasureEditHistory.vs?id=<ww:property value='id'/>"><ww:property value="#session.local.b00186" /></a></li><!-- 修改历史 -->
		  <!--		  
		  <li><a href="itemRelatedFileList.vs?itemId=<ww:property value='itemId'/>&itemType=2"><ww:property value="#session.local.b00206"/></a></li> 相关文件 		  	  
           -->
           <!--<li><a  href="clientplayinfo.vs?itemId=<ww:property value='itemId'/>">下发终端</a></li>-->
		</ul>
		
		<div class="tab-content">
		  <div class="tab-pane active" id="tabContent1" >
		    <p>
		    
		    
    	
              <div class="main-wrap"  style="width: 850px;margin-left: 100px;font-size: 12px;">
		         <div class="result-wrap">
		            <div class="result-content">
		                 <table class="insert-tab" width="100%">
	                        <tbody>
	                         <tr>
	                         	<!-- 活动名-->
	                         	<th width="200"><i class="require-red"></i><ww:property value='#session.local.c00016' />：</th>
	                         	<td>
	                         		<ww:property value="treasureName"/>
	                         	</td>
	                         </tr>
	                         <tr id="item">
	                            <!-- 节目名-->
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00255' />：</th>
	                            <td>
	                               <ww:property value="itemName"/>
	                            </td>
	                          </tr>
	                          <tr id="client">
	                             <!-- 终端名-->
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00038' />：</th>
	                            <td>
	                               <ww:property value="cid"/>
	                            </td>
	                          </tr>
	                          <tr>
	                            <!-- 上线状态 -->
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.c00017' />：</th>
	                            <td>
		                            <ww:property value="onStatus"/>
	                            </td>
	                          </tr>
	                          <tr>
	                            <!-- 活动类型 -->
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.c00022' />：</th>
	                            <td>
	                               <ww:property value="treasureType" />
	                            </td>
	                          </tr>
	                          
	                          <tr>
	                            <!-- 上线时间 -->
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.c00026' />：</th>
	                            <td>
	                               <ww:property value="onTime" />
	                            </td>
	                          </tr>
	                          
	                          <tr>
	                            <!-- 下线时间 -->
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.c00027' />：</th>
	                            <td>
	                               <ww:property value="offTime" />
	                            </td>
	                          </tr>
	                          
	                           <tr id="url">
	                            <!-- url -->
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.c00013' />：</th>
	                            <td>
	                               <ww:property value="url" />
	                            </td>
	                          </tr>
	                          
	                           <tr id="code">
	                            <!-- 二维码 -->
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.c00009' />：</th>
	                            <td>
	                               <ww:property value="code" />
	                            </td>
	                          </tr>
	                          
	                           <tr id="styleImg">
	                            <!-- 宝箱样式图片 -->
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.c00041' />：</th>
	                            <td>
	                               <ww:property value="styleImg" />
	                            </td>
	                          </tr>
	                          
	                          <tr id="skipImg">
	                            <!-- 宝箱跳转图片 -->
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.c00014' />：</th>
	                            <td>
	                               <ww:property value="skipImg" />
	                            </td>
	                          </tr>
	                          
	                          <tr>
	                            <!-- 创建人 -->
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.c00042' />：</th>
	                            <td>
	                               <ww:property value="creator" />
	                            </td>
	                          </tr>
	                          
	                          <tr>
	                            <!-- 创建时间 -->
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.c00043' />：</th>
	                            <td>
	                               <ww:property value="creatorTime" />
	                            </td>
	                          </tr>
	                          
	                          <tr>
	                            <!-- 禁用/启用 -->
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.c00039' />：</th>
	                            <td>
	                               <ww:property value="ban" />
	                            </td>
	                          </tr>
	                          <!-- 高度 -->
	                           <tr>
	                                <th width="200"><ww:property value='#session.local.c00053' />：</th>
	                                <td>
	                               <ww:property value="treasureHeight" /><span>px</span>
	                               	</td>
	                            </tr>
	                            <!-- 宽度 --> 
	                             <tr>
	                                <th width="200"><ww:property value='#session.local.c00054' />：</th>
	                                <td>
	                                 <ww:property value="treasureWidth" /><span>px</span>
	                               	</td>
	                            </tr>
	                            <tr>
	                                <th width="40%"><ww:property value='#session.local.c00066' />：</th>
	                                <td>
	                               <ww:property value="showTime"/><span><ww:property value='#session.local.a00106' /></span>   
	                               	</td>
	                            </tr>
	                        </tbody>
	                     </table>     
		            </div>
		         </div>
		    </div>
		   </p>
		   </div> 
   		</div>
   	  </div>	
   </form>
</body>
</html>
