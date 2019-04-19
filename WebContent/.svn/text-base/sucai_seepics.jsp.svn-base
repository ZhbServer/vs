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
<link rel="stylesheet" href="css/index.css"/>
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
<script type="text/javascript">
 function bigImg(fname){
		layer.open({
  	    type: 2,
  	    title: false,
  	    fix: false, //不固定
  	    area: ['680px', '530px'],
  	    shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
  	    content: 'seepicsbi.vs?fname='+fname
  	});
}
</script>
</head> 
<body>
<br/>
   <form  name="form1" method="post" >
    	<div class="container clearfix" style="margin: 10px 10px;">
            <div class="main-wrap"  style="width: 850px;">
		         <div class="result-wrap">
		            <div class="result-content">
		                 <table class="insert-tab" width="100%">
	                        <tbody>
	                         <tr>
	                         	<th width="100"></th>
	                         	<td>
	                         		<img onClick="bigImg('<ww:property value="fname" />')" src="files/<ww:property value="first" />" id="imgs"  width='271px' height='208px'/>
									<input type="hidden"  id="all"  value="<ww:property value="names" />"/>
									<input type="hidden"  id="first"  value="<ww:property value="first" />"/>
	                         	</td>
	                         </tr>
	                         <tr>
	                            <!-- 素材名 -->
	                            <th width="100"><i class="require-red"></i><ww:property value='#session.local.a00071' />：</th>
	                            <td>
	                               <ww:property value="name" />
	                            </td>
	                          </tr>
	                          
	                          <tr>
	                            <!-- 文件名 -->
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00067' />：</th>
	                            <td>
	                               <ww:property value="fname" />
	                            </td>
	                          </tr>
	                          
	                          <tr>
	                            <!-- 大小 -->
	                            <th width="100"><i class="require-red"></i><ww:property value='#session.local.a00072' />：</th>
	                            <td>
	                              <ww:property value="size" />M
	                            </td>
	                          </tr>
	                          
	                          <tr>
	                            <!-- 上传时间 -->
	                            <th width="100"><i class="require-red"></i><ww:property value='#session.local.a00073' />：</th>
	                            <td>
	                               <ww:property value="sdate" />
	                            </td>
	                          </tr>
	                          
	                          <tr>
	                            <!-- 上传用户 -->
	                            <th width="100"><i class="require-red"></i><ww:property value='#session.local.a00068' />：</th>
	                            <td>
	                               <ww:property value="username" />
	                            </td>
	                          </tr>
	                          
	                          <ww:if test="lbyl == 0">
	                          	  <tr>
		                            <!-- 共享对象 -->
		                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00818' />：</th>
		                            <td>
		                               <ww:property value="sharename" />
		                            </td>
		                          </tr>
	                          </ww:if>
	                          
	                        </tbody>
	                     </table>     
		            </div>
		         </div>
		    </div>
   		</div>
   </form>
</body>
</html>
