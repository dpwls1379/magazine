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
<c:if test="${result>0 }">
<script type="text/javascript">
alert("정상적으로 수정되었습니다.");
location.href="content.do?ma_num=${ma_num}&pageNum=${pageNum}";
</script>
</c:if>
<c:if test="${result<=0 }">
<script type="text/javascript">
alert("수정중 오류가 발생하였습니다.");
history.back();
</script>
</c:if>
</body>
</html>