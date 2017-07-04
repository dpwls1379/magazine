<%@page import="model.Magazine"%>
<%@page import="dao.MagazineDao"%>
<%@page import="model.Recipe"%>
<%@page import="dao.RecipeDao"%>
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
MagazineDao md=MagazineDao.getInstance();
for(int i=1; i<=50; i++){
	Magazine magazine=new Magazine();
	magazine.setM_id("master");
	magazine.setMa_kind(100);
	magazine.setMa_content("내용"+i);
	magazine.setMa_title("제목"+i);
	md.insert(magazine);
}
%>
입력완료
</body>
</html>