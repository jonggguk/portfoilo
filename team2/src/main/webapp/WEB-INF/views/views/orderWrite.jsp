<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/cart.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<script type="text/javascript">
//주문금액 계산 
function total_price(){
  	let array1 = document.getElementsByName("c_price");
  	let array2 = document.getElementsByName("c_qty");
	let total = 0;
	let delivery = 0;
	let sell_qty = 0;
	for(let i = 0; i < array1.length; i++){
		let c_price = Number(array1[i].value)
		let c_qty = Number(array2[i].value)
		total += (c_price * c_qty);
		sell_qty += c_qty;
	}
	
	if(total > 0 && total < 50000){
		delivery = 3000;
	}
document.getElementById('items').value = total;
document.getElementById('delivery').value = delivery;
document.getElementById('total').value = total + delivery;
document.getElementById('sell_qty').value = sell_qty;
}

    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function findAddr() {
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
                document.getElementById('order_zipcode').value = data.zonecode;
                document.getElementById("order_addr1").value = roadAddr + data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("order_addr2").value = extraRoadAddr;
                } else {
                    document.getElementById("order_addr2").value = '';
                }
            }
        }).open();
    }
    
    function iamport(){
    	let total = document.getElementById('total').value;
    	//var total = ${total}
		//가맹점 식별코드
		IMP.init('imp17488507');
		IMP.request_pay({
		    pg : 'kcp',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '상품1' , //결제창에서 보여질 이름
		    amount : total, //실제 결제되는 가격
		    buyer_email : 'haha_sparta@naver.com',
		    buyer_name : '박가람',
		    buyer_tel : '010-2744-9311',
		    buyer_addr : '서울 강남구 도곡동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        
		        alert(msg);
		        document.orderForm.submit();
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	}
</script>
</head>
<body onload="total_price()">
  <div id="wrap">
    <header>
      <div class="top">
        <div class="top__search">
          <li><input type="text"></li>
          <li><a href=""><i class="fas fa-search"></i></a></li>
        </div>
        <ul class="top__list">
          <li><a href="">LOGIN</a></li>
          <li><a href="">JOIN</a></li>
          <li><a href="">MY PAGE</a></li>
          <li><a href="">CART</a></li>
        </ul>
      </div>

      <div class="logo">
        <img src="/team2/images/pinterest_profile_image.jpg" alt="">
      </div>

      <nav class="mainbar">
        <li><a href="">BEST50</a></li>
        <li><a href="">OUTER</a></li>
        <li><a href="">TOP</a></li>
        <li><a href="">PANTS</a></li>
        <li><a href="">SKIRT&DRESS</a></li>
      </nav>
    </header>
    <div class="orderForm">
    <form action="/orderOk" name="orderForm" method="post">
    
    <main>
      <div class="main_title">
        <h3>ORDER FORM</h3>
      </div>
      
        <table class="table">
          <colgroup>
            <col style="width: 40px;">
            <col style="width: auto;">
            <col style="width: 95px;">
            <col style="width: 60px;">
            <col style="width: 95px;">
            <col style="width: 95px;">
          </colgroup>
          <thead>
            <tr align="center">
              <td scope="col">이미지</td>
              <td scope="col">상품정보</td>
              <td scope="col">판매가</td>
              <td scope="col">수량</td>
              <td scope="col">적립금</td>
              <td scope="col">합계</td>
            </tr>
          </thead>
          <tbody>
          	<c:forEach items="${list}" var="dto" varStatus="status">
          	<input type="hidden" value="${dto.c_price}" name="c_price">
          	<input type="hidden" value="${dto.item_name}" name="item_name">
          	<input type="hidden" value="${dto.item_number}" name="item_number">
          	<input type="hidden" value="${dto.c_option1}" name="c_option1">
          	<input type="hidden" value="${dto.c_option2}" name="c_option2">
          	<input type="hidden" value="" name="sell_qty" id="sell_qty">
            <tr>
              <td><img src="/team2/clothes/${dto.item_number}.jpg" alt="" width="80px" height="100px"></td>
              <td>
                <ul>
                  <li><strong>${dto.item_name}</strong></li>
                  <li>[옵션1: ${dto.c_option1}]</li>
                  <li>[옵션2: ${dto.c_option2}]</li>
                </ul>
              </td>
              <td>${dto.c_price}</td>
              <td>
                <ul>
                  <li><input type="number" value="${dto.c_qty}" name="c_qty" style="width: 50px;" disabled="disabled"></li>
                </ul>
              </td>
              <td>${dto.c_price * dto.c_qty * 0.05}</td>
              <td>${dto.c_price * dto.c_qty}</td>
            </tr>
			</c:forEach>
          </tbody>
        </table>
        

    </main>
    
    <br><br>
    
        <h2>배송 정보</h2>
          	<p>
          		<b>받으시는분</b> &nbsp;
          		<input type="checkbox" name="chkinfo" id="chkinfo" onclick="fn_chkinfo()">
          		새로 입력
          	</p>
            
            <table class="table">
            <colgroup>
				<col width="15%" />
				<col width="*" />
			</colgroup>
              <tbody>
              <c:forEach items="${info}" var="u">
                <input type="hidden" name="order_id" value="${u.u_id}">
              	<tr>
              		<td>이름</td>
              		<td style="text-align:left">
                  		<input type="text" name="order_name" id="order_name" value="${u.u_name}" style="width:100px;" >
                  	</td>
				</tr>
				<tr>
              		<td>휴대폰번호</td>
              		<td style="text-align:left">
                  		<input type="text" name="order_tel" id="order_tel" value="${u.u_phone}" style="width:120px;" >
                  	</td>
				</tr>
				</c:forEach>
				<tr>
              		<td rowspan="3">주소</td>
              		<td style="text-align:left">
                  		<input type="text" name="order_zipcode" id="order_zipcode" value="" style="width:80px;" >
                  		<button type="button" id="findAddrBtn" onclick="findAddr()">우편번호 찾기</button>
                  	</td>
				</tr>
				<tr>
              		<td style="text-align:left">
                  		<input type="text" name="order_addr1" id="order_addr1"value="" style="width:400px;" >
                  	</td>
				</tr>
				<tr>
              		<td style="text-align:left">
                  		<input type="text" name="order_addr2" id="order_addr2"value="" style="width:400px;" >
                  	</td>
				</tr>
              </tbody>
            </table>
    <br><br>    
        <table class="table">
        	<tr>
        		<td colspan="7">주문상품 할인적용</td>
        	</tr>
        	<tr>
        		<td colspan="2">적립금사용</td>
        		<td colspan="5">
        			<input type="text" name="point">
        		</td>
        	</tr>
        	<tr>
        		<td>상품금액</td>
        		<td></td>
        		<td>배송비</td>
        		<td></td>
        		<td>할인금액</td>
        		<td></td>
        		<td>결제 예정금액</td>
        	</tr>
        	<tr>
        		<td><input type="text" id="items" value=""></td>
        		<td><i class="fas fa-plus-circle"></i></td>
        		<td><input type="text" id="delivery" value=""></td>
        		<td><i class="fas fa-plus-circle"></i></td>
        		<td><input type="text" id="discount" value=""></td>
        		<td>=</td>
        		<td>합계: <strong><input type="text" id="total" value="" name="sell_price"></strong></td>
        	</tr>

        </table>
        </form>
    <input type="button" onclick="iamport()" value="결제하기" class="btn btn-primary">
    </div>
    
    <br><br><br>
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