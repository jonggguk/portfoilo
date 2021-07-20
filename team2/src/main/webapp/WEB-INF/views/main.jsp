<%@page import="com.shop.team2.dto.UserDto"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MoodOn_Main</title>
 <link rel="stylesheet" href="resources/css/main.css">
 <link rel="preconnect" href="https://fonts.gstatic.com">
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">  
<!-- <link href="https://fonts.googleapis.com/css2?family=Aclonica&family=Indie+Flower&family=Sigmar+One&family=Staatliches&family=Suravaram&family=Titan+One&display=swap" rel="stylesheet"> -->
	<script type="text/javascript" src="resources/js/jquery.js"></script> 
	<script type="text/javascript">
		$(document).ready(function(){ 
		var currentPosition = parseInt($("#slidemenu").css("top")); 
		$(window).scroll(function() {
		var position = $(window).scrollTop()+200;
		$("#slidemenu").stop().animate({"top":position+currentPosition+"px"},400);
		});
		
		});
	</script>
	<!-- 검색기능 미구현 -->
	<!-- <script type="text/javascript" >
		$(function () {
			$("#mySearch").on("click",function(){
				 var getText = document.getElementById('search').value;
				location.href="showClothes.jsp?getText="+getText;
			});
		});
	</script> -->
	
	
<script src="https://kit.fontawesome.com/60f6a26247.js" crossorigin="anonymous"></script>
<%

String id =null;
Cookie[] c = request.getCookies();

if (c != null) {
	for(Cookie cf : c){
		if (cf.getName().equals("id")) {
			String ids = cf.getValue();
			session.setAttribute("id", ids);
			
		}
	}
	id =(String) session.getAttribute("id");
}
	UserDto sessionDto =(UserDto)session.getAttribute("userInfo");
	

%>
</head>
<body>
<div id="wrap">
	<header>
	  <div class="top">
        <div class="top__search">
          <li> <input type="text" name="search" id="search" title="상품이름을 검색해주세요"></li>
           
          <li><a href="#"><i class="fas fa-search" id="mySearch"></i></a></li>
        </div>
        <ul class="top__list">
      <!--   로그인 상태는 > HOME 
       		 비로그인 상태는 > LOGIN 보이게  -->
        <% 
        if(id==null){
        	%>
          <li><a href="login">LOGIN</a></li>
         <%  
        }else{
        	%> 
        	 <li><a href="main">HOME</a></li>
        	<% 
        }
        %>
          <li><a href="/team2/notice/list">JOIN</a></li>
          <li><a href="mypage">MY PAGE</a></li>
          <li><a href="cart">CART</a></li>
        </ul>
      </div>

      <div class="logo">
        <img src="resources/images/pinterest_profile_image.jpg" alt="">
      </div>
			<div id="nav">
				<div class="menu">
					<ul class="myMenu">
						<li class="menu1"><p><a href="#">Top</a></p>
							<ul class="menu1 submenu">
								<li><p><a href="#">Jacket</a></p></li>
								<li><p><a href="#">Shirt</a></p></li>
							</ul>
						</li>
						<li class="menu2"><p><a href="#">Pants</a></p>
							<ul class="menu2 submenu">
								<li><p><a href="#">Jeans</a></p></li>
								<li><p><a href="#">Skirt</a></p></li>
							</ul>
						</li>
						<li class="menu3"><p><a href="#">SHOES&BAG</a></p>
							<ul class="menu3 submenu">
								<li><p><a href="#">Shoes</a></p></li>
								<li><p><a href="#">Bag</a></p></li>
							</ul>
						</li>
						<li class="menu4"><p><a href="#">ACC</a></p>
							<ul class="menu4 submenu">
								<li><p><a href="#">EarAcc</a></p></li>
								<li><p><a href="#">NeckAcc</a></p></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		
	</header>
	
	<div id="slidemenu">
		<div>
			<a href="#"><img src="resources/clothes/slidemenu2.png"></a>			
		</div>
		<div>
			<a href="#"><img src="resources/clothes/slidemenu1.png"></a>
		</div>
	</div>
	
	<section id="">
		<div id="weeklyb">
				<p>★Weekly Best Item★</p>
			<div class="clothes">
				<img src="resources/clothes/cloth1.jpg"><br>
				<a href="#"><span>상의 1번</span></a>
				<a href="#"><img src="resources/clothes/like.png" id="likeimg"></a><br>
				<span>29,900원</span>
			</div>
			<div class="clothes">
				<img src="resources/clothes/cloth2.jpg"><br>
				<a href="#"><span>상의 2번</span></a>
				<a href="#"><img src="resources/clothes/like.png" id="likeimg"></a><br>
				<span>29,900원</span>
			</div>
			<div class="clothes">
				<img src="resources/clothes/cloth3.jpg"><br>
				<a href="#"><span>상의 3번</span></a>
				<a href="#"><img src="resources/clothes/like.png" id="likeimg"></a><br>
				<span>29,900원</span>
			</div>
			<div class="clothes">
				<img src="resources/clothes/cloth4.jpg"><br>
				<a href="#"><span>상의 4번</span></a>
				<a href="#"><img src="resources/clothes/like.png" id="likeimg"></a><br>
				<span>29,900원</span>
			</div>
			<div class="clothes">
				<img src="resources/clothes/cloth5.jpg"><br>
				<a href="#"><span>상의 5번</span></a>
				<a href="#"><img src="resources/clothes/like.png" id="likeimg"></a><br>
				<span>29,900원</span>
			</div>
			<div class="clothes">
				<img src="resources/clothes/cloth6.jpg"><br>
				<a href="#"><span>상의 6번</span></a>
				<a href="#"><img src="resources/clothes/like.png" id="likeimg"></a><br>
				<span>29,900원</span>
			</div>
			<div class="clothes">
				<img src="resources/clothes/cloth7.jpg"><br>
				<a href="#"><span>상의 7번</span></a>
				<a href="#"><img src="resources/clothes/like.png" id="likeimg"></a><br>
				<span>29,900원</span>
			</div>
			<div class="clothes">
				<img src="resources/clothes/cloth8.jpg"><br>
				<a href="#"><span>상의 8번</span></a>
				<a href="#"><img src="resources/clothes/like.png" id="likeimg"></a><br>
				<span>29,900원</span>
			</div>
		</div>
		
		<!-- <div id="chatbot">
			<div class="image">
				<img src="clothes/chatbot.png" class="img">
			</div>
			
		</div> -->
	</section>
	<br><br><br><br>
	<div class="clear"></div>
	 <footer>
      <div class="info1">
        <li>
          <h3>about us</h3>
          <p>company: MOODON</p>
          <p>business no: 123-45-67890</p>
          <p>tel. 02-1111-1111</p>
          <p>address: 부산광역시 그린구 그린로 123</p>
          <p><i>Copyright. MOODON all rights reserved.</i></p>
        </li>
        <li>
          <h3>C/S CENTER</h3>
          <p><strong>02-1111-1111</strong></p>
          <p>mon-fri pm1:00~pm6:00</p>
          <p>sat, sun, holiday off</p>
        </li>
      </div>
    </footer>
  </div>
</body>
</html>