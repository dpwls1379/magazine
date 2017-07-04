<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../session/sessionChk.jsp"%>
<!DOCTYPE html>
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
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="../assets/js/main.js"></script>
<style type="text/css">
pre {
	text-align: center;
	font: 16px bold;
}
</style>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	function like(rnum) {
		var num = parseInt(rnum);
		var con = confirm("추천하시겠습니까?");
		if (con) {
			location.href = "likeit.do?r_num=" + num + "&pageNum=${pageNum}";
		}
	}
	function save(rnum) {
		var num = parseInt(rnum);
		var con = confirm("저장하시겠습니까?");
		if (con) {
			location.href = "saveit.do?r_num=" + num + "&pageNum=${pageNum}";
		}
	}
</script>
<script type="text/javascript">
	$(function() {
		$('#load').load("replyList.do?r_num=${recipe.r_num}");
		$('img').css({
			'max-height':'14cm'
		});
	})
</script>
</head>
<body>
	<table>
		<caption>게시글 보기</caption>
		<tr>
			<th width="100">제목</th>
			<td>${recipe.r_title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><c:if test="${not empty recipe.u_id }">
				${recipe.u_id }
				</c:if> <c:if test="${not empty recipe.m_id }">
				${recipe.m_id }
				</c:if></td>
		</tr>
		<tr>
			<th>입력날짜</th>
			<td>${recipe.r_reg_date}</td>
		</tr>
		<tr>
			<th>분류</th>
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
		</tr>
		<tr>
			<th>재료</th>
			<td>${recipe.r_ingredients}</td>
		</tr>
		<tr>
			<th>본문</th>
			<td align="left"><img class="image" alt="${recipe.r_image }"
				src="../uploadR/${recipe.r_image }"> <pre>${recipe.r_content}</pre>
			</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${recipe.r_readcount}</td>
		</tr>
		<tr>
			<c:if test="${recipe.r_del!='y' }">
				<td colspan="2" align="center"><input type="button" value="추천"
					onclick="like('${r_num}')"> : ${recipe.r_likeit}명 <input
					type="button" value="퍼가기" onclick="save('${r_num}')">:${recipe.r_saveit }명
				</td>
			</c:if>
			<c:if test="${recipe.r_del=='y' }">
				<td colspan="2">삭제된 게시글입니다.</td>
			</c:if>
		</tr>
	</table>
	<c:if test="${not empty u_id || not empty m_id }">
	<c:if test="${u_id==recipe.u_id||m_id==recipe.m_id }">
		<c:if test="${recipe.r_del!='y' }">
			<a href="updateForm.do?r_num=${recipe.r_num }&pageNum=${pageNum }">수정</a>
			<a href="deleteForm.do?r_num=${recipe.r_num}&pageNum=${pageNum}">삭제</a>
		</c:if>
	</c:if>
	</c:if>
	<c:if test="${not empty u_id || not empty m_id }">
		<c:if test="${recipe.r_del!='y' }">
			<a href="replyForm.do?r_num=${recipe.r_num }&pageNum=${pageNum }">댓글</a>
		</c:if>
	</c:if>
	<a href="list.do?pageNum=${pageNum }">게시판목록</a>
	<div id="load"></div>
	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.dropotron.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/skel-viewport.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
</body>
</html>