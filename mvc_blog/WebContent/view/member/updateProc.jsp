<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %>
 
<%
String id=request.getParameter("id"); //UpdateProcAction.java 에서 포워드 처리하였으므로
									  //request.getParameter로 받을수 있다
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
 
<DIV class="title">정보수정</DIV>
 
<div class="content">
<%
if(cnt==1){
   out.print("정보수정을 완료하였습니다.");
}else{
   out.print("정보수정에 실패했습니다.");
}
 
%>
</div>
 
<% if(cnt==1){ %>  
<DIV class='bottom'>
  <input type='button' value='정보확인' 
  onclick="location.href='read.do?id=<%=id%>'">
</DIV>
<%}else{ %>
 <DIV class='bottom'>
  <input type='button' value='다시시도' 
  onclick="history.back()">
</DIV>
<%} %>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 