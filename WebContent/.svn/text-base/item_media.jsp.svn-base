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
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/fresh.js" language="javascript"></script>

<base target="_self" />
<style type="text/css">
A{text-transform:none; text-decoration:none;}   
</style>
<script>

//初始化
function iniData(){


	 //播放列表
    var  yxSucaiListJson="<ww:property value='yxSucaiListJson' />";
    if(yxSucaiListJson!=""){
    	yxSucaiListJson=yxSucaiListJson.replace(/&quot;/g,"\"");
    

    	//转换成touch对象组
	    var objs = eval( "(" + yxSucaiListJson + ")" );//转换后的JSON对象

	    //多媒体类型
	    var selectMediaType = document.getElementById("mediaType");
	   
	    var mediaType = objs[0].type;  
	    for(var i=0; i<selectMediaType.options.length; i++){  
	        if(selectMediaType.options[i].value == mediaType){  
	        	selectMediaType.options[i].selected = true;  
	            break;  
	        }  
	    }
        if(mediaType==3){
           $("#mediaTypeTr").show();
           $("#mediaUrl").val(objs[0].surl);
        }else{
           $("#mediaUrl").val(""); 
           $("#mediaTypeTr").hide();
        }
	    //音量
	    var selectVol = document.getElementById("vol");
	    var mediaVol = objs[0].mVol;  
	    for(var i=0; i<selectVol.options.length; i++){  
	        if(selectVol.options[i].value == mediaVol){  
	        	selectVol.options[i].selected = true;  
	            break;  
	        }  
	    }
	}else{
		//音量
	    var selectVol = document.getElementById("vol");
	    
	    for(var i=0; i<selectVol.options.length; i++){  
	        if(selectVol.options[i].value ==100){  
	        	selectVol.options[i].selected = true;  
	            break;  
	        }  
	    }

    }   
}

function setMediaType(mediaType){

	if(mediaType==3){
      $("#mediaTypeTr").show();
    }else{
      $("#mediaTypeTr").hide();
    }
}

function adPlayData(){
    //获取多媒体类型
    var mediaType=$('#mediaType option:selected').val();
    //获取音量
    var vol=$('#vol option:selected').val();

    var mediaUrl;
    if(mediaType==3){

    	mediaUrl=$("#mediaUrl").val();

    	if(mediaUrl.length==0){
        	  layer.msg("<ww:property value='#session.local.a00717' />");
              return;
        }
     }


     //构造集合对象
	   var programComplexMediaManager=new Object();
	   programComplexMediaManager.mLeft=0;
	   programComplexMediaManager.mTop=0;
	   programComplexMediaManager.mWidth=300;
	   programComplexMediaManager.mHeight=300;
	   var mMediaList= new Array();
     
	   
		   var scBasis = new Object();
		   scBasis.tbType=mediaType;  //类型
		   scBasis.type=mediaType;    //类型 
		   scBasis.timeoutMillis=0;  //切换时长
		   scBasis.path="";    //播放地址
		   scBasis.inAnim=0;   //特效
		   scBasis.sname="";//显示名称
		   scBasis.mVol=vol;
		   if(mediaType==3){
			   scBasis.surl=mediaUrl;
		   }
		   
		   mMediaList[0]=scBasis;
	   
	   programComplexMediaManager.mPlayTimes=0;//播放总时长
	   programComplexMediaManager.mMediaList=mMediaList;//素材播放列表
	        
	   var json = JSON.stringify(programComplexMediaManager);

	   var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
		
	   window.parent.returnValue=""; 
		
	   window.parent.returnValue=json; 
	   window.parent.layer.close(index);

	     
	 

	
}

</script>
</head>
<body onload="iniData()">
<form action="" method="post" name="form1"  >
    
    
      <div class="panel panel-primary" style="margin: 3px 3px;">
           <div class="panel-heading">
                <ww:property value="#session.local.a00060"/>/<ww:property value="#session.local.b00024"/> <!-- 多媒体 -->
           </div>
          <div class="container clearfix" style="margin: 10px 10px;">
          
          
           
   <div class="container clearfix" style="margin: 10px 50px;">
      
        <div class="main-wrap" style="width:700px;">
		   <div class="result-wrap">
		        <div class="result-content">
    
		        <table class="insert-tab" width="95%">
		           <tr>
		            <td style="text-align: right;" width="100"><ww:property value="#session.local.a00035" />:</td>
		            <td>
		                  <!--  3流媒体 4AV数据源 5实时显示 -->
		                 <select onchange="setMediaType(this.value)" id="mediaType">
			                   <option <ww:if test='mediaType==3'>selected="selected"</ww:if> value="3"><ww:property value="#session.local.a00716" /></option>
			                   <option <ww:if test='mediaType==4'>selected="selected"</ww:if> value="4"><ww:property value="#session.local.a00345" /></option>
			                   <option <ww:if test='mediaType==5'>selected="selected"</ww:if> value="5"><ww:property value="#session.local.a00346" /></option>
			                   
		                 </select>
		            </td>
		          </tr>
		          
		           <tr>
		            <td style="text-align: right;"><ww:property value="#session.local.a00461" />:</td>
		            <td>
		                  <select name="vol" style="width:100"  id="vol">
									     <option value="0">0%</option>
									     <option value="10">10%</option>
									     <option value="20">20%</option>
									     <option value="30">30%</option>
									     <option value="40">40%</option>
									     <option value="50">50%</option>
									     <option value="60">60%</option>
									     <option value="70">70%</option>
									     <option value="80">80%</option>
									     <option value="90">90%</option>
									     <option value="100">100%</option>  
						  	</select> 
		            </td>
		          </tr>
		          
		          
				 <tr  id="mediaTypeTr">
		            <td style="text-align: right;"><ww:property value="#session.local.a00347" />:</td>
		            <td>
		                <input type="text"  id="mediaUrl"   style="height: 20px;line-height: 20px;"  />
		            </td>
		          </tr>
		          
		        <tr style="display: none;">
		            <td></td>
		            <td>
		                X:
					   <input id="xy_x" name="xy_x" type="text" <ww:if test="xy_x==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_x' />"</ww:else>  style="width: 40px;height: 18px;" value="0"   onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
					    Y:
				       <input id="xy_y" name="xy_y" type="text" <ww:if test="xy_y==0">value="0"</ww:if><ww:else>value="<ww:property value='xy_y' />"</ww:else> style="width: 40px;height: 20px;" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
				       <ww:property value='#session.local.a00032' />:
			           <input name="width" id="width" type="text" style="width:40px;height: 20px;" <ww:if test="width==0">value="200"</ww:if><ww:else>value="<ww:property value='width' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
			           <ww:property value='#session.local.a00033' />:
			           <input name="height" id="height" type="text" style="width:40px;height: 20px;"  <ww:if test="height==0">value="200"</ww:if><ww:else>value="<ww:property value='height' />"</ww:else>  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
		            </td>
			       
			      </tr>

				   <tr style="height: 40px;">
		            <td></td>
		            <td>
		               
		               <button class="btn btn-primary" onclick='adPlayData()' type="button"><ww:property value='#session.local.a00080' /></button>
		            </td>
				   </tr>
				   
				   
				   <tr >
		            <td></td>
		            <td>
		               <span style="color:#FFA534;font-size: 12px; ">
			                <ww:property value='#session.local.a00093' />:<br/>
	
							<ww:property value='#session.local.a00716' />:    <ww:property value='#session.local.b00195' /><br/>
							<ww:property value='#session.local.a00345' />:    <ww:property value='#session.local.b00196' /><br/>
							<ww:property value='#session.local.a00346' />:    <ww:property value='#session.local.b00197' />
						</span>
		            </td>
				   </tr>
				   
				   
		        </table>
             </div>
		  </div>
		</div>
    </div>
    
    </div>
    </div>	    
</form>

</body>
</html>
