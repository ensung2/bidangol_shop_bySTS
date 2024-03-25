<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<!-- admin menu -->
	<jsp:include page="/WEB-INF/view/include/admin.jsp" />

	<!-- contents -->
	<div class="adminUser">
		<div class="wrap">
			<section class="auTitle">
				<h3>회원관리</h3>
			</section>
			<section class="auInfo">
				<table>
					<thead>
						<tr>
							<td>회원번호</td>
							<td>아이디</td>
							<td>이름</td>
							<td>가입일자</td>
						</tr>
					</thead>
				</table>
			</section>
			<section class="auList">
				<table style="border-collapse: collapse;">
					<tbody>
						<tr onclick="location.href='/bidangol/admin/userInfo'">
							<td class="userNum">1</td>
							<td class="userId">ensung</td>
							<td class="userName">이은성</td>
							<td class="signUpDate">2024-03-25</td>
						</tr>
						<tr onclick="location.href='/bidangol/admin/userInfo'">
							<td class="userNum">2</td>
							<td class="userId">ensung</td>
							<td class="userName">이은성</td>
							<td class="signUpDate">2024-03-25</td>
						</tr>
						<tr onclick="location.href='/bidangol/admin/userInfo'">
							<td class="userNum">3</td>
							<td class="userId">ensung</td>
							<td class="userName">이은성</td>
							<td class="signUpDate">2024-03-25</td>
						</tr>
						<tr onclick="location.href='/bidangol/admin/userInfo'">
							<td class="userNum">4</td>
							<td class="userId">ensung</td>
							<td class="userName">이은성</td>
							<td class="signUpDate">2024-03-25</td>
						</tr>
						<tr onclick="location.href='/bidangol/admin/userInfo'">
							<td class="userNum">5</td>
							<td class="userId">ensung</td>
							<td class="userName">이은성</td>
							<td class="signUpDate">2024-03-25</td>
						</tr>
						
					</tbody>
				</table>
			</section>
			<section class="adminPaging">
				<div>-- 1 2 3 4 5 6 --</div>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>