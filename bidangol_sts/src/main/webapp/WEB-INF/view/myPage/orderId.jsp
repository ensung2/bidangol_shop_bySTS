<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/bidangol/css/order.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<!-- mypage menu -->
	<jsp:include page="/WEB-INF/view/include/myPage.jsp" />

	<div class="CheckPage_num">
		<div class="wrap">
			<section class="CheckTitle">
				<h3>주문 상품 정보</h3>
			</section>
			<section class="CheckInfo cp">
				<table>
					<thead>
						<tr>
							<td>상품정보</td>
							<td>배송상태</td>
							<td>상품주문금액</td>
						</tr>
					</thead>
				</table>
			</section>
			<section class="CheckList_ cp">
				<table style="border-collapse: collapse">
					<tbody>
						<tr>
							<td><b class="itemName">콩고물인절미({item.name})</b><br> <span
								class="itemCount">수량:({item.count})개</span> <span
								class="itemPrice">판매가:({item.price})원</span><br> <span
								class="itemOption">옵션:({item.option) }</span></td>
							<td class="deliveryStatus">결제완료</td>
							<td><b>총 상품금액 : ({item.priceAll })원</b></td>
						</tr>
						<tr>
							<td><b class="itemName">콩고물인절미({item.name})</b><br> <span
								class="itemCount">수량:({item.count})개</span> <span class=""itemPrice"">판매가:({item.price})원</span><br>
								<span class="itemOption">옵션:({item.option) }</span></td>
							<td class="deliveryStatus">결제완료</td>
							<td><b class="priceTotal">총 상품금액 : ({item.priceAll })원</b></td>
						</tr>
					</tbody>
				</table>
				<div class="CheckTotal">
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
									<td>{userName}</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>{userEmail}</td>
								</tr>
								<tr>
									<th>휴대전화</th>
									<td>{010-0000-0000}</td>
								</tr>
								<tr id="address">
									<th>주소</th>
									<td>{postcode}<br> {address1}<br> {address2}
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</section>
				<section class="resultPage">
					<div class="result_Title" style="padding-top: 20px;">
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
									<td><b>{radio.payBy}</b><br> 입금자 : {userName} │ 계좌번호
										: {select.bank}<br> 현금영수증 발행 : {radio.cashReceipts}</td>
								</tr>
								<tr>
									<th>배송메시지</th>
									<td>{order.meno}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</section>

				<div class="checkOrder_btn">
					<input type="button" id="goMain" name="goMain" value="쇼핑계속하기">
					<input type="button" id="orderDelete" name="selectDelete"
						value="주문 취소하기">
				</div>
			<section class="deliveryProcess">
				<h4>배송상태 유의사항</h4>
				<div class="process">
					결제완료 <span>▶</span> 상품준비중 <span>▶</span> 배송준비중 <span>▶</span> 배송중 <span>▶</span>
					배송완료
				</div>
				<div class="headsUp">
					<ul>
						<li>비단골떡방앗간은 결제완료 확인 후 바로 제작됩니다.</li>
						<li>결제완료, 상품준비중 단계에서는 주문 취소 신청이 가능합니다.</li>
						<li>배송 준비중, 배송중, 배송완료 단계에서는 주문 취소가 불가능합니다.</li>
						<li>고객상담번호로 전화주시면 빠른 주문 취소가 가능합니다. (061-333-0839)</li>
					</ul>
				</div>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>