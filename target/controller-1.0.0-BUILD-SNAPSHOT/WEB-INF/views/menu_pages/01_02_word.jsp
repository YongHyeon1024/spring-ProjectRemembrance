<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%-- <jsp:include page="./navigation.jsp"></jsp:include> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script> --%>

<div align="center">
	<h2>${sessionScope.card_name } 단어장</h2>
	</br>
	</br>
	<c:forEach var="word" items="${list }">
		<div align="center" style="width: 650px; height: auto;">
			<div class="alert alert-light" role="alert" id="front">${word.q_no}. ${word.q_front }</div>
			<p>
				<button class="btn btn-primary" type="button" data-toggle="collapse"
					data-target="#collapseExample${word.q_no }" aria-expanded="false"
					aria-controls="collapseExample">Show & Hide Answer</button>
			</p>
			<div class="collapse" id="collapseExample${word.q_no }">
				<div class="card card-body" id="back">${word.q_back}</div>
				</br>
				<button class="btn btn-danger" type="button" onclick="">틀렸음</button>
				<button class="btn btn-success" type="button">맞혔음</button>
			</div>
		</div>
		</br>
		</br>
	</c:forEach>
</div>

<%-- <script src="${pageContext.request.contextPath}/resources/js/word.js"></script> --%>

