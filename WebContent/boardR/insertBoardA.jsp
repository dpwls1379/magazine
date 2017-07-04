<%@page import="model.Board"%>
<%@page import="dao.BoardADao"%>
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
<%
BoardADao bad=BoardADao.getInstance();
for(int i=1; i<=50; i++){
	Board board=new Board();
	board.setB_content("내용"+i);
	board.setU_id("kildong");
	board.setB_title("제목"+i);
	bad.insert(board);
}
%>
입력완료
</body>
</html>