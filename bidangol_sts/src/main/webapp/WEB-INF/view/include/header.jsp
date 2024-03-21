<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
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
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Gothic+A1&display=swap" rel="stylesheet">

<!-- font awesome -->
<script src="https://kit.fontawesome.com/bfdc62a914.js" crossorigin="anonymous"></script>

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".mainMenu a").on("click", function () {
		  $(".mainMenu a").css('color', 'inherit');
		  $(this).css('color', '#ffffff');
		  
		});
})
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
				<li><a href="/bidangol/login">로그인</a></li>
				<li><a href="/bidangol/signUp">회원가입</a></li>
				<li><a href="/bidangol/cart"><i class="fa-solid fa-cart-shopping"></i></a></li>
			</ul>
		</div>
	</div>

</body>
</html>