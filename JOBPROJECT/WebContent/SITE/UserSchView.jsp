<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Info.userInfo" %>
<%@ page import = "Info.userSchDAO" %>

<% 
userSchDAO userdao = new userSchDAO();
Object s_id = session.getAttribute("user_id");
session.setAttribute("user_id", s_id);

userInfo user = userdao.readDB((String)s_id);
%>

<style>
body, html {width : 100%, height : 100%}
table {
	position : relative; 
	left :50%; 
	top : 50%;
	transform : translate(-50%,-50%);
	cellpadding : 10px;
	width : 300px;
	height : 200px;
}
</style>

<table border = 1>

<tr> <td width = 80>학교명</td> <th><%=user.getName() %> </th> </tr>

<tr> <td>ID</td> <th><%=user.getId() %> </th> </tr>

<tr> <td>전공명</td> <th><%=user.getMajor() %> </th> </tr>

<tr> <td>학점</td> <th><%=user.getGrade() %> </th> </tr>

<tr> <td>최종학력</td> <th><%=user.getCname() %> </th> </tr>

<tr> <td>졸업일</td> <th><%=user.getDate() %> </th> </tr>

<tr> <th colspan = 2>
<input type = "button" value = "정보 수정" onclick = "location.href='idx_Jsp.jsp?id=<%=user.getId() %>&idx=UserSchUpdateProcess'">
</th></tr>

</table>