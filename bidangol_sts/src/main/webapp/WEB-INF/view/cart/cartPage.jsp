<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
					<c:choose>
					 <c:when test="${empty cartList}">
                		<p class="empty">현재 상품이 없습니다.</p>
            		</c:when>
            		<c:otherwise>
						<c:forEach items="${cartList}" var="cartList">
						<tr>
							<td><input type="checkbox" id="selectCheck" name="selectCheck" data-cartNum="${cartList.cartNum}"></td>
							<td class="imgWrap">
								<img src="http://localhost:8088/bidangol/resources/${cartList.itemImg}" class="itemImg"/>
							</td>
							<td>
								<b class="itemName"><c:out value="${cartList.itemName}"/></b><br>
								<span class="cartCount">수량: <c:out value="${cartList.cartCount}"/>개</span><br>
								<span class="itemPrice">판매가: <fmt:formatNumber value="${cartList.itemPrice}" pattern="###,###" />원</span>
							</td>
							<td><b>총 상품금액 : <fmt:formatNumber value="${cartList.itemPrice * cartList.cartCount}" pattern="###,###" />원</b></td>
						</tr>
						<c:set var="sum" value="${sum + (cartList.itemPrice * cartList.cartCount)}" />
						</c:forEach>
					</c:otherwise>
					</c:choose>
					</tbody>
				</table>
				<div class="delete_btn">
					<input type="button" id="selectDelete" name="selectDelete" value="선택삭제하기">
				</div>
				<div class="cartTotal">
					<p><b>총 주문금액 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원</b></p>
				</div>
			</section>
			<section class="orderBtn">
				<input type="button" id="goMain" name="goMain" onClick="location.href='/bidangol/home'" value="쇼핑계속하기">
				<div>
					<input type="button" id="allOrder" name="allOrder" value="전체상품주문"
					onclick="location.href='/bidangol/order/orderPage'">
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