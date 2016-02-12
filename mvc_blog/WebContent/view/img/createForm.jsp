<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
* {
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

<body leftmargin="0" topmargin="0">
	<DIV class="title">신규등록</DIV>

	<FORM name='frm' method='POST' action='./createProc.do' enctype='multipart/form-data'
	onsubmit="return input(this)">
		<!-- 데이터가 모두 입력되었는지 검사하는 자바스크립트 함수이고 this는 form을 나타냄 -->

		<TABLE width='50%' class='table'>
			<TR>
				<TH>성명</TH>
				<TD><input type='text' name='wname' size='40' value='이름입력'></TD>
			</TR>
			<TR>
				<TH>제목</TH>
				<TD><input type='text' name='title' size='40' value='제목입력'></TD>
			</TR>
			<TR>
				<TH>내용</TH>
				<TD><TEXTAREA name='content' rows='10' cols='40'>내용입력</TEXTAREA></TD>
			</TR>
			<TR>
				<TH>패스워드</TH>
				<TD><input type='password' name='passwd' size='40' value='123'></TD>
			</TR>
			<TR>
				<TH>파일</TH>
				<TD><input type='file' name='filename' size='40'></TD>
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