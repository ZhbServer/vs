<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>

   
    <link rel="stylesheet" href="m/css/index.css" type="text/css">
    <link rel="stylesheet" href="m/css/zy.css" type="text/css">  
    <link rel="stylesheet" href="m/css/swiper.min.css" type="text/css">
    <script type="text/javascript" src="m/js/swiper.min.js"></script>
    <script type="text/javascript" src="m/js/jquery-1.4.4.min.js"></script> 
    <script type="text/javascript" src="js/layer/layer.js"></script>
   
     <style type="text/css">
   
      input[type=checkbox] {
           -ms-transform: scale(3); /* IE */
           -moz-transform: scale(3); /* FireFox */
		  -webkit-transform: scale(3); /* Safari and Chrome */
		  -o-transform: scale(3); /* Opera */
      }
   
     </style>
    

  </head>
  
  
  <body onload="getClientList(0)">
  
    <!-- 头部 -->
    <div class="toub_beij toub_beij_zhuy">
		    <div class="fanhui_jt"><a href="javascript:history.back(-1);"><i class="fanh_jiant"><!-- <img src="images/fanh_jiant_hei.png"> --></i><span>返回</span></a></div>
		    <div class="mingc_tb">多媒体信息发布</div>
		    <div class="sy_zaix"><a href="javascript:sel_send();"><i style="color:#fff;">发布</i></a></div>
    </div> 
   <script type="text/javascript">
        //滑动头部透明（针对首页头部用）
	    window.onscroll=function(){
	
	    var autoheight=document.body.scrollTop||document.documentElement.scrollTop;
	    if(autoheight>20){
	        $(".toub_beij").css("position" ,"fixed")
	        }else{
	            $(".toub_beij").css("position" ,"relative")
	        }
	    }


        //加载终端
        function getClientList(v){

        	var urid = "<ww:property value='#session.urid'  />";

       
        	if(urid==""){

        		window.location.href="m_login.vs";

            }

        	 var page=$("#page").val();
             if(v==0){
             	page=1;
             }else if(v==1){
             	page=parseInt($("#page").val())+1;
             }
             if(page==1||page<=parseInt($("#totalpage").val())){

            	$.ajax({
    				type:'post',
    				url:'ajaxToSeeClientListMobile.vs',
    				data:"page="+page+"&pagetype="+$("#pagetype").val(),
    				datatype:'json',
    				async:true,
    				success:function(data){	
    					

        			      //集合
        			      var li_array=new Array();
        			      
        			      for(var i=0;i<data.clientlist.length;i++){

        			    	    var zxstateStr="";
        			    	    if(data.clientlist[i].zxstate==0){
        			    	    	zxstateStr="<span style='color:red;'>离线</span>";
            			    	}else{
            			    		zxstateStr="<span style='color:green;'>在线</span>";	
                			    }
        			    	
        			    	    var li_c=$("<li>"+
        			    	    		    "<h1 style='height: 1rem'><input name='clientIds' value='"+data.clientlist[i].id+"' type='checkbox' style='-webkit-appearance: checkbox;margin-top: 0.4rem;margin-left: 0.4rem;' ></h1>"+
        			    	                "<p>"+data.clientlist[i].name+"</p>"+
        			    	                "<h2>标识："+data.clientlist[i].mark+"&nbsp;&nbsp;</h2>"+        			    	                
        			    	                "<h2>状态："+zxstateStr+"</h2>"+
                                            "</li>");
        			    	    li_array[li_array.length]=li_c;
            			      


            			  }

                          var ul_list= $("#ul_list");
                          
        			      for(var i=0;i<li_array.length;i++){

                               ul_list.append(li_array[i]);
        			    	
        			      }

        			      $("#page").val(data.page);
        			      $("#totalpage").val(data.totalpage);
        			}
    			
    			});

            	

            }else{

                       alert("已到最后页");

            }
        	
    		

        }

        //选择终端
        function sel_send(){

            var itemIds=$("#itemIds").val();

            if(itemIds.length==0){

            	alert("未选择发布的节目请返回选择");
            	return;

            }

        	var chk_value =[]; 

            $('input[name="clientIds"]:checked').each(function(){ 
                chk_value.push($(this).val()); 
            }); 
            if(chk_value.length==0){

            	alert("还未选择需要发布的终端");
            	 
                return;
                
            }else{

            	var sendType=$("#sendType").val();

            	if(sendType==0){
            		window.location.href="senditemMobile.vs?itemsids="+itemIds+"&clientids="+chk_value;
                }else if(sendType==1){
                	window.location.href="sendDishMobile.vs?itemsids="+itemIds+"&clientids="+chk_value;
                	
                }
            	
            	
            	
            }

        }

        function clientIdsAllClick(){

        	
              if($("#clientIdsAll").attr("checked")){

            	  $('input[name="clientIds"]').each(function(){ 
                	  $(this).attr("checked",  true); 
                  }); 
                  
              }else{

            	  $('input[name="clientIds"]').each(function(){ 
                	  $(this).attr("checked",  false); 
                  }); 

              }
              
             
        	  

        }
 
       
   </script> 
   <!-- 内容 -->  

<input  type="hidden" value="<ww:property value='sendType' />" id="sendType" name="sendType" />
<div class="luj" style="height: 0.88rem;">
    <div class="luj_nk">
    
      
        <input id="clientIdsAll" onclick="clientIdsAllClick()"  name='clientIdsAll' value='1' type='checkbox' style='-webkit-appearance: checkbox;margin-top: 0.3rem;margin-left: 0.4rem;float: left;' >
       
        
        <a href="javascript:void();" style="padding-left: 0.7rem">终端全选</a>
    
     
    </div>
</div>
<div class="news_k">
    <ul id="ul_list">
        
        <!-- 
         <li>
                <h1 style="height: 1rem"><input type="checkbox" style="-webkit-appearance: checkbox;margin-top: 0.2rem;margin-left: 0.4rem;" ></h1>
                <p>测试节目1</p>
                <h2>大小：20M &nbsp;&nbsp; 时长：30S</h2>
                <h2>时间：2018-10-30 12:00:00</h2>
        </li>
         -->
       
    </ul>
    <!-- 加载更多 -->
    <div class="jzgd_k">
        <!-- <a href="javascript:getClientList();">加载更多</a> -->
        <button style="height: 100%;width: 100%;" onclick="getClientList(1)"> 加载更多</button>
    </div>
</div>
  <!-- 底部-->
 
  <input type="hidden"  id="page" value="0" name="page"> <!-- 当前页数 -->
  
  <input type="hidden"  id="pagetype"  name="pagetype" value="7"> <!-- 显示行数 -->
  
  <input type="hidden"  id="totalpage"  name="totalpage" > <!-- zongye -->
    
  <input type="hidden"  id="itemIds"  name="itemIds" value="<ww:property value='itemIds'/>"  /> <!--节目ID/发布的id -->
  
  

  </body>
  
</html>