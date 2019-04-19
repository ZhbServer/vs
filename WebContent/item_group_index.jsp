<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
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
width:100%;
height:95%;
margin:0px;
padding:0px;
border:0px;

font-family:Microsoft YaHei;
}
/*background-color:#134AFF;*/
/*overflow:hidden*/

a{color: #0885B8;text-decoration:none;}




</style>
<script type="text/javascript">
  

    /*新增节目分组*/
    function additemg(){
        var itemgname=document.getElementById("itemgname").value;
        if(itemgname.length<=0){
        	 layer.msg("<ww:property value='#session.local.a00100'/>"); 
        }else{
           document.form1.target = "_self";
  		   document.form1.action = "additemgroup.vs"; 
  		   document.form1.submit();

        }
 
    }

    /*修改节目名*/
    function edititemg(uscgid,scgid,scgname){

           
           document.getElementById(scgid).innerHTML="<input type='text'  name='uscgname'  value='"+scgname+"' />&nbsp;<a href='javascript:saveitemg(&quot;"+uscgid+"&quot);'><ww:property value='#session.local.a00027'/></a>&nbsp;<a href='javascript:unedititemg(&quot;"+scgid+"&quot;,&quot;"+scgname+"&quot;)'><ww:property value='#session.local.a00670'/></a>";
            

    } 

    /*取消修改*/
    function unedititemg(scgid,scgname){
        
    	 document.getElementById(scgid).innerHTML=scgname;

    }

   /*确定保存素材分组名*/
   function saveitemg(uscgid){
	    var obj_uscgname=document.getElementsByName("uscgname");
        if(obj_uscgname.length==1){
           
        	if(obj_uscgname[0].value.length<=0){
        		 layer.msg("<ww:property value='#session.local.a00100'/>"); 
            }else{
            	 document.form1.action="upgroupitemname.vs?itemgid="+uscgid;  
    		     document.form1.submit();
            }
        }else{
        	 layer.msg("<ww:property value='#session.local.a00101'/>"); 
        }    
   }
</script>
</head>
<body>
 <form  name="form1" method="post" >
<div class="title bottom">
		<div class="t_container">
			<div class="loc">
			        &nbsp;&nbsp;<ww:property value='#session.local.a00065' /> :
			        <span class="function"><ww:property value='#session.local.a00246' /></span>
			        <span class="material_bg"><ww:property value='#session.local.a00388' /></span>
			</div>
			
		</div>
</div>

<div class="c_middle download_manager">
 
	<div>
		<div class="c_right_header" style="height: 48px;margin-left: 30px;">
		
			
		   <div class="row">
			     <div class="col-xs-1">
			        
			         <input  name="itemgname" id="itemgname"  class="form-control input-sm" type="text" placeholder="<ww:property value='#session.local.a00095' />" style="width: 110px;" />
			     </div>
			     <div class="col-xs-2" style="margin-left: 25px;">
				     <button class="btn btn-sm btn-primary" onclick="additemg()" type="button"><ww:property value='#session.local.a00021' /></button>
				 </div> 
				 <div class="col-xs-3" style="margin-left: -100px;" >
				     <button class="btn btn-sm btn-danger" onclick="del_sel('delgroupitem.vs')" type="button"><ww:property value='#session.local.a00025' /></button>
				 </div> 
			</div>
			
				
			
			
			
		</div>
        <!--显示内容-->
        <div style="height: 400px;width: 1040px;margin-top: -20px;" >
              <!-- 固定标题 -->
              <div style="padding-right:17px;margin-left: 30px;">
                    <table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
                        <tr class="cell_element cell_first">
						    <td style="width: 20%;text-align: center;"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
							<td style="width: 40%;"><ww:property value='#session.local.a00095' /></td>
							<td style="width: 30%;"><ww:property value='#session.local.a00096' /></td>
							<td style="width: 10%;"><ww:property value='#session.local.a00016' /></td>
						 </tr>
                    </table>
              </div>
              <div style="height: 400px;margin-top:-5px;margin-left: 30px;">
			   <table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
				    <ww:iterator value="itemgs">
						<tr class="cell_element cell_show">
						  <td style="width: 20%;text-align: center;">
						     <input type="checkbox"  id="qx" class="qx" name="qx" value="<ww:property value='id' />"/>
						     
						  </td>
						  <td style="width: 40%;" title="<ww:property value='name'  />">
						     <div id="dscg<ww:property value='id' />">
						         <ww:property value='namesub'  />
						     </div>
						   
						  </td>
						  <td style="width: 30%;"><ww:property value="uname"  /></td>
						  <td style="width: 10%;">
						     <a href="javascript:edititemg('<ww:property value='id' />','dscg<ww:property value='id' />','<ww:property value='name'  />');"><ww:property value='#session.local.a00017' /></a>
						     
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
				<li><a href="javascript:pageto(<ww:property value='qian' />,'toitemg.vs');" class="pg_f"></a></li>
	            <!--页码显示上-->
				<ww:iterator id="q"  value="ps.qs">
	                  <li><a href="javascript:pageto(<ww:property value='#q'/>,'toitemg.vs');" ><ww:property value="#q"  /></a> </li>
	            </ww:iterator>
	            
	            <!--当前页码-->
	            <li><a href="javascript:pageto(<ww:property value='#request.id'  />,'toitemg.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
	            
	             <!--页码显示下-->
	            <ww:iterator id="h"  value="ps.hs">
	                  <li><a href="javascript:pageto(<ww:property value='#h'/>,'toitemg.vs')"><ww:property value="#h"  /></a></li>
	            </ww:iterator>
	            
                <!--下一页-->
	            <li><a href="javascript:pageto(<ww:property value='hou' />,'toitemg.vs');" class="pg_e"></a></li>
			</ul>
		    <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo('toitemg.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
		    
			<div class="pg_count">
			     
			     <span><ww:property value='#session.local.a00799'/>  <ww:property value='total'/> <ww:property value='#session.local.b00100'/>  / <ww:property value='#session.local.a00079' /></span>
			     <a href="javascript:setpagetype(10,'toitemg.vs');" <ww:if test='#session.publicPagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
			     <a href="javascript:setpagetype(20,'toitemg.vs');" <ww:if test='#session.publicPagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
			     <a href="javascript:setpagetype(30,'toitemg.vs');" <ww:if test='#session.publicPagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a>
			     <a href="javascript:setpagetype(-1,'toitemg.vs');" <ww:if test='#session.publicPagetype==-1'>style="background-color:#FFA534;"</ww:if> ><ww:property value='#session.local.a00815' /></a>
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