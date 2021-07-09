<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/signup.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap"
	rel="stylesheet">
<link
	rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/60f6a26247.js"
	crossorigin="anonymous"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="js/signup.js" charset="UTF-8"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<title>MoodOn_SignUp</title>

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
		</header>
		<div class="main">
			<p class="sign" align="center">쇼핑몰 회원가입 페이지</p>

			<br>

			<center>
				<h3>*표시는 필수 입력 항목입니다</h3>
				<br>
				<form name="form" method="post" action="signup_ok">
					<table class="table">

						<tr>
							<td width="80">&nbsp;&nbsp;회원이름</td>
							<td><input type="text" name="u_name" size="10">*</td>
						</tr>
						<tr>
							<td width="80">&nbsp;&nbsp;&nbsp;&nbsp;ID</td>
							<td><input type="text" id="u_id" name="u_id" size="10">
								<button type="button" class="idCheck">ID 중복 검사</button></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<p class="result">
									<span class="msg">  </span>
								</p>
							</td>
						</tr>
						<tr>
							<td width="80">&nbsp;&nbsp;비밀번호</td>
							<td><input type="password" name="u_pw" size="10">* <i
								class="fa fa-eye fa-lg"></i></td>
						</tr>
						<tr>
							<td width="80">&nbsp;&nbsp;재입력</td>
							<td><input type="password" name="u_pw2" size="10">*
								<i class="fa fa-eye fa-lg"></i></td>
						</tr>
						<tr>

							<td>&nbsp;&nbsp;전화번호</td>
							<td><select name="phone1" id="phone1">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select> -<input type="text" name="phone2" id="phone2" size="4"
								maxlength="4"> -<input type="text" name="phone3"
								id="phone3" size="4" maxlength="4">*</td>
						</tr>


						<tr>
							<td width="80">&nbsp;&nbsp;주민번호</td>
							<td><input type="text" name="u_jumin" size="10">* (
								- 빼고 입력)</td>
						</tr>
						<tr>
							<td width="80">&nbsp;&nbsp;E-mail</td>
							<td><input type="text" name="u_email" size="15"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" id="postcode" name="postcode"
								placeholder="우편번호" size="10">* <input class="mybtn3"
								type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기"><br>
								<input type="text" id="roadAddress" name="roadAddress"
								placeholder="도로명주소">* <input type="text"
								id="jibunAddress" name="jibunAddress" placeholder="지번주소">*
								<span id="guide" style="color: #999; display: none"></span> <!--  <inputtype="text" id="detailAddress" name="detailAddress" placeholder="상세주소"> -->
								<input type="text" id="extraAddress" name="extraAddress"
								placeholder="참고항목">*</td>
						</tr>
						<tr align="center">
							<td colspan="3" align="center">
							<button class="mybtn"
								type="button" width="150"  onclick="check_signup()"
								id="sub" disabled="disabled"> 가입하기 </button>

								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input class="mybtn"
								type="reset" value="다시입력">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table>
				</form>
			</center>
		</div>

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
	<script> 
$(".idCheck").click(function(){
 
 var query = {u_id : $("#u_id").val()};
 <!--ajax로 아이디 중복 검사하기  -->
 $.ajax({
  url : "idCheck", /* 컨트롤러 에 들어가는 매핑*/
  type : "post", /* post,get */
  data : query, /* 데이터 타입*/
  success : function(data) {
  	
   if(data == 1) {
    $(".result .msg").text("중복된 ID가 존재합니다");
    $(".result .msg").attr("style", "color:#f00"); 
    /*중복 된 아이디는 버튼 클릭 불가능*/
    $("#sub").attr("disabled", "disabled");
    $("#sub").css("cursor","not-allowed");
   } else {
    $(".result .msg").text("중복된 ID가 없습니다");
    $(".result .msg").attr("style", "color:#00f");
    /*중복 안된 아이디 는 버튼 클릭가능*/
    $("#sub").css("cursor","pointer");
    $("#sub").removeAttr("disabled");
   }
  }, 
  //에러시 메세지 출력 
  error:function(request,status,error){
      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  }
 });  // ajax 끝
});

$("#u_id").keyup(function(){
	 $(".result .msg").text("아이디 중복검사를 해주세요.");
	 $(".result .msg").attr("style", "color:#000");
	 
	 $("#sub").attr("disabled", "disabled");
     $("#sub").css("cursor","not-allowed");
	 
	});
</script>



	<!--눈알 누르면 비밀번호를 텍스트로 바꾸는 코드 입니다 -->
	<script type="text/javascript">
		$(document).ready(
				function() {
					$('.table i').on(
							'click',
							function() {
								$('input').toggleClass('active');
								if ($('input').hasClass('active')) {
									$(this).attr('class',
											"fa fa-eye-slash fa-lg").prev(
											'input').attr('type', "text");
								} else {
									$(this).attr('class', "fa fa-eye fa-lg")
											.prev('input').attr('type',
													'password');
								}
							});
				});
	</script>

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

</body>
</html>