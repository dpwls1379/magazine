<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../session/sessionChk.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.dropotron.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/skel-viewport.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="../assets/js/main.js"></script>
	<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('div').css({
			'position' : 'fixed',
			'bottom' : '5px',
			'right' : '5px'
		})

		$('img').click(function() {
			$(window).scrollTop(0);
		})

		$('.mt,td').css({
			width : '50%',
			float : 'left',
			margin : '10px',
			text-align:'center'
		});
	})
</script>
</head>
<body>
<table class="default">
		<c:set var="num1" value="1"></c:set>
		<caption>레시피게시판</caption>
		<tr>
			<th>번호</th>
			<th>레시피</th>
			<th>등록일</th>
			<th>삭제여부</th>
		</tr>
		<c:if test="${empty mypage }">
			<tr>
				<td colspan="5">데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty mypage }">
			<c:forEach var="mypage" items="${mypage }">
			<c:forEach var="recipe" items="${recipe }">
		<c:if test="${mypage.r_num==recipe.r_num }">
				<tr>
					<td>${num1 }</td>
					<c:if test="${mypage.my_del=='y'}">
						<td colspan="4">데이터가 삭제되었습니다.</td>
					</c:if>
					<c:if test="${mypage.my_del!='y' }">
					<%-- <td>
					<c:if test="${not empty mypage.m_id }">${mypage.m_id }</c:if>
					<c:if test="${not empty mypage.u_id }">${mypage.u_id }</c:if>
					</td> --%>
					
					<td>
						<c:if test="${mypage.r_num==recipe.r_num }">
						<a href="../recipe/content.do?r_num=${mypage.r_num }">${recipe.r_title}</a>
						</c:if>
					</td>
					<td>${mypage.my_reg_date}</td>
					<td>${mypage.my_del}</td>
					</c:if>
				</tr>
				<c:set var="num1" value="${num1+1 }"></c:set>
		</c:if>
		</c:forEach>
			</c:forEach>
			</c:if>
	</table>
	
	<table class="default">
		<c:set var="num2" value="1"></c:set>
		<caption>메거진게시판</caption>
		<tr>
			<th>번호</th>
			<th>매거진</th>
			<th>등록일</th>
			<th>삭제여부</th>
		</tr>
		<c:if test="${empty mypage }">
			<tr>
				<td colspan="5">데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty mypage }">
		
			<c:forEach var="mypage" items="${mypage }">
			<c:forEach var="magazine" items="${magazine }">
			<c:if test="${mypage.ma_num==magazine.ma_num }">
				<tr>
					<td>${num1 }</td>
					<c:if test="${mypage.my_del=='y'}">
						<td colspan="4">데이터가 삭제되었습니다.</td>
					</c:if>
					<c:if test="${mypage.my_del!='y' }">
					<%-- <td>
					<c:if test="${not empty mypage.m_id }">${mypage.m_id }</c:if>
					<c:if test="${not empty mypage.u_id }">${mypage.u_id }</c:if>
					</td> --%>
					<td> 
						<c:if test="${mypage.ma_num==magazine.ma_num }">
							<a href="../magazine/content.do?ma_num=${mypage.ma_num }">${magazine.ma_title}</a>
						</c:if>
					</td>
					
					<td>${mypage.my_reg_date}</td>
					<td>${mypage.my_del}</td>
					</c:if>
				</tr>
				<c:set var="num2" value="${num2+1 }"></c:set>
				</c:if>
				</c:forEach>
			</c:forEach>
		</c:if>
	</table>
	<P>
	<div align="right">
			<a href="../index.jsp">메인홈</a> <img alt=""
				src="../images/arrow-up-icon.png" width="100px" height="100px">
		</div>
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