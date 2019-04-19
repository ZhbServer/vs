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
  
  
  <body onload="getItemList()">
  
    <!-- 头部 -->
    <div class="toub_beij toub_beij_zhuy">
		    <div class="fanhui_jt"><a href="javascript:history.back(-1);"><i class="fanh_jiant"><!-- <img src="images/fanh_jiant_hei.png"> --></i><span>返回</span></a></div>
		    <div class="mingc_tb">多媒体信息发布</div>
		    <div class="sy_zaix"><a href="javascript:sel_client();"><i style="color:#fff;">选择终端</i></a></div>
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


        //加载节目
        function getItemList(){

            
        	var urid = "<ww:property value='#session.urid'  />";

        	
        	if(urid==""){

        		window.location.href="m_login.vs";

            }

        	if(parseInt($("#page").val())==0||parseInt($("#page").val())<parseInt($("#totalpage").val())){
        		
        		$.ajax({
    				type:'post',
    				url:'ajaxToSeeItemListMobile.vs',
    				data:"page="+$("#page").val()+"&pagetype="+$("#pagetype").val(),
    				datatype:'json',
    				async:true,
    				success:function(data){	
    					

        			      //集合
        			      var li_array=new Array();
        			      
        			      for(var i=0;i<data.itemlist.length;i++){

        			    	
        			    	    var li_c=$("<li>"+
        			    	    		    "<h1 style='height: 1rem'><input name='itemIds' value='"+data.itemlist[i].id+"' type='checkbox' style='-webkit-appearance: checkbox;margin-top: 0.4rem;margin-left: 0.4rem;' ></h1>"+
        			    	                "<p>"+data.itemlist[i].name+"</p>"+
        			    	                "<h2>大小："+data.itemlist[i].size+"M &nbsp;&nbsp; 时长："+data.itemlist[i].stime+"S</h2>"+
        			    	                "<h2>时间："+data.itemlist[i].sdate+"</h2>"+
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


            }else if($("#page").val()==$("#totalpage").val()){

                alert("已到最后页");

            }
        	
    		

        }

        //选择终端
        function sel_client(){
            
        	var chk_value =[]; 

            $('input[name="itemIds"]:checked').each(function(){ 
                chk_value.push($(this).val()); 
            }); 
            if(chk_value.length==0){

            	alert("还未选择需要发布的节目");
            	 
                return;
            }else{

                //alert(chk_value);

                window.location.href="toclientListMobile.vs?itemIds="+chk_value;
            	
            }

        }
	 
	   
   </script> 
   <!-- 内容 -->  

 
<div class="luj">
    <div class="luj_nk">
        <em></em>
      
        <i></i>
        <a href="javascript:void();">节目列表</a>
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
        <!-- <a href="javascript:getItemList();">加载更多</a> -->
        <button style="height: 100%;width: 100%;" onclick="getItemList()"> 加载更多</button>
    </div>
</div>
<!-- 底部-->
 
  <input type="hidden"  id="page" value="0" name="page"> <!-- 当前页数 -->
  
  <input type="hidden"  id="pagetype"  name="pagetype" value="7"> <!-- 显示行数 -->
  
  <input type="hidden"  id="totalpage"  name="totalpage" > <!-- 总页数 -->
  
  </body>
  
</html>