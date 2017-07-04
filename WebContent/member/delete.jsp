<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../session/sessionChk.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty m_id }">
		<c:if test="${result>0 }">
			<script type="text/javascript">
				alert("강제탈퇴 완료");
				location.href = "list.do";
			</script>
		</c:if>
		<c:if test="${result<=0 }">
			<script type="text/javascript">
				alert("진행도중 오류가 발생하였습니다.");
				history.back();
			</script>
		</c:if>
	</c:if>
	<c:if test="${empty m_id }">
		<c:if test="${result>0 }">
			<script type="text/javascript">
				alert("회원탈퇴 완료");
				location.href = "index.html";
			</script>
		</c:if>
		<c:if test="${result<=0 }">
			<script type="text/javascript">
				alert("탈퇴 오류: 다시 시도하세요");
				history.go(-1);
			</script>
		</c:if>
	</c:if>
</body>
</html>