<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.schedule{
		justify-self: center;
	 	margin:10px;
	 	
	}
	.row{
		justify-content: center;
	}
	.top_place{
		width: 100%;
	}
	.groupListWrap{
		width : 1200px;
			margin: 0 auto;
			padding:0;			
			overflow :hidden;
	}
	
</style>
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
							<h2>상품 예약</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<!-- search list css start-->
	<c:if test="${empty packageList and empty planList}">
	<br>
	<div style="display:flex; justify-content: center; align-items:center; height: 300px;">
		<h3>결과내역이 없습니다..</h3>
	</div>
	</c:if>
	<br>
	<c:if test="${!empty packageList}">
	<h3 style="float: left; margin-left: 40px;">상품 리스트</h3>
	<section class="top_place" style="margin-top: 50px; margin-bottom: 50px;">
		
		<hr style="border: solid 1px black;">
		<div class="container_reservation" style="width: 100%;">
			<div class = "groupListWrap">
				<c:forEach items="${packageList}" var="p">
						<div class="single_place" style="width :28%; height:336px; margin:30px; display:inline-block; border-radius: 30px; box-shadow: 5px 5px 5px 5px grey;"  >
							<img src="/resources/upload/package/${p.packageProductMainPicture}" alt="" style="width:100%;">
							<div class="hover_Text d-flex align-items-end justify-content-between">
								<div class="hover_text_iner">
									<a href="packageView.do?partnerNo=${p.partnerNo}" class="place_btn">상세보기</a>
									<h3 style="color:black;">${p.packageProductName}</h3>
									<p style="color:black;">${p.packageProductInfo}</p>
								</div>
								<div class="details_icon text-right">
									
								</div>
							</div>
						</div>
							
				</c:forEach>						
			</div>
		</div>
	</section>
	</c:if>
	<c:if test="${!empty planList}">
	<h3 style="float: left; margin-left: 40px;">일정 리스트</h3>
	<section class="top_place" style="margin-top: 50px; margin-bottom: 50px;">
		<hr style="border: solid 1px black;">
		<div class="container_reservation" style="width: 100%;">
			<div class="row" style="flex-wrap: wrap; ">
				<c:forEach items="${planList }" var="plan">
				<div class="single_place" style="width :30%; height:336px; margin:30px; display:inline-block; border-radius: 30px; box-shadow: 5px 5px 5px 5px grey;" >
					<img src="/resources/img/jeju/제주_${plan.planThumbnailNo}.jpg" alt="">
					<div
						class="hover_Text d-flex align-items-end justify-content-between">
						<div class="hover_text_iner">
							<a href="/selectOnePlan.do?planNo=${plan.planNo}" class="place_btn">상세보기</a>
							<h3>${plan.planTitle}</h3>
							<p>${plan.planStart} ~ ${plan.planEnd}</p>
							<div class="place_review">
									<c:if test="${!empty sessionScope.u or sessionScope.u.id eq plan.planWriter or plan.shareCheck eq 1}">
									<a href="javascript:insertOtherPlan(${plan.planNo});"><i class="fas fa-star">담아오기</i></a>
									</c:if>
								<div>
									<span>${plan.planView } views |</span>
									<span>${plan.planLike } likes |</span>
									<span>${plan.planShare } share</span>
								</div>
							</div>
						</div>
						<c:if test="${!empty sessionScope.u}">
						<div class="details_icon text-right">
							<c:choose>
							<c:when test="${plan.likeCheck eq 1}">
							<i class="like" style="background-color: #3B5998;" >Like
								<input type="hidden" value="${plan.planNo}">
								<input type="hidden"value="1">
							</i>
							</c:when>
							<c:otherwise>
							<i class="like" style="background-color: rgba(255, 255, 255, 0.5);" >Like
								<input type="hidden" value="${plan.planNo}">
								<input type="hidden" value="-1">
							</i>
							</c:otherwise>
							</c:choose>
						</div>
						</c:if>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<br><br>
	</c:if>
	<!-- hotel list css end -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>