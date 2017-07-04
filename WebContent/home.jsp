<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="session/idChk.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty m_id }">
<script type="text/javascript">
location.href="manager/main.jsp";
</script>
</c:if>
<c:if test="${not empty u_id }">
<script type="text/javascript">
location.href="member/main.jsp";
</script>
</c:if>
</body>
</html>