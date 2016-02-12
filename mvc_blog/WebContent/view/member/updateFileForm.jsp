<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
request.setCharacterEncoding("utf-8"); 
String id=(String)request.getAttribute("id");
String oldfile=(String)request.getAttribute("oldfile");
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
 
<DIV class="title">사진 수정</DIV>
 
<FORM name='frm' 
 method='POST' 
 action='./updateFileProc.do'
 enctype="multipart/form-data">
 
  <input type="hidden" name="id" value="<%=id %>"/> 
  <input type="hidden" name="oldfile" value="<%=oldfile %>"/>
   
  <TABLE class='table'>
    <TR>
      <TH>원본파일</TH>
      <TD>
       <img src=<%=request.getContextPath() %>/view/member/storage/<%=oldfile%>">
       원본파일명:<%=oldfile %>
      </TD>
    </TR>
    <TR>
      <TH>변경파일</TH>
      <TD>
       <input type="file" name="fname">
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>

</body>

</html> 