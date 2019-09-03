<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>Credit</title>
</head>
<body>
	<div class="team" align="center">
		<div class="container">

			<div class="row">
				<div class="col-lg-6 col-lg-offset-3 text-center">
					<h2>
						<span class="ion-minus"></span>Our Team<span class="ion-minus"></span>
					</h2>
					<p>언젠가는 Spring을 마스터 하고 싶습니다.</p>
					<br>
				</div>
			</div>

			<div class="row text-center">
			
			
			<div class="row text-center">

					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
						<img class="img-rounded" alt="team-photo"
							src="${pageContext.request.contextPath }/resources/images/Hansol.jpg"
							width="50%">
						<div class="team-member">
							<h4>HanSol Lee</h4>
							<p>Front-End Designer / DB Constructor</p>
						</div>
						<p class="social">
							<a href="https://github.com/jackson1088" target="_blank"><span
								class="fa fa-github fa-3x"></span></a>
						</p>
					</div>

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<img class="img-rounded" alt="team-photo"
						src="${pageContext.request.contextPath }/resources/images/Koo.jpg"
						width="50%">
					<div class="team-member">
						<h4>YoonMo Koo</h4>
						<p>Project Manager </br> Spring Web Project Back-End Developer</p>
					</div>
					<p class="social">
						<a href="https://github.com/Pastelkun99" target="_blank"><span
							class="fa fa-github fa-3x"></span></a>
					</p>
				</div>

				

					<div class="row text-center">

						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
							<img class="img-rounded" alt="team-photo"
								src="${pageContext.request.contextPath }/resources/images/YongHyun.jpg"
								width="50%">
							<div class="team-member">
								<h4>YongHyun Park</h4>
								<p>Script Developer / Back-End Developer</p>
							</div>
							<p class="social">
								<a href="https://github.com/tmp20190820" target="_blank"><span
									class="fa fa-github fa-3x"></span></a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		</br>
		</br>
		</br>
		<a href="${pageContext.request.contextPath }/main.do" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">메인으로 돌아가기</a>
	</div>
</body>
</html>