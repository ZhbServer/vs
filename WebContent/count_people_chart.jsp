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

	option = {
		    title : {
		        text: '<ww:property value='#session.local.b00112'/>',
		        subtext: '',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient : 'vertical',
		        x : 'left',
		        data:['<ww:property value='#session.local.b00143'/>','<ww:property value='#session.local.b00144'/>']
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {
		                show: true, 
		                type: ['pie', 'funnel'],
		                option: {
		                    funnel: {
		                        x: '25%',
		                        width: '50%',
		                        funnelAlign: 'left',
		                        max: 1548
		                    }
		                }
		            },
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    series : [
		        {
		            name:'',
		            type:'pie',
		            radius : '80%',
		            center: ['50%', '60%'],
		            data:[
                        {value:"<ww:property value='sex1'/>", name:'<ww:property value='#session.local.b00143'/>'},    
		                {value:"<ww:property value='sex2'/>", name:'<ww:property value='#session.local.b00144'/>'}    
		                
		               
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
	       <span class="function"><ww:property value='#session.local.b00112' /></span>
	       <span class="material_bg"><ww:property value='#session.local.a00752' /></span>
		</div>
	</div>
</div>
<div class="c_middle download_manager">
	<div id="main"></div>
</div>
</form>
</body>
</html>
