<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>


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
                         
               <ww:iterator value="listscene" status="status">
                   <tr class="cell_element">
                      <td> 
                          <input type="radio" class="check_box" name="qxradio" id="qx_<ww:property value="#groupStatus.index" />"  <ww:if test='#request.editTouchtResources==filename'>checked="checked"</ww:if> <ww:if test="#request.editTouchtResources==''&&#status.index==0">checked="checked"</ww:if>     qxname="<ww:property value="name" />"  value="<ww:property value="filename" />" style="margin-top: -1px;"/>
                          <ww:property value="name"/>
                      </td>
                   </tr>
               </ww:iterator>
                        
         </table>

    
			
</body>
</html>