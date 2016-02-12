<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); 
	String id = (String)session.getAttribute("id");  
	String grade=(String)session.getAttribute("grade");
	String title="나의 여행 블로그";
		if(id!=null && grade.equals("A")){
		   title="관리자 페이지";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family:;
	font-size: 24px;
}
</style>
<link href="css/style.css" rel="stylesheet">
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<jsp:include page="/template/header.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title"><%=title%></DIV>

	<DIV class='content'>
		<IMG src='./images/topimage.jpg' width='50%'><br>

		<%  
  
   
  if (id == null){%>
		<input type='button' value='로그인'
			onclick="location.href='./member/login.do'">
		<% 
  }else{%>
		<input type='button' value='로그아웃'
			onclick="location.href='./member/logout.do'">
		<% 
  }%>

	</DIV>

	<DIV class="bottom"></DIV>

	<!-- *********************************************** -->
	<jsp:include page="/template/footer.jsp"  flush="false" />
</body>
<!-- *********************************************** -->

</html>
