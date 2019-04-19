$(function(){
		$(".admin_sys").mouseover(function(){
		   $(".adm.two_menu").show();
		   $(".adm.two_menu").mouseup(function(){
				$(this).hide();
			})			
		})
		$(".adm.two_menu").mouseover(function(){
			  $(this).show();
		})	.mouseout(function(){
			  $(this).hide();
			})		
})