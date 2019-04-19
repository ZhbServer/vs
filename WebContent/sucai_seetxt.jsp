<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
	                         	<th width="200"></th>
	                         	<td>
	                         		<ww:property value="txtcontent" escape="false" />
	                         	</td>
	                         </tr>
	                         <tr>
	                            <!-- 素材名 -->
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00071' />：</th>
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
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00072' />：</th>
	                            <td>
	                              <ww:property value="size" />M
	                            </td>
	                          </tr>
	                          
	                          <!--<tr>
	                            	 时长 
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00105' />：</th>
	                            <td>
	                               <ww:property value="stime" /><ww:property value='#session.local.a00106' />
	                            </td>
	                          </tr>
	                          
	                          --><tr>
	                            <!-- 上传时间 -->
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00073' />：</th>
	                            <td>
	                               <ww:property value="sdate" />
	                            </td>
	                          </tr>
	                          
	                          <tr>
	                            <!-- 上传用户 -->
	                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00068' />：</th>
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
