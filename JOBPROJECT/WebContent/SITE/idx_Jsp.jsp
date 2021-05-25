<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx = (String)request.getParameter("idx");
	request.setAttribute("target",idx);
%>
<jsp:forward page = "template.jsp"/>