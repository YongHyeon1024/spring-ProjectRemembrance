<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<body>
	<h3>게시판 내용</h3>
	<main class="login-form">
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-5">
				<div class="card">
					<div class="card-header">게시판 내용</div>
					<form action="${pageContext.request.contextPath}/qb/qboardw.do"
						method="post">
						<div class="card-body">

							<div class="form-group row">
								<label for="email_address"
									class="col-md-4 col-form-label text-md-right">글번호</label>
								<div class="col-md-6" style="padding-bottom: 0px">
									<input type="text" id="user_id" class="form-control"
										name="user_id" readonly="readonly" value="${board.Q_NO }">
								</div>
							</div>

							<div class="form-group row">
								<label for="email_address"
									class="col-md-4 col-form-label text-md-right">제목</label>
								<div class="col-md-6" style="padding-bottom: 0px">
									<input type="text" id="user_id" class="form-control"
										name="user_id" readonly="readonly" value="${board.Q_TITLE }">
								</div>
							</div>

							<div class="form-group row">
								<label for="email_address"
									class="col-md-4 col-form-label text-md-right">내용</label>
								<div class="col-md-6" style="padding-bottom: 0px">
									<input type="text" id="user_id" class="form-control"
										name="user_id" readonly="readonly" value="${board.Q_CONTENT }">
								</div>
							</div>

							<div class="form-group row">
								<label for="email_address"
									class="col-md-4 col-form-label text-md-right">작성자</label>
								<div class="col-md-6" style="padding-bottom: 0px">
									<input type="text" id="user_id" class="form-control"
										name="user_id" readonly="readonly" value="${board.Q_WRITER }">
								</div>
							</div>

							<div class="form-group row">
								<label for="email_address"
									class="col-md-4 col-form-label text-md-right">조회수</label>
								<div class="col-md-6" style="padding-bottom: 0px">
									<input type="text" id="user_id" class="form-control"
										name="user_id" readonly="readonly" value="${board.Q_HIT }">
								</div>
							</div>

							<div class="col-md-6 offset-md-4">
								<p></p>
								<c:if test="${prev != 0 }">
									<button type="button" class="btn btn-primary btn-sm"
										onclick="location.href='main.do?menu=3&no=${prev}'">이전글</button>
								</c:if>
								<button type="button" class="btn btn-primary btn-sm"
									onclick="location.href='main.do?menu=3'">목록으로</button>
								<c:if test="${next != 0 }">
									<button type="button" class="btn btn-primary btn-sm"
										onclick="location.href='main.do?menu=3&no=${next}'">다음글</button>
								</c:if>

							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</main>
</body>
</html>