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
	<div class="adminItem">
		<div class="wrap">
			<section class="auTitle">
				<h3>상품관리</h3>
			</section>
			<section class="CheckSearch">
				<div class="CheckSelect">
					<select>
						<option value="none" hidden>카테고리</option>
						<option value="01">베스트상품</option>
						<option value="02">찹쌀떡</option>
						<option value="03">멥쌀떡</option>
						<option value="04">떡케이크</option>
					</select>
				</div>
				<div class="searchItem">
					<input type="text" id="itemSearch" name="itemSearch"> <input
						type="button" id="search" name="search" value="조회">
				</div>
			</section>
			<section class="auInfo">
				<table>
					<thead>
						<tr>
							<td>상품번호</td>
							<td>카테고리</td>
							<td>상품명</td>
							<td>판매가</td>
						</tr>
					</thead>
				</table>
			</section>
			<section class="auList">
				<table style="border-collapse: collapse;">
					<tbody>
						<tr onclick="location.href='/bidangol/admin/itemInfo'">
							<td class="itemNum">01-001</td>
							<td class="itemCategory">베스트상품</td>
							<td class="itemName">콩고물 인절미</td>
							<td class="itemPrice">15,000원</td>
						</tr>
						<tr onclick="location.href='/bidangol/admin/itemInfo'">
							<td class="itemNum">02-001</td>
							<td class="itemCategory">찹쌀떡</td>
							<td class="itemName">호박 카스테라 인절미</td>
							<td class="itemPrice">15,000원</td>
						</tr>
						<tr onclick="location.href='/bidangol/admin/itemInfo'">
							<td class="itemNum">03-001</td>
							<td class="itemCategory">멥쌀떡</td>
							<td class="itemName">하트백설기</td>
							<td class="itemPrice">15,000원</td>
						</tr>
					</tbody>
				</table>
				<div class="itemInfo_btn">
					<input type="button" id="noticeUpload" name="noticeUpload"
						value="상품추가" onClick="location.href='/bidangol/admin/adminItem/itemAdd'">
				</div>
			</section>
			<section class="adminPaging">
				<div>-- 1 2 3 4 5 6 --</div>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>