<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<form action="insert.do" name="frm" method="post"
		enctype="multipart/form-data">
		<table>
			<caption>메거진 등록</caption>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="m_id" value="${m_id }"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="ma_title" required="required"></td>
			</tr>
			
			<tr>
				<th>분류</th>
				<td>
					<select name="ma_kind" required="required">
						<option value="100" selected="selected">기타</option>
						<option value="200">정치/경제</option>
						<option value="300">건강/샐러드</option>
						<option value="400">요리정보</option>
						<option value="500">살림</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>본문</th>
				<td><textarea rows="30" cols="30" name="ma_content"
						required="required"></textarea></td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td><input type="file" name="file" required="required"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="등록">
					<button onclick="frm.reset()">초기화</button></th>
			</tr>
		</table>
		<a href="list.do?pageNum=${pageNum }">게시판목록</a>
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