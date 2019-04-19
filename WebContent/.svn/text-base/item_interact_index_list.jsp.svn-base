<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base target="_self" />
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" href="css/index.css"/>
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />

<script type="text/javascript" src="zTree/3.52/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="zTree/3.52/jquery.ztree.excheck-3.5.js"></script>
<link rel="stylesheet" href="zTree/3.52/zTreeStyle.css" />

<style>
body,html{
margin:0px;
padding:0px;
border:0px;
}
/*background-color:#134AFF;*/
/*overflow:hidden*/
</style>
<script type="text/javascript">

var b00028="<ww:property value='#session.local.b00028'  />";

/*修改节目*/
function edit_item(uid,iid){
   //if(uid!="<ww:property value='#session.urid' />"){
   //	    layer.msg("<ww:property value='#session.local.a00393' />");
   //     return;
   //}
   window.parent.location.href="editinteractitem.vs?itemid="+iid;	
}



/*发布节目*/
function open_send_to_client(){

    //选择终端
    var ids=document.getElementsByName('qx'); 
    var objarray=ids.length;
    var chestr="";
    var count=0;
    //for (i=0;i<objarray;i++)
    //{
 	//  if(ids[i].checked == true)
     // {
    //	 count++;    	
    //  }
    //}
    //if(count!=1){
    //    layer.msg("<ww:property value='#session.local.a00289'/>");
    //    return;
    //}
	var isSel=false; 
	var itemsids="";
	for(var i=0;i<ids.length;i++) 
    { 
      if(ids[i].checked==true) 
      { 
    	 var iocheck=ids[i].getAttribute("oncheckvalue");
         if(iocheck==0||iocheck==2){
             layer.msg("<ww:property value='#session.local.a00593' />"); 
             return; 
         }  
         if(itemsids.length==0){
        	 itemsids=ids[i].value;
         }else{
        	 itemsids=itemsids+"_"+ids[i].value;
         } 
      } 
    } 
    if(itemsids.length==0) 
    {     
          layer.msg("<ww:property value='#session.local.a00415' />"); 
          return ; 
    }
    layer.open({
			type: 2,
	        area: ['1150px', '615px'],
	        offset: '20px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: 'toclientitem.vs?itemsids='+itemsids+"&fbtype=2",
	        scrollbar: false,
	        end: function(){ 
	    	 
			         
			}
	 });

	
}

//复制节目
function copy_interact_item(uid,iid){
	if(uid!="<ww:property value='#session.urid' />"){
	    layer.msg("<ww:property value='#session.local.a00393' />");
        return;
    }
	 window.returnValue="";
	 layer.open({
			type: 2,
	        area: ['600px', '300px'],
	        offset: '20px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: 'item_copy_index.jsp',
	        scrollbar: false,
	        end: function(){ 
	    	   if(window.returnValue==undefined||window.returnValue==""){
				   window.returnValue=""; 
                    
			   }else{
				   var rv= window.returnValue;
				   document.getElementById("copyItemName").value=rv;
				   document.getElementById("copyItemId").value=iid;
				   document.form1.target = "_self";
				   document.form1.action="copyinteractitem.vs";
                   document.form1.submit();
			   }               
			}
		});
}

//导出节目
function  daoItem(){
	 var ids=document.getElementsByName('qx'); 
     var count=0; 
     var iid=0;
     for(var i=0;i<ids.length;i++) 
     { 
	      if(ids[i].checked==true) 
	      {   
		      iid=ids[i].value;
	    	  count++; 
	      } 
     } 
     if(count==0) 
     { 
    	  layer.msg("<ww:property value='#session.local.a00018' />"); 
          return; 
     }
     if(count>1){
    	 layer.msg("<ww:property value='#session.local.a00289' />"); 
         return; 
     }
     
     //document.form1.target = "_blank";
     //document.form1.action="daointeractitem.vs?iid="+iid;
     //document.form1.submit();
     layer.open({
			type: 2,
			area: ['660px', '520px'],
	        offset: '10px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: "daointeractitem.vs?iid="+iid,
	        scrollbar: false,
	        end: function(){ 
			    	
			 }
	  }); 

}
//导入节目
function daoitemin(){
   layer.open({
		type: 2,
        area: ['620px', '500px'],
        offset: '20px',
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: "upinteract_item.jsp",
        scrollbar: false,
        end: function(){ 
    	    /*刷新页面*/
    	   document.getElementById("id").value=1;
		   document.form1.target = "_self";
		   document.form1.action = "toiteminteractlist.vs"; 
		   document.form1.submit();       
		}
	});           
}

function init_self(){


	var isMax = <%=request.getParameter("isMax")%>;
	if(isMax == 1){
		layer.msg("<ww:property value='#session.local.a01034' />");
		isMax = 0;
	}

	
	document.form1.target = "_self";

	var openIntro = <%=request.getParameter("openIntro")%>;

	if(openIntro == '1'){
		var intro = introJs();  
		intro.setOptions({
		prevLabel:"<ww:property value='#session.local.a00861' />", 
        nextLabel:"<ww:property value='#session.local.a00862' />",
        skipLabel:"<ww:property value='#session.local.a00863' />",
        doneLabel:"<ww:property value='#session.local.a00863' />",
		showStepNumbers: false,
		showBullets: false,
		exitOnOverlayClick: false,
		overlayOpacity: 0.6,  
		steps: [  	
	        {
			    element: '#step0',
			    intro: "<ww:property value='#session.local.a00930' />"
			}, 
			{  
				element: '#step1',  
				intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00021' /></span><ww:property value='#session.local.a00887' />"
			}
		  ]  
		});  

		document.getElementById("step1").onclick = function (){
			intro.exit();
			toaddinteractitem();
			document.getElementById("step1").onclick = function (){
				openaddinteractitem();
			};
		};
		intro.start().oncomplete(function() {  
			intro.exit();  
			document.getElementById("step1").onclick = function (){
				openaddinteractitem();
			};
	    });


		intro.onexit(function() {
			layer.msg("<ww:property value='#session.local.a00864' />");
		});
	}
}

/*制作互动节目*/
function toaddinteractitem(){
	 window.returnValue="";
	 
	 var count=3000; 
	 	var originalArray=new Array;//原数组 
	 	//给原数组originalArray赋值 
	 	for (var i=0;i<count;i++){ 
	 	originalArray[i]=i+1; 
	 	} 
	 	originalArray.sort(function(){ return 0.5 - Math.random(); }); 
	 	
	 	
	 layer.open({
			type: 2,
	        area: ['620px', '400px'],
	        offset: '20px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: 'itemtoadd.vs?openIntro=1',
	        scrollbar: false,
	        end: function(){ 
	    	 
			   if(window.returnValue==undefined||window.returnValue==""){
				   window.returnValue=""; 
                  
			   }else{
				   var rv= window.returnValue;
				   var rv1=rv.split('@')[0];
				   var rv2=rv.split('@')[1];

				   var showurl="";
                   if("<ww:property value='#session.version_onoff.addItemButton' />"==1){
					   
					   showurl="toInteractNewScene.vs?interactitem.name="+rv1+"&interactitem.fblid="+rv2+"&token="+originalArray[0]+"&openIntro=1";
					   
				   }else{

					   showurl="tointeractscene.vs?interactitem.name="+rv1+"&interactitem.fblid="+rv2+"&token="+originalArray[0]+"&openIntro=1";
					   
				   }


				


				   showurl=encodeURI(showurl); 
		           showurl=encodeURI(showurl);
				   //以下是调用上面的函数
			       var mb = myBrowser();
			      
			       if ("Chrome" == mb) {
				    	window.parent.location.href=showurl;
				   }else{
				    	window.open(showurl,"_parent");
				   }  
			   }               
			}
		});
	
}


//节目详情
function item_info(id){
	 layer.open({
		type: 2,
		area: ['1100px', '600px'],
        offset: '20px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: "seeinteractiteminfo.vs?itemId="+id,
        scrollbar: false,
        end: function(){ 
    	   
		}
	 }); 
}

/*共享素材*/
//function add_interact_item_share(url){
function add_interact_item_share(url,id){	
//	 var val = "";
//	 var qx=document.getElementsByName('qx'); 
//    var isSel=false; 
//     for(var i=0;i<qx.length;i++) 
//     { 
//      if(qx[i].checked==true) 
//      { 
//    	  val += qx[i].value+",";
//    	  isSel=true; 
//      } 
//     } 
//     if(isSel==false) 
//     { 
//    	 layer.msg("<ww:property value='#session.local.a00018' />"); 
//          return ; 
//    }

//     $.ajax({
// 		type:'post',
// 		url:'delinteractitemajax.vs',
// 		data:"qx="+val,
// 		dataType:'json',
// 		async:true,
// 		cache:true,
// 		success:function(data){
//    	 	if(data == "1"){
//    	 		layer.msg("<ww:property value='#session.local.a00829'/>");
//    	 		return; 
//    	 	}else{
    	 		layer.open({
			  		type: 2,
			          area: ['1100px', '590px'],
			          offset: '10px',
			          title:false,
			          fix: false, //不固定
			          shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
			          content: url+"?itemid="+id,
//			          content: url+"?itemid="+val,
			          scrollbar: false,
			          end: function(){ 
			  		  }
			  	 }); 
//    	 	}
// 		}
// 	});
}

/*删除节目*/
function del_interact_item(url){

	 var val = "";
	 var ids=document.getElementsByName('qx'); 
     var isSel=false; 
     for(var i=0;i<ids.length;i++) 
     { 
      if(ids[i].checked==true) 
      { 
    	  val += ids[i].value+",";
      	  isSel=true; 

      	  if(ids[i].getAttribute("isgx")==1){

     		  layer.alert("<ww:property value='#session.local.a00830'  />");
     		  
     		  return;
          }
      	  
      } 
     } 
     if(isSel==false) 
     { 
    	 layer.msg("<ww:property value='#session.local.a00018' />"); 
         return ; 
     }

     $.ajax({
		type:'post',
		url:'delinteractitemajax.vs',
		data:"qx="+val,
		dataType:'json',
		async:true,
		cache:true,
		success:function(data){
	       //if(data == "1"){
	       //	   layer.msg("<ww:property value='#session.local.b00238' />");
	       //   return; 
		   //}else{
			   layer.confirm("<ww:property value='#session.local.a00092' />?", {icon:3, title:"<ww:property value='#session.local.a00093' />",btn: ["<ww:property value='#session.local.a00080' />", "<ww:property value='#session.local.a00014' />"]}, function(index,layero){
				   document.form1.action=url;
				   document.form1.submit();
			   });
		   //}
		}
	});
     
}

/*显示子级用户信息*/
function showsonlist(uid){
	var pagetype=document.getElementById("pagetype").value;
 	var url="toiteminteractlistajax.vs?igr.itemgroupid="+uid+"&id=1&pagetype="+pagetype;
	getPart(url, 'showsonlist');
}


//导入互动节目
function daoItemInteractIn(){
	 //daoitemin
	 var gpid=document.getElementById("gpid").value;
	 layer.open({
		type: 2,
		title:"<ww:property value='#session.local.a00659' />",
		area: ['800px', '450px'],
        offset: '20px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: "todaoitemin.vs?igid="+gpid+"&daoUrl=daoInteractItemIn.vs",
        scrollbar: false,
        end: function(){ 
			   /*刷新页面*/
	    	   document.getElementById("id").value=1;
			   document.form1.target = "_self";
			   document.form1.action = "toiteminteractlist.vs"; 
			   document.form1.submit();
			         
		}
	});           
}



</script>
</head>
<body onload="init_self()">

 <form  name="form1" method="post" >
 
 <input type="hidden"  id="copyItemName" name="copyItemName"/>
 <input type="hidden"  id="copyItemId" name="copyItemId"/>

 <div class="title bottom">
		<div class="t_container">
			<div class="loc">
			       <ww:property value='#session.local.a00065' /> :<span class="function"><ww:property value='#session.local.a00008' /></span><span class="material_bg"><ww:property value='#session.local.a00434' /></span>
			</div>
		</div>
 </div>

<div class="c_middle">
    
    <!--分组-->
	<div class="c_left">
	  	<div align="left" >
	  		<ul id="leftTree" class="ztree"> </ul>
		</div>
		<div id="rMenu">
			<ul style="margin:5px;padding:0px;">
				<li style="cursor:pointer;" id="g_add"><ww:property value='#session.local.a00990' /></li>
				<li style="cursor:pointer;" id="g_rename"><ww:property value='#session.local.a00991' /></li>
				<li style="cursor:pointer;" id="g_del"><ww:property value='#session.local.a00992' /></li>
			</ul>
		</div>
		<!-- mask -->
		<em class="mtbox mxt2"></em>
		<em class="mtbox mxb2"></em>
	</div>
	
    <!--节目菜单-->
	<div class="c_right">
	<div id="showsonlist">
			<div class="c_right_header" >
			    <div class="row">
				     <div class="col-xs-1">
				    
			            <select  id="sel" name="sel"  class="form-control input-sm" style="width: 90px;" >
			               <option  <ww:if test="sel==0"> selected="selected" </ww:if>   value="0"><ww:property value='#session.local.a00066' /></option>
						   <option  <ww:if test="sel==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.a00255' /></option>					 
					    </select>  
		             
				  </div>
				  <div class="col-xs-2" style="margin-left: 25px;">
				      <input  name="ser" id="ser" class="form-control input-sm" type="text" style="width: 130px;" value="<ww:property value='ser' />"/>
				  </div> 
				  <div class="col-xs-3" style="margin-left: -28px;width:50px;" >
				     	<button  onclick="selsc('toiteminteractlist.vs')" class="btn btn-sm btn-primary" type="button" style="padding: 4px 8px;"><i class="icon icon-search"></i></button>
				  </div> 
				
				   <div class="btn-group" style="float: right;margin-right: 30px;">
				   	  <!--<button onclick="add_interact_item_share('addinteractitemshare.vs')"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00816' /></button>--><!-- 设置共享 -->
					 
					  <button onclick="open_result_last()"  type="button" class="btn btn-sm btn-primary"  ><ww:property value='#session.local.a00420' /></button><!-- 执行结果 -->
					 
					  <ww:if test="isSelf != 0">
						  <button onclick="daoItem()"      type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00658' /></button><!-- 导出 -->
						  <button onclick="daoItemInteractIn()"      type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00659' /></button><!-- 导入-->
				          <button onclick="del_interact_item('delinteractitem.vs')"  type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button><!-- 删除 -->			      
			       	  </ww:if>
			       </div>	
			       
			       <div style="float: right;margin-right: 5px;">
			          
			          
			          <button onclick="open_send_to_client()"  type="button" class="btn btn-sm btn-success"><ww:property value='#session.local.a00394' /></button><!-- 发布节目 -->
			          
			          <ww:if test="isSelf != 0">
				      	 
					   	   <ww:if test="#session.version_onoff.addItemButton==1">
					      	 <button onclick="openAddNewInteractItem()"  type="button" class="btn btn-sm btn-success" id="step1"><ww:property value='#session.local.a00021' /></button><!-- 新增2 -->
					   	  </ww:if>
					   	  <ww:else>
					   	     <button onclick="openaddinteractitem()"  type="button" class="btn btn-sm btn-success" id="step1"><ww:property value='#session.local.a00021' /></button><!-- 新增 -->
					   	  </ww:else>
				   	  
				   	  </ww:if>
				   
				   	  
			       </div>
			 	</div>
			</div>
	        <!--显示内容-->
	         <div style="height: 400px;" >
	           <!-- 固定标题 -->
	           <div style="padding-right:17px;margin: 0px;">
	            
	               <table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
						<tr class="cell_element cell_first">
						<td width="10%" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
						<td width="20%"><ww:property value='#session.local.a00255' /></td>
						<td width="10%"><ww:property value='#session.local.a00258' /></td>
						<td width="20%"><ww:property value='#session.local.a00776' /></td>
						<!-- <td width="20%"><ww:property value='#session.local.a00248' /></td> -->
						<td width="10%"><ww:property value='#session.local.a00247' /></td>
						<td width="10%"><ww:property value='#session.local.a00217' /></td>
						<td width="10%"><ww:property value='#session.local.a00016' /></td>
						</tr>
					</table>
	            </div>
	            
	            <div style="height: 400px;overflow: auto;overflow-y:scroll;">
	               <table border="0" cellpadding="0" cellspacing="0" style="margin-top:0px;margin-bottom: 0px;">
		                <ww:iterator value="items">
						<tr class="cell_element cell_show">
						  <td width="10%" align="center">
						  	<input   isgx="<ww:property value='isgx' />"  oncheckvalue="<ww:property value='ocheck' />" type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
						  </td>
						  <td width="20%" style="line-height: 25px;" >
						      <a  style="width: 100%;display: block;overflow: auto;color: #343F51;" target="_blank"  href="files/<ww:property value='filename'/>/see.html">
						         <span <ww:if test="itemState==2"> style="color: #FFA534 " </ww:if> >
						            <ww:property value="name"/>
						          </span>  
						      
						      </a>
						      
						  </td>
						  <td width="10%" style="line-height: 35px;" >
						      <span <ww:if test="itemState==2"> style="color: #FFA534 " </ww:if> >
						         <ww:property value="size"/>M
						      </span>
						   </td>
						  <td width="20%" style="line-height: 35px;" >
						      <span <ww:if test="itemState==2"> style="color: #FFA534 " </ww:if> >
						           <ww:property value="allsize"/>M
						      </span>
						      
						  </td>
						  <!-- <td width="20%"><ww:property value="sdate"/></td> -->
						  <td width="10%" style="line-height: 35px;">
						     <span <ww:if test="itemState==2"> style="color: #FFA534 " </ww:if> >
						       <ww:property value="user"/>
						      </span> 
						   </td>
						  <td width="10%" style="line-height: 35px;">
						      <span <ww:if test="itemState==2"> style="color: #FFA534 " </ww:if> >
								     <ww:if test="ocheck==0">
								           <ww:property  value="#session.local.a00257" /> 
								     </ww:if>
								     <ww:elseif test="ocheck==1">
								          <ww:property  value="#session.local.a00256" />
								     </ww:elseif>
								     <ww:else>
								          <ww:property  value="#session.local.a00592" />
								     </ww:else>
							    </span>
							</td>
						   <td style="width:10%;line-height: 35px;<ww:if test='itemState==2'> color: #FFA534; </ww:if>"   >
						        
						  	    <span title="<ww:property value='#session.local.a00752' />" onclick="item_info(<ww:property value='id'/>)" style="cursor: pointer;margin-right: 5px;">
						  	        <i class="icon icon-list-alt"></i>
						  	    </span>
						  	    
						  	    <span title="<ww:property value='#session.local.a00017' />" onclick="edit_item(<ww:property value='userid'/>,<ww:property value='id'/>)" style="cursor: pointer;margin-right: 5px;">
						  	          <i class="icon icon-edit"></i>  
						  	    </span>
						  	    
						  	     <!--  复制  -->
	                             <span title="<ww:property value='#session.local.a00022' />" onclick="copy_interact_item(<ww:property value='userid'/>,<ww:property value='id'/>)" style="cursor: pointer;margin-right: 5px;">
	                                <i class="icon icon-copy"></i>
	                             </span>
	                             
							  	<ww:if test="isgx == 0">
							  	  	<span title="<ww:property value='#session.local.a00816' />" onclick="add_interact_item_share('addinteractitemshare.vs',<ww:property value='id'/>)"" style="cursor: pointer;margin-right: 5px;">
							  	  	       <i class="icon icon-share"></i>
							  	  	</span>						      	     
							  	</ww:if>
							  	
						  	   	
						  </td>
						</tr>
					    </ww:iterator>
				    </table>
	            </div>
			</div>
	     	<div style="text-align: right;font-size: 12px; color: #FFA534;margin-top: 10px;">
			  <span> <ww:property value='#session.local.b00181' /> &nbsp;<ww:property value='#session.local.b00182' /> <i class="icon icon-list-alt"></i> <ww:property value='#session.local.b00183' />&nbsp;  <ww:property value='#session.local.b00184' /></span>
			  <!-- 节目名为黄色表示节目非原制作人修改  -->
			</div>
	        <!--分页-->
			<div class="nav_item">
	       
				<ul class="pg">
	                <!-- 上一页-->
					<li><a href="javascript:pageto_item(<ww:property value='qian' />,'toiteminteractlistajax.vs');" class="pg_f"></a></li>
		            <!--页码显示上-->
					<ww:iterator id="q"  value="ps.qs">
		                  <li><a href="javascript:pageto_item(<ww:property value='#q'/>,'toiteminteractlistajax.vs');" ><ww:property value="#q"  /></a> </li>
		            </ww:iterator>
		            
		            <!--当前页码-->
		            <li><a href="javascript:pageto_item(<ww:property value='#request.id'  />,'toiteminteractlistajax.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
		            
		             <!--页码显示下-->
		            <ww:iterator id="h"  value="ps.hs">
		                  <li><a href="javascript:pageto_item(<ww:property value='#h'/>,'toiteminteractlistajax.vs')"><ww:property value="#h"  /></a></li>
		            </ww:iterator>
		            
	                <!--下一页-->
		            <li><a href="javascript:pageto_item(<ww:property value='hou' />,'toiteminteractlistajax.vs');" class="pg_e"></a></li>
				</ul>
			    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('toiteminteractlistajax.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
			    
				<div class="pg_count">
				     
				     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
				     <a href="javascript:setpagetype_item(10,'toiteminteractlistajax.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
				     <a href="javascript:setpagetype_item(20,'toiteminteractlistajax.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
				     <a href="javascript:setpagetype_item(30,'toiteminteractlistajax.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
				     <a href="javascript:setpagetype_item(-1,'toiteminteractlistajax.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
				</div>
				
				<!--隐藏域 -->
	            
	            <!--当前页码-->
				<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
	            <!--总页码-->
	            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
	            <!--每页显示页数-->
	            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
	            <!--分组-->
	            <input type="hidden" name="igr.itemgroupid"  id="gpid" value="<ww:property value='igr.itemgroupid'/>"/>
	            <!--树id-->
				<input type="hidden" name="treeid"  id="treeid" value=""/>
        	</div>
		</div>
	</div>
</div>
</form>

<script>
var groupArray = new Array();
//检查某个分组是否加载下一级数据
function checkLoad(cgid){
  for(var i=0;i<groupArray.length;i++)
     {
           if (cgid == groupArray[i]){
        	   return true;
           }
     }
  return false;
}

var setting = {
		view: {
			showIcon: true
		},
//		check: {
//			enable: true,
//			chkStyle: "radio",
//			radioType: "all"
//		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
//			onExpand: zTreeOnExpand,
			onRightClick: onRightClick,
//				onCheck: zTreeOnCheck
			onClick: function (e, treeId, treeNode, clickFlag) {
				$('#treeid').val(treeNode.id);
			}
		}
	};

//	function zTreeOnCheck(event, treeId, treeNode) {
//		$('#zpid').val(treeNode.id+","+treeNode.level);
//	}

	function onRightClick(event, treeId, treeNode) {
		$('#treeid').val(treeNode.id);
		ztreeNode = treeNode;
        showRMenu(treeNode,{x:event.clientX, y:event.clientY});
	}

//	function zTreeOnExpand(event, treeId, treeNode) {
//		loadcTree(treeNode,'ajaxitemsonztreerootaction.vs');
//	};

	//查询下级树
	function loadcTree(treeNode,url){
		if (checkLoad(treeNode.tId)){
			return;
		}
		$('#'+treeNode.tId+'_ico').removeClass("ico_open");
		$('#'+treeNode.tId+'_ico').addClass("ico_loading");
	    $.ajax({
		 	 url:url,
			 data:{
	    			cgid : treeNode.id,
					type : treeNode.level
				 },
				 type:'post',  
			     cache:false,  
			     dataType:'json',  
			     success:function(data) {
					groupArray.push(treeNode.tId);
				    var id = "";
				    var areaName = "";
				    var pId = "";
				    var click = "";
				    var isParent = "";
				    var sos = "";
				    var json = eval(data.itemlist);
				    for(var i=0; i<json.length; i++)
				    {
				    	id = json[i].id;
					    areaName = json[i].name;
					    pId = json[i].pid;
					    click = json[i].click;
					    isParent = json[i].isParent;
					    sos = json[i].sos;
				    	var newNode = {id:id,name:areaName,pId:pId,click:click,isParent:isParent,sos:sos};
						newNode = zTree.addNodes(treeNode, newNode);
				    }
				    $('#'+treeNode.tId+'_ico').removeClass("ico_loading");
					$('#'+treeNode.tId+'_ico').addClass("ico_open");
				 }
		 });
	}

	//创建ztree树  
	function  getTree(){
		$.ajax({
		 	 url:'ajaxinteractitemztreerootaction.vs',
			 type:'post',  
		     cache:false,  
		     dataType:'json',  
		     success:function(data) {
			 	var zNodes = eval(data.itemlist);
			 	$.fn.zTree.init($("#leftTree"), setting, zNodes);
				zTree = $.fn.zTree.getZTreeObj("leftTree");
				var nodes = zTree.getNodes();
				loadcTree(nodes[0],'ajaxinteractitemsonztreerootaction.vs');
			 }
		});			
	}  
		
	var zTree;
	var ztreeNode;
	var rMenu = $("#rMenu");
	$(document).ready(function(){
		getTree();
		hideRMenu();
		//鼠标点击事件不在节点上时隐藏右键菜单    
		//新增分组
		$("#g_add").on("click",function(){  
		    addTreeNode();  
		});  
		//修改组名  
		$("#g_rename").on("click",function(){  
		    updated();  
		});  
		//删除分组  
		$("#g_del").on("click",function(){  
		    removeTreeNode();  
		}); 

				
	});

	//显示右键菜单    
	function showRMenu(type,postionJson) {
		$("#rMenu").css({ //设置右键菜单的位置
            top: postionJson.y + "px",
            left: postionJson.x + 2 + "px",
            visibility: "visible",
            position: "fixed",
            border: "1px solid",
            backgroundColor: "#f3f3f3"
        });

		if(type.tId == "leftTree_2" || type.tId == "leftTree_3"){
			hideRMenu();
		}else if(type.tId == "leftTree_1") {
			$("#g_add").show();
			$("#g_rename").hide();  
	        $("#g_del").hide();
		}else if(type.sos == "1") {
			hideRMenu();
		}else{
			$("#g_add").hide();  
	        $("#g_rename").show();  
	        $("#g_del").show();
		}
		
	    $("body").bind("mousedown", onBodyMouseDown);  
	} 
	function hideRMenu() {  
	    if (rMenu) rMenu.css({"visibility": "hidden"});  
	    $("body").unbind("mousedown", onBodyMouseDown);  
	}  
	function onBodyMouseDown(event){  
	    if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {  
	        rMenu.css({"visibility" : "hidden"});  
	    }  
	}  


	function addTreeNode(){
		 var tid;
		 if ($('#treeid').val() == '') {
			    layer.msg("<ww:property value='#session.local.a00451' />!");
				return;
		 }else{
			 tid = $('#treeid').val();
			 layer.open({
			 		type: 2,
			         area: ['500px', '200px'],
			         offset: '50px',
			         title:false,
			         fix: false, //不固定
			         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
			         content: 'item_interact_group_add.jsp?tid='+tid,
			         scrollbar: false,
			         end: function(){ 
					     if(window.returnValue==undefined||window.returnValue==""){
						       window.returnValue=""; 
					     }else{
					    	 window.returnValue="";
					    	 zTree.removeChildNodes(ztreeNode);
					    	 groupArray = new Array();
						     loadcTree(ztreeNode,'ajaxinteractitemsonztreerootaction.vs');
					     }     
			 		}
			 	});
		 }
		 hideRMenu();
	}

	function updated(){
		 var tid;
		 if ($('#treeid').val() == '') {
			    layer.msg("<ww:property value='#session.local.a00451' />!");
				return;
		 }else{
			 if($('#treeid').val() == '0'){
				layer.msg("<ww:property value='#session.local.a00986' />!");
				return;
			 }else{
				tid = $('#treeid').val();
				layer.open({
			 		type: 2,
			         area: ['500px', '200px'],
			         offset: '50px',
			         title:false,
			         fix: false, //不固定
			         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
			         content: 'toeditiitg.vs?itemgid='+tid,
			         scrollbar: false,
			         end: function(){ 
					   if(window.returnValue==undefined||window.returnValue==""){
						    window.returnValue=""; 
					   }else{
						    ztreeNode.name = window.returnValue;
						   	zTree.updateNode(ztreeNode);
						   	window.returnValue=""; 
					   }
					}     
			 	});
			 }
	     }
		 hideRMenu();
	}
		
	//删除节点  
	function removeTreeNode() {  
		var tid;
		 if ($('#treeid').val() == '') {
			    layer.msg("<ww:property value='#session.local.a00451' />!");
				return;
		 }else{
			 tid = $('#treeid').val();
		 }
		 if(tid=="0"){
		   layer.msg("<ww:property value='#session.local.b00052' />!");
	       return;
	     };
		
		layer.confirm("<ww:property value='#session.local.a00994' />,<ww:property value='#session.local.a00092' />?", {icon: 3, title:"<ww:property value='#session.local.a00093' />",btn: ["<ww:property value='#session.local.a00080' />", "<ww:property value='#session.local.a00014' />"]}, function(index,layero){
			$.ajax({
			 	 url:'deliitgtree.vs?tid='+tid,
				 type:'post',  
			     cache:false,  
			     dataType:'json',  
			     success:function(data) {
				 	zTree.removeNode(ztreeNode);
				 	showsonlist(0);
				 }
			});
			layer.closeAll('dialog');
	    });
		hideRMenu();
	}
</script>

</body>
</html>
