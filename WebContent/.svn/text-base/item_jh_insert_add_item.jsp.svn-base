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
<script type="text/javascript" src="js/My97DatePicker/<ww:property value='#session.local.a00000' />_WdatePicker.js"></script>


<style>
body,html{
margin:0px;
padding:0px;
border:0px;

overflow:sroll; 
}
 
a:visited {color:#FFFFFF;};
a:link {color:#343F51;};
.dblistse{font-size: 14px;font-family: Microsoft YaHei; background-color: #77B2EE;}
.dblistse option {
	border: 1px;
}
/*background-color:#134AFF;*/
/*overflow:hidden*/
</style>
<script type="text/javascript">
 /*预览图片*/
 function selimg(iurl){
    
     document.getElementById("selimg").src="files/"+iurl;

     //赋值
     //document.getElementById("selfile").value=iurl;

 }



	
 
 //获取select值
 function getselect(){
 	    var sel=document.getElementById("dblistse");
	    var filenames="";
		var temp;
		for(var i=0;i<sel.options.length;i++)
		{
		  temp= sel.options[i].value;
		  if(i==0)
		  {
		    filenames=temp;
		  }
		  else
		  {
		    filenames+="|"+temp;
		  }
		}
		
		document.getElementById("filenames").value=filenames;

 }
 /*搜索*/
 function  selsc_select(url){
	 getselect();
	 selsc(url);
 }
 /*分组跳转*/
 function scgroupjump_select(id,url){
	 getselect();
	 scgroupjump(id,url);
 }
 /*分页*/
 function pageto_select(type,url){
	 getselect();
	 pageto(type,url);
 }
 function gogo_select(url){
	 getselect();
	 gogo(url);
 }
 
//保存
function gosubmit()  {  
	  
      var sel=document.getElementById("dblistse");  
	  if(sel.options.length<1)
	  {
	    layer.msg("<ww:property value='#session.local.a00415'/>");
		return false;
	  }
	  //下载时间 
	  var xiadate=document.getElementById("validityXdate").value.trim();
	  //开始时间
	  var sdate=document.getElementById("validitySdate").value.trim();
	  //结束时间
	  var edate=document.getElementById("validityEdate").value.trim();

      if(xiadate.length!=19)
	  {
		   alert("<ww:property value='#session.local.a00576' />");
		  return false;
	  } 
	  if(sdate.length!=19)
      {
		   alert("<ww:property value='#session.local.a00577' />");
		  return false;
	   } 
	   if(edate.length!=19)
	   {
		   alert("<ww:property value='#session.local.a00578' />");
		   return false;
	 } 
      //判断下载时间和开始播放时间
		 if(!comptime(xiadate,sdate)){
			   alert("<ww:property value='#session.local.a00579' />");
			   return false;
    	 //document.form1.action = "fbtimeitem.vs"; 
			 //document.form1.submit();
      }
		 if(!comptime(sdate,edate)){
			 alert("<ww:property value='#session.local.a00580' />");
			 return false;
      }

	       
      var filenames="";
      var itemnames="";
	  var temp;
	  for(var i=0;i<sel.options.length;i++)
	  {
		  temp= sel.options[i].value;
		  temp2=sel.options[i].text;
		  if(i==0)
		  {
			
		     filenames=temp;
		     itemnames=temp2;
		  }
		  else
		  {
		    filenames+=","+temp;
		    itemnames+=","+temp2;
		  }
	 }
		document.getElementById("filenames").value=filenames;
		document.getElementById("itemnames").value=itemnames;
	  	return true;
 }  
 function savaSubmit(){
      if(gosubmit()){
          //alert(document.getElementById("filenames").value); 
     	  document.form1.action="adjhitem.vs";
     	  document.form1.submit();
      }
      
 }
	//判断开始日期和结束日期
 
 function comptime(beginTime,endTime){
          var beginTimes=beginTime.substring(0,10).split('-');
          var endTimes=endTime.substring(0,10).split('-');
          beginTime=beginTimes[1]+'-'+beginTimes[2]+'-'+beginTimes[0]+' '+beginTime.substring(10,19);
          endTime=endTimes[1]+'-'+endTimes[2]+'-'+endTimes[0]+' '+endTime.substring(10,19);
          var a =Date.parse(endTime)-Date.parse(beginTime);
          
          if(a<=0){
              return false;
              }
          else
          {
           return true;
           }
  }
 function getdqDate(){
	   var now = new Date();
     
     var year = now.getFullYear();       //年
     var month = now.getMonth() + 1;     //月
     var day = now.getDate();            //日
    
     var hh = now.getHours();            //时
     var mm = now.getMinutes();          //分
     var ss = now.getSeconds();          //秒  
     var clock = year + "-";
    
     if(month < 10)
         clock += "0";
    
     clock += month + "-";
    
     if(day < 10)
         clock += "0";
        
     clock += day + " ";
    
     if(hh < 10)
         clock += "0";
        
     clock += hh + ":";
     if (mm < 10) clock += '0'; 

     clock += mm+":"; 

     if (ss < 10) clock += '0'; 
     clock += ss; 
	   
    document.getElementById("validityXdate").value=clock;
 }
</script>
</head>
<body onload="getdqDate()">
 <form  name="form1" method="post" >
 <input type="hidden" value="<ww:property value='jhid'/>"  name="jhid"/>
<!--上-->
<div class="part1" style="height: 420px;">
	<div class="part1_container">
	
		<div class="am_two_left" style="float: right;">
			
			<div class="div_title">
			    <!-- 添加按钮 -->
		        <input type="button" onclick="savaSubmit()" value="<ww:property value='#session.local.a00652' />" style="width:50px; height:20px; text-align:center; background-color:#FCA41F; color:#ffffff; cursor:pointer;border: 0px;margin-top: 5px;"/> 
			</div>
			
			<div class="part2_2 part2_2_3" style="float: left;margin-right: 20px; margin-top: 50px;">
			<a href="javascript:addMuti();"><ww:property value='#session.local.a00270' /></a>  <!-- 添加到已选列表 -->
			<a href="javascript:upOption();"><ww:property value='#session.local.a00268' /></a>  <!-- 上移 -->
			<a href="javascript:bottomOption();"><ww:property value='#session.local.a00269' /></a>  <!-- 下移-->
			<a href="javascript:removeOption();"><ww:property value='#session.local.a00025' /></a>  <!-- 删除 -->
		    </div>
		    <!-- 已选节目 -->
			<div>
			  <select style="width:45%; height:350px; border:1px solid #d5d5d5;overflow-y:scroll;" class="dblistse"  id="dblistse" multiple name="list2" size="14"  >  
	                    <ww:iterator value="yxitemlist" status="status">
	                       <option   <ww:if test="#status.odd">style="background-color: #F9F9F9;"</ww:if>   value="<ww:property value='id' />">
	                          <ww:property value="name" />
	                       </option>
	                    </ww:iterator>
	                     
	           </select>
			</div>
			
		
		</div>
		<div class="am_two_right">
		<div class=" div_title div_type">      
		   <!-- 
		    <select id="sel" name="sel">
		             <option  <ww:if test="sel==0"> selected="selected" </ww:if>   value="0"><ww:property value='#session.local.a00066' /></option>
					 <option  <ww:if test="sel==1"> selected="selected" </ww:if>   value="1"><ww:property value='#session.local.a00067' /></option>
					 <option  <ww:if test="sel==2"> selected="selected" </ww:if>   value="2"><ww:property value='#session.local.a00068' /></option>
		    </select>    
		    :
		    <input name="ser"  type="text" class="sea_text" value="<ww:property value='ser' />"/>
			 搜索 
		    <input type="button" onclick="selsc_select('tosceneimg.vs')" value="<ww:property value='#session.local.a00263' />" style="width:50px; height:20px; text-align:center; background-color:#FCA41F; color:#ffffff; cursor:pointer;border: 0px;"/>
		    -->
		    <!-- 上传 -->
            <!--<input type="button" value="<ww:property value='#session.local.a00063' />" style="width:50px; height:20px; text-align:center; background-color:#FCA41F; color:#ffffff; cursor:pointer;border: 0px;"/>-->
            <div>
            <!-- 有效期 -->
            <ww:property value="#session.local.a00581" />:
			 <input id="validityXdate"  type="text" name="validityXdate"  style="height: 22px;width: 160px;"  value="<ww:property  value='validityXdate'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="Wdate"  /> 
		    <ww:property value="#session.local.a00540"/>:
		    <input  id="validitySdate"   type="text" name="validitySdate"  style="height: 22px;width: 160px;"  value="<ww:property  value='validitySdate'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="Wdate"  />
		    <!-- 开始时间 -->
		    <ww:property value="#session.local.a00541"/>:
            <input  id="validityEdate"   type="text" name="validityEdate"  style="height: 22px;width: 160px;"  value="<ww:property  value='validityEdate'/>"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="Wdate"/>
            <!-- 结束时间 -->
			
		    </div>
		</div>
		 <!-- 分组 -->
		<div class="c_left am_drop" style="overflow: auto;height: 340px;">
			 <div  onclick="scgroupjump_select(0,'toadjhitem.vs')" class="subNav_sucai"  <ww:if test="gssi.sucaigroupid==0">  style="background-color:#007CCD;color: white;" </ww:if> ><ww:property value='#session.local.a00815' /></div>
			
			
			<ww:iterator value="listsfgp">
				<div <ww:if test="gssi.sucaigroupid==id">  style="background-color:#007CCD;color: white;" </ww:if>  onclick="scgroupjump_select(<ww:property value='id'  />,'toadjhitem.vs')" class="subNav_sucai">
				   <ww:property value="name"  />
				   <ww:if test="#session.urid!=userid">
                         (<ww:property value="uname" />)
                   </ww:if>
				</div>
			</ww:iterator>
			
			
		</div>
		 <!--素材列表-->
		<div class="c_right am_right"  style="height: 340px;">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr class="cell_element cell_first">
					<td align="center">
					    <input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/>
<!--					    <ww:property value='#session.local.a00016' />  -->
					</td><!-- 操作  -->
					<td width="50%"><ww:property value='#session.local.a00255' /></td><!--节目名 -->
					<td><ww:property value='#session.local.a00258' /></td><!--节目大小 -->
					<td><ww:property value='#session.local.a00247' /></td><!--制作人 -->
<!--					<td><ww:property value='#session.local.a00073' /></td>上传时间 -->
				</tr>
				
				<ww:iterator value="listis" status="groupStatus">
				    <tr class="cell_element">
					  <td align="center"><input value="<ww:property value='id' />_<ww:property value='name' />" type="checkbox" class="check_box" name="qx" id="qx_<ww:property value="#groupStatus.index" />" /></td>
					  <td>
					      <a style="width: 100%;display: block;overflow: auto;color: #343F51;" target="_blank" href="files/<ww:property value='filename'/>/see.html"><ww:property value="name"/></a>
					  </td>
					  <td><ww:property value="size"/>M</td>
					  <td><ww:property value="user"/></td>
<!--					  <td><ww:property value="sdate"/></td>-->
				   </tr>
				</ww:iterator>			
			  </table>
               <!--分页-->
                 
		      <div class="nav" style="bottom:0px;">
						<ul class="pg">
			                <!-- 上一页-->
							<li><a title=""  href="javascript:pageto_select(<ww:property value='qian' />,'toadjhitem.vs');" class="pg_f"></a></li>
				            <!--页码显示上-->
							<ww:iterator id="q"  value="ps.qs">
				                  <li><a href="javascript:pageto_select(<ww:property value='#q'/>,'toadjhitem.vs');" ><ww:property value="#q"  /></a> </li>
				            </ww:iterator>
				            
				            <!--当前页码-->
				            <li><a href="javascript:pageto_select(<ww:property value='#request.id'  />,'toadjhitem.vs');" style="background-color:#FFA534;"><ww:property value="#request.id"  /></a> </li>
				            
				             <!--页码显示下-->
				            <ww:iterator id="h"  value="ps.hs">
				                  <li><a href="javascript:pageto_select(<ww:property value='#h'/>,'toadjhitem.vs')"><ww:property value="#h"  /></a></li>
				            </ww:iterator>
				            
			                <!--下一页-->
				            <li><a title=""  href="javascript:pageto_select(<ww:property value='hou' />,'toadjhitem.vs');" class="pg_e"></a></li>
						</ul>
				        <!--<div class="jump_div"><input type="text" value="<ww:property value='id'/>"  id="goid"   class="jump_input"/>/<ww:property value="totalpage"/><input onclick="gogo_select('toadjhitem.vs')" type="button" value="<ww:property value='#session.local.a00080' />" class="jump_button"/></div>-->
				    
						<div class="pg_count">
						     
						    <!--  <span><ww:property value='#session.local.a00079' /></span>
						     <a href="javascript:setpagetype(10,'tosclist.vs');" <ww:if test='pagetype==10'>style="background-color:#FFA534;"</ww:if>  >10</a>
						     <a href="javascript:setpagetype(20,'tosclist.vs');" <ww:if test='pagetype==20'>style="background-color:#FFA534;"</ww:if> >20</a>
						     <a href="javascript:setpagetype(30,'tosclist.vs');" <ww:if test='pagetype==30'>style="background-color:#FFA534;"</ww:if> >30</a> -->
						</div>
					
					
		           	<!--隐藏域 -->
		            <!--当前页码-->
					<input type="hidden" name="id" id="id" value="<ww:property value='id'/>" />
		            <!--总页码-->
		            <input type="hidden" name="totalpage" id="totalpage" value="<ww:property value='totalpage'/>" /> 
		            <!--每页显示页数-->
		            <input type="hidden" name="pagetype"  id="pagetype" value="<ww:property value='pagetype'/>" />
		            <!--分组-->
		            <input type="hidden" name="igr.itemgroupid"  id="gpid" value="<ww:property value='igr.itemgroupid'/>"/>
		      
                    
                    <!--已选列表-->
                    <input type="hidden"  name="filenames" id="filenames" /> 
                    <input type="hidden"  name="itemnames" id="itemnames" /> 
<!--                    <input type="hidden" value="<ww:property value='mfile'/>" name="mfile" id="mfile" />-->
		   </div>
	    </div>
		</div>
	
	</div>
</div>
<!--计划类型-->
<input type="hidden" name="jhtype"  id="jhtype" value="<ww:property value='jhtype'/>" />

</form>
</body>
</html>