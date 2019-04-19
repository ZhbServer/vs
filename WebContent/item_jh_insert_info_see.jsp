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

<!-- fullcalendar 日程插件 -->
<script type="text/javascript" src='js/fullcalendar.min.js'></script>
<script type="text/javascript" src='js/jquery-ui-1.10.2.custom.min.js'></script>
<link rel="stylesheet" type="text/css" href="css/fullcalendar.css" />

<script>
//返回计划
function go_itemjh(jhtype){
	document.form1.action="jhlist.vs?jhtype="+jhtype;
	document.form1.target = "_self";
    document.form1.submit();
}

//返回
function return_jh(returnURl){

    
        
	      window.location.href=returnURl;

	
    
}

</script>
<style>
body,html{
margin:0px;
padding:0px;
border:0px;
}
/*background-color:#134AFF;*/
/*overflow:hidden*/
</style>
<script type="text/javascript">


</script>
</head>
<body>
<script type="text/javascript"> 
document.body.onselectstart=document.body.oncontextmenu=function(){ return false;} 
</script> 
<form  name="form1" method="post" >
	<input type="hidden" value="<ww:property  value='jhid'/>" name="jhid" id="jhid"/>

	<div style="width: 1100px;margin: 0px auto;position: relative;">
	    <!--节目菜单-->
	    <div class="c_right_header" >
		
			<div class="row">
		         <div class="btn-group" style="float: right;margin-right: 30px;">
		           
		               <ww:if test="posType==0">
		                 <button onclick="return_jh('jhlist.vs?jhtype=2')"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00014' /></button><!-- 返回 -->
		              </ww:if>
		              <ww:elseif  test="posType==1">
		                 <button onclick="return_jh('tonoocheckjh.vs?type=2')"  type="button" class="btn btn-sm btn-primary"><ww:property value='#session.local.a00014' /></button><!-- 返回 -->
		              </ww:elseif>
		              
		         </div>
		    </div>
		</div>
	</div>

	<!--显示内容-->
	<div id="calendar" style="height: 500px;width: 1050px;margin: 0px auto;overflow-y:auto;" ></div>
</form>
    
<script>
var dataSource;
$(function(){
	 var array=[];
	    var data = <%=request.getAttribute("jhitemlist")%>;
		if(data.length > 0){
			for ( var i = 0; i < data.length; i++) {
				if(data[i].day == 0){
					var d = new Date(data[i].sdate);
					var d1 = new Date(data[i].edate);
					array.push({
					id:data[i].id+'_'+data[i].itemids,
					title:data[i].itemnames,
					start:new Date(d.getFullYear(), d.getMonth(), d.getDate(), d.getHours(), d.getMinutes(),d.getSeconds()),
					end:new Date(d1.getFullYear(), d1.getMonth(), d1.getDate(), d1.getHours(), d1.getMinutes(),d.getSeconds()),
					allDay:false
					});
				}
			}
			dataSource = array;
		}
	    initFullCalendar();
});


//初始化日程视图
function initFullCalendar(){
	
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month'
        },
        editable: true,//可以拖动   
        firstDay:1,
        timeFormat: 'H:mm',
        axisFormat: 'H:mm',
        aspectRatio:2.5,
        events:dataSource,
        eventClick:function(event, jsEvent, view){//当点击日历中的某一日程（事件）时，触发此操作
           // openEditLayer(event);
        	var itemids = event.id.split('_');
            var itemIdsAndType = itemids[1]+"_1";
            var jhitemid = itemids[0];
        	layer.open({
				type: 2,
		        area: ['620px', '400px'],
		        offset: '20px',
		        title:false,
		        fix: false, //不固定
		        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
		        content: 'tojhplayitem.vs?itemIdsAndType='+itemIdsAndType+'&jhitemid='+jhitemid,
		        scrollbar: false,
		        end: function(){ 		    	          
				}

			});
            console.log(this);
        },
        eventMouseover:function (event, jsEvent, view){//鼠标划过的事件

            console.log(event);

            var itemids = event.id.split('_');
            
            $(this).mousedown(function(e) {
                //右键为3
                if (3 == e.which) {
                	//editjhitem(itemids[0]);
                }
            });
            
        },eventMouseout:function( event, jsEvent, view ) { //鼠标离开的事件
            console.log(event);
        }
    });
}


function addjhitem(){
    var jhid=document.getElementById("jhid").value;
	layer.open({
		type: 2,
        area: ['920px', '500px'],
        offset: '20px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: 'toadjhitem1.vs?igr.itemgroupid=0&jhid='+jhid+"&jhtype=2",
        scrollbar: false,
        end: function(){ 
    	    window.location.target = "_self";
	    	window.location.href="jhinsertiteminfo.vs?jhid="+jhid;
		}
	});
	
}

function editjhitem(jhitemid){
	var jhid=document.getElementById("jhid").value;
	layer.open({
		type: 2,
        area: ['920px', '500px'],
        offset: '20px',
        title:false,
        fix: false, //不固定
        shift: Math.ceil(Math.random()*6), //0-6的动画形式，-1不开启
        content: 'toeditjhitem.vs?igr.itemgroupid=0&jhid='+jhid+"&jhtype=2&jhitemid="+jhitemid,
        scrollbar: false,
        end: function(){ 
    	    window.location.target = "_self";
	    	window.location.href="jhinsertiteminfo.vs?jhid="+jhid;
		}
	});
}

</script>
</body>
</html>
