<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
 <head>
  <meta charset="utf-8" />
  <title> 회원정보 입력 양식 </title>
  <style>
   	 body,html{width:100%, height:100%}  

	 table{
		position:relative; 
		left:50%; 
		transform:translate(-50%, 0%);
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
function idSearch(){
    theURL = "id.jsp";
    window.open(theURL,'id_check','width=500,height=200');
}

function onCheck() {	
 	if(!form.id.value){
 		alert('아이디를 입력하세요.');
 		form.id.focus();
 		return false;		
 	}
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
 	
 	if(!(form.gender[0].checked||form.gender[1].checked)){
 		alert('성별을 선택하세요');
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

 <BODY> 
 <P ALIGN="center"> 
    <FONT SIZE="3"> <br>개인 회원 신규 등록</FONT> 
  </P> 
   <FORM ACTION = "join.jsp" METHOD = post name = "form" onsubmit = "return onCheck()">   
	<TABLE CELLPADDING="6">      
	  <TR>   
	   <TD> ID </TD>   
	   <TD> <INPUT TYPE="text" NAME="id" SIZE="10" readonly> <input type = "button" Value = "중복확인" onclick = "idSearch()"></TD> 
	  </TR> 
	  
	  <TR>
	   <TD> PW </TD>   
	   <TD> <INPUT TYPE="password" NAME="pw" SIZE="10"></TD> 
	  </TR> 
	  
	  <TR>
	   <TD> PW 재입력 </TD>   
	   <TD> <INPUT TYPE="password" NAME="pw2" SIZE="10"></TD> 
	  </TR> 
	  
	  <TR>   
	   <TD> 이름 </TD>   
	   <TD> <INPUT TYPE="text" NAME="name" SIZE="10"></TD> 
	  </TR> 
	   
	  <TR>   
	   <TD> 전화번호 </TD>   
	   <TD> <SELECT NAME="tel1">     
			   <OPTION SELECTED> 010</OPTION>     
			   <OPTION> 02</OPTION>     
			   <OPTION> 053</OPTION>     
			   <OPTION> 011</OPTION>     
		    </SELECT>
		   - <INPUT NAME="tel2" pattern = "\d{3,4}" SIZE="4" maxlength=4>
		   - <INPUT NAME="tel3" pattern = "\d{4}" SIZE="4" maxlength=4> </TD> 
	  </TR>
	  
	  <TR>   
	   <TD> 성별 </TD>   
	   <TD> <INPUT TYPE="radio" NAME="gender" VALUE="남자">남자&nbsp;&nbsp;       
	        <INPUT TYPE="radio" NAME="gender" VALUE="여자">여자 </TD> 
	  </TR>
	 
	  <TR>   
	   <TD> 생년월일 </TD>   
	   <TD> <input name="birth" pattern = "\d{2}/\d{2}/\d{2}" PLACEHOLDER="00/01/01"/></TD> 
	  </TR>
	 
	  <TR>   
	   <TD COLSPAN="2" ALIGN="center"> 
	   		<INPUT TYPE="submit" VALUE="등록하기">&nbsp;&nbsp;     
	      	<INPUT TYPE="reset" VALUE="취소하기"> 
	   </TD> 
	  </TR> 
	</TABLE> 
  </FORM>
 </BODY> 
</html>
