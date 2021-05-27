<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav>
	<ul>
		<li> <a href = "idx_Jsp.jsp?idx=home">Home</a></li>
		
	<%
	Object s_name = session.getAttribute("user_name");
	Object s_id = session.getAttribute("user_id");
	
	session.setAttribute("user_id", s_id);
	
	if(session.getAttribute("user_id") == null) {
		out.println("<li> <a href = 'idx_Jsp.jsp?idx=LoginForm'>로그인</a></li>");
		out.println("<li> <a href = 'idx_Jsp.jsp?idx=joinForm'>회원가입</a></li>");
	
	}else {
		out.println("<li> <a href = 'idx_Jsp.jsp?idx=UserInfoView'>개인정보 조회</a></li>");
		out.println("<li> <a href = 'idx_Jsp.jsp?idx=UserSchView'>학적관리</a></li>");
		out.println("<li> <a href = 'idx_Jsp.jsp?idx=UserTestList'>시험관리</a></li>");
		out.println("<li> <a href = 'idx_Jsp.jsp?idx=UserCertList'>자격관리</a></li>");
		out.println("<li> <a href = ''>원서작성</a></li>");
		out.println("<li> <a href = 'logout.jsp'>로그아웃</a></li>");
	} %>

	</ul>

</nav>