<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>비단골떡방앗간 온라인몰</title>
<link rel="shortcut icon" href="#" />

<!-- css 설정 -->
<link rel="stylesheet" href="/bidangol/css/include.css">

<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Gothic+A1&display=swap"
	rel="stylesheet">

<!-- font awesome -->
<script src="https://kit.fontawesome.com/bfdc62a914.js"
	crossorigin="anonymous"></script>

<!-- jquery -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    var cartIcon = document.querySelector(".cartIcon");

    if (cartIcon) {
        cartIcon.addEventListener("click", function() {
            alert("장바구니를 이용하려면 로그인이 필요합니다.");
            window.location.href = "/bidangol/login";
        });
    }
});

</script>
</head>
<body>
	<div class="mainLogo">
		<h1>
			<a href="/bidangol/home">비단골떡방앗간</a>
		</h1>
	</div>
	<div class="mainMenu">
		<div class="wrap">
			<ul class="menu">
				<li><a href="/bidangol/category/01">베스트상품</a></li>
				<li><a href="/bidangol/category/02">찹쌀떡</a></li>
				<li><a href="/bidangol/category/03">멥쌀떡</a></li>
				<li><a href="/bidangol/category/04">떡케이크</a></li>
			</ul>
			<ul class="login">
				<c:if test="${user == null}">
					<li><a href="/bidangol/login">로그인</a></li>
					<li><a href="/bidangol/signUp">회원가입</a></li>
					<li class="cartIcon"><a href="/bidangol/login"><i
							class="fa-solid fa-cart-shopping"></i></a></li>
				</c:if>
				<c:if test="${user != null && user.role == 'USER'}">
					<li><a href="/bidangol/logout">로그아웃</a></li>
					<li><a href="/bidangol/myPage">마이페이지</a></li>
					<li><a href="/bidangol/cart/cartPage"><i
							class="fa-solid fa-cart-shopping"></i></a></li>
				</c:if>
				<c:if test="${user != null && user.role == 'ADMIN'}">
						<li><a href="/bidangol/logout">로그아웃</a></li>
						<li><a href="/bidangol/admin">관리자페이지</a></li>
						<li></li>
				</c:if>

			</ul>
		</div>
	</div>

</body>
</html>