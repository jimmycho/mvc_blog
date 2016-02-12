"<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.memo.*" %>
 
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
</head> 
<body> 
<DIV class='title'>처리 결과</DIV>
 
<DIV class='content'>
  <%
  if (cnt == 1){
    out.println("메모를 등록 했습니다.");
  }else{
    out.println("메모 등록에 실패했습니다.");
  }
  %>
  <br>
  <input type='button' value='계속 등록' onclick="location.href='./create.do'">
  <input type='button' value='목록' onclick="location.href='./list.do'">
</DIV>
</body> 
</html> 