<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/bidangol/css/order.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/bidangol/js/myPage.js"></script>
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
							<td style="width: 350px">상품정보</td>
							<td style="width: 250px">배송상태</td>
							<td style="width: 300px">상품주문금액</td>
						</tr>
					</thead>
				</table>
			</section>
			<section class="CheckList_ cp">
				<table style="border-collapse: collapse">
					<tbody>
						<c:forEach items="${orderView}" var="orderView">
						<tr>
							<td style="width: 150px">
							<div class="imgWrap">
									<img src="http://localhost:8088/bidangol/resources/${orderView.itemImg}" class="itemImg"/>
								</div>
							</td>
							<td style="width: 200px; text-align: left">
								<b style="font-size: 17px" class="itemName"><c:out value="${orderView.itemName}"/></b><br>
								<span class="cartCount">수량: <c:out value="${orderView.cartCount}"/>개</span><br>
								<span class="itemPrice">판매가: <fmt:formatNumber value="${orderView.itemPrice}" pattern="###,###" />원</span>
							</td>
							<td style="width: 250px; text-align: center">
								<c:out value="${orderView.orderStatus}"/>
							</td>
							<td style="width: 300px; text-align: right;"><b>총 상품금액 : <fmt:formatNumber value="${orderView.itemPrice * orderView.cartCount}" pattern="###,###" />원</b></td>
						</tr>
						<c:set var="sum" value="${sum + (orderView.itemPrice * orderView.cartCount)}" />
						</c:forEach>
					</tbody>
				</table>
				<div class="CheckTotal">
					<p>
						<b style="font-size: 20px">총 주문금액 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원</b>
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
						<c:forEach items="${orderView}" var="orderView" varStatus="status">
						<c:if test="${status.first}">
						<tr>
									<th>주문자</th>
									<td style="width:770px"><c:out value="${orderView.name}"/></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><c:out value="${orderView.email}"/></td>
								</tr>
								<tr>
									<th>휴대전화</th>
									<td>${orderView.phone}-${orderView.phone2}-${orderView.phone3}</td>
								</tr>
								<tr id="address">
									<th>주소</th>
									<td><c:out value="${orderView.postcode}"/><br>
									<c:out value="${orderView.address1}"/><br>
									<c:out value="${orderView.address2}"/>
									</td>
								</tr>
								</c:if>
						</c:forEach>
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
						<c:forEach items="${orderView}" var="orderView" varStatus="status">
						<c:if test="${status.first}">
							<tbody>
								<tr>
									<th>주문번호</th>
									<td style="width:770px">${orderView.orderId}</td>
								</tr>
								<tr>
									<th>최종결제금액</th>
									<td><b><fmt:formatNumber pattern="###,###,###" value="${orderView.orderTotal}" />원</b></td>
								</tr>
								<tr>
									<th>결제수단</th>
									<td><b>무통장입금</b><br> <b>입금자명 :</b> ${orderView.name} │ <b>계좌번호
										:</b> <c:choose>
								            <c:when test="${orderView.bank == '01'}">
								                농협 123-45678-9101112 비단골떡방앗간
								            </c:when>
								            <c:when test="${orderView.bank == '02'}">
								                신협 123-45678-9101112 비단골떡방앗간
								            </c:when>
								            <c:when test="${orderView.bank == '03'}">
								                국민은행 123-45678-9101112 비단골떡방앗간
								            </c:when>
								        </c:choose></td>
								</tr>
								<tr>
									<th>배송메시지</th>
									<td>${orderView.memo}</td>
								</tr>
							</tbody>
							</c:if>
							</c:forEach>
						</table>
					</div>
				</section>
				<form name="orderDelete_form" id="orderDelete_form" method="post">
				<c:forEach items="${orderView}" var="order">
					<input type="hidden" name="orderId" value="${order.orderId}">
					<input type="hidden" name="id" value="${order.id}">
					<div class="checkOrder_btn">
						<input type="button" id="goMain" name="goMain" value="쇼핑계속하기">
						<input type="button" id="orderDelete" name="orderDelete"
							value="주문 취소하기">
					</div>
					</c:forEach>
				</form>
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