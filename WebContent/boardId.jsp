<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ include file="../session/sessionChk.jsp"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/skel-viewport.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
	<script type="text/javascript">
	$(function() {
		$('table,td,tr,th').css('border','1px solid silver').css('text-align','center');
		$('*').css('bgcolor','#f7f7f7');
	})
	</script>
</head>
<body class="homepage">
<div id="main-wrapper">
	<table class="default">
		<caption><a href="boardA/list.do">회원게시판</a></caption>
		<tr>
			<th>작성자</th>
			<th>제목</th>
			<th>등록일</th>
			<th>조회수</th>
			<th>삭제여부</th>
		</tr>
		<c:if test="${empty board }">
			<tr>
				<td colspan="6">데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty board }">
			<c:forEach var="board" items="${board }">
				<tr>
					<c:if test="${board.b_del!='y' }">
						<td><c:if test="${not empty board.u_id }">${board.u_id }</c:if></td>

						<td><a href="boardA/content.do?b_num=${board.b_num }">${board.b_title}</a>
						</td>
						<td>${board.b_reg_date}</td>
						<td><c:if test="${board.b_readcount>30 }">
								<img alt="" src="immage/hot.gif">
							</c:if> ${board.b_readcount}</td>
						<td>${board.b_del}</td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<P>
	<table class="default">
		<caption><a href="recipe/list.do">레시피게시판</a></caption>
		<tr>
			<th>작성자</th>
			<th>제목</th>
			<th>등록일</th>
			<th>조회수</th>
			<th>삭제여부</th>
		</tr>
		<c:if test="${empty recipe }">
			<tr>
				<td colspan="6">데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty recipe }">
			<c:forEach var="recipe" items="${recipe }">
				<tr>
					<c:if test="${recipe.r_del!='y' }">
						<td><c:if test="${not empty recipe.u_id }">${recipe.u_id }</c:if>
							<c:if test="${not empty recipe.m_id }">${recipe.m_id }</c:if>
						</td>
						<td><a href="recipe/content.do?r_num=${recipe.r_num }">${recipe.r_title}</a>
						</td>
						<td>${recipe.r_reg_date}</td>
						<td><c:if test="${recipe.r_readcount>30 }">
								<img alt="" src="immage/hot.gif">
							</c:if> ${recipe.r_readcount}</td>
						<td>${recipe.r_del}</td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<p>
	<table class="default">
		<caption><a href="magazine/list.do">매거진</a></caption>
		<tr>
			<th>작성자</th>
			<th>제목</th>
			<th>등록일</th>
			<th>조회수</th>
			<th>삭제여부</th>
		</tr>
		<c:if test="${empty magazine }">
			<tr>
				<td colspan="6">데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty magazine }">
			<c:forEach var="magazine" items="${magazine }">
				<tr>
					<c:if test="${magazine.ma_del!='y' }">
						<td><c:if test="${not empty magazine.m_id }">${magazine.m_id }</c:if></td>

						<td><a href="magazine/content.do?ma_num=${magazine.ma_num }">${magazine.ma_title}</a>
						</td>
						<td>${magazine.ma_reg_date}</td>
						<td><c:if test="${magazine.ma_readcount>30 }">
								<img alt="" src="immage/hot.gif">
							</c:if> ${magazine.ma_readcount}</td>
						<td>${magazine.ma_del}</td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	</div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/skel-viewport.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
</body>
</html>