<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/cart.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<title>Insert title here</title>
  <script src="https://kit.fontawesome.com/60f6a26247.js" crossorigin="anonymous"></script>
 <!-- <script src="/team2/js/jquery.js"></script> -->
  
  <script type="text/javascript">
  
  //체크박스 전체선택, 해제 
  function check_all(n){
		let list = document.querySelectorAll(".list");
		for(let i = 0; i < list.length; i++){
			list[i].checked = n.checked;
		}
	total_price();
	}

  //주문금액 계산 
	function total_price(){
	  	let array1 = document.getElementsByName("c_price");
	  	let array2 = document.getElementsByName("c_qty");
		let list = document.querySelectorAll(".list");
		let total = 0;
		let delivery = 0;
		for(let i = 0; i < list.length; i++){
			if(list[i].checked){
				let c_price = Number(array1[i].value)
				let c_qty = Number(array2[i].value)
				total += (c_price * c_qty);
			}
		}
		
		if(total > 0 && total < 50000){
			delivery = 3000;
		}
	document.getElementById('items').value = total;
	document.getElementById('delivery').value = delivery;
	document.getElementById('total').value = total + delivery;
	}

  //상품수량 변경
	function updateQty(index){
		let c_code = document.getElementsByName("chk")[index].value;
		let c_qty = document.getElementsByName("c_qty")[index].value;
		if(confirm("수량을 변경하시겠습니까?")){
			location.href="/team2/cart/updateQty?c_code="+c_code+"&c_qty="+c_qty;
		}
	}
  
 	//상품 삭제
 	function one_delete(c_code){

 		if(confirm("삭제하시겠습니까?")){
 			location.href="/team2/cart/cartDelete?c_code="+c_code;
 		}
 		return false;
 	}
 	function one_order(c_code){
 		if(confirm("주문하시겠습니까?")){
 			location.href="/team2/order/cartSelectOrder?select_cart_no="+c_code;
 		}
 		return false;
 	}
 	//장바구니 전체주문
 	function all_order(){
 		document.cart.submit();
 	}
 	
 	//선택상품 주문
 	function select_order(){ 
 		var list = document.querySelectorAll(".list");
 		var select_cart_no = new Array(); // 배열 선언
 		
 		for(let i = 0; i < list.length; i++){
			if(list[i].checked){
				select_cart_no.push(list[i].value);
			}
		}
 	 	
 	    if(select_cart_no[0] != null){
 	    	location.href="/team2/order/cartSelectOrder?select_cart_no="+select_cart_no;
 	    }else{
 	    	alert("구매할 상품을 선택해 주세요.");
 	    }
 	}
 	
  </script>
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
      <div class="cart">
      <div class="main_title">
        <h3>SHOPPING CART</h3>
      </div>
      
        <form name="cart" method="post" action="/team2/order/cartAllOrder">
<%-- 		<input type="hidden" name="list" value="${list}">--%>
		<input type="hidden" name="u_id" value="${list[0].u_id}">
		
      
        <table class="table">
          <colgroup>
            <col style="width: 30px;">
            <col style="width: 95px;">
            <col style="width: auto;">
            <col style="width: 95px;">
            <col style="width: 140px;">
            <col style="width: 95px;">
            <col style="width: 95px;">
            <col style="width: 110px;">
          </colgroup>
          <thead>
            <tr align="center">
              <td scope="col"><input type="checkbox" name="all" id="allchk" onclick="check_all(this)"></td>
              <td scope="col">이미지</td>
              <td scope="col">상품정보</td>
              <td scope="col">판매가</td>
              <td scope="col">수량</td>
              <td scope="col">적립금</td>
              <td scope="col">합계</td>
              <td scope="col">선택</td>
            </tr>
          </thead>
          <tbody>
          		<c:forEach items="${list}" var="dto" varStatus="status">
            <tr>
              <td><input type="checkbox" name="chk" class="list" value="${dto.c_code}" onclick="total_price()"></td>
              <td><img src="/team2/clothes/${dto.item_number}.jpg" alt="" width="80px" height="100px"></td>
              <td>
                <ul>
                  <li><strong>${dto.item_name}</strong></li>
                  <li>[옵션1: ${dto.c_option1}]</li>
                  <li>[옵션2: ${dto.c_option2}]</li>
                  <li><input type="button" value="옵션변경" onclick="updateOpt()"></li>
                </ul>
              </td>
              <td><input type="text" name="c_price" value="${dto.c_price}" style="width:60px; text-align:right; border:none;"></td>
              <td>
                <ul>
                  <li><input type="number" name="c_qty" value="${dto.c_qty}" style="width: 50px; min="1" max="${dto.remains}">
                  <input type="button" value="변경" onclick="updateQty(${status.index})"></li>
                </ul>
              </td>
              <td>${dto.c_price * dto.c_qty * 0.05}</td>
              <td>${dto.c_price * dto.c_qty}</td>
              <td>
                <ul>
                  <li><input type="button" value="주문하기" onclick="one_order(${dto.c_code})"></li>
                  <li><input type="button" value="삭제" onclick="one_delete(${dto.c_code})"></li>
                </ul>
              </td>
            </tr>
				</c:forEach>
          </tbody>

          <tfoot>
          <!--   <tr align="right">
              <td colspan="9">상품구매금액 <input type="text" id="items" value=""> <i class="fas fa-plus-circle"></i> 배송비 <input type="text" id="delivery" value=""> = 합계: <strong><input type="text" id="total" value=""></strong></td>
            </tr> -->
            <tr align="left">
              <td colspan="9"><input type="button" value="장바구니 비우기" onclick="all_delete()"></td>
            </tr>
          </tfoot>
        </table>
        
        <table class="table">
        	<tr>
        		<td>총 상품금액</td>
        		<td></td>
        		<td>총 배송비</td>
        		<td></td>
        		<td>총 결제금액</td>
        	</tr>
       		<tr>
        		<td><input type="text" id="items" value=""></td>
        		<td><i class="fas fa-plus-circle"></i></td>
        		<td><input type="text" id="delivery" value="" name="delivery"></td>
        		<td>=</td>
        		<td>합계: <strong><input type="text" id="total" value="" name="total"></strong></td>
        	</tr>
        	<tr>
        		<td colspan="5">
        			<input type="button" value="전체상품주문" onclick="all_order()" class="btn btn-secondary">
        			<input type="button" value="선택상품주문" onclick="select_order()" class="btn btn-secondary">
        		</td>
        	</tr>
        </table>
        </form>
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