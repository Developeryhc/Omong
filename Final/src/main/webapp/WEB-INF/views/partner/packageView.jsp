<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>상세페이지</title>
<style>
.mainPicture {
	height: 800px;
	position: relative;
	overflow: hidden;	
	background-size: cover;
	background-position: center;
	z-index: 1;
}

.contentBox {
	width: 450px;
	
	background-color: #d3d3d3;
	/* margin-top: 50px; */
	justify-content: flex-end;
	opacity: 0.9;
	padding: 30px;
	position:relative;
	border-raius: 3px;
	text-align: center;
}

.contentBox * {
	margin: 10px;
	
	
}
#buyBtn{
	align-self: flex-end;
	
	bottom: 10px;
	left:35px;
}

.productSelect {
	width: 350px;
	height: 40px;
	font-size: 1.3em;
}
.optionSelect {
	width: 350px;
	height: 40px;
	font-size: 1.3em;
}
.addProduct{
	width: 350px;
	height: 40px;
	font-size: 1.3em;
}
.content_iner h3{ 
	padding-bottom : 15px;
	padding-top : 15px;
}
</style>

</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- banner part start-->
	<c:choose>
	<c:when test="${sessionScope.u.no eq packageProduct.partnerNo }">
	<section class="mainPicture" style="width:100%; margin:0 auto; background-image: url(/resources/upload/package/${packageProduct.packageProductMainPicture});">
		<div class="container" style="">
			<div class="row align-items-center justify-content-end"
				style="height: 800px">
				<div class="contentBox ">
					<form style="display:flex-direction:column;">
						<h2>${packageProduct.packageProductName }</h2>
						<h5>${packageProduct.packageProductInfo }</h5>
						<select class="genric-btn primary productSelect" style="font-size: 1.1em;">
							
							<c:forEach items="${packageProduct.productList}" var="pro">
							<option value="${pro.productNo}">${pro.productName}</option>
							</c:forEach>
						</select> 
						<select class="genric-btn primary optionSelect" style="font-size: 1.1em;">
							<!-- <option value="" id="result">옵션1</option> -->							
						</select> 
						<input id="buyBtn" type="submit" class="genric-btn info-border" value="구매" style="width: 80%; height:40px; font-size: 1.3em; ">
					</form>
				</div>
			</div>
		</div>
	</section>
	
	
	
	<section class="tour_details_content section_padding" style="padding-top: 0px; border-top:1px solid black; border-bottom:1px solid black;">
		<div class="container">
			<div class="subPicture" style="text-align:center;">
				<img src="/resources/upload/package/${packageProduct.packageProductSubPicture}">
			</div>
			<hr>
			<div class="row justify-content-start" >
				<div class="col-lg-6">
					<div class="content_iner" style="width:650px;" >
						<h3>이용안내</h3>
						<p> ${packageProduct.packageProductSubInfo1 }</p>
						<h3>이용제한 안내</h3>
						<p>${packageProduct.packageProductSubInfo2 }</p>
						<h3>사용정보</h3>
						<p>${packageProduct.packageProductSubInfo3 }</p>
						<h3>안내사항</h3>
						<p>${packageProduct.packageProductSubInfo4 }</p>
						<h3>취소/환불</h3>
						<p>${packageProduct.packageProductSubInfo5 }</p>
						<h3>판매처정보</h3>
							<p>
							판매자명 : ${packageProduct.ceo }<br>
							연락처 : ${packageProduct.tel }<br>
							홈페이지 : <a href="${packageProduct.homepage}">${packageProduct.homepage}</a>
							</p>						
					</div>
				</div>
			</div>
		</div>
	</section>
	</c:when>
	
	


	<c:otherwise>
	<section class="mainPicture" style="width:100%; height:900px; margin:0 auto; background-image: url(/resources/upload/package/${packageProduct.packageProductMainPicture});">
		<div class="container" style="">
			<div class="row align-items-center justify-content-end"
				style="height: 800px">
				<div class="contentBox" style="border-radius:5px;">
						<h2>${packageProduct.packageProductName }</h2>
						<h5>${packageProduct.packageProductInfo }</h5>
						<select class="genric-btn primary productSelect" style="font-size: 1.1em;">
							<c:forEach items="${packageProduct.productList}" var="pro">
							<option class="productName" value="${pro.productNo}">${pro.productName}</option>
							</c:forEach>
						</select> 
						<select class="genric-btn primary optionSelect" style="font-size: 1.1em;">
							<!-- <option value="" id="result">옵션1</option> -->
						</select>
						<div class="itemWrap"style="margin:0;">
							<!-- <div style="width: 350px; height: 60px; margin-left:20px; background-color:#fff; color:#fe5c24; border:1px solid #F18101;">
								 <div class="price" style="display:inline-block; margin:5px;">
									<span></span>원
								</div>
								<div class="count" style="display:inline-block; margin:5px;">
									<button class="btn btn-secondary btn-sm" style="background-color:#fff; color:#fe5c24; border:1px solid #F18101;">-</button>
									<span class="amount">1</span>
									<button class="btn btn-secondary btn-sm" style="background-color:#fff; color:#fe5c24; border:1px solid #F18101;">+</button>
								</div>
								<div class="total" style="display:inline-block; margin:5px; ">
									총<span class="totalPrice"></span>원
								</div> 
							</div> -->
						</div>
						<h3>총<span id="totalPrice">0</span>원</h3>
						<input id="buyBtn" type="submit" class="genric-btn info-border" value="구매" style="width: 80%; height:40px; font-size: 1.3em; ">
				</div>
			</div>
		</div>
	</section>
	
	
	
	<section class="tour_details_content section_padding" style="padding-top: 0px; border-top:1px solid black; border-bottom:1px solid black;">
		<div class="container">
			<div class="subPicture" style="text-align:center;">
				<img src="/resources/upload/package/${packageProduct.packageProductSubPicture}">
			</div>		
			<hr>
			<div class="row justify-content-start" >
				<div class="col-lg-6">
					<div class="content_iner" style="width:650px;" >
						<h3>이용안내</h3>
						<p> ${packageProduct.packageProductSubInfo1 }</p>
						<h3>이용제한 안내</h3>
						<p>${packageProduct.packageProductSubInfo2 }</p>
						<h3>사용정보</h3>
						<p>${packageProduct.packageProductSubInfo3 }</p>
						<h3>안내사항</h3>
						<p>${packageProduct.packageProductSubInfo4 }</p>
						<h3>취소/환불</h3>
						<p>${packageProduct.packageProductSubInfo5 }</p>
						<h3>판매처정보</h3>
							<p>
							판매자명 : ${packageProduct.ceo }<br>
							연락처 : ${packageProduct.tel }<br>
							홈페이지 : <a href="${packageProduct.homepage}">${packageProduct.homepage}</a>
							</p>						
					</div>
				</div>
			</div>
		</div>
	</section>
	</c:otherwise>
	</c:choose>
	<!-- banner part start-->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>


</body>
	<script>
		
		$(function(){
			selectProduct($(".productSelect").val());
			/* $(".itemWrap").hide(); */
			
		})
		/* $(document).on("click",".optionSelect>option",function(){
			
			var optionSelect = $(".optionSelect").val();
			var optionPrice = $(".optionvalue").eq(0).val();
			var idx = $(".optionSelect>option").index(this);
			console.log(idx);
			if(idx != 0){
				var optionPrice = $(".optionvalue").eq(0).val();
				alert(optionPrice);
			}
			
			
			console.log(optionSelect);
			
		}); */
		
		
		/* 옵션눌렀을때 값불러오기  itemBox나타내기*/
		$(".optionSelect").change(function(){
			var idx = $(this).prop("selectedIndex");
			/* $(".itemWrap").show(); */
			
			if(idx != 0){
				var optionPrice = $(".optionValue").eq(idx-1).val();
				var optionName = $(".optionName").eq(idx-1).val();
				var itemWrap = $(".itemWrap");
				var totalPrice = $(".totalPrice");
				/* var optionYn = $(".optionYn");
				for(var i=0;i<optionYn.length;i++) {

				} */
				var inner = "<div class='optionYn'><h6 value="+optionName+" style='text-align:left;'>"+optionName+"<input class='removeItem' type='button' value='X' style='margin-left:30px;'></h6><div style='width: 350px; height: 60px; margin-left:20px; background-color:#fff; color:#fe5c24; border:1px solid #F18101;'><div class='price' style='display:inline-block; margin:5px;'><span>"+optionPrice+"</span>원</div><div class='count' style='display:inline-block; margin:5px;'><button class='btn btn-secondary btn-sm' style='background-color:#fff; color:#fe5c24; border:1px solid #F18101;'>-</button><span class='amount'>1</span><button class='btn btn-secondary btn-sm' style='background-color:#fff; color:#fe5c24; border:1px solid #F18101;'>+</button></div><div class='total' style='display:inline-block; margin:5px; '>총<span class='totalPrice'>"+optionPrice+"</span>원</div></div></div>"
				/* if(){ */
					itemWrap.append(inner);
					
					/* $(".price").children().html(optionPrice); */
					/* $(".total").children().html(optionPrice); */						
				/* } */
				
			}
			var priceTotal = 0;
			for(var i=0;i<totalPrice.length;i++) {
				priceTotal += Number(totalPrice.eq(i).html());
			}
			$("#totalPrice").html(priceTotal);
		});
		
		/* + - 버튼  */
		
		$(document).on("click",".count>button",function(){
			var priceTotal = 0;
			var totalPrice = $(".totalPrice");
			if($(this).html() == "+"){
				var currAmount = Number($(this).prev().html()); //.amount의 안에값을 넘버로 변환해서 변수에 저장
				$(this).prev().html(currAmount+1);
				currAmount = Number($(this).prev().html());
				
			}else if($(this).html() == "-"){
				var currAmount = Number($(this).next().html()); //.amount의 안에값을 넘버로 변환해서 변수에 저장
				if(currAmount != 1 ){
					$(this).next().html(currAmount-1);
					currAmount = Number($(this).next().html());
					
				}
				
			}
			var price = Number($(this).parent().prev().children().html());
			$(this).parent().next().children().html(currAmount*price);
			
			for(var i=0;i<totalPrice.length;i++) {
				priceTotal += Number(totalPrice.eq(i).html());
			}
			$("#totalPrice").html(priceTotal);
			
		})
		
		/* 
		 $(document).on("click",".optionSelect*",function(){
			 
				var optionPrice = $(".optionvalue").eq(0).val();
				var idx = $(".optionSelect>option").index(this);
				console.log(idx);
				if(idx != 0){
					var optionPrice = $(".optionvalue").eq(idx-1).val();
					alert(optionPrice);
				}
		}) */
		/* 상품 삭제 버튼 */
		$(document).on("click",".removeItem",function(){
			var priceTotal = 0;
			var totalPrice = $(".totalPrice");
			
			$(this).parent().next().remove();
			$(this).parent().remove();
			
			for(var i=0;i<totalPrice.length;i++) {
				priceTotal += Number(totalPrice.eq(i).html());
				removePrice = Number(totalPrice.eq(i).html());
			}
		
			$("#totalPrice").html(priceTotal-removePrice);
			
			
			
		}); 
		
		/*  */
		$(".productSelect").change(function(){
			var selectOption = $(this).val();
			/* var optionSelect = $(".optionSelect").val(); */
			selectProduct(selectOption);
			/* console.log(selectOption); */
			$(".optionValue").remove();
			$(".optionName").remove();
			
			
		});
		function selectProduct(selectOption){
			$.ajax({
				url : "/selectOption.do",
				data : {selectOption : selectOption},
				success : function(data) {
					var html="";
					var optionPrice = "";
					/* console.log(data); */
					html += "<option value=''>==옵션을 선택해주세요.==</option>";
					console.log()
					for(var i=0;i<data.length;i++) {
						var productNo = data[i].productNo;
						var optionNo = data[i].optionNo;
						var optionName = data[i].optionName;
						var optionPrice = data[i].optionPrice;
						html += "<option value="+optionNo+">"+ optionName +" : "+ optionPrice +"원</option>";
						$(".optionSelect").before('<input type="hidden" class="optionValue" value="'+optionPrice+'"><input type="hidden" class="optionName" value="'+optionName+'">');
						
					}
					$(".optionSelect").html(html);
					
				}
			})
		}
		
	</script>
	
</html>