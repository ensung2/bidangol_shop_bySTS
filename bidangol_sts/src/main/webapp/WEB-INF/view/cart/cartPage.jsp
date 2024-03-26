<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/bidangol/css/cart.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />
	
	<!-- content -->
	<div class="cartPage">
		<div class="wrap">
			<section class="cartTitle">
				<h3>장바구니</h3>
			</section>
			<section class="cartInfo">
				<table>
					<thead>
						<tr>
							<td><input type="checkbox" id="allCheck" name="allCheck"></td>
							<td>상품정보</td>
							<td style="width: 50px"></td>
						</tr>
					</thead>
				</table>
			</section>
			<section class="cartItem">
				<table style="border-collapse: collapse">
					<tbody>
						<tr>
							<td><input type="checkbox" id="selectCheck" name="selectCheck"></td>
							<td><b class="itemName">콩고물인절미({item.name})</b><br>
								<span class="itemCount">수량:({item.count})개</span> <span class="itemPrice">판매가:({item.price})원</span><br>
								<span class="itemOption">옵션:({item.option) }</span>
								<input type="button" id="optionChange" name="optionChange" value="옵션변경">
							</td>
							<td><b>총 상품금액 : ({item.priceAll })원</b></td>
						</tr>
						<tr>
							<td><input type="checkbox" id="selectCheck" name="selectCheck"></td>
							<td><b class="itemName">콩고물인절미({item.name})</b><br>
								<span class="itemCount">수량:({item.count})개</span> <span class="itemPrice">판매가:({item.price})원</span><br>
								<span class="itemOption">옵션:({item.option) }</span>
								<input type="button" id="optionChange" name="optionChange" value="옵션변경">
							</td>
							<td><b class="priceTotal">총 상품금액 : ({item.priceAll })원</b></td>
						</tr>
					</tbody>
				</table>
				<div class="delete_btn">
					<input type="button" id="selectDelete" name="selectDelete" value="선택삭제하기">
				</div>
				<div class="cartTotal">
					<p><b>총 주문금액 : ({item.price(total)})원</b></p>
				</div>
			</section>
			<section class="orderBtn">
				<input type="button" id="goMain" name="goMain" onClick="location.href='/bidangol/home'" value="쇼핑계속하기">
				<div>
					<input type="button" id="selectOrder" name="selectOrder" value="선택상품주문"
					onclick="location.href='/bidangol/order/orderNum'">
					<input type="button" id="allOrder" name="allOrder" value="전체상품주문"
					onclick="location.href='/bidangol/order/orderNum'">
				</div>
				
			</section>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	<!-- script -->
	<script src="/bidangol/js/cart.js"></script>

</body>
</html>