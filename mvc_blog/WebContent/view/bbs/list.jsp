<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*,model.bbs.*,utility.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<% request.setCharacterEncoding("utf-8"); %>
<%-- <%
//---------------------------------------------------------------------------------- 
//검색 관련 부분 
//---------------------------------------------------------------------------------- 
//검색어 추출, null --> "" 
String col = (String)request.getAttribute("col");
String word = (String)request.getAttribute("word");
int nowPage=(Integer)request.getAttribute("nowPage");
List<BbsDTO> list = (List)request.getAttribute("list");
String paging=(String)request.getAttribute("paging");
%> --%>
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
function read(bbsno){
	var url = "read.do?bbsno="+bbsno;
	url = url +"&col=${col}";
	url = url +"&word=${word}";
	url = url +"&nowPage=${nowPage}";
	
	location.href=url;
	
}
</script>
</head>
<body>

<DIV class='title'>게시판 목록</DIV>

<DIV style='width: 80%; text-align: center; margin: 1px auto;'>
	<FORM name='frm' method='post' action="./list.do">
		<SELECT name='col'>
		<!-- 검색할 컬럼 -->
		<OPTION value='wname'<c:if test="${col=='wname'}">selected='selected'</c:if>>성명</OPTION>
		<OPTION value='title'<c:if test="${col=='title'}">selected='selected'</c:if>>제목</OPTION>
		<OPTION value='content'<c:if test="${col=='content'}">selected='selected'</c:if>>내용</OPTION>
		<OPTION value='total'>전체출력</OPTION>
		</SELECT> <input type='text' name='word' value='${word}'>
		
		<!-- 검색어 -->
		<input type='submit' value='검색'> <input type='button'
			value='등록' onclick="location.href='./createForm.do'">
	</FORM>
</DIV>
	<TABLE class='table'>
		<TR>
			<TH>번호</TH>
			<TH>제목</TH>
			<TH>성명</TH>
			<TH>조회수</TH>
			<TH>등록일</TH>
			<TH>grpno</TH>
			<TH>indent</TH>
			<TH>ansnum</TH>
		</TR>
<%-- <% if (list.size() == 0){ %> --%>
<c:choose>
<c:when test="${empty list }">
		<TR>
			<TD colspan='8' align='center'>등록된 글이 없습니다.</TD>
		</TR>
</c:when>
<%-- <% }else{
    for(int index=0; index <list.size(); index++){
      BbsDTO dto = list.get(index);
%> --%>
<c:otherwise>
	<c:forEach var="dto" items="${list }" >
		<TR>
			<TD>${dto.bbsno }</TD>
			<TD>
			<c:forEach begin="1" end="${dto.indent }">
			<c:out value="&nbsp;&nbsp" escapeXml="false"></c:out>
			</c:forEach>
			<c:if test="${dto.indent>0 }">
			[답변]
			</c:if>
				<%-- <% if(dto.getIndent()>0) { 
        			for(int j=0; j<dto.getIndent(); j++) {
               		out.print("&nbsp;&nbsp;");
            		}
            			out.print("[답변]");
          			} %> --%>

          	<A href="javascript:read('${dto.bbsno}')"> ${dto.title }
			</A> 
			<%-- <% if(Utility.compareDay(dto.getWdate().substring(0,10))){ %> --%> 
			<c:if test="${util:newImg(dto.wdate) }"></c:if>
			
			
			<img src="${pageContext.request.contextPath}/images/new.gif"> 
		<%-- 	<% } %> --%>
			</TD>
			<TD>${dto.wname}</TD>
			<TD>${dto.viewcnt}</TD>
			<TD>${dto.wdate}</TD>
			<TD>${dto.grpno}</TD>
			<TD>${dto.indent}</TD>
			<TD>${dto.ansnum}</TD>
		</TR>
<%-- <%
}; // for END
} // if END
%> --%>
  </c:forEach>
  </c:otherwise>
  </c:choose>
	</TABLE>
	<DIV style='text-align: center; margin-top: 20px'>
		<input type='button' value='등록'
			onclick="location.href='./createForm.do'">
		${paging }
	</DIV>
</body>
</html>