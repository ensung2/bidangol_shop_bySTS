<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/bidangol/css/login.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />


	<!-- contents -->
	<div class="loginPage">
		<div class="wrap">
			<section class="lgTitle">
				<h3>로그인</h3>
			</section>
			<section class="lgInfo">
				<form name="login_form" method="post">
					<div class="idPw">
						<input type="text" name="id" id="id" placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'" required><br>
						<input type="password" name="password" id="password" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'" required>
					</div>
					<div class="idSave">
					  <input type="checkbox" id="idSaveCheck"><label for="remember">아이디 저장</label>
					</div>
					<div class="login_btn">
						<input type="button" id="sign_in_btn" class="sign_in_btn" value="로그인"><br>
						<input type="button" class="sign_up_btn" value="회원가입">
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