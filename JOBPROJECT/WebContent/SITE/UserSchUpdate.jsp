<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Info.userInfo" %>
<%@ page import = "Info.userSchDAO" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id = "user" class = "Info.userInfo"/>
<jsp:setProperty property = "*" name = "user"/>

<%
userSchDAO udao = new userSchDAO();
udao.dbUpdate(user);
request.setAttribute("target","UserSchView"); 
%>

<jsp:forward page = "template.jsp"/>