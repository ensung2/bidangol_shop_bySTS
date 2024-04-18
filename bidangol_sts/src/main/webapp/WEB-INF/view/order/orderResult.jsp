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
					<c:forEach items="${orderView}" var="orderView">
						<tr>
							<td class="imgWrap">
								<img src="http://localhost:8088/bidangol/resources/${orderView.itemImg}" class="itemImg"/>
							</td>
							<td>
								<b class="itemName"><c:out value="${orderView.itemName}"/></b><br>
								<span class="cartCount">수량: <c:out value="${orderView.cartCount}"/>개</span><br>
								<span class="itemPrice">판매가: <fmt:formatNumber value="${orderView.itemPrice}" pattern="###,###" />원</span>
							</td>
							<td><b>총 상품금액 : <fmt:formatNumber value="${orderView.itemPrice * orderView.cartCount}" pattern="###,###" />원</b></td>
						</tr>
						<c:set var="sum" value="${sum + (orderView.itemPrice * orderView.cartCount)}" />
					</c:forEach>
				</table>
				<div class="order_Total">
					<p>
						<b>총 주문금액 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원</b>
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