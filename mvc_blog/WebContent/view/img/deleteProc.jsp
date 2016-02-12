<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.img.*" %>
 
<% 
request.setCharacterEncoding("utf-8"); 
int imgno =Integer.parseInt(request.getParameter("imgno"));
String oldfile = request.getParameter("oldfile");
String passwd = request.getParameter("passwd");

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
<script type="text/javascript">
function listB(){
	var url = "list.do?imgno=<%=imgno%>";
	url = url +"&oldfile=<%=oldfile%>";
	url = url +"&passwd=<%=passwd%>";
	
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
 
<DIV class="title">이미지삭제</DIV>
 
<div class="content">
<%
if(cnt==1){
    out.print("이미지가 삭제되었습니다.");
 
}else{
    out.print("패스워드 오류입니다.");
}
 
%>
</div>
<%if(cnt==1){%> 
<DIV class='bottom'>
    <input type='button' value='목록' onclick="listB()">

</DIV>
<%}else{ %>
<DIV class='bottom'>
  <input type='button' value='다시시도' onclick="history.back()">
</DIV>
<%} %> 
 
</body>
</html> 