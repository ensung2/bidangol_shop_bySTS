<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/bidangol/css/order.css">
<script src="/bidangol/js/daum_postcode.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/bidangol/js/order.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<!-- content -->
	<div class="orderPage">
		<div class="wrap">
			<section class="order_Title">
				<h3>주문서작성</h3>
			</section>
			<h5 style="font-size: 13px; font-weight: 400; padding-bottom: 5px;">※
				상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</h5>
			<section class="order_Info">
				<table>
					<thead>
						<tr>
							<td>상품정보</td>
						</tr>
					</thead>
				</table>
			</section>
			<section class="order_Item">
				<table style="border-collapse: collapse">
					<tbody>
						<c:forEach items="${cartList}" var="cartList">
						<tr>
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
					</tbody>
				</table>
				
				<div class="order_Total">
					<p>
						<b>총 주문금액 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원</b>
					</p>
				</div>
			</section>
			<form method="post" autocomplete="off">
			<input type="hidden" name="orderTotal" value="${sum}">
			<section class="deliveryPage">
				<div class="delivery_Title">
					<h3>* 배송정보</h3>
				</div>
				<div class="delivery_Info">
					<table style="border-collapse: collapse">
						<tbody>
							<tr>
								<th>주문자</th>
								<td><input type="text" name="name" id="name"
									style="width: 150px" value="${userInfo.name}"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email" name="email" id="userEmail"
									style="width: 300px" value="${userInfo.email}"></td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td><select id="phone" name="phone" style="padding: 5px">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
								</select> - <input type="text" name="phone2" id="phone2" maxlength="4"
									style="width: 50px" value="${userInfo.phone2}"> - <input
									type="text" name="phone3" id="phone3" maxlength="4"
									style="width: 50px" value="${userInfo.phone3}"></td>
							</tr>
							<tr id="address">
								<th>주소</th>
								<td><input type="text" name="postcode" id="postcode"
									style="width: 60px" value="${userInfo.postcode}"> <input
									type="button" value="우편번호검색" onclick="checkPost()"><br>
									<input type="text" name="address1" id="address1"
									style="width: 300px" value="${userInfo.address1}"><span>기본주소</span><br>
									<input type="text" name="address2" id="address2"
									style="width: 300px" value="${userInfo.address2}"><span>나머지주소(선택)</span><br>
								</td>
							</tr>
							<tr>
								<th>배송메시지</th>
								<td><input type="text" name="memo" id="memo"
									style="width: 700px" placeholder="ex) 부재시 경비실에 맡겨주세요."></td>
							</tr>
						</tbody>
					</table>
				</div>
			</section>
			<section class="payBy">
				<div class="payBy_Title">
					<h3>* 결제수단</h3>
				</div>
				<div class="payBy_Info">
					<div class="wrap">
						<div class="payBy01">
							<input type="radio" name="payBy" id="passbook" checked><label>무통장입금</label>
						</div>
						<!-- <div class="payBy02">
							<input type="radio" name="payBy" id="kakaoPay"><label>카카오페이</label>
						</div> -->
					</div>
					<div class="passbookInfo">
						<table style="border-collapse: collapse">
							<tbody>
								<tr>
									<th>입금자명</th>
									<td><input type="text" name="username" id="username"
										style="width: 150px" value="${userInfo.name}"></td>
								</tr>
								<tr>
									<th>입금은행</th>
									<td><select id="bank" name="bank" style="padding: 5px">
											<option value="01">농협 123-45678-9101112 비단골떡방앗간</option>
											<option value="02">신협 123-45678-9101112 비단골떡방앗간</option>
											<option value="03">국민은행 123-45678-9101112 비단골떡방앗간</option>
									</select></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</section>
				<section class="order_Btn">
					<button type="submit" id="orderBuy" name="orderBuy">주문하기</button>
				</section>
			</form>
			
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>