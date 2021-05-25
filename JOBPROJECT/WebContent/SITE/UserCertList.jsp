<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Info.userInfo" %>
<%@ page import = "Info.userCertDAO" %>
<%@ page import = "java.util.*" %>

<% 
userCertDAO udao = new userCertDAO();
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
<tr> <th>ID</th> <th>자격명</th> <th>취득일</th> <th>편집</th> </tr>
<% for (int i=0;i<userlist.size();i++) {
	userInfo user = (userInfo)userlist.get(i);
	out.print("<tr> <td>" + user.getId() + "</td>");
	out.print("<td>" + user.getCname() + "</td>");
	out.print("<td>" + user.getCdate() + "</td>");
	out.print("<td> <input type = 'button' value = '수정'> <input type = 'button' value = '삭제'> </td>");
} %>
</table>