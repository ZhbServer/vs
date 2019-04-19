/*全选（素材）列表*/
function  cli_sc(Obj){
  var collid = document.getElementById("terminal_all");
  var coll = document.getElementsByName(Obj);
  if (collid.checked){
     for(var i = 0; i < coll.length; i++)
       coll[i].checked = true;
  }else{
     for(var i = 0; i < coll.length; i++)
       coll[i].checked = false;
  }
}
/*全选（素材）视图*/
$(function(){
 $("#selectAll").click(function(){
	      
	        var a=document.getElementById("con").getElementsByTagName('li'),i;
			var qxs=document.getElementsByName("qx");
			if(document.getElementById("all").checked){
				document.getElementById("all").checked=false;
				for(i=0;i<qxs.length;i++){
					qxs[i].checked=false;
				}
				
				for(i=0;i<a.length;i++){
					a[i].style.background = "url(image/ithemsbg.png) left top no-repeat";												
			    }
			
				
			}else{
				document.getElementById("all").checked=true;
				
				for(i=0;i<qxs.length;i++){
					qxs[i].checked=true;
				}
				
				for(i=0;i<a.length;i++){
					a[i].style.background = "url(image/ithemsbg.png) left bottom no-repeat";												
			    }
			}

			
			 });
});
/*删除素材*/
function del_sel(url){
	
	 var ids=document.getElementsByName('qx'); 
     var isSel=false; 
     for(var i=0;i<ids.length;i++) 
     { 
      if(ids[i].checked==true) 
      { 
      isSel=true; 
       break; 
      } 
     } 
     if(isSel==false) 
     { 
    	  
    	 layer.msg("請選擇項"); 
          return ; 
     }
     
    layer.confirm("確定要刪除嗎?", {icon: 3, title:"提示"}, function(index){
		   
		
	     //document.form1.action="delscbj.vs";
	     document.form1.action=url;
	     document.form1.submit();
		 //layer.close(index);
  });
}



/*分页 aurl:跳转地址 */
function gogo(aurl) {
    //跳转输入页码 
   	 var goid=document.getElementById("goid").value;
    //总页码
   	 var totalpage=document.getElementById("totalpage").value;
   	 if(parseInt(goid)>parseInt(totalpage)){
   	     layer.msg("輸入頁碼有誤"); 
   	     return;
   	  }
   	
   	 document.getElementById("id").value=document.getElementById("goid").value;
	 document.form1.target = "_self";
	 document.form1.action =aurl; 
	 document.form1.submit();
}
/*跳转指定页面 value:跳转值,aurl:跳转地址*/
function pageto(value,aurl) {
    var totalpage=document.getElementById("totalpage").value;
    
    if(parseInt(value)>parseInt(totalpage)){
    	 layer.msg("輸入頁碼有誤");
         return;
	}
	document.getElementById("id").value=value;
	document.form1.target = "_self";
	document.form1.action = aurl; 
	document.form1.submit();
}

/*无刷新终端选择分组*/
function showcg1list(cgid,vurl,vtype){
	
	//格式化搜索框
	document.getElementById("ser").value="";
	
	
	var select = document.getElementById("sel");  
	var nextYear = '搜索條件';  
	for(var i=0; i<select.options.length; i++){  
	    if(select.options[i].innerHTML == nextYear){  
	        select.options[i].selected = true;  
	        break;  
	    }  
	}
	
	
	var selecto = document.getElementById("orderv");  
	var nextYearo = '默認排序';  
	for(var i=0; i<selecto.options.length; i++){  
	    if(selecto.options[i].innerHTML == nextYearo){  
	        selecto.options[i].selected = true;  
	        break;  
	    }  
	}
	
	
	
	
	//document.getElementById("ser").value="";
	document.getElementById("cgid").value=cgid;
	document.getElementById("type").value=vtype;
	var pagetype=document.getElementById("pagetype").value;
	var url=vurl+"?cgid="+cgid+"&type="+vtype+"&pagetype="+pagetype;
	
	getPart(url, 'showsonlist');
}


/*无刷新终端翻页*/
function pageto_client(value,vurl){
	    
	    var total=document.getElementById("totalpage").value;
	    var pagetype=document.getElementById("pagetype").value;
	    
    	var id=value;
	   	var sel=document.getElementById("sel").value;
	  	var ser=document.getElementById("ser").value;
	  	var orderv=document.getElementById("orderv").value;
  	    var cgid=document.getElementById("cgid").value;
  	    var type=document.getElementById("type").value;
  	    
	    var url=vurl+"?cgid="+cgid+"&type="+type+"&sel="+sel+"&ser="+ser+"&id="+id+"&pagetype="+pagetype+"&orderv="+orderv;;
	    
    	getPart(url, 'showsonlist'); 
} 

/*无刷新终端跳转*/
function gogo_client(vurl) {
	 var id=document.getElementById("goid").value;
	 var total=document.getElementById("totalpage").value;
	 var sel=document.getElementById("sel").value;
  	 var ser=document.getElementById("ser").value;
  	 var orderv=document.getElementById("orderv").value;
	 var cgid=document.getElementById("cgid").value;
	 var type=document.getElementById("type").value;
	 var url=vurl+"?cgid="+cgid+"&type="+type+"&sel="+sel+"&ser="+ser+"&id="+id+"&pagetype="+pagetype+"&orderv="+orderv;
 	 getPart(url, 'showsonlist'); 		
}

/*无刷新选择终端类型*/
function setpagetype_client(value,vurl){
	 var pagetype=document.getElementById("pagetype").value=value;
	 var sel=document.getElementById("sel").value;
  	 var ser=document.getElementById("ser").value;
  	 var orderv=document.getElementById("orderv").value;
	 var cgid=document.getElementById("cgid").value;
	 var type=document.getElementById("type").value;
	 var url=vurl+"?cgid="+cgid+"&type="+type+"&sel="+sel+"&ser="+ser+"&id=1&pagetype="+pagetype+"&orderv="+orderv;
	 getPart(url, 'showsonlist'); 		 
}


/*无刷新搜索*/
function select_ser_client(vurl){
	var selv=$('#sel option:selected').val();//选中的值
	  if(selv==0){
		  layer.msg(b00028);
		  return;
	  }
	 var pagetype=document.getElementById("pagetype").value;
	 var id=1;
	 var sel=document.getElementById("sel").value;
  	 var ser=document.getElementById("ser").value;
  	 var orderv=document.getElementById("orderv").value;
  	 var cgid=document.getElementById("cgid").value;
  	 var type=document.getElementById("type").value;
  	
  	 var url=vurl+"?cgid="+cgid+"&type="+type+"&sel="+sel+"&ser="+ser+"&id="+id+"&pagetype="+pagetype+"&orderv="+orderv;
  	 getPart(url, 'showsonlist');
}
/*共享素材*/
function add_share(url,type){
	
	 var val = "";
	 var qx=document.getElementsByName('qx'); 
     var isSel=false; 
     for(var i=0;i<qx.length;i++) 
     { 
      if(qx[i].checked==true) 
      { 
    	  val += qx[i].value+",";
    	  isSel=true; 
      } 
     } 
     if(isSel==false) 
     { 
    	 layer.msg("請選擇項"); 
          return ; 
     }
     
     $.ajax({
 		type:'post',
 		url:'addshareajax.vs',
 		data:"qx="+val,
 		dataType:'json',
 		async:true,
 		cache:true,
 		success:function(data){
 	       if(data == "1"){
 	    	   layer.msg("不能共享其他用戶的素材");
 	    	   return; 
 		   }else{
 			  layer.open({
 			  		type: 2,
 			          area: ['1100px', '590px'],
 			          offset: '10px',
 			          title:false,
 			          fix: false, //不固定
 			          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
 			          content: url+"?scid="+val+"&type="+type,
 			          scrollbar: false,
 			          end: function(){ 
 			  		}
 			  	}); 
 		   }
 		}
 	});
}


/*删除素材*/
function del_sucai(url){
	var val = "";
	var ids=document.getElementsByName('qx'); 
    var isSel=false; 
    for(var i=0;i<ids.length;i++) 
    { 
     if(ids[i].checked==true) 
     { 
   	  val += ids[i].value+",";
     	  isSel=true; 
     } 
    } 
    if(isSel==false) 
    { 
   	 layer.msg("請選擇項"); 
        return ; 
    }

    $.ajax({
		type:'post',
		url:'delscajax.vs',
		data:"qx="+val,
		dataType:'json',
		async:true,
		cache:true,
		success:function(data){
	       //if(data == "1"){
	    	//   layer.msg("包含共享的素材不能執行刪除操作");
	    	 //  return; 
		   //}else{
			  
			   layer.confirm("確定刪除嗎?",{icon: 3, title:"提示",btn: ['確定', '返回']}, function(index,layero){
				   document.form1.action=url;
				   document.form1.submit();
			   });
			   
		   //}
		}
	});
}

/*无刷新终端翻页*/
function pageto_item(value,vurl){
	    
	    var total=document.getElementById("totalpage").value;
	    var pagetype=document.getElementById("pagetype").value;
	    
    	var id=value;
	   	var sel=document.getElementById("sel").value;
	  	var ser=document.getElementById("ser").value;
  	    var gpid=document.getElementById("gpid").value;
  	    
	    var url=vurl+"?igr.itemgroupid="+gpid+"&sel="+sel+"&ser="+ser+"&id="+id+"&pagetype="+pagetype;
	    
    	getPart(url, 'showsonlist'); 
} 

/*无刷新选择节目类型*/
function setpagetype_item(value,vurl){
	 var pagetype=document.getElementById("pagetype").value=value;
	 var sel=document.getElementById("sel").value;
  	 var ser=document.getElementById("ser").value;
	 var gpid=document.getElementById("gpid").value;
	 var url=vurl+"?igr.itemgroupid="+gpid+"&sel="+sel+"&ser="+ser+"&id=1&pagetype="+pagetype;
	 getPart(url, 'showsonlist'); 		 
}

/*无刷新素材翻页*/
function pageto_sc(value,vurl){
	    
	    var total=document.getElementById("totalpage").value;
	    var pagetype=document.getElementById("pagetype").value;
	    
    	var id=value;
	   	var sel=document.getElementById("sel").value;
	  	var ser=document.getElementById("ser").value;
  	    var gpid=document.getElementById("gpid").value;
  	    var sctype=document.getElementById("sctype").value;
  	    var showtype=document.getElementById("showtype").value;
  	    
	    var url=vurl+"?gssi.sucaigroupid="+gpid+"&sucai.type="+sctype+"&showtype="+showtype+"&sel="+sel+"&ser="+ser+"&id="+id+"&pagetype="+pagetype;
	    
    	getPart(url, 'showsonlist'); 
} 

/*无刷新选择素材类型*/
function setpagetype_sc(value,vurl){
	 var pagetype=document.getElementById("pagetype").value=value;
	 var sel=document.getElementById("sel").value;
  	 var ser=document.getElementById("ser").value;
	 var gpid=document.getElementById("gpid").value;
	 var sctype=document.getElementById("sctype").value;
	 var showtype=document.getElementById("showtype").value;
	 
	 var url=vurl+"?gssi.sucaigroupid="+gpid+"&sucai.type="+sctype+"&showtype="+showtype+"&sel="+sel+"&ser="+ser+"&id=1&pagetype="+pagetype;
	 getPart(url, 'showsonlist'); 		 
}


/*无刷新搜索*/
function select_orderby_client(vurl){
	 
	 var pagetype=document.getElementById("pagetype").value;
	 var id=1;
	 var sel=document.getElementById("sel").value;
  	 var ser=document.getElementById("ser").value;
  	 var orderv=document.getElementById("orderv").value;
  	 var cgid=document.getElementById("cgid").value;
  	 var type=document.getElementById("type").value;
  	
  	 var url=vurl+"?cgid="+cgid+"&type="+type+"&sel="+sel+"&ser="+ser+"&id="+id+"&pagetype="+pagetype+"&orderv="+orderv;
  	 getPart(url, 'showsonlist');
}

/*显示子级用户信息*/
function showsonlist_sc(uid){
   	 var pagetype=document.getElementById("pagetype").value;
   	 var sctype=document.getElementById("sctype").value;
   	 var showtype=document.getElementById("showtype").value;
	 
   	 var url="tosclistajax.vs?gssi.sucaigroupid="+uid+"&sucai.type="+sctype+"&showtype="+showtype+"&id=1&pagetype="+pagetype;
   	 getPart(url, 'showsonlist'); 		 
}