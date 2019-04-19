<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=320, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0"> 
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
		    <div class="fanhui_jt"><a href="javascript:history.back(-1);"><i class="fanh_jiant"><!-- <img src="images/fanh_jiant_hei.png"> --></i><span>返回</span></a></div>
		    <div class="mingc_tb">多媒体信息发布</div>
		    <div class="sy_zaix"><a href="javascript:save_dish();"><i style="color:#fff;">保存</i></a></div>
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

	    var dishArray=new Array();

        //新增创建
	    function create_dish_li(){

	    	  var dish=new Object();

	    	 //获取菜名
              var dishName=$("#dishName").val();
              if(dishName.length==""){
                    alert("请输入菜名");
                    return
              }
              //获取菜价
              var dishPrice=$("#dishPrice").val();
              if(dishPrice.length==""){
                  alert("请输入菜价");
                  return
              }

              //存入集合
              //dishName=dishName+" "+dishName;
              dish.dishName=dishName;
              dish.dishPrice=dishPrice;
	    	 
              if( $("#dishId").val()==""){

                  dish.dishId=dishArray.length;
                  dishArray[dishArray.length]=dish;

                  //创建li
                  var dishLi=$("<li> <div class='haoma'><p>菜名："+dishName+"</p><h1><em>￥:"+dishPrice+"</h1></div><div class='huank'> <a href='javascript:to_edit_dish_li("+dish.dishId+");'>修改</a>&nbsp;<a href='javascript:del_dish_li("+dish.dishId+");'>删除</a><span></span></div></li>");
                  $("#dishUl").append(dishLi);

              }else{


            	  $("#dishUl li").remove();
            	  for(var i=0;i<dishArray.length;i++){

	   	               if(dishArray[i].dishId==$("#dishId").val()){
		   	               
	   	            	   dish.dishId=dishArray[i].dishId;
	   	       			   dishArray[i]=dish;
	
	   		           }
	   	               //创建li
	                   var dishLi=$("<li> <div class='haoma'><p>菜名："+dishArray[i].dishName+"</p><h1><em>￥:"+dishArray[i].dishPrice+"</h1></div><div class='huank'> <a href='javascript:to_edit_dish_li("+dishArray[i].dishId+");'>修改</a>&nbsp;<a href='javascript:del_dish_li("+dishArray[i].dishId+");'>删除</a><span></span></div></li>");
	                   $("#dishUl").append(dishLi);
   		          }
              }
		      

	    	
              //清空
              $("#dishId").val("");
              $("#dishName").val("");
              $("#dishPrice").val("");

		}

		

		//编辑修改
		function to_edit_dish_li(dishId){

			
			
			for(var i=0;i<dishArray.length;i++){

	               if(dishArray[i].dishId==dishId){

	            	   $("#dishId").val(dishId);

	            	   $("#dishName").val(dishArray[i].dishName);

	       			   $("#dishPrice").val(dishArray[i].dishPrice);

		           }

		    }
	    }    
		//删除
		function del_dish_li(dishId){

			var dishArrayC=new Array();
			$("#dishUl li").remove();
			for(var i=0;i<dishArray.length;i++){

	               if(dishArray[i].dishId==dishId){

	       			    //dishArray.splice(i,1);

		           }else{

		        	   //创建li
	                   var dishLi=$("<li> <div class='haoma'><p>菜名："+dishArray[i].dishName+"</p><h1><em>￥:"+dishArray[i].dishPrice+"</h1></div><div class='huank'> <a href='javascript:to_edit_dish_li("+dishArray[i].dishId+");'>修改</a>&nbsp;<a href='javascript:del_dish_li("+dishArray[i].dishId+");'>删除</a><span></span></div></li>");

	                   $("#dishUl").append(dishLi);

	                   dishArrayC[dishArrayC.length]=dishArray[i];
   		              
			       }
		    }

			dishArray=dishArrayC;
		    
	    }

	    //保存菜品信息
	    function  save_dish(){

	    	var dishTitle=$("#dishTitle").val();

	    	if(dishTitle.length==0){
	    		alert("标题不能为空");
	    		return;
		    }

	    	//获取菜价信息 json转换成字符串
	    	if(dishArray.length==0){
                alert("未添加菜价信息");
	    		return;
		    }
	    	
           var dishArrayStr=JSON.stringify(dishArray);

         
           $("#dishArrayStr").val(dishArrayStr);   

       	   document.form1.action="addDishMobile.vs";
           document.form1.submit();
        
		   

		}    
		

   </script> 
   <form name="form1" method="post" enctype="multipart/form-data">
  <div class="yinghka_k">
    <ul>
        <li>
            <p>标题</p>
            <input type="text" autocomplete="off"   id="dishTitle"  name="dishTitle"   placeholder="" value="" >
        </li>
       
    </ul>
</div>
<div class="hui_k hui_k_2"></div>


<!-- 内容 -->  
<div class="yinghka_k">
    <ul>
        <li>
            <p>菜名</p>
            <input type="text"  id="dishName" name="dishName" placeholder="" value="" >
        </li>
        <li>
            <p>价格</p>
            <input type="text"  id="dishPrice"  name="dishPrice" placeholder="" >
            
            <input type="hidden"  id="dishId"  name="dishId" placeholder="" >
        </li>
    </ul>
</div>
<div class="hui_k hui_k_2"></div>
<button type="button" class="anq_tuic anq_tuic_yingh" onclick="create_dish_li()">新增</button>



<div class="huitiao_2"></div>

<div class="pipei_dt_k">
    <p>菜价列表</p>
    <h2></h2>
</div>
<div class="fenq_mx">
    <ul id="dishUl">
      
       
    </ul>
</div>
<div style="height: 2rem;"></div>
<input type="hidden"  name="dishArrayStr"  id="dishArrayStr"  />
</form>

</body>
 </html>