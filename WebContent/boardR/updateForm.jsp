<%@page import="dao.*"%>
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
<script type="text/javascript">
// function chk() {
// 	if(frm.passwd.value!=frm.passwd2.value){
// 		alert("암호가 틀립니다.");
// 		frm.passwd2.value="";
// 		frm.passwd2.focus();
// 		return false;
// 	}
// }
</script>
</head>
<body>
<form action="update.do" method="post" name="frm" onsubmit="return chk()">
<input type="hidden" name="b_num" value="${b_num }">
<input type="hidden" name="pageNum" value="${pageNum}">
<table>
<caption>게시글 수정</caption>
<tr>
<th>작성자</th>
<td><input type="text" name="u_id" readonly="readonly"  value="${u_id}"></td>
</tr>
<tr>
<th>제목</th>
<td><input type="text" name="b_title" required="required" value="${board.b_title}"></td>
</tr>
<tr>
<th>암호</th>
<td><input type="password" name="u_passwd" required="required" ></td>
</tr>
<tr>
<th>내용</th>
<td><pre><textarea rows="20" cols="35" name="b_content" required="required" >
${board.b_content}</textarea></pre></td>
</tr>
<tr>
<th></th><td colspan="2"><input type="submit" value="수정완료" ></td>
</tr>
</table>
<a href="list.do?pageNum=${pageNum }">목록보기</a>
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