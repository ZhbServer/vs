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
		    a{color:#9c9c9c;}
		    a:link{color:#9c9c9c;}
		    a:hover{color:#9c9c9c;}
		    
		     input[type=radio] {
           -ms-transform: scale(3); /* IE */
           -moz-transform: scale(3); /* FireFox */
		  -webkit-transform: scale(3); /* Safari and Chrome */
		  -o-transform: scale(3); /* Opera */
            }
      
     </style>
    
    
     
   
  </head>
  
  
  <body onload="getDishList(0)">
  
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
	            $(".toub_beij").css("position" ,"fixed");
	        }else{
	            $(".toub_beij").css("position" ,"relative");
	        }
	    }


        //加载数据
        function getDishList(v){

            
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
    				url:'ajaxToSeeDishListMobile.vs',
    				data:"page="+page+"&pagetype="+$("#pagetype").val(),
    				datatype:'json',
    				async:true,
    				success:function(data){	
    					

        			      //集合
        			      var li_array=new Array();
        			      var oncheckShow="";
        			      for(var i=0;i<data.dishlist.length;i++){

            			        //审核状态
            			        if(data.dishlist[i].oncheck==1){
            			        	oncheckShow="已审核";
                			    }else if(data.dishlist[i].oncheck==0){
                			    	oncheckShow="未审核";
                                }else if(data.dishlist[i].oncheck==2){
                			    	oncheckShow="审核未通过";
                                }

        			    	    var li_c=$("<li>"+
        			    	    		    "<h1 style='height: 1rem'><input  oncheck='"+data.dishlist[i].oncheck+"'  name='dishIds' value='"+data.dishlist[i].id+"' type='radio' style='-webkit-appearance: checkbox;margin-top: 0.4rem;margin-left: 0.4rem;' ></h1>"+
        			    	                "<p>"+data.dishlist[i].title+"</p>"+
        			    	                "<h2>审核状态："+oncheckShow+"</h2>"+
        			    	                "<h2><a href='toDishEditMobile.vs?id="+data.dishlist[i].id+"' >编辑</a>&nbsp;&nbsp;<a href='javascript:delDish("+data.dishlist[i].id+")' >删除</a></h2>"+
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
        function sel_client(){
            
        	var chk_value =[]; 

            var chk_flag=true;

            $('input[name="dishIds"]:checked').each(function(){
                if($(this).attr("oncheck")==1){
                	chk_value.push($(this).val());
                }else{
                    alert("发布的数据 未审核或审核未通过");
                    chk_flag=false;
                    return;  
                } 
                 
            }); 

            if(chk_flag){
                
            	  if(chk_value.length==0){

                  	  alert("还未选择需要发布菜价信息");
                  	 
                      return;
                      
                  }else if(chk_value.length==1){

                  	 window.location.href="toclientListMobile.vs?sendType=1&itemIds="+chk_value;
                  	 
                  }else{

                  	 alert("菜价信息只能单选");

                     return;

                  }


            }
          
           

        }


        function delDish(id){

        	var r=confirm("确定要删除吗");
        	
        	if (r==true){
        	    window.location.href="delDishMobile.vs?id="+id;
        	}else{
        	    
        	}
        	  
               
        }
        
	   
   </script> 
   <!-- 内容 -->  

 
<div class="luj">
    <div class="luj_nk">
        <em></em>
      
        <i></i>
        <a href="m_dish_list.jsp">数据列表</a>
        <a style="float: right;" href="m_dish_add.jsp">新增</a>
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
        <!-- <a href="javascript:getDishList();">加载更多</a>-->
        <button style="height: 100%;width: 100%;" onclick="getDishList(1)"> 加载更多</button>
    </div>
</div>
<!-- 底部-->
 
  <input type="hidden"  id="page" value="0" name="page"> <!-- 当前页数 -->
  
  <input type="hidden"  id="pagetype"  name="pagetype" value="7"> <!-- 显示行数 -->
  
  <input type="hidden"  id="totalpage"  name="totalpage" > 
  
  </body>
  
</html>