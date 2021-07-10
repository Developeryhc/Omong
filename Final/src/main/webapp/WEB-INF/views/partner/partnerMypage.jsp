<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	
</style>
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
							<h2>마이페이지</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--마이페이지 첫 화면-->
	<div style="margin-left: 30%; margin-top: 1%">
		<button class="genric-btn info-border e-large" id="change">정보변경</button>
		<button class="genric-btn info-border e-large" id="trip">회원탈퇴</button>
		<button class="genric-btn info-border e-large" id="buy">구매이력</button>
	</div>
	<div class="section-top-border" style="margin-left: 30%;" id="mypage">
		<div class="row">
			<div class="col-lg-8 col-md-8">
				<hr>
					<h4>아이디</h4>
					<div class="mt-10">
						<input type="text"  class="single-input" value="${u.id }" readonly>
					</div>
					<hr>
					<h4>파트너 이름</h4>
					<div class="mt-10">
						<input type="text"  class="single-input" value="${u.name }" readonly>
					</div>
					<hr>
					<h4>사업자 번호</h4>
					<div class="mt-10">
						<input type="text"  class="single-input" value="${u.business }" readonly>
					</div>
					<hr>
					<h4>사업자 이름</h4>
					<div class="mt-10">
						<input type="text"  class="single-input" value="${u.ceo }" readonly>
					</div>
					<hr>
					<h4>이메일</h4>
					<div class="mt-10">
						<input type="text"  class="single-input" value="${u.email }" readonly>
					</div>
					<hr>
					<h4>핸드폰 번호</h4>
					<div class="mt-10">
						<input type="text"  class="single-input" value="${u.phone }" readonly>
					</div>
					<hr>
					<h4>매장 번호</h4>
					<div class="mt-10">
						<input type="text"  class="single-input" value="${u.tel }" readonly>
					</div>
					<hr>
					<h4>주소</h4>
					<div class="mt-10">
						<input type="text"  class="single-input" value="${u.address }" readonly>
					</div>
					<div class="mt-10">
						<input type="text"  class="single-input" value="${u.detailAddress}" readonly>
					</div>
					<hr>
			</div>
		</div>
	</div>
	
	<!--================ 마이페이지첫화면 end =================-->
	<!--마이페이지_정보변경-->
	<div class="section-top-border" style="margin-left: 30%; display: none;" id="change_information">
		<div class="row">
			<div class="col-lg-8 col-md-8">
				<hr>
				<form method="POST" action="/updatePartner.do" enctype="multipart/form-data">
					<h4>아이디</h4>
					<div class="mt-10">
						<input type="text" name="id" class="single-input" value="${u.id }" readonly style="background-color:#E2E2E2;">
					</div>
					<hr>
					<h4>비밀번호 변경</h4>
					<a href="/partnerPwCheck.do"><button  class="genric-btn info-border" type="button">비밀번호변경</button></a>
					<hr>
					<h4>파트너 이름</h4>
					<div class="mt-10">
						<input type="text" name="name" placeholder="상호명을 적어주세요" class="single-input" value="${u.name }" >
					</div>
					<hr>
					<h4>사업자 번호</h4>
					<div class="mt-10">
						<input type="text" name="business" placeholder="(-)을 제외하고 적어주세요" class="single-input" value="${u.business }" >
					</div>
					<hr>
					<h4>사업자 이름</h4>
					<div class="mt-10">
						<input type="text" name="ceo" placeholder="사업자명을 적어주세요" class="single-input" value="${u.ceo }" >
					</div>
					<hr>
					<h4>이메일</h4>
					<div class="mt-10">
						<input type="text" name="email" placeholder="이메일을 적어주세요" class="single-input" value="${u.email }" >
					</div>
					<hr>
					<h4>핸드폰 번호</h4>
					<div class="mt-10">
						<input type="text" name="phone" placeholder="(-)을 제외하고 적어주세요" class="single-input" value="${u.phone }" >
					</div>
					<hr>
					<h4>매장 번호</h4>
					<div class="mt-10">
						<input type="text" name="tel" placeholder="(-)을 제외하고 적어주세요" class="single-input" value="${u.tel }" >
					</div>
					<hr>
					<h4>주소</h4>
					<span><input type="button" class="genric-btn info-border d-none d-lg-block" style="border: 1;" onclick="findAddress()" value="주소 찾기"></span>
					<div class="input-group-icon mt-10">
						<input type="hidden" id="sample2_extraAddress">

						<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
						<div id="layer"
							style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
								id="btnCloseLayer"
								style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
								onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
						<input type="text" name="address" id="address" placeholder="주소를 입력해주세요" required class="single-input" value="${sessionScope.u.address }" readonly> 
						<br> 
						<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소를 입력해주세요" required class="single-input" value="${sessionScope.u.detailAddress }">
					</div>
					<!-- mapPartner update -->
					<input type="hidden" class="mapPartnerLatitude" value="">
					<input type="hidden" class="mapPartnerLongitude" value="">
					<hr>
					<div style="text-align: center;">
						<input type="submit" value="정 보 수 정" class="genric-btn primary e-large" style="width: 300px; font-size: x-large; font-weight: bold;">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--================ 마이페이지_정보변경 end =================-->
	<!--마이페이지_호원탈퇴-->
	<div class="section-top-border" style="margin-left: 30%; display: none;" id="deletePartner">
		<div class="row">
			<div class="col-lg-8 col-md-8">
				<h4 class="checkBtn">비밀번호 입력</h4>
					<div class="mt-10">
						<input type="password" name="pwd" placeholder="비밀번호를 입력해주세요." class="single-input" >
					</div>
					<br>
					<input type="button" class="genric-btn primary e-large checkBtn" value="확인" onclick="checkPw();" style="width:100%; position:relative;">
					
				<form action="/partnerDelete.do" method="post" style="display: none; margin-top: 100px;">
					<input name="id" type="hidden" value="${sessionScope.u.id }">
					<input class="genric-btn danger e-large" type="submit" value="회 원 탈 퇴" style="width:100%; position:absolute; top:0; left:0;" onclick="return confirm('정말 탈퇴하시겠습니까?')">
				</form>
			</div>
		</div>
	</div>
	<!--================ 마이페이지_내일정 end =================-->
	<!--마이페이지_구매이력-->
	<div class="section-top-border" style="display: none;" id="buylist">
		<div class="container">
			<hr style="border: 1px solid black;">
			<div class="progress-table-wrap">
				<div class="progress-table">
					<div class="table-head">
						<div class="serial">구매번호</div>
						<div class="percentage">구매내역</div>
						<div class="country">날짜</div>
						<div class="visit">금액</div>
					</div>
					<div class="table-row">
						<div class="serial">01</div>
						<div class="percentage">제주도 잠수함체험권</div>
						<div class="country">2021-06-21</div>
						<div class="visit">80,000원</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================ 마이페이지_내일정 end =================-->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	
	<script>
		// @ 07/10 mapPartner 좌표 대입
		$(function(){
			var address = $("#address").val() + $("#detailAddress").val();
			var geocoder = new kakao.maps.services.Geocoder();
			
			var callback = function(result, status){
				if(status === kakao.maps.services.Status.OK){
					$(".mapPartnerLatitude").val(result[0].y);
					$(".mapPartnerLongitude").val(result[0].x);
				}
			}
			geocoder.addressSearch(address, callback);
		});
		
		var userId = "<c:out value='${sessionScope.u.id}'/>";
		$("#change").click(function() {
			if ($("#change_information").css("display") == "none") {
				$("#change_information").show();
				$("#mypage").hide();
				$("#deletePartner").hide();
				$("#buylist").hide();
				$("#change").attr('class', 'genric-btn info e-large');
				$("#trip").attr('class', 'genric-btn info-border e-large');
				$("#buy").attr('class', 'genric-btn info-border e-large');
			}
		});
		

		$("#trip").click(
				function() {
					if ($("#deletePartner").css("display") == "none") {
						$("#deletePartner").show();
						$("#change_information").hide();
						$("#mypage").hide();
						$("#buylist").hide();
						$("#trip").attr('class', 'genric-btn info e-large');
						$("#change").attr('class',
								'genric-btn info-border e-large');
						$("#buy").attr('class',
								'genric-btn info-border e-large');
						
						// Plan 리스트 출력할 ajax
						$.ajax({
							url: "selectPlanList.do",
							type: "POST",
							data: {id: userId},
							success: function(data){
								if(data != null){
									for (var i = 0; i < data.length; i++) {
										var table = "<div class='table-row'>";
										table += "<div class='serial'>"+(i+1)+"</div>";
										table += "<div class='percentage'>"+data[i].planTitle+"</div>";
										table += "<div class='country'>"+data[i].planStart+"</div>";
										table += "<div class='visit'>"+data[i].planPublic+"</div>";
										table += "<div class='visit'>"+data[i].planView+"</div>";
										table += "<div class='visit'>"+data[i].planLike+"</div>";
										table += "<div class='visit'>"+data[i].planShare+"</div>";
										table += "</div>";
										$(".progress-table").eq(0).append(table);
									}
								}else{
									table.append("<div class='percentage'>현재 등록 된 내 일정이 없습니다.</div>");
								}
							}
						});
					}
				});
		$("#buy").click(
				function() {
					if ($("#buylist").css("display") == "none") {
						$("#buylist").show();
						$("#change_information").hide();
						$("#mypage").hide();
						$("#deletePartner").hide();
						$("#buy").attr('class', 'genric-btn info e-large');
						$("#change").attr('class',
								'genric-btn info-border e-large');
						$("#trip").attr('class',
								'genric-btn info-border e-large');
					}
				});
	</script>
	
	
	<!-- 회원탈퇴 비밀번호 확인 -->
	<script>
		function checkPw() {
			var pw = $("[name=pwd]").val();
			var id = $("[name=id]").val();
			$.ajax({
				url : "/partnerCheckPw.do",
				data : {id : id , pw : pw},
				type : "post",
				success : function(data) {
					if(data == 1 ) {
						$("form").show();
						$(".checkBtn").hide();
					}else{
						alert("비밀번호를 확인해주세요.");
					}					
				}
			})			
		}	
	</script>
	
	
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// 우편번호 찾기 화면을 넣을 element
		var element_layer = document.getElementById('layer');

		function closeDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_layer.style.display = 'none';
		}

		function findAddress() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample2_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample2_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById("address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("detailAddress").focus();

							// iframe을 넣은 element를 안보이게 한다.
							// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							element_layer.style.display = 'none';
						},
						width : '100%',
						height : '100%',
						maxSuggestItems : 5
					}).embed(element_layer);

			// iframe을 넣은 element를 보이게 한다.
			element_layer.style.display = 'block';

			// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
			initLayerPosition();
		}

		// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
		// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
		// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
		function initLayerPosition() {
			var width = 300; //우편번호서비스가 들어갈 element의 width
			var height = 400; //우편번호서비스가 들어갈 element의 height
			var borderWidth = 5; //샘플에서 사용하는 border의 두께

			// 위에서 선언한 값들을 실제 element에 넣는다.
			element_layer.style.width = width + 'px';
			element_layer.style.height = height + 'px';
			element_layer.style.border = borderWidth + 'px solid';
			// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
			element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
					+ 'px';
			element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
					+ 'px';
		}

		function previewImage(f) {

			var file = f.files;

			// 확장자 체크
			if (!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)) {
				alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

				// 선택한 파일 초기화
				f.outerHTML = f.outerHTML;

				document.getElementById('imagePreview').innerHTML = '';

			} else {

				// FileReader 객체 사용
				var reader = new FileReader();

				// 파일 읽기가 완료되었을때 실행
				reader.onload = function(rst) {
					document.getElementById('imagePreview').innerHTML = '<img src="' + rst.target.result + '">';
				}

				// 파일을 읽는다
				reader.readAsDataURL(file[0]);

			}
		}
	</script>
</body>
</html>