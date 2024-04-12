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

	<!-- admin menu -->
	<jsp:include page="/WEB-INF/view/include/admin.jsp" />

	<!-- contents -->
	<div class="adminOrder aoMain">
		<div class="wrap">
			<section class="auTitle">
				<h3>주문관리</h3>
			</section>
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
			<section class="auInfo">
				<table>
					<thead>
						<tr>
							<td>주문정보</td>
							<td>아이디</td>
							<td>배송지</td>
							<td>결제금액</td>
							<td>결제방식</td>
							<td>주문상태</td>
						</tr>
					</thead>
				</table>
			</section>
			<section class="auList">
				<input type="hidden" name="orderNum" id="orderNum" value="<c:out value="${order.orderNum}"/>">
				<table style="border-collapse: collapse;">
					<tbody>
					<c:choose>
					 <c:when test="${empty list}">
                		<p class="empty">현재 주문이 없습니다.</p>
            		</c:when>
            		<c:otherwise>
						<c:forEach items="${list}" var="order">
							<tr onclick="location.href='/bidangol/admin/orderInfo?id=<c:out value="${order.orderId}"/>'">
								<td class="orderId"><c:out value="${order.orderId}"></c:out></td>
								<td class="id"><c:out value="${order.id}"></c:out></td>
								<td class="address1"><c:out value="${order.address1}"></c:out></td>
								<td class="orderTotal"><fmt:formatNumber pattern="###,###,###" value="${order.orderTotal}" />원</td>
								<td class="deliveryStatus">무통장입금</td>
								<td class="orderStatus"><c:out value="${order.orderStatus}"></c:out></td>
							</tr>
						</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</section>
			<section class="adminPaging">
					<ul>
					  <c:if test="${pageMaker.prev}">
					   <li><a href="/bidangol/admin/adminOrder${pageMaker.makeQuery(pageMaker.startPage - 1)}" class="page_prev">이전</a></li>
					  </c:if> 
					  
					  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					   <li><a href="/bidangol/admin/adminOrder${pageMaker.makeQuery(idx)}" class="page_idx">${idx}</a></li>
					  </c:forEach>
					    
					  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					   <li><a href="/bidangol/admin/adminOrder${pageMaker.makeQuery(pageMaker.endPage + 1)}" class="page_next">다음</a></li>
					  </c:if> 
				</ul>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>