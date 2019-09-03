<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true" pageEncoding="UTF-8"%>


<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<!-- Breadcrumbs-->
<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
	<li class="breadcrumb-item active">Overview</li>
</ol>

<!-- Icon Cards-->
<div class="row">
	<div class="col-xl-3 col-sm-6 mb-3">
		<div class="card text-white bg-success o-hidden h-100">
			<div class="card-body">
				<div class="card-body-icon">
					<i class="fas fa-fw fa-shopping-cart"></i>
				</div>
				<div class="mr-5">Basic Level</div>
			</div>
			<a class="card-footer text-white clearfix small z-1" href="${pageContext.request.contextPath }/main.do?menu=6"> <span
				class="float-left">View Details</span> <span class="float-right">
					<i class="fas fa-angle-right"></i>
			</span>
			</a>
		</div>
	</div>
	
	<div class="col-xl-3 col-sm-6 mb-3">
		<div class="card text-white bg-warning o-hidden h-100">
			<div class="card-body">
				<div class="card-body-icon">
					<i class="fas fa-fw fa-list"></i>
				</div>
				<div class="mr-5">Medium Level</div>
			</div>
			<a class="card-footer text-white clearfix small z-1" href="${pageContext.request.contextPath }/main.do?menu=7"> <span
				class="float-left">View Details</span> <span class="float-right">
					<i class="fas fa-angle-right"></i>
			</span>
			</a>
		</div>
	</div>
	
	<div class="col-xl-3 col-sm-6 mb-3">
		<div class="card text-white bg-danger o-hidden h-100">
			<div class="card-body">
				<div class="card-body-icon">
					<i class="fas fa-fw fa-life-ring"></i>
				</div>
				<div class="mr-5">Expert Level</div>
			</div>
			<a class="card-footer text-white clearfix small z-1" href="${pageContext.request.contextPath }/main.do?menu=8"> <span
				class="float-left">View Details</span> <span class="float-right">
					<i class="fas fa-angle-right"></i>
			</span>
			</a>
		</div>
	</div>
	<div class="col-xl-3 col-sm-6 mb-3">
		<div class="card text-white bg-primary o-hidden h-100">
			<div class="card-body">
				<div class="card-body-icon">
					<i class="fas fa-fw fa-comments"></i>
				</div>
				<div class="mr-5">Custom Level</div>
			</div>
			<a class="card-footer text-white clearfix small z-1" href="${pageContext.request.contextPath }/main.do?menu=9"> <span
				class="float-left">View Details</span> <span class="float-right">
					<i class="fas fa-angle-right"></i>
			</span>
			</a>
		</div>
	</div>
</div>

<!-- Area Chart Example-->
<div class="card mb-3">
	<div class="card-header">
		<i class="fas fa-chart-area"></i> Achievement Chart
	</div>
	<div class="card-body">
		<canvas id="myAreaChart" width="100%" height="30"></canvas>
	</div>
	<div class="card-footer small text-muted">
		Updated at
		<%Date now = new Date();
 			SimpleDateFormat sf = new SimpleDateFormat("yy년 MM월 dd일 E a hh:mm:ss"); 
 			String today = sf.format(now);%>
		<%= today %>
	</div>
</div>

<!-- DataTables Example -->
<div class="card mb-3">
	<div class="card-header">
		<i class="fas fa-table"></i> User Ranking
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered table-striped" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>학습횟수</th>
						<th>아이디</th>
						<th>이름</th>
						<th>나이</th>
						<th>등급</th>
						<th>가입일자</th>
						<th>좌우명</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="list" items="${userlist }">
					<tr>
						<td>${list.user_hit }</td>
						<td>${list.user_id }</td>
						<td>${list.user_name }</td>
						<td>${list.user_age }</td>
						<td>${list.user_grade }</td>
						<td>${list.user_sign_date }</td>
						<td>${list.user_motto }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="card-footer small text-muted">
		Updated at <%= today %>
	</div>
</div>