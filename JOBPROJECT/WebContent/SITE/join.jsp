<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Info.userDAO" %>
<%@ page import = "Info.userInfo" %>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id = "user" class = "Info.userInfo"/>
<jsp:setProperty property="*" name="user"/>

<%
String tel1 = request.getParameter("tel1");
String tel2 = request.getParameter("tel2");
String tel3 = request.getParameter("tel3");

user.setTel(tel1 + "-" + tel2 + "-" + tel3);

userDAO udao = new userDAO();
udao.insertDB(user);
request.setAttribute("name", user.getName());
request.setAttribute("target", "join_result");
%>
<jsp:forward page = "template.jsp"/>