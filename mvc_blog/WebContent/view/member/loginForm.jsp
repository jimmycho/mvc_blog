<%@ page contentType="text/html; charset=UTF-8"%>
<% 
 	request.setCharacterEncoding("utf-8"); 
	String root=request.getContextPath();
	String c_id=(String)request.getAttribute("c_id");
	String c_id_val=(String)request.getAttribute("c_id_val");
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
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<!-- *********************************************** -->

	<DIV class="title">로그인</DIV>

	<FORM name='frm' method='POST' action='<%=root %>/member/loginProc.do'>
		<TABLE class='table'>
			<TR>
				<TH>아이디</TH>
				<TD><input type="text" name="id" size="20"
					value="<%=c_id_val %>"> <% 
       if (c_id.equals("Y")){  // id 저장 상태라면 
       %> <input type='checkbox' name='c_id' value='Y' checked='checked'>
					ID 저장 <% 
       }else{ %> <input type='checkbox' name='c_id' value='Y'>
					ID 저장 <% 
       } 
       %></TD>
			</TR>
			<TR>
				<TH>비밀번호</TH>
				<TD><input type="password" name="passwd" size="20"></TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='로그인'> <input type='button'
				value='회원가입' onclick="location.href='agreement.jsp'">
		</DIV>
	</FORM>
</body>
</html>
