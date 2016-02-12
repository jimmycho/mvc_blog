<%@ page contentType="text/html; charset=UTF-8"%>

<%
	int cnt = (Integer) request.getAttribute("cnt");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	font-family: 돋움체;
	font-size: 24px;
}
</style>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>

<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<!-- *********************************************** -->

	<DIV class='title'>패스 워드 수정 처리</DIV>

	<DIV class='content'>

		<%
			if (cnt == 1) {
		%>
		패스워드를 변경했습니다.<br> 로그인해보세요~~~<br> <br> <input
			type='button' value='홈' onclick="location.href='../index.jsp'">
		<%
			} else {
		%>
		패스워드 변경에 실패 했습니다.<br> <br> <br> <input type='button'
			value='다시 시도' onclick="history.back();"> <input type='button'
			value='홈' onclick="location.href='../index.jsp'">
		<%
			}
			if (session.getAttribute("id") != null
					&& session.getAttribute("grade").equals("A")) {
		%>
		<input type='button' value='목록'
			onclick="location.href='../admin/list.do'">
		<%
			}
		%>


	</DIV>

	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
