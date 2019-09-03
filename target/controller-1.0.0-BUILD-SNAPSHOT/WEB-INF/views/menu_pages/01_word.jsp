<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> --%>
<%-- <jsp:include page="./navigation.jsp"></jsp:include> --%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<div align="center">
	<h2>${param.level} 단어장입니다.</h2>
	<div align="center" style="width: 650px; height: auto;">
		<div class="alert alert-light" role="alert" id="front">Quiz Front</div>
		<p>
			<button class="btn btn-primary" type="button" data-toggle="collapse"
				data-target="#collapseExample" aria-expanded="false"
				aria-controls="collapseExample" id="showanswer">Show & Hide Answer</button>
			
		</p>
		<div class="collapse" id="collapseExample">
			<div class="card card-body" id="back">Quiz Back</div>
			</br>
			<button class="btn btn-danger" type="button" onclick="btn_x();">틀렸음</button>
			<button class="btn btn-success" type="button" onclick="btn_o();">맞혔음</button>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/word.js"></script>