<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<%
  response.setHeader("Access-Control-Allow-Origin","*");
  response.setHeader("Access-Control-Allow-Headers","Range");
%>
<ww:if test="content=='success'">
       { "results": "<ww:property value="content" escape="false"/>" }
 </ww:if>
 <ww:else>
       { "results": <ww:property value="content" escape="false"/>  }
 </ww:else>








