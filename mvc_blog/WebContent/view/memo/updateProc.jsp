<%@ page contentType="text/html; charset=UTF-8" %>
<% 
int memono=Integer.parseInt(request.getParameter("memono"));
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
<script type="text/javascript">
function readMemo(){
var url = "./read.do";
url = url + "?memono=<%=memono%>";
 
location.href= url;
}
</script> 
</head> 
<body> 
<DIV style='font-size: 24px; text-align: center; margin-top: 100px;'>
  <%
  if (cnt == 1){
    out.println("메모를 수정 했습니다.");
  }else{
    out.println("메모 수정에 실패했습니다.");
  }
  %>
  <br>
  <input type='button' value='조회' onclick="readMemo()">
  <input type='button' value='목록' onclick="location.href='./list.do'">
</DIV>
 
</body> 
</html> 