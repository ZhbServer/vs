//function windowHeight() {
//    var de = document.documentElement;
//    return self.innerHeight||(de && de.clientHeight)||document.body.clientHeight;
//}
//window.onload=window.onresize=function(){
//	var wh=windowHeight();
//	var MainH = (wh-document.getElementById("head").offsetHeight-10);
//	if ( document.getElementById("main") ) {
//		if (MainH<542){
//			document.getElementById("main").style.height= 542+"px";
//			document.body.style.height = document.getElementById("bg5").style.height =619+"px";
//		}else{
//			document.getElementById("main").style.height = MainH+"px";
//		}
//	}
//	if ( document.getElementById("leftcenter") ) {
//		if (MainH-68<474){
//			document.getElementById("leftcenter").style.height = 474+"px";
//		}else{
//			document.getElementById("leftcenter").style.height = (MainH-68)+"px";
//		}
//		
//	}
//	if ( document.getElementById("mainCenter") ) {
//		if (MainH-52<490){
//			document.getElementById("mainCenter").style.height = 490+"px";
//		}else{
//			document.getElementById("mainCenter").style.height = (MainH-52)+"px";
//		}
//		
//	}
//	if ( document.getElementById("mianHi") ) {
//		if (MainH-94<450){
//			document.getElementById("mianHi").style.height = 450+"px";
//		}else{
//			document.getElementById("mianHi").style.height = (MainH-94)+"px";
//		}
//	}
//}

$(function() {
	if ( document.getElementById("iha") ) {
		$("#iha").on("click", ".ithemBlock", function() {
			$(this).toggleClass("cur");
		})
	}

	if ( $("div.sel_wrapper").length > 0 ) {
		$(document).on("click", "em.sle_r", function(){
			var thisNext = $(this).next(".searchList");
			thisNext.css({width: $(this).outerWidth(true)-2 })
			if  ( thisNext.is(":visible") ) {
				thisNext.toggle();
			} else {
				$("ul.searchList").hide(0);
				thisNext.toggle();
			};
			thisNext.find("li").click(function() {
				var valu = $(this).html();
				var value = $(this).attr("val");
				$(this).parent().prev().find(".sle_l").html(valu);
				$(this).parent().hide(0);
			})
		});
		
		
	};
	if ( $("ul.fenzulist").length > 0 ) {
		$("ul.fenzulist").niceScroll({
		cursorcolor:"#186ab0",
		cursorwidth:"3px",
		cursorborder:"1px solid #1c5696"
		});	
	}


	if ( $("#sidtree").length > 0 ) {
		$("#sidtree").niceScroll({
		cursorcolor:"#186ab0",
		cursorwidth:"3px",
		cursorborder:"1px solid #1c5696"
		});	
	}
	
	$("#sidtree").on("click", "a.treeLink", function() {
		var speed = 10; //可选展开速度："'fast'", "'slow'" , 或者 数值 1-9999 
		var $_this = $(this);
		var thisnext = $(this).next("div.nextlevel");
		if (thisnext.length > 0 ) {
			if ( thisnext.is(":visible") ) {
				$_this.removeClass("cur");
				thisnext.slideUp(speed);
				thisnext.find("a.treeLink").removeClass("cur");
				thisnext.find("div.nextlevel").hide(0);
			} else {
				$_this.addClass("cur");
				thisnext.slideDown(speed);
				$("#sidtree").getNiceScroll().resize();
			};
		} else {
			//如果下一个为空的function
		}
	});
	
	$(".molist li").click(function() {
		$(this).toggleClass("cur")
	})
	
	$(document).on("click", ".ctr_1", function() {
		var thisp = $(this).parent();
		thisp.prev(".mol").find(".cur").appendTo( thisp.next('.mor') );
		thisp.next('.mor').find(".cur").addClass("added");
		thisp.next('.mor').find("li").removeClass("cur");
	}).on("click", ".ctr_2", function() {
		var thisp = $(this).parent();
		thisp.next('.mor').find(".added").appendTo( thisp.prev('.mol') );
		thisp.prev('.mol').find("li").removeClass("added cur");
	}).on("click", ".ctr_3", function() {
		var thisp = $(this).parent();
		thisp.next('.mor').find(".cur:last").after(  thisp.next('.mor').find(".cur:first").prev() )
	}).on("click", ".ctr_4", function() {
		var thisp = $(this).parent();
		thisp.next('.mor').find(".cur:first").before(  thisp.next('.mor').find(".cur:last").next() )
	}).on("click", "a.dialogclose", function() {
		$(this).parent().parent().parent().hide(0);
	});
	
});

var showdia = 0;
function dialogOpen(site) {
	var $this = $(site);
	var name = $this.attr("name");
	var width = $this.attr("width");
	var datahtml = $this.html();
	
	name = name ||"消息";
	width = width || "auto";
	datahtml = datahtml || "暂无内容";
	var $daj = $("#dialogJump");
	var oaName = "dialogJump" + "_" +  $this.attr("id") ;
	if ( $("#" + oaName).length > 0 ) { 
		$("#" + oaName).show(0);
	} else {
		$("#dialogJump").clone().attr("id", "dialogJump" + "_" +  $this.attr("id") ).appendTo("body")
		var $dajnew = $($("#" + oaName));
		$dajnew.css({width:width,  marginLeft: -width/2,  marginTop: -$("#dialogJump").height()/2  })
		$dajnew.fadeIn(120);
		$dajnew.find("span.titlesy_2").html(name);
		$dajnew.find(".diacenIn").html("");
		$this.children("div").clone(true).appendTo( "#" + oaName + " .diacenIn" );
	};
	//if ( $("div.dialogWrapper:visible").length > 1 ) {
		//var thiseq = $("div.dialogWrapper:visible").length;
		
		//$("div.dialogWrapper:visible").
		//$("div.dialogWrapper").eq(thiseq-1).animate({marginLeft:"0px"})
		//$("div.dialogWrapper").eq(thiseq-0).animate({marginLeft:"-=250px"})
	//};
}

















