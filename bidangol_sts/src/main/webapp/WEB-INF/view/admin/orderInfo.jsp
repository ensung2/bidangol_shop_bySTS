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

	<!-- admin menu -->
	<jsp:include page="/WEB-INF/view/include/admin.jsp" />

	<!-- contents -->
	<div class="adminOrder">
		<div class="wrap">
			<section class="auTitle">
				<h3>주문관리</h3>
			</section>
			<section class="orderInfo_">
				<table>
					<tbody>
						<tr>
							<th>주문번호</th>
							<td>{order.orderNum}</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>{user.userId}</td>
						</tr>
						<tr>
							<th>상품정보</th>
							<td>{order.itemName}</td>
						</tr>
						<tr>
							<th>상품구매금액</th>
							<td>{order.priceTotal}</td>
						</tr>
						<tr>
							<th>배송상태</th>
							<td><select>
									<option value="none" hidden>주문처리상태</option>
									<option value="01">결제완료</option>
									<option value="02">상품준비중</option>
									<option value="03">배송준비중</option>
									<option value="04">배송중</option>
									<option value="05">배송완료</option>
							</select></td>
						</tr>
						<tr>
							<th>주문상태</th>
							<td>{order.orderStatus}</td>
						</tr>
					</tbody>
				</table>
				<div class="ao_btn">
					<input type="button" id="orderUpdate" name="orderUpdate" value="배송상태 수정">
					<input type="button" id="cancel" name="cancel" value="취소" onclick="location.href='/bidangol/admin/adminOrder'">
				</div>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>