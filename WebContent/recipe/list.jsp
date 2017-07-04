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
	<script src="../assets/js/main.js"></script>
<script type="text/javascript">
$(function() {
	$('table,td,tr').css('border','1px solid silver').css('text-align','center');
	$('li').css('float','left').css({
		'margin-top':'1px',
		'margin-left':'2cm'
	});
	$('a').css('text-decoration','none');
});
$(function() {
	$('#category a').click(function(data) {
		data.preventDefault();
		var cg=$(this).attr('title');
		location.href="list.do?r_kind="+cg;
	});
});
</script>
<script type="text/javascript">
	function del(rnum) {
		var conf=confirm('관리자님, 게시글을 삭제하시겠습니까?');
		if(conf){
			location.href="deleteForm.do?r_num="+rnum+"&pageNum=${pageNum}";
		}
	}
</script>
</head>
<body>
<div id="category">
	<h4>카테고리</h4>
        <ul>
            <li><a href="#" title="0">전체</a></li>
            <li><a href="#" title="200">간식/간편</a></li>
            <li><a href="#" title="300">영양/반찬</a></li>
            <li><a href="#" title="400">일품/메인</a></li>
            <li><a href="#" title="500">안주/해장</a></li>
            <li><a href="#" title="100">기타</a></li>
        </ul>
</div>
	<table>
		<c:set var="num1" value="${number }"></c:set>
		<caption>게시판</caption>
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
				<td colspan="7">데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="recipe" items="${list }">
				<tr>
					<td>${num1 }</td>
					<c:if test="${recipe.r_del=='y'}">
						<td colspan='6'>데이터가 삭제되었습니다.</td>
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
							href="content.do?r_num=${recipe.r_num }&pageNum=${pageNum}">${recipe.r_title}</a>
						</td>
						<td>${recipe.r_reg_date}</td>
						<td><c:if test="${recipe.r_readcount>30 }">
								<img alt="" src="../immage/hot.gif">
							</c:if> ${recipe.r_readcount}</td>
						<td>${recipe.r_del}</td>
						<c:if test="${not empty m_id }">
						<td><a onclick="del('${recipe.r_num}')">게시글 삭제</a></td>
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
			<a href="list.do?pageNum=${endPage - PAGEPERBLOCK}&r_kind=${r_kind}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="list.do?pageNum=${i}&r_kind=${r_kind}">[${i}] </a>
		</c:forEach>
		<c:if test="${endPage < totPage }">
			<a href="list.do?pageNum=${startPage + PAGEPERBLOCK}&r_kind=${r_kind}">[다음]</a>
		</c:if>
	</div>
	<p>
	<c:if test="${not empty u_id || not empty m_id }">
	<div align="right">
		<a href="insertForm.do">글쓰기</a>
	</div>
	</c:if>
	<P>
		<a onclick="history.go(-1)">뒤로가기</a>
	</P>
	<h4>
		<a href="../index.jsp">메인홈</a>
	</h4>
</body>
</html>