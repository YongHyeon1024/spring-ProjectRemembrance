<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>회원정보수정</title>
<jsp:include page="../bootstrap.jsp"></jsp:include>
</head>
<body>
	<%-- <form action="userUpdate.do" method="post">
		사용자 이름 : <input type="text" name="user_id" value="${user.user_id }" readonly/><br/>
		이전 비밀번호 : <input type="password" name="user_pw_before"/><br/>
		비밀번호 : <input type="password" name="user_pw"/><br/>
		비밀번호 확인 : <input type="password" name="user_pw_confirm"/><br/>
		자기소개 : <input type="text" name="user_motto" value="${user.user_motto }"/><br/>
		<input type="submit" value="수정하기"/>
		<input type="button" value="취소" onclick="/main.do"/>
	</form> --%>

<jsp:include page="../navigation.jsp"></jsp:include>

	<main class="login-form">
	<div class="cotainer">
		<div class="row justify-content-center">
			<div class="col-md-5">
				<div class="card">
					<div class="card-header">사용자 정보수정</div>
					<div class="card-body">
					
						<form action="userUpdate.do" method="post">
							<div class="form-group row">
								<label for="email_address"
									class="col-md-4 col-form-label text-md-right">사용자 이름</label>
								<div class="col-md-6" style="padding-bottom:0px">
									<input type="text" id="user_id" class="form-control" name="user_id" readonly="readonly" value="${user.user_id }">
								</div>
							</div>

							<div class="form-group row">
								<label for="password"
									class="col-md-4 col-form-label text-md-right">이전 비밀번호</label>
								<div class="col-md-6">
									<input type="password" id="user_pw_before" class="form-control"	name="user_pw_before" oninput="return pwChangeCheck()" required>
									<div id="pwchecktext" style="text-align:center; margin-left:0px; margin-bottom:0px;"></div>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="password_confirm"
									class="col-md-4 col-form-label text-md-right">새 비밀번호</label>
								<div class="col-md-6">
									<input type="password" id="user_pw" class="form-control" name="user_pw" required>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="password_confirm"
									class="col-md-4 col-form-label text-md-right">새 비밀번호 확인</label>
								<div class="col-md-6">
									<input type="password" id="user_pw_confirm" class="form-control" name="user_pw_confirm" required>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="motto"
									class="col-md-4 col-form-label text-md-right">자기소개 수정</label>
								<div class="col-md-6">
									<input type="text" id="motto" class="form-control" name="user_motto" value="${user.user_motto }" required>
								</div>
							</div>

							<div class="col-md-6 offset-md-4">
								<button type="submit" id="updatebtn" class="btn btn-primary">정보수정</button>
								<button type="button" class="btn btn-primary" onclick="location.href='../main.do'">취소</button>
								<br/><br/>
								<button type="button" class="btn btn-danger" onclick="location.href='userDelete.do'">사용자 제거</button>
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
	
	</script>
</body>
</html>