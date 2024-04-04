<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<h3>상품수정</h3>
			</section>
			<section class="addInfo">
				<form name="item_Modiyform" enctype="multipart/form-data" id="item_Modiyform" method="post">
				<input type="hidden" name="itemNum" id="itemNum" value="${itemInfo.itemNum}">
					<table style="border-collapse: collapse">
						<tbody>
							<tr>
								<th>상품번호</th>
								<td><c:out value="${itemInfo.itemNo}"/></td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td><select id="itemCategory" name="itemCategory">
										<option value="01">베스트상품</option>
										<option value="02">찹쌀떡</option>
										<option value="03">멥쌀떡</option>
										<option value="04">떡케이크</option>
								</select></td>
							</tr>
							<tr>
								<th>상품명</th>
								<td><input type="text" name="itemName" id="itemName" maxlength="20" value="<c:out value="${itemInfo.itemName}"/>"></td>
							</tr>
							<tr>
								<th>상품이미지</th>
								<td>
								<input type="file" name="file" id="itemImg" style="border:none">
								<div class="select_img">
									<img alt="상품이미지" src="/bidangol/resources/${itemInfo.thumbImg}">
									<input type="hidden" name="itemImg" value="${itemInfo.itemImg}"/>
									<input type="hidden" name="thumbImg" value="${itemInfo.thumbImg}"/>
								</div>
									<!-- 등록 이미지 미리보기 -->
									<script>
									  $("#itemImg").change(function(){
									   if(this.files && this.files[0]) {
									    var reader = new FileReader;
									    reader.onload = function(data) {
									     $(".select_img img").attr("src", data.target.result).width(500);        
									    }
									    reader.readAsDataURL(this.files[0]);
									   }
									  });
									 </script>
									 
								</td>
							</tr>
							<tr>
								<th>상품정보</th>
								<td><input type="text" name="itemInfo" id="itemInfo" maxlength="50" value="<c:out value="${itemInfo.itemInfo}"/>"></td>
							</tr>
							<tr>
								<th>상품재료</th>
								<td><input type="text" name="itemMeterial" id="itemMeterial" maxlength="100" value="<c:out value="${itemInfo.itemMeterial}"/>"></td>
							</tr>
							<tr>
								<th>소비기간</th>
								<td><input type="text" name="itemUsedate" id="itemUsedate" maxlength="30" value="<c:out value="${itemInfo.itemUsedate}"/>"></td>
							</tr>
							<tr>
								<th>판매가</th>
								<td><input type="text" name="itemPrice" id="itemPrice" style="width:200px" maxlength="10" value="<c:out value="${itemInfo.itemPrice}"/>"> <b> 원</b></td>
							</tr>
						</tbody>
					</table>
					<div class="add_btn">
						<input type="button" id="itemDelete" name="itemDelete" value="삭제">
						<input type="button" id="itemModify" name="itemModify" value="등록">
						<input type="button" id="itemCancle" name="itemCancle" value="취소"
						onClick="location.href='/bidangol/admin/adminItem'">
					</div>
				</form>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	
</body>
</html>