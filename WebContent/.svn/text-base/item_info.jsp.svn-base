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
</head> 
<body>
  
   <form  name="form1" method="post" >
     <div style=" margin: 10px 0px 0px 10px;">
       <ul class="nav nav-tabs">
		  <li class="active"><a href="seeiteminfo.vs?itemId=<ww:property value='itemId'/>&itemType=1"><ww:property value="#session.local.b00185" /></a></li><!-- 节目属性 -->
		  
		  <li><a href="itemEditHistory.vs?itemId=<ww:property value='itemId'/>&itemType=1"><ww:property value="#session.local.b00186" /></a></li><!-- 修改历史 -->
		  
          <li><a href="itemRelatedFileList.vs?itemId=<ww:property value='itemId'/>&itemType=1"><ww:property value="#session.local.b00206"/>   </a></li><!-- 相关文件 -->
         


<!--		  <li><a  href="clientplayinfo.vs?itemId=<ww:property value='itemId'/>">下发终端</a></li>-->
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
			                         	<!-- 节目名 -->
			                         	<th width="200"><i class="require-red"></i><ww:property value='#session.local.a00255' />：</th>
			                         	<td>
			                         		<a style="width: 100%;display: block;overflow: auto;color: #343F51;" target="_blank" href="files/<ww:property value='scene.filename'/>/see.html"><ww:property value="name"/></a>
			                         	</td>
			                         </tr>
			                         <tr>
			                            <!-- 节目大小-->
			                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00258' />：</th>
			                            <td>
			                               <ww:property value="size"/>M
			                            </td>
			                          </tr>
			                          <tr>
			                            <!-- 分辨率 -->
			                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00176' />：</th>
			                            <td>
			                               <ww:property value="fbl.name"/>
			                            </td>
			                          </tr>
			                          <tr>
			                            <!-- 播放时长 -->
			                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00105' />：</th>
			                            <td>
			                               <ww:property value="stime"/>
			                            </td>
			                          </tr>
			                          <tr>
			                            <!-- 是否审核 -->
			                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00217' />：</th>
			                            <td>
				                             <ww:if test="ocheck==0">
									           	  <ww:property  value="#session.local.a00257" /> 
										     </ww:if>
										     <ww:elseif test="ocheck==1">
										          <ww:property  value="#session.local.a00256" />
										     </ww:elseif>
										     <ww:else>
										          <ww:property  value="#session.local.a00592" />
										     </ww:else>
			                            </td>
			                          </tr>
			                          <tr>
			                            <!-- 制作时间 -->
			                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00831' />：</th>
			                            <td>
			                               <ww:property value="sdate" />
			                            </td>
			                          </tr>
			                          
			                          <tr>
			                            <!-- 制作用户 -->
			                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00832' />：</th>
			                            <td>
			                               <ww:property value="user.name" />
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
				                      
				                    <ww:if test="#session.version_onoff.viceItemOnOff==1">
				                       <tr>
			                            <!-- 是否为双屏节目 -->
			                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.b00358' />：</th>
			                            <td>
			                                <ww:if test="itemTypeSub==1">
			                                    <ww:property  value="#session.local.a00232"/>
			                                </ww:if>
			                                <ww:else>
			                                    <ww:property  value="#session.local.a00233"/>
			                                </ww:else>
			                            </td>
			                          </tr>
			                          </ww:if>
			                           
				                       <tr>
			                            <!-- 标签 -->
			                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.d00005' />：</th>
			                            <td><ww:property value="lable" /></td>
			                          </tr>
			                    
			                          
			                          
			                        </tbody>
			                     </table>     
				            </div>
				         </div>
				    </div>
		   		
		    
		    </p>
		  </div>
		  <div class="tab-pane" id="tabContent2">
		    <p>
		   
		    
		    </p>
		  </div>
		  <div class="tab-pane" id="tabContent3">
		    <p>
		       <iframe src="clientplayinfo.vs?itemid=<ww:property value='itemid'/>" width="1000px" height="450px"  frameborder="no" border="0" style="margin-left: 5px;">
		      
		      </iframe> 
		    
		    </p>
		  </div>
		</div>
     </div>

    
   </form>
</body>
</html>
