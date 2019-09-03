<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%-- <jsp:include page="./navigation.jsp"></jsp:include> --%>

<div class="container">
	<br/>
	<div class="jumbotron">
		<h1 class="display-4">안녕하세요. ${sessionScope.login_check }님!</h1>
		<p class="lead">여기에서는 ${sessionScope.login_check }님이 만든 개인 단어장을 관리할 수 있어요.</p>
		<hr class="my-4">
		<p></p>
		<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath }/main.do?menu=11" role="button">단어장 만들기</a>
	</div>
	
	<c:if test="${sessionScope.login_check ne null }">
		<div class="card" style="width: 18rem;">
  			<div class="card-body">
   			 <h5 class="card-title">QUIZCARD</h5>
    			<h6 class="card-subtitle mb-2 text-muted">개인 단어장</h6>
   			 <p class="card-text">단어장</p>
   			 <a href="${pageContext.request.contextPath }/main.do?menu=1&level=QUIZCARD" class="card-link">학습하기</a>
 		 </div>
		</div>
	</c:if>
</div>

