<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg"
		style="background-image: url(/resources/img/main2.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>비밀번호 재설정</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->
	<div class="section-top-border" style="text-align: center;">
		<div class="section-top-border" style="margin: 0 auto; width: 480px;">
			<div>
				<h4 style="text-align: left;">아이디(이메일)</h4>
				<div class="mt-10">
					<input type="text" name="email" placeholder="아이디를 입혁하세요"
						class="single-input">
				</div>
				<hr>
				<h4 style="text-align: left;">이름</h4>
				<div class="mt-10">
					<input type="text" name="name" placeholder="이름을 입력하세요"
						class="single-input">
				</div>
				<br> <br>
				<button class="genric-btn primary-border" onclick="checkPw();">
					비밀번호 재설정</button>
				<input type="hidden" name="newPw" id="newPw">
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		function checkPw() {
			var email = $("[name=email]").val();
			var name = $("[name=name]").val();
			$.ajax({
				url : "/checkIdName.do",
				data : {
					email : email,
					name : name
				},
				type : "post",
				success : function(data) {
					if (data == 1) {
						alert("임시비밀번호 전송 완료");
						$.ajax({
							url : "/mailSend.do",
							data : {
								email : email
							},
							success : function(data) {
							}
						});
					} else {
						alert("아이디/이름를 확인해주세요");
					}
				}
			});
		}
	</script>
</body>
</html>