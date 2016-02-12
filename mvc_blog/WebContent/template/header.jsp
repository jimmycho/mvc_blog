<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String root = request.getContextPath();
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
%>

<html>

<head>
<link href="css/style.css" rel="stylesheet">
<style type="text/css">
* {
	font-family:;
	font-size: 24px;
}
</style>
<style type="text/css">
ul#menu li {
	display: inline; background-color: silver
}

ul#menu li a {
	background-color: white;
	color: black;
	pading: 10px 20px;
	text-decoration: none;
	border-radius: 4px 4px 0 0;
}

ul#menu li a:hover {
	background-color: orange;
}

li#admin {

	float: right;
	padding-right: 30px
}
</style>
<title>MVC_Board</title>
</head>

<!-- 상단 메뉴 -->
<div ">
<!-- index 페이지의 경계선 영역제어 -->

<img src="<%=root %>/images/main.jpg" width='100%'height='100'>

	<table style="width: 100%">
		<tr>
			<td align="center" bgcolor="black">
				<ul id="menu">
					<li><a href="<%=root%>/index.jsp">홈</a></li>
					<%
						if (id == null) {
					%>
					<li><a href="<%=root%>/member/login.do">로그인</a></li>
					<li><a href="<%=root%>/view/member/agreement.jsp">회원가입</a></li>
					<li><a href="<%=root%>">아이디찾기</a></li>
					<li><a href="<%=root%>">비번찾기</a></li>
					<%
						} else {
					%>
					<li><a href="<%=root%>/member/logout.do">로그아웃</a></li>
					<li><a href="<%=root%>/member/read.do">회원정보</a></li>
					<li><a href="<%=root%>/member/update.do">회원수정</a></li>
					<li><a href="<%=root%>/member/delete.do">회원탈퇴</a></li>
					<%
						}
					%>
					<li><a href="<%=root%>/bbs/list.do">게시판목록</a></li>
					<li><a href="<%=root%>/bbs/create.do">게시판생성</a></li>
					<li><a href="<%=root%>/memo/list.do">메모목록</a></li>
					<li><a href="<%=root%>/memo/create.do">메모생성</a></li>
					<li><a href="<%=root%>/img/list.do">[이미지목록]</a></li>
					<li><a href="<%=root%>/img/create.do">[이미지생성]</a></li>
					<%
						if (id != null && grade.equals("A")) {
					%>
					<li id="admin"><a href="<%=root%>/admin/list.do">회원목록</a></li>
					<%
						}
					%>
				</ul>
			</td>
		</tr>
	</table>
</div>
<!-- 상단 메뉴 끝 -->


<!-- 내용 시작 -->
<!-- <div style="width: 100%; padding-top: 0px; padding-bottom: 0px"> -->