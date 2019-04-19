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
<script>

   function enterLicenses(){
	   

            var mark="<ww:property value='client.mark' />";

	    	 $.ajax({
					type:'post',
					url:'../ajaxenterlicensesaction.vs?mark='+mark,
					dataType:'json',
					async:true,
					success:function(data){
	    		       
	    		        if(data==0){
		    		        
                            alert("<ww:property value='#session.local.b00288' />");

    		    		}else if(data==1){

		    		    	alert("<ww:property value='#session.local.b00291' />");
		    		    	
		    		    	window.location.href="../getclienteyeinfo.vs?cid=<ww:property value='client.id'/>";

				        }
	    		      
					}
				
				});
				

   }

</script>

<style>
  .client-tab tr th{text-align: center;}
  .client-tab tr td{text-align: center;}
</style>
</head> 
<body>
<br/>
   <form  name="form1" method="post" >
           	
			
			<div class="container clearfix" style="margin: 50px 10px;">
             <div class="main-wrap" style="width: 850px;">
		         <div class="result-wrap">
		            <div class="result-content">
		                    <ul class="nav nav-secondary" style="margin-top: -50px;">
							  <li class="active"><a><ww:property value='#session.local.a00760' /></a></li><!-- 终端详情 -->
							  <li><a href="getclientinfo.vs?cid=<ww:property value='client.id'/>"><ww:property value='#session.local.a00761' /></a></li><!-- 播放详情 -->
							</ul>
			
		                    <table class="insert-tab" width="100%">
		                        <tbody>
		                         <tr>
		                            <!-- id -->
		                            <th width="200">ID：</th>
		                            <td>
		                               <ww:property value='client.id'/>
		                               
		                               [<ww:property value='client.mltState'/>]
		                               
		                            </td>
		                          </tr>
		                          
		                          <tr>
		                            <!-- 终端名 -->
		                            <th width="200"><ww:property value='#session.local.a00038' />：</th>
		                            <td>
		                               <ww:property value="client.name"/>
		                            </td>
		                          </tr>
		                          
		                          <tr>
		                            <!-- 终端标识 -->
		                            <th width="200"><ww:property value='#session.local.a00040' />：</th>
		                            <td>
		                               <ww:property value="client.mark"/>
		                            </td>
		                          </tr>
		                          
		                           <tr>
		                            <!-- 终端ip -->
		                            <th width="200">IP：</th>
		                            <td>
		                               <ww:property value="client.ip"/>
		                            </td>
		                          </tr>
		                          
		                          <tr>
		                            <!-- 所属用户 -->
		                            <th width="200"><ww:property value='#session.local.a00762' />：</th>
		                            <td>
		                               <ww:property value="userBelongs"/>
		                            </td>
		                          </tr>
		                          <tr>
		                            <!-- 在线状态 -->
		                            <th width="200"><ww:property value='#session.local.a00043' />：</th>
		                            <td>
		                                <ww:if test="client.zxstate==1">
		                                    <span style="color: blue;"><ww:property  value="#session.local.a00044"/></span>
		                                </ww:if>
		                                <ww:else>
		                                    <span style="color: red;"><ww:property  value="#session.local.a00045"/></span>
		                                </ww:else>
		                            </td>
		                          </tr>
		                          
		                            <tr>
		                            <!-- 是否禁用 -->
		                            <th width="200"><ww:property value='#session.local.a00765' />：</th>
		                            <td>
		                               <ww:if test="client.disabledstate==0">
		                                     <ww:property value="#session.local.a00233"/>
		                               </ww:if>
		                               <ww:else>
		                                     <span style="color: red;"><ww:property value="#session.local.a00232"/></span>
		                               </ww:else>
		                                
		                            </td>
		                          </tr>
		                          
		                          
		                          
		                           <tr>
		                            <!-- 终端密码 -->
		                            <th width="200"><ww:property value='#session.local.a00770' />：</th>
		                            <td>
		                               
		                               <ww:property value="clientPwd"/>
		                                
		                            </td>
		                          </tr>
		                          
		                          
		                          
		                           <ww:if test="#session.version_onoff.bindClientShow==1">
		                          
			                          <tr>
			                            <!-- 设备绑定 -->
			                            <th width="200"><ww:property value='#session.local.a00772' />：</th>
			                            <td>
			                               
			                               <ww:property value="bindName"/>
			                                
			                            </td>
			                          </tr>
		                          
		                         </ww:if>
		                         
		                         
		                         <ww:if test="#session.version_onoff.peopleCountShow==1">
		                          
			                          <tr>
			                            <!-- 人脸识别返回值 -->
			                            <th width="200"><ww:property value='#session.local.b00157' />：</th>
			                            <td>
			                               
			                                 <ww:if test="peopleFaceCode=='00000'">
			                                     <ww:property value="#session.local.b00151"/>
			                                 </ww:if>
			                                 <ww:elseif test="peopleFaceCode=='00001'">
			                                     <ww:property value="#session.local.b00152"/>
			                                 </ww:elseif>
			                                 <ww:elseif test="peopleFaceCode=='00002'">
			                                     <ww:property value="#session.local.b00153"/>
			                                 </ww:elseif>
			                                 <ww:elseif test="peopleFaceCode=='00003'">
			                                     <ww:property value="#session.local.b00154"/>
			                                 </ww:elseif>
			                                 <ww:elseif test="peopleFaceCode=='00004'">
			                                     <ww:property value="#session.local.b00155"/>
			                                 </ww:elseif>
			                                 <ww:elseif test="peopleFaceCode=='00005'">
			                                     <ww:property value="#session.local.b00156"/>
			                                 </ww:elseif>
			                                 <ww:elseif test="peopleFaceCode=='00006'">
			                                     <ww:property value="#session.local.b00210"/>
			                                 </ww:elseif>
			                                 <ww:elseif test="peopleFaceCode=='00007'">
			                                     <ww:property value="#session.local.b00261"/>
			                                 </ww:elseif>
			                                 <ww:elseif test="peopleFaceCode=='00008'">
			                                     <ww:property value="#session.local.b00262"/>
			                                 </ww:elseif>
			                                 <ww:elseif test="peopleFaceCode=='00009'">
			                                     <ww:property value="#session.local.a00426"/>
			                                 </ww:elseif>
			                                 <ww:elseif test="peopleFaceCode=='00010'">
			                                     <ww:property value="#session.local.a00020"/>
			                                 </ww:elseif>
			                                 
			                                
			                            </td>
			                          </tr>
		                          
		                         </ww:if>
		                         
		                         
		                         
		                               
		                          
		                         <ww:if test="#session.version_onoff.vsLicensesOnOff==1">
		                          
			                          <tr>
			                            <!-- 授权文件 -->
			                            <th width="200"><ww:property value='#session.local.b00286' />：</th>
			                            <td>
			                               <ww:if test="vsLicensesClientState==1">
			                                      <ww:property value='#session.local.b00287' />
			                                     
			                                </ww:if>
			                                <ww:else>
			                                       <ww:property value='#session.local.b00289' />
			                                       <a onclick="enterLicenses()" style="cursor: pointer;">[<ww:property value='#session.local.b00290' />]</a><!-- 授权 -->
			                                </ww:else>
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
