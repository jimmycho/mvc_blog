

<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
int cnt=(Integer)request.getAttribute("cnt");    
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
 
<DIV class="title">회원가입 처리</DIV>
 
<DIV class="content">
<%
if(cnt==1){
   out.print("회원가입을 했습니다.");
 
}else{
   out.print("회원가입을 실패했습니다.");
 
}
 
%>
</DIV>
<% if(cnt==1){ %>
<DIV class='bottom'>
  <input type='button' value='로그인' onclick="location.href='login.do'">
  <input type='button' value='홈' onclick="location.href='../index.jsp'">
</DIV>
<%}else{ %>
 <DIV class='bottom'>
  <input type='button' value='다시시도' onclick="history.back()">
  <input type='button' value='홈' onclick="location.href='../index.jsp'">
</DIV>
<%} %>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 