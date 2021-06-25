<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Omong 일정 작성</title>
</head>
	<style>
	.map_wrap, .map_wrap * {
		margin:0;
		padding:0;
		font-family:'Malgun Gothic',dotum,'돋움',sans-serif;
		font-size:12px;
	}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{
		color:#000;
		text-decoration: none;
	}
	.map_wrap {
		position:relative;
		width:100%;
		height:100%;
	}
	#menu_wrap {
		position:absolute;
		top:0;
		left:20%;
		bottom:0;
		width:250px;
		margin:10px 0 30px 10px;
		padding:5px;
		overflow-y:auto;
		background:rgba(255, 255, 255, 0.7);
		z-index: 1;
		font-size:12px;
	}
	#detailList{
		position:absolute;
		top:0;
		left:0;
		bottom:0;
		width:250px;
		margin:10px 0 30px 10px;
		padding:5px;
		overflow-y:auto;
		background:rgba(255, 255, 255, 0.7);
		z-index: 1;
		font-size:12px;
		border-radius: 10px;
	}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(/resources/img/marker.png) no-repeat;}
	
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}
	
	.detail {display: none;}
	</style>
<body>
<<<<<<< HEAD
   <%@include file="/WEB-INF/views/common/header.jsp"%>
   <div style="width: 100%; height: 800px; positon:relative;">
      <div id="map" style="width: 80%; height: 100%; float: left; ;">
      </div>
      <div id="search" style="width: 20%; height: 84%; float:left; position:absolute; right:20%; background-color:white; z-index:1000; opacity: 0.70; text-align:center; display:none">
         <br>
         <form>
         <input type="text" style="border: 1px solid blue" placeholder="검색어를 입력하세요">
         <input type="submit" style="border: 1px solid blue" la>
         </form>
      </div>
      <hr>
      <div id="detailList"
         style="width: 20%; height: 100%; overflow: scroll;">
         <div id="detail_head" style="width: 100%; height: 15%;">
         	<button id="search_btn" style="float:left; border:0; background:white">검색</button>
            <h3 style="text-align: center; padding-top: 10px">여행 일정표</h3>
            <button id="day1" style="border: 0; background: white; margin-top: 15px">DAY1</button>
            <c:forEach var="i" begin="2" end="${diff }" step="1">
            <button id="day${i }" style="border: 0; background: white">DAY${i }</button>
            </c:forEach>
            <hr>
         </div>
         <br>
         <div class="detail" style="width: 100%;">
            <button id="plus1"  style="float:right; border:0px; background:white;">추가</button><button id="minus1"  style="float:right; border:0px; background:white;">삭제</button><h3>DAY1</h3>
         </div>
         <div class="detail" style="width: 100%;">
            <button id="plus2"  style="float:right; border:0px; background:white;">추가</button><button id="minus2"  style="float:right; border:0px; background:white;">삭제</button><h3>DAY2</h3>
         </div>
         <div class="detail" style="width: 100%;">
            <button id="plus3"  style="float:right; border:0px; background:white;">추가</button><button id="minus3"  style="float:right; border:0px; background:white;">삭제</button><h3>DAY3</h3>
         </div>
         <div class="detail" style="width: 100%;">
            <button id="plus4"  style="float:right; border:0px; background:white;">추가</button><button id="minus4"  style="float:right; border:0px; background:white;">삭제</button><h3>DAY4</h3>
         </div>
         <div class="detail" style="width: 100%;">
            <button id="plus5"  style="float:right; border:0px; background:white;">추가</button><button id="minus5"  style="float:right; border:0px; background:white;">삭제</button><h3>DAY5</h3>
         </div>
         <div class="detail" style="width: 100%;">
            <button id="plus6"  style="float:right; border:0px; background:white;">추가</button><button id="minus6"  style="float:right; border:0px; background:white;">삭제</button><h3>DAY6</h3>
         </div>
         <div class="detail" style="width: 100%;">
            <h3>DAY7</h3>
            <button id="plus7"  style="float:right; border:0px; background:white;">추가</button><button id="minus7"  style="float:right; border:0px; background:white;">삭제</button><div class="day7"></div>
         </div>
      </div>
   </div>
   <%@include file="/WEB-INF/views/common/footer.jsp"%>
=======
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div style="width: 100%; height:800px; positon: relative; display:flex;">
		<div class="map_wrap">
			<!-- 카카오 맵 -->
			<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
			<!-- 검색 리스트 창 -->
			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<div>
						<form onsubmit="searchPlaces(); return false;">
							<input type="hidden" value="제주도" id="title" size="15">
							키워드 : <input type="text" value="" id="keyword" size="15">
							<button type="submit">검색하기</button>
						</form>
					</div>
				</div>
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
			<!-- 일정표 -->
			<div id="detailList" style="width: 20%; overflow-y: scroll; padding: 15px;">
				<div id="detail_head" style="width: 100%; height: 15%;">
					<h3 style="text-align: center; padding-top: 10px">여행 일정표</h3>
					<button id="day1"
						style="border: 0; background: transparent; margin-top: 15px">DAY1</button>
					<c:forEach var="i" begin="2" end="${diff }" step="1">
						<button id="day${i }" style="border: 0; background: white">DAY${i }</button>
					</c:forEach>
					<hr>
				</div>
				<br>
				<div class="detail" style="width: 100%;">
					<button id="plus1"
						style="float: right; border: 0px; background: transparent;">추가</button>
					<button id="minus1"
						style="float: right; border: 0px; background: transparent;">삭제</button>
					<h3>DAY1</h3>
				</div>
				<div class="detail" style="width: 100%;">
					<button id="plus2"
						style="float: right; border: 0px; background: transparent;">추가</button>
					<button id="minus2"
						style="float: right; border: 0px; background: transparent;">삭제</button>
					<h3>DAY2</h3>
				</div>
				<div class="detail" style="width: 100%;">
					<button id="plus3"
						style="float: right; border: 0px; background: transparent;">추가</button>
					<button id="minus3"
						style="float: right; border: 0px; background: transparent;">삭제</button>
					<h3>DAY3</h3>
				</div>
				<div class="detail" style="width: 100%;">
					<button id="plus4"
						style="float: right; border: 0px; background: transparent;">추가</button>
					<button id="minus4"
						style="float: right; border: 0px; background: transparent;">삭제</button>
					<h3>DAY4</h3>
				</div>
				<div class="detail" style="width: 100%;">
					<button id="plus5"
						style="float: right; border: 0px; background: transparent;">추가</button>
					<button id="minus5"
						style="float: right; border: 0px; background: transparent;">삭제</button>
					<h3>DAY5</h3>
				</div>
				<div class="detail" style="width: 100%;">
					<button id="plus6"
						style="float: right; border: 0px; background: transparent;">추가</button>
					<button id="minus6"
						style="float: right; border: 0px; background: transparent;">삭제</button>
					<h3>DAY6</h3>
				</div>
				<div class="detail" style="width: 100%;">
					<h3>DAY7</h3>
					<button id="plus7"
						style="float: right; border: 0px; background: transparent;">추가</button>
					<button id="minus7"
						style="float: right; border: 0px; background: transparent;">삭제</button>
					<div class="day7"></div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
>>>>>>> branch 'master' of https://github.com/Developeryhc/Omong.git


	<script>
		$(function() {
			$(".detail").eq(0).show();
		});
		$("#day1").click(function() {
			$(".detail").hide();
			$(".detail").eq(0).show();
		});
		$("#day2").click(function() {
			$(".detail").hide();
			$(".detail").eq(1).show();
		});
		$("#day3").click(function() {
			$(".detail").hide();
			$(".detail").eq(2).show();
		});
		$("#day4").click(function() {
			$(".detail").hide();
			$(".detail").eq(3).show();
		});
		$("#day5").click(function() {
			$(".detail").hide();
			$(".detail").eq(4).show();
		});
		$("#day6").click(function() {
			$(".detail").hide();
			$(".detail").eq(5).show();
		});
		$("#day7").click(function() {
			$(".detail").hide();
			$(".detail").eq(6).show();
		});
	</script>
	<!-- 카카오 맵 api javascript key -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0069a695a69eb1289dd330cee4957ce8&libraries=services"></script>
	<!-- 카카오 맵 api 등록 스크립트 -->
	<script>
		// 마커를 담을 배열입니다
		var markers = [];
		var positions = new Array();

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// @6/24 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// @6/24 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// @6/24 kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// @6/24 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var ti = document.getElementById('title').value;
			var sub = document.getElementById('keyword').value;
			var keyword = ti+sub;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);
				console.log(data);
				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
				alert('검색 결과가 존재하지 않습니다.');
				return;
			} else if (status === kakao.maps.services.Status.ERROR) {
				alert('검색 결과 중 오류가 발생했습니다.');
				return;
			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'),
				menuEl = document.getElementById('menu_wrap'),
				fragment = document.createDocumentFragment(),
				bounds = new kakao.maps.LatLngBounds(),
				listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {
				/*     	console.log(places[i]); */
				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
					marker = addMarker(placePosition),
					itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				marker.setDraggable(true);
				bounds.extend(placePosition);

				// 경도 위도 추가
				positions.push({
					La : placePosition.La,
					Ma : placePosition.Ma
				});

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover', function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout', function() {
								infowindow.close();
							});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'),
				itemStr = '<span class="markerbg marker_1"></span>'	+ '<div class="info">' + '   <h5>'	+ places.place_name	+ '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position) {
			var imageSrc = '/resources/img/marker.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(24, 35), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(24, 35), // 스프라이트 이미지의 크기
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
				marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다
			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'),
				fragment = document.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}

		function test() {
			for (var i = 0; i < positions.length; i++) {
				console.log(positions[i]);
			}
		}
		/*
		var lists = new Array();
		$(function(){
			var img = $("#map").children().first().children().first().children().last().find("img");
			$(document).on("click", "#map>div:first-child>div:first-child>div:last-child img", function() {
				img.draggable(true);
			});
			
			img.on("dragenter", function(e){
				e.stopPropagation();
				e.preventDefault();
				$("#detailList").css("border", "3px solid #F18101");
			});
			img.on("dragleave", function(e){
				e.stopPropagation();
				e.preventDefault();
				$("#detailList").css("border", "none");
			});
			img.on("dragover", function(e){
				3.stopPropagation();
				e.preventDefault();
				$("#detailList").css("border", "3px solid #F18101");
			});
			img.on("drop", function(e){
				e.preventDefault();
				var marker = e.originalEvent.dataTransfer.
				$(".detail").eq(0).append();
			});
		});
		*/
	</script>
	<script>
		$("#plus1").click(function() {
			$(".detail").eq(0).append("<div class='day1'></div>")
		});
		$("#plus2").click(function() {
			$(".detail").eq(1).append("<div class='day2'></div>")
		});
		$("#plus3").click(function() {
			$(".detail").eq(2).append("<div class='day3'></div>")
		});
		$("#plus4").click(function() {
			$(".detail").eq(3).append("<div class='day4'></div>")
		});
		$("#plus5").click(function() {
			$(".detail").eq(4).append("<div class='day5'></div>")
		});
		$("#plus6").click(function() {
			$(".detail").eq(5).append("<div class='day6'></div>")
		});
		$("#plus7").click(function() {
			$(".detail").eq(6).append("<div class='day7'></div>")
		});
		$("#minus1").click(function() {
			$(".day1").last().remove();
		});
		$("#minus2").click(function() {
			$(".day2").last().remove();
		});
		$("#minus3").click(function() {
			$(".day3").last().remove();
		});
		$("#minus4").click(function() {
			$(".day4").last().remove();
		});
		$("#minus5").click(function() {
			$(".day5").last().remove();
		});
		$("#minus6").click(function() {
			$(".day6").last().remove();
		});
		$("#minus7").click(function() {
			$(".day7").last().remove();
		});
		$("#search_btn").click(function() {
			if ($("#search").css("display") == "none") {
				$("#search").show();
			} else {
				$("#search").hide();
			}
		});
	</script>
</body>
</html>