<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*,model.img.*,utility.*"%>
<%  %>
<%
String root=request.getContextPath();
ImgDTO dto=new ImgDTO();
ImgDAO dao=new ImgDAO();
String col = (String)request.getAttribute("col");
String word = (String)request.getAttribute("word");
int nowPage=(Integer)request.getAttribute("nowPage");
List<ImgDTO> list=(List)(request.getAttribute("list"));

String paging = (String)request.getAttribute("paging"); 

   
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이미지 게시판</title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 18px;
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">
function read(imgno){
	var url = "read.do?imgno="+imgno;
	url = url +"&col=<%=col%>";
	url = url +"&word=<%=word%>";
	url = url +"&nowPage=<%=nowPage%> ";

		location.href = url;

	}
</script>
</head>
<body>

	<DIV class="title">이미지 목록</DIV>
	<DIV style='width: 80%; text-align: center; margin: 1px auto;'>
	
		<FORM name='frm' method='post' action="./list.do">
			<SELECT name='col'>
				<!-- 검색할 컬럼 -->
				<OPTION value='wname'<%if (col.equals("wname"))out.print("selected='selected'");%>>작성자</OPTION>
				<OPTION value='title'<%if (col.equals("title"))out.print("selected='selected'");%>>제목</OPTION>
				<OPTION value='content'<%if (col.equals("content"))out.print("selected='selected'");%>>내용</OPTION>
				<OPTION value='total'>전체출력</OPTION>
			</SELECT> 
			<input type='text' name='word' value='<%=word%>'>	<!-- 검색어 -->
			<input type='submit' value='검색'> 
		</FORM>
	</DIV>
	<TABLE class='table'>
		<TR>
			<TH>번호</TH>
			<TH>작성자</TH>
			<TH>제목</TH>
			<TH>조회수</TH>
			<TH>이미지</TH>

		</TR>
		<%

			for (int i = 0; i < list.size(); i++) {
				dto = list.get(i);
			
		%>
		<TR>
			<TD><%=dto.getImgno()%></TD>
			<TD><%=dto.getWname()%></TD>
			<TD>
			<% 			
          	if(dto.getIndent()>0) {           
        		for(int j=0; j<dto.getIndent(); j++) {
               	out.print("&nbsp;&nbsp;");
            	}
	            out.print("[★답변]");
	          }
        	%>			
			<a href="javascript:read('<%=dto.getImgno() %>')">
			<%=dto.getTitle()%>
			</a>
			</TD>
			<TD><%=dto.getViewcnt()%></TD>
			<TD><a
				href="<%=request.getContextPath()%>/download?dir=/img/storage&filename=<%=dto.getFilename()%>">

					<IMG style="max-width: 80px; height: auto;"	src='<%=root%>/view/img/storage/<%=dto.getFilename()%>'>
					<%-- <IMG style="max-width: 80px; height: auto;"	src="./storage/"<%=dto.getFilename()%>'> --%>
			</a></TD>                                                         
		</TR>
		<%
			}
		%>
	</TABLE>
	<DIV style='text-align: center; margin-top: 20px'>
		<input type='button' value='신규등록'
			onclick="location.href='./create.do'">
	</DIV>

	<%=paging%>

</body>
</html>