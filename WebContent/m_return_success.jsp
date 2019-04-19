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

  </head>
  
  
  <body>
  
    <!-- 头部 -->
    
    <div class="toub_beij toub_beij_zhuy">
		    <div class="fanhui_jt">
		    
		           <ww:if test="sendType==1">
		               <a href="m_dish_list.jsp"><i class="fanh_jiant"><!-- <img src="images/fanh_jiant_hei.png"> --></i><span>返回</span></a>
		           </ww:if>
		           <ww:else>
		               <a href="m_item_list.jsp"><i class="fanh_jiant"><!-- <img src="images/fanh_jiant_hei.png"> --></i><span>返回</span></a>
		           </ww:else>
		            
		    
		    
		    </div>
		    <div class="mingc_tb">多媒体信息发布</div>
		    <div class="sy_zaix"></div>
    </div> 
   <script type="text/javascript">
        //滑动头部透明（针对首页头部用）
	    window.onscroll=function(){
	
	    var autoheight=document.body.scrollTop||document.documentElement.scrollTop;
	    if(autoheight>20){
	        $(".toub_beij").css("position" ,"fixed");
	        }else{
	            $(".toub_beij").css("position" ,"relative");
	        }
	    }


	  
	    
	   
   </script> 
   <!-- 内容 -->  

   <div class="dengl_nr_k">
    <div class="dengl_logo" style="padding-bottom: 0.1rem;">
       
       <img src="image/system_settings/icon_nav_msg.png" style="width: 1.6rem">
          
        
    </div>
    <div class="dengl_biaod_k" style="text-align: center;">
       
        <div class="" id="xuanz">
         
             <h1>   
                <ww:if test="returnType==1">
                                                   
                                                     发布成功
                
                </ww:if>
                <ww:elseif test="returnType==2">
                    
                                                     发布的节目文本丢失,无法发布
                
                </ww:elseif>
                                           
             </h1>
            
        </div>
        <div class="wanjimm">
           
        </div>
    </div>
   </div>

  </body>
  
</html>