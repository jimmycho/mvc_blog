<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="model.img.*"%>
<%
	request.setCharacterEncoding("utf-8");

	int imgno = Integer.parseInt(request.getParameter("imgno"));
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");

	ImgDTO dto = (ImgDTO)request.getAttribute("dto");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답변</title>
<style type="text/css">
* {
	font-family: 돋움체;
	font-size: 24px;
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0">
	<DIV class="title">답변</DIV>

	<FORM name='frm' method='post' action='./replyProc.do' enctype='multipart/form-data'>
		<input type='hidden' name='imgno'
			value='<%=request.getParameter("imgno")%>'> 
		<input type='hidden' name='grpno' value='<%=dto.getGrpno()%>'> 
		<input type='hidden' name='indent' value='<%=dto.getIndent()%>'> 
		<input type='hidden' name='ansnum' value='<%=dto.getAnsnum()%>'> 
		<input type='hidden' name='col' size='30' value='<%=col%>'> 
		<input type='hidden' name='word' size='30' value='<%=word%>'> 
		<input type='hidden' name='nowPage' size='30' value='<%=nowPage%>'>
		<TABLE align='center'>
			<TR>
				<TH>제목</TH>
				<TD><input type='text' name='title' value='<%=dto.getTitle()%>'
					size='50'></TD>
			</TR>
			<tr>
			<th>내용</th><td><input type="text" name="content"></td>
			</tr>
			<TR>
				<TH>사진</TH>
				<TD><input type="file" accept="image/*" id="myfile" name="fname"></TD>
			</TR>
			<TR>
				<TH width='15%'>성명</TH>
				<TD width='85%'><input type='text' name='wname' value='홍길동'
					size='50'></TD>
			</TR>
			<TR>
				<TH>패스워드</TH>
				<TD><input type='password' name='passwd' value='1234' size='50'></TD>
			</TR>

		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='등록'> <!-- id="sub" --> 
			<input type='button' value='취소' onclick="location.href='./list.jsp'">
		</DIV>
	</FORM>
	<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#myfile").click(function() {
				var i = document.getElementById("myfile").value
				i = i.slice(indexOf(".") + 1).toLowerCase
				if (i != "jpg" || i != "png") {
					alert("사진파일이 아닙니다.")
					$("#myfile").empty()
					return
				}
			})
		})
	</script>
</body>
</html>
