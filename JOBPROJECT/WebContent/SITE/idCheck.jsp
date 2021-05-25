<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Info.userDAO" %>

<%
String cid = request.getParameter("cid");
userDAO userdao = new userDAO();
request.setAttribute("cid",cid);

if(userdao.idcheck(cid))
	request.setAttribute("result","true");

else
	request.setAttribute("result","false");
	
%>
<jsp:forward page = "id.jsp"/>