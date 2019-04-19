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
<link rel="stylesheet" href="css/common.css"/>
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/icon.css"  />
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<script type="text/javascript">

</script>

</head> 
<body>
   <form  name="form" method="post" action="updateuserpwd.vs">
   
   
        <div class="panel-primary" style="margin: 3px 3px;border: 0px;">
           
         <div class="panel-heading">
                <ww:property value="#session.local.a00517"/> <!-- 系统信息-->
         </div>
         
         <div class="container clearfix" style="margin: 20px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		              
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                          
		                          <tr>
		                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00518' />：</th>
		                            <td>
		                                  <ww:if test="lType==1"><ww:property value='#session.local.a00506' /></ww:if>
		                                  <ww:elseif test="lType==2"><ww:property value='#session.local.b00286' /></ww:elseif>
		                                  <ww:else><ww:property value='#session.local.a00505' /></ww:else>
		                            </td>
		                          </tr>
		                          
		                          <ww:if test="lType==1">
		                          
		                               <!-- 登陆账号 -->
		                               <tr>
			                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00519' />：</th>
			                            <td>
			                            
			                                <ww:if test="lCheck==1">
			                                   <ww:property  value="#request.lUsername" /> 
			                                </ww:if>
			                                <ww:else>
			                                   <ww:property value='#session.local.a00520' />
			                                </ww:else>
			                              
			                            </td>
			                          </tr>
			                          
			                          <!-- 软加密总点位 -->
			                          <tr>
			                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00506' /><ww:property value='#session.local.a00515' />：</th>
			                            <td>
			                               <ww:property  value="#request.NetCountStr" />
			                            </td>
			                          </tr>
			                          
			                          <!-- 软加密已使用点位 -->
			                          
			                          <tr>
			                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00506' /><ww:property value='#session.local.a00516' />：</th>
			                            <td>
			                               <ww:property  value="#request.NetSurCountStr" />
			                            </td>
			                          </tr>
			                       
			                          <ww:if test="#session.version_onoff.peopleCountShow==1">
			                         
				                          <!-- 人脸识别已使用点位 -->				                          
				                          <tr>
				                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.b00112' /><ww:property value='#session.local.a00516' />：</th>
				                            <td>
				                               <ww:property  value="#request.PeopleFaceRelCountStr" />
				                               /
				                               <ww:property  value="#request.PeopleFaceAllCountStr" />
				                            </td>
				                          </tr>
			                          
			                           </ww:if>
			                          
			                       
				                        <ww:if test="#session.version_onoff.ramSizeShow==1">
				                       	  
				                       	  <!-- 用户存储空间使用量 -->
				                          <tr>
					                           <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00564' />：</th>
					                            <td>
													<span>
														<ww:property value='scTotal'/>
														<input id="scTotal" name="scTotal" value="<ww:property value='scTotal'/>" type="hidden" />
													</span>/
													<span>
														<ww:if test="state == 0">
															<ww:property value='total'/>
														</ww:if>
														<ww:else>
															<ww:property value='#session.local.a01030' /><ww:if test="total > 0">(<ww:property value='total'/>)</ww:if>
														</ww:else>
													</span>
												</td>
					                        </tr>
				                       	</ww:if> 
		                          </ww:if>
		                          <ww:elseif test="lType==2">
		                                                     
		                               <tr>
			                               <th width="200"><i class="require-red"></i><ww:property value='#session.local.b00286' />：</th>
				                           <td>
				                               
				                               <ww:if test="vsLicensesFlag==1">
				                                  <ww:property  value="#session.local.a00128"/>
				                               </ww:if>
				                               <ww:else>
				                                  <ww:property  value="#session.local.a00805"/>
				                               </ww:else>
				                               
				                           </td>
			                          </tr>			                          
		                          </ww:elseif>
		                          <ww:else>
		                          
		                               <tr>
			                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00505' /><ww:property value='#session.local.a00515' />：</th>
			                            <td>
			                               <ww:property  value="#request.DogCountStr" />
			                            </td>
			                          </tr>
		                             
		                          </ww:else>
		                          
		                          
		                          
		                           <tr>
			                               <th width="200"><i class="require-red"></i>token：</th>
				                           <td>
				                               
				                               <ww:property value="token"/>
				                               
				                           </td>
			                          </tr>			     
			                          
			                          
		                        
		                        </tbody>   
		                    </table>
		              
		            </div>
		        </div>
		     </div>
  
      </div> 
   
     </div> 
   </form>
</body>
</html>
