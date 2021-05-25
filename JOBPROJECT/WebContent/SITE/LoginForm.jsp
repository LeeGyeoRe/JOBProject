<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
body,html {
	width:100%, height:100%
}  

table {
	position:relative; 
	left:50%; 
	transform:translate(-50%, 50%);
}
	
td:nth-child(odd) {
	background : #EAEAEA;
}

td:nth-child(even) {
	background : rgba(32,52,58,.2);
}

</style>

<script>
function onCheck(){
	if(!form.id.value){
		alert('ID를 입력하세요');
		form.id.focus();
		return false;
	}
	
	if(!form.pw.value){
		alert('PW를 입력하세요');
		form.pw.focus();
		return false;
	}
	
	return true;
		
}
</script>

</head>
<body>
<form Action = "login.jsp" method = post name = "form" onsubmit = "onCheck()">

<TABLE CELLPADDING="6">
	<TR> <td colspan = "2" Align = "center"><h3>개인 회원 로그인</h3></td> </TR>

	<TR>
		<TD> ID </TD>
		<TD> <INPUT TYPE = "text" name = "id"></TD>
	</TR>
	
	<TR>
		<TD> PW </TD>
		<TD> <INPUT TYPE = "password" name = "pw"></TD>
	</TR>

	<TR>
		<TD COLSPAN = "2" ALIGN = "center">
			<input type = "submit" value = "로그인">&nbsp;&nbsp; 
			<INPUT TYPE = "reset" VALUE = "재입력">
		</TD>
	</TR>
</TABLE>
</form>

</body>
</html>