<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Info.userInfo" %>
<%@ page import = "Info.userSchDAO" %>
<%@ page import = "java.util.*" %>

<% 
userSchDAO udao = new userSchDAO();
List<userInfo> userlist = udao.readAllDB(); 
%>
	
<style>
body, html {width : 100%, height : 100%}
table {
	position : relative; 
	left :50%; 
	top : 50%;
	transform : translate(-50%,-50%);
	cellpadding : 10px;
	width : 600px;
}
th {background-color : rgba(33,33,33,.2);}
th:nth-child(2n) {background-color : rgba(99,99,99,.2);}
th:nth-child(2n+1) {background-color : rgba(00,57,66,.2);}
</style>

<table>
<tr> <th>학교명</th> <th>ID</th> <th>전공</th> <th>학점</th> <th>최종학력</th> <th>졸업일</th> </tr>
<% for (int i=0;i<userlist.size();i++) {
	userInfo user = (userInfo)userlist.get(i);
	out.print("<tr> <td>" + user.getName() + "</td>");
	out.print("<td>" + user.getId() + "</td>");
	out.print("<td>" + user.getMajor() + "</td>");
	out.print("<td>" + user.getGrade() + "</td>");
	out.print("<td>" + user.getCname() + "</td>");
	out.print("<td>" + user.getDate() + "</td>");
} %>
</table>