<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<title></title>
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/common.css"/>
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/fresh.js" language="javascript"></script>
<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>



<base target="_self" />
<style type="text/css">
A{text-transform:none; text-decoration:none;}   
</style>
<script>
//跳转集中显示
function jump_queue_many(){
   window.location.href="item_queue_many.jsp";
}
//跳转单条显示
function jump_queue_single(){
   window.location.href="item_queue_single.jsp";
}

//跳转公交巴士
function jump_bus(){
   window.location.href="item_bus.jsp";
}

//充电桩跳转
function jump_charging_piles(){

	var programDll=new Object();
	programDll.rows=6;
	programDll.columns=2;
	programDll.type=1;

	var jsonStr=JSON.stringify(programDll);
  	jsonStr=jsonStr.replace(/"/g,"'");
	
	window.location.href="toProgramDll.vs?jsonStr="+jsonStr;
}

//数据接口跳转
function jump_datasource(){
	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	window.parent.returnValue="source|1"; 
    window.parent.layer.close(index);
}

//控件播放节目跳转
function jump_dllItem(){
	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	window.parent.returnValue="dllItem|1"; 
    window.parent.layer.close(index);
	
}

//环境监测
function jump_environmental(){

	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引

	var envirType="<ww:property value='#session.version_onoff.envirType' />";

	//102,104 广州,105 中创联合 深圳  

	if(envirType==105){

		window.location.href="toEnvironment105Dll.vs?jsonStr="+envirType;

    }else{
        
    	window.parent.returnValue="envir|"+envirType; 

        window.parent.layer.close(index);

    }

}

//电梯显示区
function jump_elevatorShow(){

    //item_dll_eleva.jsp
	window.location.href="toadeleva.vs";
	 
	//var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	//window.parent.returnValue="eleva|1"; 
    //window.parent.layer.close(index);
}


//二次开发 文本图片区域,全屏显示
function jump_ports(){

	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	window.parent.returnValue="ports|1"; 
    window.parent.layer.close(index);
	
}

//叫号控件
function jump_call(){

	var mfile="<ww:property value='#session.scene.filename'/>";  
	window.location.href="tocall.vs?mfile="+mfile;
	
}

//柜员控件
function jump_to_teller(){
	
	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	window.parent.returnValue="teller|1"; 
    window.parent.layer.close(index);

}
//人脸识别组件
function jump_face()
{

		 

    
	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引


    window.parent.returnValue="face|109"; 

    window.parent.layer.close(index);
    
}


</script>
</head>
<body>
<form action="adtxtto.vs" method="post" name="form1">
      <div class="panel panel-primary" style="margin: 3px 3px;border:0px;">
	      <div class="panel-heading">
	           <ww:property value="#session.local.b00093"/> <!-- 插件-->
	      </div>
	      
         <div class="container clearfix" style="margin: 50px 50px;">
         <div class="main-wrap">
		   <div class="result-wrap">
		        <div class="result-content">
    
		        <table class="insert-tab"  width="100%" style="height: 50px;">
		       
		           <!-- 叫号 -->
                   <ww:if test="#session.version_onoff.queue==1">
					   <tr>
					     <td style="text-align: right;">
					        <ww:property value="#session.local.a00704"/>:              
					     </td>
			             <td> 
			                 <button class="btn btn-primary" onclick='jump_queue_many()' type="button"><ww:property value='#session.local.a00700' /></button>
			                 &nbsp;&nbsp;
			                 <button class="btn btn-primary" onclick='jump_queue_single()' type="button"><ww:property value='#session.local.a00701' /></button>
			             </td>
					   </tr>
					</ww:if>
					
					<!-- 公交巴士设备ID -->
					<ww:if test="#session.version_onoff.bus==1">
					   <tr>
					     <td style="text-align: right;">
					        <ww:property value="#session.local.a00771"/>:              
					     </td>
			             <td> 
			                 <button class="btn btn-primary" onclick='jump_bus()' type="button"><ww:property value='#session.local.a00774' /></button>
			             </td>
					   </tr>
					</ww:if>
					 
					
					<!-- 充电桩  -->
					<ww:if test="#session.version_onoff.chargingPilesShow==1">
					     <tr>
					     <td style="text-align: right;">
					        <ww:property value="#session.local.b00090"/>:              
					     </td>
			             <td> 
			                 
			                 <button class="btn btn-primary" onclick='jump_charging_piles()' type="button"><ww:property value='#session.local.b00091' /></button>
			                 
			             </td>
					   </tr>
					   
					   
					</ww:if>
					
					<!-- 数据接口  -->
					<ww:if test="#session.version_onoff.dataSourceShow==1">
					     <tr>
					     <td style="text-align: right;width:40%;padding-right: 30px;">
					        <ww:property value="#session.local.a00996"/>:              
					     </td>
			             <td> 
			                 
			                 <button class="btn btn-primary" onclick='jump_datasource()' type="button"><ww:property value='#session.local.a00997' /></button>
			                 
			             </td>
					   </tr>
					</ww:if>
					
					
					<!-- 控件节目  -->
					<ww:if test="#session.version_onoff.dllItemSendShow==1">
					     <tr>
						     <td style="text-align: right;width:40%;padding-right: 30px;">
						        <ww:property value="#session.local.b00118"/>:              
						     </td>
				             <td>        
				                 <button class="btn btn-primary" onclick='jump_dllItem()' type="button"><ww:property value='#session.local.a00652' /></button>   
				             </td>
					    </tr>
					</ww:if>
					
					
                    <!--环境监测-->
					<ww:if test="#session.version_onoff.environmentalTestingShow==1">
					     <tr>
						     <td style="text-align: right;padding-right: 30px;">
						        <ww:property value="#session.local.b00159"/>:              
						     </td>
				             <td>    
				                    
				                 <button class="btn btn-primary" onclick='jump_environmental()' type="button"><ww:property value='#session.local.a00652' /></button>   
				             </td>
					    </tr>
					</ww:if>
					
					
					<!-- 中创联合插件 电梯信息区 -->
					<ww:if test="#session.version_onoff.zclhOnOff==1">
					     <tr>
						     <td style="text-align: right;padding-right: 30px;">
						        <ww:property value="#session.local.b00277"/>:              
						     </td>
				             <td>        
				                 <button class="btn btn-primary" onclick='jump_elevatorShow()' type="button"><ww:property value='#session.local.a00652' /></button>   
				             </td>
					    </tr>
					</ww:if>
					
					
					
					<!-- 二次开发 文本图片区域,全屏显示 -->
					<ww:if test="#session.version_onoff.portsOnOff==1">
					     <tr>
						     <td style="text-align: right;padding-right: 30px;">
						        <ww:property value="#session.local.b00347"/>:              
						     </td>
				             <td>        
				                 <button class="btn btn-primary" onclick='jump_ports()' type="button"><ww:property value='#session.local.a00652' /></button>   
				             </td>
					    </tr>
					</ww:if>
					
					
					<!-- 二次开发 叫号组件  柜员组件 -->
					
					
					<ww:if test="#session.version_onoff.cllComponentOnOff==1">
					     <tr>
						     <td style="text-align: right;padding-right: 30px;">
						        <ww:property value="#session.local.b00360"/>:              
						     </td>
				             <td>        
				                 <button class="btn btn-primary" onclick='jump_call()' type="button"><ww:property value='#session.local.a00652' /></button>   
				             </td>
					    </tr>
					</ww:if>
					
					<ww:if test="#session.version_onoff.cllComponentOnOff==1">
					     <tr>
						     <td style="text-align: right;padding-right: 30px;">
						        <ww:property value="#session.local.b00361"/>:              
						     </td>
				             <td>        
				                 <button class="btn btn-primary" onclick='jump_to_teller()' type="button"><ww:property value='#session.local.a00652' /></button>   
				             </td>
					    </tr>
					</ww:if>
					
					
					
					<!-- 二次开发 人脸识别组件  -->
					   
					   
					<ww:if test="#session.version_onoff.facerecognitionOnOff==1">
					     <tr>
						     <td style="text-align: right;padding-right: 30px;">
						        <ww:property value="#session.local.d00006"/>:              
						     </td>
				             <td>    
				                    
				                 <button class="btn btn-primary" onclick='jump_face()' type="button"><ww:property value='#session.local.a00652' /></button>   
				             </td>
					    </tr>
					</ww:if>
					 
		        </table>
             </div>
		  </div>
		</div>
    </div>	
    </div>    
</form>

</body>
</html>
