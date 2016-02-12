<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="model.bbs.*" %>

<%
int bbsno = Integer.parseInt(request.getParameter("bbsno"));
String col = request.getParameter("col");
String word = request.getParameter("word");
String nowPage= request.getParameter("nowPage");
BbsDTO dto=(BbsDTO)request.getAttribute("dto");
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
<link href="../css/style.css" rel="Stylesheet" type="text/css"> 
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
<DIV class='title'>수정</DIV>
 
<Form name='frm' method='POST' action='./updateProc.do'>
  <input type='hidden' name='bbsno' size='30' value='<%=bbsno %>'>
  <input type='hidden' name='col' size='30' value='<%=col %>'>
  <input type='hidden' name='word' size='30' value='<%=word %>'>
  <input type='hidden' name='nowPage' size='30' value='<%=nowPage %>'>
  
  <TABLE width='50%' class='table'>
    <TR>
      <TH>제목</TH>
      <TD><input type='text' name='title' size='40' value='<%=dto.getTitle() %>'></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><TEXTAREA name='content' rows='10' cols='40'><%=dto.getContent() %></TEXTAREA></TD>
    </TR>
    <TR>
      <TH>성명</TH>
      <TD><input type='text' name='wname' size='40' value='<%=dto.getWname() %>'></TD>
    </TR>  
    <TR>
      <TH>패스워드</TH>
      <TD><input type='password' name='passwd' size='40' value=''></TD>
    </TR>    
  </TABLE>
 
  <DIV style='text-align: center; margin-top: 20px; margin-bottom: 20px;'>
    <input type='submit' value='전송'>
    <input type='button' value='취소' onclick="history.back();"> 
  </DIV>  
</Form>
</body>
</html> 
