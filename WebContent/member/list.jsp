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
<script type="text/javascript">
	function del(uid) {
		var cf = confirm("정말로 강제 탈퇴시키겠습니까?");
		if (cf) location.href = "secessionForm.do?u_id="+uid;
	}
</script>
</head>
<body>
	<table>
		<caption>회원정보</caption>
		<tr>
			<th>아이디</th>
			<th>별명</th>
			<th>이름</th>
			<th>성별</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>이메일</th>
			<th>직업</th>
			<th>생일</th>
			<th>전화번호</th>
			<th>가입일</th>
			<th>삭제여부</th>
			<th>강제탈퇴</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<td colspan="6">데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="mem" items="${list }">
				<tr>
					<td>${mem.u_id}</td>
					<td>${mem.u_nickname}</td>
					<td>${mem.u_name}</td>
					<td>${mem.u_gender}</td>
					<td>${mem.u_postcode}</td>
					<td>${mem.u_address}</td>
					<td>${mem.u_email}</td>
					<td>${mem.u_job}</td>
					<td>${mem.u_birthday}</td>
					<td>${mem.u_tel}</td>
					<td>${mem.u_reg_date}</td>
					<td>${mem.u_del}</td>
					<td>
					<c:if test="${mem.u_del=='n' }">
					<input type="button" value="강제탈퇴" onclick="del('${mem.u_id}')">
					</c:if>
					<c:if test="${mem.u_del!='n' }">
					탈퇴 완료
					</c:if>
					</td>
				</tr>
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
	<P>
	<h4>
		<a href="../index.jsp">메인홈</a>
	</h4>
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