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
	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.dropotron.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/skel-viewport.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="../assets/js/main.js"></script>
<script type="text/javascript">
	function reset() {
		frm.r_title.value = "";
		frm.r_content.value = "";
		frm.r_image.value = "";
		return false;
	}
</script>
</head>
<body>
	<form name="frm" action="update.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${pageNum }"> <input
			type="hidden" name="r_num" value="${r_num }">
		<table>
			<caption>글쓰기</caption>
			<tr>
				<th>작성자</th>
				<td><c:if test="${not empty u_id }">
						<input type="text" name="u_id" value="${u_id }"
							readonly="readonly">
					</c:if> <c:if test="${not empty m_id }">
						<input type="text" name="m_id" value="${m_id }"
							readonly="readonly">
					</c:if></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="r_title"
					value="${recipe.r_title }" required="required"></td>
			</tr>
			<tr>
				<th>재료</th>
				<td><input type="text" name="r_ingredients"
					value="${recipe.r_ingredients}" required="required"></td>
			</tr>
			<tr>
				<th>분류</th>
				<td><select name="r_kind">
						<option value="100" selected="selected">기타</option>
						<option value="200">간식/간편</option>
						<option value="300">영양/반찬</option>
						<option value="400">일품/메인</option>
						<option value="500">안주/해장</option>
				</select></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="21" name="r_content"
						required="required">${recipe.r_content }</textarea></td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td><input type="file" name="file" value="${recipe.r_image }"
					required="required"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="작성완료"></th>
			</tr>
		</table>
	</form>
	<a onclick="history.go(-1)">뒤로가기</a>
	<button onclick="reset()">초기화</button>

</body>
</html>
