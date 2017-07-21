<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript">
	function reset() {
		frm.r_title.value = "";
		frm.r_content.value = "";
		frm.r_image.value = "";
		return false;
	}
</script>
</head>
<body class="homepage">
	<form name="frm" action="insert.do" method="post"
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
				<td><input type="text" name="r_title" required="required"></td>
			</tr>
			<tr>
				<th>재료</th>
				<td><input type="text" name="r_ingredients" required="required"></td>
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
						required="required"></textarea></td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td><input type="file" name="file" required="required"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="작성완료"></th>
			</tr>
		</table>
	</form>
	<a href="list.do?pageNum=${pageNum }">목록보기</a>
	<button onclick="reset()">초기화</button>

</body>
</html>