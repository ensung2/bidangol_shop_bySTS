<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="/bidangol/js/admin.js"></script>
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
				<h3>주문상세정보</h3>
			</section>
			<section class="orderInfo">
				<table
					style="border-collapse: collapse;">
					<tbody>
						<c:forEach items="${orderView}" var="order" varStatus="status">
							<c:if test="${status.first}">
								<tr>
									<th style="width:200px; font-size: 18px">주문자 정보</th>
									<td>
										<ul>
											<li><b>주문자명 : ${order.id}</b></li>
											<li>주문자 이메일 : ${order.email}</li>
											<li>연락처 : ${order.phone}-${order.phone2}-${order.phone3}</li>
											<li>배송주소 : (${order.postcode})${order.address1}, ${order.address2}</li>
										</ul>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<table
					style="border-collapse: collapse;">
					<tbody>
						<tr>
							<th style="width:200px; font-size: 18px">주문정보</th>
							<td>
								<ul>
									<li>주문목록<br>: <c:forEach items="${orderView}" var="order">
										${order.itemName} ${order.cartCount}개, </c:forEach></li>
								<c:forEach items="${orderView}" var="order" varStatus="status">
								<c:if test="${status.first}">
									<form name="order_statusUpdate" id="order_statusUpdate" method="post">
									<li><b>주문번호 : ${order.orderId}</b></li>
									<input type="hidden" name="orderId" id="orderId" value="${order.orderId}">
									<li><b style="color:red">주문상태 : </b><select name="orderStatus" class="orderStatus">
											<option value="01">결제완료</option>
											<option value="02">상품준비중</option>
											<option value="03">배송준비중</option>
											<option value="04">배송중</option>
											<option value="05">배송완료</option>
									</select>
									<input type="button" id="orderUpdate" name="orderUpdate" value="배송상태 수정"></li>
									</form>
								</c:if>
								</c:forEach>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
				<table
					style="border-collapse: collapse">
					<tbody>
						<c:forEach items="${orderView}" var="order" varStatus="status">
							<c:if test="${status.first}">
								<tr>
									<th style="width:200px; font-size: 18px">결제정보</th>
									<td>
										<ul>
											<li>입금자명 : ${order.name}</li>
											<li>결제수단 : <span>무통장입금</span> │ 
											계좌번호 : 
											<c:choose>
									            <c:when test="${order.bank == '01'}">
									                농협 123-45678-9101112 비단골떡방앗간
									            </c:when>
									            <c:when test="${order.bank == '02'}">
									                신협 123-45678-9101112 비단골떡방앗간
									            </c:when>
									            <c:when test="${order.bank == '03'}">
									                국민은행 123-45678-9101112 비단골떡방앗간
									            </c:when>
								        	</c:choose></li>
											<li>최종결제금액 : <b><fmt:formatNumber pattern="###,###,###" value="${order.orderTotal}" />원</b></li>
										</ul>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>

				<div class="ao_btn">
					<input type="button" id="cancel" name="cancel" value="취소"
						onclick="location.href='/bidangol/admin/adminOrder'">
				</div>
			</section>
			
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>