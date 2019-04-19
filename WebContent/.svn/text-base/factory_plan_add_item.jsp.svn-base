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
<link rel="stylesheet" href="css/common.css"/>
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/common.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"/>
<script type="text/javascript" src="jquery-easyui-1.5/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>

<script type="text/javascript">

window.onload=function(){

	var selectOne = $('#selector').find("option:checked").attr("id");
	if(selectOne != ''){
		sel_material(selectOne);
	}

	$('#selector').combobox({
		onChange : function(){
			var index;
			var options = $('#selector')[0].options;
			var comboxList = $('.combo-panel')[0].childNodes;
			for ( var i = 0; i < comboxList.length; i++) {
				var classList = comboxList[i].classList;
				for ( var j = 0; j < classList.length; j++) {
					if(classList[j] == 'combobox-item-selected'){
						index = comboxList[i].id.split('_')[4];
					}
				}
			}
			sel_material(options[index].id); 
    	}
	});
}

function sel_material(id){
	var mtable = document.getElementById("mtable");
	var tr, td, img;
	mtable.innerHTML = '';
	$.ajax({
	 	 url:'ajaxselitemmaterial.vs?itemid='+id,
		 type:'post',  
	     cache:false,  
	     dataType:'json',  
	     success:function(data) {

			var mlist = data.materiallists[0];
			var fnames = mlist.filenames.split(',');

			//for(var j=0;j<data.sucaiNamesList.length;j++){
			//	alert(data.sucaiNamesList[j]);
		    //}
			
			//alert(JSON.stringify(mlist))
			var sid;
			for ( var i = 0; i < fnames.length; i++) {
				sid = fnames[i].split('.');
				tr = document.createElement("tr"); //创建tr
				tr.className = 'cell_element cell_show';               
				td = document.createElement("td");
				td.innerHTML = "<input type='checkbox' class='qx' name='qx' value='"+fnames[i]+"'/>";
				td.style.width = "10%";
				td.align = "center";
				tr.appendChild(td);
				td = document.createElement("td");
				td.style.width = "90%";
				td.title = fnames[i];
				td.id = sid[0];
				//td.innerHTML = fnames[i];
				td.innerHTML = data.sucaiNamesList[i];
			
				td.onmouseover=function(){
					var e = event || window.event;
					$("#show_img").attr("src", "files/"+mlist.mfile+"/" + this.title);
					var clientY=e.clientY;
					var clientX=e.clientX;
	  	            if(e.clientY+100>500){
	  	            	clientY=e.clientY-100;  
		  	        }
	  	            if(e.clientX+150>400){
	  	            	clientX=e.clientX-150;  
		  	        }
	  	            $("#preview").css("top", (clientY) + "px").css("left", (clientX) + "px").show();
				}
				td.onmouseout=function(){  
		  	        $("#preview").hide();  
		  	    };
				tr.appendChild(td);
				mtable.appendChild(tr);
			}
		 }
	});
}

function choice_item(){
    //选择元素
    var mids=document.getElementsByName('qx'); 
    var filenames = '';
	var count=0;
	for(var i=0;i<mids.length;i++) 
    { 
      if(mids[i].checked==true) 
      { 
    	 filenames += mids[i].value+",";
         count++;
      } 
    } 
	
    if (count==0){
    	 layer.msg("<ww:property value='#session.local.a01044' />!");
         return;
	}
     var selector = $("#selector").combobox("getValue") ;
    
	 var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	 window.parent.returnValue = filenames.substring(0,filenames.length-1)+"|"+selector;
     window.parent.layer.close(index);
	
}


</script>

</head> 
<body>
    <form  name="form1" method="post" >
	<div class="title bottom">
			<div class="t_container">
				<div class="loc">
				        &nbsp;&nbsp;<ww:property value='#session.local.a00065' /> :
				        <span class="function"><ww:property value='#session.local.a01042' /></span>
				        <span class="material_bg"><ww:property value='#session.local.a00330' /><ww:property value='#session.local.a00599' /></span>
				</div>
				
			
			</div>
	</div>
	
	<div style="width: 380px;margin:0px auto;">
		<div class="c_right"  style="height: 450px;width:380px;">
		 	<div class="c_right_header" >
		 	
		 	     <div class="row">
		 	     	  <div style="float:left;margin-left:30px;">
		 	     	  	  <ww:property value='#session.local.a00820' />:
		 	     	  	  <select id="selector" class="easyui-combobox" style="width:120px;">
					 		<ww:iterator value="mitemlists">
					 			<option id="<ww:property value='itemid' />"  value="<ww:property value='itemid' />"><ww:property value='itemName' /></option>
					 		</ww:iterator>
				 		  </select>
		 	     	  </div>
		 	     
					  <div class="btn-group" style="float:right;margin-right: 30px;">
					  	  <button type="button" class="btn btn-sm btn-primary" onclick="choice_item()"><ww:property value='#session.local.a00080' /></button>	
				      </div>
				      
				 </div>
		         
			 </div> 
			 <!--显示内容-->
	          <div style="height: 400px;"  >
		             
		            <!-- 固定标题 -->
	                   <div style="margin: 0px 20px;">
	                        <table border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;">
	                           <tr class="cell_element cell_first">
							     <td style="width: 10%;" align="center"><input type="checkbox" id="terminal_all" onclick="cli_sc('qx')"  class="check_box"/></td>
							     <td style="width: 90%;" ><ww:property value='#session.local.b00017' /></td>
							   </tr>
						  </table>	
	                   </div>
					  <div style="height: 360px;overflow: auto;margin: 0px 20px;">
						<table id="mtable" border="0" cellpadding="0" cellspacing="0" style="margin-bottom: 0px;"></table>
					  </div>
				</div>
		   </div>
		</div>
		
		<!-- 预览显示 -->           
        <div   id="preview"  style="position: absolute;display: none;">
           <img  id="show_img" src=""  height="100px"  width="150px" />   
        </div>
	</form>
</body>
</html>