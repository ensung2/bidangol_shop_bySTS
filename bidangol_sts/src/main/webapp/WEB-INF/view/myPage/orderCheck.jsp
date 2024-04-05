<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<td>상품정보</td>
							<td>상품구매금액</td>
							<td>배송상태</td>
							<td>주문상태</td>
						</tr>
					</thead>
				</table>
			</section>
			<section class="CheckList">
				<input type="hidden" name="orderNum" id="orderNum" value="<c:out value="${order.orderNum}"/>">
				<table style="border-collapse: collapse;">
					<tbody>
						<c:choose>
							<c:when test="${empty list}">
								<p class="empty">주문한 상품이 없습니다.</p>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="order">
									<tr onclick="location.href='/bidangol/admin/itemInfo?itemNum=<c:out value="${order.orderNum}"/>'">
										<td class="orderNum"><c:out value="${order.orderNum}" /></td>
										<td class="orderInfo"><c:out value="${order.orderInfo}" /></td>
										<td class="orderTotal"><c:out value="${order.orderTotal}" />원</td>
										<td class="deliveryStatus"><c:out value="${order.deliveryStatus}" /></td>
										<td class="orderStatus"><c:out value="${order.orderStatus}" /></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
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