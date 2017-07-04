<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../session/sessionChk.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" name="r_num" value="${r_num }">
<input type="hidden" name="pageNum" value="${pageNum }">
<c:if test="${not empty result }">
<script type="text/javascript">
alert("로그인 후 추천을 부탁드립니다.");
location.href="../index.jsp";
</script>
</c:if>
<c:if test="${empty result }">
<script type="text/javascript">
alert("추천을 완료하였습니다.");
location.href="content.do?r_num=${r_num}&pageNum=${pageNum}";
</script>
</c:if>
</body>
</html>