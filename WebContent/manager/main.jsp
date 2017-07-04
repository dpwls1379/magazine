<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../session/sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<style type="text/css">
a{
	cursor: pointer;
	text-decoration: none;
}
</style>
</head>
<body>
<div>
<a href="../member/list.do">회원목록</a>
<a href="logout.jsp">로그아웃</a>
</div>
<hr>
<div>
<fieldset>
<legend>게시판</legend>
<a title="다양한 정보 매거진" href="../magazine/index.html">매거진</a>
<a title="다양한 레시피" href="../recipe/index.jsp">레시피</a>
<a title="수다떨기 회원게시판" href="../boardA/index.jsp">회원게시판</a>
</fieldset>
</div>
<hr>
<div>
<a title="마이페이지" href="../mypage/index.jsp">마이페이지</a>
<a title="관리자 페이지" href="mgrIndex.jsp">관리자 페이지</a>
</div>
</body>
	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.dropotron.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/skel-viewport.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="../assets/js/main.js"></script>
</html>