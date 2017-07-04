<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../session/sessionChk.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<form action="delete.do">
<input type="hidden" name="ma_num" value="${magazine.ma_num }">
<input type="hidden" name="pageNum" value="${pageNum }">
<table>
<caption>관리자 확인</caption>
<tr>
<th>관리자 아이디</th>
<td><input type="text" name="m_id" value="${magazine.m_id }" required="required"></td>
</tr>
<tr>
<th>관리자  비밀번호</th>
<td><input type="password" name="m_passwd" required="required"></td>
</tr>
</table>
<div align="center"><input type="submit" value="확인" ></div>
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