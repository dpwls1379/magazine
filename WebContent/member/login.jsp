<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../session/sessionChk.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result>0 }">
	<script type="text/javascript">
	alert("로그인되었습니다.");
	location.href="../index.jsp";
	</script>
</c:if>
<c:if test="${result==0 }">
	<script type="text/javascript">
	alert("암호를 확인하세요");
	history.go(-1);
	</script>
</c:if>
<c:if test="${result<0 }">
	<script type="text/javascript">
	alert("아이디가 없습니다.");
	history.go(-1);
	</script>
</c:if>
</body>
</html>