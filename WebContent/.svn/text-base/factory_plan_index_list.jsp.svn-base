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

/*新增计划*/
function open_add_fp(){
	 window.returnValue="";
	 layer.open({
			type: 2,
	        area: ['620px', '300px'],
	        offset: '50px',
	        title:false,
	        fix: false, //不固定
	        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
	        content: 'factory_plan_to_add.jsp',
	        scrollbar: false,
	        end: function(){ 
	    	 
			   if(window.returnValue==undefined||window.returnValue==""){
				   window.returnValue=""; 
                  
			   }else{
				    var rv= window.returnValue;
				    document.getElementById("fpName").value=rv;
                   	document.form1.action="addfp.vs";
                    document.form1.submit();
			   }               
			}
		});
	
}


//删除计划
function del_fps(){
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
    	document.form1.action="delfp.vs";
        document.form1.submit(); 
    });
    
}

//查看信息
function fpiteminfo(fid){
    window.location.href="fpiteminfo.vs?fid="+fid;   
}

//发布计划
function send_fp(itemc,fid){
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
        content:'tosendfp.vs?fid='+fid,
        scrollbar: false,
        end: function(){ 
    	   
		}
 	});
}

//修改计划
function edit_fp(){
	
}

</script>
</head>
<body>

<form  name="form1" method="post" >
<input type="hidden" name="fpName" id="fpName"/>
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			       <ww:property value='#session.local.a00065' /> :<span class="function"><ww:property value='#session.local.a00645' /></span><span class="material_bg"><ww:property value='#session.local.a01042' /></span>
			</div>
		</div>
</div>

<div class="c_middle download_manager">
    
    <!--节目菜单-->
		<div>
	    <div class="c_right_header" style="height: 48px;">
		
		    <div class="row">
		         <div class="btn-group" style="float: right;margin-right: 50px;">
					  <button onclick="open_add_fp()" type="button" class="btn btn-sm btn-success" style="margin-left: 10px;"><ww:property value='#session.local.a00021' /></button><!-- 新增-->
			          <button onclick="del_fps()"  type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button><!-- 删除 -->			      
			       </div>	
		      
		    </div>
		</div>
        <!--显示内容-->
         <div style="height: 400px;width: 1050px;margin-top: -20px;" >
           <!-- 固定标题 -->
           <div style="padding-right:17px;margin-left: 30px;">
               <table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
					<tr class="cell_element cell_first">
					<td width="10%" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')" id="qx"   class="check_box"/></td>
					<td width="40%"><ww:property value='#session.local.a00649' /></td>
					<td width="20%"><ww:property value='#session.local.a00399' /></td>
					<td width="30%"><ww:property value='#session.local.a00016' /></td>
					</tr>
				</table>
            </div>
            <div style="height: 400px;margin-top:-5px;margin-left: 30px;">
               <table border="0" cellpadding="0" cellspacing="0" style="margin-top:0px;margin-bottom: 0px;">
	                <ww:iterator value="fps">
					<tr class="cell_element cell_show">
					  <td width="10%" align="center">
					       <input oncheckvalue="<ww:property value='ocheck' />"  type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
					       
					   </td>
					  <td width="40%"><span style="cursor: pointer;" onclick="fpiteminfo(<ww:property value='id' />)"><ww:property value="name"/></span></td>
					  <td width="20%"><ww:property value="itemC"/></td>
					  <td width="30%">
                          <span onclick="javascript:send_fp(<ww:property value="itemC"/>,<ww:property value='id' />);" style="cursor: pointer;"><ww:property value="#session.local.a00421"  /></span>
					  </td>
					</tr>
				    </ww:iterator>
			    </table>
            </div>
		</div>
     
        <!--分页-->
		<div class="nav" style="width: 1000px;margin-left:20px;">
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'fplist.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'fplist.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'fplist.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'fplist.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'fplist.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('fplist.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'fplist.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if> >10</a>
			     <a href="javascript:setpagetype(20,'fplist.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'fplist.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'fplist.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
			</div>
			
			<!--隐藏域 -->
            
            <!--当前页码-->
			<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
            <!--总页码-->
            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
            <!--每页显示页数-->
            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='#session.publicPagetype'/>" />
        
		</div>
	</div>
</div>
</form>
</body>
</html>
