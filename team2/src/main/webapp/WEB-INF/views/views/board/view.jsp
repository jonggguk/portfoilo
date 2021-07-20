<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
<link rel="stylesheet" href="/team2/css/board.css" type="text/css">
<link rel="stylesheet" href="/team2/css/qna.css" type="text/css">
<script src="https://kit.fontawesome.com/60f6a26247.js" crossorigin="anonymous"></script>
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
					<!--   로그인 상태는 > HOME 		 비로그인 상태는 > LOGIN 보이게  -->
		<%-- 
        if(u_id==null){
        --%>
					<li><a href="Login.jsp">LOGIN</a></li>
		<%--  
        }else{
        --%>
					<li><a href="Main.jsp">HOME</a></li>
		<%-- 
        }
        --%>
					<li><a href="#">JOIN</a></li>
					<li><a href="mypage.jsp">MY PAGE</a></li>
					<li><a href="cart.html">CART</a></li>
				</ul>
			</div>

			<div class="logo">
				<img src="/team2/resources/images/pinterest_profile_image.jpg" alt="">
			</div>
	</div>
	<div id="nav">
		<div class="menu">
			<ul class="myMenu">
				<li class="menu1"><p>
						<a href="/team2/notice/list">공지사항</a>
					</p></li>
				<li class="menu2"><p>
						<a href="/team2/faq/list">F A Q</a>
					</p></li>
				<li class="menu3"><p>
						<a href="/team2/board/listPageSearch?num=1">Q & A</a>
					</p></li>
				<li class="menu4"><p>
						<a href="/team2/review/listPageSearch?num=1">후 기 </a>
					</p></li>
			</ul>
		</div>
	</div>



<center>
	<p>
		<h1>Q&A</h1>
	</p>
		
<div id="s_list">
<table>
	<tr>
		<td>
			${view.title}
			<div class="writer">
				<span>작성자 : </span>${view.writer}
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div class="content">
				${view.content}
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div class="s_button">
				<input type="button" value="수정" onclick="location.href='/team2/board/modify?bno=${view.bno}'">
				<input type="button" value="삭제" onclick="location.href='/team2/board/delete?bno=${view.bno}'">
				<input type="button" value="목록" onclick="location.href='list'">
			</div>
		</td>
	</tr>
</table>

</div>

<!-- 댓글 시작 -->
<div id="c_list">
<table>
	<c:forEach items="${reply}" var="reply">
	<tr>
		<td>
			${reply.writer}
		</td>
		<td>
			${reply.content}
		</td>
		<td>
			<fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd"/>
		</td>
	</tr>
	</c:forEach>
</table>
</div>

<div>
	<table>
		<form method="post" action="/team2/reply/write">
		<tr>
			<td colspan="2">
				<label>댓글 작성자</label> 
				<input type="text" name="writer">
			</td>
		</tr>		
		<tr>
			<td>
				<textarea rows="5" cols="100" name="content"></textarea>
				
			</td>
			<td>
				<div class="s_button">
					<input type="hidden" name="bno" value="${view.bno}">
					<input type="submit" value="댓글작성">
				</div>
			</td>
		</tr>
	</form>
	</table>
</div>

<!-- 댓글 끝 -->


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


</body>
</html>