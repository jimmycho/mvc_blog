<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="utility.*" %>
<% 
int cnt = (Integer)request.getAttribute("cnt");
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
 
<DIV class="title">회원 탈퇴 요청 결과</DIV>
 
<div class="content">
<%
if(cnt==1){
    out.print("탈퇴 되었습니다. 자동 로그아웃됩니다.");
}else{
    out.print("탈퇴가 실패했습니다. ");
}
%>
</div>
<%if(cnt==1){%> 
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
