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

<style>
body,html{
margin:0px;
padding:0px;
border:0px;
}
a:visited {color:#959595;}
a:link {color:#959595;};
/*background-color:#134AFF;*/
/*overflow:hidden*/



</style>
<script type="text/javascript">


/*修改节目*/
function edit_item(uid,iid){
   if(uid!="<ww:property value='#session.urid' />"){
	    layer.msg("<ww:property value='#session.local.a00393' />");
        return;
   }
   window.parent.location.href="editinteractitem.vs?itemid="+iid;	
	
}



/*发布节目*/
function open_send_to_client(){

	
    //选择终端
    var ids=document.getElementsByName('qx'); 
    var objarray=ids.length;
    
    var chestr="";
 
    var count=0;
    for (i=0;i<objarray;i++)
    {
 	
      if(ids[i].checked == true)
      {
    	 count++;    	
      }
    }
    if(count!=1){
        layer.msg("<ww:property value='#session.local.a00289'/>");
        return;
    }
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
	        offset: '0px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: 'toclientitem.vs?itemsids='+itemsids+"&fbtype=2",
	        scrollbar: false,
	        end: function(){ 
	    	 
			         
			}
	 });

	
}


/*新增计划*/
function open_add_jh(type,jhid){
	 window.returnValue="";
	 layer.open({
			type: 2,
	        area: ['620px', '300px'],
	        offset: '50px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: 'item_jh_to_add.jsp',
	        scrollbar: false,
	        end: function(){ 
	    	 
			   if(window.returnValue==undefined||window.returnValue==""){
				   window.returnValue=""; 
                  
			   }else{
				    var rv= window.returnValue;
				    document.getElementById("jhName").value=rv;
                    if(type==1){
                    	document.form1.action="adjh.vs";
                        document.form1.submit();
                    }else if(type==2){
                    	document.getElementById("cjhid").value=jhid;
                    	document.form1.action="copyjh.vs";
                        document.form1.submit();

                    }  
                       	
 
			   }               
			}
		});
	
}


//删除计划
function del_jhs(){
	//选择终端
    var ids=document.getElementsByName('qx'); 
	var count=0;
	var itemsids="";
	for(var i=0;i<ids.length;i++) 
    { 
      if(ids[i].checked==true) 
      { 
       
         count++;
      } 
    } 
    if(count==0) 
    {     
          layer.msg("<ww:property value='#session.local.a00018' />"); 
          return ; 
    }
    layer.confirm("<ww:property value='#session.local.a00092' />?", {icon: 3, title:"<ww:property value='#session.local.a00093' />",btn: ["<ww:property value='#session.local.a00080' />", "<ww:property value='#session.local.a00014' />"]}, function(index,layero){
	    document.form1.action="deljh.vs";
	    document.form1.submit();  
    });
    
}
//编辑
function jhiteminfo(jhid){
  
    window.location.href="jhtimeiteminfo.vs?jhid="+jhid;   
	
}
//发布计划
function open_send_jh(itemc,jhid,ocheck){

	if(ocheck==2||ocheck==3){

		   layer.msg("<ww:property value='#session.local.b00301' />"); 
		   return;
    }

	
    if(itemc==0){
        layer.msg("<ww:property value='#session.local.a00654' />");  
    	return;
    }
    layer.open({
		type: 2,
        area: ['1150px', '615px'],
        offset: '10px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content:'tosendjh.vs?jhid='+jhid+"&jhtype=1",
        scrollbar: false,
        end: function(){ 
    	   
		}
 });

}

//导出计划
function open_dao_time_jh(jhid){

	  layer.open({
			type: 2,
			area: ['660px', '520px'],
	        offset: '10px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: 'daotimejh.vs?id='+jhid,
	        scrollbar: false,
	        end: function(){ 
			    	
			 }
	  });
}

//查看
function jhsee(jhid){
  
    window.location.href="jhtimesee.vs?jhid="+jhid;   
	
}


</script>
</head>
<body>

<form  name="form1" method="post" >
<input type="hidden" name="jhName" id="jhName"/>
<input type="hidden" name="cjhid" id="cjhid"/>
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			       <ww:property value='#session.local.a00065' /> :<span class="function"><ww:property value='#session.local.a00645' /></span><span class="material_bg"><ww:property value='#session.local.a00647' /></span>
			</div>
		</div>
 </div>

<div class="c_middle download_manager">
    
    <!--分组-->

	
  
		<div>
	    <div class="c_right_header" >
		     <!-- <div class="xlk">
		        <select id="sel" name="sel" style="font-size: 15px; ">
		             
		             <option  <ww:if test="sel==0"> selected="selected" </ww:if>   value="0"><ww:property value='#session.local.a00066' /></option>
					 <option  <ww:if test="sel==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.a00255' /></option>					 
				 </select>  
			 </div> 
			<div class="search white" >
				<input name="ser"  type="text" class="sea_text" value="<ww:property value='ser' />"/>
				<input type="button" class="sea_button" onclick="selsc('toiteminteractlist.vs')"/>
			</div>
			-->
		     <div class="row">
		         <div class="btn-group" style="float: right;margin-right:120px;">
<!--		         	  <button onclick="change_jh(3)"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00646' /></button> 普通计划 -->

                       <select onchange="change_jh(this.value)"  class="form-control"  style="width: 100px;height: 30px;font-size: 12px;float: left;">
                          
                          <option selected="selected" value="1"><ww:property value='#session.local.a00647' /></option>
                          
                          <option value="2"><ww:property value='#session.local.a00648' /></option>
                          
                          <ww:if test="#session.version_onoff.dpJhOnOff==1">
                            <option value="4"><ww:property value='#session.local.b00310' /></option>
                          </ww:if>
                          
                          <option value="3"><ww:property value='#session.local.b00158' /></option>
                         
                         
                       </select>  
<!--		              <button onclick="change_jh(1)"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00647' /></button> 轮播计划 -->
<!--		              <button onclick="change_jh(2)"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00648' /></button> 插播计划 &nbsp;-->
			              <button onclick="open_add_jh(1,0)" type="button" class="btn btn-sm btn-success" style="margin-left: 10px;margin-top: 2px;"><ww:property value='#session.local.a00021' /></button><!-- 新增-->
			              <button onclick="del_jhs()"  type="button" class="btn btn-sm btn-danger" style="margin-top: 2px;"><ww:property value='#session.local.a00025' /></button><!-- 删除 -->			      
			     </div>	
		      
		      </div>
		    
		</div>
        <!--显示内容-->
         <div style="height: 400px;" >
           <!-- 固定标题 -->
            <div style="padding-right:17px;margin: 0px;">
               <table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;width: 900px;">
					<tr class="cell_element cell_first">
					<td width="10%" align="center">&nbsp;&nbsp;<input type="checkbox" id="terminal_all" onclick="cli_sc('qx')" id="qx"   class="check_box"/></td>
					<td width="30%"><ww:property value='#session.local.a00649' /></td>
					<td width="20%"><ww:property value='#session.local.a00656' /></td>
					<td width="10%"><ww:property value='#session.local.a00217' /></td>
					<td width="30%"><ww:property value='#session.local.a00016' /></td>
					</tr>
				</table>
            </div>
             <div style="height: 400px;overflow: auto;overflow-y:scroll;">
               <table border="0" cellpadding="0" cellspacing="0" style="margin-top:0px;margin-bottom: 0px;width: 900px;">
	                <ww:iterator value="jhs">
					<tr class="cell_element cell_show">
					  <td width="10%" align="center">
					       <input oncheckvalue="<ww:property value='ocheck' />"  type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
					   </td>
					  <td width="30%">
					  
					  <span onclick="jhsee(<ww:property value='id' />)" style="cursor: pointer;" ><ww:property value="name"/></span>
					  
					  </td>
					  <td width="20%"><ww:property value="jhitemc"/></td>
					  
					  <td width="10%">
					      <ww:if test="ocheck==1">
					             <ww:property value="#session.local.a00256"/>
					      </ww:if>
					      <ww:elseif test="ocheck==2">
					         <span style="color: red;">
					             <ww:property value="#session.local.a00257"/>
					         </span> 
					      </ww:elseif>
					      <ww:elseif test="ocheck==3">
					         <span style="color: red;">
					             <ww:property value="#session.local.a00592"/>
					         </span> 
					      </ww:elseif>
					      
					  </td>
					  
					  <td width="30%">
<!--					     <a href="toeditjhitemlist.vs?jhid=<ww:property value='id' />"><ww:property value="#session.local.a00024"  /></a>-->
<!--                             <span onclick="javascript:open_send_jh(<ww:property value="jhitemc"/>,<ww:property value='id' />);" style="cursor: pointer;"><ww:property value="#session.local.a00421"  /></span>-->
                             
                             <span title="<ww:property value='#session.local.a00421' />" onclick="open_send_jh(<ww:property value="jhitemc"/>,<ww:property value='id' />,<ww:property value='ocheck' />)" style="cursor: pointer;margin-right: 5px;">
	                                <i class="icon icon-sitemap"></i>
	                         </span>
                              |
                              <!--  修改 --> 
							  	  
	                             <span title="<ww:property value='#session.local.a00017' />" onclick="jhiteminfo(<ww:property value='id' />)" style="cursor: pointer;margin-right: 5px;">
	                                  <i class="icon icon-edit"></i>
	                             </span>   
                             |
                             
                             
                             <!--  复制  -->
	                             <span title="<ww:property value='#session.local.a00022' />" onclick="open_add_jh(2,<ww:property value='id' />)" style="cursor: pointer;margin-right: 5px;">
	                                <i class="icon icon-copy"></i>
	                             </span>
<!--                             <span onclick="javascript:open_add_jh(2,<ww:property value='id' />);" style="cursor: pointer;"><ww:property value="#session.local.a00022"  /></span>-->
                             |
                              <!--  导出计划  -->
	                             <span title="<ww:property value='#session.local.b00209' />" onclick="open_dao_time_jh(<ww:property value='id' />)" style="cursor: pointer;margin-right: 5px;">
	                                <i class="icon icon-share-alt"></i>
	                             </span>
                            
					  </td>
					</tr>
				    </ww:iterator>
			    </table>
            </div>
		</div>
     
        <!--分页-->
		<div class="nav" style="width: 900px;margin-left:70px;">
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'jhlist.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'jhlist.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'jhlist.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'jhlist.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'jhlist.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('jhlist.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'jhlist.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
			     <a href="javascript:setpagetype(20,'jhlist.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'jhlist.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'jhlist.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			</div>
			
			<!--隐藏域 -->
            
            <!--当前页码-->
			<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
            <!--总页码-->
            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
            <!--每页显示页数-->
            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
            <!--计划类型-->
            <input type="hidden" name="jhtype"  id="jhtype" value="<ww:property value='jhtype'/>" />
        
		</div>
	</div>
</div>
</form>
</body>
</html>
