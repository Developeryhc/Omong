<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
							<h2>${pn.ceo }</h2>
							<p>게시물 상세</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="single-post-area section_padding">
			<div class="container">
			<h3 style="margin-left: 40px; display:inline-block;" >상세보기</h3>
				<c:choose>
					<c:when test="${sessionScope.u.type eq 'p'}">						
						<a class="genric-btn info" href="noticePartnerUpdateFrm.do?noticePartnerNo=${pn.noticePartnerNo}" style="float:right; margin-left:3px;">수정하기</a>						
						<a class="genric-btn info" href="noticePartnerDelete.do?noticePartnerNo=${pn.noticePartnerNo}" style="float:right; margin-left:3px;">삭제하기</a>
					</c:when>
				</c:choose>
				<a class="genric-btn info" href="noticePartner.do?partnerNo=${pn.writer}" style="float:right; ">목록으로</a>	
				<hr style="border: 1px solid black;">
				<div >
					<div class="progress-table">
						<div class="table-head">
							<div class="serial">번호</div>
							<div class="serial">${pn.noticePartnerNo }</div>
							<div class="serial">제목</div>
							<div class="serial">
								${pn.title }
							</div>
							<div class="serial">작성자</div>
							<div class="serial">${pn.ceo }</div>
							<div class="serial">조회수</div>
							<div class="serial">${pn.noticePartnerViews }</div>
						</div>
						<div class="table-row">
							<div class="serial">내용</div>
							<div style="width: 80%">
								${pn.content}
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	
</body>
</html>