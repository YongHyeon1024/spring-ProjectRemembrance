<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true" pageEncoding="UTF-8"%>
<html>
<head>
<%-- <jsp:include page="bootstrap.jsp"></jsp:include> --%>
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
<style>
p {
	font-family: "Nanum Gothic", sans-serif;
	font-size: 15px;
}

p.a {
	font-weight: 400;
}

p.b {
	font-weight: 700;
}

p.c {
	font-weight: 800;
}

p.d {
	font-weight: bold;
}
</style>
<title>Remembrance Project</title>
</head>


<body id="page-top">
	<%-- 	<jsp:include page="navigation.jsp"></jsp:include> --%>

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
		<a class="navbar-brand mr-1"
			href="${pageContext.request.contextPath}/main.do">Word_Remembrance</a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar Search -->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				
			</div>
		</form>

		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">
			
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<c:if test="${sessionScope.login_check eq null }">
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/main.do?menu=5">로그인</a>
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/main.do?menu=4">회원가입</a>
					</c:if>
					<c:if test="${sessionScope.login_check ne null }">
						<div class="dropdown-divider"></div>
						<%
							String myid = (String) session.getAttribute("login_check");
						%>
						<a class="dropdown-item"> <FONT COLOR="#FF0000"> <strong>
									[<%=myid%>]님 로그인
							</strong>
						</FONT>
						</a>
						<!-- <a class="dropdown-item" href="#">활동 내역</a> -->
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/main.do?menu=2">나의
							계정 수정</a>
						<a class="dropdown-item" href="#" data-toggle="modal"
							data-target="#logoutModal">로그아웃</a>
					</c:if>
				</div></li>
		</ul>
	</nav>


	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="main.do">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle"
				href="${pageContext.request.contextPath}/main.do?menu=1"
				id="pagesDropdown" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> <i
					class="fas fa-fw fa-table"></i> <span>Word Start</span></a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<c:if test="${sessionScope.login_check ne null}">
						<%-- <a class="dropdown-item"
							href="${pageContext.request.contextPath}/main.do?menu=1">학습
							시작</a> --%>
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/main.do?menu=11">단어장
							관리</a>
					</c:if>
					<c:if test="${sessionScope.login_check eq null }">
						<a class="dropdown-item">로그인이 필요해요!</a>
					</c:if>
					<%-- <a class="dropdown-item" href="${pageContext.request.contextPath}/main.do?menu=3">QnA</a> --%>
				</div></li>
	
			<c:if test="${sessionScope.login_check ne null}">
				<li class="nav-item"><a class="nav-link" href="main.do"> <i
					class="fas fa-fw fa-chart-area"></i> <span>Activity Charts</span></a></li>

				<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/main.do?menu=3"> <i
					class="fas fa-fw fa-phone"></i> <span>QnA Page</span></a></li>
			</c:if>
			
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/credit.do"> <i
					class="fas fa-fw fa-glasses"></i> <span>Credit</span></a></li>		
					
		</ul>

		<div id="content-wrapper">

			<div class="container-fluid">

				<c:if test="${param.menu == 0 || param.menu == null}">
					<jsp:include page="menu_pages/00_home.jsp"></jsp:include>
				</c:if>

				<c:if test="${param.menu == 1}">
					<jsp:include page="menu_pages/01_word.jsp"></jsp:include>
				</c:if>

				<c:if test="${param.menu == 2}">
					<jsp:include page="menu_pages/02_userUpdate.jsp"></jsp:include>
				</c:if>

				<c:if test="${param.menu == 3}">
					<c:if test="${param.no eq null }">
						<jsp:include page="menu_pages/03_qboard.jsp"></jsp:include>
					</c:if>
					<c:if test="${param.no ne null }">
						<jsp:include page="QnA/qboardc.jsp"></jsp:include>
					</c:if>
				</c:if>

				<c:if test="${param.menu == 4}">
					<jsp:include page="menu_pages/04_register.jsp"></jsp:include>
				</c:if>

				<c:if test="${param.menu == 5}">
					<jsp:include page="menu_pages/05_login.jsp"></jsp:include>
				</c:if>

				<c:if test="${param.menu == 6 }">
					<jsp:include page="menu_pages/06_basic.jsp"></jsp:include>
				</c:if>

				<c:if test="${param.menu == 7 }">
					<jsp:include page="menu_pages/07_medium.jsp"></jsp:include>
				</c:if>

				<c:if test="${param.menu == 9 }">
					<jsp:include page="menu_pages/09_wordcard.jsp"></jsp:include>
				</c:if>

				<c:if test="${param.menu == 10 }">
					<jsp:include page="menu_pages/10_custom.jsp"></jsp:include>
				</c:if>

				<c:if test="${param.menu == 11 }">
					<jsp:include page="menu_pages/11_makeWordCard.jsp"></jsp:include>
				</c:if>

				<!-- QnA게시판 글쓰기 -->
				<c:if test="${param.menu == 12 }">
					<jsp:include page="QnA/qboardw.jsp"></jsp:include>
				</c:if>
			
			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>



	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">로그아웃 하시겠습니까?</div>
				<div class="modal-footer">
					<a class="btn btn-primary"
						href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="userdeleteModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">회원 삭제</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">사용자 정보를 삭제하면, 단어장 데이터와 같은 모든 개인 데이터가
					삭제돼요! 이 작업은 돌이킬 수 없으니 주의하세요! 정말 사용자 정보를 삭제하시겠어요?</div>
				<div class="modal-footer">
					<a class="btn btn-danger"
						href="${pageContext.request.contextPath}/user/userDelete.do">사용자
						삭제</a>
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/js/sb-admin.min.js"></script>

	<!-- Demo scripts for this page-->
	<script
		src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script>
</body>
</html>
