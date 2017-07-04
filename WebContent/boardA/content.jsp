<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*"%>
<%@ include file="../session/sessionChk.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="../assets/css/ie8.css" /><![endif]-->
<!-- Scripts -->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/jquery.dropotron.min.js"></script>
<script src="../assets/js/skel.min.js"></script>
<script src="../assets/js/skel-viewport.min.js"></script>
<script src="../assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="../assets/js/main.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#content').css({
			'height':'10cm',
			'text-align':'center'
		});
	})
</script>
</head>
<body>
	<table>
		<caption>게시글 보기</caption>
		<tr>
			<th>제목</th>
			<td>${board.b_title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.u_id}</td>
		</tr>
		<tr>
			<th>입력날짜</th>
			<td>${board.b_reg_date}</td>
		</tr>
		<tr id="content">
			<th>본문</th>
			<td><pre width="90%">${board.b_content}</pre></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.b_readcount}</td>
		</tr>
	</table>
	<c:if test="${u_id==board.u_id && empty m_id }">
		<c:if test="${board.b_del!='y' }">
			<a href="updateForm.do?b_num=${board.b_num }&pageNum=${pageNum }">수정</a>
			<a href="deleteForm.do?b_num=${board.b_num }">삭제</a>
		</c:if>
	</c:if>
	<c:if test="${not empty u_id || not empty m_id }">
		<c:if test="${board.b_del!='y' }">
			<a href="insertForm.do?b_num=${board.b_num }&pageNum=${pageNum }">답변</a>
		</c:if>
	</c:if>
	<a onclick="history.go(-1)">뒤로가기</a>
	<a href="list.do?pageNum=${pageNum }">게시판목록</a>
	<div id="list"></div>
</body>
</html>