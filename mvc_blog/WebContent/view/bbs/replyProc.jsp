<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("utf-8"); %>
<%-- <%
String col = request.getParameter("col");
String word = request.getParameter("word");
String nowPage = request.getParameter("nowPage");
%> 
<% 
int cnt=(Integer)request.getAttribute("cnt"); 
%>  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: 돋움체; 
  font-size: 24px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css"> 
<script type="text/javascript">
function listB(){
	var url = "list.do?col=${param.col}";
	url = url +"&word=${param.word}";
	url = url +"&nowPage=${param.nowPage}";
	
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** --> 
<DIV class="title">답변 등록 처리</DIV> 
 
<DIV class='content'> 
<c:choose>
	<c:when test="${cnt==1 }">
		답변을 등록했습니다.
		<input type='button' value='계속 등록' onclick="location.href='./create.do'"> 
	  	<input type='button' value='목록' onclick="listB()">
	</c:when>
	<c:otherwise>
		답변 등록에 실패했습니다.
		<br><br> 
		  <input type='button' value='다시 시도' onclick="history.back();"> 
		  <input type='button' value='목록' onclick="listB()">
	</c:otherwise>
</c:choose>
<%-- <% 
if (cnt == 1){%> 
  답변을 등록했습니다.<br><br> 
  <input type='button' value='계속 등록' onclick="location.href='./create.do'"> 
  <input type='button' value='목록' onclick="listB()"> 
   
<% 
}else{ 
%> 
  답변 등록에 실패했습니다.
  
  <br><br> 
  <input type='button' value='다시 시도' onclick="history.back();"> 
  <input type='button' value='목록' onclick="listB()"> 
 
<%} %> --%> 
</DIV> 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 