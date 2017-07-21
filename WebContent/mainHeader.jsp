<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
    <%@ include file="session/sessionChk.jsp" %>
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