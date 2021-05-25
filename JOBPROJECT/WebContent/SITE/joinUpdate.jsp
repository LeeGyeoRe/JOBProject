<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Info.userInfo" %>
<%@ page import = "Info.userDAO" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id = "user" class = "Info.userInfo"/>
<jsp:setProperty property = "*" name = "user"/>

<%
userDAO udao = new userDAO();
udao.dbUpdate(user);
request.setAttribute("target","joinListView"); 
%>

<jsp:forward page = "template.jsp"/>