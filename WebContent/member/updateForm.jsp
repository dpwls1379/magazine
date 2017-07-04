<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*,model.*"%>
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
<script type="text/javascript">
	function chk() {
		if (frm.u_passwd.value != frm.passwd2.value) {
			alert("암호를 다시 확인하세요");
			frm.u_passwd.focus();
			return false;
		}else{
			alert("확인되었습니다.");
			frm.name.focus();
		}
	}
</script>
</head>
<body>
	<form action="update.do" name="frm" method="post" name="frm">
		<input type="hidden" name="u_id" value="${u_id }">
		<table>
			<caption>회원정보 수정</caption>
			<tr>
				<th>i d</th>
				<td>${u_id }</td>
				<!-- 아이디 못 바꿈(hidden) -->
			</tr>
			<tr>
				<th>pass</th>
				<td><input type="password" name="u_passwd" required="required"></td>
			</tr>
			<tr>
				<th>passCheck</th>
				<td><input type="password" name="passwd2" required="required">
					<input type="button" name="btn" value="암호확인" onclick="return chk()">
				</td>
			</tr>
			<tr>
				<th>name</th>
				<td><input type="text" name="u_name" required="required"
					value="${member.u_name }"></td>
			</tr>
			<tr>
				<th>nickname</th>
				<td><input type="text" name="u_nickname" value="${member.u_nickname }"></td>
			</tr>
			<tr>
				<th>address</th>
				<td>
					<input type="text" name="u_postcode" placeholder="우편번호"
					value="${member.u_postcode }" required="required" size="6"><br>
					<input type="text" name="u_address" placeholder="상세주소"
					value="${member.u_address }" required="required" size="30">
				</td>
			</tr>
			<tr>
				<th>phone</th>
				<td><input type="tel" name="u_tel" required="required"
					pattern="\d{10-11}" placeholder="010-1111-1111"
					value="${member.u_tel }"></td>
			</tr>
			<tr>
				<th>e-mail</th>
				<td><input type="email" name="u_email" required="required"
					value="${member.u_email }"></td>
			</tr>
			<tr>
				<th>job</th>
				<td>
					<select name="u_job" required="required">
						<option value="학생">학생</option>
						<option value="주부">주부</option>
						<option value="직장인">직장인</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="complete!!"></td>
			</tr>
		</table>
		<a href="#" onclick="history.back()">뒤로가기</a>
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