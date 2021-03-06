<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#box1 {
	
}

#text-box2 {
	margin: 0 auto;
	width: 100%;
	height: 80px;
	line-height: 80px;
	background-color: rgb(235, 235, 243);
	text-align: center;
	color: black;
	font-size: x-large;
}

#box-list {
	margin: 0 auto;
	width: 1400px;
}

#select-delete-btn {
	margin: 0 auto;
	float: right;
	color: white;
	font-size: 20px;
	border: 0px solid;
	width: 200px;
	height: 50px;
	background-color: #bbdefb;
}

table {
	margin:0 auto;
	width: 1400px;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	border-left: 0px solid;
	border-right: 0px solid;
}

th {
	font-weight: bold;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	background-color: #bbdefb;
	text-align: center;
	border-left: 0px solid;
	border-right: 0px solid;
}

td {
	padding: 5px;
	border-top: 1px solid black;
	border-bottom: 0px solid black;
	border-left: 0px solid;
	border-right: 0px solid;
}
.search-box-div{
margin:0 auto;
width:1400px;
}
.searchBox{
width:300px;
height:35px;
}
.finBox{
width:90px;
height:35px;
background-color:#acacac;
color:#fff;
border:0px solid;
}



</style>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<form action="/deleteEmployee1.do" method="post">
		<div id="box1">
			<div id="text-box2">전체 회원 정보</div>
			<hr>
			<div id="box-list">
				<table border="2">
					<tr>
						<th width="20px">책크</th>
						<th width="30px">번호</th>
						<th width="60px">아이디</th>
						<th width="80px">이름</th>
						<th width="100px">이메일</th>
						<th width="50px">전화번호</th>
						<th width="230px">주소</th>
						<th width="60px">생년월일</th>
						<th width="30px">성별</th>
					</tr>
					<c:forEach items="${list }" var="employee" varStatus="e">
						<tr>
							<td><input type="checkbox" id="chk" name="chk"
								value="${sessionScope.u.type.id }"></td>
							<td>${e.count }</td>
							<td>${employee.id }</td>
							<td>${employee.name }</td>
							<td>${employee.email }</td>
							<td>${employee.phone }</td>
							<td>${employee.address }</td>
							<td>${employee.birth }</td>
							<td>${employee.gender }</td>
						</tr>
					</c:forEach>
				</table>
				<br> <input type="submit" class="delete-btn"
					id="select-delete-btn" value="선택 계정 삭제">
			</div>
		</div>
	</form>
	<div class="search-box-div">
	<form action="/findEmployee.do" method="post" class="form1">
		<select class="form-control" style="width:120px;display:inline-block" name="selectList">
			<option value="1" selected>아이디</option>
			<option value="2">이름</option>
			<option value="3">전화번호</option>
		</select>
			<input type="text" name="searchBox" class="searchBox">
			<input type="submit" value="조회" class="finBox" id="finBox">
	</form>
	</div>
	<br>
	<br>
	<br>
	<br>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>