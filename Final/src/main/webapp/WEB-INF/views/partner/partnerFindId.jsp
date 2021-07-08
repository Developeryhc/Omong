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
							<h2>아이디 찾기</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->
	<div class="section-top-border" style="text-align: center;">
		<div class="section-top-border"
			style="margin: 0 auto; width: 480px;">
			<form action="/partnerIdFind.do">
				<h4 style="text-align: left;">핸드폰 번호</h4>
				<div class="mt-10">
					<input type="text" name="phone" placeholder="(-)을 제외하고 적어주세요" class="single-input">
				</div>
				<hr>
				<h4 style="text-align: left;">대표자명</h4>
				<div class="mt-10">
					<input type="text" name="ceo" placeholder="이름을 입력하세요" class="single-input">
				</div>
				<br>
				<br>
				<div style="text-align: center;">
					<input type="submit" value="아 이 디 찾 기" class="genric-btn info e-large" style="width: 300px; font-size: x-large; font-weight: bold;">
				</div>
			</form>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>