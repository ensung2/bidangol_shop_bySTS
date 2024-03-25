<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/bidangol/css/admin.css">
</head>
<body>
	<!-- content -->
	<div class="admin">
		<div class="wrap">
			<section class="adminTitle">
				<h3>관리자 페이지</h3>
			</section>
			<section class="adminInfo">
				<div>안녕하세요 <b>{admin.name}님</b></div>
				<div>
					<ul>
						<li><a href="/bidangol/admin/adminUser">회원관리</a></li>
						<li>│</li>
						<li><a href="/bidangol/admin/adminOrder">주문관리</a></li>
						<li>│</li>
						<li><a href="/bidangol/admin/adminItem">상품관리</a></li>
					</ul>
				</div>
			</section>
		</div>
	</div>
</body>
</html>