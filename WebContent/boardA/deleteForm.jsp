<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<form action="delete.do" onsubmit="return chk()">
<input type="hidden" name="b_num" value="${b_num }">
<input type="hidden" name="pageNum" value="${pageNum }">
<table>
<caption>본인 확인</caption>
<tr>
<c:if test="${not empty u_id }">
<th>작성자</th><td><input type="text" name="u_id" required="required" value="${u_id }"></td>
</c:if>
<c:if test="${not empty m_id }">
<th>관리자</th><td><input type="text" name="m_id" required="required" value="${m_id }"></td>
</c:if>
</tr>
<tr>
<th>암호</th><td><input type="password" name="passwd" required="required" ></td>
</tr>
<tr><td colspan="2"><input type="submit" value="삭제하기"></td></tr>
</table>
<a href="list.do?pageNum=${pageNum }">목록보기</a>
<a onclick="history.go(-1)">뒤로가기</a>
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