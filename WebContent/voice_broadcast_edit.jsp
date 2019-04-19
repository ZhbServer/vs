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
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/icon.css"  />

<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<link href="<ww:url value="/webwork/jscalendar/calendar-blue.css" />" rel="stylesheet" type="text/css" media="all" />
<link href="css/base2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/vs/webwork/jscalendar/calendar.js"></script>
<script type="text/javascript" src="/vs/webwork/jscalendar/lang/calendar-zh.js"></script>
<script type="text/javascript" src="/vs/webwork/jscalendar/calendar-setup.js"></script>
<script type="text/javascript" src="js/My97DatePicker/<ww:property value='#session.local.a00000' />_WdatePicker.js"></script>




<style>
	/* 为可拖动的条目应用可移动光标类型 */
	#sortableList > .list-group-item {cursor: move}
	
	/* 为正在被拖动的条目应用半透明外观 */
	#sortableList > .list-group-item.dragging {
	  visibility: visible;
	  opacity: .3;
	}
	
	input[type="radio"] {
    line-height: normal;
    margin: 0px 0px 0px;
    margin-top: 0px;
    margin-right: 0px;
    margin-bottom: 0px;
    margin-left: 0px;
   }
</style>


<script type="text/javascript">


function save() {


	//获取播报编号
	//var numberstr =$('#numberstr option:selected').val();
	//获取播报文件名(name)
	var voiceName=$('#voiceName').val();
	if(voiceName.length==0){
        layer.msg("<ww:property value='#session.local.b00110'/><ww:property value='#session.local.a00691'/>");
        return;
    }
	
    document.form1.action="voiceaddaudio.vs";
	document.form1.submit();
}

function closeDig(){
	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
    window.parent.layer.close(index);
}


/*弹出选择音频*/
function select_win_audio(){
	   
	  
	    //var yxSucaiListJson="";
	    //var yxmusics=document.getElementById("ie_item_make").contentWindow.document.getElementById("video10000");
	  
		//if(yxmusics!=null){
		//	yxSucaiListJson=yxmusics.getAttribute("jsonData");
		//	if(yxSucaiListJson!=null){
		//		yxSucaiListJson=yxSucaiListJson.replace(/"/g,"'"); 
		//    }
			
			//alert(yxSucaiListJson);   
	    //}
		window.returnValue=""; 
		layer.open({
				type: 2,
				area: ['900px', 520+'px'],
 		        offset: '10px',
		        title:false,
		        fix: false, //不固定
		        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		        content: 'tovoiceaddaudio.vs?sucai.type=2&gssi.sucaigroupid=0&yxSucaiListJson=',
		        scrollbar: false,
		        end: function(){ 
					  

					    if(window.returnValue==undefined||window.returnValue==""){
						     window.returnValue=""; 			            
						}else{
						    //解析json 
					        var rv=window.returnValue;
					    
						    rv=rv.replace(/&quot;/g,"\"");
						    
				            //转换成touch对象组
						    var obj = eval( "(" + rv + ")" );//转换后的JSON对象


	                        $("#voiceName").val(obj.name);
	                        $("#voiceFileName").val(obj.filename);   
					    }

							 
					   
		        }	
		});
}

</script>

</head> 
<body>


<br/>
   <form  name="form1" method="post" >
     <div class="panel panel-primary" style="margin: -18px 3px 3px 3px;">
           <div class="panel-heading">
                <ww:property value="#session.local.b00109"/> <!-- 新增播报 -->
           </div>
           
	       <div class="container clearfix" style="margin: 10px 10px;">
	             <div class="main-wrap">
			         <div class="result-wrap">
			            <div class="result-content">
			              
			                    <table class="insert-tab" width="100%">
			                        <tbody>
			                         <tr>
			                            <!-- 编号 -->
			                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00034' />:</th>
			                            <td>
			                               <select style="width: 175px;"  id="numberstr" name="numberstr">
			                               
			                                   <ww:if test="vb.numberstr!=null">
			                                      <option selected="selected"  value="<ww:property value='vb.numberstr'/>"><ww:property value='vb.numberstr'/></option>
			                                   </ww:if>
			                                   
			                                   
			                                   
			                                   <ww:iterator value="noSelectNumberStr">
				                                   <option
				                                      
				                                      value="<ww:property />"><ww:property />  
				                                   
				                                  </option>     
				                               </ww:iterator>
			                               
			                               </select>
			                            </td>
			                          </tr>
			                          
			                         <tr>
			                            <!-- 播放文件 -->
			                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.b00110' />:</th>
			                            <td> 
			                               <input type="text"  readonly="readonly" id="voiceName" name="voiceName"  value="<ww:property value='vb.resourcename'/>"/>
			                               <input type="hidden" id="voiceFileName" name="voiceFileName" value="<ww:property value='vb.resourcefilename'/>" />
			                               <i onclick="select_win_audio()" style="cursor: pointer;" title="<ww:property value='#session.local.a00021' />"  class="icon icon-plus-sign"></i> 
			                            </td>
			                          </tr>
			                        
			                         
			                          <tr>
			                                <th></th>
			                                <td>
			                                    <button class="btn btn-primary" type="button"  onclick="save()"><ww:property value='#session.local.a00080' /></button>
			                                    <button class="btn btn-primary" onclick="closeDig()" type="button"><ww:property value='#session.local.a00014' /></button>
			                                </td>
			                            </tr>
			                        </tbody>
			                    </table>
			            </div>
			        </div>
			     </div>
	  
	   </div>
     </div>
     <input type="hidden"  id="voicebid"  name="voicebid"  value="<ww:property value='voicebid'/>"/> 
   </form>
</body>
</html>
