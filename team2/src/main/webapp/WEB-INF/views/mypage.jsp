<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="myUtil.HanConv"%>
<%@page import="com.shop.team2.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setContentType("text/html");
String u_id = (String) session.getAttribute("id");
if (u_id == null) {
%>
<script type="text/javascript">
	alert("로그인 이후 사용 가능 합니다");
	location.href = "login";
</script>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>MoodOn_MyPage</title>
<link rel="stylesheet" href="css/mypage.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/60f6a26247.js"
	crossorigin="anonymous"></script>

</head>

<body>

	<div id="wrap">
		<header>
			<div class="top">
				<div class="top__search">
					<li><input type="text"></li>
					<li><a href=""><i class="fas fa-search"></i></a></li>
				</div>
				<ul class="top__list">

					<li><a href="main">HOME</a></li>
					<li><a href="">JOIN</a></li>
					<li><a href="mypage">MY PAGE</a></li>
					<li><a href="cart">CART</a></li>
				</ul>
			</div>

			<div class="logo">
				<img src="images/pinterest_profile_image.jpg" alt="">
			</div>
			<div id="nav">
				<div class="menu">
					<ul class="myMenu">
						<li class="menu1"><p>
								<a href="#">My Cart </a>
							</p>
							<ul class="menu1 submenu">
								<li><p>
										<a href="#">장바구니</a>
									</p></li>
								<li><p>
										<a href="#">결제내역</a>
									</p></li>
							</ul></li>
						<li class="menu2"><p>
								<a href="#">회원정보 수정</a>
							</p>
							<ul class="menu2 submenu">
								<li><p>
										<a href="change_pw">비밀번호 변경</a>
									</p></li>
								<li><p>
										<a href="updateuser">정보 수정하기</a>
									</p></li>
							</ul></li>
					</ul>
				</div>
			</div>

		</header>


		<br> <br> <br>
		<center>


			<table class="type09">
				<thead>
					<tr>
						<th scope="cols">정보 확인하기</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${user}" var="user">
					${user.u_name} 님의 정보 
						<tr>
							<th scope="row">아이디</th>
							<td>${user.u_id}</td>
						</tr>
						<tr>
							<th scope="row">이름</th>
							<td>${user.u_name}</td>
						</tr>
						<tr>
							<th scope="row">전화번호</th>
							<td>${user.u_phone}</td>
						</tr>
						<tr>
							<th scope="row">이메일</th>
							<c:choose>
								<c:when test="${!empty user.u_email}">
									<td>${user.u_email}</td>
								</c:when>
								<c:otherwise>
									<td>등록된 E-Mail 이 없습니다.</td>
								</c:otherwise>
							</c:choose>

						</tr>
						<tr>
							<th scope="row">주소</th>
							<c:choose>
								<c:when test="${!empty user.u_address}">
									<td>${user.u_address}</td>
								</c:when>
								<c:otherwise>
									<td>등록된 주소가 없습니다.</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<th scope="row">포인트</th>
							<td>${user.u_point}</td>
						</tr>
						<tr>
							<th scope="row">등급</th>
							<td>${user.u_grade}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br> <br> <br>
			<p class="logout">
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
					<a href="logout_ok"><button class="mybtn">로그아웃 하기</button></a> 
				
				&nbsp;&nbsp;&nbsp;&nbsp; <a href="deleteUser"><button
						class="mybtn">회원탈퇴 하기</button> </a>
			</p>

		</center>
		<br> <br> <br>

		<div class="clear"></div>
		<footer>
			<div class="info1">
				<li>
					<h3>about us</h3>
					<p>company: MOODON</p>
					<p>business no: 123-45-67890</p>
					<p>tel. 02-1111-1111</p>
					<p>address: 부산광역시 그린구 그린로 123</p>
					<p>
						<i>Copyright. MOODON all rights reserved.</i>
					</p>
				</li>
				<li>
					<h3>C/S CENTER</h3>
					<p>
						<strong>02-1111-1111</strong>
					</p>
					<p>mon-fri pm1:00~pm6:00</p>
					<p>sat, sun, holiday off</p>
				</li>
			</div>
		</footer>
	</div>

</body>
</html>