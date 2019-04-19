<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>

<script type="text/javascript" src="js/constant.js"></script>

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

table {
	border-collapse: collapse;
	width: 100%;
	table-layout: fixed;
}

td {
	border: 1px solid #009999;
	padding: 6px 6px 6px 12px;
	color: #4f6b72;
	text-align: center;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	height: 35px;
}

button {
	margin: 0 5px;
}

label {
	font-size: 15px;
    margin: 5px 8px;
}

.container {
	margin: 20px auto;
	display: table;
	width: 80%;
}

.jsonsplit {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

.toolbar {
	width: 100%;
	height: 40px;
	top: 30px;
	text-align: left;
}

.jsonContent {
	width: 100%;
	top: 30px;
	min-height: 60px;
	resize: none;
}

.tableStyle {
	height: 250px;
	display: block;
	overflow: auto;
	clear:left;
}

.left_div{
	width:600px;
}

.right_div{
	float:left;
	width:200px;
	text-align:left;
	margin-left:20px;
}
</style>
<script type="text/javascript">
	/*
	createTable(toid, jsondata)：用于动态创建table，第0行为表头，数据里必须包含表头和数据的id
	@toid：创建table到id为toid的节点下
	@jsondata：用于创建table的json格式的数据（须在jsondata里包含表头标题）
	*/
	function createTable(toid, jsondata) {
		var rowsc = $('#rows').is(':checked');
		var colsc = $('#cols').is(':checked');
		
		
		var table = document.createElement("table");
		
		
		var hang = $('#hang').val();
		var lie = $('#lie').val();
		table.id = "table1";
		
		
		
		var tr, td;
		var num = 0;
		for ( var r in jsondata) {
			num++;
		}
		if(lie > 20){
			layer.msg("<ww:property value='#session.local.a01020' />");
			return;
		}
		if(hang > 100){
			layer.msg("<ww:property value='#session.local.a01022' />");
			return;
		}
		if(!hang>0 && !lie>0){
			layer.msg("<ww:property value='#session.local.a01018' />");
			return;
		}
		if(rowsc == true){
			if(lie < num){
				layer.msg("<ww:property value='#session.local.a01019' />");
				return;
			}
			if(lie > num){
				layer.msg("<ww:property value='#session.local.a01020' />");
				return;
			}
			if(lie == num){
				tr = document.createElement("tr");               //创建tr
				for (j in jsondata) {                                      //根据数据在tr内创建td
					td = document.createElement("td");
					td.appendChild(document.createTextNode(jsondata[j]));
					//新建一个输入框
					var input = $("<input>");
					input.attr("name","combox_fason");
					input.attr("type","hidden");
					input.attr("value",j);
					input.appendTo(td);
					tr.appendChild(td);
				}
				table.appendChild(tr);
				for ( var i = 0; i < hang-1; i++) {
					tr1 = document.createElement("tr");               //创建tr
					for ( var k = 0; k < lie; k++) {
						td = document.createElement("td");
						td.appendChild(document.createTextNode(""));
						tr1.appendChild(td);
					}
					table.appendChild(tr1);
				}
			}
		}
		if(colsc == true){
			if(hang < num){
				layer.msg("<ww:property value='#session.local.a01021' />");
				return;
			}
			if(hang > num){
				layer.msg("<ww:property value='#session.local.a01022' />");
				return;
			}
			if(hang == num){
				for (j in jsondata) {                                //根据数据在tr内创建td
					tr = document.createElement("tr");               //创建tr
					td = document.createElement("td");
					td.appendChild(document.createTextNode(jsondata[j]));
					//新建一个输入框
					var input = $("<input>");
					input.attr("name","combox_fason");
					input.attr("type","hidden");
					input.attr("value",j);
					input.appendTo(td);
					tr.appendChild(td);
					for ( var i = 0; i < lie-1; i++) {
						td1 = document.createElement("td");
						td1.appendChild(document.createTextNode(""));
						tr.appendChild(td1);
					}
					table.appendChild(tr);
				}
			}
		}
		document.getElementById(toid).appendChild(table);
	}
		
		
	function Map() {     
		this.elements = new Array();     
			
		//获取MAP元素个数     
		this.size = function() {     
			return this.elements.length;     
		}     
			
		//判断MAP是否为空     
		this.isEmpty = function() {     
			return(this.elements.length < 1);     
		}     
			
		//删除MAP所有元素     
		this.clear = function() {     
			this.elements = new Array();     
		}     
			
		//向MAP中增加元素（key, value)      
		this.put = function(_key, _value) {     
			this.elements.push( {     
				key : _key,     
				value : _value     
			});     
		}     
			
		//删除指定KEY的元素，成功返回True，失败返回False     
		this.remove = function(_key) {     
			var bln = false;     
			try{     
				for(i = 0; i < this.elements.length; i++) {     
					if(this.elements[i].key == _key) {     
						this.elements.splice(i, 1);     
						return true;     
					}     
				}     
			} catch(e) {     
				bln = false;     
			}     
			return bln;     
		}     
			
		//获取指定KEY的元素值VALUE，失败返回NULL     
		this.get = function(_key) {     
			try{     
				for(i = 0; i < this.elements.length; i++) {     
					if(this.elements[i].key == _key) {     
						return this.elements[i].value;     
					}     
				}     
			} catch(e) {     
				return null;     
			}     
		}     
			
		//获取指定索引的元素（使用element.key，element.value获取KEY和VALUE），失败返回NULL     
		this.element = function(_index) {     
			if(_index < 0 || _index >= this.elements.length) {     
				return null;     
			}     
			return this.elements[_index];     
		}     
		
		//判断MAP中是否含有指定KEY的元素     
		this.containsKey = function(_key) {     
			varbln = false;     
			try{     
				for(i = 0; i < this.elements.length; i++) {     
					if(this.elements[i].key == _key) {     
						bln = true;     
					}     
				}     
			} catch(e) {     
				bln = false;     
			}     
				return bln;     
			}     
			
			//判断MAP中是否含有指定VALUE的元素     
			this.containsValue = function(_value) {     
				var bln = false;     
				try{     
					for(i = 0; i < this.elements.length; i++) {     
						
						if(this.elements[i].value == _value) {     
							bln = true;     
						}
						
					}     
				} catch(e) {
					
					bln = false;     
				}     
				return bln;     
			}     
			
			//获取MAP中所有VALUE的数组（ARRAY）     
			this.values = function() {     
				var arr = new Array();     
				for(i = 0; i < this.elements.length; i++) {     
					arr.push(this.elements[i].value);     
				}     
				return arr;     
			}     
			
			//获取MAP中所有KEY的数组（ARRAY）     
			this.keys = function() {     
				var arr = new Array();     
				for(i = 0; i < this.elements.length; i++) {     
					arr.push(this.elements[i].key);     
				}     
				return arr;     
			}     
		}     

	var a;
//	var map = new Map();

	window.onload = function(){
		$('#rows').prop('checked', true);
//		initCreateOption();
	}

	function initCreateOption(){
		
		var selVal = $('#selComBox');
		
		var testData = "{\"id\":\"序号\",\"name\":\"姓名\",\"gender\":\"性别\",\"age\":\"年龄\"}";
		
		testData = JSON.parse(testData);
		
		for (var key1 in testData) {
			selVal.append("<option value='"+key1+"'>"+key1+":"+testData[key1]+"</option>");
		}
//		if(map.elements.length > 0){
//			var mapkv = map.elements;
//			for (var i = 0;i<mapkv.length;i++) {
//				selVal.append("<option value='"+mapkv[i].key+"'>"+mapkv[i].key+":"+mapkv[i].value+"</option>");
//			}
//		}
	}
	
	function createTdClick(){
		var tdNods = $("td");
		var rowsc = $('#rows').is(':checked');
		var colsc = $('#cols').is(':checked');
		//tdNods.click(tdClick);
		tdNods.attr("disabled","true");
		if(rowsc == true){
			rowsClick();
		}
		if(colsc == true){
			colsClick();
		}
			
	}
	
	function combox(obj,select){ 
		this.obj=obj 
		this.name=select; 
		this.select=document.getElementsByName(select)[0]; 
		/*要转换的下拉框*/ 	
	}
	

	//td的点击事件
	function tdClick(){
		var testData = $('#jsonContent').val();
		//var testData = "{\"id\":\"序号\",\"name\":\"姓名\",\"gender\":\"性别\",\"age\":\"年龄\"}";
		 //将td的文本内容保存
		var td = $(this);
		td.empty();
		
		var selectHtml = "<select id='fason' name='fason'>";
		testData = JSON.parse(testData); 
		for (var key1 in testData) {
			selectHtml += "<option value='"+key1+"'>"+testData[key1]+"</option>";
		}
//		if(map.elements.length > 0){
//			var mapkv = map.elements;
//			for (var i = 0;i<mapkv.length;i++) {
//				selectHtml += "<option value='"+mapkv[i].key+"'>"+mapkv[i].value+"</option>";
//			}
//		}
		selectHtml += "</select>";
		
		td.append(selectHtml);
		
		a=new combox("a","fason");
		
		with(a.select.style){ 
			left=getL(a.select)+"px",
			top=getT(a.select)+"px",
			position="absolute" 
		} 
		
		var select = $("#fason");
		select.focus();
		//var button = $("<button>");
		//button.append("√");
		//button.attr("style","position:absolute;width:25px;height:20px;left:"+(getL(a.select)+a.select.offsetWidth-10)+"px;top:"+(getT(a.select)-10)+"px;");
		 //将按钮添加到td中
		//td.append(button);
		
		//给按钮注册事件，当点击时就可以将文本保存起来
		//button.mousedown(function(){
		select.blur(function(){
			 //将输入框的文本保存
			var select = $(this);
			var text = $('#fason option:selected').text();
			var value = $('#fason option:selected').val();
			//将td的内容，即输入框去掉,然后给td赋值
			var td = select.parent("td");
			td.html(text);
			//新建一个输入框
			var input = $("<input>");
			input.attr("name","combox_fason");
			input.attr("type","hidden");
			input.attr("value",value);
			input.appendTo(td);
			//让td重新拥有点击事件
			td.click(tdClick);
		});
		 
		//将td的点击事件移除
		td.unbind("click");
	}
	

	////////对象事件结束/////// 
	/*公用定位函数(获取控件绝对坐标)*/ 
	function getL(e){ 
		var l=e.offsetLeft; 
		while(e=e.offsetParent)l+=e.offsetLeft; 
		return l;
	} 
	function getT(e){ 
		var t=e.offsetTop; 
		while(e=e.offsetParent)t+=e.offsetTop; 
		return t;
	}
		
		
	function addRow(){
		var hang = $("#table1").find("tr").length;
		if(hang > 99){
			layer.msg("<ww:property value='#session.local.a01018' />");
			return;
		}
		var lie = $("#table1 tr").eq(0).find("td").length;	
		var tableHtml;
		if($("#table1").find("tbody").length > 0){
			tableHtml = $("#table1 tbody").html();
		}else{
			tableHtml = $("#table1").html();
		}
		var rows ="";
		tableHtml+="<tr>";
		for(var i = 0;i < lie;i++){
			rows += '<td></td>';
		}
		tableHtml+=rows+"</tr>";
		$("#table1").html(tableHtml);

		createTdClick();
		$('#hang').val(hang+1);
	}

	function addCol(){
		var lie = $("#table1").find("tr").find("td").length-1;
		var l = $("#table1 tr").eq(0).find("td").length;
		if(l > 19){
			layer.msg("<ww:property value='#session.local.a01018' />");
			return;
		}
		$("#table1 tr").each(function(){
			var trHtml = $(this).html();
			trHtml += '<td></td>';
			$(this).html(trHtml);
		});
		
		rowsDisabled();
		//createTdClick();
		$('#lie').val($("#table1 tr").eq(0).find("td").length);
	}
	
	
	function delRow(){
		$("table tr:last").remove();
		var hang = $("#table1").find("tr").length;
		if(hang<1){
			empty();
		}
		
		createTdClick();
		$('#hang').val(hang);
	}

	function delCol(){
		var lie = $("#table1 tr").eq(0).find("td").length;
		var tr = $("table tr");
		for(var i = 0;i<tr.length;i++){
			$("table tr")[i].cells[lie-1].remove();
		}
		//$("table tr td:last").remove();
		if(lie<1){
			empty();
		}
		
		createTdClick();
		$('#lie').val(lie-1);
	}
	
	function toTable(){
		//var context = "{\"id\":\"序号\",\"name\":\"姓名\",\"gender\":\"性别\",\"age\":\"年龄\"}";
		var context = $('#jsonContent').val();
		var testData = eval("("+context+")");
		$('#data').html('');   
		createTable("data", testData);
		createTdClick();
	}
	
	function empty(){
		$('#data').html('');
	}
	
	
	function rowsDisabled(){
		var hang = $("#table1").find("tr").length;
		var rowsc = $('#rows').is(':checked');
		if(rowsc == true){
			$('#rows').prop('checked', true);
			$('#cols').prop('checked', false);
			if(hang > 1){
				$('table tr:not(:first) td').empty();
			}
			rowsClick();
		}else{
			var tdNods = $("td");
			tdNods.unbind("click");
			tdNods.attr("disabled","true");
		}
	}

	function colsDisabled(){
		var lie = $("#table1 tr").eq(0).find("td").length;
		var colsc = $('#cols').is(':checked');
		if(colsc == true){
			$('#cols').prop('checked', true);
			$('#rows').prop('checked', false);
			if(lie > 1){
				$('table tr td:not(:first)').empty();
			}		
			colsClick();	
		}else{
			var tdNods = $("td");
			tdNods.unbind("click");
			tdNods.attr("disabled","true");
		}
	}
	
	function rowsClick(){
		var tdNods = $("td");
		tdNods.unbind("click");
		tdNods.attr("disabled","true");
		var tds=$('table tr:first td');
		for ( var i = 0; i < tds.length; i++) {
			tds.eq(i).removeAttr("disabled");
			tds.eq(i).click(tdClick);
		}
	}
	
	function colsClick(){
		var tdNods = $("td");
		tdNods.unbind("click");
		tdNods.attr("disabled","true");
		$("table tr").each(function() {
            $(this).children('td:eq(0)').removeAttr("disabled");
			$(this).children('td:eq(0)').click(tdClick);
        });
	}
	
	function addMap(){
		var selVal = $('#selComBox');
		var key = document.getElementById('key1');
		var val = document.getElementById('value1');
		if(key.value.length>0 && val.value.length>0){
			var testData = "{\"id\":\"序号\",\"name\":\"姓名\",\"gender\":\"性别\",\"age\":\"年龄\"}";
			testData = JSON.parse(testData); 
			for (var key1 in testData) {
				if(key.value == key1){
					layer.msg("<ww:property value='#session.local.a00998' />");
					return;
				}
				if(val.value == testData[key1]){
					layer.msg("<ww:property value='#session.local.a00999' />");
					return;
				}
			}
			if(map.elements.length > 0){
				var mapkv = map.elements;
				for (var i = 0;i<mapkv.length;i++) {
					if(mapkv[i].key == key.value){
						layer.msg("<ww:property value='#session.local.a00998' />");
						return;
					}
					if(mapkv[i].value == val.value){
						layer.msg("<ww:property value='#session.local.a00999' />");
						return;
					}
				}
			}
			map.put(key.value,val.value);
			selVal.append("<option value='"+key.value+"'>"+key.value+":"+val.value+"</option>");
			key.value = "";
			val.value = "";
		}else{
			layer.msg("<ww:property value='#session.local.a01000' />");
		}
	}
	
	function saveData(){
		
		var hang = $("#table1").find("tr").length;
		var lie = $("#table1 tr").eq(0).find("td").length;
		var rowsc = $('#rows').is(':checked');
		var colsc = $('#cols').is(':checked');
		var json;
		var jsonStr;
		
		//是否显示标题
		var titleState = $('#titleState').is(':checked');
		if(titleState==true){
			titleState=1;
		}else{
			titleState=0;
		}
		
		//是否显示边框
		var borderState = $('#borderState').is(':checked');
		
		if(borderState==true){
			borderState=1;
		}else{
			borderState=0;
		}
		
		
		//获取表格背景颜色
		var tableBgColor=$("#tableBgColor").val();  
		//获取表格字体颜色
		var tableFontColor=$("#tableFontColor").val();  
		//获取字体大小
		var tableFontSize=$("#tableFontSize").val();  
		
		
		
		
		if(hang > 0 && lie > 0){
			if(rowsc == false && colsc == false){
				layer.msg("<ww:property value='#session.local.a01001' />");
				return;	
			}
			if(rowsc == true){
				var tds=$('table tr:first td');
				var jsonData="{\"rows\":"+hang+",\"cols\":"+lie+",\"showType\":1,\"titleState\":"+titleState+",\"borderState\":"+borderState+",\"title\":[";
				jsonStr = "[{";
				for ( var i = 0; i < tds.length; i++) {
					
				    if(i==0){
				    	jsonData+= "{"
				    	//jsonStr+= "{"	
				    }else{
				    	jsonData+= ",{";
				    	//jsonStr+= ",{";
				    }
					
					if(i < tds.length-1){
						
						//jsonData+= "\""+tds.eq(i).find("input").val() +"\":\""+tds.eq(i).text()+"\",";
						
						jsonData+= "\"key\":\""+tds.eq(i).find("input").val()+"\",\"value\":\""+tds.eq(i).text()+"\"";
						jsonData+= ",\"bgColor\":\""+tableBgColor+"\",\"fontColor\":\""+tableFontColor+"\"";
						jsonData+= ",\"fontSize\":"+tableFontSize;
						
						jsonStr+= "\""+tds.eq(i).find("input").val() +"\":\""+tds.eq(i).text()+"\",";
						
						
						//jsonStr+= "\"key\":\""+tds.eq(i).find("input").val()+"\",\"value\":\""+tds.eq(i).text()+"\"";
						
					}else{
						//jsonData+= "\""+tds.eq(i).find("input").val() +"\":\""+tds.eq(i).text()+"\"";
						
						jsonData+= "\"key\":\""+tds.eq(i).find("input").val()+"\",\"value\":\""+tds.eq(i).text()+"\"";
						jsonData+= ",\"bgColor\":\""+tableBgColor+"\",\"fontColor\":\""+tableFontColor+"\"";
						jsonData+= ",\"fontSize\":"+tableFontSize;
						
						//jsonStr+= "\"key\":\""+tds.eq(i).find("input").val()+"\",\"value\":\""+tds.eq(i).text()+"\"";
						jsonStr+= "\""+tds.eq(i).find("input").val() +"\":\""+tds.eq(i).text()+"\"";
					}
					jsonData+= "}";
					//jsonStr+= "}"
					
				}
				jsonData+="]}";
				jsonStr+="}]";
				json= replaceAll(jsonData); 
			}
			if(colsc == true){
				var jsonData="{\"rows\":"+hang+",\"cols\":"+lie+",\"showType\":2,\"titleState\":"+titleState+",\"borderState\":"+borderState+",\"title\":[";
				jsonStr = "[{";
				var i=0;
				$("table tr").each(function() {
					
					if(i==0){
					    	jsonData+= "{"
					    	//jsonStr+= "{"
					}else{
					    	jsonData+= ",{";
					    	//jsonStr+= ",{";
					}
					//jsonData+= "\""+$(this).children('td:eq(0)').find("input").val() +"\":\""+ $(this).children('td:eq(0)').text() + "\",";
					
					jsonData+= "\"key\":\""+$(this).children('td:eq(0)').find("input").val()+"\",\"value\":\""+$(this).children('td:eq(0)').text()+"\"";
					
					jsonData+= ",\"bgColor\":\""+tableBgColor+"\",\"fontColor\":\""+tableFontColor+"\"";
					
					jsonData+= ",\"fontSize\":"+tableFontSize;
					
					jsonData+= "}";
					
					//jsonStr+= "\"key\":\""+$(this).children('td:eq(0)').find("input").val()+"\",\"value\":\""+$(this).children('td:eq(0)').text()+"\"";
					
					//jsonStr+= "}";
					jsonStr+= "\""+$(this).children('td:eq(0)').find("input").val() +"\":\""+ $(this).children('td:eq(0)').text() + "\",";
					
					i++;
				});
				//jsonData = jsonData.substring(0,jsonData.length-1);
				jsonData+="]}";
				jsonStr = jsonStr.substring(0,jsonStr.length-1);
				jsonStr+="}]";
				json= replaceAll(jsonData); 
			}
			//alert(jsonData)
			//alert(jsonStr)
			//return;
			if(jsonData.indexOf("undefined") != -1){
				layer.msg("<ww:property value='#session.local.a01002' />");
			}else{
				var str = replaceAll(jsonStr);
				setLayerBigDataParameter(jsonData);  
				/*弹出新增权限*/
				layer.open({
			 		 type: 2,
			         area: ['500px', '200px'],
			         offset: '50px',
			         title:false,
			         fix: false, //不固定
			         shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
			         content: 'system_data_interface_save.jsp?jsonStr='+str,
			         scrollbar: false,
			         end: function(){ 
					 	if(window.returnValue==undefined||window.returnValue==""){
						    window.returnValue=""; 
					    }else{
					    	var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
					        window.parent.layer.close(index);
						   	window.returnValue=""; 
					    }
			 		}
			 	});            
			}
		}else{
			layer.msg("<ww:property value='#session.local.a01003' />");
		}
	}

	function replaceAll(str)  
	{  
	    if(str!=null)  
        str = str.replace(/"/g,"'");  
	    return str;  
	}  
		
    </script>
</head>
<body>


  <div class="panel panel-primary" style="margin: 3px 3px;border: 0px;">
           
         <div class="panel-heading">
                <ww:property value="#session.local.a00021"/>
                <ww:property value="#session.local.a00996"/> <!-- 新增接口-->
         </div>
         
         
<input type="hidden" id="layerBigDataParameter"/>  <!-- 弹出框编辑大数据传输 -->
<div class="container">
<div id="split" class="jsonsplit">
<div class="left_div">
	<div id="setMap" style="width: 100%; text-align: left;">
	<div>
	<textarea id="jsonContent" class="jsonContent">{"id":"序号","name":"姓名","age":"年龄","gender":"性别"}</textarea>
	<!--<label><ww:property value='#session.local.a01004' /></label><br> <label> <ww:property value='#session.local.a01005' />：<input
		id="key1" name="key" style="width:130px;" /></label> <label><ww:property value='#session.local.a01006' />：<input id="value1"
		name="value" style="width:130px;" /></label>
	<button class="btn btn-sm btn-primary" type="button" onclick="addMap();"><ww:property value='#session.local.a00652' /></button>-->
	</div>
	</div>
	<div class="toolbar">
	
	    <label>
	       <input id="rows" name="direction" type="checkbox" onclick="rowsDisabled();" /><ww:property value='#session.local.a01007' />
	    </label> 
	    <label>
	       <input id="cols" name="direction" type="checkbox" onclick="colsDisabled();" /><ww:property value='#session.local.a01008' />
	    </label>
	    
	    <label>
	         <input id="titleState" name="titleState" value="1" type="checkbox" onclick="" checked="checked" />
	         <!-- 是否显示标题 -->
	          <ww:property  value="#session.local.b00223"/>
	    </label>
	    
	    <label  style="display: none;">
	         <input id="borderState" name="borderState" value="1" type="checkbox" onclick=""  checked="checked" />
	         <!-- 是否显示边框 -->
	         <ww:property  value="#session.local.b00224"/>
	    </label>
	    
	    
		<label><ww:property value='#session.local.a01016' />：<input id="hang" name="hang" style="width:30px;" /></label>
		<label><ww:property value='#session.local.a01017' />：<input id="lie" name="lie" style="width:30px;" /></label>
	  
	</div>
	
	<div class="toolbar" style="display: none;">
	     <label>
	         <ww:property  value="#session.local.b00225"/>:
		     <!--  表格背景: -->
	        <select id="tableBgColor"> 
	               <option  value="0"> <ww:property value="#session.local.a00366"/>   </option>   <!-- 透明 --> 
	               <option value="-16777216"><ww:property value='#session.local.a00337' /></option><!-- 黑色 -->
				   <option value="-65536"><ww:property value='#session.local.a00338' /></option>   <!-- 红色 -->
				   <option value="-16776961"><ww:property value='#session.local.a00339' /></option><!-- 蓝色 -->
				   <option value="-256"><ww:property value='#session.local.a00342' /></option>     <!-- 黄色 -->
				   <option value="-16711936"><ww:property value='#session.local.a00341' /></option><!-- 绿色 -->
				   <option value="-2"><ww:property value='#session.local.a00340' /></option>       <!-- 白色 -->  
				   <option value="-7829368"><ww:property value='#session.local.a00343' /></option> <!-- 灰色 -->
	        </select>
	    </label> 
	    <label>
	           <ww:property  value="#session.local.a00325"/>:
			   <!-- 字体颜色: -->
	           <select   id="tableFontColor">
	               <option value="-16777216"><ww:property value='#session.local.a00337' /></option><!-- 黑色 -->
				   <option value="-65536"><ww:property value='#session.local.a00338' /></option>   <!-- 红色 -->
				   <option value="-16776961"><ww:property value='#session.local.a00339' /></option><!-- 蓝色 -->
				   <option value="-256"><ww:property value='#session.local.a00342' /></option>     <!-- 黄色 -->
				   <option value="-16711936"><ww:property value='#session.local.a00341' /></option><!-- 绿色 -->
				   <option value="-2"><ww:property value='#session.local.a00340' /></option>       <!-- 白色 -->  
				   <option value="-7829368"><ww:property value='#session.local.a00343' /></option> <!-- 灰色 -->
	           </select>
	    </label>
	                   
	    <label>
	       <ww:property  value="#session.local.a00324"/>:
		   <!-- 字体大小: -->
	       <select  id="tableFontSize" >
	           <option value="-1"> <ww:property  value="#session.local.b00226"/> </option> <!-- 自适应 -->
	           <option value="12"> 12  </option>
	           <option value="13"> 13  </option>
	            <option value="14"> 14  </option>
	             <option value="15"> 15  </option>
	              <option value="16"> 16  </option>
	               <option value="17"> 17  </option>
	                <option value="18"> 18  </option>
	                  <option value="19"> 19  </option>
	                  <option value="20"> 20  </option>
	                  <option value="21"> 21  </option>
	                  <option value="22"> 22  </option>
	                  <option value="23"> 23  </option>
	                  <option value="24"> 24  </option>
	                  <option value="25"> 25  </option>
	                  <option value="26"> 26  </option>
	                  <option value="27"> 27  </option>
	                  <option value="28"> 28  </option>
	                  <option value="29"> 29  </option>
	                  <option value="30"> 30  </option>
	                  <option value="31"> 31  </option>
	                  <option value="32"> 32  </option>
	                  <option value="33"> 33  </option>
	                  <option value="34"> 34  </option>
	                  <option value="35"> 35  </option>
	                  <option value="36"> 36  </option>
	                  <option value="37"> 37  </option>
	                  <option value="38"> 38  </option>
	                  <option value="39"> 39  </option>
                      <option value="40"> 40  </option>
                      <option value="45"> 45  </option>
                      <option value="50"> 50  </option>
                      <option value="55"> 55  </option>
                      <option value="60"> 60  </option>
                      <option value="65"> 65  </option>
                      <option value="70"> 70  </option>
                      <option value="75"> 75  </option>
                      <option value="80"> 80  </option>
                      <option value="85"> 85  </option>
                      <option value="90"> 90  </option>
                      <option value="95"> 95  </option>
                      <option value="100"> 100  </option>
	                     
	        </select>
	    </label>
	</div>
	
	
	<div class="toolbar">
	
	<button class="btn btn-sm btn-primary" type="button"
		onclick="toTable();"><ww:property value='#session.local.a01009' /></button>
	<button class="btn btn-sm btn-primary" type="button" onclick="empty();"><ww:property value='#session.local.a01010' /></button>
	    
	<button class="btn btn-sm btn-primary" type="button" onclick="addRow();"><ww:property value='#session.local.a01011' /></button>
	<button class="btn btn-sm btn-primary" type="button" onclick="addCol();"><ww:property value='#session.local.a01012' /></button>
	<button class="btn btn-sm btn-primary" type="button" onclick="delRow();"><ww:property value='#session.local.a01013' /></button>
	<button class="btn btn-sm btn-primary" type="button" onclick="delCol();"><ww:property value='#session.local.a01014' /></button>
	<button class="btn btn-sm btn-primary" type="button" onclick="saveData();"><ww:property value='#session.local.a00254' /></button>
	</div>
	

</div>
<!--<div class="right_div">
	<div><label><ww:property value='#session.local.b00069' /></label><br>
		 <select id="selComBox" style="width:150px;height: 95px;" size="5"></select>
	</div>
</div>-->
<div id="data" class="tableStyle"></div>
</div>
</div>
</div>
</body>
</html>
