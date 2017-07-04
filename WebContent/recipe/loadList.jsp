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
$(function() {
	$('table,td,tr').css('border','1px solid silver').css('text-align','center');
	$('#selch').css('width','3cm');
	$('li').css('float','left').css({
		'margin-top':'1px',
		'margin-left':'2cm'
	});
	$('a').css('text-decoration','none');
});
$(function() {
	$('#category a').click(function(data) {
		data.preventDefault();
		var cg=$(this).attr('title');
		alert('data'+cg);
	});
});
</script>

</head>
<body>
<div id="category">
        <h4>카테고리</h4>
        <ul>
            <li><a href="#" title="0">전체</a></li>
            <li><a href="#" title="200">간식/간편</a></li>
            <li><a href="#" title="300">영양/반찬</a></li>
            <li><a href="#" title="400">일품/메인</a></li>
            <li><a href="#" title="500">안주/해장</a></li>
            <li><a href="#" title="100">기타</a></li>
        </ul>
    </div>
<div id="loadList"></div>
	<p>
	<c:if test="${not empty u_id || not empty m_id }">
	<div align="right">
		<a href="insertForm.do">글쓰기</a>
	</div>
	</c:if>
	<P>
		<a onclick="history.go(-1)">뒤로가기</a>
	</P>
	<h4>
		<a href="../index.jsp">메인홈</a>
	</h4>
</body>
</html>