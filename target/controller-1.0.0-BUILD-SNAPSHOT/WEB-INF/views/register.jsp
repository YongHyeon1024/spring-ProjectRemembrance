<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up Here!</title>
<jsp:include page="bootstrap.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="navigation.jsp"></jsp:include>

	<main class="login-form">
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-5">
				<div class="card">
					<div class="card-header">사용자 회원등록</div>
					<div class="card-body">
					
						<form action="register.do" method="post">
							<div class="form-group row">
								<label for="email_address"
									class="col-md-4 col-form-label text-md-right">사용자 이름</label>
								<div class="col-md-6" style="padding-bottom:0px">
									<input type="text" id="user_id" class="form-control"
										name="user_id" required autofocus oninput="return checkId()">
									<div id="idchecktext" style="text-align:center; margin-left:0px; margin-bottom:0px;">
									</div>
								</div>
							</div>

							<div class="form-group row">
								<label for="password"
									class="col-md-4 col-form-label text-md-right">비밀번호</label>
								<div class="col-md-6">
									<input type="password" id="user_pw" class="form-control"
										name="user_pw" oninput="return checkPw()" required>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="password_confirm"
									class="col-md-4 col-form-label text-md-right">비밀번호 확인</label>
								<div class="col-md-6">
									<input type="password" id="user_pw_confirm" class="form-control"
										name="user_pw_confirm" oninput="return checkPw()" required>
									<div id="pwchecktext" style="text-align:center; margin-left:0px; margin-bottom:0px;">
									</div>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="motto"
									class="col-md-4 col-form-label text-md-right">자기소개</label>
								<div class="col-md-6">
									<input type="text" id="motto" class="form-control"
										name="user_motto" required>
								</div>
							</div>

							<div class="col-md-6 offset-md-4">
								<button type="submit" class="btn btn-primary" id="registerbtn" onclick="location:href='login.do'">회원등록</button>
							</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
	</main>
	
	<script>
/* 	#FA5858 : 빨간색
	#5858FA : 파란색
	#00FF40 : 녹색
	#81F79F : 녹색2
	#BDBDBD : 회색 */
	
	var idCheck = 0;
	var pwCheck = 0;
	
	function checkId() {
		var inputed = $('#user_id').val();
		console.log(inputed);
		
		$.ajax({
			data : {
				user_id : inputed
			},
			// 레스트 컨트롤러 이름 적시
			url : "/remember/checkId.do",
			success : function(data) {
				if(inputed == "" && data == '0') {
					/* 아무튼 회원 등록 불가능 상태 */
					$('#registerbtn').prop("disabled", true);
					$('#registerbtn').css("background-color", "#BDBDBD");
					$('#user_id').css("background-color", "#FA5858");
					$('#idchecktext').text('아이디를 입력해주세요.');
					$('#idchecktext').css("color", "#FA5858");
					idCheck = 0;
				}
				else if(data == '0') {
					/* 회원등록 가능 상태 */
					$('#user_id').css("background-color", "");
					$('#idchecktext').text('사용 가능한 아이디입니다.');
					$('#idchecktext').css("color", "#5882FA");
					idCheck = 1;
					if(idCheck == 1 && pwCheck == 1) {
						$('#registerbtn').prop("disabled", false);
						$('#registerbtn').css("background-color", "blue");						
					}
				} else if(data == '1') {
					/* 이미 db에 아이디가 존재하는 경우 */
					$('#registerbtn').prop("disabled", true);
					$('#registerbtn').css("background-color", "#BDBDBD");
					$('#user_id').css("background-color", "#F5A9A9");
					$('#idchecktext').text('이미 존재하는 아이디입니다.');
					$('#idchecktext').css("color", "#FF5858");
					idCheck = 0;
				} 
			}
		});
	}
	
	function checkPw() {
		var pwInputed = $('#user_pw').val();
		var check = $('#user_pw_confirm').val();
		
		if(check == "") {
			/* 비밀번호 확인 채우지 않은 경우 */
			$('#registerbtn').prop("disabled", true);
			$('#registerbtn').css('background-color', "#F5A9A9");
			$('#user_pw_confirm').css('background-color', '#F5A9A9');
			$('#pwchecktext').text('비밀번호 확인란을 입력해주세요.');
			$('#pwchecktext').css("color", "#FF0000");
		} else if(pwInputed == check) {
			pwCheck = 1;
			if(idCheck == 1 && pwCheck == 1) {
				$('#registerbtn').prop("disabled", false);
				$('#registerbtn').css("background-color", "#5882FA");
				$('#user_pw_confirm').css("background-color", "#81F79F");
				$('#pwchecktext').text('');
			}
		} else if(pwInputed != check) {
			pwCheck = 0;
			$('#registerbtn').prop("disabled", true);
			$('#registerbtn').css("background-color", "#F5A9A9");
			$('#user_pw_confirm').css("background-color", "#F5A9A9");
			$('#pwchecktext').text('비밀번호가 다릅니다.');
			$('#pwchecktext').css("color", "#BDBDBD");
		}
	}
	</script>
</body>
</html>