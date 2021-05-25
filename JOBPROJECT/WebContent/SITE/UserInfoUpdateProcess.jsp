<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Info.userInfo" %>
<%@ page import = "Info.userDAO" %>

<% 
String cid = request.getParameter("id");
userDAO userdao = new userDAO();
userInfo user = userdao.readDB(cid);

request.setAttribute("user",user);
request.setAttribute("target","UserInfoUpdateForm");
%>
<jsp:forward page = "template.jsp"/>