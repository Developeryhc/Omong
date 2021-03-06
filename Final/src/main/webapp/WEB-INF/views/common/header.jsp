<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/resources/css/common/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="/resources/css/common/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="/resources/css/common/owl.carousel.min.css">
<!-- themify CSS -->
<link rel="stylesheet" href="/resources/css/common/themify-icons.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="/resources/css/common/flaticon.css">
<!-- fontawesome CSS -->
<link rel="stylesheet"
	href="/resources/css/commonfontawesome/css/all.min.css">
<!-- magnific CSS -->
<link rel="stylesheet" href="/resources/css/common/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/common/gijgo.min.css">
<!-- niceselect CSS -->
<link rel="stylesheet" href="/resources/css/common/nice-select.css">
<!-- slick CSS -->
<link rel="stylesheet" href="/resources/css/common/slick.css">
<!-- style CSS -->
<link rel="stylesheet" href="/resources/css/common/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<style>
	.box {
    width: 70px;
    height: 70px; 
    border-radius: 70%;
    overflow: hidden;
	}
	.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
	}
</style>
<body>
	<!--::header part start::-->
	<c:choose>
		<c:when
			test="${sessionScope.u.type eq 'p' and sessionScope.u.yn eq 1}">
			<header class="main_menu">
				<div class="main_menu_iner">
					<div class="container">
						<div class="row align-items-center ">
							<div class="col-lg-12">
								<nav
									class="navbar navbar-expand-lg navbar-light justify-content-between">
									<a class="navbar-brand" href="index.jsp"> <img
										src="/resources/img/logo_3.png" style="width: 100px;"
										alt="logo">
									</a>
									<button class="navbar-toggler" type="button"
										data-toggle="collapse" data-target="#navbarSupportedContent"
										aria-controls="navbarSupportedContent" aria-expanded="false"
										aria-label="Toggle navigation">
										<span class="navbar-toggler-icon"></span>
									</button>

									<div
										class="collapse navbar-collapse main-menu-item justify-content-center"
										id="navbarSupportedContent">
										<ul class="navbar-nav">
											<li class="nav-item">
											<c:choose>
											<c:when test="${sessionScope.pacYn eq 0 }">
											<a class="nav-link" href="/insertPackage.do">????????????</a>
											</c:when>
											<c:when test="${sessionScope.pacYn eq 1 }">
											<li class="nav-item"><a class="nav-link" href="packageView.do?partnerNo=${sessionScope.u.no}">???????????? ????????????/??????</a></li>
											</c:when>
											</c:choose>
											<li class="nav-item"><a class="nav-link" href="/packageList.do">?????? / ?????????</a></li>
											<li class="nav-item"><a class="nav-link" href="noticePartner.do?partnerNo=${sessionScope.u.no}">???????????? ?????????</a></li>
											<!-- <li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> ?????? </a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item" href="/planInsert.do">????????????</a> 
											<a class="dropdown-item" href="/plan.do">????????????</a>
										</div>
									</li>
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="/boardList.do"
										id="navbarDropdown_1" role="button" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"> ????????? </a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
											<a class="dropdown-item" href="/noticeList.do">????????????</a> 
											<a class="dropdown-item" href="/boardList.do">???????????????</a> 
											<a class="dropdown-item" href="elements.html">????????????</a>
										</div>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="/mypage.do">???????????????</a>
									</li> -->
										</ul>
									</div>
									<a href="/partnerLogout.do" class="genric-btn info d-none d-lg-block" style="font-size: large;">????????????</a> 
									<a href="/partnerMypage.do?partnerId=${sessionScope.u.id }" class="genric-btn info d-none d-lg-block" style="margin-left: 1px; font-size: large;">${sessionScope.u.name}</a>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</header>
		</c:when>
		<c:when test="${sessionScope.u.type eq 'm' || sessionScope.kakao.type eq 'm'}">
			<header class="main_menu">
				<div class="main_menu_iner">
					<div class="container">
						<div class="row align-items-center ">
							<div class="col-lg-12">
								<nav
									class="navbar navbar-expand-lg navbar-light justify-content-between">
									<a class="navbar-brand" href="index.jsp"> <img
										src="/resources/img/logo_3.png" style="width: 100px;"
										alt="logo">
									</a>
									<button class="navbar-toggler" type="button"
										data-toggle="collapse" data-target="#navbarSupportedContent"
										aria-controls="navbarSupportedContent" aria-expanded="false"
										aria-label="Toggle navigation">
										<span class="navbar-toggler-icon"></span>
									</button>

									<div
										class="collapse navbar-collapse main-menu-item justify-content-center"
										id="navbarSupportedContent">
										<ul class="navbar-nav">
											<li class="nav-item"><a class="nav-link" href="/">??????</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="/map.do">?????????
													??????</a></li>
											<li class="nav-item"><a class="nav-link" href="/packageList.do">?????? / ?????????</a></li>
											<li class="nav-item dropdown"><a
												class="nav-link dropdown-toggle" href="/planInsert.do"
												id="navbarDropdown" role="button" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false"> ?????? </a>
												<div class="dropdown-menu" aria-labelledby="navbarDropdown">
													<a class="dropdown-item" href="/planInsert.do">????????????</a>
													<a class="dropdown-item" href="/plan.do?planKind=3">????????????</a>
												</div></li>
											<li class="nav-item"><a class="nav-link" href="/noticeList.do">????????????</a></li>
										</ul>
									</div>
									<c:choose>
										<c:when
											test="${empty sessionScope.userId && empty sessionScope.u.id}">
											<a href="/login.do" class="btn_1 d-none d-lg-block"
												style="background-color: #F18101;">?????????</a>
											<a href="/join.do" class="btn_1 d-none d-lg-block"
												style="margin-left: 1px; background-color: #F18101">????????????</a>
										</c:when>
										<c:otherwise>
											<c:if test="${sessionScope.u.type eq 'm' || sessionScope.kakao.type eq 'm'}">
												<c:choose>
													<c:when test="${empty sessionScope.u.profileImage}">
														<div class="box" style="background: #BDBDBD; margin-right:20px">
    														<img class="profile" src="http://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_640x640.jpg">
														</div>
													</c:when>
													<c:otherwise>
														<div class="box" style="background: #BDBDBD; margin-right:20px">
    														<img class="profile" src="/resources/upload/profile/${sessionScope.u.profileImage }">
														</div>	
													</c:otherwise>
												</c:choose>
												<div style="margin-right:50px">
													<h5>${sessionScope.u.name }</h5>
												</div>
												<c:choose>
													<c:when test="${sessionScope.kakao.changePw eq 'K'}">
														<a
														href="https://kauth.kakao.com/oauth/logout?client_id=c4831aaf9adcbc5aa2f115cf6b83ac70&logout_redirect_uri=http://localhost:8082/logout.do"
														class="btn_1 d-none d-lg-block" style="background-color:red;">????????????</a>
													</c:when>
													<c:otherwise>
														<a href="/basicLogout.do" class="btn_1 d-none d-lg-block">????????????</a>
													</c:otherwise>
												</c:choose>
												<a href="/mypage.do" class="btn_1 d-none d-lg-block"
													style="margin-left: 1px;">???????????????</a>
											</c:if>
										</c:otherwise>
									</c:choose>
									
								</nav>
							</div>
						</div>
					</div>
				</div>
			</header>
		</c:when>
		<c:when test="${sessionScope.u.type eq 'e' }">
		<header class="main_menu">
				<div class="main_menu_iner">
					<div class="container">
						<div class="row align-items-center ">
							<div class="col-lg-12">
								<nav
									class="navbar navbar-expand-lg navbar-light justify-content-between">
									<a class="navbar-brand" href="index.jsp"> <img
										src="/resources/img/logo_3.png" style="width: 100px;"
										alt="logo">
									</a>
									<button class="navbar-toggler" type="button"
										data-toggle="collapse" data-target="#navbarSupportedContent"
										aria-controls="navbarSupportedContent" aria-expanded="false"
										aria-label="Toggle navigation">
										<span class="navbar-toggler-icon"></span>
									</button>

									<div
										class="collapse navbar-collapse main-menu-item justify-content-center"
										id="navbarSupportedContent">
										<ul class="navbar-nav">
											<li class="nav-item"><a class="nav-link" href="/">??????</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="userPartnerList.do">??????/????????? ?????????</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="/noticeList.do">????????????</a>
											</li>
										</ul>
									</div>
									<c:choose>
										<c:when
											test="${empty sessionScope.u.id}">
											<a href="/login.do" class="btn_1 d-none d-lg-block"
												style="background-color: #F18101;">?????????</a>
											<a href="/join.do" class="btn_1 d-none d-lg-block"
												style="margin-left: 1px; background-color: #F18101">????????????</a>
										</c:when>
										<c:otherwise>
											<c:if test="${sessionScope.u.type eq 'e'}">
												<c:choose>
													<c:when test="${empty sessionScope.u.profileImage}">
														<div class="box" style="background: #BDBDBD; margin-right:20px">
    														<img class="profile" src="http://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_640x640.jpg">
														</div>
													</c:when>
													<c:otherwise>
														<div class="box" style="background: #BDBDBD; margin-right:20px">
    														<img class="profile" src="/resources/upload/profile/${sessionScope.u.profileImage }">
														</div>	
													</c:otherwise>
												</c:choose>
												<div style="margin-right:50px">
													<h5>${sessionScope.u.name }</h5>
												</div>
												<a href="/basicLogout.do" class="btn_1 d-none d-lg-block">????????????</a>									
												<a href="/employeeMypage.do" class="btn_1 d-none d-lg-block"
													style="margin-left: 1px;">???????????????</a>
											</c:if>
										</c:otherwise>
									</c:choose>
									
								</nav>
							</div>
						</div>
					</div>
				</div>
			</header>
		</c:when>
		<c:otherwise>
			<header class="main_menu">
				<div class="main_menu_iner">
					<div class="container">
						<div class="row align-items-center ">
							<div class="col-lg-12">
								<nav
									class="navbar navbar-expand-lg navbar-light justify-content-between">
									<a class="navbar-brand" href="index.jsp"> <img
										src="/resources/img/logo_3.png" style="width: 100px;"
										alt="logo">
									</a>
									<button class="navbar-toggler" type="button"
										data-toggle="collapse" data-target="#navbarSupportedContent"
										aria-controls="navbarSupportedContent" aria-expanded="false"
										aria-label="Toggle navigation">
										<span class="navbar-toggler-icon"></span>
									</button>

									<div
										class="collapse navbar-collapse main-menu-item justify-content-center"
										id="navbarSupportedContent">
										<ul class="navbar-nav">
											<li class="nav-item"><a class="nav-link" href="/">??????</a>
											</li>
											<li class="nav-item"><a class="nav-link" href="/map.do">?????????
													??????</a></li>
											<li class="nav-item"><a class="nav-link"
												href="/packageList.do">??????</a></li>
											<li class="nav-item dropdown"><a
												class="nav-link dropdown-toggle" href="/planInsert.do"
												id="navbarDropdown" role="button" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false"> ?????? </a>
												<div class="dropdown-menu" aria-labelledby="navbarDropdown">
													<a class="dropdown-item" href="/planInsert.do">????????????</a>
													<a class="dropdown-item" href="/plan.do?planKind=3">????????????</a>
												</div></li>
											<li class="nav-item"><a class="nav-link" href="/noticeList.do">????????????</a></li>
										</ul>
									</div>
									<c:choose>
										<c:when
											test="${empty sessionScope.userId && empty sessionScope.u.id}">
											<a href="/login.do" class="btn_1 d-none d-lg-block"
												style="background-color: #F18101;">?????????</a>
											<a href="/join.do" class="btn_1 d-none d-lg-block"
												style="margin-left: 1px; background-color: #F18101">????????????</a>
										</c:when>
										<c:otherwise>
											<c:if test="${sessionScope.u.type eq 'e' }">
												<a href="/basicLogout.do" class="btn_1 d-none d-lg-block" style="background:#00a074">????????????</a>
												<a href="/employeeMypage.do" class="btn_1 d-none d-lg-block"
													style="margin-left: 1px; background:#00a074">???????????????</a>
											</c:if>
											<c:if test="${sessionScope.u.type eq 'u' }">
												<c:if test="${sessionScope.u.changePw eq 1 }">
													<!-- ?????? - ?????????????????? (???????????? ???????????? (????????? 1)-->
													<a href="/basicLogout.do" class="btn_1 d-none d-lg-block">????????????</a>
												</c:if>
												<c:if test="${sessionScope.u.changePw eq 0 }">
													<!-- ?????? - ??????????????????(???????????? ???????????? 0?????? ??????)-->
													<a
														href="https://kauth.kakao.com/oauth/logout?client_id=c4831aaf9adcbc5aa2f115cf6b83ac70&logout_redirect_uri=http://localhost:8082/logout.do"
														class="btn_1 d-none d-lg-block">????????????</a>
												</c:if>

											</c:if>
										</c:otherwise>
									</c:choose>
							</div>
						</div>
					</div>
				</div>
			</header>
		</c:otherwise>
	</c:choose>

</body>
</html>