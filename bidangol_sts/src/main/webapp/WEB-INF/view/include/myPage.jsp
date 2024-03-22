<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/bidangol/css/myPage.css">
</head>
<body>
	<!-- content -->
	<div class="myPage">
		<div class="wrap">
			<section class="myTitle">
				<h3>마이페이지</h3>
			</section>
			<section class="myInfo">
				<div>안녕하세요 <b>{user.name}님</b></div>
				<div>
					<ul>
						<li><a href="/bidangol/myPage/order">주문/배송</a></li>
						<li>│</li>
						<li><a href="/bidangol/myPage/userInfo">회원 정보</a></li>
					</ul>
				</div>
			</section>
		</div>
	</div>
</body>
</html>