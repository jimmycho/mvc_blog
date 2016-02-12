<%@ page contentType="text/html; charset=UTF-8" %> 
 
<%
int imgno = Integer.parseInt(request.getParameter("imgno"));
String col = request.getParameter("col");
String word = request.getParameter("word");
String nowPage = request.getParameter("nowPage");
String oldfile = request.getParameter("oldfile");
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
<DIV class='title'>삭제</DIV>
 
<DIV class='content'>
<Form name='frm' method='POST' action='./deleteProc.do'>
  <input type='hidden' name='imgno' size='30' value='<%=imgno %>'>
  <input type='hidden' name='col' size='30' value='<%=col %>'>
  <input type='hidden' name='word' size='30' value='<%=word %>'>
  <input type='hidden' name='nowPage' size='30' value='<%=nowPage %>'>
  <input type='hidden' name='oldfile' size='30' value='<%=oldfile %>'>
  삭제하면 복구 할 수 없습니다.<br><br>
  <TABLE width='50%' class='table'>
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
</DIV>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 