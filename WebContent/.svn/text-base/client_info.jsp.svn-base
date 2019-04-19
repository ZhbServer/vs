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
	$(function(){

		//普通播放
        $('#tip-pt').poshytip({
			className: 'tip-darkgray',
			bgImageFrameSize: 11,
			offsetX: -25
		
		});

		//有效期
		$('#tip-date').poshytip({
			className: 'tip-darkgray',
			bgImageFrameSize: 11,
			offsetX: -25
		});


		//垫片
		$('#tip-dp').poshytip({
			className: 'tip-darkgray',
			bgImageFrameSize: 11,
			offsetX: -25
		});


		//轮播
		$('#tip-time').poshytip({
			className: 'tip-darkgray',
			bgImageFrameSize: 11,
			offsetX: -25
		});

		//插播
		$('#tip-insert').poshytip({
			className: 'tip-darkgray',
			bgImageFrameSize: 11,
			offsetX: -25
		});
		
	});
   function open_items(itemIdsAndType){

	   //layer.open({
	   //	type: 2,
	   //     area: ['620px', '400px'],
	   //     offset: '20px',
	   //     title:false,
	   //    fix: false, //不固定
	   //    shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	   //     content: 'tocpplayitem.vs?itemIdsAndType='+itemIdsAndType,
	   //    scrollbar: false,
	   //     end: function(){ 
	   //	}
       //   });
	   window.location.href="tocpplayitem.vs?itemIdsAndType="+itemIdsAndType;
   }

   function client_info_refresh(cid){
	   layer.load(0, {shade: false});
	   window.location.href="getclientinforefresh.vs?cid="+cid;
	   
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
       <div class="container clearfix" style="margin: 10px 10px;">
             <div class="main-wrap"  style="width: 850px;">
		         <div class="result-wrap">
		            <div class="result-content">
		              
		                    <ul class="nav nav-secondary" style="margin-top: -60px;">
							  <li><a href="getclienteyeinfo.vs?cid=<ww:property value='cid'/>"><ww:property value='#session.local.a00760' /></a></li><!-- 终端详情 -->
							  <li class="active"><a><ww:property value='#session.local.a00761' /></a></li><!-- 播放详情 -->
							</ul>
							
							<div style="display: block;position: absolute;left: 800px;top: 30px;">
							     <button onclick="client_info_refresh(<ww:property value='cid'/>)"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00422' /></button>
							</div>
		                    <table class="insert-tab" width="100%" style="margin-top: 50px;">
		                        
		                        <tbody>
		                        
		                          <tr>
		                            <!-- 已用/总大小(MB) -->
		                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00564' />：</th>
		                            <td>
		                               <ww:property value="size" />
		                            </td>
		                            <td width="30%" style="text-align: right;">
		                              <ww:if test="#session.version_onoff.advertisingSpaceOnoff==1">
		                               <ww:property value="#session.local.b00294"/>：   
		                               </ww:if>
		                            
		                            </td>
		                            <td width="30%">
		                              <ww:if test="#session.version_onoff.advertisingSpaceOnoff==1">
		                               <ww:property  value="advertisingShow"/>
		                              </ww:if>
		                            </td>
		                          </tr>
		                          
		                          <tr>
		                            <!-- 音量 -->
		                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00461' />：</th>
		                            <td colspan="3" >
		                              <ww:property value="#request.vol" />
		                            </td>
		                          </tr>
		                          
		                          <tr>
		                            <!-- 开关机时间 -->
		                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00565' />：</th>
		                            <td  colspan="3">
		                               <ww:property value="#request.onoff" />
		                            </td>
		                          </tr>
		                          
		                           <tr>
		                            <!-- 版本信息 -->
		                            <th width="200"><i class="require-red"></i><ww:property value='#session.local.a00566' />：</th>
		                            <td  colspan="3">
		                               <ww:property value="#request.version" />
		                            </td>
		                          </tr>
		                          
		                        
		                        </tbody>
		                     </table>
		                     
		                     
		                     
		                      <table  style="margin-top: 10px;text-align: center;"  class="insert-tab client-tab" width="100%">
		                        <tbody>
		                         <tr >
		                            <th><ww:property value='#session.local.a00600' /></th>  <!-- 播放类型 -->
		                            <th><ww:property value='#session.local.a00601' /></th>  <!-- 播放内容 -->
<!--		                        <th><ww:property value='#session.local.a00602' /></th>   节目单  -->
		                            <th><ww:property value='#session.local.a00603' /></th>  <!-- 节目类型 -->
		                            <th><ww:property value='#session.local.a00604' /></th>  <!-- 接收状态 -->
		                          </tr>
		                          <tr style="display: none;">
		                            <td><ww:property value='#session.local.a00605' /></td>  <!-- 普通播放 --> 
		                            <td>
		                                <a style="cursor: pointer;"   id="tip-pt"  title="<ww:property  value='publicCp.content' />"    id="demo-basic" onclick="javascript:open_items('<ww:property  value='publicCp.itemids' />_<ww:property  value='publicCp.itemtype' />')">  <ww:property  value="publicCp.contentsub" /></a>
		                            </td>
<!--		                         <td><ww:property  value="publicCp.itemids" /></td>-->
		                            <td>
		                                 
		                                 <ww:if test="publicCp.itemtype==1"><ww:property value='#session.local.a00609' /></ww:if>
		                                 <ww:elseif test="publicCp.itemtype==2"><ww:property value='#session.local.a00434' /></ww:elseif>
		                                 
		                            </td>
		                            <td>
		                            
		                                 <ww:if test="publicCp.state==0"><ww:property value='#session.local.a00425' /></ww:if>
		                                 <ww:elseif test="publicCp.state==1"><ww:property value='#session.local.a00426' /></ww:elseif>
		                                 <ww:elseif test="publicCp.state==2"><ww:property value='#session.local.a00427' /></ww:elseif>
		                                 <ww:elseif test="publicCp.state==20"><ww:property value='#session.local.a00681' /></ww:elseif>
										 <ww:elseif test="publicCp.state==21"><ww:property value='#session.local.a00682' /></ww:elseif>
										 <ww:elseif test="publicCp.state==22"><ww:property value='#session.local.a00683' /></ww:elseif>
										 <ww:elseif test="publicCp.state==23"><ww:property value='#session.local.a00684' /></ww:elseif>
										 <ww:elseif test="publicCp.state==24"><ww:property value='#session.local.a00685' /></ww:elseif>
										 <ww:elseif test="publicCp.state==25"><ww:property value='#session.local.a00686' /></ww:elseif>
										 <ww:elseif test="publicCp.state==26"><ww:property value='#session.local.a00687' /></ww:elseif>
		                                
		                            </td>
		                          </tr>
		                          <tr>
		                            <td><ww:property value='#session.local.a00644' /></td>  <!-- 有效期播放 --> 
		                            <td >
		                                <a style="cursor: pointer;" id="tip-date"   title="<ww:property  value='publicDate.content' />"    onclick="javascript:open_items('<ww:property  value='publicDate.itemids' />_<ww:property  value='publicDate.itemtype' />')">  <ww:property  value="publicDate.contentsub" /></a>
		                            </td>
<!--		                            <td><ww:property  value="publicCp.itemids" /></td>-->
		                            <td>
		                                 
		                                 <ww:if test="publicDate.itemtype==1"><ww:property value='#session.local.a00609' /></ww:if>
		                                 <ww:elseif test="publicDate.itemtype==2"><ww:property value='#session.local.a00434' /></ww:elseif>
		                                 
		                            </td>
		                            <td>
		                            
		                                 <ww:if test="publicDate.state==0"><ww:property value='#session.local.a00425' /></ww:if>
		                                 <ww:elseif test="publicDate.state==1"><ww:property value='#session.local.a00426' /></ww:elseif>
		                                 <ww:elseif test="publicDate.state==2"><ww:property value='#session.local.a00427' /></ww:elseif>
		                                 <ww:elseif test="publicDate.state==20"><ww:property value='#session.local.a00681' /></ww:elseif>
										 <ww:elseif test="publicDate.state==21"><ww:property value='#session.local.a00682' /></ww:elseif>
										 <ww:elseif test="publicDate.state==22"><ww:property value='#session.local.a00683' /></ww:elseif>
										 <ww:elseif test="publicDate.state==23"><ww:property value='#session.local.a00684' /></ww:elseif>
										 <ww:elseif test="publicDate.state==24"><ww:property value='#session.local.a00685' /></ww:elseif>
										 <ww:elseif test="publicDate.state==25"><ww:property value='#session.local.a00686' /></ww:elseif>
										 <ww:elseif test="publicDate.state==26"><ww:property value='#session.local.a00687' /></ww:elseif>
		                                
		                            </td>
		                          </tr>
		                          <tr style="display: none;">
		                            <td><ww:property value='#session.local.a00606' /></td>  <!-- 垫片播放 -->
		                            <td >
		                                <a style="cursor: pointer;"  id="tip-dp" title="<ww:property  value='publicDp.content' />" onclick="javascript:open_items('<ww:property  value='publicDp.itemids' />_<ww:property  value='publicDp.itemtype' />')">  <ww:property  value="publicDp.contentsub" /></a>
		                            </td>
<!--		                            <td><ww:property  value="publicCp.itemids" /></td>-->
		                            <td>
		                                
		                                 <ww:if test="publicDp.itemtype==1"><ww:property value='#session.local.a00609' /></ww:if>
		                                 <ww:elseif test="publicDp.itemtype==2"><ww:property value='#session.local.a00434' /></ww:elseif>
		                                 
		                            </td>
		                            <td>
		                            
		                                 <ww:if test="publicDp.state==0"><ww:property value='#session.local.a00425' /></ww:if>
		                                 <ww:elseif test="publicDp.state==1"><ww:property value='#session.local.a00426' /></ww:elseif>
		                                 <ww:elseif test="publicDp.state==2"><ww:property value='#session.local.a00427' /></ww:elseif>
		                                
		                            </td>
		                           
		                          </tr>
		                          <tr>
		                            <td><ww:property value='#session.local.a00607' /></td> <!-- 轮播播放 -->
		                            <td>
		                                 <a style="cursor: pointer;" id="tip-time"  title="<ww:property  value='publicTime.content' />"  onclick="javascript:open_items('<ww:property  value='publicTime.itemids' />_<ww:property  value='publicTime.itemtype' />')">  <ww:property  value="publicTime.contentsub" /></a>
		                            </td>
<!--		                             <td><ww:property  value="publicCp.itemids" /></td>-->
		                            <td>
		                                
		                                 <ww:if test="publicTime.itemtype==1"><ww:property value='#session.local.a00609' /></ww:if>
		                                 <ww:elseif test="publicTime.itemtype==2"><ww:property value='#session.local.a00434' /></ww:elseif>
		                                 
		                            </td>
		                            
		                            <td>
		                            
		                                 <ww:if test="publicTime.state==0"><ww:property value='#session.local.a00425' /></ww:if>
		                                 <ww:elseif test="publicTime.state==1"><ww:property value='#session.local.a00426' /></ww:elseif>
		                                 <ww:elseif test="publicTime.state==2"><ww:property value='#session.local.a00427' /></ww:elseif>
		                                 <ww:elseif test="publicTime.state==20"><ww:property value='#session.local.a00681' /></ww:elseif>
										 <ww:elseif test="publicTime.state==21"><ww:property value='#session.local.a00682' /></ww:elseif>
										 <ww:elseif test="publicTime.state==22"><ww:property value='#session.local.a00683' /></ww:elseif>
										 <ww:elseif test="publicTime.state==23"><ww:property value='#session.local.a00684' /></ww:elseif>
										 <ww:elseif test="publicTime.state==24"><ww:property value='#session.local.a00685' /></ww:elseif>
										 <ww:elseif test="publicTime.state==25"><ww:property value='#session.local.a00686' /></ww:elseif>
										 <ww:elseif test="publicTime.state==26"><ww:property value='#session.local.a00687' /></ww:elseif>
		                            
		                            </td>
		                           
		                          </tr>
		                           <tr>
		                            <td><ww:property value='#session.local.a00608' /></td> <!-- 插播播放 -->
		                            
		                            <td >
		                                <a style="cursor: pointer;"  id="tip-insert" title="<ww:property  value='publicInsert.content' />" onclick="javascript:open_items('<ww:property  value='publicInsert.itemids' />_<ww:property  value='publicInsert.itemtype' />')">  <ww:property  value="publicInsert.contentsub" /></a>
		                            </td>
<!--		                            <td><ww:property  value="publicCp.itemids" /></td>-->
		                            <td>
		                               
		                                 <ww:if test="publicInsert.itemtype==1"><ww:property value='#session.local.a00609' /></ww:if>
		                                 <ww:elseif test="publicInsert.itemtype==2"><ww:property value='#session.local.a00434' /></ww:elseif>
		                                 
		                            </td>
		                            <td>
		                            
		                                 <ww:if test="publicInsert.state==0"><ww:property value='#session.local.a00425' /></ww:if>
		                                 <ww:elseif test="publicInsert.state==1"><ww:property value='#session.local.a00426' /></ww:elseif>
		                                 <ww:elseif test="publicInsert.state==2"><ww:property value='#session.local.a00427' /></ww:elseif>
		                                 <ww:elseif test="publicInsert.state==20"><ww:property value='#session.local.a00681' /></ww:elseif>
										 <ww:elseif test="publicInsert.state==21"><ww:property value='#session.local.a00682' /></ww:elseif>
										 <ww:elseif test="publicInsert.state==22"><ww:property value='#session.local.a00683' /></ww:elseif>
										 <ww:elseif test="publicInsert.state==23"><ww:property value='#session.local.a00684' /></ww:elseif>
										 <ww:elseif test="publicInsert.state==24"><ww:property value='#session.local.a00685' /></ww:elseif>
										 <ww:elseif test="publicInsert.state==25"><ww:property value='#session.local.a00686' /></ww:elseif>
										 <ww:elseif test="publicInsert.state==26"><ww:property value='#session.local.a00687' /></ww:elseif>
		                                
		                            </td>
		                          
		                          </tr>
		                          
		                         
		                          <tr>
		                            <td>
		                                 <ww:property value='#session.local.b00276' />
		                                 <ww:property value='#session.local.a00599' />
		                            </td>  <!-- 预警节目 --> 
		                            <td >
		                                <a style="cursor: pointer;" id="tip-date"   title="<ww:property  value='publicWarning.content' />"    onclick="javascript:open_items('<ww:property  value='publicWarning.itemids' />_<ww:property  value='publicWarning.itemtype' />')">  <ww:property  value="publicWarning.contentsub" /></a>
		                            </td>
<!--		                            <td><ww:property  value="publicCp.itemids" /></td>-->
		                            <td>
		                                 
		                                 <ww:if test="publicWarning.itemtype==1"><ww:property value='#session.local.a00609' /></ww:if>
		                                 <ww:elseif test="publicWarning.itemtype==2"><ww:property value='#session.local.a00434' /></ww:elseif>
		                                 
		                            </td>
		                            <td>
		                            
		                                 <ww:if test="publicWarning.state==0"><ww:property value='#session.local.a00425' /></ww:if>
		                                 <ww:elseif test="publicWarning.state==1"><ww:property value='#session.local.a00426' /></ww:elseif>
		                                 <ww:elseif test="publicWarning.state==2"><ww:property value='#session.local.a00427' /></ww:elseif>
		                                 <ww:elseif test="publicWarning.state==20"><ww:property value='#session.local.a00681' /></ww:elseif>
										 <ww:elseif test="publicWarning.state==21"><ww:property value='#session.local.a00682' /></ww:elseif>
										 <ww:elseif test="publicWarning.state==22"><ww:property value='#session.local.a00683' /></ww:elseif>
										 <ww:elseif test="publicWarning.state==23"><ww:property value='#session.local.a00684' /></ww:elseif>
										 <ww:elseif test="publicWarning.state==24"><ww:property value='#session.local.a00685' /></ww:elseif>
										 <ww:elseif test="publicWarning.state==25"><ww:property value='#session.local.a00686' /></ww:elseif>
										 <ww:elseif test="publicWarning.state==26"><ww:property value='#session.local.a00687' /></ww:elseif>
		                                
		                            </td>
		                          </tr>
		                          
		                          
		                            <tr>
		                            <td>
		                                 <ww:property value='#session.local.b00371' />
		                                 <ww:property value='#session.local.a00599' />
		                            </td>  <!-- 条件节目 --> 
		                            <td >
		                                <a style="cursor: pointer;" id="tip-date"   title="<ww:property  value='publicCondition.content' />"    onclick="javascript:open_items('<ww:property  value='publicCondition.itemids' />_<ww:property  value='publicCondition.itemtype' />')">  <ww:property  value="publicCondition.contentsub" /></a>
		                            </td>
<!--		                            <td><ww:property  value="publicCp.itemids" /></td>-->
		                            <td>
		                                 
		                                 <ww:if test="publicCondition.itemtype==1"><ww:property value='#session.local.a00609' /></ww:if>
		                                 <ww:elseif test="publicCondition.itemtype==2"><ww:property value='#session.local.a00434' /></ww:elseif>
		                                 
		                            </td>
		                            <td>
		                            
		                                 <ww:if test="publicCondition.state==0"><ww:property value='#session.local.a00425' /></ww:if>
		                                 <ww:elseif test="publicCondition.state==1"><ww:property value='#session.local.a00426' /></ww:elseif>
		                                 <ww:elseif test="publicCondition.state==2"><ww:property value='#session.local.a00427' /></ww:elseif>
		                                 <ww:elseif test="publicCondition.state==20"><ww:property value='#session.local.a00681' /></ww:elseif>
										 <ww:elseif test="publicCondition.state==21"><ww:property value='#session.local.a00682' /></ww:elseif>
										 <ww:elseif test="publicCondition.state==22"><ww:property value='#session.local.a00683' /></ww:elseif>
										 <ww:elseif test="publicCondition.state==23"><ww:property value='#session.local.a00684' /></ww:elseif>
										 <ww:elseif test="publicCondition.state==24"><ww:property value='#session.local.a00685' /></ww:elseif>
										 <ww:elseif test="publicCondition.state==25"><ww:property value='#session.local.a00686' /></ww:elseif>
										 <ww:elseif test="publicCondition.state==26"><ww:property value='#session.local.a00687' /></ww:elseif>
		                                
		                            </td>
		                          </tr>
		                          
		                          
		                        
		                        </tbody>
		                     </table>
		              
		            </div>
		        </div>
		     </div>
  
   </div>
       
       
       
       

      
    
   </form>
</body>
</html>
