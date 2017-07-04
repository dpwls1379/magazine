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
		})

		$('img').click(function() {
			$(window).scrollTop(0);
		})

		$('.mt,td').css({
			width : '50%',
			margin : '10px',
			text-align:'center'
		});
	})
</script>
</head>
<body>
	<table class="mt">
		<c:set var="num1" value="1"></c:set>
		<caption>레시피게시판</caption>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>분류</th>
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
					<td>${num1 }</td>
					<c:if test="${recipe.r_del=='y'}">
						<td colspan='5'>데이터가 삭제되었습니다.</td>
					</c:if>
					<c:if test="${recipe.r_del!='y' }">
						<td><c:if test="${not empty recipe.m_id }">${recipe.m_id }</c:if>
							<c:if test="${not empty recipe.u_id }">${recipe.u_id }</c:if></td>
						<td><c:if test="${recipe.r_kind==100 }">
							기타
							</c:if> <c:if test="${recipe.r_kind==200 }">
							간식/간편
							</c:if> <c:if test="${recipe.r_kind==300 }">
							영양/반찬
							</c:if> <c:if test="${recipe.r_kind==400 }">
							일품/메인
							</c:if> <c:if test="${recipe.r_kind==500 }">
							안주/해장
							</c:if></td>
						<td><a
							href="../recipe/content.do?r_num=${recipe.r_num }&pageNum=${pageNum}">${recipe.r_title}</a>
						</td>
						<td>${recipe.r_reg_date}</td>
						<td><c:if test="${recipe.r_readcount>30 }">
								<img alt="" src="../immage/hot.gif">
							</c:if> ${recipe.r_readcount}</td>
						<td>${recipe.r_del}</td>
					</c:if>
				</tr>
				<c:set var="num1" value="${num1+1 }"></c:set>
			</c:forEach>
		</c:if>
	</table>
	<c:if test="${not empty u_id }">
		<table class="mt">
			<c:set var="num2" value="1"></c:set>
			<caption>회원게시판</caption>
			<tr>
				<th>번호</th>
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
						<td>${num2 }</td>
						<c:if test="${board.b_del=='y'}">
							<td colspan='5'>데이터가 삭제되었습니다.</td>
						</c:if>
						<c:if test="${board.b_del!='y' }">
							<td>${board.u_id}</td>
							<td><c:if test="${board.b_re_level>0}">
									<img alt="" src="../immage/level.gif" height="5"
										width="${board.b_re_level*10}">
									<!-- 들여쓰기 -->
									<img alt="" src="../immage/re.gif">
								</c:if> <a
								href="../board/content.do?b_num=${board.b_num }&pageNum=${pageNum}"
								title="${board.b_content }">${board.b_title}</a></td>
							<td>${board.b_reg_date}</td>
							<td><c:if test="${board.b_readcount>30 }">
									<img alt="" src="../immage/hot.gif">
								</c:if> ${board.b_readcount}</td>
							<td>${board.b_del}</td>
						</c:if>
					</tr>
					<c:set var="num2" value="${num2+1 }"></c:set>
				</c:forEach>
			</c:if>
		</table>
	</c:if>
	<c:if test="${not empty m_id }">
		<table class="mt">
			<c:set var="num3" value="1"></c:set>
			<caption>메거진</caption>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>분류</th>
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
						<td>${num3 }</td>
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
								href="../magazine/content.do?ma_num=${magazine.ma_num }&pageNum=${pageNum}"
								title="${magazine.ma_content }">${magazine.ma_title}</a></td>
							<td>${magazine.ma_reg_date}</td>
							<td><c:if test="${magazine.ma_readcount>30 }">
									<img alt="" src="../immages/hot.gif">
								</c:if> ${magazine.ma_readcount}</td>
							<td>${magazine.ma_del}</td>
						</c:if>
					</tr>
					<c:set var="num3" value="${num3+1 }"></c:set>
				</c:forEach>
			</c:if>
		</table>
	</c:if>
	
		<div align="right">
			<a href="../index.jsp">메인홈</a> <img alt=""
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