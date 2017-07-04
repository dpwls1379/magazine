<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../session/sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#fix').css({
			position : 'fixed'
		})
		$('table,td,tr').css('border','1px solid silver').css('text-align','center');
		$('li').css({
			'float':'left',
			'margin-top':'1px',
			'margin-left':'2cm'
		});
	})
	$(function() {
		$('#category a').click(function(data) {
			data.preventDefault();
			var cg = $(this).attr('title');
			location.href = "list.do?ma_kind=" + cg;
		}).css({
			'float':'left',
			'margin':'20px'
		});
	});
</script>
<script type="text/javascript">
	function del(manum) {
		var con = confirm('관리자님, 게시글을 정말 삭제하시겠습니까?');
		if (con) {
			location.href = 'deleteForm.do?ma_num=' + manum
					+ '&pageNum=${pageNum}';
		}
	}
</script>
</head>
<body>
	<div id="category">
		<h4>카테고리</h4>
		<ul>
			<li><a href="#" title="0">전체</a></li>
			<li><a href="#" title="200">정치/경제</a></li>
			<li><a href="#" title="300">건강/샐러드</a></li>
			<li><a href="#" title="400">요리정보</a></li>
			<li><a href="#" title="500">살림</a></li>
			<li><a href="#" title="100">기타</a></li>
		</ul>
	</div>
	<p></p>
	<table >
		<c:set var="num1" value="${number }"></c:set>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>분류</th>
			<th>제목</th>
			<th>등록일</th>
			<th>조회수</th>
			<th>삭제여부</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<td colspan="6">데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="magazine" items="${list }">
				<tr>
					<td>${num1 }</td>
					<c:if test="${magazine.ma_del=='y'}">
						<td colspan='5'>데이터가 삭제되었습니다.</td>
					</c:if>
					<c:if test="${magazine.ma_del!='y' }">
						<td>${magazine.m_id}</td>
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
						<td><a
							href="content.do?ma_num=${magazine.ma_num }&pageNum=${pageNum}"
							title="${magazine.ma_content }">${magazine.ma_title}</a></td>
						<td>${magazine.ma_reg_date}</td>
						<td><c:if test="${magazine.ma_readcount>30 }">
								<img alt="" src="../immage/hot.gif">
							</c:if> ${magazine.ma_readcount}</td>
						<td>${magazine.ma_del}</td>
						<c:if test="${not empty m_id }">
							<td><a onclick="del('${magazine.ma_num}')">게시글 삭제</a></td>
						</c:if>
					</c:if>
				</tr>
				<c:set var="num1" value="${num1-1 }"></c:set>
			</c:forEach>
		</c:if>
	</table>
	<P>
	<div align="center">
		<c:if test="${startPage > PAGEPERBLOCK }">
			<a href="list.do?pageNum=${endPage - PAGEPERBLOCK}$ma_kind=${ma_kind}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="list.do?pageNum=${i}$ma_kind=${ma_kind}">[${i}] </a>
		</c:forEach>
		<c:if test="${endPage < totPage }">
			<a href="list.do?pageNum=${startPage + PAGEPERBLOCK}$ma_kind=${ma_kind}">[다음]</a>
		</c:if>
	</div>
	<div id="fix">
		<c:if test="${not empty m_id }">
			<div align="right">
				<h4>
					<a href="insertForm.do">글쓰기</a>
				</h4>
			</div>
		</c:if>
		<a href="../index.jsp">메인홈</a> <a onclick="history.go(-1)">뒤로가기</a>

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