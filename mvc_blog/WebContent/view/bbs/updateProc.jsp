<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
	request.setCharacterEncoding("UTF-8");
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	int cnt = (Integer) request.getAttribute("cnt");
%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript"> 
function listB(){
	var url="list.do?col=${param.col}";
	url = url +"&word=${param.word}";
	url = url +"&nowPage=${param.nowPage}";
	location.href=url;
}
function read(){
	var url = "read.do?bbsno=${param.bbsno}";
	url = url +"&col=${param.col}";
	url = url +"&word=${param.word}";
	url = url +"&nowPage=${param.nowPage}";
	location.href = url;
	}
</script>
</head>
<body leftmargin="0" topmargin="0">
	<DIV class='title'>처리 결과</DIV>
	<DIV class='content'>
	<c:choose>
	<c:when test="${cnt==1 }">
	글을 변경했습니다.
	<DIV class='bottom'>
			<input type='button' value='변경 확인' onclick="read()"> <input
				type='button' value='목록' onclick="listB()">
		</DIV>
	</c:when>
	<c:otherwise>
	패스워드가 일치하지 않습니다.
	<DIV class='bottom'>
			<input type='button' value='다시 시도' onclick="history.back();">
			<input type='button' value='목록' onclick="listB()">
		</DIV>
	</c:otherwise>
	
	</c:choose>
	
		<%-- <%
			if (cnt == 1) {
		%>
		글을 변경했습니다.<br> <br>
		<DIV class='bottom'>
			<input type='button' value='변경 확인' onclick="read()"> <input
				type='button' value='목록' onclick="listB()">
		</DIV>
		<%
			} else {
		%>
		패스워드가 일치하지 않습니다.<br>
		<DIV class='bottom'>
			<input type='button' value='다시 시도' onclick="history.back();">
			<input type='button' value='목록' onclick="listB()">
		</DIV>
		<%
			}
		%> --%>
	</DIV>
</body>
</html>
