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
        <p class="sign" align="center">��й�ȣ ã�� </p>
        <form class="form1" name="form" id="form" method="post" action="sendMail">
          <input class="un " type="text" align="center" placeholder="ID�� �Է��� �ּ��� " name="u_id" id="u_id">
          <input class="un " type="text" align="center" placeholder="E-mail�� �Է��� �ּ��� " name="u_email" id="u_email">
          <br>
        <p class="result" style="margin-left: 250px">
		<span class="msg" ></span></p>
		<br>
        <p class="result2" style="margin-left: 190px">
		<span class="msg2" ></span></p>
		<br> 
        
          <button type="button" id="btn" class="emailCk" style="margin-left: 150px">���� Ȯ��</button>
          <!-- onclick="check()" -->
          <button type="button" id="btn2" class="emailCk2" style="margin-left: 70px" disabled="disabled">�ӽ� ��й�ȣ ������</button>
          </form>
         
          
          
        </div>
                    
        <footer>
      <div class="info1"> 
        <li>
          <h3>about us</h3>
          <p>company: MOODON</p>
          <p>business no: 123-45-67890</p>
          <p>tel. 02-1111-1111</p>
          <p>address: �λ걤���� �׸��� �׸��� 123</p>
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
 <!--ajax�� ���̵� �ߺ� �˻��ϱ�  -->
 	$.ajax({
 		 url  : "emailCk", /* ��Ʈ�ѷ� �� ���� ����*/
 		 type : "post", /* post,get */
  		 data : { u_id :u_id, u_email :u_email },/* ������ Ÿ��*/
  		 success : function(data) {
  			 console.log(data);
  			 /* ����� ���̵� ���°�� */
		 if(data == 0) { 
		 	$(".result .msg").text("Error: ID ����");
		 	$(".result .msg").attr("style", "color:#f00"); 
		   
  			 /* ����� �̸����� �ٸ� ��� */
		 } else if(data == -1){
		 	$(".result .msg").text("Error: E-mail ����");
		 	$(".result .msg").attr("style", "color:#f00");
		 	/* ���� �� �ٽ� �̸��ϰ� ���̵� ���� ���ϰ� �����ֱ�*/
		 }else if(data==1){
			 $(".result .msg").text("Success :D");
			 $(".result .msg").attr("style", "color:#00f");
			 $(".result2 .msg2").text("�ӽ� ��й�ȣ ���� �Ϸ� !");
			 $(".result2 .msg2").attr("style", "color:#00f");
			 //�ٽ� �������ϰ� disabled �� �����ֱ�
			 $("#btn").attr("disabled","disabled");
			 $("#btn2").removeAttr("disabled");
		 }
		 
  }, 
  //������ �޼��� ��� 
  error:function(request,status,error){
      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  }
 });  // ajax ��
});
$("#btn2").click(function (){
	 var u_id = $("#u_id").val(); console.log(u_id);
			 $(".result2 .msg2").text("  ��ø� ��ٷ� �ּ��� !");
			 $(".result2 .msg2").attr("style", "color:#00f");
			 $(".result2 .msg2").attr("margin-left:230px");
	form.submit();
	
}) 
	

	

</script>

</html>