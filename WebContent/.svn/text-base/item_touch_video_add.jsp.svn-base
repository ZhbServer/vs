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

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />

<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script src="js/jscolor.js"></script> 
<!-- ZUI 标准版压缩后的 JavaScript 文件 -->
<script  src="zui-1.5.0-dist/dist/js/zui.min.js"></script>

<script   src="zui-1.5.0-dist/dist/lib/sortable/zui.sortable.js"></script>

<style>
	/* 为可拖动的条目应用可移动光标类型 */
	#sortableList > .list-group-item {cursor: move}
	
	/* 为正在被拖动的条目应用半透明外观 */
	#sortableList > .list-group-item.dragging {
	  visibility: visible;
	  opacity: .3;
	}
</style>

<script>
    

</script>

</head>
<body>
    
         <table border="0" cellpadding="0" cellspacing="0"  width="100%">
                         
                         <ww:iterator value="listsc">
                             <tr class="cell_element">
                                <td>
                                    <input type="checkbox" class="check_box" name="qxVideo" id="qx_Video<ww:property value="#groupStatus.index" />"  value="<ww:property value='id' />_<ww:property value='name' />_<ww:property value="filename" />" style="margin-top: -1px;"/>
                                    <a href="javascript:yulan('seevideo.vs?fname=<ww:property value='filename' />','3');"   title="<ww:property value="name"/>">
                                      <ww:property value="namesub"/>
                                    </a>
                                </td>
                             </tr>
                         </ww:iterator>
                        
         </table>

    
			
</body>
</html>