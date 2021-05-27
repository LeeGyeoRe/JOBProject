<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Info.userInfo" %>
<%@ page import = "Info.userCertDAO" %>

<% 
userCertDAO userdao = new userCertDAO();
Object s_id = session.getAttribute("user_id");
session.setAttribute("user_id", s_id);

String cname = request.getParameter("cn");

userInfo user = userdao.readDB((String)s_id, cname);
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

<tr> <td width = 80>ID</td> <th><%=user.getId() %> </th> </tr>

<tr> <td>자격명</td> <th><%=user.getCname() %> </th> </tr>

<tr> <td>취득일</td> <th><%=user.getCdate() %> </th> </tr>

<tr> <th colspan = 2>
<input type = "button" value = "정보 수정" onclick = "location.href='idx_Jsp.jsp?id=<%=user.getId() %>&idx=UserInfoUpdateProcess'">
</th></tr>

</table>