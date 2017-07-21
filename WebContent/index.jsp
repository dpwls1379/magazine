<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="session/sessionChk.jsp"%>
<!DOCTYPE HTML>
<!--
	Strongly Typed by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Strongly Typed by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/skel-viewport.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#load').load('boardId.do');
// 		$('#login').css({
// 			'text-align':'right'
// 		});
		$('#album').load('animation-canvas.html');
	});
</script>
</head>
<body class="homepage">
	<div id="page-wrapper">
		<!-- Header -->
		<div id="header-wrapper">
			<div id="header" class="container">
				<!-- Logo -->
				<h1 id="logo">
					<a href="index.jsp">EVERY RECIPE</a>
				</h1>
				<p> ※ 이 세상의 모든 레시피 ※</p>
				
				<!-- 아이디 세션 확인  -->
				<c:if test="${u_id==null&&m_id==null }">
					<ul class="actions">
						<li><a href="member/loginForm.jsp"
							class="button icon fa-file">LOGIN</a></li>
						<li><a href="member/joinForm.jsp" class="button icon fa-file">JOIN</a></li>
					</ul>
				</c:if>
				<c:if test="${u_id!=null }">
					<ul class="actions">
						<li><a href="member/logout.jsp" class="button icon fa-file">LOGOUT</a></li>
					</ul>
				</c:if>
				<c:if test="${m_id!=null }">
					<ul class="actions">
						<li><a href="manager/logout.jsp" class="button icon fa-file">LOGOUT</a></li>
					</ul>
				</c:if>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a class="icon fa-home" href="index.jsp"><span>HOME</span></a></li>
						<li><a href="#load" class="icon fa-bar-chart-o"><span>게시판</span></a>
							<ul>
								<li><a href="recipe/list.do">레시피 게시판</a></li>
								<li><a href="magazine/list.do">메거진 게시판</a></li>
								<li><a href="boardA/list.do">회원 게시판</a></li>
							</ul></li>
						<li><a href="#" class="icon fa-bar-chart-o"><span>회원</span></a>
							<ul>
								<c:if test="${empty u_id && empty m_id }">
									<li><a href="member/loginForm.jsp">로그인</a></li>
									<li><a href="member/joinForm.jsp">회원가입</a></li>
								</c:if>
								<c:if test="${not empty m_id }">
									<li><a href="manager/mgrIndex.jsp">관리자페이지</a></li>
								</c:if>
								<c:if test="${not empty u_id || not empty m_id }">
									<li><a href="mypage/index.jsp">마이페이지</a>
										<ul>
											<li><a href="mypage/mylist.do">내가 쓴 글</a></li>
											<li><a href="mypage/mysave.do">내가 담은 글</a></li>
										</ul></li>
								</c:if>
							</ul></li>
						<li><a class="icon fa-cog" href="manager/loginForm.jsp">
								<span>MASTER</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<div></div>
		<!-- Features -->
		<div id="features-wrapper">
			<section id="features" class="container">
				<div class="row">
					<div class="4u 12u(mobile)">

						<!-- Feature -->
						<section>
							<a href="recipe/list.do" class="image featured"><img src="images/e.jpg" alt="레시피 게시판" /></a>
							<header>
								<h3>레시피 게시판입니다</h3>
							</header>
							<p>
								요리를 좋아하는 모든 회원들이 자기만의 <strong>레시피</strong>를 얘기해 주세요
							</p>
						</section>

					</div>
					<div class="4u 12u(mobile)">

						<!-- Feature -->
						<section>
							<a href="magazine/list.do" class="image featured"><img src="images/f.jpg" alt="" /></a>
							<header>
								<h3>매거진 게시판입니다</h3>
							</header>
							<p>
								생활 속 <strong>여러가지</strong> 정보와 관리자가 올리고 싶은것만 올리는 곳! 와서 구경 하세요
							<p>
						</section>

					</div>
					<div class="4u 12u(mobile)">

						<!-- Feature -->
						<section>
							<a href="boardA/list.do" class="image featured"><img
								src="images/g.jpg" alt="" /></a>
							<header>
								<h3>회원 게시판입니다</h3>
							</header>
							<p>
								오직 <strong>회원</strong>만이 자유롭게 대화를 나눌 수 있는 공간입니다. 회원가입 또는 로그인을 통해
								회원들과 자유롭게 대화를 나누어 보세요.
							</p>
						</section>

					</div>
				</div>
			</section>
		</div>
		
		<!-- Banner -->
		
		<div id="album"></div>
		
		<!-- <div id="banner-wrapper">
		
			<div class="inner">
				<section id="banner" class="container">
					<p>
						<strong>오늘의 추천요리</strong><br /> <a href="magazine/list.do">여기</a>를
						클릭하세요
					</p>
				</section>
			</div>
		</div> -->
		
		<!-- footer -->
		<div id="load"></div>
	</div>

</body>
</html>