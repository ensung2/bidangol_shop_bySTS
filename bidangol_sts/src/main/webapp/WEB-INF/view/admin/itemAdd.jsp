<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<!-- content -->
	<div class="itemAdd">
		<div class="wrap">
			<section class="addTitle">
				<h3>[관리자] 상품등록</h3>
			</section>
			<section class="addInfo">
				<form name="itemAdd_form" action="#" method="post">
					<table style="border-collapse: collapse">
						<tbody>
							<tr>
								<th>상품번호</th>
								<td><span>1</span><input type="hidden" name="noticeNum" id="noticeNum" value="{notice.num}" readonly="readonly"></td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td><select id="itemOption" name="itemOption">
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
							<tr>
								<th>상품이미지</th>
								<td><input type="file" name="itemImg" id="itemImg" style="border:none"></td>
							</tr>
							<tr>
								<th>상품정보</th>
								<td><input type="text" name="itemInfo" id="itemInfo" maxlength="30"></td>
							</tr>
							<tr>
								<th>상품재료</th>
								<td><input type="text" name="itemMerarial" id="itemMerarial" maxlength="30"></td>
							</tr>
							<tr>
								<th>소비기간</th>
								<td><input type="text" name="itemUseDate" id="itemUseDate" maxlength="30"></td>
							</tr>
							<tr>
								<th>판매가</th>
								<td><input type="text" name="itemPrice" id="itemPrice" style="width:200px" maxlength="10"> <b> 원</b></td>
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