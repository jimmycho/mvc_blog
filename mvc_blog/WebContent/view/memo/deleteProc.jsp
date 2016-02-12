<%@ page contentType="text/html; charset=UTF-8" %> 
<%
int cnt =(Integer)request.getAttribute("cnt");

%> 

 
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
</head> 
<body> 
<DIV style='font-size: 24px; text-align: center; margin-top: 100px;'>
  <%
  if (cnt == 1){
    out.println("메모를 삭제 했습니다.");
  }else{
    out.println("메모 삭제에 실패했습니다.");
  }
  %>
  <br>
  <input type='button' value='목록' onclick="location.href='./list.do'">
</DIV>
</body> 
</html> 