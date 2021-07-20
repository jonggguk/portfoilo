<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MoodOn �α���</title>
</head>
 <link rel="stylesheet" href="css/login.css">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">  
  <title>Document</title>
  <script src="https://kit.fontawesome.com/60f6a26247.js" crossorigin="anonymous"></script>
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
        <p class="sign" align="center">���θ� �α��� ������</p>
        
        <form class="form1" name="form" id="form" method="post" action="loginOk">
          <input class="un " type="text" align="center" placeholder="ID�� �Է��� �ּ��� " name="u_id" id="u_id">
          <input class="pass" type="password" align="center" placeholder="Password�� �Է��� �ּ���" name="u_pw" id="u_pwd">
          <a class="submit" align="center" onClick="click_login()">�α���</a> <br>            
          <p class="forgot" align="center">
          <input type="checkbox" name="loginChk" value="true" >�α��� ���� ���� &nbsp;&nbsp;&nbsp;&nbsp; 
       <!--    <a href="findPw" >��й�ȣã��  </a> &nbsp;&nbsp;&nbsp;&nbsp;   -->
          <a href="go_to_signup">ȸ�� ���� �ϱ�</a> 
          </p>
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
<script>
function click_login(){
	if(form.u_id.value == ""){
		form.u_id.focus();
		alert("���̵� �Է��ϼ���.");
		return;
	}
	if(form.u_pw.value == ""){
		form.u_pw.focus();
		alert("��й�ȣ�� �Է��ϼ���.");
		return;
	}
	form.submit();
}
</script>
</body>
</html>