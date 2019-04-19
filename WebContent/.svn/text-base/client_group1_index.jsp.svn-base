<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet"  href="../css/index.css"  type="text/css" />
<link rel="stylesheet"  href="css/index.css"  type="text/css" />
<script type="text/javascript" src="../js/jq/jquery.js"></script>
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="../js/two_menu.js"></script>
<script type="text/javascript" src="js/two_menu.js"></script>
<script type="text/javascript" src="../js/fresh.js"></script>
<script type="text/javascript" src="js/fresh.js"></script>
<script type="text/javascript" src="../js/constant.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="../js/<ww:property value='#session.local.a00000' />/common.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="../zui-1.5.0-dist/dist/css/zui.min.css" />
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />


<script type="text/javascript">
  

/*弹出新增终端分组*/
function open_cg1_add(){
	layer.open({
 		type: 2,
         area: ['500px', '200px'],
         offset: '50px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: '../client_group1_add.jsp',
         scrollbar: false,
         end: function(){ 
		     if(window.returnValue==undefined||window.returnValue==""){
			       window.returnValue=""; 
           
		     }else{
				   document.form1.target = "_self";
				   document.form1.action = "seecg1list.vs"; 
				   document.form1.submit();
		     }     
 		}
 	});            
} 

/*弹出修改分组名*/
function open_cg1_edit(gid){
	layer.open({
 		type: 2,
         area: ['500px', '200px'],
         offset: '50px',
         title:false,
         fix: false, //不固定
         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
         content: 'toeditcg1.vs?gid='+gid,
         scrollbar: false,
         end: function(){ 
		   if(window.returnValue==undefined||window.returnValue==""){
			    window.returnValue=""; 
		   }else{
			   document.form1.target = "_self";
			   document.form1.action = "seecg1list.vs"; 
			   document.form1.submit();
		   }     
 		}
 	});        
} 

/*删除分组*/
function del_cg(){
	
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
    	  
    	 layer.msg("请选择项"); 
          return ; 
     }
     
	
	layer.confirm("确定要删除吗?", {icon: 3, title:"提示"}, function(index){
	     document.form1.target = "_self";
	     document.form1.action= "delcg1.vs";
	     document.form1.submit();
    });
}

/*返回终端分组页面*/
function go_clientlist(){
	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
    window.parent.layer.close(index);
}

</script>
</head>
<body>
 <form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container" >
			<div class="loc">
			        <ww:property value='#session.local.a00065' /> :
			        <span class="function"><ww:property value='#session.local.a00240' /></span>
			        <span class="material_bg"><ww:property value='#session.local.a00155' /></span>>
			        <span class="material_bg"><ww:property value='#session.local.a00235' /></span>
			</div>
		</div>
</div>

<div class="c_middle download_manager">
    

	
	<div>
	    <div class="c_right_header" style="height: 48px;" >
		
		  	<div class="material_show_left">
				<ul>
				<li><a href="seecg1list.vs"  style="background-color:#007CCD;"><ww:property value='#session.local.a00235' /></a></li>
				<li><a href="seecg2list.vs"><ww:property value='#session.local.a00236' /></a></li>
				<li><a href="seecg3list.vs"><ww:property value='#session.local.a00237' /></a></li>		
				</ul>
			</div>
		  
			
			 <div class="row">
		         <div class="btn-group" style="float: right;margin-right: 30px;">
					  <button onclick="open_cg1_add()"        type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00021' /></button><!-- 新增-->
			          <button onclick="del_cg()"  type="button" class="btn btn-sm btn-danger"><ww:property value='#session.local.a00025' /></button><!-- 删除 -->			      
					  <button onclick="go_clientlist()" type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00014' /></button><!-- 返回-->
			       </div>	
		      
		      </div>
		    
		    
		</div>
        <!--显示内容-->
        <div style="height: 400px;width: 1050px;margin-top: -20px;" >
        
            <!-- 固定标题 -->
           <div style="padding-right:17px;margin: 0px;">
             <table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
				     <tr class="cell_element cell_first">
					    <td style="width:20%" ><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/><ww:property value='#session.local.a00034' /></td>
						<td style="width:30%" ><ww:property value='#session.local.a00239' /></td>
						<td style="width:30%" ><ww:property value='#session.local.a00238' /></td>
						<td style="width:20%;text-align: left;" ><ww:property value='#session.local.a00016' /></td>
				     </tr>
			    </table>
           </div>
           <div style="height: 400px;overflow: auto;overflow-y:scroll;">
			<table border="0" cellpadding="0" cellspacing="0" style="margin-top:0px;margin-bottom: 0px;">
			<ww:iterator value="cg1s">
		
					<tr class="cell_element cell_show">
					 
						  <td style="width:20%">
						     <input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
						     <ww:property value="id" />
						  </td>
						  <td style="width:30%">
						     <ww:property value="gname"  /> 
						  </td>
						  <td style="width:30%">
						     <ww:property value="gclientc"  />
						  </td>
						  <td style="width:20%">						      
						         <!-- 修改 -->
								 <i title="<ww:property value='#session.local.a00017' />" style="padding: 4px 8px;cursor: pointer;float: left;"  class="icon icon-edit" onclick="open_cg1_edit(<ww:property value='id' />)"  ></i>						      
						  </td>						
				    </tr>
				
			</ww:iterator>
			</table>
			</div>
		</div>
        <!--分页-->
		<div class="nav" >
			<ul class="pg">
                <!-- 上一页-->
				<li><a href="javascript:pageto(<ww:property value='qian' />,'seecg1list.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'seecg1list.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'seecg1list.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'seecg1list.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'seecg1list.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('seecg1list.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'seecg1list.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
			     <a href="javascript:setpagetype(20,'seecg1list.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'seecg1list.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'seecg1list.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
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
