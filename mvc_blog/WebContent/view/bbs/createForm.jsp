<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
 
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
<DIV class="title">등록</DIV>
 
<Form name='frm' method='POST' action='./createProc.do'>
  <TABLE width='50%' class='table'>
    <TR>
      <TH>성명</TH>
      <TD><input type='text' name='wname' size='40' value='성함을 입력하세요'></TD>
    </TR>  
    <TR>
      <TH>제목</TH>
      <TD><input type='text' name='title' size='40' value='제목을 입력하세요'></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><TEXTAREA name='content' rows='10' cols='40'>내용을 입력하세요</TEXTAREA></TD>
    </TR>
    <TR>
      <TH>패스워드</TH>
      <TD><input type='password' name='passwd' size='40' value='123'></TD>
    </TR>    
  </TABLE>
 
  <DIV class='bottom'>
    <input type='submit' value='전송'>
    <input type='button' value='취소' onclick="history.back();"> 
  </DIV>  
</Form>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 