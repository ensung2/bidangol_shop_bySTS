<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<!-- mypage menu -->
	<jsp:include page="/WEB-INF/view/include/myPage.jsp" />

	<div class="CheckPage">
		<div class="wrap">
			<section class="CheckSearch">
				<div class="CheckSelect">
					<select>
						<option value="none" hidden>주문처리상태</option>
						<option value="01">결제완료</option>
						<option value="02">상품준비중</option>
						<option value="03">배송준비중</option>
						<option value="04">배송중</option>
						<option value="05">배송완료</option>
					</select>
				</div>
				<div class="searchDate">
					<input type="date" id="firstDate" name="firstDate">
					-
					<input type="date" id="lastDate" name="lastDate">
					<input type="button" id="dateSearch" name="dateSearch" value="조회">
				</div>
			</section>
			<section class="CheckInfo">
				<table>
					<thead>
						<tr>
							<td>주문번호</td>
							<td>상품정보</td>
							<td>상품구매금액</td>
							<td>배송상태</td>
							<td>주문상태</td>
						</tr>
					</thead>
				</table>
			</section>
			<section class="CheckList">
				<table style="border-collapse: collapse;">
					<tbody>
						<tr>
							<td class="orderNum">20240323-001</td>
							<td class="orderInfo"><a href="#">콩고물 인절미 외 5건</a></td>
							<td class="orderTotal">55,500원</td>
							<td class="deliveryStatus">결제완료</td>
							<td class="orderStatus">-</td>
						</tr>
						<tr>
							<td class="orderNum">20240323-001</td>
							<td class="orderInfo"><a href="#">콩고물 인절미 외 5건</a></td>
							<td class="orderTotal">55,500원</td>
							<td class="deliveryStatus">결제완료</td>
							<td class="orderStatus">-</td>
						</tr>
						<tr>
							<td class="orderNum">20240323-001</td>
							<td class="orderInfo"><a href="#">콩고물 인절미 외 5건</a></td>
							<td class="orderTotal">55,500원</td>
							<td class="deliveryStatus">결제완료</td>
							<td class="orderStatus">-</td>
						</tr>
					</tbody>
				</table>
			</section>
			<section class="CheckPaging">
				<div>-- 1 2 3 4 5 6 --</div>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>