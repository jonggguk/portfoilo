<%@ page import="com.shop.team2.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>


<%
response.setContentType("text/html");
UserDto userInfo = (UserDto) session.getAttribute("userInfo");
if (userInfo == null) {
%>
<script type="text/javascript">
	alert("로그인 이후 사용 가능 합니다");
	location.href = "login";
</script>
<%
}
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/change_pw.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap"
	rel="stylesheet">
<link
	rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/60f6a26247.js"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
			<br> <br> <br>
			<form action="changepwOk" method="post">
				<table class="type09">
					<thead>
					<tr hidden="hidden"> 
					<td> 
					<input type="text" value="${userInfo.u_id}" id="u_id" name="u_id"> 
					 </td>
					 </tr>
					 
						<tr>
							<th scope="cols">비밀번호 변경하기</th>
						</tr>
					</thead>
					<tbody>
					<tr>
							<th scope="row">현재 비밀번호</th>
							<td><input type="password" id="nowPw" name="nowPw" size="10">
								<i class="fa fa-eye fa-lg"></i></td>
						</tr>
						<tr>
							<th scope="row">새 비밀번호</th>
							<td><input type="password" id="u_pw" name="u_pw" size="10">
								<i class="fa fa-eye fa-lg"></i></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								class="mybtn2" value="확인"></td>
						</tr>
					</tbody>
				</table>
			</form>
			<c:if test="${msg == false }">
				<p style="color: red">현재 비밀번호를 확인해주세요 .</p>
			</c:if>
			<br> <br> <br>



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
<script type="text/javascript">
	$(document).ready(
			function() {
				$('.type09 i').on(
						'click',
						function() {
							$('input').toggleClass('active');
							if ($('input').hasClass('active')) {
								$(this).attr('class', "fa fa-eye-slash fa-lg")
										.prev('input').attr('type', "text");
							} else {
								$(this).attr('class', "fa fa-eye fa-lg").prev(
										'input').attr('type', 'password');
							}
						});
			});
</script>
</html>