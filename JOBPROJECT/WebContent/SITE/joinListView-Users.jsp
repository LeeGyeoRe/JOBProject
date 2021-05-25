<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Info.userInfo" %>
<%@ page import = "Info.userDAO" %>
<%@ page import = "java.util.*" %>

<% userDAO udao = new userDAO();
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
<tr> <th>ID</th> <th>PW</th> <th>이름</th> <th>생일</th> <th>성별</th> <th>전화번호</th> <th>가입일</th> </tr>
<% for (int i=0;i<userlist.size();i++) {
	userInfo user = (userInfo)userlist.get(i);
	out.print("<tr> <td> <a href='idx_Jsp.jsp?id=" + user.getId() + "&idx=joinItemView'>"
			+ user.getId() + "</a> </td>");
	out.print("<td>" + user.getPw() + "</td>");
	out.print("<td>" + user.getName() + "</td>");
	out.print("<td>" + user.getBirth() + "</td>");
	out.print("<td>" + user.getGender() + "</td>"); 
	out.print("<td>" + user.getTel() + "</td>");
	out.print("<td>" + user.getDate() + "</td>");
} %>
</table>