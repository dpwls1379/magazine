<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form action="secession.do">
<input type="hidden" name="u_id" value="${u_id }">
<table>
<caption>관리자 확인</caption>
<tr>
<th>관리자 아이디</th><td>${m_id }</td>
</tr>
<tr>
<th>관리자 암호</th><td><input type="password" name="m_passwd" required="required"></td>
</tr>
</table>
<div align="center"><input type="submit" value="확인"></div>
</form>
</body>
</html>