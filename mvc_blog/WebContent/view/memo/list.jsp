<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List,model.memo.MemoVO" %>
<%
	String word = (String) request.getAttribute("word");
	String col = (String) request.getAttribute("col");
	int nowPage = (Integer)request.getAttribute("nowPage");
	List<MemoVO> list = (List) request.getAttribute("list");
	String paging = (String) request.getAttribute("paging");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메모목록</title>

<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function read(memono) {
/* 	var openNewWindow=window.open("about:blank"); 
	openNewWindow.location.href='read.jsp?memono='+memono;	 */
	var url = "read.do?memono="+memono;
	url = url +"&col=<%=col%>";
	url = url +"&word=<%=word%>";
	url = url +"&nowPage=<%=nowPage%>";
	location.href=url;
}
</script>
</head>
<body>
	<DIV class='title'>메모 목록</DIV>
<DIV style='width: 80%; text-align: center; margin: 1px auto;'>
		<FORM name='frm' method='post' action="./list.do">
			<SELECT name='col'>
				<!-- 검색할 컬럼 -->
				<OPTION value='title'
					<%if (col.equals("title")) out.print("selected='selected'");%>>제목</OPTION>
				<OPTION value='content' 
				    <%if (col.equals("content"))out.print("selected='selected'");%>>내용</OPTION>
				<OPTION value='total'>전체출력</OPTION>
			</SELECT> 
			
			<input type='text' name='word' value='<%=word %>'> <!-- 검색어 -->
			<input type='submit' value='검색'> <input type='button'
				value='등록' onclick="location.href='./createForm.do'">
		</FORM>
	</DIV>
	<TABLE class='table'>
		<TR>
			<TH>번호</TH>
			<TH>제목</TH>
			<TH>내용</TH>
			<TH>작성일</TH>
			<TH>조회수</TH>
		</TR>

		<%
  if (list.size() == 0){
  %>
		<TR>
			<TD colspan='4'>등록된 메모가 없습니다.</TD>
		</TR>
		<%
  }else{
    for(int i=0;i<list.size();i++){
    	MemoVO vo=list.get(i);
    %>
		<TR>
			<TD><%=vo.getMemono()%></TD>
			<TD><a target="_blank" href="javascript:read('<%=vo.getMemono() %>')" > <%=vo.getTitle() %></a>
			</TD>
			<td><%=vo.getContent() %></td>
			<TD><%=vo.getWdate().substring(0, 10) %></TD>			
			<TD><%=vo.getViewcnt() %></TD>
		</TR>
		<%
    } 
  } // if END
  %>

	</TABLE>
	<DIV style='text-align: center; margin-top: 20px'>
		<input type='button' value='등록'
			onclick="location.href='./create.do'">
			<%=paging %>
	</DIV>
	
</body>
</html>

