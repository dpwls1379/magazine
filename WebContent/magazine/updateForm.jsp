<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
	<form action="update.do" method="post" enctype="multipart/form-data"
		name="frm">
		<input type="hidden" name="pageNum" value="${pageNum }"> <input
			type="hidden" name="ma_num" value="${magazine.ma_num }">
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="m_id" value="${m_id }"
					readonly="readonly"></td>
			</tr>
			<tr>
			<tr>
				<th>분류</th>
				<td><select name="ma_kind" required="required">
						<option value="100" selected="selected">기타</option>
						<option value="200">정치/경제</option>
						<option value="300">건강/샐러드</option>
						<option value="400">요리정보</option>
						<option value="500">살림</option>
				</select></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="ma_title"
					value="${magazine.ma_title }" required="required"></td>
			</tr>

			<tr>
				<th>본문</th>
				<td><textarea rows="30" cols="30" name="ma_content"
						required="required">${magazine.ma_content }</textarea></td>
			</tr>
			<tr>
				<th>파일</th>
				<td><input type="file" name="file"
					value="${magazine.ma_image }" required="required"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="수정완료"> <input
					type="button" onclick="frm.reset()" value="초기화"> <a
					onclick="history.go(-1)">뒤로가기</a></th>
			</tr>
		</table>
	</form>
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