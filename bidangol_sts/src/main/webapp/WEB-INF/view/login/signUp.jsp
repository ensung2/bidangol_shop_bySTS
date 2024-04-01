<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/bidangol/css/login.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/bidangol/js/daum_postcode.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />


	<!-- contents -->
	<div class="signUp">
		<div class="wrap">
			<section class="lgTitle">
				<h3>회원가입</h3>
			</section>
			<section class="suInfo">
				<form name="singUp_form">
					<table>
						<tbody>
							<tr>
								<th>아이디</th>
								<td><input type="text" name="id" id="id" min="3" maxlength="15" style="width:150px"><span>(영문소문자/숫자, 4~15자)</span></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email" name="email" id="email" style="width:150px"></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="password" id="password" style="width:150px"><span>(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~15자)</span></td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td><input type="password" name="password2" id="password2" style="width:150px"></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="name" id="name" style="width:100px"></td>
							</tr>
							<tr class="address">
								<th>주소</th>
								<td style="padding:5px">
									<input type="text" name="postcode" id="postcode" style="width:60px">
									<input type="button" value="우편번호검색" onclick="checkPost()" style="font-size:13px"><br>
									<input type="text" name="address1" id="address1" style="width:300px"><span>기본주소</span><br>
									<input type="text" name="address2" id="address2" style="width:300px"><span>나머지주소(선택)</span><br>
								</td>
							</tr>
							<tr class="phone">
								<th>휴대전화</th>
								<td>
									<select id="phone" name="phone" style="padding:5px">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
									-
									<input type="text" name="phone2" id="phone2" maxlength="4" style="width:50px">
									-
									<input type="text" name="phone3" id="phone3" maxlength="4" style="width:50px">
								</td>
							</tr>
						</tbody>
					</table>

					<div class="login_btn" style="padding-top:30px">
						<input type="button" class="signUp_btn" id="signUp_btn" value="회원가입">
					</div>
				</form>
			</section>
		</div>
	</div>




	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	<script src="/bidangol/js/login.js"></script>

</body>
</html>