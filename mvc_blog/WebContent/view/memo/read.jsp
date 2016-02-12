<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.memo.*"%>

<%  request.setCharacterEncoding("utf-8");  
MemoVO dto=(MemoVO)request.getAttribute("dto");
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
function updateMemo(){
var url="./update.do";
url = url + "?memono=<%=dto.getMemono()%>";
location.href=url;
 
}
function deleteMemo(){
var url="./delete.do";
url = url + "?memono=<%=dto.getMemono()%>";
location.href=url;
 
}
</script> 
</head> 
<body> 
<DIV style='font-size: 24px; text-align: center; text-decoration: underline; margin-top: 0px; margin-bottom: 20px;'>
  조회
</DIV>
 
<TABLE align='center' border='1px' cellpadding='10px' cellspacing='0px'>
  <TR>
    <TH>제목</TH>
    <TD><%=dto.getTitle() %></TD>
  </TR>
  <TR>
    <TH>내용</TH>
    <TD><%=dto.getContent() %></TD>
  </TR>
  <TR>
    <TH>조회수</TH>
    <TD><%=dto.getViewcnt() %></TD>
  </TR>
  <TR>
    <TH>등록일</TH>
    <TD><%=dto.getWdate() %></TD>
  </TR>
  
</TABLE>
 
<DIV style='text-align: center; margin-top: 20px'>
  <input type='button' value='등록' onclick="location.href='./create.do'">
  <input type='button' value='목록' onclick="location.href='./list.do'">
  <input type='button' value='수정' onclick="updateMemo()">
  <input type='button' value='삭제' onclick="deleteMemo()">
</DIV>
</body> 
</html> 