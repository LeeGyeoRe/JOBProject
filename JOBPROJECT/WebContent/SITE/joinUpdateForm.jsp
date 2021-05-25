<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보 변경</title>

<style>
   	 body,html{width:100%, height:100%}  

	 table{
		position:relative; 
		left:50%; 
		transform:translate(-50%, 50%);
		cellpadding : 10px;
	 }
	 td:nth-child(odd) {
		background:#EAEAEA;
	 }
	 td:nth-child(even) {
		background:rgba(32,52,58,.2);
	 }
	 #last{
	    background:white;
	}
 </style>

<script>
function onCheck() {	
 	if(!form.pw.value){
 		alert('비밀번호를 입력하세요.');
 		form.pw.focus();
 		return false;		
 	}
 	
 	if(!form.pw2.value){
 		alert('비밀번호를 재입력하세요.');
 		form.pw2.focus();
 		return false;		
 	}
 	
 	if(form.pw.value != form.pw2.value){
		alert('두 PW가 일치하지 않습니다. 다시 입력하세요');
		form.pw2.focus();
		return false;
	}
 	
 	if(!form.name.value){
 		alert('이름을 입력하세요.');
 		form.name.focus();
 		return false;		
 	}
 	if(!form.tel2.value || !form.tel3.value){
 		alert('전화번호를 입력하세요.');
 		form.tel2.focus();
 		return false;		
 	}
 		
 	if(!form.birth.value){
 		alert('생년월일을 입력하세요');
 		form.birth.focus();
 		return false;
 	}
 		
 	return true;
 } 
 
 </script>


</head>

<body>

<form action = "joinUpdate.jsp" method = "post" name = "form" onsubmit = "return onCheck()">

<table>

<tr> <td colspan = "2" align = "center"> <h3>회원정보 수정</h3> </td> </tr>

<tr> <td>ID</td> <td> <input type = "text" name = "id" size = "15" readonly value=${user.getId()} > </td> </tr>

<tr> <td>PW</td> <td> <input type = "password" name = "pw" size = "15" value=${user.getPw()}> </tr>

<tr> <td>PW 재입력</td> <td> <input type = "password" name = "pw2" size = "15" value=${user.getPw()}> </tr>

<tr> <td>이름</td> <td> <input type = "text" name = "name" size = "15" value=${user.getName()}> </tr>

<tr> <td>생일</td> <td> <input type = "text" name = "birth" pattern = "\d{2}/\d{2}/\d{2}" size = "15" value=${user.getBirth()}> </tr>

<tr> <td>전화번호</td> <td> <input type = "text" name = "tel" size = "15" value=${user.getTel()}> </tr>

<tr> <td colspan = "2" align = "center"> <input type = "submit" value = "수정하기"> </td> </tr>

</table>

</form> </body> </html>