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
 	if(!form.name.value){
 		alert('학교명을 입력하세요.');
 		form.sname.focus();
 		return false;		
 	}
 	
 	if(!form.major.value){
 		alert('전공을 입력하세요.');
 		form.major.focus();
 		return false;		
 	}
 	
 	if(!form.grade.value){
 		alert('학점을 입력하세요.');
 		form.grade.focus();
 		return false;		
 	}
 	if(!form.cname.value){
 		alert('최종학력을 입력하세요.');
 		form.cname.focus();
 		return false;		
 	}
 		
 	if(!form.date.value){
 		alert('졸업일 입력하세요');
 		form.date.focus();
 		return false;
 	}
 		
 	return true;
 } 
 
 </script>


</head>

<body>

<form action = "UserSchUpdate.jsp" method = "post" name = "form" onsubmit = "return onCheck()">

<table>

<tr> <td colspan = "2" align = "center"> <h3>학사정보 수정</h3> </td> </tr>

<tr> <td>학교명</td> <td> <input type = "text" name = "name" size = "15"  value=${user.getName()} > </td> </tr>

<tr> <td>ID</td> <td> <input type = "text" name = "id" size = "15" readonly value=${user.getId()}> </tr>

<tr> <td>전공</td> <td> <input type = "text" name = "major" size = "15" value=${user.getMajor()}> </tr>

<tr> <td>학점</td> <td> <input type = "text" name = "grade" size = "15" value=${user.getGrade()}> </tr>

<tr> <td>최종학력</td> <td> <input type = "text" name = "cname" size = "15" value=${user.getCname()}> </tr>

<tr> <td>졸업일</td> <td> <input type = "text" name = "date" size = "15" value=${user.getDate()}> </tr>

<tr> <td colspan = "2" align = "center"> <input type = "submit" value = "수정하기"> </td> </tr>

</table>

</form> </body> </html>