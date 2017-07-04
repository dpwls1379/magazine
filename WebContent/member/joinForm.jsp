<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="../assets/js/ie/html5shiv.js"></script>
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet" href="../assets/css/ie8.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#confirm').click(function() {
			var u_id = 'u_id=' + frm.u_id.value;
			$.post('confirm.do', u_id, function(data) {
				$('#msg').html(data);
			});
		});
	});
	$(function() {
		$('#passChk').click(function(){
			if (frm.u_passwd.value != frm.u_passwdchk.value) {
				$('#pass').html("비밀번호를 다시 확인하세요.");
				frm.u_passwdchk.value = "";
				frm.u_passwdchk.focus();
				return false;
			}else{
				$('#pass').html("확인되었습니다.");
				frm.u_nickname.focus();
			}
		});
	});
</script>
</head>
<body>
	<form action="join.do" name="frm" method="post">
		<table class="default">
			<caption>회원가입</caption>
			<tr>
				<th>name</th>
				<td><input type="text" name="u_name" required="required"></td>
			</tr>
			<tr>
				<th>i d</th>
				<td><input type="text" name="u_id" required="required">
					<input type="button" id="confirm" value="check" required="required">
					<div id="msg"></div></td>
			</tr>
			<tr>
				<th>password</th>
				<td><input type="password" name="u_passwd" required="required"></td>
			</tr>
			<tr>
				<th>passCheck</th>
				<td><input type="password" name="u_passwdchk"
					required="required">
					<button id="passChk">암호확인</button>
					<div id="pass"></div>
					</td>
			</tr>
			<tr>
				<th>nickname</th>
				<td><input type="text" name="u_nickname" required="required"></td>
			</tr>
			<tr>
				<th>birthday</th>
				<td><input type="number" name="u_birthday" required="required"
					title="주민번호 앞자리" maxlength="6"></td>
			</tr>
			<tr>
				<th>gender</th>
				<td id="gender"><label for="man">남</label><input type="radio" value="man"
					name="u_gender" id="man"><label for="woman">여</label><input
					type="radio" value="woman" name="u_gender" id="woman"></td>
			</tr>
			<tr>
				<th>address</th>
				<td><input type="text" name="u_postcode" placeholder="우편번호"
					required="required" size="6"><p> <input type="text"
					name="u_address" placeholder="상세주소" required="required" size="35px">
				</td>
			</tr>
			<tr>
				<th>phone</th>
				<td><input type="tel" name="u_tel" required="required"
					pattern="\d{3}-\d{3,4}-\d{4}" title="전화번호 형식 3-3,4-4"
					placeholder="010-1111-1111"></td>
			</tr>
			<tr>
				<th>e-mail</th>
				<td><input type="email" name="u_email" required="required"></td>
			</tr>
			<tr>
				<th>job</th>
				<td><select name="u_job">
						<option value="학생">학생</option>
						<option value="주부">주부</option>
						<option value="직장인">직장인</option>
						<option value="기타">기타</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2">
					<div align="center">
						<input type="submit" value="JOIN!!">
					</div>
				</td>
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