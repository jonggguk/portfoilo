<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<link rel="stylesheet" href="/team2/css/qna.css" type="text/css">
<link rel="stylesheet" href="/team2/css/board.css" type="text/css">
<script type="text/javascript" src="/team2/js/qna.js" charset="utf-8"></script>
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
	</header>
	</div>


<form method="post" action="" name="list_frm">
<center>
		<p>
			<h1>Q & A</h1>
			<h4>문의글을 남겨주세요.</h4>
		</P>
</center>

<div id="list">
	<div class="write_button">
	
			<input type="button" value="글쓰기" onclick="location.href='write'">
	</div>



<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성일</td>
			<td>작성자</td>
		</tr>
	
	
		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.bno}</td>
				<td>
					<a href="/team2/board/view?bno=${list.bno}">${list.title}</a>
				</td>
				<td>
					<fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" />				
				</td>
				<td>${list.writer}</td>
			</tr>
		</c:forEach>
	

</table>
</div>
</form>

<center>
<div>

	<c:if test="${page.prev}">
		<span>[ <a href="/team2/board/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
	</c:if>
	
	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		<span>
		
			<c:if test="${select != num}">
				<a href="/team2/board/listPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a>
			</c:if> 			
			
			<c:if test="${select == num}">
				<b>${num}</b>
			</c:if>
	 			
		</span>
	</c:forEach>
	
	<c:if test="${page.next}">
		<span>[ <a href="/team2/board/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
	</c:if>
	
<br><br>	
	
	<div>
		<select name="searchType">
		    <option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
	        <option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
		    <option value="title_content" <c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
		    <option value="writer" <c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option>
		</select>
		
		<input type="text" name="keyword" value="${page.keyword}"/>
		
		<button type="button" id="searchBtn">검색</button>
	</div>
	
</div>
<script>

	document.getElementById("searchBtn").onclick = function () {
		  
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword =  document.getElementsByName("keyword")[0].value;
		
		location.href = "/team2/board/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	};
</script>
</center>
<br><br>

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
