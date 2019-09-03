<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> --%>
<%-- <jsp:include page="./navigation.jsp"></jsp:include> --%>

<h2>
	Basic Level <span class="badge badge-secondary">New</span>
</h2>
<p></p>



<div class="container">
	<div class="row">
		<div class="col-4">
			<div class="card" style="width: 18rem;">
				<img
					src="https://images.unsplash.com/photo-1434030216411-0b793f4b4173?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"
					class="card-img-top" alt="">
				<div class="card-body">
					<h5 class="card-title">생활 필수 영단어</h5>
					<p class="card-text">이것도 모르면 TV도 못봐요!</p>
					<a href="${pageContext.request.contextPath }/main.do?menu=1&level=BASIC_LIVE" class="btn btn-primary">학습하기</a>
				</div>
			</div>
		</div>
		<div class="col-4">
			<div class="card" style="width: 18rem;">
				<img
					src="https://images.unsplash.com/photo-1434030216411-0b793f4b4173?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"
					class="card-img-top" alt="">
				<div class="card-body">
					<h5 class="card-title">중학교 3학년 지학사 영어</h5>
					<p class="card-text">교과서에 나오는 단어를 Master!</p>
					<a href="#" class="btn btn-primary">학습하기</a>
				</div>
			</div>
		</div>
	</div>
</div>





