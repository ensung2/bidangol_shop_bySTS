<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/bidangol/css/order.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<!-- content -->
	<div class="orderPage">
		<div class="wrap">
			<section class="order_Title">
				<h3>주문이 완료되었습니다</h3>
				<p>
					주문내역 및 배송정보는 <a href="/bidangol/myPage">마이페이지</a>에서 확인 가능합니다.
				</p>
			</section>
			<section class="resultPage">
				<div class="result_Title">
					<h3>* 결제정보</h3>
				</div>
				<div class="result_Info">
					<table style="border-collapse: collapse">
						<tbody>
							<tr>
								<th>주문번호</th>
								<td>{orderNum}</td>
							</tr>
							<tr>
								<th>최종결제금액</th>
								<td>{orderTotal}<b>원</b></td>
							</tr>
							<tr>
								<th>결제수단</th>
								<td><b>{radio.payBy}</b><br> 입금자 : {userName} │ 계좌번호 :
									{select.bank}<br> 현금영수증 발행 : {radio.cashReceipts}</td>
							</tr>
							<tr>
								<th>배송메시지</th>
								<td>{order.meno}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</section>
			<section class="order_Info">
				<table>
					<thead>
						<tr>
							<td>주문상품정보</td>
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
				<div class="result_btn">
					<input type="button" id="orderCheck" name="orderCheck"
						value="주문확인하기" onclick="location.href='/bidangol/myPage'">
						<input type="button" id="goMain"
						name="goMain" value="쇼핑계속하기" onclick="location.href='/bidangol/'">
				</div>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>