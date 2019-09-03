<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/main.do">Remember Project</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<%-- <div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
			</ul>
			
			<div class="form-inline my-2 my-lg-0" style="margin-right:80px">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 사용자 메뉴 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<c:if test="${sessionScope.login_check ne null }">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/word/wordstart.do">학습 시작</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/word/wordcard.do">단어장 관리</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/logout.do">로그 아웃</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/user/userUpdate.do">사용자 정보 수정</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/user/userDelete.do">사용자 삭제</a>
						</c:if>
						<c:if test="${sessionScope.login_check eq null }">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/login.do">로그인</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/register.do">사용자 등록</a>
						</c:if>
						</div></li>
				</ul>
			</div>
		</div> --%>
	</nav>
	<p>
	</p>