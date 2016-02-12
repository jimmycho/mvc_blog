<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="model.bbs.*"%>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	BbsDTO dto = (BbsDTO) request.getAttribute("dto");
%>

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
function listB(){
	var url="list.do?col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href=url;
}
function updateB(){
	var url="updateForm.do?bbsno=<%=bbsno%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href=url;
}
function deleteB(){
	var url="delete.do?bbsno=<%=bbsno%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href=url;	
}

function reply(){
	var url="reply.do?bbsno=<%=bbsno%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href=url;	
}
</script>
</head>

<body leftmargin="0" topmargin="0">

	<DIV style='font-size: 24px; text-align: center; text-decoration: underline; 
		margin-top: 10px; margin-bottom: 20px;'>조회</DIV>
	<TABLE align='center' border='1px' cellpadding='10px' cellspacing='0px'>
		<TR>
			<TH>제목</TH>
			<TD><%=dto.getTitle()%></TD>
		</TR>
		<TR>
			<TH>내용</TH>
			<TD><%=dto.getContent()%></TD>
		</TR>
		<TR>
			<TH>성명</TH>
			<TD><%=dto.getWname()%></TD>
		</TR>
		<TR>
			<TH>조회수</TH>
			<TD><%=dto.getViewcnt()%></TD>
		</TR>
		<TR>
			<TH>등록일</TH>
			<TD><%=dto.getWdate()%></TD>
		</TR>
	</TABLE>
	<DIV style='text-align: center; margin-top: 20px'>
		<input type='button' value='등록'
			onclick="location.href='./createForm.do'"> <input
			type='button' value='목록' onclick="listB()"> <input
			type='button' value='수정' onclick="updateB()"> <input
			type='button' value='삭제' onclick="deleteB()"> <input
			type='button' value='답글' onclick="reply()">
	</DIV>
</body>
</html>