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
			<section class="userInfo">
					<table>
						<tbody>
							<tr>
								<th>아이디</th>
								<td>{user.userid}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>{user.userEmil}</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>{user.userName}</td>
							</tr>
							<tr>
								<th>주소</th>
								<td style="padding: 5px 0">
									<span>{user.postCode}</span><br>
									<span>{user.address1}</span><br>
									<span>{user.address2}</span></td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td>{user.phone}</td>
							</tr>
						</tbody>
					</table>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>