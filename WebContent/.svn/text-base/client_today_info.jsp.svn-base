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
<script type="text/javascript" src="js/echarts.js"></script>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<style>
body,html{
margin:0px;
padding:0px;
border:0px;
}
#main{
width:100%;
height:90%;
}
</style>

<script>
$(document).ready(function(){

	var cct = <%=request.getAttribute("cClientTime")%>;
	
	//图表实例化------------------
	var myChart = echarts.init(document.getElementById('main'));

	var option = {
		title : {
	        text: '<ww:property value='#session.local.a00042' />'
    	},
	    tooltip : {
	        trigger: 'axis'
	    },
	    calculable : true,
	    xAxis : [
	        {
	            type : 'category',
	            boundaryGap : false,
	            name : '<ww:property value='#session.local.a00301'/>',
	            data : ['0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23']
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            min :0,
	            max :60,
	            splitNumber: 3,
	            name : '<ww:property value='#session.local.a00105' />(<ww:property value='#session.local.a00302' />)'
	        }
	    ],
	     series : [
            {
	             name:'<ww:property value='#session.local.a00105' />(<ww:property value='#session.local.a00302' />)',
	             type:'line',
	             data:[
						Math.round(cct[0].h0/60),
						Math.round(cct[0].h1/60),
						Math.round(cct[0].h2/60),
						Math.round(cct[0].h3/60),
						Math.round(cct[0].h4/60),
						Math.round(cct[0].h5/60),
						Math.round(cct[0].h6/60),
						Math.round(cct[0].h7/60),
						Math.round(cct[0].h8/60),
						Math.round(cct[0].h9/60),
						Math.round(cct[0].h10/60),
						Math.round(cct[0].h11/60),
						Math.round(cct[0].h12/60),
						Math.round(cct[0].h13/60),
						Math.round(cct[0].h14/60),
						Math.round(cct[0].h15/60),
						Math.round(cct[0].h16/60),
						Math.round(cct[0].h17/60),
						Math.round(cct[0].h18/60),
						Math.round(cct[0].h19/60),
						Math.round(cct[0].h20/60),
						Math.round(cct[0].h21/60),
						Math.round(cct[0].h22/60),
						Math.round(cct[0].h23/60)
	  	              ]
            }
       ]
	};

	myChart.setOption(option);
});
</script>

</head>
<body>
<form  name="form1" method="post" >
<div class="title bottom">
	<div class="t_container">
		<div class="loc">
			&nbsp;&nbsp;<ww:property value='#session.local.a00065' /> :
	       <span class="function"><ww:property value='#session.local.a00113' /></span>
	       <span class="function"><ww:property value='#session.local.a00856' /></span>
	       <span class="material_bg"><ww:property value='#session.local.a00752' /></span>
		</div>
	</div>
</div>
<div class="c_middle download_manager">
	<div style="text-align:right;">
      <button style="width:60px;height:30px;margin: 5px 50px;" class="btn btn-sm btn-primary" onclick="history.go(-1);">
            <ww:property value="#session.local.a00014"/>    
      </button>
    </div>
	<div id="main"></div>
</div>
</form>
</body>
</html>
