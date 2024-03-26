<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/bidangol/js/myPage.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<!-- mypage menu -->
	<jsp:include page="/WEB-INF/view/include/myPage.jsp" />

	<!-- contents -->
	<div class="userInfo">
		<div class="wrap">
			<section class="userTitle">
				<h3>회원정보</h3>
			</section>
			<section class="userInfo_">
				<form name="user_form" action="#" method="post">
					<table>
						<tbody>
							<tr>
								<th>아이디</th>
								<td><input type="text" name="id" id="userId" min="3"
									maxlength="15"
									style="width: 150px; border: none; outline: none"
									readonly="readonly" value="{userId}"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email" name="email" id="userEmail"
									style="width: 150px" value="{userEmail}"></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="password" id="password"
									style="width: 150px"><span>(영문 대소문자/숫자/특수문자 중
										2가지 이상 조합, 8자~15자)</span></td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td><input type="password" name="password2" id="password2"
									style="width: 150px"></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="userName" id="userName"
									style="width: 100px" value="{userName}"></td>
							</tr>
							<tr class="address">
								<th>주소</th>
								<td style="padding: 5px 0">
								<input type="text"
									name="postCode" id="postCode" style="width: 60px" value="{postCode}"> <input
									type="button" value="우편번호검색" onclick="checkPost()"
									style="font-size: 13px" ><br>
									
									<input type="text"
									name="address1" id="address1" style="width: 300px" value="{address1}"><span>기본주소</span><br>
									<input type="text" name="address2" id="address2"
									style="width: 300px" value="{address2}"><span>나머지주소(선택)</span><br></td>
							</tr>
							<tr class="phone">
								<th>휴대전화</th>
								<td><select id="phone1" name="phone[]"
									style="padding: 5px; border: 1px solid #cccccc;">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
								</select> - <input type="text" name="phone2" id="phone2" maxlength="4"
									style="width: 50px" value="{phone2}"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
									- <input type="text" name="phone3" id="phone3" maxlength="4"
									style="width: 50px" value="{phone2}"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"></td>
							</tr>
						</tbody>
					</table>

					<div class="user_btn">
						<div>
							<input type="button" class="updateUser" value="회원정보 수정">
							<input type="button" class="cancleUser" value="취소"
								onClick="location.href='/bidangol/myPage/order'">
						</div>
						<div>
							<input type="button" class="deleteUser" value="회원탈퇴" onclick="openPopup()"
							style="border: 1px solid #cccccc;">
						</div>
					</div>

					<div id="userDelete">
						<div class="wrap">
							<div class="deleteBox">
								<p>&nbsp</p>
								<h3>회원탈퇴</h3>
								<p style="; cursor: " onclick="closePopup()"><i class="fa-solid fa-square-xmark"></i></p>
							</div>
							<div class="deleteCheck">
								<p>회원탈퇴시 비밀번호를 입력하신 후 탈퇴 버튼을 클릭해 주세요.<br>
									탈퇴시 모든 정보가 삭제되며, <b>한 번 삭제된 정보는 복구가 불가능합니다.</b></p>
								<div class="pwCheck"><b>비밀번호 확인 : </b><input type="password" id="deletePw" name="deletePw" maxlength="15"></div>
								<div class="delete_btn">
									<input type="button" id="deleteEnd" name="deleteEnd" value="탈퇴">
									<input type="button" id="deleteCancle" name="deleteCancle" value="취소" onclick="closePopup()">
								</div>
							</div>
						</div>
					</div>
				</form>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>