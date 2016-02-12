<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %> 
<%
String id = request.getParameter("id");
int cnt=(Integer)request.getAttribute("cnt");
System.out.println("cnt:"+cnt);
%>
<!DOCTYPE html> 
<html> 
<script type="text/javascript">
function use(){
	opener.frm.id.value='<%=id%>';
	self.close();	
}

</script>
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style>
 
<link href='../css/style.css' rel='Stylesheet' type='text/css'> 
 
</head> 
<body> 
 
<DIV class='title'>아이디 중복 확인</DIV> 
  
<DIV class='content'>
  입력된 ID: <%=id %><br><br>
  
  <%
  if (cnt == 1){
    out.println("중복되어 사용할 수 없습니다.<br><br>");
  }else{
    out.println("중복 아님, 사용 가능합니니다.<br><br>");
  }
  %>
 
</DIV>
 
<DIV class="bottom"> 
<%if(cnt!=1){ %>
  <input type='button' value='사용' onclick='use()'>
<%} %>
  <input type='button' value='다시시도' onclick="location.href='id_form.do'">
  <input type='button' value='닫기' onclick="window.close();">
 
</DIV> 
 
 
</body> 
</html> 