<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method = "post" action = "idCheck.jsp" name = "idcheckform">
아이디  : <input type = "text" name = "cid">
<input type = "submit" value = "중복확인">
</form>

<% 
if(request.getAttribute("result")!=null) {
	String result = (String)request.getAttribute("result");
	String cid = (String)request.getAttribute("cid");
	
	if(result.equals("true")) { %>
		<script type = "text/javascript">
			alert('이미 사용중인 아이디 입니다.');
			history.go(-1);
		</script>
<%	}else { %>
		<script type = "text/javascript">
			alert('사용 가능한 아이디 입니다.');
			opener.document.form.id.value = "${cid}";
			opener.form.pw.focus();
			window.self.close();
		</script>
<% 	}
} %>	
</body>
</html>