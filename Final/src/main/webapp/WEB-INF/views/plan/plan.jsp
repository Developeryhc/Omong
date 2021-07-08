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
		width : 100%;
		margin: 0 auto;
		padding:0;			
		overflow :hidden;
	}
	
	
	
</style>
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg"style="background-image: url(/resources/img/main2.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>일정</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->
	<!-- hotel list css start-->
	<br>
	<h3 style="float: left; margin-left: 40px;">추천일정</h3>
	<a href="/selectRecommendPlanList.do?planKind=30"><button style="float:right; margin-right: 40px; background-color: orangered; width: 50x; height: 30px; color: white; text-decoration: bold; border: none;">더보기</button></a>
	
	<section class="top_place" style="margin-top: 50px; margin-bottom: 50px;">
	
		<hr style="border: solid 1px black;">
		<div class="container_reservation" style="width: 100%;">
			<div class="groupListWrap">
				<c:forEach items="${recommendList }" var="plan">
				
					<div class="single_place" style="width :30%; height:336px; margin:30px; display:inline-block; border-radius: 30px; box-shadow: 5px 5px 5px 5px grey;" >
						<img src="/resources/img/jeju/제주_${plan.planThumbnailNo}.jpg" alt="">
						<div
							class="hover_Text d-flex align-items-end justify-content-between">
							<div class="hover_text_iner">
								<a href="/selectOnePlan.do?planNo=${plan.planNo}" class="place_btn">상세보기</a>
								<h3 style="color:black;" >${plan.planTitle}</h3>
								<p style="color:black;" >${plan.planStart} ~ ${plan.planEnd}</p>
								<div class="place_review">
									<a href="#"><i class="fas fa-star">공유하기</i></a>
									<div>
										<span style="color:black;">${plan.planView } views |</span>
										<span style="color:black;">${plan.planLike } likes |</span>
										<span style="color:black;">${plan.planShare } share</span>
									</div>
								</div>
							</div>
							<c:if test="${!empty sessionScope.u}">
							<div class="details_icon text-right">
								<i class="like">Like</i>
								<i class="share">Share</i>
							</div>
							</c:if>
						</div>
					</div>
				
				</c:forEach>
			</div>
		</div>
	</section>
	<br><br>
	<c:if test="${!empty newList}">
	<h3 style="float: left; margin-left: 40px;">최신일정</h3>
	<a href="/selectNewPlanList.do?planKind=30"><button style="float:right; margin-right: 40px; background-color: orangered; width: 50x; height: 30px; color: white; text-decoration: bold; border: none;">더보기</button></a>
	<section class="top_place" style="margin-top: 50px; margin-bottom: 50px;">
		<hr style="border: solid 1px black;">
		<div class="container_reservation" style="width: 100%;">
			<div class="row" style="flex-wrap: nowrap; ">
			<c:forEach items="${newList }" var="plan">
				<div class="single_place" style="width :30%; height:336px; margin:30px; display:inline-block; border-radius: 30px; box-shadow: 5px 5px 5px 5px grey;" >
					<img src="/resources/img/jeju/제주_${plan.planThumbnailNo}.jpg" alt="">
					<div
						class="hover_Text d-flex align-items-end justify-content-between">
						<div class="hover_text_iner">
							<a href="/selectOnePlan.do?planNo=${plan.planNo}" class="place_btn">상세보기</a>
							<h3>${plan.planTitle}</h3>
							<p>${plan.planStart} ~ ${plan.planEnd}</p>
							<div class="place_review">
								<a href="#"><i class="fas fa-star">공유하기</i></a>
								<div>
									<span>${plan.planView } views |</span>
									<span>${plan.planLike } likes |</span>
									<span>${plan.planShare } share</span>
								</div>
							</div>
						</div>
						<c:if test="${!empty sessionScope.u}">
						<div class="details_icon text-right">
							<i class="like">Like</i>
							<i class="share">Share</i>
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
	<h3 style="float: left; margin-left: 40px;">가장 많이 찾아 본 일정</h3>
	<a href="/selectViewPlanList.do?planKind=30"><button style="float:right; margin-right: 40px; background-color: orangered; width: 50x; height: 30px; color: white; text-decoration: bold; border: none;">더보기</button></a>
	<section class="top_place" style="margin-top: 50px; margin-bottom: 50px;">
		<hr style="border: solid 1px black;">
		<div class="container_reservation" style="width: 100%;">
			<div class="row" style="flex-wrap: nowrap; ">
			<c:forEach items="${viewList }" var="plan">
				<div class="single_place" style="width :30%; height:336px; margin:30px; display:inline-block; border-radius: 30px; box-shadow: 5px 5px 5px 5px grey;" >
					<img src="/resources/img/jeju/제주_${plan.planThumbnailNo}.jpg" alt="">
					<div
						class="hover_Text d-flex align-items-end justify-content-between">
						<div class="hover_text_iner">
							<a href="/selectOnePlan.do?planNo=${plan.planNo}" class="place_btn">상세보기</a>
							<h3>${plan.planTitle}</h3>
							<p>${plan.planStart} ~ ${plan.planEnd}</p>
							<div class="place_review">
								<a href="#"><i class="fas fa-star">공유하기</i></a>
								<div>
									<span>${plan.planView } views |</span>
									<span>${plan.planLike } likes |</span>
									<span>${plan.planShare } share</span>
								</div>
							</div>
						</div>
						<c:if test="${!empty sessionScope.u}">
						<div class="details_icon text-right">
							<i class="like">Like</i>
							<i class="share">Share</i>
						</div>
						</c:if>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</section>
	<!-- hotel list css end -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<script>
	var likeCheck = -1;
	$(".like").click(function(){
		likeCheck *= -1;
		if(likeCheck == -1){
			$(this).css("backgroundColor", "#3B5998");
		}else{
			$(this).css("backgroundColor", "rgba(255, 255, 255, 0.5)");
		}
		var planNo = $(this).children().eq(0).val();
		$.ajax({
			url: "/planLike.do",
			data: {planNo:planNo, likeChk:likeCheck},
			type: "POST",
			success: function(data){
				if(data == '0'){
					alert('완료');
				}else{
					alert('MVC 에러');
				}
			},
			error: function(data){
				alert('ajax 에러');
				console.log(data);
			},
			complete: function(data){
				alert('ajax 완료');
			}
			
			});
		});
</script>
</html>