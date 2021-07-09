<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MoodOn_FindPw</title>
<link rel="stylesheet" href="css/findPw.css">
 <link rel="preconnect" href="https://fonts.gstatic.com">
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">  
 <script src="https://kit.fontawesome.com/60f6a26247.js" crossorigin="anonymous"></script>
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
    </header>
    <div class="main">
        <p class="sign" align="center">비밀번호 찾기 </p>
        <form class="form1" name="form" id="form" method="post" action="sendMail">
          <input class="un " type="text" align="center" placeholder="ID를 입력해 주세요 " name="u_id" id="u_id">
          <input class="un " type="text" align="center" placeholder="E-mail을 입력해 주세요 " name="u_email" id="u_email">
          <br>
        <p class="result" style="margin-left: 250px">
		<span class="msg" ></span></p>
		<br>
        <p class="result2" style="margin-left: 190px">
		<span class="msg2" ></span></p>
		<br> 
        
          <button type="button" id="btn" class="emailCk" style="margin-left: 150px">정보 확인</button>
          <!-- onclick="check()" -->
          <button type="button" id="btn2" class="emailCk2" style="margin-left: 70px" disabled="disabled">임시 비밀번호 보내기</button>
          </form>
         
          
          
        </div>
                    
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
	<script> 
$("#btn").click(function(){

 var u_id = $("#u_id").val();
 var u_email = $("#u_email").val();
 console.log(u_id);
 console.log(u_email);
 <!--ajax로 아이디 중복 검사하기  -->
 	$.ajax({
 		 url  : "emailCk", /* 컨트롤러 에 들어가는 매핑*/
 		 type : "post", /* post,get */
  		 data : { u_id :u_id, u_email :u_email },/* 데이터 타입*/
  		 success : function(data) {
  			 console.log(data);
  			 /* 저장된 아이디가 없는경우 */
		 if(data == 0) { 
		 	$(".result .msg").text("Error: ID 에러");
		 	$(".result .msg").attr("style", "color:#f00"); 
		   
  			 /* 저장된 이메일이 다른 경우 */
		 } else if(data == -1){
		 	$(".result .msg").text("Error: E-mail 에러");
		 	$(".result .msg").attr("style", "color:#f00");
		 	/* 성공 시 다시 이메일과 아이디 인증 못하게 막아주기*/
		 }else if(data==1){
			 $(".result .msg").text("Success :D");
			 $(".result .msg").attr("style", "color:#00f");
			 $(".result2 .msg2").text("임시 비밀번호 설정 완료 !");
			 $(".result2 .msg2").attr("style", "color:#00f");
			 //다시 인증못하게 disabled 로 막아주기
			 $("#btn").attr("disabled","disabled");
			 $("#btn2").removeAttr("disabled");
		 }
		 
  }, 
  //에러시 메세지 출력 
  error:function(request,status,error){
      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  }
 });  // ajax 끝
});
$("#btn2").click(function (){
	 var u_id = $("#u_id").val(); console.log(u_id);
			 $(".result2 .msg2").text("  잠시만 기다려 주세요 !");
			 $(".result2 .msg2").attr("style", "color:#00f");
			 $(".result2 .msg2").attr("margin-left:230px");
	form.submit();
	
}) 
	

	

</script>

</html>