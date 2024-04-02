<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="/bidangol/css/admin.css">

</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />
	
	<!-- admin menu -->
	<jsp:include page="/WEB-INF/view/include/admin.jsp" />

	<!-- content -->
	<div class="itemAdd">
		<div class="wrap">
			<section class="addTitle">
				<h3>상품상세정보</h3>
			</section>
			<section class="addInfo">
				<form name="itemAdd_form" method="post">
				<input type="hidden" name="itemNum" id="itemNum" value="<c:out value="${itemInfo.itemNum}"/>">
					<table style="border-collapse: collapse;">
						<tbody>
							<tr>
								<th>상품번호</th>
								<td><c:out value="${itemInfo.itemNo}"/></td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td><c:out value="${itemInfo.itemCategory}"/></td>
							</tr>
							<tr>
								<th>상품명</th>
								<td><c:out value="${itemInfo.itemName}"/></td>
							</tr>
							<tr>
								<th>상품이미지</th>
								<td><img src="http://localhost:8088/bidangol/resources/${itemInfo.itemImg}" class="itemImg"/></td>
							</tr>
							<tr>
								<th>상품정보</th>
								<td><c:out value="${itemInfo.itemInfo}"/></td>
							</tr>
							<tr>
								<th>상품재료</th>
								<td><c:out value="${itemInfo.itemMeterial}"/></td>
							</tr>
							<tr>
								<th>소비기간</th>
								<td><c:out value="${itemInfo.itemUsedate}"/></td>
							</tr>
							<tr>
								<th>판매가</th>
								<td><c:out value="${itemInfo.itemPrice}"/> <b> 원</b></td>
							</tr>
						</tbody>
					</table>
					<div class="add_btn">
						<input type="button" id="itemCancle" name="itemCancle" value="취소"
						onClick="location.href='/bidangol/admin/adminItem'">
						<input type="button" id="itemUpdate" name="itemUpdate" value="수정">
					</div>
				</form>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	
</body>
</html>