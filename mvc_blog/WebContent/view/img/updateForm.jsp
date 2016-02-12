<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="model.img.*" %>
<%
ImgDTO dto=(ImgDTO)request.getAttribute("dto");

int imgno = dto.getImgno();
String col = request.getParameter("col");
String word = request.getParameter("word");
String nowPage= request.getParameter("nowPage");


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
<script type="text/javascript">
function input(f){
	
	if(f.wname.value==''){
		alert("이름을 입력하세요");
		f.wname.focus();
		return false;
	}
	if(f.title.value==''){
		alert("제목을 입력하세요");
		f.title.focus();
		return false;
	}
	if(f.content.value==''){
		alert("내용을 입력하세요");
		f.content.focus();
		return false;
	}
	if(f.passwd.value==''){
		alert("비번을 입력하세요");
		f.passwd.focus();
		return false;
	}
	if(f.filename.value==''){
		alert("파일을 선택하세요");
		f.filename.focus();
		return false;
	}else{
	   var fvalue = f.filename.value;
	   var ext = fvalue.slice(fvalue.lastIndexOf(".")+1).toLowerCase();
	   if(!(ext =="gif" || ext =="jpg" || ext == "png")){
		  alert("이미지 파일만 업로드 가능합니다.")
		  f.filename.focus();
		  return false
	   }
	}
	
}
</script>
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
<DIV class='title'>수정</DIV>
 
<Form name='frm' method='POST' action='./updateProc.do' enctype='multipart/form-data'
	onsubmit="return input(this)">
  <input type='hidden' name='imgno' size='30' value='<%=imgno %>'>
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
      <TH>파일변경</TH>
      <TD><input type='file' name='filename' value=''></TD>
    </TR>  
    <TR>
      <TH>패스워드</TH>
      <TD><input type='password' name='passwd' size='40' value=''></TD>
    </TR>    
  </TABLE>
 
  <DIV style='text-align: center; margin-top: 20px; margin-bottom: 20px;'>
    <input type='submit' value='수정'>
    <input type='button' value='취소' onclick="history.back();">
  </DIV>  
</Form>
</body>
</html> 