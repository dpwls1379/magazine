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
RecipeDao rd=RecipeDao.getInstance();
for(int i=1; i<=50; i++){
	Recipe recipe=new Recipe();
	recipe.setU_id("kildong");
	recipe.setR_content("내용"+i);
	recipe.setR_ingredients("성분"+i);
	recipe.setR_kind(100);
	recipe.setR_title("제목"+i);
	rd.insert(recipe);
}
%>
입력완료
</body>
</html>