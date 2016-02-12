<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="model.member.*,utility.*"%>
<% 
MemberDTO dto=(MemberDTO)request.getAttribute("dto");
String root= request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function deleteM(id,oldfile){
	if(confirm("정말탈퇴 하겠습니까?")){
	var url = "delete.do";
	url = url +"?id="+id;
	url = url +"&oldfile="+oldfile;	 
	location.href=url; 
	} 
}
function updateFile(id,oldfile){
	var url ="updateFileForm.do"
	url = url + "?id="+id;
	url = url + "&oldfile="+oldfile;	 
	location.href=url;
}

function updatePW(id){
	var url="updatePasswd.do?id="+id;
	location.href=url;
}
</script>
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<!-- *********************************************** -->

	<DIV class="title"><%=dto.getMname() %>의 회원정보
	</DIV>

	<TABLE class='table'>
		<TR>
			<TD rowspan="4" align="center"><img src="<%=root %>/view/member/storage/<%=dto.getFname()%>" style="max-width: 50%; height: auto;">
			</TD>
		
			<TH>아이디</TH>
			<TD><%=dto.getId() %></TD>
		</TR>
		<tr>
			<th>이름</th>
			<td><%=dto.getMname() %></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=dto.getTel() %></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td colspan="2"><%=dto.getZipcode() %></td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="2"><%=dto.getAddress1() %> <br> <%=Utility.checkNull(dto.getAddress2()) %>
			</td>
		</tr>
		<tr>
			<th>직업</th>
			<td colspan="2" >직업 코드: <%=dto.getJob() %> (<%=Utility.getCodeValue(dto.getJob() )%>)
			</td>
		</tr>
		<tr>
			<th>날짜</th>
			<td colspan="2"><%=dto.getMdate()%></td>
		</tr>
	</TABLE>

	<DIV class='bottom'>
		<input type='button' value='정보수정'
			onclick="location.href='update.do?id=<%=dto.getId()%>'">
		<input type='button' value='사진수정'
			onclick="updateFile('<%=dto.getId()%>','<%=dto.getFname()%>')">
		<input type='button' value='비번수정'
			onclick="updatePW('<%=dto.getId()%>')"> <input type='button'
			value='탈퇴'
			onclick="deleteM('<%=dto.getId()%>','<%=dto.getFname()%>')">
		<input type='button' value='다운로드'
			onclick="location.href='<%=request.getContextPath() %>/download?dir=/view/member/storage&filename=<%=dto.getFname()%>'">
	</DIV>



	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
