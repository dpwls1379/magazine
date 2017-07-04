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
	<form action="insert.do" method="post">
		<input type="hidden" name="pageNum" value="${pageNum }">
				<input type="hidden" name="b_num" value="${b_num }">
				<input type="hidden" name="b_ref" value="${b_ref }">
				<input type="hidden" name="b_re_step" value="${b_re_step }">
				<input type="hidden" name="b_re_level" value="${b_re_level }">
		<table>
				<caption>답변달기</caption>
			
			<tr>
				<th>작성자</th>
				<td><input type="text" name="u_id" value="${u_id }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="b_title" required="required"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="21" name="b_content"
						required="required"></textarea></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="작성완료"></th>
			</tr>
		</table>
	</form>
	<a href="list.do?pageNum=${pageNum }">목록보기</a>
	<a href="insertForm.jsp">초기화</a>
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