<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*,java.util.*,model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../session/sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
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
		$('div').css({
			'position' : 'fixed',
			'bottom' : '5px',
			'right' : '5px'
		});

		$('#image').click(function() {
			$(window).scrollTop(0);
		});

		$('a').css('cursor','pointer');		
	});
</script>
<script type="text/javascript">
	function rdel(rnum) {
		var con=confirm('관리자님, 레시판 게시물을 완전히 삭제하시겠습니까?');
		if(con){
			location.href='deleteForm.do?r_num='+rnum;
		}
	}
	function mdel(mnum) {
		var con=confirm('관리자님, 메거진 게시물을 완전히 삭제하시겠습니까?');
		if(con){
			location.href='deleteForm.do?ma_num='+mnum;
		}
	}
	function bdel(bnum) {
		var con=confirm('관리자님, 회원 게시물을 완전히 삭제하시겠습니까?');
		if(con){
			location.href='deleteForm.do?b_num='+bnum;
		}
	}
</script>
</head>
<body class="homepage">
	<h1>삭제된 게시판 관리</h1>

	<table class="default">
		<c:set var="num1" value="1"></c:set>
		<caption>레시피게시판</caption>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>등록일</th>
			<th>삭제여부</th>
			<th>삭제</th>
		</tr>
		<c:if test="${empty recipe }">
			<tr>
				<td colspan="6">데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty recipe }">
			<c:forEach var="recipe" items="${recipe }">
				<tr>
					<td>${num1 }</td>
					<td><c:if test="${not empty recipe.m_id }">${recipe.m_id }</c:if>
						<c:if test="${not empty recipe.u_id }">${recipe.u_id }</c:if></td>

					<td><a
						href="../recipe/content.do?r_num=${recipe.r_num }&pageNum=1">${recipe.r_title}</a>
					</td>
					<td>${recipe.r_reg_date}</td>
					<td>${recipe.r_del}</td>
					<td><button onclick="rdel(${recipe.r_num})">완전삭제</button></td>
				</tr>
				<c:set var="num1" value="${num1+1 }"></c:set>
			</c:forEach>
		</c:if>
	</table>

	<table class="default">
		<c:set var="num1" value="1"></c:set>
		<caption>메거진게시판</caption>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>등록일</th>
			<th>삭제여부</th>
			<th>삭제</th>
		</tr>
		<c:if test="${empty magazine }">
			<tr>
				<td colspan="6">데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty magazine }">
			<c:forEach var="magazine" items="${magazine }">
				<tr>
					<td>${num1 }</td>
					<td>${magazine.m_id }</td>

					<td><a
						href="../magazine/content.do?ma_num=${magazine.ma_num }&pageNum=1">${magazine.ma_title}</a>
					</td>
					<td>${magazine.ma_reg_date}</td>
					<td>${magazine.ma_del}</td>
					<td><button onclick="mdel(${magazine.ma_num})">완전삭제</button></td>
				</tr>
				<c:set var="num1" value="${num1+1 }"></c:set>
			</c:forEach>
		</c:if>
	</table>

	<table class="default">
		<c:set var="num1" value="1"></c:set>
		<caption>회원게시판</caption>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>등록일</th>
			<th>삭제여부</th>
			<th>삭제</th>
		</tr>
		<c:if test="${empty board }">
			<tr>
				<td colspan="6">데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty board }">
			<c:forEach var="board" items="${board }">
				<tr>
					<td>${num1 }</td>
					<td>${board.u_id }</td>

					<td><a
						href="../boardA/content.do?b_num=${board.b_num }&pageNum=1">${board.b_title}</a>
					</td>
					<td>${board.b_reg_date}</td>
					<td>${board.b_del}</td>
					<td><button onclick="bdel(${board.b_num})">완전삭제</button></td>
				</tr>
				<c:set var="num1" value="${num1+1 }"></c:set>
			</c:forEach>
		</c:if>
	</table>

	<div align="right">
		<a href="../index.jsp">메인홈</a> <img id="image" alt=""
			src="../images/arrow-up-icon.png" width="100px" height="100px">
	</div>
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