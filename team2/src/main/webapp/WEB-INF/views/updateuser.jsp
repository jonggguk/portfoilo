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
	alert("�α��� ���� ��� ���� �մϴ�");
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
										<a href="#">��ٱ���</a>
									</p></li>
								<li><p>
										<a href="#">��������</a>
									</p></li>
							</ul></li>
						<li class="menu2"><p><a href="#">ȸ������ ����</a></p>
							<ul class="menu2 submenu">
								<li><p><a href="change_pw">��й�ȣ ����</a></p></li>
								<li><p><a href="updateuser">���� �����ϱ�</a></p></li>
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
   
    <th scope="cols">ȸ�� ���� �����ϱ�</th>
  </tr>
  </thead>
  <tbody>
  <tr hidden="hidden"> <td> <input type="text" value="${userInfo.u_id}" id="u_id" name="u_id">  </td> </tr>
    <tr>
							  <th scope="row">��ȭ��ȣ </th>
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
						  <th scope="row">�ּ� </th>
							<td><input type="text" id="postcode" name="postcode" placeholder="�����ȣ" size="10">
							 <input class="mybtn3" type="button"onclick="sample4_execDaumPostcode()" value="�ּ� ã��" ><br>
								<input type="text" id="roadAddress" name="roadAddress" placeholder="���θ��ּ�">
								<input type="text" id="jibunAddress" name="jibunAddress" placeholder="�����ּ�">
								<span id="guide" style="color:#999;display:none"></span>
								<!--  <inputtype="text" id="detailAddress" name="detailAddress" placeholder="���ּ�"> -->
								<input type="text" id="extraAddress" name="extraAddress" placeholder="�����׸�"></td>
						</tr><tr > 
    	<td colspan="2" align="center"> <input type="submit" class="mybtn2" value="Ȯ��" > </td>
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
					<p>address: �λ걤���� �׸��� �׸��� 123</p>
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

    //�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
    function sample4_execDaumPostcode() {
    	
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var roadAddr = data.roadAddress; // ���θ� �ּ� ����
                var extraRoadAddr = ''; // ���� �׸� ����

                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // �����׸� ���ڿ��� ���� ��� �ش� �ʵ忡 �ִ´�.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';
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