<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "Info.userDAO" %>

<%
String userid = request.getParameter("id");
userDAO udao = new userDAO();
udao.deleteDB(userid);
request.setAttribute("target","joinListView"); 
%>

<jsp:forward page = "template.jsp"/>