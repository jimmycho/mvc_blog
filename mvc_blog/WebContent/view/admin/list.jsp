<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="model.member.*,java.util.*,utility.*"%>
<% 
   String col=(String)request.getAttribute("col");
   String word=(String)request.getAttribute("word");
   String paging=(String)request.getAttribute("paging");
   List<MemberDTO> list=(List)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>

<link href='../css/style.css' rel='Stylesheet' type='text/css'>

</head>
<body>
	<DIV class="title">회원 목록</DIV>
	<DIV class="content">
		<input type='button' value='회원 등록'
			onclick="location.href='./createForm.jsp'">

		<FORM method="POST" action="./list.jsp">
			<select name="col">
				<option value="mname"
					<%if(col.equals("mname")) out.print("selected='selected'"); %>>성명</option>
				<option value="email"
					<%if(col.equals("email")) out.print("selected='selected'"); %>>이메일</option>
				<option value="id"
					<%if(col.equals("id")) out.print("selected='selected'"); %>>아이디</option>
				<option value="total"
					<%if(col.equals("total")) out.print("selected='selected'"); %>>전체출력</option>
			</select> <input type="text" name="word" value="<%=word %>"> <input
				type="submit" value="검색" />
		</FORM>
	</DIV>
	<%
for(int i=0; i < list.size(); i++){ 
  MemberDTO dto = list.get(i);   
%>
	<TABLE border='1' align='center' width='70%'>
		<TR>
			<TD rowspan='5' width='20%' align="center"><IMG
				src='../view/member/storage/<%=dto.getFname() %>' width='100%'></TD>
			<TH width='20%'>아이디</TH>
			<TD width='60%'><A href='../member/read.do?id=<%=dto.getId() %>'><%=dto.getId() %></A></TD>
		</TR>
		<TR>
			<TH>성명</TH>
			<TD><%=dto.getMname() %></TD>
		</TR>
		<TR>
			<TH>전화번호</TH>
			<TD><%=dto.getTel() %></TD>
		</TR>
		<TR>
			<TH>이메일</TH>
			<TD><%=dto.getEmail() %></TD>
		</TR>
		<TR>
			<TH>주소</TH>
			<TD><%=dto.getAddress1() %> <% if (dto.getAddress2() != null){
             out.print(dto.getAddress2());
           } 
        %></TD>
		</TR>

	</TABLE>
	<BR>
	<% 
} 
%>
	<DIV class="bottom">
		<%=paging %>
	</DIV>
</body>
</html>