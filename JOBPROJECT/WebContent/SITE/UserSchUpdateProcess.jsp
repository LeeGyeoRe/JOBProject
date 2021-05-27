<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Info.userInfo" %>
<%@ page import = "Info.userSchDAO" %>

<% 
String cid = request.getParameter("id");
userSchDAO userdao = new userSchDAO();
userInfo user = userdao.readDB(cid);

request.setAttribute("user",user);
request.setAttribute("target","UserSchUpdateForm");
%>
<jsp:forward page = "template.jsp"/>