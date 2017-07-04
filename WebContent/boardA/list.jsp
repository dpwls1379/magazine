<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../session/sessionChk.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script type="text/javascript">
	$(function() {
		$('table,td,tr').css('border','1px solid silver').css('text-align','center');
	})
	function del(bnum){
		var con=confirm('관리자님, 정말 게시글을 삭제하시겠습니까?');
		if(con){
			location.href='deleteForm.do?b_num='+bnum+'&pageNum=${pageNum}';
		}
	}
	</script>
</head>
<body>
	<h1>게시판</h1>

	<table>
		<c:set var="num1" value="${number }"></c:set>
		<tr>
			<th>번호</th>
			<th>작성자</th>
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
			<c:forEach var="board" items="${list }">
				<tr>
					<td>${num1 }</td>
					<c:if test="${board.b_del=='y'}">
						<td colspan='5'>데이터가 삭제되었습니다.</td>
					</c:if>
					<c:if test="${board.b_del!='y' }">
						<td>${board.u_id}</td>
						<td><c:if test="${board.b_re_level>0}">
								<img alt="" src="../immage/level.gif" height="5"
									width="${board.b_re_level*15}">
								<!-- 들여쓰기 -->
								<img alt="" src="../immage/re.gif">
							</c:if> <a href="content.do?b_num=${board.b_num }&pageNum=${pageNum}"
							title="${board.b_content }">${board.b_title}</a></td>
						<td>${board.b_reg_date}</td>
						<td><c:if test="${board.b_readcount>30 }">
								<img alt="" src="../immage/hot.gif">
							</c:if> ${board.b_readcount}</td>
						<td>${board.b_del}</td>
						<c:if test="${not empty m_id }">
						<td><a onclick="del('${board.b_num}')">게시글 삭제</a></td>
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
			<a href="list.do?pageNum=${endPage - PAGEPERBLOCK}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="list.do?pageNum=${i}">[${i}] </a>
		</c:forEach>
		<c:if test="${endPage < totPage }">
			<a href="list.do?pageNum=${startPage + PAGEPERBLOCK}">[다음]</a>
		</c:if>
	</div>
	<p>
		<c:if test="${not empty u_id }">
			<div align="right">
				<a href="insertForm.jsp">글쓰기</a>
			</div>
			<P>
				<a onclick="history.go(-1)">뒤로가기</a>
			</P>
		</c:if>
	<h4>
		<a href="../index.jsp">메인홈</a>
	</h4>
</body>
</html>