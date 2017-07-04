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
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<style type="text/css">
pre {
	text-align: center;
	font: 16px bold;
}
</style>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	function save(manum) {
		var num = parseInt(manum);
		var con = confirm("저장하시겠습니까?");
		if (con) {
			location.href = "saveit.do?ma_num=" + num + "&pageNum=${pageNum}";
		}
	}
</script>
<script type="text/javascript">
$(function() {
	$('img').css({
		'max-height':'14cm',
		'text-align':'center'
	});
})
</script>
</head>
<body>
	<table>
		<caption>게시글 보기</caption>
		<tr>
			<th width="100">제목</th>
			<td>${magazine.ma_title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${magazine.m_id}</td>
		</tr>
		<tr>
			<th>입력날짜</th>
			<td>${magazine.ma_reg_date}</td>
		</tr>
		<tr>
			<th>분류</th>
			<td><c:if test="${magazine.ma_kind==100 }">
			기타
			</c:if> <c:if test="${magazine.ma_kind==200 }">
			정치/경제
			</c:if> <c:if test="${magazine.ma_kind==300 }">
			건강/샐러드
			</c:if> <c:if test="${magazine.ma_kind==400 }">
			요리정보
			</c:if> <c:if test="${magazine.ma_kind==500 }">
			살림정보
			</c:if></td>
		</tr>
		<tr>
			<th>본문</th>
			<td><img class="image" alt="${magazine.ma_image }"
				src="../uploadM/${magazine.ma_image }"> <pre>${magazine.ma_content}</pre>
			</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${magazine.ma_readcount}</td>
		</tr>
		<tr>
			<c:if test="${magazine.ma_del!='y' }">
				<td colspan="2"><input type="button" value="저장하기"
					onclick="save('${ma_num}')"></td>
			</c:if>
			<c:if test="${magazine.ma_del=='y' }">
				<td colspan="2">삭제된 게시글 입니다.</td>
			</c:if>
		</tr>
	</table>
	<c:if test="${not empty m_id && magazine.ma_del!='y'}">
		<a href="updateForm.do?ma_num=${magazine.ma_num }&pageNum=${pageNum }">수정</a>
		<a href="deleteForm.do?ma_num=${magazine.ma_num}&pageNum=${pageNum}">삭제</a>
	</c:if>
	<a onclick="history.go(-1)">뒤로가기</a>
	<a href="list.do?pageNum=${pageNum }">게시판목록</a>
	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.dropotron.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/skel-viewport.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="../assets/js/main.js"></script>
</body>
</html>