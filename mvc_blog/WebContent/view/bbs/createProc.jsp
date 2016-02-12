<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%-- <% 
int cnt =(Integer) request.getAttribute("cnt");
%> --%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
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
 
<DIV class='title'>처리 결과</DIV>
 
<DIV class='content'>
<%--   <%
  if (cnt == 1){
    out.println("글을 게시판에 등록했습니다.");
  }else{
    out.println("게시판 등록에 실패했습니다.");
  }
  %> --%>
<c:choose>
<c:when test="${cnt==1}">
글을 게시판에 등록했습니다.
</c:when>
<c:otherwise>
게시판 등록에 실패했습니다.
</c:otherwise>
</c:choose>  
</DIV>
 
<DIV class='bottom'>
  <input type='button' value='계속 등록' onclick="location.href='./create.do'">
  <input type='button' value='목록' onclick="location.href='./list.do'">
 
</DIV>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 