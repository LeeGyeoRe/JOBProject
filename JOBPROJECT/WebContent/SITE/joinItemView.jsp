<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Info.userInfo" %>
<%@ page import = "Info.userDAO" %>

<% 
String cid = request.getParameter("id");
userDAO userdao = new userDAO();
userInfo user = userdao.readDB(cid);
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

<tr> <td width = 80>이름</td> <th><%=user.getName() %> </th> </tr>

<tr> <td>ID</td> <th><%=user.getId() %> </th> </tr>

<tr> <td>PW</td> <th><%=user.getPw() %> </th> </tr>

<tr> <td>이름</td> <th><%=user.getName() %> </th> </tr>

<tr> <td>생일</td> <th><%=user.getBirth() %> </th> </tr>

<tr> <td>성별</td> <th><%=user.getGender()%> </th> </tr>

<tr> <td>전화번호</td> <th><%=user.getTel() %> </th> </tr>

<tr> <td>가입일</td> <th><%=user.getDate() %> </th> </tr>

<tr> <th colspan = 2>
<input type = "button" value = "정보 수정" onclick = "location.href='idx_Jsp.jsp?id=<%=user.getId() %>&idx=joinUpdateProcess'">
<input type = "button" value = "정보 삭제" onclick = "location.href='idx_Jsp.jsp?id=<%=user.getId() %>&idx=joindelete'">
</th></tr>

</table>