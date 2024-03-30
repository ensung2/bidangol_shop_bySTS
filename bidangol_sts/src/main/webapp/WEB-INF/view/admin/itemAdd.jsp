<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="/bidangol/css/admin.css">
<script src="/bidangol/js/admin.js"></script>

</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<!-- content -->
	<div class="itemAdd">
		<div class="wrap">
			<section class="addTitle">
				<h3>[관리자] 상품등록</h3>
			</section>
			<section class="addInfo">
				<form name="itemAdd_form">
					<table style="border-collapse: collapse">
						<tbody>
<%-- 							<tr>
								<th>상품번호</th>
								<td><input style="border: none; background-color: white;" type="text" name="itemNum" id="itemNum" value="${itemVO.itemNum}" readonly="readonly" disabled></td>
							</tr> --%>
							<tr>
								<th>카테고리</th>
								<td><select id="itemCategory" name="itemCategory">
										<option value="none" hidden>카테고리</option>
										<option value="01">베스트상품</option>
										<option value="02">찹쌀떡</option>
										<option value="03">멥쌀떡</option>
										<option value="04">떡케이크</option>
								</select></td>
							</tr>
							<tr>
								<th>상품명</th>
								<td><input type="text" name="itemName" id="itemName" maxlength="20"></td>
							</tr>
<!-- 							<tr>
								<th>상품이미지</th>
								<td><input type="file" name="itemImg" id="itemImg" style="border:none"></td>
							</tr> -->
							<tr>
								<th>상품정보</th>
								<td><input type="text" name="itemInfo" id="itemInfo" maxlength="30"></td>
							</tr>
							<tr>
								<th>상품재료</th>
								<td><input type="text" name="itemMeterial" id="itemMeterial" maxlength="30"></td>
							</tr>
							<tr>
								<th>소비기간</th>
								<td><input type="text" name="itemUsedate" id="itemUsedate" maxlength="30"></td>
							</tr>
							<tr>
								<th>판매가</th>
								<td><input type="text" name="itemPrice" id="itemPrice" style="width:200px" maxlength="10"> <b> 원</b></td>
							</tr>
							<tr>
								<th>사이즈(용량)</th>
								<td>
									<select id="itemSize" name="itemSize" onchange="handleOnChange(this)">
										<option value="0">소 (기본, 1kg)</option>
										<option value="10000">중 (+ 10,000원, 2kg)</option>
										<option value="20000">대 (+ 20,000원, 3kg)</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="add_btn">
						<input type="button" id="itemCancle" name="itemCancle" value="취소"
						onClick="location.href='/bidangol/admin/adminItem'">
						<input type="button" id="itemUpload" name="itemUpload" value="등록">
					</div>
				</form>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	
</body>
</html>