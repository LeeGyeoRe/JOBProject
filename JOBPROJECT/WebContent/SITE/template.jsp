<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<meta charset = "UTF-8">
<link rel = "stylesheet" type = "text/css" href = "common.css">
<body>
<div class = "container">
	<jsp:include page = "header.jsp"/>

	<div class = "content">
				
		<div class = "main">
			<jsp:include page = "${target}.jsp"/>			
		</div>
		
		<jsp:include page = "nav.jsp"/>
	</div>
	
	<jsp:include page = "footer.jsp"/>
</div>
</body>
</html>