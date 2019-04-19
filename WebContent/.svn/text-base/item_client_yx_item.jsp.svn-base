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
  
 function savaSubmit(){
	 var sel=document.getElementById("dblistse");
	 var temp;
	 var itemids=""; 
	 for(var i=0;i<sel.options.length;i++)
	 {
		  temp= sel.options[i].value;
		  if(i==0)
		  {
			  itemids=temp;
		  }
		  else
		  {
			  itemids+="_"+temp;
		  }
	 }
	 
	 var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	 window.parent.returnValue=""; 
     window.parent.returnValue=itemids; 
     window.parent.layer.close(index);
      
 }
</script>
</head>
<body style="overflow: hidden;">
 <form  name="form1" method="post" >
<!--上-->

<!--下-->
<div class="part2">

	<div class="part2_2">
		<div class="div_title"><ww:property value='#session.local.a00267' /></div><!-- 已选列表 -->
		<div class="part2_2_container">
	
			  <select style="width:74%; height:180px; border:1px solid #d5d5d5;overflow-y:scroll;float:left;" class="dblistse"  id="dblistse" multiple name="list2" size="14"  >  
	                   
	                    <ww:iterator value="items" status="status">
	                       <option   <ww:if test="#status.odd">style="background-color:#F9F9F9;"</ww:if>   value="<ww:property value='id' />">
	                          <ww:property value="name" />
	                       </option>
	                    </ww:iterator>
	                     
	           </select>
	        
		<div class="part2_2_3">
		    
			<a href="javascript:upOption();" title="<ww:property value='#session.local.a00268' />" >
				<i class="icon icon-long-arrow-up icon-2x"></i>
			</a>  <!-- 上移 -->
			<a href="javascript:bottomOption();" title="<ww:property value='#session.local.a00269' />" >
				<i class="icon icon-long-arrow-down icon-2x"></i>
			</a>  <!-- 下移-->
			<a href="javascript:savaSubmit();"><ww:property value='#session.local.a00080' /></a>  <!-- 保存-->
<!--			<a href="javascript:removeOption();"><ww:property value='#session.local.a00025' /></a>   删除 -->
		</div>
		</div>
	</div>
	
</div>
</form>
</body>
</html>