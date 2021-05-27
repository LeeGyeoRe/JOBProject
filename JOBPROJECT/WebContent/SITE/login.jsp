<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Info.userDAO" %>
<%@ page import = "Info.userInfo" %>

<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
userDAO userdao = new userDAO();
userInfo user = userdao.readDB(id);

if(pw.equals(user.getPw())) {
	session.setAttribute("user_name", user.getName());
	session.setAttribute("user_id", user.getId());
	session.setAttribute("target", "home");
	
}else {
	request.setAttribute("target", "LoginForm");
}
%>

<jsp:forward page = "template.jsp"/>
