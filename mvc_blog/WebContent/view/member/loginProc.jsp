<%@ page contentType="text/html; charset=UTF-8"%>
<%
String root=request.getContextPath();
int cnt=(Integer)request.getAttribute("cnt");
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
<link href="<%=root %>/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body leftmargin="0" topmargin="0">
	<DIV class="title">로그인 처리</DIV>

	<div class="content">
		<% 
if(cnt==1){
    out.print("로그인이 되었습니다.~~~");
}else{
    out.print("id와 passwd가 일치하지 않습니다.");    
}
%>
	</div>
	<% if(cnt==1){ %>
	<DIV class='bottom'>
		<input type='button' value='홈' onclick="location.href='../index.jsp'">
	</DIV>
	<%}else{ %>
	<DIV class='bottom'>
		<input type='button' value='다시시도' onclick="history.back()">
	</DIV>
	<%} %>
</body>
</html>
