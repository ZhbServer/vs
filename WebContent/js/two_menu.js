$(function(){

		
		//首页主菜单 鼠标悬浮一级显示二级
		$(".header_right_2 li").hover( 
			
		   function(){
			 
			     if($(this).find('.two_menu').is(":hidden")){
				    $('.two_menu').hide();
				    $(this).find('.two_menu').show();
				    
				    var links = $(this).find('a');
				    var menus = $(this).find('input');
				    var menu_left;
				   
				    
				    if (menus.val() == '6'){
				    	menu_left = (0-(links.length-2)*45)+'px';
				    }else if (menus.val() == '7'){
				    	menu_left = (0-(links.length-2)*59)+'px';
				    }else{
				    	menu_left = (10-((links.length-2)*45))+'px';
				    }

				    $(this).find('.two_menu').attr("style","display:block;width:"+(links.length-1)*92+"px;left:"+menu_left);
			      }else{
					  $(this).find('.two_menu').hide();
		         }
		    },function(){		
		      $(this).find('.two_menu').hide();
		    }
		);
		//首页主菜单 鼠标悬浮二级改变底色
		$(".two_menu a").hover(
		    function(){
				
			},function(){
				
			}					   
							   
		);
		//制作节目隐藏功能菜单显示 
		 $(".menu_others").hover(
			     
			     function(){
			    	 
			    	 if($('.menu_dropdown').is(":hidden")){
			    		
			    		 $('.menu_dropdown').show();
				     }
			    	 
			    	 
		         },function(){
		         }
		         	 
		  );
		 $(document).click(function(){  
			        $(".menu_dropdown").hide();  
	      }); 

		
        
	
});