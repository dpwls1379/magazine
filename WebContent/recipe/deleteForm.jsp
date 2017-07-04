<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../session/sessionChk.jsp" %>
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
	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.dropotron.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/skel-viewport.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="../assets/js/main.js"></script>
</head>
<body>
	<form name="frm" action="delete.do">
		<input type="hidden" name="r_num" value="${r_num }"> <input
			type="hidden" name="pageNum" value="${pageNum }">
		<table>
			<caption>본인 확인</caption>
			<tr>
				<th>아이디</th>
				<td><c:if test="${not empty u_id }">
						<input type="text" name="u_id" value="${u_id }"
							readonly="readonly">
					</c:if> <c:if test="${not empty m_id }">
						<input type="text" name="m_id" value="${m_id }"
							readonly="readonly">
					</c:if></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd" required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인 "></td>
			</tr>
		</table>
		<a onclick="history.go(-1)">뒤로가기</a>
	</form>
</body>
</html>