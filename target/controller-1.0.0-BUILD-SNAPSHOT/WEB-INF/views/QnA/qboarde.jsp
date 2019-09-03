<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h3>게시판 수정</h3>
	<form action="${pageContext.request.contextPath}/qboarde.do" method="post">
		<table border="1">
			<tr>
				<th>글번호</th>
				<td><input type="text" style="background-color: #cccccc" name="no" value="${map.Q_NO}" readonly  /></td>
			</tr>
			<tr>	
				<th>제목</th>
				<td><input type="text" name="title" value="${map.Q_TITLE}" /></td>
			</tr>		
			<tr>	
				<th>내용</th>
				<td><textarea rows="6" name="content">${map.Q_CONTENT}</textarea></td>
			</tr>
			<tr>	
				<th>작성자</th>
				<td><input type="text" name="writer" value="${map.Q_WRITER}" /></td>
			</tr>
			<tr>	
				<th>조회수</th>
				<td><input type="text" style="background-color: #cccccc" value="${map.Q_HIT}" readonly /></td>
			</tr>
			<tr>	
				<th>날짜</th>
				<td><input type="text" style="background-color: #cccccc" value="${map.Q_DATE}" readonly /></td>
			</tr>	
		</table>
		
		<input type="submit" value="글수정" />
	</form>
</body>
</html>