<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>

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
 
<DIV class="title">이미지 등록 처리</DIV>
 
<DIV class="content">
<%
if(cnt==1){
   out.print("이미지 등록 완료 했습니다.");
 
}else{
   out.print("이미지 등록을 실패했습니다.");
 
}
 
%>
</DIV>
<% if(cnt==1){ %>
<DIV class='bottom'>
  <input type='button' value='전체목록보기' onclick="location.href='./list.do'">
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
 
 
 