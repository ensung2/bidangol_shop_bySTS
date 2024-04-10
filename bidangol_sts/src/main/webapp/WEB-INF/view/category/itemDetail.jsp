<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/bidangol/css/itemDetail.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/bidangol/js/item.js"></script>
<script src="/bidangol/js/cart.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<!-- content -->
	<div class="detailPage">
		<div class="wrap">
			<section class="detailImg">
				<div class="imgWrap">
					<img src="http://localhost:8088/bidangol/resources/${itemInfo.itemImg}" class="itemImg"/>
				</div>
			</section>
			<section class="detailInfo">
					<form role="form" method="post">
						<input type="hidden" name="itemNum" id="itemNum" value="<c:out value="${itemInfo.itemNum}"/>">
					</form>
				<div class="detailTitle">
					<h3><c:out value="${itemInfo.itemName}"/></h3>
					<p><c:out value="${itemInfo.itemInfo}"/></p>
					<ul style="margin-left: 15px;">
						<li>원재료명 및 함량 : <c:out value="${itemInfo.itemMeterial}"/></li>
						<li>소비기한 : <c:out value="${itemInfo.itemUsedate}"/></li>
					</ul>
				</div>
				<div class="detailOrder">
					<table style="border-collapse: collapse;">
						<tbody>
							<tr>
								<th class="itemPrice">판매가</th>
								<td id="itemPrice"><fmt:formatNumber value="${itemInfo.itemPrice}" pattern="###,###" />원</td>
							</tr>
							<tr>
								<th class="delivery">배송비</th>
								<td><b>무료</b></td>
							</tr>
							<tr>
								<th class="itemOption">구매수량</th>
								<td>
									<button type="button" class="minus">-</button>
									<input type="number" id="itemSize" min="1" max="${itemInfo.itemSize}" value="1" maxlength="10" readonly="readonly"/>
									<button type="button" class="plus">+</button>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="detailList" id="detailList">
						<div id="result"></div>
						<div id="detailPrice"></div>
					</div>
					
				</div>
				<div class="detailTotal">
						<div id="totalPrice">총 결제금액 : <fmt:formatNumber pattern="###,###,###" value="${itemInfo.itemPrice * itemInfo.itemSize}" />원</div>
					</div>
				<div class="detail_btn">
					<input type="button" id="inCart" name="inCart" value="장바구니에 담기">
					<input type="button" id="goOrder" name="goOrder" value="바로구매">
				</div>

			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>