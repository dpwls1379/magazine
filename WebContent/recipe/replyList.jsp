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
<link rel="stylesheet" href="../assets/css/main.css" />
<!-- Scripts -->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/jquery.dropotron.min.js"></script>
<script src="../assets/js/skel.min.js"></script>
<script src="../assets/js/skel-viewport.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script>
<script type="text/javascript">
$(function() {
		$('table,td,tr').css('border', '1px solid silver');
});
</script>
<script type="text/javascript">
function rpl(brnum) {
	location.href='replyForm.do?br_num='+brnum+'&r_num=${r_num}';
}
function del(brnum) {
	alert(brnum);
	location.href='replyDeleteForm.do?br_num='+brnum+'&r_num=${r_num}';
}
</script>
</head>
<body>
	<h1>게시판</h1>

	<table>
		<c:set var="num1" value="1"></c:set>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>내용</th>
			<th>등록일</th>
			<th>삭제여부</th>
		</tr>
		<c:if test="${empty boardR }">
			<tr>
				<td colspan="5">데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty boardR }">
			<c:forEach var="boardR" items="${boardR }">
				<tr>
					<td>${num1 }</td>
					<c:if test="${boardR.br_del=='y'}">
						<td colspan='4'>데이터가 삭제되었습니다.</td>
					</c:if>
					<c:if test="${boardR.br_del!='y' }">
						<td>${boardR.id}</td>
						<td><c:if test="${boardR.br_re_level>0}">
								<img alt="" src="../immage/level.gif" height="5"
									width="${boardR.br_re_level*10}">
								<!-- 들여쓰기 -->
								<img alt="" src="../immage/re.gif">
							</c:if>${boardR.br_content}</td>
						<td>${boardR.br_reg_date}</td>
						<td>${boardR.br_del}</td>
						<c:if test="${not empty u_id || not empty m_id }">
							<td><a id="rpl" href="#" onclick="rpl('${boardR.br_num}')">댓댓글</a>
								<%-- href="replyForm.do?br_num=${boardR.br_num }&r_num=${r_num}">댓댓글</a> --%>
								<c:if test="${not empty m_id }">
									<a href="#" onclick="del('${boardR.br_num}')">게시글 삭제</a>
								</c:if></td>
						</c:if>
					</c:if>
				</tr>
				<c:set var="num1" value="${num1+1 }"></c:set>
			</c:forEach>
		</c:if>
	</table>
	<div id="rep"></div>
	<p>
		<a onclick="history.go(-1)">뒤로가기</a>
	</P>
	<h4>
		<a href="../index.jsp">메인홈</a>
	</h4>
</body>
</html>