<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Info.userInfo" %>
<%@ page import = "Info.userTestDAO" %>
<%@ page import = "java.util.*" %>

<% 
userTestDAO udao = new userTestDAO();
Object s_id = session.getAttribute("user_id");

List<userInfo> userlist = udao.readAllDB((String)s_id); 
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
<tr> <th>ID</th> <th>시험명</th> <th>점수</th> <th>시험일</th> </tr>
<% for (int i=0;i<userlist.size();i++) {
	userInfo user = (userInfo)userlist.get(i);
	out.print("<tr> <td>" + user.getId() + "</td>");
	out.print("<td>" + user.getTname() + "</td>");
	out.print("<td>" + user.getGrade() + "</td>");
	out.print("<td>" + user.getTdate() + "</td>");
} %>
</table>