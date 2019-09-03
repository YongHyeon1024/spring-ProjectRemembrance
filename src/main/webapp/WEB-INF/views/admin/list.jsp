<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원목록</title>
	<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    
    <script>
        $(function(){
            $("#dt_table").DataTable({
            	 paging : false
            });
        });
    </script>
</head>

<body>
	<div style="width:600px; margin:0 auto; margin-top:10px">
		<table id="dt_table" class="table table-bordered">
	        <thead>
	            <tr>
	            	<th>아이디</th>
	            	<th>이름</th>
	            	<th>나이</th>
	            	<th>등급</th>
	            	<th>가입일자</th>
	            	<th>좌우명</th>
	            </tr>
	        </thead>
	        <tbody>
	        	<c:forEach var="tmp" items="${list}">
	            	<tr>
	            		<td>${tmp.USER_ID}</td>
	            		<td>${tmp.USER_NAME}</td>
	            		<td>${tmp.USER_AGE}</td>
	            		<td>${tmp.USER_AGE}</td>
	            		<td>${tmp.USER_SIGN_DATE}</td>
	            		<td>${tmp.USER_MOTO}</td>
	            	</tr>
	            </c:forEach>
	        </tbody>
	    </table>
    </div>

</body>
</html>