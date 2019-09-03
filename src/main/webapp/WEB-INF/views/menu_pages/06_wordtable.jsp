<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true" pageEncoding="UTF-8"%>


<table class="table table-hover">
<h2>Word Table</h2>
</br>
	<thead>
		<tr>
		  <th scope="col"></th>
		  <th scope="col">front</th>
		  <th scope="col">back</th>
		  <th scope="col">hit</th>
		  <th scope="col"></th>
		</tr>
	</thead>
	<tbody>	
		<c:forEach var="vo" items="${list}">
			<tr>
			  <th scope="row">
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" id="customCheck${vo.q_no}">
					<label class="custom-control-label" for="customCheck${vo.q_no}"></label>
				</div>
			  </th>
			  <td>${vo.q_front}</td>
			  <td>${vo.q_back}</td>
			  <td>${vo.q_hit}</td>
			  <td>
				<button type="button" class="btn btn-primary" onclick=";">update</button>
			  </td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<button type="button" class="btn btn-primary" onclick=";">+</button>