<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/bidangol/css/order.css">
<script src="/bidangol/js/daum_postcode.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	$('#passbook').click(function() {
        $('.passbookInfo').css('display', 'block');
    });
    
    $('#kakaoPay').click(function() {
        $('.passbookInfo').css('display', 'none');
    });
})
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<!-- content -->
	<div class="orderPage">
		<div class="wrap">
			<section class="order_Title">
				<h3>주문서작성</h3>
			</section>
			<h5 style="font-size: 13px; font-weight: 400; padding-bottom: 5px;">※
				상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</h5>
			<section class="order_Info">
				<table>
					<thead>
						<tr>
							<td>상품정보</td>
						</tr>
					</thead>
				</table>
			</section>
			<section class="order_Item">
				<table style="border-collapse: collapse">
					<tbody>
						<tr>
							<td><b class="itemName">콩고물인절미({item.name})</b><br> <span
								class="itemCount">수량:({item.count})개</span> <span
								class="itemPrice">판매가:({item.price})원</span><br> <span
								class="itemOption">옵션:({item.option) }</span></td>
							<td><b>총 상품금액 : ({item.priceAll })원</b></td>
						</tr>
						<tr>
							<td><b class="itemName">콩고물인절미({item.name})</b><br> <span
								class="itemCount">수량:({item.count})개</span> <span
								class="itemPrice">판매가:({item.price})원</span><br> <span
								class="itemOption">옵션:({item.option) }</span></td>
							<td><b class="priceTotal">총 상품금액 : ({item.priceAll })원</b></td>
						</tr>
					</tbody>
				</table>
				<div class="order_Total">
					<p>
						<b>총 주문금액 : ({item.price(total)})원</b>
					</p>
				</div>
			</section>
			<section class="deliveryPage">
				<div class="delivery_Title">
					<h3>* 배송정보</h3>
				</div>
				<div class="delivery_Info">
					<table style="border-collapse: collapse">
						<tbody>
							<tr>
								<th>주문자</th>
								<td><input type="text" name="userName" id="userName"
									style="width: 150px" value="{userName}"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email" name="email" id="userEmail"
									style="width: 300px" value="{userEmail}"></td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td><select id="phone1" name="phone[]" style="padding: 5px">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
								</select> - <input type="text" name="phone2" id="phone2" maxlength="4"
									style="width: 50px" value="{phone2}"> - <input
									type="text" name="phone3" id="phone3" maxlength="4"
									style="width: 50px" value="{phone3}"></td>
							</tr>
							<tr id="address">
								<th>주소</th>
								<td><input type="text" name="postCode" id="postCode"
									style="width: 60px" value="{postCode}"> <input
									type="button" value="우편번호검색" onclick="checkPost()"><br>
									<input type="text" name="address1" id="address1"
									style="width: 300px" value="{address1}"><span>기본주소</span><br>
									<input type="text" name="address2" id="address2"
									style="width: 300px" value="{address2}"><span>나머지주소(선택)</span><br>
								</td>
							</tr>
							<tr>
								<th>배송메시지</th>
								<td><input type="text" name="memo" id="memo"
									style="width: 700px" placeholder="ex) 부재시 경비실에 맡겨주세요."></td>
							</tr>
						</tbody>
					</table>
				</div>
			</section>
			<section class="payBy">
				<div class="payBy_Title">
					<h3>* 결제수단</h3>
				</div>
				<div class="payBy_Info">
					<div class="wrap">
						<div class="payBy01">
							<input type="radio" name="payBy" id="passbook" checked><label>무통장입금</label>
						</div>
						<div class="payBy02">
							<input type="radio" name="payBy" id="kakaoPay"><label>카카오페이</label>
						</div>
					</div>
					<div class="passbookInfo">
						<table style="border-collapse: collapse">
							<tbody>
								<tr>
									<th>입금자명</th>
									<td><input type="text" name="userName" id="userName"
										style="width: 150px" value="{userName}"></td>
								</tr>
								<tr>
									<th>입금은행</th>
									<td><select id="bank" name="bank" style="padding: 5px">
											<option value="01">농협 123-45678-9101112 비단골떡방앗간</option>
											<option value="02">신협 123-45678-9101112 비단골떡방앗간</option>
											<option value="03">국민은행 123-45678-9101112 비단골떡방앗간</option>
									</select></td>
								</tr>
								<tr>
									<th>현금영수증</th>
									<td><input type="radio" id="cashReceipts_Y"
										name="cashReceipts" checked><label style="padding-right:50px;">신청</label> <input
										type="radio" id="cashReceipts_N" name="cashReceipts"><label>신청안함</label>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</section>
			<section class="order_Btn">
				<input type="button" id="orderBuy" name="orderBuy"
					onClick="location.href='/bidangol/order/orderResult'" value="결제하기">
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>