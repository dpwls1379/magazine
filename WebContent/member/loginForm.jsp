<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../session/sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="../assets/js/ie/html5shiv.js"></script>
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet" href="../assets/css/ie8.css" />
	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.dropotron.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/skel-viewport.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="../assets/js/main.js"></script>
<script type="text/javascript">
$(function() {
	$('input[type=text]').removeAttr('style').css('width','10cm').css('float','left');
	$('input[type=password]').css('width','10cm');
})
</script>
</head>
<body>
<form action="login.do" name="frm">
<table>
<tr><th>I D</th><td><input type="text" name="u_id" required="required"></td></tr>
<tr><th>P W</th><td><input type="password" name="u_passwd" required="required"></td></tr>
</table>
<input type="submit" value="LOGIN">
<input type="button" onclick="location.href='joinForm.jsp'" value="JOIN">
</form>

</body>
</html>