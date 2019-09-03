<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>게시판 목록</h3>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>날짜</th>	
		</tr>
		
		<c:forEach var="map" items="${list}">
		<tr>
			<td>${map.Q_NO}</td>
			<td><a href="main.do?menu=${param.menu}&no=${map.Q_NO}">${map.Q_TITLE}</a></td>
			<td>${map.Q_WRITER}</td>
			<td>${map.Q_HIT}</td>
			<td>${map.Q_DATE}</td>	
		</tr>
		</c:forEach>
	</table>
	
	<a href="qboardw.do" href="${pageContext.request.contextPath}/main.do?menu=1">게시판 글쓰기</a>
	
	<c:if test="${param.menu == 1}">
		<jsp:include page="qboard.jsp"></jsp:include>
	</c:if>
	
</body>
</html>