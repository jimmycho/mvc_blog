<%@ page contentType="text/html; charset=UTF-8"%>

<% String root = request.getContextPath(); 
	String id=(String)session.getAttribute("id");
	String grade=(String)session.getAttribute("grade");
%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=2">
<!-- <link href="css/style2.css" rel="stylesheet"> -->

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<style type="text/css">
ul#menu li {
	display: inline-block;
	font-size: 2pt;
	font: italic;
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
	fload: right;
	padding-right: 30px
}
</style>

</head>

<!-- 상단 메뉴 -->

<!-- index 페이지의 경계선 영역제어 -->

<img src="<%=root %>/images/main.jpg" width='100%'height='50%'>
<div class="container">
	<button type="button" class="btn btn-info btn-lg" style="font-size: x-small;">
		<a href="<%=root %>/index.jsp">홈</a>
	</button>
	<button type="button" class="btn btn-info btn-lg">
		<a href="<%=root%>/member/login.do">로그인</a>
	</button>
	<button type="button" class="btn btn-info btn-lg">
		<a href="<%=root%>/view/member/agreement.jsp">회원가입</a>
	</button>
	<button type="button" class="btn btn-info btn-lg">
		<a href="<%=root%>/view/member/agreement.jsp">아이디찾기</a>
	</button>
	<button type="button" class="btn btn-info btn-lg">
		<a href="<%=root%>/view/member/agreement.jsp">비번찾기</a>
	</button>
	<button type="button" class="btn btn-info btn-lg">
		<a href="<%=root%>/member/logout.do">로그아웃</button>
	<button type="button" class="btn btn-info btn-lg">
		<a href="<%=root%>/member/read.do">회원정보</button>
	<button type="button" class="btn btn-info btn-lg">
		<a href="<%=root%>/member/update.do">회원수정</button>
	<button type="button" class="btn btn-info btn-lg">
		<a href="<%=root%>/member/delete.do">회원탈퇴</button>
	<button type="button" class="btn btn-info btn-lg">
		<a href="<%=root%>/bbs/list.do">게시판목록</button>
	<button type="button" class="btn btn-info btn-lg">
		<a href="<%=root%>/bbs/create.do">게시판생성</button>
	<button type="button" class="btn btn-info btn-lg">
		<a href="<%=root%>/memo/list.do">메모목록</button>
	<button type="button" class="btn btn-info btn-lg">
		<a href="<%=root%>/memo/create.do">메모생성</button>
	<button type="button" class="btn btn-info btn-lg">
		회원목록</button>
</div>


<!-- 상단 메뉴 끝 -->


<!-- 내용 시작 -->
<!-- <div style="width: 100%; padding-top: 0px; padding-bottom: 0px"> -->