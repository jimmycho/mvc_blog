<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="utility.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%
int cnt=(Integer)request.getAttribute("cnt");
String id=(String)request.getAttribute("id");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<!-- *********************************************** -->

	<DIV class="title">사진변경</DIV>

	<DIV class="content">
		<%
			if (cnt == 1) {
				out.print("사진을 변경했습니다.");
			} else {
				out.print("사진변경를 실패했습니다.");
			}
		%>
	</DIV>
	<%
		if (cnt == 1) {
	%>
	<DIV class='bottom'>
		<input type='button' value='나의정보'
			onclick="location.href='read.jsp?id=<%=id%>'">
	</DIV>
	<%
		} else {
	%>
	<DIV class='bottom'>
		<input type='button' value='다시시도' onclick="history.back()">
	</DIV>
	<%
		}
	%>

</body>
</html>
