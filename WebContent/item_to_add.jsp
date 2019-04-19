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
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<script type="text/javascript" src="js/cookie.js"></script>

 <script language="javascript">  
      document.onkeydown = function(e) {
          e = e || window.event;
          if(e.keyCode == 13) {
             // this.forms["form"].submit();
              additem();
              return false;
          }
      };
</script>
        
<script type="text/javascript">

function init_self(){

	var cookies = getCookie("fblid");
	
	if(cookies != null){
		$("#fblid").val(cookies);
	}


	$('#form1').find('input[name=itemViceType]').bind('click', function(){

		$('#form1').find('input[name=itemViceType]').not(this).attr("checked", false);
		
        var selItemType=$(this).val();

        if(selItemType==0){

        	$("#screenShow").hide();
        	
        }else if(selItemType==1){

        	$("#screenShow").show();

        }
        
        
	});


	

	

	var openIntro = <%=request.getParameter("openIntro")%>;
	if(openIntro == '1'){
		openIntro = null;
		var intro = introJs();  
		intro.setOptions({
	 	prevLabel:"<ww:property value='#session.local.a00861' />", 
        nextLabel:"<ww:property value='#session.local.a00862' />",
        skipLabel:"<ww:property value='#session.local.a00863' />",
        doneLabel:"<ww:property value='#session.local.a00863' />",
        showStepNumbers: false,
        showBullets: false,
        exitOnOverlayClick: false,
        overlayOpacity: 0.4,
		steps: [  
			{  
				element: '.step1',  
				intro: "<ww:property value='#session.local.a00908' /><span style='color:blue'> <ww:property value='#session.local.a00255' /></span>"
			},
			{
				element: '#fblid',  
				intro: "<ww:property value='#session.local.a00940' /><span style='color:blue'> 1920*1080</span>"
			},
			{
				element: '#step3',  
				intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00869' /></span><ww:property value='#session.local.a00941' />"
			}
		  ]  
		});  

		intro.start().oncomplete(function() {  
			intro.exit();  
	    });
		
		intro.onexit(function() {
			layer.msg("<ww:property value='#session.local.a00864' />");
		});
	}
}

function additem(){
	    var name = document.getElementById('name').value;	
	    var fblid = document.getElementById('fblid').value;	
	    var lable = document.getElementById('lable').value;	
	    if (name.length < 1){
	    	 layer.msg("<ww:property value='#session.local.a00260' />!");
             return;
		}
	    if(fblid==""){
	    	 layer.msg("<ww:property value='#session.local.a00262' />!");
             return;
		}

	   setCookie("fblid",$("#fblid").val());

   	   document.form1.target = "_self";

   	   document.form1.action = 'itemtoaddscene.vs';

   	   document.form1.submit();   	    
}

function  fastAddParameter(){

	//弹出
	layer.open({
 		type: 2,
         area: ['500px', '300px'],
         offset: '20px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'system_cs_fbl_add.jsp',
         scrollbar: false,
         end: function(data){

                

				 $.ajax({
						type:'post',
						url:'ajaxfblall.vs',
						dataType:'json',
						async:true,
						cache:true,
						success:function(data){

					           document.getElementById("fblid").options.length=0;
							   var obj=document.getElementById('fblid'); 
		
					    	   //清空   
					    	   
						       for(i=0;i<data.length;i++)
							   {
			                         
						    	   obj.options.add(new Option(data[i].name,data[i].id)); //这个兼容IE与firefox 
						    	 
							
							    }
					      
						}
					});

			
        
		     
	       
		      
		   
 		 }
 	});          
	
}

</script>

</head> 
<body onload="init_self()">

   <form  id="form1" name="form1" method="post" >
      <div class="panel panel-primary" style="margin: 3px 3px;border: 0px;">
           <div class="panel-heading">
                <ww:property value="#session.local.a00145"/> <!-- 新增节目-->
           </div>
           
           
				       <div class="container clearfix" style="margin: 50px 50px;">
				             <div class="main-wrap">
						         <div class="result-wrap">
						            <div class="result-content">
						              
						                    <table class="insert-tab" width="100%">
						                        <tbody>
						                         
						                          <tr>
						                            <th width="180"><i class="require-red">*</i><ww:property value='#session.local.a00255' />：</th>
						                            <td>
						                               <input class="common-text required step1" style="height: 20px;line-height: 20px;"  value=""  name="item.name" id="name"  type="text"/>
						                            </td>
						                          </tr>
						                          
                                                  <ww:if test="#session.version_onoff.viceItemOnOff==1">
                                                  
						                          
							                          <tr>
							                            <th width="180"><i class="require-red">*</i><ww:property value='#session.local.a00603' />：</th>
							                            <td>
							                               <input name='itemViceType'  type="checkbox" value="0" checked="checked" />
							                               <ww:property value="#session.local.a00609" />
							                               &nbsp;&nbsp;&nbsp;
							                               <input name='itemViceType'  type="checkbox" value="1"/>
							                               <ww:property value="#session.local.b00329" />
							                               
							                            </td>
							                          </tr>
						                          
						                          </ww:if>
						                          
						                               <tr>
						                                <th><i class="require-red">*</i><ww:property value='#session.local.a00176' />：</th>
						                                <td>
						                                    <select  style="width: 170px; border: 1px solid #495764;" id="fblid"  name="item.fblid">
														        <ww:iterator value="fbls">
																	<option value="<ww:property value="id" />"><ww:property value="name" /></option>
																</ww:iterator>
															</select>
															
															<ww:if test="#session.sysset==0">
															    
															</ww:if>
															<ww:else>
															     <i onclick="fastAddParameter()" style="cursor: pointer;" title="<ww:property value='#session.local.a00021' />"  class="icon icon-plus-sign"></i>
															</ww:else>
															
						                                </td>
						                            </tr>
						                            
						                            
						                            
						                           <tr id="screenShow" style="display: none;">
						                                <th><ww:property value='#session.local.b00374' /></th>
						                                <td>
						                                  
							                               
							                                <select  style="width: 170px; border: 1px solid #495764;" id="screenType"  name="screenType">
														        <ww:iterator value="fbls">
																	<option value="<ww:property value="id" />"><ww:property value="name" /></option>
																</ww:iterator>
															</select>
															
															
						                                </td>
						                            </tr>
						                            
						                            
						                      	 <tr>
						                            <th width="180"><i class="require-red"></i><ww:property value='#session.local.d00005' />：</th>
						                            <td>
						                               <input class="common-t	ght: 20px;line-height: 20px;"  value=""  name="item.lable" id="lable"  type="text"/>
						                            </td>
						                          </tr>
						                            
						                        
						                            <tr style="height: 40px;">
						                                <th></th>
						                                <td>
						                                    
						                                    <button class="btn btn-primary" onclick='additem()' type="button" id="step3"><ww:property value='#session.local.a00080' /></button>
						                                    
						                                     <!-- <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">-->
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
