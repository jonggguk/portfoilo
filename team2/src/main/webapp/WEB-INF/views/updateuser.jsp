<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MoodOn_UpdateUser</title>
<link rel="stylesheet" href="css/updateuser.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/60f6a26247.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
						<li class="menu2"><p><a href="#">회원정보 수정</a></p>
							<ul class="menu2 submenu">
								<li><p><a href="change_pw">비밀번호 변경</a></p></li>
								<li><p><a href="updateuser">정보 수정하기</a></p></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</header>
		<br>
		<br>
		<br>
		<center>
		 	  <br> 
			<br>
			<br>
			<form action="updateOk" method="post">
			<table class="type09">
  <thead>
  <tr>
   
    <th scope="cols">회원 정보 변경하기</th>
  </tr>
  </thead>
  <tbody>
  <tr hidden="hidden"> <td> <input type="text" value="${userInfo.u_id}" id="u_id" name="u_id">  </td> </tr>
    <tr>
							  <th scope="row">전화번호 </th>
							<td><select name="phone1" id="phone1">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select> -<input type="text" name="phone2" id="phone2" size="4"
								maxlength="4"> -<input type="text" name="phone3"
								id="phone3" size="4" maxlength="4"> </td>
						</tr>
						<tr>
							  <th scope="row">eamil </th>
							<td><input type="text" name="u_email" size="15"></td>
						</tr>
						<tr>
						  <th scope="row">주소 </th>
							<td><input type="text" id="postcode" name="postcode" placeholder="우편번호" size="10">
							 <input class="mybtn3" type="button"onclick="sample4_execDaumPostcode()" value="주소 찾기" ><br>
								<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소">
								<input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소">
								<span id="guide" style="color:#999;display:none"></span>
								<!--  <inputtype="text" id="detailAddress" name="detailAddress" placeholder="상세주소"> -->
								<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목"></td>
						</tr><tr > 
    	<td colspan="2" align="center"> <input type="submit" class="mybtn2" value="확인" > </td>
     </tr>
  </tbody>
</table>
</form>
			<br>
			<br>
			<br>
		</center>
			<br>
			<br>
			<br>
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
<script>

    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
    	
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

</html>