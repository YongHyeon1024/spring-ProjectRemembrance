<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<main class="login-form">
<div class="cotainer">
	<div class="row justify-content-center">
		<div class="col-md-5">
			<div class="card">
				<div class="card-header">사용자 정보수정</div>
				<form action="${pageContext.request.contextPath }/user/userUpdate.do"
					method="post">
					<div class="card-body">
						<div class="form-group row">
							<label for="email_address"
								class="col-md-4 col-form-label text-md-right">사용자 이름</label>
							<div class="col-md-6" style="padding-bottom: 0px">
								<input type="text" id="user_id" class="form-control"
									name="user_id" readonly="readonly" value="${user.user_id }">
							</div>
						</div>
						
						<div class="form-group row">
							<label for="motto" class="col-md-4 col-form-label text-md-right">수정할 이름
								</label>
							<div class="col-md-6">
								<input type="text" id="user_name" class="form-control"
									name="user_name" value="${user.user_name }" required>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="motto" class="col-md-4 col-form-label text-md-right">수정할 나이
								</label>
							<div class="col-md-6">
								<input type="text" id="user_age" class="form-control"
									name="user_age" value="${user.user_age }" required>
							</div>
						</div>

						<div class="form-group row">
							<label for="password"
								class="col-md-4 col-form-label text-md-right">이전 비밀번호</label>
							<div class="col-md-6">
								<input type="password" id="user_pw_before" class="form-control"
									name="user_pw_before" oninput="return chkOldPw()">
								<div id="pwchecktext"
									style="text-align: center; margin-left: 0px; margin-bottom: 0px;"></div>
							</div>
						</div>

						<div class="form-group row">
							<label for="password_confirm"
								class="col-md-4 col-form-label text-md-right">새 비밀번호</label>
							<div class="col-md-6">
								<input type="password" id="user_pw" class="form-control"
									name="user_pw" oninput="return checkNewPw()" required>
							</div>
						</div>

						<div class="form-group row">
							<label for="password_confirm"
								class="col-md-4 col-form-label text-md-right">새 비밀번호 확인</label>
							<div class="col-md-6">
								<input type="password" id="user_pw_confirm" class="form-control"
									name="user_pw_confirm" oninput="return checkNewPw()" required>
							</div>
						</div>

						<div class="form-group row">
							<label for="motto" class="col-md-4 col-form-label text-md-right">자기소개
								수정</label>
							<div class="col-md-6">
								<input type="text" id="motto" class="form-control"
									name="user_motto" value="${user.user_motto }" required>
							</div>
						</div>

						<div class="col-md-6 offset-md-4">
							<button type="submit" id="updatebtn" class="btn btn-primary" onclick="location:href='${pageContext.request.contextPath}/main.do'">정보수정</button>
							<a href="${pageContext.request.contextPath }" class="btn btn-primary" role="button">취소</a>
							<br /> <br />
							<button type="button" class="btn btn-danger" data-toggle="modal"
								data-target="#userdeleteModal">사용자 제거</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</main>

<script>

	var chkop = 0;
	var chknp = 0;

	function chkOldPw() {
		var inputed = $('#user_pw_before').val();
		console.log(inputed);

		$.ajax({
			type : 'post',
			data : {
				user_pw_before : inputed
			},
			// 레스트 컨트롤러 이름 적시
			url : "/remember/checkPw.do",
			success : function(data) {
				if (data == 1) {
					// 가능한경우
					$('#updatebtn').prop("disabled", false);
					$('#user_pw').prop("disabled", false);
					chkop = 1;
				} else {
					$('#updatebtn').prop("disabled", true);
					$('#user_pw').prop("disabled", true);
					chkop = 0;
				}
			}
		});
	}
	
	function checkNewPw() {
		var pwInputed = $('#user_pw').val();
		var check = $('#user_pw_confirm').val();

		if (check == "") {
			$('#updatebtn').prop("disabled", true);
			chknp = 0;
		} else if (pwInputed == check) {
			chknp = 1;
			if(chknp == 1) {
				$('#updatebtn').prop("disabled", false);
			}
		} else if (pwInputed != check) {
			$('#updatebtn').prop("disabled", true);
			chknp = 0
		}
	}
</script>