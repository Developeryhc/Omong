<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg" style="background-image: url(/resources/img/main2.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<c:if test="${planDay eq 'recommend'}">
							<h2>추천일정</h2>
							<p>좋아요를 가장 많이 받은 일정 목록입니다.</p>
							<input type="hidden" class="planDay" value="recommend">
							</c:if>
							<c:if test="${planDay eq 'new'}">
							<h2>최신일정</h2>
							<p>1주일 내로 등록된 일정입니다.</p>
							<input type="hidden" class="planDay" value="new">
							</c:if>
							<c:if test="${planDay eq 'view'}">
							<h2>가장 많이 찾아 본 일정</h2>
							<p>조회수가 가장 많은 일정 목록입니다.</p>
							<input type="hidden" class="planDay" value="view">
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<!--================Blog Area =================-->

	<section class="blog_area single-post-area section_padding">
		<div class="container">
			<h3>공지사항</h3>
			<hr style="border: 1px solid black;">
			<div class="progress-table-wrap">
				<div class="progress-table">
					<div class="table-head">
						<div class="serial">번호</div>
						<div class="percentage">제목</div>
						<div class="country">작성자</div>
						<div class="visit"></div>
						<div class="visit"></div>
						<div class="visit">조회수</div>
						<div class="visit">좋아요수</div>
						<div class="visit">공유수</div>
					</div>
					<c:forEach items="${list}" var="plan" varStatus="i">
					<div class="table-row">
						<div class="serial">${i.count}</div>
						<input type="hidden" value="${plan.planTitle}" id="type">
						<div class="percentage"><a href="/selectOnePlan.do?planNo=${plan.planNo}">${plan.planTitle}</a></div>
						<div class="country">${plan.planWriter}</div>
						<c:choose>
						<c:when test="${plan.likeCheck eq 1}">
						<div class="visit like" style="color: blue;">Like
							<input type="hidden" value="${plan.planNo}">
							<input type="hidden" value="1">
						</div>
						</c:when>
						<c:otherwise>
						<div class="visit like">Like
							<input type="hidden" value="${plan.planNo}">
							<input type="hidden" value="-1">
						</div>
						</c:otherwise>
						</c:choose>
						<c:choose>
						<c:when test="${plan.shareCheck eq 1}">
						<div class="visit share" style="color: #fe5c24;">Share
							<input type="hidden" value="${plan.planNo}">
							<input type="hidden" value="1">
						</div>
						</c:when>
						<c:otherwise>
						<div class="visit share">Share
							<input type="hidden" value="${plan.planNo}">
							<input type="hidden" value="-1">
						</div>
						</c:otherwise>
						</c:choose>
						<div class="visit">${plan.planView}</div>
						<div class="visit">${plan.planLike}</div>
						<div class="visit">${plan.planShare}</div>
					</div>
					</c:forEach>
				</div>	
			</div>
		</div>
	</section>
	<!--================ Blog Area end =================-->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
	$(function(){
		var planDay = $(".planDay").val();
	});
	$(".like").click(function(){
		var likeCheck = $(this).children().eq(1).val();
		likeCheck *= -1;
		if(likeCheck == 1){
			$(this).css("backgroundColor", "blue");
		}else{
			$(this).css("backgroundColor", "#212529");
		}
		var planNo = $(this).children().eq(0).val();
		$.ajax({
			url: "/planLike.do",
			data: {planNo:planNo, likeCheck:likeCheck},
			type: "POST",
			success: function(data){
				location.reload();
			}
		});
	});
	$(".share").click(function(){
		var planNo = $(this).children().eq(0).val();
		$.ajax({
			url: "/insertOtherPlan.do",
			data: {planNo:planNo, planDay: planDay},
			type: "POST",
			success: function(data){
				location.reload();
				if(data=='1'){
					alert('담기 완료');
				}else{
					alert('담기 실패, 관리자에게 문의하세요. 에러코드[00IP]');
				}
			}
		});
	});
	
	</script>
</body>
</html>