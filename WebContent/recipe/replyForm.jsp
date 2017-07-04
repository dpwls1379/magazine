<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../session/sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
	<form action="reply.do" method="post">
		<input type="hidden" name="pageNum" value="${pageNum }">
				<input type="hidden" name="br_num" value="${br_num }">
				<input type="hidden" name="br_ref" value="${br_ref }">
				<input type="hidden" name="br_re_step" value="${br_re_step }">
				<input type="hidden" name="br_re_level" value="${br_re_level }">
				<input type="hidden" name="r_num" value="${r_num }">
		<table>
				<caption>답변달기</caption>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="id" value="${id }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="21" name="br_content"
						required="required"></textarea></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="작성완료"></th>
			</tr>
		</table>
	</form>
	<a href="list.do?pageNum=${pageNum }">목록보기</a>
	<a href="#" onclick="reset()">초기화</a>
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