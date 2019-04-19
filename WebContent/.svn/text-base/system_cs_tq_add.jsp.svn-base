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
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<script type="text/javascript">


var pc = new Array();
 
 //pc[0]= new Array("自动获取","|自动获取_000000000");
 pc[1] = new Array("北京","|北京_101010100");
 pc[2] = new Array("上海","|上海_101020100");
 pc[3] = new Array("天津","|天津_101030100");
 pc[4] = new Array("重庆","|重庆_101040100");
 
 pc[5] = new Array("河北","|石家庄_101090101|邯郸_101091001|邢台_101090901|保定_101090201|张家口_101090301|承德_101090402|廊坊_101090601|唐山_101090501|秦皇岛_101091101|沧州_101090701|衡水_101090801");
 
 pc[6] = new Array("山西","|太原_101100101|大同_101100201|阳泉_101100301|长治_101100501|晋城_101100601|朔州_101100901|吕梁_101101101|忻州_101101001|晋中_101100401|临汾_101100701|运城_101100801");
 
 pc[7] = new Array("内蒙古","|呼和浩特_101080101|包头_101080201|通辽_101080501|赤峰_101080601|呼伦贝尔_101081000|鄂尔多斯_101080701|锡林浩特_101080901|乌海_101080301|阿拉善盟_101080302");
 
 pc[8] = new Array("辽宁","|沈阳_101070101|大连_101070201|鞍山_101070301|抚顺_101070401|本溪_101070501|丹东_101070601|锦州_101070701|营口_101070801|阜新_101070901|辽阳_101071001|盘锦_101071301|铁岭_101071101|朝阳_101071201|葫芦岛_101071401");
 
 pc[9] = new Array("吉林","|长春_101060101|吉林_101060201|四平_101060401|辽源_101060701|通化_101060501|白山_101060901|松原_101060801|白城_101060601|延吉_101060602");
 
 pc[10] = new Array("黑龙江","|哈尔滨_101050101|齐齐哈尔_101050201|牡丹江_101050301|佳木斯_101051101|大庆_101050301 |绥化_101050601|鹤岗_101051301|鸡西_101051201|黑河_101051002|双鸭山_101050801|伊春_101050901|七台河_101050401|大兴安岭_101050501");
 
 pc[11] = new Array("江苏","|南京_101190101|镇江_101190301|苏州_101190401|南通_101190501|扬州_101190601|盐城_101190701|徐州_101190801|连云港_101191001|常州_101191101|无锡_101190201|宿迁_101191301|泰州_101191201|淮安_101190901");
 
 pc[12] = new Array("浙江","|杭州_101210101|宁波_101210401|温州_101210701|嘉兴_101210301|湖州_101210201|绍兴_101210501|金华_101210901|衢州_101211001|舟山_101211101|台州_101210601|丽水_101210801");
 
 
 pc[13] = new Array("安徽","|合肥_101220101|芜湖_101220301|蚌埠_101220201|马鞍山_101220501|淮北_101221201|铜陵_101221301|安庆_101220601|滁州_101221101|宿州_101220701|池州_101221701|淮南_101220401|巢湖_101221601|阜阳_101220801|六安_101221501|亳州_101220901");
 
 
 pc[14] = new Array("福建","|福州_101230101|厦门_101230201|莆田_101230401|三明_101230801|泉州_101230501|漳州_101230601|南平_101230901|龙岩_101230701|宁德_101230301");
 
 pc[15] = new Array("江西","|南昌市_101240101|景德镇_101240801|九江_101240201|鹰潭_101241101|萍乡_101240901|新馀_101241001|赣州_101240701|吉安_101240601|宜春_101240501|抚州_101240401|上饶_101240301");
 
 
 
 pc[16] = new Array("山东","|济南_101120101|青岛_101120201|淄博_101120301|枣庄_101121401|东营_101121201|烟台_101120501|潍坊_101120601|济宁_101120701|泰安_101120801|威海_101121301|日照_101121501|莱芜_101121601|临沂_101120901|德州_101120401|聊城_101121701|滨州_101121101|菏泽_101121001");
 
 pc[17] = new Array("河南","|郑州_101180101|开封_101180801|洛阳_101180901|平顶山_101180501|安阳_101180201|鹤壁_101181201|新乡_101180301|焦作_101181101|濮阳_101181301|许昌_101180401|漯河_101181501|三门峡_101181701|南阳_101180701|商丘_101181001|信阳_101180601|周口_101181401|驻马店_101181601");
 
 pc[18] = new Array("湖北","|武汉_101200101|宜昌_101200901|荆州_101200801|黄石_101200601|荆门_101201401|黄冈_101200501|十堰_101201101|恩施_101201001|随州_101201301|咸宁_101200701|孝感_101200401|鄂州_101200301|襄阳_101201002");
 
 
 pc[19] = new Array("湖南","|长沙_101250101|常德_101250601|株洲_101250301|湘潭_101250201|衡阳_101250401|岳阳_101251001|邵阳_101250901|益阳_101250701|娄底_101250801|怀化_101251201|郴州_101250501|永州_101251401|张家界_101251101");
 
 
 pc[20] = new Array("广东","|广州_101280101|深圳_101280601|珠海_101280701|汕头_101280501|东莞_101281601|中山_101281701|佛山_101280800|韶关_101280201|江门_101281101|湛江_101281001|茂名_101282001|肇庆_101280901|惠州_101280301|梅州_101280401|汕尾_101282101|河源_101281201|阳江_101281801|清远_101281301|潮州_101281501|揭阳_101281901|云浮_101281401");
 
 
 pc[21] = new Array("广西","|南宁_101300101|柳州_101300510|桂林_101300501|梧州_101300601|北海_101301301|防城港_101301401|钦州_101301101|贵港_101300801|玉林_101300901|柳州地区_101300301|贺州_101300701|百色_101301001|河池_101301201");
 
 
 
 pc[22] = new Array("海南","|海口_101310101|三亚_101310201");
 
 pc[23] = new Array("四川","|成都_101270101|绵阳_101270401|德阳_101272001|自贡_101270301|攀枝花_101270201|广元_101272101|内江_101271201|乐山_101271401|南充_101270501|宜宾_101271101|广安_101270801|达州_101270601|雅安_101271701|眉山_101271501|甘孜_101271801|凉山_101271601|泸州_101271001");
 
 pc[24] = new Array("贵州","|贵阳_101260101|六盘水_101260801|遵义_101260201|安顺_101260301|铜仁_101260601|毕节_101260701");
 
 pc[25] = new Array("云南","|昆明_101290101|大理_101290201|曲靖_101290401|玉溪_101290701|昭通_101291001|楚雄_101290801|红河_101290301|文山_101290601|思茅_101290901|保山_101290501|德宏_101291501|丽江_101291401|怒江_101291201|迪庆|临沧_101291101");
 
 
 
 pc[26] = new Array("西藏","|拉萨_101140101|日喀则_101140201|山南_101140301|林芝_101140401|昌都_101140501|阿里_101140701|那曲_101140601");
 
 pc[27] = new Array("陕西","|西安_101110101|宝鸡_101110901|咸阳_101110901|铜川_101111001|渭南_101110501|延安_101110300|榆林_101110200|汉中_101110801|安康_101110701|商洛_101110601");
 
 
 pc[28] = new Array("甘肃","|兰州_101160101|金昌_101160601|白银_101161301|天水_101160901|酒泉_101160801|张掖_101160701|武威_101160501|定西_101160201|平凉_101160301|庆阳_101160401|临夏_101161101|甘南_101050204|陇南_101050205");
 
 pc[29] = new Array("宁夏","|银川_101170101|石嘴山_101170201|吴忠_101170301|固原_101170401");
 
 pc[30] = new Array("青海","|西宁_101150101|海东_101150201|海南_101150401|海北_101150801|黄南_101150301|玉树_101150601|果洛_101150501|海西_101150701");
 
 
 pc[31] = new Array("新疆","|乌鲁木齐_101130101|石河子_101130301|克拉玛依_101130201|昌吉_101130401|吐鲁番_101130501|哈密_101131201|喀什_101130901|和田_101131301|阿克苏_101130801|博乐市_101131101|库尔勒_101131102");
 pc[32] = new Array("香港","|香港_101320101");
 pc[33] = new Array("澳门","|澳门_101330101");
 
 pc[34] = new Array("台湾","|台北_101340102|高雄_101340201|桃园_101340202|新竹_101340203|苗栗_101340204|台中_101340205|彰化_101340206|云林_101340207|台南_101340208|宜兰_101340209|花莲_101340210|南投_101340211|嘉义_101340212|台东_101340213|屏东_101340214");
 pc[35]= new Array("自动获取","|自动获取_000000000"); 
 

function init() {
  var p = document.getElementById("province");
  var e = " ";
  if ( p && e ) {
   for( var i = 1; i < pc.length; i++ ) {
    e = document.createElement( "option" );
    e.setAttribute( "value", i );
    e.innerHTML = pc[i][0];
    p.appendChild(e);
   }
   showcity(1);
  }
}
 
function selectcity() {
  var p = document.getElementById("province");
  var idx = p.options[p.selectedIndex].value;
  if ( idx ) {
   showcity(idx);
  }
 }
 
function showcity(idx) {
  var c = document.getElementById("city");
  if ( c ) {
   while( c.hasChildNodes() ) {
    c.removeChild(c.lastChild);
   }
  }
  if ( idx ) {
   
      var citys = pc[idx][1].split( "|" ); 
      
	  for( var i = 1; i < citys.length; i++ ) {
		e = document.createElement( "option" );
		var citystr=citys[i].split("_");
		
		e.setAttribute( "value", citystr[1] );
		e.innerHTML = citystr[0];
		c.appendChild(e);
	   }
  }
}



function addtq(){
		//加载层-风格2
	   //layer.load(1);
		//此处演示关闭
		setTimeout(function(){
		  layer.confirm("<ww:property value='#session.local.a00634' />？", {
			  btn: ["<ww:property value='#session.local.a00232' />"] //按钮
			}, function(){
				 var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
				 window.parent.layer.close(index);
			});
	   }, 1000);
	   var city =document.getElementById("city");
	   document.getElementById("weatherCity").value=city.options[city.selectedIndex].text;
	   document.getElementById("weatherCityKey").value=city.options[city.selectedIndex].value;
	   document.form1.target = "_self";
	   document.form1.action = 'addtq.vs'; 
	   document.form1.submit();
}

</script>

</head> 
<body onload="init()">
   <form  name="form1" method="post" >   
   
    <div class="panel panel-primary" style="margin: 3px 3px;border: 0px;">
           
         <div class="panel-heading">
                <ww:property value="#session.local.a00184"/> <!-- 新增天气-->
         </div>
           
         <div class="container clearfix" style="margin: 20px 50px;">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		                <table class="insert-tab" width="100%">
		                        <tbody>
		                         <tr style="line-height: 45px;">
		                            <th width="120"><i class="require-red">*</i><ww:property value='#session.local.a00191' />：</th>
		                            <td>
		                                    <select id="province" name="province" onchange="selectcity()" style="font-size:20px;width:120px;height: 30px;">
                                            </select>
									        &nbsp;
									        <select id="city" name="city" style="font-size:20px;width:120px;height: 30px;">
									        </select>
		                            </td>
		                          </tr>
		                          
		                          

		                            <tr style="height: 45px;">
		                                <th></th>
		                                <td>
		                                    
		                                     <button class="btn btn-primary" onclick='addtq()' type="button"><ww:property value='#session.local.a00080' /></button>
		                                     <!-- <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">-->
		                                </td>
		                            </tr>
		                        </tbody>
		                   </table>
		            </div>
		        </div>
		     </div>
  
      </div> 
      <input   type="hidden" id="weatherCity" name="tq.city" />
	  <input   type="hidden" id="weatherCityKey" name="tq.citykey" />
	  </div>
   </form>
</body>
</html>
