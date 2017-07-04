<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result>0 }">
<script type="text/javascript">
alert("정상입력 되었습니다.");
location.href="content.do?r_num=${r_num}&pageNum=${pageNum}";
</script>
</c:if>
<c:if test="${result<=0 }">
<script type="text/javascript">
alert("error");
history.go(-1);
</script>
</c:if>
</body>
</html>