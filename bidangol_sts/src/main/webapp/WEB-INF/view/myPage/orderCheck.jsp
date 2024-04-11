<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
					<input type="date" id="firstDate" name="firstDate"> - <input
						type="date" id="lastDate" name="lastDate"> <input
						type="button" id="dateSearch" name="dateSearch" value="조회">
				</div>
			</section>
			<section class="CheckInfo">
				<table>
					<thead>
						<tr>
							<td>주문번호</td>
							<td>배송지</td>
							<td>결제금액</td>
							<td>결제방식</td>
							<td>주문상태</td>
						</tr>
					</thead>
				</table>
			</section>
			<section class="CheckList">
				<table style="border-collapse: collapse;">
					<tbody>
						<c:choose>
							<c:when test="${empty orderList}">
								<p class="empty">주문한 상품이 없습니다.</p>
							</c:when>
							<c:otherwise>
								<c:forEach items="${orderList}" var="order">
									<tr onclick="location.href='/bidangol/myPage/orderId?id=<c:out value="${order.orderId}"/>'">
										<td class="orderNum"><c:out value="${order.orderId}" /></td>
										<td class="orderAddress"><c:out value="${order.address1}" /></td>
										<td class="orderTotal"><fmt:formatNumber pattern="###,###,###" value="${order.orderTotal}" />원</td>
										<td class="deliveryStatus">무통장입금</td>
										<td class="orderStatus"><c:out value="${order.orderStatus}" /></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</section>
			<section class="CheckPaging">
				<ul>
					  <c:if test="${pageMaker.prev}">
					   <li><a href="/bidangol/myPage/order${pageMaker.makeQuery(pageMaker.startPage - 1)}" class="page_prev">이전</a></li>
					  </c:if> 
					  
					  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					   <li><a href="/bidangol/myPage/order${pageMaker.makeQuery(idx)}" class="page_idx">${idx}</a></li>
					  </c:forEach>
					    
					  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					   <li><a href="/bidangol/myPage/order${pageMaker.makeQuery(pageMaker.endPage + 1)}" class="page_next">다음</a></li>
					  </c:if> 
				</ul>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>