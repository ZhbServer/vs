<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<!--<link rel="stylesheet" href="css/index.css"/>-->
<!--<link rel="stylesheet" href="css/common.css"/>-->
<style>
body{ font-family:微软雅黑;}
.clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden;}
.clearfix{*height:1%;}
.insert-tab{border-collapse:collapse;border:1px solid #eee;}
.insert-tab th,.insert-tab td{border:1px solid #eee;}
.insert-tab tr{line-height:40px;}
.insert-tab th{text-align:center;font-weight:normal;padding-right:10px;}
.insert-tab td{text-align:center;padding-left:10px;}
.a1{
    background-color:#f5fafe;
 }
</style>
</head> 
<body style="background-color:transparent">
   
       <div class="container clearfix">
             <div class="main-wrap">
		         <div class="result-wrap">
		            <div class="result-content">
		              
		                    <table class="insert-tab" width="100%" style="font-size:<ww:property value='hlFontSize' />px;color:#<ww:property value='hlFontColor' />">
		                        <tbody>
		                         <tr>  
	                                <th <ww:if test="nameDisplay==0">style="display: none;"</ww:if>><ww:property  value="nameStr"  /> </th>  <!-- 货币名称 -->
		                            <th <ww:if test="fBuyPriceDisplay==0">style="display: none;"</ww:if>><ww:property  value="fBuyPriceStr"  /></th>  <!-- 现汇买入价 -->
		                            <th <ww:if test="mBuyPriceDisplay==0">style="display: none;"</ww:if>><ww:property  value="mBuyPriceStr"  /></th>  <!-- 现钞买入价 -->
		                            <th <ww:if test="fSellPriceDisplay==0">style="display: none;"</ww:if>><ww:property  value="fSellPriceStr"  /></th>  <!-- 现汇卖出价-->
		                            <th <ww:if test="mSellPriceDisplay==0">style="display: none;"</ww:if>><ww:property  value="mSellPriceStr"  /></th>  <!-- 现钞卖出价 -->
		                            <th <ww:if test="bankConversionPriceDisplay==0">style="display: none;"</ww:if>><ww:property  value="bankConversionPriceStr"  /></th>  <!-- 银行折算价/中间价 -->
		                            <th <ww:if test="sdateDisplay==0">style="display: none;"</ww:if>><ww:property  value="sdateStr"  /></th>  <!-- 发布日期-->
		                            <th <ww:if test="stimeDisplay==0">style="display: none;"</ww:if>><ww:property  value="stimeStr"  /></th>  <!-- 发布时间 -->
		                          </tr>
		                          <ww:iterator value="dataHls" status="status">
		                          <tr <ww:if test="#status.odd == true">class="a1" </ww:if> >
		                             <td <ww:if test="nameDisplay==0">style="display: none;"</ww:if>>
		                                <ww:if test="name==null"></ww:if>
		                                <ww:else>
		                                   <ww:property  value="name"  />
		                                </ww:else>
		                             </td>
		                             <td <ww:if test="fBuyPriceDisplay==0">style="display: none;"</ww:if>>
		                                <ww:if test="fBuyPrice=='null'"></ww:if>
		                                <ww:else>
		                                   <ww:property  value="fBuyPrice"  />
		                                </ww:else>
		                             </td>
		                             <td <ww:if test="mBuyPriceDisplay==0">style="display: none;"</ww:if> >
		                               <ww:if test="mBuyPrice=='null'"></ww:if>
		                                <ww:else>
		                                   <ww:property  value="mBuyPrice"  />
		                                </ww:else>
		                             </td>
		                             <td <ww:if test="fSellPriceDisplay==0">style="display: none;"</ww:if>>
		                                 
		                                <ww:if test="fSellPrice=='null'"></ww:if>
		                                <ww:else>
		                                   <ww:property  value="fSellPrice"  />
		                                </ww:else>
		                             
		                             </td>
		                             <td <ww:if test="mSellPriceDisplay==0">style="display: none;"</ww:if> >
		                                <ww:if test="mSellPrice=='null'"></ww:if>
		                                <ww:else>
		                                   <ww:property  value="mSellPrice"  />
		                                </ww:else> 
		                             </td>
		                             <td <ww:if test="bankConversionPriceDisplay==0">style="display: none;"</ww:if>>
		                                <ww:if test="bankConversionPrice=='null'"></ww:if>
		                                <ww:else>
		                                   <ww:property  value="bankConversionPrice"  />
		                                </ww:else> 
		                             </td>
		                             <td <ww:if test="sdateDisplay==0">style="display: none;"</ww:if>><ww:property  value="sdate"  /></td>
		                             <td <ww:if test="stimeDisplay==0">style="display: none;"</ww:if>><ww:property  value="stime"  /></td>
		                          </tr>  
		                          </ww:iterator>
		                        </tbody>
		                     </table>
		              
		            </div>
		        </div>
		     </div>
  
   </div>

</body>
</html>
